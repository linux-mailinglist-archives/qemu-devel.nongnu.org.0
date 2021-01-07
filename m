Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688492ED177
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 15:12:40 +0100 (CET)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxW1n-0005MW-HL
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 09:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqS-0003y4-Ft
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:01:01 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqK-0006vq-Ix
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:00:55 -0500
Received: by mail-ed1-x531.google.com with SMTP id c7so7830144edv.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 06:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VlMbpwwRGUfyBr2oLxpRJNDE1UWwr1g5mMbRh1kMy5M=;
 b=XAagg5dE1NHdyclG9PMQ4ulSd1p4WqQ9cAPHhStyOENGD3PKM4z3IB2VcZtRrMm1oo
 6etDvBAsuE/+XuzEOvcIfKwIQJTYPzK6hbMSij1quH53UYmInHHvEG9y68wvwYh7Y5Hk
 2LxU+WYi6XE3Nl23n4wGKIs1YxxmkN5OOeflG4mKYiRG0FfjFjIoXbfD+KjKD5e1w5TA
 JEZWKUrVP2ToEaSB2NTvsOO3o6q+yZYo4uzNBmceQWFgVPO1Ly4MjDh39QBHM4fLKYAo
 DasCpOuT+CXo2pdo7VKYiJb7JmaD8/SWzsyOPPpiGuxfiOfVUlbuII12d+isXuDud+uK
 +iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VlMbpwwRGUfyBr2oLxpRJNDE1UWwr1g5mMbRh1kMy5M=;
 b=oWlifTGdXaGsgxekA0X0Yt9XAM1UQ89cd92LqdIgj2waViJVUSJmPh/qmP1cllcEbj
 Jw7KY9E/mUGgUJu788V9LWw3tPn8usAcUuwTw/27ZcOI2mOpjRseMxo8ZTheIoczDMQW
 yeSv7XLspIpufv1xSwOs8ei0rhW3VqepQ/iZDa77i2DYQyKjh9fUtMO7iZrthjJaAJeM
 L2Flk5UN6zgJYlJHb8yBIscYgrej2StA/V8XL7P8XK/eb2DWvk0BjNp7Kon3p1MdiiQ4
 8TOF2XXVJJHqAaipzn1pnbqXwn+aCJWAyV4xmCSNEsWnkCV5ParONVoRn8IoN23pj6f4
 WzPQ==
X-Gm-Message-State: AOAM530dLAhDZ2UWl+qBK+qda699QIHF+M3LWc9Q4c3vaG/WW9MXqn9c
 YNqqu8Cw8ZsEhmaYQA76/q+oL+eN0drt2A==
X-Google-Smtp-Source: ABdhPJxRlC7RpBXrDGuKPd82SadeXAARnLKQXndpiRA43H4HK8xd0H6w3m0OQ9zes6p2ihUbGCzOIQ==
X-Received: by 2002:a50:9e8b:: with SMTP id a11mr1741146edf.276.1610028045355; 
 Thu, 07 Jan 2021 06:00:45 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id oq27sm2438523ejb.108.2021.01.07.06.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 06:00:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] configure: move X11 detection to Meson
Date: Thu,  7 Jan 2021 15:00:35 +0100
Message-Id: <20210107140039.467969-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107140039.467969-1-pbonzini@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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

For now move the logic verbatim.  GTK+ actually has a hard requirement
on X11 if gtk+x11 is present, but we will sort that out later.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure      | 14 ++------------
 meson.build    |  9 +++++----
 ui/meson.build |  4 ++--
 3 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index c6d09b225e..e9d76c2c13 100755
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
index a729a30d2f..fdd4312c71 100644
--- a/meson.build
+++ b/meson.build
@@ -783,9 +783,9 @@ if 'CONFIG_VTE' in config_host
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
@@ -1081,6 +1081,7 @@ config_host_data.set('CONFIG_STATX', has_statx)
 config_host_data.set('CONFIG_ZSTD', zstd.found())
 config_host_data.set('CONFIG_FUSE', fuse.found())
 config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
+config_host_data.set('CONFIG_X11', x11.found())
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
 config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
@@ -1167,7 +1168,7 @@ host_kconfig = \
   ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
   ('CONFIG_IVSHMEM' in config_host ? ['CONFIG_IVSHMEM=y'] : []) + \
   ('CONFIG_OPENGL' in config_host ? ['CONFIG_OPENGL=y'] : []) + \
-  ('CONFIG_X11' in config_host ? ['CONFIG_X11=y'] : []) + \
+  (x11.found() ? ['CONFIG_X11=y'] : []) + \
   ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=y'] : []) + \
   ('CONFIG_VHOST_VDPA' in config_host ? ['CONFIG_VHOST_VDPA=y'] : []) + \
   ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=y'] : []) + \
diff --git a/ui/meson.build b/ui/meson.build
index d805448c4e..afbdd78e97 100644
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



