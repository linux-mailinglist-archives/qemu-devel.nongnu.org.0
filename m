Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3A22F37A3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:51:41 +0100 (CET)
Received: from localhost ([::1]:52918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNpU-0002fX-5t
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNGA-0003kf-PN
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:10 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG8-0004wR-Kp
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:10 -0500
Received: by mail-ej1-x629.google.com with SMTP id g12so2413856ejf.8
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cJU4WwljxqwCgLmkc8zTONOLaKiVm4YNhLqB26UAGWk=;
 b=eB11M9vdduODb+X5OS3t4WRCeuDuOpSrlVgDYhSVLMVFlrnUrEknoMOJ6f/8SkaJ24
 FarHQTfrY7jnppltjnRnmPZhqwPoh6Z+XBAN26RviZr+KHTjPFHvQOOQ+AtSSj3Cikus
 mfWOTZI/Kg4xts+stxhPYibcN0p1TylMqRgeM+HeSdm51DSQmybf16NDJjHU2T/KLZrW
 bAHsR8I4+9rH8gUH2SWf54aVvxhM440YvfSHkrNeISxI57y1nyi/3lBYE/qz+aGvM+2q
 NrjMoNf82k2xXtkj+lKP/6mYqE2W7PRGdhPcNNIhGgREM/qbvwssXRxpvXzWSTnDZYWJ
 ix5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cJU4WwljxqwCgLmkc8zTONOLaKiVm4YNhLqB26UAGWk=;
 b=H/U2inBMo1/b3N+ZE3K0dp8tCuqBk3Iem32Vj0AN0JrlNCGTbEIHARhwG4wZpP6xcg
 J9fg2ZrpTmm+OlqxaTOnVyxZMIB7Ixjwp5XxPTNZhTlVhoCT6rizCDWmTqpJyxgu4aqu
 Tv5k6k1ieGlDEyXbNq5MByEPMiNQ0kOXHqk4zNBVethu9A+nu4nCMIW2HJAP1daGVTGt
 T6EotCnx3h3374jjkfvTh2xfyuBGP0FG9aaSohNAq3yr9FOhnx54ZApngtXUAYD0EjZL
 WYAuAA3p31vZ3D7eRfB1YVcwJDTn2VvdeRUF7XNhyh9lAxCyUCmyZlAGuST9UJyrIOK+
 xO7A==
X-Gm-Message-State: AOAM530srxWlYJ2e2aH8Blh3fEAzxgmNH4MJf5b+WIE915Rgc1cmHunD
 8nwXkOF3Lude1wnAe5g04JK+omCPacvv1A==
X-Google-Smtp-Source: ABdhPJzVfo3u91cFN6ErbK7DVwN9S1tbrebAxW08pKwFyfBG3/bRWfysdYhhiZZcvDqqZTIJgyxKsw==
X-Received: by 2002:a17:906:3fc1:: with SMTP id
 k1mr4092016ejj.58.1610471707223; 
 Tue, 12 Jan 2021 09:15:07 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.15.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:15:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/20] configure: move GTK+ detection to Meson
Date: Tue, 12 Jan 2021 18:14:47 +0100
Message-Id: <20210112171450.791427-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

This also allows removing CONFIG_NEED_X11, all the ingredients
can be computed easily in meson.build.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 55 ++++++-----------------------------------------
 meson.build       | 29 ++++++++++++++++++-------
 meson_options.txt |  2 ++
 ui/meson.build    |  2 +-
 4 files changed, 30 insertions(+), 58 deletions(-)

diff --git a/configure b/configure
index ec0639387d..d70448f495 100755
--- a/configure
+++ b/configure
@@ -414,7 +414,7 @@ cfi="false"
 cfi_debug="false"
 seccomp="auto"
 glusterfs="auto"
-gtk="$default_feature"
+gtk="auto"
 tls_priority="NORMAL"
 gnutls="$default_feature"
 nettle="$default_feature"
@@ -1377,9 +1377,9 @@ for opt do
   --enable-uuid|--disable-uuid)
       echo "$0: $opt is obsolete, UUID support is always built" >&2
   ;;
-  --disable-gtk) gtk="no"
+  --disable-gtk) gtk="disabled"
   ;;
-  --enable-gtk) gtk="yes"
+  --enable-gtk) gtk="enabled"
   ;;
   --tls-priority=*) tls_priority="$optarg"
   ;;
@@ -2329,10 +2329,10 @@ if test "$cocoa" = "enabled"; then
     if test "$sdl" = "enabled"; then
         error_exit "Cocoa and SDL UIs cannot both be enabled at once"
     fi
-    if test "$gtk" = "yes"; then
+    if test "$gtk" = "enabled"; then
         error_exit "Cocoa and GTK UIs cannot both be enabled at once"
     fi
-    gtk=no
+    gtk=disabled
     sdl=disabled
 fi
 
@@ -2759,31 +2759,6 @@ EOF
   fi
 fi
 
-##########################################
-# GTK probe
-
-if test "$gtk" != "no"; then
-    gtkpackage="gtk+-3.0"
-    gtkx11package="gtk+-x11-3.0"
-    gtkversion="3.22.0"
-    if $pkg_config --exists "$gtkpackage >= $gtkversion"; then
-        gtk_cflags=$($pkg_config --cflags $gtkpackage)
-        gtk_libs=$($pkg_config --libs $gtkpackage)
-        gtk_version=$($pkg_config --modversion $gtkpackage)
-        if $pkg_config --exists "$gtkx11package >= $gtkversion"; then
-            need_x11=yes
-            gtk_cflags="$gtk_cflags $x11_cflags"
-            gtk_libs="$gtk_libs $x11_libs"
-        fi
-        gtk="yes"
-    elif test "$gtk" = "yes"; then
-        feature_not_found "gtk" "Install gtk3-devel"
-    else
-        gtk="no"
-    fi
-fi
-
-
 ##########################################
 # GNUTLS probe
 
@@ -3640,16 +3615,6 @@ EOF
   fi
 fi
 
-if test "$opengl" = "yes" && test "$have_x11" = "yes"; then
-  for target in $target_list; do
-    case $target in
-      lm32-softmmu) # milkymist-tmu2 requires X11 and OpenGL
-        need_x11=yes
-      ;;
-    esac
-  done
-fi
-
 ##########################################
 # libxml2 probe
 if test "$libxml2" != "no" ; then
@@ -5673,9 +5638,6 @@ fi
 if test "$module_upgrades" = "yes"; then
   echo "CONFIG_MODULE_UPGRADES=y" >> $config_host_mak
 fi
-if test "$need_x11" = "yes"; then
-  echo "CONFIG_NEED_X11=y" >> $config_host_mak
-fi
 if test "$pipe2" = "yes" ; then
   echo "CONFIG_PIPE2=y" >> $config_host_mak
 fi
@@ -5763,11 +5725,6 @@ fi
 if test "$bswap_h" = "yes" ; then
   echo "CONFIG_MACHINE_BSWAP_H=y" >> $config_host_mak
 fi
-if test "$gtk" = "yes" ; then
-  echo "CONFIG_GTK=y" >> $config_host_mak
-  echo "GTK_CFLAGS=$gtk_cflags" >> $config_host_mak
-  echo "GTK_LIBS=$gtk_libs" >> $config_host_mak
-fi
 if test "$gio" = "yes" ; then
     echo "CONFIG_GIO=y" >> $config_host_mak
     echo "GIO_CFLAGS=$gio_cflags" >> $config_host_mak
@@ -6501,7 +6458,7 @@ NINJA=$ninja $meson setup \
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
-        -Dcocoa=$cocoa -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
+        -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
diff --git a/meson.build b/meson.build
index e673c1578a..73d3cc5385 100644
--- a/meson.build
+++ b/meson.build
@@ -776,19 +776,31 @@ if 'CONFIG_OPENGL' in config_host
   opengl = declare_dependency(compile_args: config_host['OPENGL_CFLAGS'].split(),
                               link_args: config_host['OPENGL_LIBS'].split())
 endif
+
 gtk = not_found
-if 'CONFIG_GTK' in config_host
-  gtk = declare_dependency(compile_args: config_host['GTK_CFLAGS'].split(),
-                              link_args: config_host['GTK_LIBS'].split())
+gtkx11 = not_found
+if not get_option('gtk').auto() or have_system
+  gtk = dependency('gtk+-3.0', version: '>=3.22.0',
+                   method: 'pkg-config',
+                   required: get_option('gtk'),
+                   static: enable_static)
+  if gtk.found()
+    gtkx11 = dependency('gtk+-x11-3.0', version: '>=3.22.0',
+                        method: 'pkg-config',
+                        required: false,
+                        static: enable_static)
+    gtk = declare_dependency(dependencies: [gtk, gtkx11])
+  endif
 endif
+
 vte = not_found
 if 'CONFIG_VTE' in config_host
   vte = declare_dependency(compile_args: config_host['VTE_CFLAGS'].split(),
                            link_args: config_host['VTE_LIBS'].split())
 endif
 x11 = not_found
-if config_host.has_key('CONFIG_NEED_X11')
-  x11 = dependency('x11', method: 'pkg-config', required: false,
+if gtkx11.found() or 'lm32-softmmu' in target_dirs
+  x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
                    static: enable_static)
 endif
 vnc = not_found
@@ -1062,6 +1074,7 @@ if glusterfs.found()
   config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT', glusterfs_ftruncate_has_stat)
   config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT', glusterfs_iocb_has_stat)
 endif
+config_host_data.set('CONFIG_GTK', gtk.found())
 config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
 config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
 config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
@@ -2230,7 +2243,7 @@ subdir('tools')
 subdir('pc-bios')
 subdir('docs')
 subdir('tests')
-if 'CONFIG_GTK' in config_host
+if gtk.found()
   subdir('po')
 endif
 
@@ -2247,7 +2260,7 @@ if host_machine.system() == 'windows'
   if build_docs
     nsis_cmd += '-DCONFIG_DOCUMENTATION=y'
   endif
-  if 'CONFIG_GTK' in config_host
+  if gtk.found()
     nsis_cmd += '-DCONFIG_GTK=y'
   endif
 
@@ -2338,7 +2351,7 @@ endif
 summary_info += {'SDL support':       sdl.found()}
 summary_info += {'SDL image support': sdl_image.found()}
 # TODO: add back version
-summary_info += {'GTK support':       config_host.has_key('CONFIG_GTK')}
+summary_info += {'GTK support':       gtk.found()}
 summary_info += {'pixman':            pixman.found()}
 # TODO: add back version
 summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
diff --git a/meson_options.txt b/meson_options.txt
index 7948a8255c..72a3ca22d6 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -74,6 +74,8 @@ option('lzo', type : 'feature', value : 'auto',
        description: 'lzo compression support')
 option('rbd', type : 'feature', value : 'auto',
        description: 'Ceph block device driver')
+option('gtk', type : 'feature', value : 'auto',
+       description: 'GTK+ user interface')
 option('sdl', type : 'feature', value : 'auto',
        description: 'SDL user interface')
 option('sdl_image', type : 'feature', value : 'auto',
diff --git a/ui/meson.build b/ui/meson.build
index cc764e1bd1..634fabab0d 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -57,7 +57,7 @@ if config_host.has_key('CONFIG_OPENGL_DMABUF')
   ui_modules += {'egl-headless' : egl_headless_ss}
 endif
 
-if config_host.has_key('CONFIG_GTK')
+if gtk.found()
   softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
 
   gtk_ss = ss.source_set()
-- 
2.29.2



