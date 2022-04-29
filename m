Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1B151507A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 18:11:25 +0200 (CEST)
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkTDI-0000ew-NQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 12:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSTA-0002SN-4g
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:44 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkST6-0006Bb-U9
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:43 -0400
Received: by mail-ej1-x62c.google.com with SMTP id k23so16121200ejd.3
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=91hie4DGY5PF2mmBBVjDRzJ96G5yq1KJLi/xI/cOLd0=;
 b=QXkrhsEyxheukVWFVNeqyz4BH346AKFFFgCMVSLSVWbXkE6T7aiPRzc4Kdc0J/CYB8
 Ry+wpQCq/7a4/wRl1fnUkEmABo9iczr/1U+NNF5ejTc1fL8cNRbtoz82OUDZ+YBhCsg1
 hMYXv/QiUFEBGVhVZYcUNQa9yjCznHgJsEGQFemWNIWRWIWm27GYEkgIjHXVQYgpbhAR
 S+UFahlTj+Ua8+ZmMdkKTiWdnBcC9HgF/atxNdsDHr8ivF9MiJM/fiQLJBY50it9EOXL
 KE0pTydcNcHdWer++zAJLLAap2MpJWxl0Ge374JX30xkWx4ggYPxQlA85dCmfMFDviy7
 qP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=91hie4DGY5PF2mmBBVjDRzJ96G5yq1KJLi/xI/cOLd0=;
 b=b/F9uXrZF43rUfCCSmedozSOobSY8dh/T7OHleWQF1rsChpVyfj1K7E4W1iZ3o0Oa6
 ETumT/Vy4mjJM/8ESacfj1vX+OubAhz0V+fAbT0bHlsN/w7k8rlqXEWQxjq36bXPxAwZ
 KGssOXu5TZoTIxscl1gYWmJGj3O2f7H7FsyOoiAXC9aealFrQXwo3mjIsICKkg8vjveK
 ZFcnQnp6lkNp1mkgDCOSk1HSvRtZOCRayNQwNO03AebnpK7dh8zVPYYsr4zgQtBP8Se2
 PLrMoGjK99oHFiQ6bfF4Ws6DBsrs4Itx+cQlwvxhsBnsQYUSktjMXiz7Zn015TL6V7CD
 MWnw==
X-Gm-Message-State: AOAM531AyYDNrJrlsdEc7KRJUpvW58ZNe5SSvdzd5tai0wSNaAc9TwOX
 N/JmfsJJotF3o/063oWYLvMeDpXWJgaWAw==
X-Google-Smtp-Source: ABdhPJy6djDvTTGd1VtVSw/R+6EUq6X+0HHTqxn+mONdfnsrOnnwaZo7mEVdgfLlAfldU8AZaMWX9g==
X-Received: by 2002:a17:907:2ce2:b0:6f3:e531:880a with SMTP id
 hz2-20020a1709072ce200b006f3e531880amr7009844ejc.43.1651245813438; 
 Fri, 29 Apr 2022 08:23:33 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/25] configure, meson: move vhost options to Meson
Date: Fri, 29 Apr 2022 17:23:11 +0200
Message-Id: <20220429152312.335715-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Finish the conversion by moving all the definitions and the constraint
checks to meson_options.txt and meson.build respectively.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 82 -----------------------------------
 meson.build                   | 33 +++++++++++---
 meson_options.txt             | 10 +++++
 scripts/meson-buildoptions.sh | 15 +++++++
 4 files changed, 51 insertions(+), 89 deletions(-)

diff --git a/configure b/configure
index 9a83d64c9d..e77b29b093 100755
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
@@ -527,7 +522,6 @@ haiku)
 ;;
 linux)
   linux="yes"
-  vhost_user=${default_feature:-yes}
 ;;
 esac
 
@@ -864,14 +858,6 @@ for opt do
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
@@ -883,18 +869,6 @@ for opt do
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
@@ -1093,11 +1067,6 @@ cat << EOF
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
@@ -1511,35 +1480,6 @@ else
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
 
@@ -2059,28 +1999,6 @@ if test "$modules" = "yes"; then
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
index 9486270e8a..f6ccc98b4f 100644
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
@@ -1711,6 +1723,13 @@ config_host_data.set('CONFIG_SNAPPY', snappy.found())
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
 config_host_data.set('CONFIG_PNG', png.found())
 config_host_data.set('CONFIG_VNC', vnc.found())
diff --git a/meson_options.txt b/meson_options.txt
index 35f5a72507..29c6b90cec 100644
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
index 4b0770a9e0..5d2172bfb4 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -154,8 +154,13 @@ meson_options_help() {
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
@@ -409,8 +414,18 @@ _meson_option_parse() {
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



