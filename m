Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04AD54BC87
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 23:10:53 +0200 (CEST)
Received: from localhost ([::1]:43244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1DoI-0008Eb-Ns
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 17:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Dli-0005ZB-Pt
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:08:10 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Dlg-0007l6-Tf
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:08:10 -0400
Received: by mail-pg1-x532.google.com with SMTP id 123so9603926pgb.5
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 14:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2v2fqfQBBwIobbnCkG9YdJzqBvr3hmOh6z0ss4gpln0=;
 b=lX2APd+AYz0l0dbQh+VPOsQZAOs9xO2Q1opqOGdOZsnx1cIFXRKsFFwcgbWzAiIrA+
 GbRQmBxSnT3AA8RWlijrscg3pdp3vM+JagkX1HPfIGgQ+BPp5EUWOeKZyskR7MOEoo+R
 cLpJTPljA1r1vL/xMUrhmanEaACQnpr2J93btPYNbUSjROALhvaJmZD8FnmIheOfqvqx
 qKwHG1eyH1EIG3ElSU44Vbe76FT6XNKhFjtj8GYhF/s9ciyOf64a1il/FXLEciE+sMtn
 ePO4Q7p+V9Z/KzAXLLC3kOyesEAB785dfmarGKaKawets6QTIYaau7VikysTrDknuwyl
 4aCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2v2fqfQBBwIobbnCkG9YdJzqBvr3hmOh6z0ss4gpln0=;
 b=Z1Zpy0XfzGzYBIFmJu/1t07pO8jUs2yj0SMN/tmY7pTLJpBeFKYE5wPAMRkBVjlCd+
 FXs5kiyFkGSQQAQv4bMgIFIamXe91nZjl5ipScOn5Aa11TnMJ2F0Vk1Tsg6vulNLNiqV
 ULmKMoL7u4NKKtQmkvSVG4rQY8ZBOVMXvboMH4/K3hvlt1AnsmM/z6+z6iQYCRHWUKxf
 +1RWpQdtmwoNXT5t6Cnj6u2M4W2hOBTdHfBJNPFI04nGqa7W3GKNSJIX53nyTkhs1ZYZ
 PcWYZXfVGRtUbXgo8sP16K328vvx5ugo0JBTxsHvTdTaW+GoA8jv5m12IT0QM2PD+NIt
 vu8Q==
X-Gm-Message-State: AOAM531kRuu5xmBvOx9Q1WsPyaWJ7R+7R8sjardqYPEBjIXgz9tVP5zU
 h0zU430BIG2+gpDq2cPEBOXEfUkVTp4=
X-Google-Smtp-Source: ABdhPJxZBZGbnpYFilEQ0OEST6W1f8pSr0tIRC41Pl+UWVh1qq/MIzMTASbxLl43DZdoyVFlb6/eag==
X-Received: by 2002:a63:d60a:0:b0:3d8:22cb:9224 with SMTP id
 q10-20020a63d60a000000b003d822cb9224mr5970533pgg.548.1655240885048; 
 Tue, 14 Jun 2022 14:08:05 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d5aa:1806:cce3:7773])
 by smtp.gmail.com with ESMTPSA id
 h65-20020a62de44000000b0050dc762813csm8129456pfg.22.2022.06.14.14.08.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Jun 2022 14:08:04 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v4 3/4] ui/icons: Use bundle mechanism
Date: Wed, 15 Jun 2022 06:07:45 +0900
Message-Id: <20220614210746.78911-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220614210746.78911-1-akihiko.odaki@gmail.com>
References: <20220614210746.78911-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 meson.build          |  2 +-
 ui/cocoa.m           | 29 ++++++++++++++++-------------
 ui/gtk.c             |  6 +++++-
 ui/icons/meson.build | 36 ++++++++++++++++++++++++++++--------
 ui/sdl2.c            | 18 +++++++++++-------
 5 files changed, 61 insertions(+), 30 deletions(-)

diff --git a/meson.build b/meson.build
index c573815813f..e7b385eaf34 100644
--- a/meson.build
+++ b/meson.build
@@ -1687,7 +1687,7 @@ config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_DATADIR', qemu_datadir)
 config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
 config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('prefix') / get_option('qemu_firmwarepath'))
 config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
-config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', get_option('prefix') / qemu_icondir)
+config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_ICONDIR', qemu_icondir)
 config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix') / get_option('localedir'))
 config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') / get_option('localstatedir'))
 config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 84c84e98fc5..bd8a3211d3b 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1562,21 +1562,24 @@ - (BOOL)verifyQuit
 - (IBAction) do_about_menu_item: (id) sender
 {
     NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
-    char *icon_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
-    NSString *icon_path = [NSString stringWithUTF8String:icon_path_c];
-    g_free(icon_path_c);
-    NSImage *icon = [[NSImage alloc] initWithContentsOfFile:icon_path];
+    char *icon_path_c = find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR "/hicolor/512x512/apps/qemu.png");
     NSString *version = @"QEMU emulator version " QEMU_FULL_VERSION;
     NSString *copyright = @QEMU_COPYRIGHT;
-    NSDictionary *options;
-    if (icon) {
-        options = @{
-            NSAboutPanelOptionApplicationIcon : icon,
-            NSAboutPanelOptionApplicationVersion : version,
-            @"Copyright" : copyright,
-        };
-        [icon release];
-    } else {
+    NSDictionary *options = nil;
+    if (icon_path_c) {
+        NSString *icon_path = [NSString stringWithUTF8String:icon_path_c];
+        g_free(icon_path_c);
+        NSImage *icon = [[NSImage alloc] initWithContentsOfFile:icon_path];
+        if (icon) {
+            options = @{
+                NSAboutPanelOptionApplicationIcon : icon,
+                NSAboutPanelOptionApplicationVersion : version,
+                @"Copyright" : copyright,
+            };
+            [icon release];
+        }
+    }
+    if (!options) {
         options = @{
             NSAboutPanelOptionApplicationVersion : version,
             @"Copyright" : copyright,
diff --git a/ui/gtk.c b/ui/gtk.c
index 2a791dd2aa0..8f7afe795f4 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2321,7 +2321,11 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     s->opts = opts;
 
     theme = gtk_icon_theme_get_default();
-    dir = get_relocated_path(CONFIG_QEMU_ICONDIR);
+    dir = find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR);
+    if (dir) {
+        gtk_icon_theme_prepend_search_path(theme, dir);
+        g_free(dir);
+    }
     gtk_icon_theme_prepend_search_path(theme, dir);
     g_free(dir);
     g_set_prgname("qemu");
diff --git a/ui/icons/meson.build b/ui/icons/meson.build
index 12c52080ebd..23292773074 100644
--- a/ui/icons/meson.build
+++ b/ui/icons/meson.build
@@ -1,13 +1,33 @@
+icons = [
+  {
+    'source': 'qemu_32x32.bmp',
+    'install': 'hicolor' / '32x32' / 'apps' / 'qemu.bmp',
+  },
+  {
+    'source': 'qemu.svg',
+    'install': 'hicolor' / 'scalable' / 'apps' / 'qemu.svg',
+  },
+]
+
 foreach s: [16, 24, 32, 48, 64, 128, 256, 512]
   s = '@0@x@0@'.format(s.to_string())
-  install_data('qemu_@0@.png'.format(s),
-               rename: 'qemu.png',
-               install_dir: qemu_icondir / 'hicolor' / s / 'apps')
+  icons += {
+    'source': 'qemu_@0@.png'.format(s),
+    'install': 'hicolor' / s / 'apps' / 'qemu.png',
+  }
 endforeach
 
-install_data('qemu_32x32.bmp',
-             rename: 'qemu.bmp',
-             install_dir: qemu_icondir / 'hicolor' / '32x32' / 'apps')
+foreach icon: icons
+  source = icon.get('source')
+  install = icon.get('install')
+
+  install_data(source,
+               rename: fs.name(install),
+               install_dir: qemu_icondir / fs.parent(install))
 
-install_data('qemu.svg',
-             install_dir: qemu_icondir / 'hicolor' / 'scalable' / 'apps')
+  run_command('mkdir', '-p', qemu_bundledir / qemu_icondir / fs.parent(install),
+              check: true)
+
+  run_command('ln', '-sf', meson.current_source_dir() / source, qemu_bundledir / qemu_icondir / install,
+              check: true)
+endforeach
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 8cb77416af2..bbcb4762e1b 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -910,15 +910,19 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
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
2.32.1 (Apple Git-133)


