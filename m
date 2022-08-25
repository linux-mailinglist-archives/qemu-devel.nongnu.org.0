Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8785A155A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:14:32 +0200 (CEST)
Received: from localhost ([::1]:60968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oREYx-0006EI-SC
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERs-0003yB-LP
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:13 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERq-0002M4-IO
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:12 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n17so392038wrm.4
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=DWNuvqbFBvUjcGdjxo+MqgXtO5vi7v0ejT71g3xQKIg=;
 b=qi9mXkoH3wrwJjibelE3Xeo9GegiFCuONmK4CnVZzcBg7iM9+rq6hKJYoRMB9Soy30
 fzrp4a2401scBjSFf8qfcbIxy3LYJv9E86a4rLoyqHNm0q2XrVBpm4Ychc/Jy/xN3k+F
 CyapDHLwsVOXSAop+1K2Bi/QRbsagk0hCdiQ1MIo10GU8zV4Tdx6CeOhcwBCpzLkYXD5
 389tRNAeAJiKyJZPHrxEeAux4NxwMuCnG18/JoxVHfyTYYtm8CLb0yXLvLZ6y8JQWgvn
 39rEpDzi58zSRyw5FTNoMen7cwF4nS8tRCy5Oqhvp591N4cDuGPP9fO83zqwNL/cImSf
 jqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=DWNuvqbFBvUjcGdjxo+MqgXtO5vi7v0ejT71g3xQKIg=;
 b=FRSkl3Xw88B3rq9wzYHjTsJw/gGTKe8zrbV80f9duhJSISulX+YvbhkCEmWt67fzwY
 axLcbE1bOGrS4EH194OVdKS4cHb8vtIH9+gm6BpzzNSlnvuU+6JmTbQ9CGvdjzP32kPq
 TzZHMDHQIN767TLnKbHLl7rI1l/EF718f7KHLlFzDO6r3OhqE7tcFTkp6x6xWWFWZaL2
 LnZLDUlR41NVms6NZ+PxAGCPbwHZcIpU+0PWZGzr7qoS+lkWUvXZHKNkWkbVFy1iJaHG
 puBgueDpa+Npi7oAspGmG4/f1BKK0F+pZiY/fvdWAvLiGr6irT3W9v2KB0ZV9DGSxI3+
 1apQ==
X-Gm-Message-State: ACgBeo2SE4yptFDLsFeRvxGAKDRv4hxYe1WHJkWbFLubgJly2efCYYUV
 eF14FnloB3JzJsd1j83DE4NzAx/OwssBRg==
X-Google-Smtp-Source: AA6agR78G9mpUf/QfHUMc1eqKN7+GNNlpPiIzxBXsa8kzcTsZbuhFCduRtCfcTYdGY6eoAaIPUSMUQ==
X-Received: by 2002:a5d:6485:0:b0:225:5caf:2e44 with SMTP id
 o5-20020a5d6485000000b002255caf2e44mr2556391wri.365.1661440028722; 
 Thu, 25 Aug 2022 08:07:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bo20-20020a056000069400b0022585f6679dsm1064638wrb.106.2022.08.25.08.07.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 08:07:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] configure: Add missing quoting for some easy cases
Date: Thu, 25 Aug 2022 16:06:59 +0100
Message-Id: <20220825150703.4074125-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825150703.4074125-1-peter.maydell@linaro.org>
References: <20220825150703.4074125-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit adds quotes in some places which:
 * are spotted by shellcheck
 * are obviously incorrect
 * are easy to fix just by adding the quotes

It doesn't attempt fix all of the places shellcheck finds errors,
or even all the ones which are easy to fix. It's just a random
sampling which is hopefully easy to review and which cuts
down the size of the problem for next time somebody wants to
try to look at shellcheck errors.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 64 +++++++++++++++++++++++++++----------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/configure b/configure
index b1acaca6dd2..894642554c3 100755
--- a/configure
+++ b/configure
@@ -57,7 +57,7 @@ GNUmakefile: ;
 
 EOF
     cd build
-    exec $source_path/configure "$@"
+    exec "$source_path/configure" "$@"
 fi
 
 # Temporary directory used for files created while
@@ -691,7 +691,7 @@ meson_option_build_array() {
   printf ']\n'
 }
 
-. $source_path/scripts/meson-buildoptions.sh
+. "$source_path/scripts/meson-buildoptions.sh"
 
 meson_options=
 meson_option_add() {
@@ -711,7 +711,7 @@ for opt do
   case "$opt" in
   --help|-h) show_help=yes
   ;;
-  --version|-V) exec cat $source_path/VERSION
+  --version|-V) exec cat "$source_path/VERSION"
   ;;
   --prefix=*) prefix="$optarg"
   ;;
@@ -985,7 +985,7 @@ default_target_list=""
 mak_wilds=""
 
 if [ "$linux_user" != no ]; then
-    if [ "$targetos" = linux ] && [ -d $source_path/linux-user/include/host/$cpu ]; then
+    if [ "$targetos" = linux ] && [ -d "$source_path/linux-user/include/host/$cpu" ]; then
         linux_user=yes
     elif [ "$linux_user" = yes ]; then
         error_exit "linux-user not supported on this architecture"
@@ -995,7 +995,7 @@ if [ "$bsd_user" != no ]; then
     if [ "$bsd_user" = "" ]; then
         test $targetos = freebsd && bsd_user=yes
     fi
-    if [ "$bsd_user" = yes ] && ! [ -d $source_path/bsd-user/$targetos ]; then
+    if [ "$bsd_user" = yes ] && ! [ -d "$source_path/bsd-user/$targetos" ]; then
         error_exit "bsd-user not supported on this host OS"
     fi
 fi
@@ -1117,7 +1117,7 @@ python="$python -B"
 if test -z "$meson"; then
     if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.59.3; then
         meson=meson
-    elif test $git_submodules_action != 'ignore' ; then
+    elif test "$git_submodules_action" != 'ignore' ; then
         meson=git
     elif test -e "${source_path}/meson/meson.py" ; then
         meson=internal
@@ -1840,7 +1840,7 @@ esac
 container="no"
 if test $use_containers = "yes"; then
     if has "docker" || has "podman"; then
-        container=$($python $source_path/tests/docker/docker.py probe)
+        container=$($python "$source_path"/tests/docker/docker.py probe)
     fi
 fi
 
@@ -2290,7 +2290,7 @@ if test "$QEMU_GA_DISTRO" = ""; then
   QEMU_GA_DISTRO=Linux
 fi
 if test "$QEMU_GA_VERSION" = ""; then
-    QEMU_GA_VERSION=$(cat $source_path/VERSION)
+    QEMU_GA_VERSION=$(cat "$source_path"/VERSION)
 fi
 
 
@@ -2539,7 +2539,7 @@ fi
 for target in $target_list; do
     target_dir="$target"
     target_name=$(echo $target | cut -d '-' -f 1)$EXESUF
-    mkdir -p $target_dir
+    mkdir -p "$target_dir"
     case $target in
         *-user) symlink "../qemu-$target_name" "$target_dir/qemu-$target_name" ;;
         *) symlink "../qemu-system-$target_name" "$target_dir/qemu-system-$target_name" ;;
@@ -2574,14 +2574,14 @@ for target in $target_list; do
   config_target_mak=tests/tcg/config-$target.mak
 
   echo "# Automatically generated by configure - do not modify" > $config_target_mak
-  echo "TARGET_NAME=$arch" >> $config_target_mak
+  echo "TARGET_NAME=$arch" >> "$config_target_mak"
   case $target in
     xtensa*-linux-user)
       # the toolchain is not complete with headers, only build softmmu tests
       continue
       ;;
     *-softmmu)
-      test -f $source_path/tests/tcg/$arch/Makefile.softmmu-target || continue
+      test -f "$source_path/tests/tcg/$arch/Makefile.softmmu-target" || continue
       qemu="qemu-system-$arch"
       ;;
     *-linux-user|*-bsd-user)
@@ -2596,73 +2596,73 @@ for target in $target_list; do
       # compilers is a requirememt for adding a new test that needs a
       # compiler feature.
 
-      echo "BUILD_STATIC=$build_static" >> $config_target_mak
-      write_target_makefile >> $config_target_mak
+      echo "BUILD_STATIC=$build_static" >> "$config_target_mak"
+      write_target_makefile >> "$config_target_mak"
       case $target in
           aarch64-*)
               if do_compiler "$target_cc" $target_cflags \
                              -march=armv8.1-a+sve -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
+                  echo "CROSS_CC_HAS_SVE=y" >> "$config_target_mak"
               fi
               if do_compiler "$target_cc" $target_cflags \
                              -march=armv8.1-a+sve2 -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_SVE2=y" >> $config_target_mak
+                  echo "CROSS_CC_HAS_SVE2=y" >> "$config_target_mak"
               fi
               if do_compiler "$target_cc" $target_cflags \
                              -march=armv8.3-a -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
+                  echo "CROSS_CC_HAS_ARMV8_3=y" >> "$config_target_mak"
               fi
               if do_compiler "$target_cc" $target_cflags \
                              -mbranch-protection=standard -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
+                  echo "CROSS_CC_HAS_ARMV8_BTI=y" >> "$config_target_mak"
               fi
               if do_compiler "$target_cc" $target_cflags \
                              -march=armv8.5-a+memtag -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
+                  echo "CROSS_CC_HAS_ARMV8_MTE=y" >> "$config_target_mak"
               fi
               ;;
           ppc*)
               if do_compiler "$target_cc" $target_cflags \
                              -mpower8-vector -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
+                  echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> "$config_target_mak"
               fi
               if do_compiler "$target_cc" $target_cflags \
                              -mpower10 -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
+                  echo "CROSS_CC_HAS_POWER10=y" >> "$config_target_mak"
               fi
               ;;
           i386-linux-user)
               if do_compiler "$target_cc" $target_cflags \
                              -Werror -fno-pie -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
+                  echo "CROSS_CC_HAS_I386_NOPIE=y" >> "$config_target_mak"
               fi
               ;;
       esac
   elif test -n "$container_image"; then
       echo "build-tcg-tests-$target: docker-image-$container_image" >> $makefile
-      echo "BUILD_STATIC=y" >> $config_target_mak
-      write_container_target_makefile >> $config_target_mak
+      echo "BUILD_STATIC=y" >> "$config_target_mak"
+      write_container_target_makefile >> "$config_target_mak"
       case $target in
           aarch64-*)
-              echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
-              echo "CROSS_CC_HAS_SVE2=y" >> $config_target_mak
-              echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
-              echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
-              echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
+              echo "CROSS_CC_HAS_SVE=y" >> "$config_target_mak"
+              echo "CROSS_CC_HAS_SVE2=y" >> "$config_target_mak"
+              echo "CROSS_CC_HAS_ARMV8_3=y" >> "$config_target_mak"
+              echo "CROSS_CC_HAS_ARMV8_BTI=y" >> "$config_target_mak"
+              echo "CROSS_CC_HAS_ARMV8_MTE=y" >> "$config_target_mak"
               ;;
           ppc*)
-              echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
-              echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
+              echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> "$config_target_mak"
+              echo "CROSS_CC_HAS_POWER10=y" >> "$config_target_mak"
               ;;
           i386-linux-user)
-              echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
+              echo "CROSS_CC_HAS_I386_NOPIE=y" >> "$config_target_mak"
               ;;
       esac
       got_cross_cc=yes
   fi
   if test $got_cross_cc = yes; then
       mkdir -p tests/tcg/$target
-      echo "QEMU=$PWD/$qemu" >> $config_target_mak
+      echo "QEMU=$PWD/$qemu" >> "$config_target_mak"
       echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
       tcg_tests_targets="$tcg_tests_targets $target"
   fi
-- 
2.25.1


