Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA004A8B48
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:13:11 +0100 (CET)
Received: from localhost ([::1]:60270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgbW-0006Qg-UA
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:13:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0X-0005Up-JP
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:57 -0500
Received: from [2a00:1450:4864:20::533] (port=45852
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0L-0008Ij-I9
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:57 -0500
Received: by mail-ed1-x533.google.com with SMTP id p7so7424749edc.12
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a8MnmAZ3tedo3shg5Pw9KIBbRTccfE4GG8+4StL40vs=;
 b=nvzkhs9gbffeeskEQOcMuHqHe8zbM6SJESOh42pNHSKuXd2o8bo5O1Z4Ry/V/L5u90
 eBq0wWoZjcJSST33E9GSV7g8MmNVJxv4oxzm13fIoI9x5x1AFWn4FUOfPE/+QsC0SKlv
 nFHUVN+pDMGjrg+8PFmHtmD/UflCKOhzcVq/lBwHlmqT4AD0WNy8Rlf6XPcZviD/AsTq
 My893U8imx7qbelZFFDBMpSJcvUQZ+5i5cO4LzjvomY5YJ+CZd7WXw7c94sWa6OGes8B
 YGGSvgGRcP38qOJlSrtowWfvZW2kvkT3jCHDjD86YBikAHrvyu77Ga9QB6+n9QOAW2Ns
 48aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=a8MnmAZ3tedo3shg5Pw9KIBbRTccfE4GG8+4StL40vs=;
 b=Hpwj2VlP/oxjjbrPi8ddIYkSzOrI5dc8wfRmi2nvg6v4rU89eavKgQcsqjU3/VcUPL
 DC3t5KPS1y4P2jv81QGl5XaF2eqZ4uCudZubv1nqF+uMabKu8TF32LC0u3u4nQPC0dXZ
 ng7NXrPO6z1P7Z1+kejHJEpcNu4mIUquM3xTCuu5jG8292vasqtVqqKalFEk70x/wjk5
 gnB4onCQRBb7H8aZ5kcBIgv3d56mBCoh0mtve6LuqLVyxsrK3HG5r6edFZgPXQMNzIH1
 0FyoetRvl9Ujht2uin5KtcVOuDQeEOptLjAmGNvUibvfB7WfkDRtal1vReE5YKGqXxzH
 8T2w==
X-Gm-Message-State: AOAM532RtOYaC+Cpls+kGenjjZ7Hy6IlR3nThlG6hiMKxJRZlJRRr4Em
 hqxo09EiemPr6tQ+1aUfqAHz5r/FZiI=
X-Google-Smtp-Source: ABdhPJzmQzKAcqr7GXmTadZwHWULGAdCjpVWajy7KhCIFGDrD3UphH4g9zaHmdBUV9xEaPvaAKXQXw==
X-Received: by 2002:aa7:cdc6:: with SMTP id h6mr36261195edw.140.1643909654065; 
 Thu, 03 Feb 2022 09:34:14 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/27] configure, meson: move OpenGL check to meson
Date: Thu,  3 Feb 2022 18:33:49 +0100
Message-Id: <20220203173359.292068-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 40 -----------------------------------
 meson.build                   | 16 +++++++++-----
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 ui/meson.build                | 16 +++++++-------
 5 files changed, 24 insertions(+), 53 deletions(-)

diff --git a/configure b/configure
index 8ab1e96835..e25de48b3e 100755
--- a/configure
+++ b/configure
@@ -316,7 +316,6 @@ pkgversion=""
 pie=""
 trace_backends="log"
 trace_file="trace"
-opengl="$default_feature"
 vss_win32_sdk="$default_feature"
 win_sdk="no"
 coroutine=""
@@ -952,10 +951,6 @@ for opt do
   ;;
   --enable-vhost-user-fs) vhost_user_fs="yes"
   ;;
-  --disable-opengl) opengl="no"
-  ;;
-  --enable-opengl) opengl="yes"
-  ;;
   --disable-zlib-test)
   ;;
   --with-vss-sdk) vss_win32_sdk=""
@@ -1277,7 +1272,6 @@ cat << EOF
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
   vhost-vdpa      vhost-vdpa kernel backend support
-  opengl          opengl support
   gio             libgio support
 
 NOTE: The object files are built at the place where configure is launched
@@ -2287,34 +2281,6 @@ case "$fdt" in
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
@@ -3024,12 +2990,6 @@ if test "$tcg" = "enabled" -a "$tcg_interpreter" = "true" ; then
   echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
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
index 894b9bd6ed..c4601554a5 100644
--- a/meson.build
+++ b/meson.build
@@ -993,9 +993,14 @@ if not get_option('coreaudio').auto() or (targetos == 'darwin' and have_system)
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
+  elif get_option('dsound').enabled()
+    error('epoxy/egl.h not found')
+  endif
 endif
 gbm = not_found
 if (have_system or have_tools) and (virgl.found() or opengl.found())
@@ -1521,6 +1526,7 @@ config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
 config_host_data.set('CONFIG_NUMA', numa.found())
+config_host_data.set('CONFIG_OPENGL', opengl.found())
 config_host_data.set('CONFIG_PROFILER', get_option('profiler'))
 config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
@@ -1994,7 +2000,7 @@ host_kconfig = \
   (have_tpm ? ['CONFIG_TPM=y'] : []) + \
   (spice.found() ? ['CONFIG_SPICE=y'] : []) + \
   (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
-  ('CONFIG_OPENGL' in config_host ? ['CONFIG_OPENGL=y'] : []) + \
+  (opengl.found() ? ['CONFIG_OPENGL=y'] : []) + \
   (x11.found() ? ['CONFIG_X11=y'] : []) + \
   ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=y'] : []) + \
   ('CONFIG_VHOST_VDPA' in config_host ? ['CONFIG_VHOST_VDPA=y'] : []) + \
@@ -3595,7 +3601,7 @@ summary_info += {'smartcard support': cacard}
 summary_info += {'U2F support':       u2f}
 summary_info += {'libusb':            libusb}
 summary_info += {'usb net redir':     usbredir}
-summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
+summary_info += {'OpenGL support (epoxy)': opengl}
 summary_info += {'GBM':               gbm}
 summary_info += {'libiscsi support':  libiscsi}
 summary_info += {'libnfs support':    libnfs}
diff --git a/meson_options.txt b/meson_options.txt
index 589d242439..417b543314 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -145,6 +145,8 @@ option('lzo', type : 'feature', value : 'auto',
        description: 'lzo compression support')
 option('rbd', type : 'feature', value : 'auto',
        description: 'Ceph block device driver')
+option('opengl', type : 'feature', value : 'auto',
+       description: 'OpenGL support')
 option('gtk', type : 'feature', value : 'auto',
        description: 'GTK+ user interface')
 option('sdl', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 8c943f6c2a..895d8310b4 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -92,6 +92,7 @@ meson_options_help() {
   printf "%s\n" '  nettle          nettle cryptography support'
   printf "%s\n" '  numa            libnuma support'
   printf "%s\n" '  nvmm            NVMM acceleration support'
+  printf "%s\n" '  opengl          OpenGL support'
   printf "%s\n" '  oss             OSS sound support'
   printf "%s\n" '  pa              PulseAudio sound support'
   printf "%s\n" '  parallels       parallels image format support'
@@ -273,6 +274,8 @@ _meson_option_parse() {
     --disable-numa) printf "%s" -Dnuma=disabled ;;
     --enable-nvmm) printf "%s" -Dnvmm=enabled ;;
     --disable-nvmm) printf "%s" -Dnvmm=disabled ;;
+    --enable-opengl) printf "%s" -Dopengl=enabled ;;
+    --disable-opengl) printf "%s" -Dopengl=disabled ;;
     --enable-oss) printf "%s" -Doss=enabled ;;
     --disable-oss) printf "%s" -Doss=disabled ;;
     --enable-pa) printf "%s" -Dpa=enabled ;;
diff --git a/ui/meson.build b/ui/meson.build
index 64286ba150..cdf2bafb03 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -43,7 +43,6 @@ vnc_ss.add(zlib, png, jpeg, gnutls)
 vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
 softmmu_ss.add_all(when: vnc, if_true: vnc_ss)
 softmmu_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
-specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: opengl)
 
 ui_modules = {}
 
@@ -53,17 +52,18 @@ if curses.found()
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
@@ -98,8 +98,8 @@ if gtk.found()
   gtk_ss = ss.source_set()
   gtk_ss.add(gtk, vte, pixman, files('gtk.c', 'gtk-clipboard.c'))
   gtk_ss.add(when: x11, if_true: files('x_keymap.c'))
-  gtk_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('gtk-gl-area.c'))
-  gtk_ss.add(when: [x11, opengl, 'CONFIG_OPENGL'], if_true: files('gtk-egl.c'))
+  gtk_ss.add(when: opengl, if_true: files('gtk-gl-area.c'))
+  gtk_ss.add(when: [x11, opengl], if_true: files('gtk-egl.c'))
   ui_modules += {'gtk' : gtk_ss}
 endif
 
@@ -112,7 +112,7 @@ if sdl.found()
     'sdl2-input.c',
     'sdl2.c',
   ))
-  sdl_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('sdl2-gl.c'))
+  sdl_ss.add(when: opengl, if_true: files('sdl2-gl.c'))
   sdl_ss.add(when: x11, if_true: files('x_keymap.c'))
   ui_modules += {'sdl' : sdl_ss}
 endif
-- 
2.34.1



