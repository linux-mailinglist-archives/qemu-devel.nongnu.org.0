Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1F8508CD0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:08:29 +0200 (CEST)
Received: from localhost ([::1]:47158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCsW-0002ba-4c
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCMF-0002Hv-AP
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:35:09 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCMD-0001EE-Am
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:35:07 -0400
Received: by mail-wr1-x434.google.com with SMTP id i20so2762416wrb.13
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YSYuTZG+yEFPvaSlzv/t+2s4oVasaVP1l7P3dJgKuZw=;
 b=qSh0/+0N8+38yyeKF2gcjGJPbE/hLYfU1xnckxzPaYfYx1vmAJ20oAxeGpxhP3KAtf
 0BTFdQBZsnlpG6DnBSb6WbbeixTvHqB4AwK6COCwEDnbPVf/7mJWQCm+6lihdBc/+7uU
 OMe3X04G1whDNHbNRGP2LVort+lAmO4NhuAfktnyb74Uy4fYGl2DGW9mgaRcedbMsr1v
 klUa0mA+OTWgubj56hPjKXgXTDYsAxYTUGSjadvszEbqUR2kDC5SyUdZg8dKPcdaKuU6
 7xzEwwJXZVJV5hXjlO+DfCQLLNtr+NKzzg6clcOsP0aqKEIesGZsLhqIM2wvzrgaAl0f
 ky2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YSYuTZG+yEFPvaSlzv/t+2s4oVasaVP1l7P3dJgKuZw=;
 b=4FHgtis9aZyOMxe1E1E+fHCWoTQou9PVkbnZjsqC0Fzeu7FfLf42CobOl8sndOBSTT
 nlpQstplf3sqLqwbOoudl6YWyoQ7RlHEu/v/38dSKFAFSJ2AXtMHiDxOJvhqmYFpP4gK
 9eJaIpf9l9AFgMlSzSiAlPfntXeMbaSGpjz3azN+je0wWxKl+3zQe81qpQ+1LPdcmpGW
 BParDp9IstVOGPbC0Y1QZQ14aUGHyXkX9dJ4gP/DBZTM8Odax92qXR/Xvg57gvmzHAD8
 MnyY1Cr83tLVh6DPBPnwTU63gNKnSz72skkH6zs7hoNOD2QYxzE9X0ZKVQLTosZ9mkP6
 uWjQ==
X-Gm-Message-State: AOAM530x/2vLzHWiITQuBiZ6l6wf1FNQ9oKRcxb/B9t9BlUxAkwmO7OE
 QJgKEB4uPtKHO2SyieGltWgRJ6yUpxKDLA==
X-Google-Smtp-Source: ABdhPJwOiZhv2Werrodu0jiDSY4IG3rskKFC5G+e1fJE6MfNqml5NlqFRHW/+YdrssEs2tiOXMoz1Q==
X-Received: by 2002:a05:6000:1e0e:b0:207:bb61:78d0 with SMTP id
 bj14-20020a0560001e0e00b00207bb6178d0mr16503209wrb.512.1650468904022; 
 Wed, 20 Apr 2022 08:35:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.35.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:35:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 34/34] configure, meson: move vhost options to Meson
Date: Wed, 20 Apr 2022 17:34:07 +0200
Message-Id: <20220420153407.73926-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Finish the conversion by moving all the definitions and the constraint
checks to meson_options.txt and meson.build respectively.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 82 -----------------------------------
 meson.build                   | 33 +++++++++++---
 meson_options.txt             | 10 +++++
 scripts/meson-buildoptions.sh | 15 +++++++
 4 files changed, 51 insertions(+), 89 deletions(-)

diff --git a/configure b/configure
index 3b38ff3c63..0cedfcf5a9 100755
--- a/configure
+++ b/configure
@@ -282,11 +282,6 @@ EXTRA_CXXFLAGS=""
 EXTRA_OBJCFLAGS=""
 EXTRA_LDFLAGS=""
 
-vhost_kernel="$default_feature"
-vhost_net="$default_feature"
-vhost_crypto="$default_feature"
-vhost_user="no"
-vhost_vdpa="$default_feature"
 debug_tcg="no"
 sanitizers="no"
 tsan="no"
@@ -526,7 +521,6 @@ haiku)
 ;;
 linux)
   linux="yes"
-  vhost_user=${default_feature:-yes}
 ;;
 esac
 
@@ -863,14 +857,6 @@ for opt do
   ;;
   --with-coroutine=*) coroutine="$optarg"
   ;;
-  --disable-vhost-net) vhost_net="no"
-  ;;
-  --enable-vhost-net) vhost_net="yes"
-  ;;
-  --disable-vhost-crypto) vhost_crypto="no"
-  ;;
-  --enable-vhost-crypto) vhost_crypto="yes"
-  ;;
   --disable-zlib-test)
   ;;
   --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
@@ -882,18 +868,6 @@ for opt do
   --enable-uuid|--disable-uuid)
       echo "$0: $opt is obsolete, UUID support is always built" >&2
   ;;
-  --disable-vhost-user) vhost_user="no"
-  ;;
-  --enable-vhost-user) vhost_user="yes"
-  ;;
-  --disable-vhost-vdpa) vhost_vdpa="no"
-  ;;
-  --enable-vhost-vdpa) vhost_vdpa="yes"
-  ;;
-  --disable-vhost-kernel) vhost_kernel="no"
-  ;;
-  --enable-vhost-kernel) vhost_kernel="yes"
-  ;;
   --disable-capstone) capstone="disabled"
   ;;
   --enable-capstone) capstone="enabled"
@@ -1092,11 +1066,6 @@ cat << EOF
   debug-info      debugging information
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
-  vhost-net       vhost-net kernel acceleration support
-  vhost-crypto    vhost-user-crypto backend support
-  vhost-kernel    vhost kernel backend support
-  vhost-user      vhost-user backend support
-  vhost-vdpa      vhost-vdpa kernel backend support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -1510,35 +1479,6 @@ else
     exit 1
 fi
 
-#########################################
-# vhost interdependencies and host support
-
-# vhost backends
-if test "$vhost_user" = "yes" && test "$mingw32" = "yes"; then
-  error_exit "vhost-user is not available on Windows"
-fi
-test "$vhost_vdpa" = "" && vhost_vdpa=$linux
-if test "$vhost_vdpa" = "yes" && test "$linux" != "yes"; then
-  error_exit "vhost-vdpa is only available on Linux"
-fi
-test "$vhost_kernel" = "" && vhost_kernel=$linux
-if test "$vhost_kernel" = "yes" && test "$linux" != "yes"; then
-  error_exit "vhost-kernel is only available on Linux"
-fi
-
-# vhost-user backends
-test "$vhost_crypto" = "" && vhost_crypto=$vhost_user
-if test "$vhost_crypto" = "yes" && test "$vhost_user" = "no"; then
-  error_exit "--enable-vhost-crypto requires --enable-vhost-user"
-fi
-
-# OR the vhost-kernel, vhost-vdpa and vhost-user values for simplicity
-if test "$vhost_net" = ""; then
-  test "$vhost_user" = "yes" && vhost_net=yes
-  test "$vhost_vdpa" = "yes" && vhost_net=yes
-  test "$vhost_kernel" = "yes" && vhost_net=yes
-fi
-
 ##########################################
 # pkg-config probe
 
@@ -2058,28 +1998,6 @@ if test "$modules" = "yes"; then
   echo "CONFIG_MODULES=y" >> $config_host_mak
 fi
 
-if test "$vhost_net" = "yes" ; then
-  echo "CONFIG_VHOST_NET=y" >> $config_host_mak
-fi
-if test "$vhost_user" = "yes" ; then
-  echo "CONFIG_VHOST_NET_USER=y" >> $config_host_mak
-fi
-if test "$vhost_vdpa" = "yes" ; then
-  echo "CONFIG_VHOST_NET_VDPA=y" >> $config_host_mak
-fi
-if test "$vhost_crypto" = "yes" ; then
-  echo "CONFIG_VHOST_CRYPTO=y" >> $config_host_mak
-fi
-if test "$vhost_kernel" = "yes" ; then
-  echo "CONFIG_VHOST_KERNEL=y" >> $config_host_mak
-fi
-if test "$vhost_user" = "yes" ; then
-  echo "CONFIG_VHOST_USER=y" >> $config_host_mak
-fi
-if test "$vhost_vdpa" = "yes" ; then
-  echo "CONFIG_VHOST_VDPA=y" >> $config_host_mak
-fi
-
 # XXX: suppress that
 if [ "$bsd" = "yes" ] ; then
   echo "CONFIG_BSD=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index e8446cf148..499082bf55 100644
--- a/meson.build
+++ b/meson.build
@@ -313,14 +313,26 @@ have_tpm = get_option('tpm') \
   .allowed()
 
 # vhost
-have_vhost_user = 'CONFIG_VHOST_USER' in config_host
-have_vhost_vdpa = 'CONFIG_VHOST_VDPA' in config_host
-have_vhost_kernel = 'CONFIG_VHOST_KERNEL' in config_host
-have_vhost_net_user = 'CONFIG_VHOST_NET_USER' in config_host
-have_vhost_net_vdpa = 'CONFIG_VHOST_NET_VDPA' in config_host
-have_vhost_net = 'CONFIG_VHOST_NET' in config_host
+have_vhost_user = get_option('vhost_user') \
+  .disable_auto_if(targetos != 'linux') \
+  .require(targetos != 'windows',
+           error_message: 'vhost-user is not available on Windows').allowed()
+have_vhost_vdpa = get_option('vhost_vdpa') \
+  .require(targetos == 'linux',
+           error_message: 'vhost-vdpa is only available on Linux').allowed()
+have_vhost_kernel = get_option('vhost_kernel') \
+  .require(targetos == 'linux',
+           error_message: 'vhost-kernel is only available on Linux').allowed()
+have_vhost_user_crypto = get_option('vhost_crypto') \
+  .require(have_vhost_user,
+           error_message: 'vhost-crypto requires vhost-user to be enabled').allowed()
+
 have_vhost = have_vhost_user or have_vhost_vdpa or have_vhost_kernel
-have_vhost_user_crypto = 'CONFIG_VHOST_CRYPTO' in config_host
+
+have_vhost_net_user = have_vhost_user and get_option('vhost_net').allowed()
+have_vhost_net_vdpa = have_vhost_vdpa and get_option('vhost_net').allowed()
+have_vhost_net_kernel = have_vhost_kernel and get_option('vhost_net').allowed()
+have_vhost_net = have_vhost_net_kernel or have_vhost_net_user or have_vhost_net_vdpa
 
 # Target-specific libraries and flags
 libm = cc.find_library('m', required: false)
@@ -1709,6 +1721,13 @@ config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_TPM', have_tpm)
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
+config_host_data.set('CONFIG_VHOST_NET', have_vhost_net)
+config_host_data.set('CONFIG_VHOST_NET_USER', have_vhost_net_user)
+config_host_data.set('CONFIG_VHOST_NET_VDPA', have_vhost_net_vdpa)
+config_host_data.set('CONFIG_VHOST_KERNEL', have_vhost_kernel)
+config_host_data.set('CONFIG_VHOST_USER', have_vhost_user)
+config_host_data.set('CONFIG_VHOST_CRYPTO', have_vhost_user_crypto)
+config_host_data.set('CONFIG_VHOST_VDPA', have_vhost_vdpa)
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
diff --git a/meson_options.txt b/meson_options.txt
index 8efd5f520c..24a2a593f0 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -235,6 +235,16 @@ option('oss', type: 'feature', value: 'auto',
 option('pa', type: 'feature', value: 'auto',
        description: 'PulseAudio sound support')
 
+option('vhost_kernel', type: 'feature', value: 'auto',
+       description: 'vhost kernel backend support')
+option('vhost_net', type: 'feature', value: 'auto',
+       description: 'vhost-net kernel acceleration support')
+option('vhost_user', type: 'feature', value: 'auto',
+       description: 'vhost-user backend support')
+option('vhost_crypto', type: 'feature', value: 'auto',
+       description: 'vhost-user crypto backend support')
+option('vhost_vdpa', type: 'feature', value: 'auto',
+       description: 'vhost-vdpa kernel backend support')
 option('vhost_user_blk_server', type: 'feature', value: 'auto',
        description: 'build vhost-user-blk server')
 option('virtfs', type: 'feature', value: 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 274639777e..28258e1478 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -153,8 +153,13 @@ meson_options_help() {
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
   printf "%s\n" '  vdi             vdi image format support'
+  printf "%s\n" '  vhost-crypto    vhost-user crypto backend support'
+  printf "%s\n" '  vhost-kernel    vhost kernel backend support'
+  printf "%s\n" '  vhost-net       vhost-net kernel acceleration support'
+  printf "%s\n" '  vhost-user      vhost-user backend support'
   printf "%s\n" '  vhost-user-blk-server'
   printf "%s\n" '                  build vhost-user-blk server'
+  printf "%s\n" '  vhost-vdpa      vhost-vdpa kernel backend support'
   printf "%s\n" '  virglrenderer   virgl rendering support'
   printf "%s\n" '  virtfs          virtio-9p support'
   printf "%s\n" '  virtiofsd       build virtiofs daemon (virtiofsd)'
@@ -407,8 +412,18 @@ _meson_option_parse() {
     --disable-vde) printf "%s" -Dvde=disabled ;;
     --enable-vdi) printf "%s" -Dvdi=enabled ;;
     --disable-vdi) printf "%s" -Dvdi=disabled ;;
+    --enable-vhost-crypto) printf "%s" -Dvhost_crypto=enabled ;;
+    --disable-vhost-crypto) printf "%s" -Dvhost_crypto=disabled ;;
+    --enable-vhost-kernel) printf "%s" -Dvhost_kernel=enabled ;;
+    --disable-vhost-kernel) printf "%s" -Dvhost_kernel=disabled ;;
+    --enable-vhost-net) printf "%s" -Dvhost_net=enabled ;;
+    --disable-vhost-net) printf "%s" -Dvhost_net=disabled ;;
+    --enable-vhost-user) printf "%s" -Dvhost_user=enabled ;;
+    --disable-vhost-user) printf "%s" -Dvhost_user=disabled ;;
     --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=enabled ;;
     --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=disabled ;;
+    --enable-vhost-vdpa) printf "%s" -Dvhost_vdpa=enabled ;;
+    --disable-vhost-vdpa) printf "%s" -Dvhost_vdpa=disabled ;;
     --enable-virglrenderer) printf "%s" -Dvirglrenderer=enabled ;;
     --disable-virglrenderer) printf "%s" -Dvirglrenderer=disabled ;;
     --enable-virtfs) printf "%s" -Dvirtfs=enabled ;;
-- 
2.35.1


