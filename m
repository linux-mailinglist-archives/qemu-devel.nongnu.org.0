Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F254B6837
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:54:04 +0100 (CET)
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuX5-00072u-LD
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:54:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCP-0004Mf-Pc
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:41 -0500
Received: from [2a00:1450:4864:20::631] (port=35404
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCN-0008ST-Ph
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:41 -0500
Received: by mail-ej1-x631.google.com with SMTP id qk11so22510390ejb.2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ks34+qg3/pZbGPdtnrEzelBZMFOlLPY42nRaA7wgQnQ=;
 b=mgbJijRU5vlexr7BlFdCH3hg/qwEIR3NE6pLx7vB4WClgOr4Ts1pbPyhvAoYo8NqV1
 lXSJif57s0blAnLrBkHfG/PYbdTRk00hI5vkAHohQBWEGhX4yhSQAcw6PupI0e9p72bp
 8U2E0OMTEVMQuUK9T1gdFbuhOgDSkEc1280jVgi9F4CtMwAb+w0Gof6GCiTQ3HYTFxjG
 Z5CN4hMb2gUJrpZARswsRs0IM95UubeH98NjssoG0Uf6PsoBviMiQ3DEWUD+IpRtE8HE
 P2sBteTLTQT0738RLur7MDM3/WbduSI4YrO3vGgD2iREdoi+Fcz9ghyCrXVhmRWEa3sH
 lQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ks34+qg3/pZbGPdtnrEzelBZMFOlLPY42nRaA7wgQnQ=;
 b=4nVJGchdOvfcRMGYbokRPnDZ4xyBmV+qVnjIemUOAhMpu+r4Nnhq1v46MC2Od7NXge
 8dvb7Mf+Zxluw1LoqjFzRoKZ94Z/5myPtdqwZtOttB9yFg955PNmuXb+NbIs5/gO90X1
 RoTJr/Qc5Zmm8C9pLFLTAm39nvPoM+Wfa3MFx+jsKnCg5xuX/MCHT/Z53/MH2UvQ+Sn2
 0wLxEflS641pLx4SF6X5bpE8dfPZDjNmz16DTILYrlqDuM7c1a0XeOfkOWsyXYY2Z9j/
 u3hsoJfGvuuaDtsAPxaYANyLaC4E2OAu/ltY2ThehdQA+cnTtesHd4juopeZNq44FYRC
 9K2w==
X-Gm-Message-State: AOAM532oLhiwaYHkx4ZrKGV29wmWduALRy4/H7lQbf1d7aX2Foe/vf+g
 AYeqE5RLE+Y6SH+kUm7a5BLpVaO/tA4=
X-Google-Smtp-Source: ABdhPJwf4QnLjYPG9FjlDQX9bIc3HaOaq+sf4u9yF/kjNvc4WQz8wY8q5R0Huw94ReoYY9ZJoHZFJA==
X-Received: by 2002:a17:907:8192:: with SMTP id
 iy18mr208550ejc.209.1644917558488; 
 Tue, 15 Feb 2022 01:32:38 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/30] configure, meson: move OpenGL check to meson
Date: Tue, 15 Feb 2022 10:32:13 +0100
Message-Id: <20220215093223.110827-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
index a66e2c0d71..4c9f3f7cb4 100755
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
@@ -1263,7 +1258,6 @@ cat << EOF
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
   vhost-vdpa      vhost-vdpa kernel backend support
-  opengl          opengl support
   gio             libgio support
 
 NOTE: The object files are built at the place where configure is launched
@@ -2266,34 +2260,6 @@ case "$fdt" in
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
@@ -3003,12 +2969,6 @@ if test "$tcg" = "enabled" -a "$tcg_interpreter" = "true" ; then
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
index 5ad346816e..6308225e3c 100644
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
@@ -3591,7 +3597,7 @@ summary_info += {'smartcard support': cacard}
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
index 4edc611273..cc9bb4b1fd 100644
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
@@ -270,6 +271,8 @@ _meson_option_parse() {
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



