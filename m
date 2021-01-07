Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DB22ED157
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 15:05:33 +0100 (CET)
Received: from localhost ([::1]:58080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxVuu-0006x6-8z
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 09:05:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqQ-0003xC-AZ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:00:54 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqK-0006wf-Iw
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:00:50 -0500
Received: by mail-ed1-x530.google.com with SMTP id b73so7757197edf.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 06:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t+Pwn9LfFG65wvaIUQ2xmA9CpZnngkiMNkAxYZScHNk=;
 b=W1yPHQ5Oha1hAeKLvXQHAgiKuICQu+riwApI91ZUUBVPbJ7o65NJH3hyUGqDODElLX
 CvOBKWDgRQufTi2eQui4h8b4dsgMR4cqLcE7uy9QPnFwfiJtJgEZkGfXkFtMwbV7NVHV
 DtOlGOezv0Q3Aj9FhQm+51YrQ9Ksj6wGkkfF2lLOKYE3t+ZGtiJT2+murcUzAuqHJb/1
 hic37pFtXU5nFBlGu20IEJ4fY5lmdeFqONygYY2jJu4lJWNAUday+vVKRXSP2efNTJO5
 JZX32noBcbKRNg/KclBICVAhc+niVvzzCNrJ8yDY+aNU0AAsuXZqMT+BnGU1oIQoAWcy
 xFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=t+Pwn9LfFG65wvaIUQ2xmA9CpZnngkiMNkAxYZScHNk=;
 b=dJBOGbGkF4luFLwUuvUVBYYilwvX/i4HEX1nrUuIBUkI7ToNvQTDyU7w3MuhzR2U9p
 iCLq2Y6E3T8RxS32f/JlygMmH8PfFNT6+kShbOuk3XQaldNgyHvbAe0kxr8Xowmu0DeP
 KdepGxvBlfJPO+XvrYrhdJgrViPcNx/K6plPAb+D6Cs3rIHG7Q2kPPeKIMDMqZNSFmZ+
 vsdWs+iDY1q7FMKJiEC92soSQBzTDVDMlYPevWpyltjtCW9ra6Xes3evp2Ur2npC2rhz
 41+idajXcHTv3ZwXmjuCqgiuR09Isi+5UkHVdQ4VQ3VDyQMbS6fVrVjlAIV/Vvoi/BW8
 33DA==
X-Gm-Message-State: AOAM531Ih7yFuf8G9E2u6o9SUmJlVlBAGEJ/SGCvA+O+Ahfqyhtn+4Kq
 WcxULAIsCxaQxjo7IThzBIiD+vyeYAxDpw==
X-Google-Smtp-Source: ABdhPJxUR6lb4AqZY40lk7LNBEnrPdRIetEAryg+o6RJ1yfctKM4kdiXgN+51cCXKdZP8HjdWAq+aw==
X-Received: by 2002:aa7:d919:: with SMTP id a25mr1707624edr.81.1610028046439; 
 Thu, 07 Jan 2021 06:00:46 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id oq27sm2438523ejb.108.2021.01.07.06.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 06:00:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] configure: move GTK+ detection to Meson
Date: Thu,  7 Jan 2021 15:00:36 +0100
Message-Id: <20210107140039.467969-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107140039.467969-1-pbonzini@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: alex.bennee@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com,
 stefanha@redhat.com
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
index e9d76c2c13..652cff7ba6 100755
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
@@ -6491,7 +6448,7 @@ NINJA=$ninja $meson setup \
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
-        -Dcocoa=$cocoa -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
+        -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
diff --git a/meson.build b/meson.build
index fdd4312c71..a3a0958b4d 100644
--- a/meson.build
+++ b/meson.build
@@ -772,19 +772,31 @@ if 'CONFIG_OPENGL' in config_host
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
@@ -1058,6 +1070,7 @@ if glusterfs.found()
   config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT', glusterfs_ftruncate_has_stat)
   config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT', glusterfs_iocb_has_stat)
 endif
+config_host_data.set('CONFIG_GTK', gtk.found())
 config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
 config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
 config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
@@ -2229,7 +2242,7 @@ subdir('tools')
 subdir('pc-bios')
 subdir('docs')
 subdir('tests')
-if 'CONFIG_GTK' in config_host
+if gtk.found()
   subdir('po')
 endif
 
@@ -2246,7 +2259,7 @@ if host_machine.system() == 'windows'
   if build_docs
     nsis_cmd += '-DCONFIG_DOCUMENTATION=y'
   endif
-  if 'CONFIG_GTK' in config_host
+  if gtk.found()
     nsis_cmd += '-DCONFIG_GTK=y'
   endif
 
@@ -2337,7 +2350,7 @@ endif
 summary_info += {'SDL support':       sdl.found()}
 summary_info += {'SDL image support': sdl_image.found()}
 # TODO: add back version
-summary_info += {'GTK support':       config_host.has_key('CONFIG_GTK')}
+summary_info += {'GTK support':       gtk.found()}
 summary_info += {'pixman':            pixman.found()}
 # TODO: add back version
 summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
diff --git a/meson_options.txt b/meson_options.txt
index 41f9c2cf6c..b9b106675f 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -76,6 +76,8 @@ option('lzo', type : 'feature', value : 'auto',
        description: 'lzo compression support')
 option('rbd', type : 'feature', value : 'auto',
        description: 'Ceph block device driver')
+option('gtk', type : 'feature', value : 'auto',
+       description: 'GTK+ user interface')
 option('sdl', type : 'feature', value : 'auto',
        description: 'SDL user interface')
 option('sdl_image', type : 'feature', value : 'auto',
diff --git a/ui/meson.build b/ui/meson.build
index afbdd78e97..407e291ebe 100644
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



