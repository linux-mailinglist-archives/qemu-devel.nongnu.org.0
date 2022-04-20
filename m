Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCD6508C8F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:55:02 +0200 (CEST)
Received: from localhost ([::1]:43364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCfV-0005ev-8Y
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLY-0001Jf-Ie
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:24 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLV-0000uE-RX
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:23 -0400
Received: by mail-wr1-x434.google.com with SMTP id bv16so2766704wrb.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XhrdeiKj02c3gBYuRWsYQjOaWaBq0dPxvx1dOjZ3FZ8=;
 b=jHhgvZCW7SHH+Sdha8F/Sng3V7VZLxkxwovpVS2uh5byQX64Ax9vdqn4w6v6YXyIP3
 2Yi8UL60nKRGSDvPrVgx2GskNVd5Wwp3JTso6FugxBAcbH0gAqTA2yHxI0rsvL6edpon
 tmWhlOyWWXrHCl+SajY/CZkoW1+2ztBohOjYzKz4rlLhdke8brK01OJzjOPNV5XKbuoW
 9dEB+h6Zt3vTlfqoiqqxnQ/8Ztpv2zYmuNx8+I+85BR3OiJCTdXayDdbcj0Fea9FdghP
 ZNg8N50P/TOqSr8YxmJb0hnMo1C+/3exDcaEAKClpYwYgvl3x2NUsRaB1ewAmcEdLyOM
 erjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XhrdeiKj02c3gBYuRWsYQjOaWaBq0dPxvx1dOjZ3FZ8=;
 b=T2M+szd3YNYfAD4VDM4aPreNWSpBTBz/lMMqpt6/tLdkZJQvdoKR0Z9Um4xFG5XRSU
 mguuHqAIwcVShhLMTqpH2JAgfso3IbQZslEUpIVxY/OMnwwVrf3dwfLxbfilNjnQBt0y
 PWcuIWdZLvYZnN8OXb7rAmBZIW78V2hlbfmm64wMZAXkhHXdqfC6B4kZjqMJ3hMOgGRC
 CrsXbSJCX70TDPDU7mbwhhCnC8cxW7KRjflVxT48CyK7b16Hi0rc+Lf0nmFTdnYcY76B
 2XcDqrFGv1dOOSy+Hxr7CG6vl5iDyUHJBez+Ehaj/h8Bfb87kVItf/Muq57+y+brtpfE
 tOXg==
X-Gm-Message-State: AOAM530ggP3Z40EI3q4T6VwFuyEXYiGkODsdr2AWsau5XSrdHqc4LP1j
 x/B8tlyiz4grCBEbPD4xR9iO7kSztaB1cw==
X-Google-Smtp-Source: ABdhPJyL1sv4P+PmXy4poNO81HU228qVZ8uuEvmfYdE+EfQAUnaLFPowQDmfGVKVJlrNlDWV2IsgtA==
X-Received: by 2002:a5d:5847:0:b0:20a:ae08:8d42 with SMTP id
 i7-20020a5d5847000000b0020aae088d42mr3444625wrf.650.1650468860063; 
 Wed, 20 Apr 2022 08:34:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/34] configure, meson: move OpenGL check to meson
Date: Wed, 20 Apr 2022 17:33:40 +0200
Message-Id: <20220420153407.73926-8-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 40 -----------------------------------
 meson.build                   | 16 +++++++++-----
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 ui/meson.build                | 17 ++++++++-------
 5 files changed, 25 insertions(+), 53 deletions(-)

diff --git a/configure b/configure
index 07053e7b27..c9be6eb04d 100755
--- a/configure
+++ b/configure
@@ -321,7 +321,6 @@ bsd_user=""
 pkgversion=""
 pie=""
 trace_file="trace"
-opengl="$default_feature"
 coroutine=""
 tls_priority="NORMAL"
 plugins="$default_feature"
@@ -960,10 +959,6 @@ for opt do
   ;;
   --enable-vhost-user-fs) vhost_user_fs="yes"
   ;;
-  --disable-opengl) opengl="no"
-  ;;
-  --enable-opengl) opengl="yes"
-  ;;
   --disable-zlib-test)
   ;;
   --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
@@ -1258,7 +1253,6 @@ cat << EOF
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
   vhost-vdpa      vhost-vdpa kernel backend support
-  opengl          opengl support
   gio             libgio support
 
 NOTE: The object files are built at the place where configure is launched
@@ -2278,34 +2272,6 @@ case "$fdt" in
 esac
 
 ##########################################
-# opengl probe (for sdl2, gtk)
-
-if test "$opengl" != "no" ; then
-  epoxy=no
-  if $pkg_config epoxy; then
-    cat > $TMPC << EOF
-#include <epoxy/egl.h>
-int main(void) { return 0; }
-EOF
-    if compile_prog "" "" ; then
-      epoxy=yes
-    fi
-  fi
-
-  if test "$epoxy" = "yes" ; then
-    opengl_cflags="$($pkg_config --cflags epoxy)"
-    opengl_libs="$($pkg_config --libs epoxy)"
-    opengl=yes
-  else
-    if test "$opengl" = "yes" ; then
-      feature_not_found "opengl" "Please install epoxy with EGL"
-    fi
-    opengl_cflags=""
-    opengl_libs=""
-    opengl=no
-  fi
-fi
-
 # check for usbfs
 have_usbfs=no
 if test "$linux_user" = "yes"; then
@@ -2874,12 +2840,6 @@ if test "$vhost_user_fs" = "yes" ; then
   echo "CONFIG_VHOST_USER_FS=y" >> $config_host_mak
 fi
 
-if test "$opengl" = "yes" ; then
-  echo "CONFIG_OPENGL=y" >> $config_host_mak
-  echo "OPENGL_CFLAGS=$opengl_cflags" >> $config_host_mak
-  echo "OPENGL_LIBS=$opengl_libs" >> $config_host_mak
-fi
-
 # XXX: suppress that
 if [ "$bsd" = "yes" ] ; then
   echo "CONFIG_BSD=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index cf3b1b39cf..f53fd66716 100644
--- a/meson.build
+++ b/meson.build
@@ -1000,9 +1000,14 @@ if not get_option('coreaudio').auto() or (targetos == 'darwin' and have_system)
 endif
 
 opengl = not_found
-if 'CONFIG_OPENGL' in config_host
-  opengl = declare_dependency(compile_args: config_host['OPENGL_CFLAGS'].split(),
-                              link_args: config_host['OPENGL_LIBS'].split())
+if not get_option('opengl').auto() or have_system or have_vhost_user_gpu
+  epoxy = dependency('epoxy', method: 'pkg-config',
+                      required: get_option('opengl'), kwargs: static_kwargs)
+  if cc.has_header('epoxy/egl.h', dependencies: epoxy)
+    opengl = epoxy
+  elif get_option('opengl').enabled()
+    error('epoxy/egl.h not found')
+  endif
 endif
 gbm = not_found
 if (have_system or have_tools) and (virgl.found() or opengl.found())
@@ -1544,6 +1549,7 @@ config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
 config_host_data.set('CONFIG_NUMA', numa.found())
+config_host_data.set('CONFIG_OPENGL', opengl.found())
 config_host_data.set('CONFIG_PROFILER', get_option('profiler'))
 config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
@@ -2079,7 +2085,7 @@ host_kconfig = \
   (have_tpm ? ['CONFIG_TPM=y'] : []) + \
   (spice.found() ? ['CONFIG_SPICE=y'] : []) + \
   (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
-  ('CONFIG_OPENGL' in config_host ? ['CONFIG_OPENGL=y'] : []) + \
+  (opengl.found() ? ['CONFIG_OPENGL=y'] : []) + \
   (x11.found() ? ['CONFIG_X11=y'] : []) + \
   ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=y'] : []) + \
   ('CONFIG_VHOST_VDPA' in config_host ? ['CONFIG_VHOST_VDPA=y'] : []) + \
@@ -3694,7 +3700,7 @@ summary_info += {'smartcard support': cacard}
 summary_info += {'U2F support':       u2f}
 summary_info += {'libusb':            libusb}
 summary_info += {'usb net redir':     usbredir}
-summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
+summary_info += {'OpenGL support (epoxy)': opengl}
 summary_info += {'GBM':               gbm}
 summary_info += {'libiscsi support':  libiscsi}
 summary_info += {'libnfs support':    libnfs}
diff --git a/meson_options.txt b/meson_options.txt
index 52b11cead4..bd8efe4fbf 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -149,6 +149,8 @@ option('lzo', type : 'feature', value : 'auto',
        description: 'lzo compression support')
 option('rbd', type : 'feature', value : 'auto',
        description: 'Ceph block device driver')
+option('opengl', type : 'feature', value : 'auto',
+       description: 'OpenGL support')
 option('gtk', type : 'feature', value : 'auto',
        description: 'GTK+ user interface')
 option('sdl', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 1e26f4571e..f91bd9231b 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -91,6 +91,7 @@ meson_options_help() {
   printf "%s\n" '  nettle          nettle cryptography support'
   printf "%s\n" '  numa            libnuma support'
   printf "%s\n" '  nvmm            NVMM acceleration support'
+  printf "%s\n" '  opengl          OpenGL support'
   printf "%s\n" '  oss             OSS sound support'
   printf "%s\n" '  pa              PulseAudio sound support'
   printf "%s\n" '  parallels       parallels image format support'
@@ -271,6 +272,8 @@ _meson_option_parse() {
     --disable-numa) printf "%s" -Dnuma=disabled ;;
     --enable-nvmm) printf "%s" -Dnvmm=enabled ;;
     --disable-nvmm) printf "%s" -Dnvmm=disabled ;;
+    --enable-opengl) printf "%s" -Dopengl=enabled ;;
+    --disable-opengl) printf "%s" -Dopengl=disabled ;;
     --enable-oss) printf "%s" -Doss=enabled ;;
     --disable-oss) printf "%s" -Doss=disabled ;;
     --enable-pa) printf "%s" -Dpa=enabled ;;
diff --git a/ui/meson.build b/ui/meson.build
index 64286ba150..b21d3d1534 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -1,5 +1,6 @@
 softmmu_ss.add(pixman)
 specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: pixman)   # for the include path
+specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: opengl)   # for the include path
 
 softmmu_ss.add(files(
   'clipboard.c',
@@ -43,7 +44,6 @@ vnc_ss.add(zlib, png, jpeg, gnutls)
 vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
 softmmu_ss.add_all(when: vnc, if_true: vnc_ss)
 softmmu_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
-specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: opengl)
 
 ui_modules = {}
 
@@ -53,17 +53,18 @@ if curses.found()
   ui_modules += {'curses' : curses_ss}
 endif
 
-if config_host.has_key('CONFIG_OPENGL')
+softmmu_ss.add(opengl)
+if opengl.found()
   opengl_ss = ss.source_set()
   opengl_ss.add(gbm)
-  opengl_ss.add(when: [opengl, pixman, 'CONFIG_OPENGL'],
+  opengl_ss.add(when: [opengl, pixman],
                if_true: files('shader.c', 'console-gl.c', 'egl-helpers.c', 'egl-context.c'))
   ui_modules += {'opengl' : opengl_ss}
 endif
 
-if config_host.has_key('CONFIG_OPENGL') and gbm.found()
+if opengl.found() and gbm.found()
   egl_headless_ss = ss.source_set()
-  egl_headless_ss.add(when: [opengl, gbm, pixman, 'CONFIG_OPENGL'],
+  egl_headless_ss.add(when: [opengl, gbm, pixman],
                       if_true: files('egl-headless.c'))
   ui_modules += {'egl-headless' : egl_headless_ss}
 endif
@@ -98,8 +99,8 @@ if gtk.found()
   gtk_ss = ss.source_set()
   gtk_ss.add(gtk, vte, pixman, files('gtk.c', 'gtk-clipboard.c'))
   gtk_ss.add(when: x11, if_true: files('x_keymap.c'))
-  gtk_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('gtk-gl-area.c'))
-  gtk_ss.add(when: [x11, opengl, 'CONFIG_OPENGL'], if_true: files('gtk-egl.c'))
+  gtk_ss.add(when: opengl, if_true: files('gtk-gl-area.c'))
+  gtk_ss.add(when: [x11, opengl], if_true: files('gtk-egl.c'))
   ui_modules += {'gtk' : gtk_ss}
 endif
 
@@ -112,7 +113,7 @@ if sdl.found()
     'sdl2-input.c',
     'sdl2.c',
   ))
-  sdl_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('sdl2-gl.c'))
+  sdl_ss.add(when: opengl, if_true: files('sdl2-gl.c'))
   sdl_ss.add(when: x11, if_true: files('x_keymap.c'))
   ui_modules += {'sdl' : sdl_ss}
 endif
-- 
2.35.1



