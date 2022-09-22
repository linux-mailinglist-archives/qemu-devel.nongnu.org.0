Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E3F5E6A7A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:14:41 +0200 (CEST)
Received: from localhost ([::1]:41316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQie-00013A-2o
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBK-0002Fy-P9
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:14 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBB-0005Pe-VQ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:08 -0400
Received: by mail-wr1-x436.google.com with SMTP id n10so16378625wrw.12
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=QdnrSN8AocizR5yIDpAyLK6s+nPqJhACaI+pjubOY7c=;
 b=c3QrRVDIqa8eYsv3rHPNSqV1uhhHJQiINozolajwfaHbEjB5F3zn5wSPjT3JmpjANl
 K43lfQGPRPZYRsg8z8mkdXIX+ASv+acvhz/+i4dl/1M9X4hLtZic6Fj1vSrA9MRnCP5f
 OITvVhPZC/7YKQHoiMCHTLBcUjfd0Zh79rAxM0/CYrWhEop0v0bWjtBPW3KYjYfocONZ
 mAITQq+ThdUBoOu/lgQXRrVWM3xBUEQxoNl8FKr8R9Cxre4sIQcW1l5yPu865NrXSZXW
 tiOCKM/7LgMSYMnlS0zllo1P5SMeI+sY6PSj4/XA68nXNNW7RubBKvpgMl8hAXh0LSdq
 s1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QdnrSN8AocizR5yIDpAyLK6s+nPqJhACaI+pjubOY7c=;
 b=s2RQQOYZUDM0tOdPMxuA27c01gU6VwzEkgLX+aGYLk3YZ/0qQX0G6wtbRePSE2Zqu3
 l3LA9pQlJ2whGAaTgSCTDSBzrUyJF9BYboL7ocB4a1c2hZ5MUF9VNhpPQDEvLs65upYH
 uGuwWD/XmyjTdXe70v4cXtzpMvpBLlYxMOAJD3xiJvWQ7LWXxrY7QBKKq+eSY1oG1jp8
 ool35N/xabZjfQvk9TsBYsyjfxYoQHbX967CIHvI8HAFgEbusiC0nY7m2SA8BYjTZWvJ
 4wMPSnej4e7BuwuSAlKbc20t1zu0VT161kfconLUft6unPhWDVjZla6unq+WPoPmCcDk
 pmrw==
X-Gm-Message-State: ACrzQf2Mz+8F1ZEG2/EvRM+Vy8krhWEjm0b1jd52nKVOe40Rjyh43t5d
 bekGYDn56DoFHe810f+trDYVSEyBLB5xwg==
X-Google-Smtp-Source: AMsMyM6Bl6M6YDrnpvNYf7Yn9uJ+cKs4VhZNBFJAP1x91cY3Zk0GiYE/e8+1/Iwd7ezgr/zvoN5y0Q==
X-Received: by 2002:a5d:5b19:0:b0:22b:237c:3de8 with SMTP id
 bx25-20020a5d5b19000000b0022b237c3de8mr2542750wrb.285.1663864560781; 
 Thu, 22 Sep 2022 09:36:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.36.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:36:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/39] configure: Add missing quoting for some easy cases
Date: Thu, 22 Sep 2022 17:35:32 +0100
Message-Id: <20220922163536.1096175-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220825150703.4074125-4-peter.maydell@linaro.org
---
 configure | 64 +++++++++++++++++++++++++++----------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/configure b/configure
index e42d43d6a50..86cc6259181 100755
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
@@ -1834,7 +1834,7 @@ esac
 container="no"
 if test $use_containers = "yes"; then
     if has "docker" || has "podman"; then
-        container=$($python $source_path/tests/docker/docker.py probe)
+        container=$($python "$source_path"/tests/docker/docker.py probe)
     fi
 fi
 
@@ -2284,7 +2284,7 @@ if test "$QEMU_GA_DISTRO" = ""; then
   QEMU_GA_DISTRO=Linux
 fi
 if test "$QEMU_GA_VERSION" = ""; then
-    QEMU_GA_VERSION=$(cat $source_path/VERSION)
+    QEMU_GA_VERSION=$(cat "$source_path"/VERSION)
 fi
 
 
@@ -2533,7 +2533,7 @@ fi
 for target in $target_list; do
     target_dir="$target"
     target_name=$(echo $target | cut -d '-' -f 1)$EXESUF
-    mkdir -p $target_dir
+    mkdir -p "$target_dir"
     case $target in
         *-user) symlink "../qemu-$target_name" "$target_dir/qemu-$target_name" ;;
         *) symlink "../qemu-system-$target_name" "$target_dir/qemu-system-$target_name" ;;
@@ -2568,14 +2568,14 @@ for target in $target_list; do
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
@@ -2590,73 +2590,73 @@ for target in $target_list; do
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


