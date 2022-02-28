Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4C64C6089
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 02:01:59 +0100 (CET)
Received: from localhost ([::1]:53074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOUQJ-0002Mh-2a
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 20:01:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOUM7-0005En-NW
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 19:57:39 -0500
Received: from [2607:f8b0:4864:20::429] (port=45743
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOUM5-0004eY-MO
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 19:57:39 -0500
Received: by mail-pf1-x429.google.com with SMTP id u16so9556605pfg.12
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 16:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dPuzGEBcEqdlsA6JeaKEgUYjkg87ycyuZGvU6x1HEk4=;
 b=a9fay6rFs2atTUwR28jt/JypWaOEuZKbbEO59GmIhtaUwJIdk57j6XoaIXyvUMLfib
 AXjCzTaiDeZmd2sjwx5hcgHFcwFY7KhtzjwmT7kaQa7grHDvzZ0cVwqnJB8b+ATN9Hse
 lCgVSAyyMKUduG4sWcwJCILzp/YveIDTyok59MyKA8Q/GlPzRaBIc2jV3jXmsKBt0UIS
 DQyNGceyGFhuDT/Z5Jada8Cx0ybey0LtQWhqwalROQPq1LxBiZ4IayEIPC+OBdDRKcP0
 J0LUNEBSVxeiIo3G9nAQQ4vyh8+WAA7fBhZ/ZsbtWcGzpR8AT/mWAeP8XemQqmoGVwzc
 1B0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dPuzGEBcEqdlsA6JeaKEgUYjkg87ycyuZGvU6x1HEk4=;
 b=dwqHJZkBfIMSh+6aTXLXyOe+nIo51EVJRSxBoT8sp4ydXsMBTUnktCO+4497h82AI1
 oA11ko1DuJNH/HspRsl21FmYsuDY1Lhdv7i5EfsL/YyZJUHlocF/RqXEtRNmmHzEzm+4
 AatAovApPAam7Ze803FjFVSuW43GK730UcJgI7YH0+pxUwyw0kOKtmKwwLVFO724Qk/j
 CYkD704Q7m9v9EyNcFb2aDxqP2ah2G7BoG8SgF3/Sy4AyB/gZPfAx17bb0M+zHuYCVN3
 wGDUryPJgZt5oeXizSr42GHfKHgrXR0DcUBFQk08ZOs8NOEudxkqcylDBWs48MzHkRhX
 K3eg==
X-Gm-Message-State: AOAM530lV/wEsmySKqa2BcUCaiVrxsk1nxo7truHUYXiMkiYrhglxLdN
 MB3ztS0lG9KH+rwhfXlEAaC6LTn2FQc=
X-Google-Smtp-Source: ABdhPJwGLyn3PI9cVDqcnDWNLdbeOo1enxJRFix4OdzIedKfk37Q/jrzkdG1TDEbjN86Efk8fwe+Cw==
X-Received: by 2002:a63:2c91:0:b0:373:7200:d079 with SMTP id
 s139-20020a632c91000000b003737200d079mr15328518pgs.65.1646009856334; 
 Sun, 27 Feb 2022 16:57:36 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:6839:3c6:46aa:5d85])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a056a00130100b004df82ad0498sm10634610pfu.82.2022.02.27.16.57.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 27 Feb 2022 16:57:36 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 3/4] ui/icons: Use bundle mechanism
Date: Mon, 28 Feb 2022 09:57:09 +0900
Message-Id: <20220228005710.10442-5-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220228005710.10442-1-akihiko.odaki@gmail.com>
References: <20220228005710.10442-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x429.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
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


