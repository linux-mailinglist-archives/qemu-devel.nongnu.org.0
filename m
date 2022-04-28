Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B737C512CDC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:30:54 +0200 (CEST)
Received: from localhost ([::1]:40296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyc1-0007R0-PX
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy29-0000Px-0P
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:50 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy26-00056P-Vd
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:48 -0400
Received: by mail-ej1-x630.google.com with SMTP id bv19so7613412ejb.6
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TeT39VMliTZNbtF1FqxWT5EpnJe1Ps12IRTnmykQBlI=;
 b=qk8mMQzU7zP7U4IGe92F80cYEb3GXFrBLQt2PBAJwFBzJruag5n9sdyMzo20+Rg7zH
 GCdbAw1DRMNmuyEi5Jq//ep0rB6BTv9hJ8HpXdffSLuJ9C81wb+p2er9q7BE96Muf8bs
 rKAtblmXlx2L3JT9Uhyfjw79wtTOMpQ0axdt9ggjGhS6KZBDeojBJXyTZjSHrg1Cn6Mh
 s2OfGkS/23YHaEyBZsdgZSMy7pqgUXFMGrADww4V9D9klCHeZ/gWu7ibkClhvBt3oozv
 puaeckRpl4WmGwhAkac0RopqxNf8ifU7ZWAGkclQqrsxU+ZqTpfIUDoCdIzLb47MOz6A
 PHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TeT39VMliTZNbtF1FqxWT5EpnJe1Ps12IRTnmykQBlI=;
 b=8IKgEt/APe0tsT9xR8z7IyXnh1Jbd3L/K3NZPZ5qs/YTXY/jvdnkZ/Xc0Kh+K2287q
 TYqdVDmcgMxkzqv4Y3+0UFqZqHE4LGcaeTGMRdZt6/ZMaYEUX1rYHb1b6YLXqOPGjJoK
 DZueT0RX8TchK0AToCdkyxGGWiMznAVCjovz1Sm+s97/Z//8AaOBUPcg48o8BYoyjtiP
 CPEJ0UwFdJBIA0xi8hUxHS1mJuZxiweqoumruPBYwfOJwEV25k4PzUwU9Y0nIka/Nr5d
 gdMHWJmz6OPyHvBxSye8tbB4KrBuGay85PaCtMiyzgFYe0yFCSzTAryY+gFzO/NZXYZm
 wIag==
X-Gm-Message-State: AOAM530uOQSOxAyroEaepEogdboAcnQMlRRX/pIeitKBKPRqTXl4K4vo
 GeO/XCpiO3tyw6yRek3apNmG5z4N1Cc6BA==
X-Google-Smtp-Source: ABdhPJyS/G32iPPcajXwv0Z+3ANfH4aTbsTBrcqvAfMStY/FPZDT/GuXF+oQqaEvreg0P3IzjJkgIg==
X-Received: by 2002:a17:907:a413:b0:6f3:a9e5:d076 with SMTP id
 sg19-20020a170907a41300b006f3a9e5d076mr13295961ejc.183.1651128825551; 
 Wed, 27 Apr 2022 23:53:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/18] configure, meson: move OpenGL check to meson
Date: Thu, 28 Apr 2022 08:53:28 +0200
Message-Id: <20220428065335.189795-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 40 -----------------------------------
 meson.build                   | 16 +++++++++-----
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 ui/meson.build                | 17 ++++++++-------
 5 files changed, 25 insertions(+), 53 deletions(-)

diff --git a/configure b/configure
index d704029284..1aefbc2f68 100755
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
index 9beca38ebb..83b7347c5f 100644
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
@@ -1546,6 +1551,7 @@ config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
 config_host_data.set('CONFIG_NUMA', numa.found())
+config_host_data.set('CONFIG_OPENGL', opengl.found())
 config_host_data.set('CONFIG_PROFILER', get_option('profiler'))
 config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
@@ -2093,7 +2099,7 @@ host_kconfig = \
   (have_tpm ? ['CONFIG_TPM=y'] : []) + \
   (spice.found() ? ['CONFIG_SPICE=y'] : []) + \
   (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
-  ('CONFIG_OPENGL' in config_host ? ['CONFIG_OPENGL=y'] : []) + \
+  (opengl.found() ? ['CONFIG_OPENGL=y'] : []) + \
   (x11.found() ? ['CONFIG_X11=y'] : []) + \
   ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=y'] : []) + \
   ('CONFIG_VHOST_VDPA' in config_host ? ['CONFIG_VHOST_VDPA=y'] : []) + \
@@ -3708,7 +3714,7 @@ summary_info += {'smartcard support': cacard}
 summary_info += {'U2F support':       u2f}
 summary_info += {'libusb':            libusb}
 summary_info += {'usb net redir':     usbredir}
-summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
+summary_info += {'OpenGL support (epoxy)': opengl}
 summary_info += {'GBM':               gbm}
 summary_info += {'libiscsi support':  libiscsi}
 summary_info += {'libnfs support':    libnfs}
diff --git a/meson_options.txt b/meson_options.txt
index d85734f8e6..dbcf9722bb 100644
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
index ef0dcd4a77..203f33ae18 100644
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



