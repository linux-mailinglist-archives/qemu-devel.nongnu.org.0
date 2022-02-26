Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2944C55FC
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 13:59:12 +0100 (CET)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNwfH-0002fi-5l
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 07:59:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNwSS-0001Pn-3O
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 07:45:57 -0500
Received: from [2607:f8b0:4864:20::52b] (port=37556
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNwSO-0003Kk-SO
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 07:45:54 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 75so7218795pgb.4
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 04:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dPuzGEBcEqdlsA6JeaKEgUYjkg87ycyuZGvU6x1HEk4=;
 b=mWe5MLSC4VGeBzNy9WiMp6e6+eXir4Z8lxuHUM5L0NFRP5rg9c33TAVmJzXUVc+ZN8
 XzMH0eJ160TS0TqTOw3OvmTjF+12aO/dzD9BC0PSCH24rKyBwYX6yEWuPn6HCwQu6T+3
 Ept/yLXwG6WIzb5ZQOa2Xk4S3mdbOPVIaRL94gBr4rMS0xwHwBeh8mzqYrqnTMIs95t2
 pRysxKowcfAtfN7EVUL9xRde66ztEONLgFvj21ZSJhx51mYi6MwK5Ddk+S25SImehrpQ
 RT5xsYsjMnpKmWhA7OO1qHoO4g1TXI8xtDJu2Sh/mF/lqkrNNUXvyQ1X30YTVZnqXGyl
 YBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dPuzGEBcEqdlsA6JeaKEgUYjkg87ycyuZGvU6x1HEk4=;
 b=SkuLzJsVdYbQwrGpzjREyVOZqQEj3ZqkhDHrFQYOzGVsekrOm9Q7IXWIfNKN9dHvN4
 gKsq5FPJMPnlpNKFvHQXZ5gkKgwd4WSgFGtyx+DW3lCK3C0PNQHCj8y2G0XsIn+kPM1x
 KeAJlKS92p23jjQHtIuml/La5rJI8YHv5Ja+6RR7H7+KEI2EhCpgg4YxsmaKe81iCEoC
 wso1hdqkfS3M3qfVuDN8MIuRekMvdsoV4PDwGE66smTs05951mvZ91vAHoEz1Jg3twTi
 Yw5eMcDTLyq5cqWLXPH6i9e211Urx0DwsM12HaLSx9HXEa4ARX5uIkAQv+l0QPx1Ra+2
 /E6w==
X-Gm-Message-State: AOAM5337eruiAqxpG3Fi63Q4teay+yMitm+AWrgPkQBADyK+lCc96z+U
 81FEq6LIe9hXTMROUPRF2rPSkP4YunM=
X-Google-Smtp-Source: ABdhPJzeydso1j03mr5yIkRSakuJIKhU2TXzNx5Yb0tOwlWa1ifyA05b4QFL+RHkRtimYhM4P7ZviQ==
X-Received: by 2002:a05:6a00:24c4:b0:4cb:7324:bfd with SMTP id
 d4-20020a056a0024c400b004cb73240bfdmr12656895pfv.60.1645879551513; 
 Sat, 26 Feb 2022 04:45:51 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a17090a438400b001bc6d52de70sm11725653pjg.24.2022.02.26.04.45.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 04:45:51 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 3/4] ui/icons: Use bundle mechanism
Date: Sat, 26 Feb 2022 21:45:34 +0900
Message-Id: <20220226124535.76885-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220226124535.76885-1-akihiko.odaki@gmail.com>
References: <20220226124535.76885-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 configure   | 10 ++++++++++
 meson.build |  3 +--
 ui/cocoa.m  | 20 +++++++++++---------
 ui/gtk.c    |  8 +++++---
 ui/sdl2.c   | 18 +++++++++++-------
 5 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/configure b/configure
index fda1a35cbc0..80d36a85bc5 100755
--- a/configure
+++ b/configure
@@ -3089,6 +3089,16 @@ for f in $LINKS ; do
     fi
 done
 
+for icon_extension in bmp png ; do
+  for icon_file in $source_path/ui/icons/qemu_*.$icon_extension ; do
+    icon_basename=${icon_file%.$icon_extension}
+    icon_name=${icon_basename#$source_path/ui/icons/qemu_}
+    icon_dir=qemu-bundle/share/icons/hicolor/$icon_name/apps
+    symlink $icon_file $icon_dir/qemu.$icon_extension
+  done
+done
+
+symlink $source_path/ui/icons/qemu.svg qemu-bundle/share/icons/hicolor/scalable/apps/qemu.svg
 symlink ../../pc-bios qemu-bundle/share/qemu
 
 (for i in $cross_cc_vars; do
diff --git a/meson.build b/meson.build
index a2c987b41d6..f7e64a74545 100644
--- a/meson.build
+++ b/meson.build
@@ -1472,8 +1472,7 @@ config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_c
 config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_DATADIR', qemu_datadir)
 config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
 config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('qemu_firmwarepath'))
-config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
-config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', get_option('prefix') / qemu_icondir)
+config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_ICONDIR', qemu_icondir)
 config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix') / get_option('localedir'))
 config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') / get_option('localstatedir'))
 config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
diff --git a/ui/cocoa.m b/ui/cocoa.m
index a8f1cdaf926..e5e49c50fbb 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1477,15 +1477,17 @@ - (void)make_about_window
     NSRect picture_rect = NSMakeRect(x, y, picture_width, picture_height);
 
     /* Make the picture of QEMU */
-    NSImageView *picture_view = [[NSImageView alloc] initWithFrame:
-                                                     picture_rect];
-    char *qemu_image_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
-    NSString *qemu_image_path = [NSString stringWithUTF8String:qemu_image_path_c];
-    g_free(qemu_image_path_c);
-    NSImage *qemu_image = [[NSImage alloc] initWithContentsOfFile:qemu_image_path];
-    [picture_view setImage: qemu_image];
-    [picture_view setImageScaling: NSImageScaleProportionallyUpOrDown];
-    [superView addSubview: picture_view];
+    char *qemu_image_path_c = find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR "/hicolor/512x512/apps/qemu.png");
+    if (qemu_image_path_c) {
+        NSString *qemu_image_path = [NSString stringWithUTF8String:qemu_image_path_c];
+        g_free(qemu_image_path_c);
+        NSImageView *picture_view = [[NSImageView alloc] initWithFrame:
+                                                         picture_rect];
+        NSImage *qemu_image = [[NSImage alloc] initWithContentsOfFile:qemu_image_path];
+        [picture_view setImage: qemu_image];
+        [picture_view setImageScaling: NSImageScaleProportionallyUpOrDown];
+        [superView addSubview: picture_view];
+    }
 
     /* Make the name label */
     NSBundle *bundle = [NSBundle mainBundle];
diff --git a/ui/gtk.c b/ui/gtk.c
index a8567b9ddc8..a86d1c126f0 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2296,9 +2296,11 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     s->opts = opts;
 
     theme = gtk_icon_theme_get_default();
-    dir = get_relocated_path(CONFIG_QEMU_ICONDIR);
-    gtk_icon_theme_prepend_search_path(theme, dir);
-    g_free(dir);
+    dir = find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR);
+    if (dir) {
+        gtk_icon_theme_prepend_search_path(theme, dir);
+        g_free(dir);
+    }
     g_set_prgname("qemu");
 
     s->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 46a252d7d9d..9d1f6e74cb5 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -893,15 +893,19 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
     }
 
 #ifdef CONFIG_SDL_IMAGE
-    dir = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/128x128/apps/qemu.png");
-    icon = IMG_Load(dir);
+    dir = find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR "/hicolor/128x128/apps/qemu.png");
+    if (dir) {
+        icon = IMG_Load(dir);
+    }
 #else
     /* Load a 32x32x4 image. White pixels are transparent. */
-    dir = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/32x32/apps/qemu.bmp");
-    icon = SDL_LoadBMP(dir);
-    if (icon) {
-        uint32_t colorkey = SDL_MapRGB(icon->format, 255, 255, 255);
-        SDL_SetColorKey(icon, SDL_TRUE, colorkey);
+    dir = find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR "/hicolor/32x32/apps/qemu.bmp");
+    if (dir) {
+        icon = SDL_LoadBMP(dir);
+        if (icon) {
+            uint32_t colorkey = SDL_MapRGB(icon->format, 255, 255, 255);
+            SDL_SetColorKey(icon, SDL_TRUE, colorkey);
+        }
     }
 #endif
     g_free(dir);
-- 
2.32.0 (Apple Git-132)


