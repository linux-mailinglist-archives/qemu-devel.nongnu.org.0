Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435562F375A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:39:17 +0100 (CET)
Received: from localhost ([::1]:48568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNdU-0005Ih-Ap
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNGA-0003jm-Bc
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:10 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:40671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG7-0004w8-LK
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:10 -0500
Received: by mail-ed1-x52f.google.com with SMTP id h16so3156108edt.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cfL8i8chFGXTWzbKyWbwzxPKvNWbZFSzYIWXHnLcdJY=;
 b=sOiSDPbHgsi1Ke9Xs6kfFf0qGIwxgYg9iQ+4H+Ku/yDCqdFcmD//y2wsKcAJ76go1B
 bZGJxlalxF0gA9ulqbXllEjJlT/24vEZ8wp1mwcd730tLw7tUUJ0h8cto+UXz8WYeWMQ
 gP5PQ8jxYj/gykmibtZhMHBN76XwIhbF+WXm2wnVxFXL1EL+JWntZwc5Tw+s/9PJIDyW
 J21PP6UJtp7Kn6307I8TEOJNyo0fBUsYpJBDP+JDOnEtt7l199a6cfhhhykbFC5nhjJl
 7ePIKpDHEOJLb9KGCZdXilHeUVYugF6fIX1UUqiOluJrchyTMEtQanyWZi8eKfsOe1pT
 v7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cfL8i8chFGXTWzbKyWbwzxPKvNWbZFSzYIWXHnLcdJY=;
 b=UAevTcRjZDc7AfxsjsXyszG7n4siirLGNOfd7AIwCcQSfzNpKCBh+8Sq4srsFZBW+q
 q+RKST2bEuZJNs1f2XskSLwJIETvmvPJoyfRd/FBb7UJH5/NVdcdc7xlMTKfnWoYEO0w
 6OidFKIccVElgAOLXdiSLMuAQuTGEKufJQTLQl71DxezC3YUQhZ15/HApvPVoDD6cw9F
 rTYbtckTWQs7lkY3KLC8aPibt8uy64ldktn2b94A4LIMOyqTIO0JUk8NRKKV1K1coUNw
 Gx/RnAQkYr9/3DSm8Hvvo2ycAeIFZOpkcXfz8JfhGe32cNTVCs5caN2LX6OJlm/H6W4x
 usug==
X-Gm-Message-State: AOAM532z0lisFFWvb+IJcRWZjSIkGnbDMByaJJ0vGJ832QIp8AQPLmAZ
 gJFxI54iFTOKKliPnGlgiSF+nySBKcm7sQ==
X-Google-Smtp-Source: ABdhPJxTuNI75k3I0V9jqpADJ8oEQDPdg9mi5uusKkloVVs/wlK/N7Si/ThNIbtlJVNlzzt78Vgj8Q==
X-Received: by 2002:a05:6402:310f:: with SMTP id
 dc15mr110287edb.225.1610471706353; 
 Tue, 12 Jan 2021 09:15:06 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.15.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:15:05 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/20] configure: move X11 detection to Meson
Date: Tue, 12 Jan 2021 18:14:46 +0100
Message-Id: <20210112171450.791427-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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

For now move the logic verbatim.  GTK+ actually has a hard requirement
on X11 if gtk+x11 is present, but we will sort that out later.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure      | 14 ++------------
 meson.build    |  9 +++++----
 ui/meson.build |  4 ++--
 3 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index f3877c2efd..ec0639387d 100755
--- a/configure
+++ b/configure
@@ -2759,14 +2759,6 @@ EOF
   fi
 fi
 
-##########################################
-# X11 probe
-if $pkg_config --exists "x11"; then
-    have_x11=yes
-    x11_cflags=$($pkg_config --cflags x11)
-    x11_libs=$($pkg_config --libs x11)
-fi
-
 ##########################################
 # GTK probe
 
@@ -5681,10 +5673,8 @@ fi
 if test "$module_upgrades" = "yes"; then
   echo "CONFIG_MODULE_UPGRADES=y" >> $config_host_mak
 fi
-if test "$have_x11" = "yes" && test "$need_x11" = "yes"; then
-  echo "CONFIG_X11=y" >> $config_host_mak
-  echo "X11_CFLAGS=$x11_cflags" >> $config_host_mak
-  echo "X11_LIBS=$x11_libs" >> $config_host_mak
+if test "$need_x11" = "yes"; then
+  echo "CONFIG_NEED_X11=y" >> $config_host_mak
 fi
 if test "$pipe2" = "yes" ; then
   echo "CONFIG_PIPE2=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 98930bca38..e673c1578a 100644
--- a/meson.build
+++ b/meson.build
@@ -787,9 +787,9 @@ if 'CONFIG_VTE' in config_host
                            link_args: config_host['VTE_LIBS'].split())
 endif
 x11 = not_found
-if 'CONFIG_X11' in config_host
-  x11 = declare_dependency(compile_args: config_host['X11_CFLAGS'].split(),
-                           link_args: config_host['X11_LIBS'].split())
+if config_host.has_key('CONFIG_NEED_X11')
+  x11 = dependency('x11', method: 'pkg-config', required: false,
+                   static: enable_static)
 endif
 vnc = not_found
 png = not_found
@@ -1085,6 +1085,7 @@ config_host_data.set('CONFIG_STATX', has_statx)
 config_host_data.set('CONFIG_ZSTD', zstd.found())
 config_host_data.set('CONFIG_FUSE', fuse.found())
 config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
+config_host_data.set('CONFIG_X11', x11.found())
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
 config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
@@ -1171,7 +1172,7 @@ host_kconfig = \
   ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
   ('CONFIG_IVSHMEM' in config_host ? ['CONFIG_IVSHMEM=y'] : []) + \
   ('CONFIG_OPENGL' in config_host ? ['CONFIG_OPENGL=y'] : []) + \
-  ('CONFIG_X11' in config_host ? ['CONFIG_X11=y'] : []) + \
+  (x11.found() ? ['CONFIG_X11=y'] : []) + \
   ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=y'] : []) + \
   ('CONFIG_VHOST_VDPA' in config_host ? ['CONFIG_VHOST_VDPA=y'] : []) + \
   ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=y'] : []) + \
diff --git a/ui/meson.build b/ui/meson.build
index bd2b920504..cc764e1bd1 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -62,7 +62,7 @@ if config_host.has_key('CONFIG_GTK')
 
   gtk_ss = ss.source_set()
   gtk_ss.add(gtk, vte, pixman, files('gtk.c'))
-  gtk_ss.add(when: [x11, 'CONFIG_X11'], if_true: files('x_keymap.c'))
+  gtk_ss.add(when: x11, if_true: files('x_keymap.c'))
   gtk_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('gtk-egl.c', 'gtk-gl-area.c'))
   ui_modules += {'gtk' : gtk_ss}
 endif
@@ -77,7 +77,7 @@ if sdl.found()
     'sdl2.c',
   ))
   sdl_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('sdl2-gl.c'))
-  sdl_ss.add(when: [x11, 'CONFIG_X11'], if_true: files('x_keymap.c'))
+  sdl_ss.add(when: x11, if_true: files('x_keymap.c'))
   ui_modules += {'sdl' : sdl_ss}
 endif
 
-- 
2.29.2



