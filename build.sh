#!/usr/bin/env bash
#
# Copyright (C) 2019 @alanndz (Telegram and Github)
# SPDX-License-Identifier: GPL-3.0-or-later

CONF="${PWD}/config"
FOLDER=$(cat "${CONF}/folder")
PATCHES="${PWD}/patches"

export RELEASE_STATUS=$(cat "${CONF}/release")
export RELEASE_VERSION=$(cat "${CONF}/$FOLDER/version")
export KERNEL_NAME="megalith.StrmbreakrIV.XIX"
export CODENAME=$(cat "${CONF}/$FOLDER/codename")-4.19
export KERNEL_TYPE=$(cat "${CONF}/$FOLDER/type")
export PHONE="Redmi Note 7"
export DEVICES="lavender"
export CONFIG_FILE="lavender_defconfig"
export COMPILER_IS_CLANG=true
export USECLANG="proton"
export USEGCC=93
export DEVELOPER="xyzuan@xyzscape.co"
export HOST="xyzscape.co"
export AK_BRANCH="4.19"
export JOBS=8
BRANCH=$(cat "${CONF}/$FOLDER/branch")
unset token
GIT_TOKEN=$(openssl enc -base64 -d <<< ${git_token})
git clone --depth=1 -b alpha https://github.com/xyz-prjkt/kernel_xiaomi_lavender_4.19 megalith

cd megalith

wget --output-document=.kernel.sh https://raw.githubusercontent.com/xyz-prjkt/xyz_scripts/xyzuan/kernel.sh

chmod +x .kernel.sh
bash ./.kernel.sh

