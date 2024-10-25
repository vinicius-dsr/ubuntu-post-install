#!/bin/bash

# Função para exibir cabeçalho
function header() {
    echo -e "\n==== $1 ====\n"
}

# Atualização do sistema
header "Atualizando o sistema"
sudo apt update && sudo apt upgrade -y

# Instalação do ubuntu-restricted-extras (para codecs e plugins adicionais)
header "Instalação do ubuntu-restricted-extras"
read -p "Deseja instalar o ubuntu-restricted-extras? (s/n): " install_restricted_extras
if [[ $install_restricted_extras =~ ^[Ss]$ ]]; then
    sudo apt install -y ubuntu-restricted-extras
fi

# Instalação do VLC
header "Instalação do VLC"
read -p "Deseja instalar o VLC? (s/n): " install_vlc
if [[ $install_vlc =~ ^[Ss]$ ]]; then
    sudo apt install -y vlc
fi

# Instalação do Google Chrome
header "Instalação do Google Chrome"
read -p "Deseja instalar o Google Chrome? (s/n): " install_chrome
if [[ $install_chrome =~ ^[Ss]$ ]]; then
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt update && sudo apt install -y google-chrome-stable
fi

# Instalação e configuração do Flatpak
header "Instalação e configuração do Flatpak"
read -p "Deseja instalar e configurar o Flatpak? (s/n): " install_flatpak
if [[ $install_flatpak =~ ^[Ss]$ ]]; then
    sudo apt install -y flatpak
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

# Instalação do Obsidian via Flatpak
header "Instalação do Obsidian via Flatpak"
read -p "Deseja instalar o Obsidian via Flatpak? (s/n): " install_obsidian
if [[ $install_obsidian =~ ^[Ss]$ ]]; then
    flatpak install flathub md.obsidian.Obsidian -y
fi



# Finalização
header "Instalação concluída!"
echo "O sistema foi atualizado e os pacotes selecionados foram instalados."
