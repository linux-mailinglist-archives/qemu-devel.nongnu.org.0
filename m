Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D6954D048
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 19:46:26 +0200 (CEST)
Received: from localhost ([::1]:41044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1X61-0001AN-Ha
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 13:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1WuC-0007X1-BB
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 13:34:12 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:38439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1WuA-0006rK-Qv
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 13:34:12 -0400
Received: by mail-pl1-x62a.google.com with SMTP id m14so596858plg.5
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 10:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DQtJaRgK10AOuN9AFp97oqWrDlmZlm3MK6vebjeI1so=;
 b=muNjtjQ4ULT08aZJ57j0hH2r7+mR4kfCOOAWnHkSaqf6V6ALuecv+wbM7DDCyoWPMf
 xCu06KxaCCtTVGwOLRd71Z2vYNPfTE1WAq1Z0DVk2FDV4MSIFl/FPYft4o+5pALsxb37
 kWzdHEvBMl9uS0snExRSncbtW5nP+IB/GK1qM/u/QC0sm+cbVNhZez6sJgkw32FPV3y3
 q7o6wbPRJNy8h2REf+T7AuAgCI1Amz1HhLv65q+SCR3dwL08M0erixGdgBJGcmnZFwSU
 1jXrrrUMziqLHdu8vw02zV5BPIoRwX4iqywoM434Mm/8S9CMIZTDG3blWdVHi5pQkD5G
 s26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DQtJaRgK10AOuN9AFp97oqWrDlmZlm3MK6vebjeI1so=;
 b=A5HNVBXieyqYX5zP5J7MlD8++xM4+fzcXC2NuC+aGEc+xFU0LZ+ceWDGlU74Qs8xNp
 pSJHAQhY8NOYyBSHUJ1f+5/wJPK2zy91m/6fQF78QcKmrPvDWSP5Lj93pQ6XfHxK/E3u
 niPXKcbS7Fa+nX0ZbTrukRgCssmRRPa3HvHTuTKQ0WDmBno6l0Q4KGFNU6ucXuefaJOB
 99eIslJgm7hqDqmqrX/BILfNhEYdQVvVuOzNUhBocBwzd0JDqBq25WFVEYZDqqPQOmYU
 3XYwX3plakx/NxJHXxOA2AHN6RgY49jC0ZPpE39W2ScDG9iyll5b9wEPFwnt+cZTzpu0
 AQtw==
X-Gm-Message-State: AJIora+5BY71TrvCwn9ug01kkZZUZhYZL4O4X/D4D3yk0WfByziFRZyn
 APIQ2sDhjfyN86Dzwlv8O2I=
X-Google-Smtp-Source: AGRyM1utmXnuvvWx1T1DGyyKsXQbuYVu4yIsr1S9jlq6jekjBXW6py10XIw4FyC5Jqh+v1E+he6LYw==
X-Received: by 2002:a17:902:74c8:b0:167:93c0:c30d with SMTP id
 f8-20020a17090274c800b0016793c0c30dmr695493plt.109.1655314449568; 
 Wed, 15 Jun 2022 10:34:09 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a633c4d000000b003fcf1279c84sm10171451pgn.33.2022.06.15.10.34.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 10:34:08 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v7 5/6] ui/icons: Use bundle mechanism
Date: Thu, 16 Jun 2022 02:33:44 +0900
Message-Id: <20220615173345.32456-6-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220615173345.32456-1-akihiko.odaki@gmail.com>
References: <20220615173345.32456-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62a.google.com
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
 ui/cocoa.m           |  2 +-
 ui/gtk.c             |  2 +-
 ui/icons/meson.build | 32 ++++++++++++++++++++++++--------
 ui/sdl2.c            |  4 ++--
 4 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 84c84e98fc5..25584cc78ce 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1562,7 +1562,7 @@ - (BOOL)verifyQuit
 - (IBAction) do_about_menu_item: (id) sender
 {
     NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
-    char *icon_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
+    char *icon_path_c = find_bundle(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
     NSString *icon_path = [NSString stringWithUTF8String:icon_path_c];
     g_free(icon_path_c);
     NSImage *icon = [[NSImage alloc] initWithContentsOfFile:icon_path];
diff --git a/ui/gtk.c b/ui/gtk.c
index 2a791dd2aa0..27d5a3407cf 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2321,7 +2321,7 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     s->opts = opts;
 
     theme = gtk_icon_theme_get_default();
-    dir = get_relocated_path(CONFIG_QEMU_ICONDIR);
+    dir = find_bundle(CONFIG_QEMU_ICONDIR);
     gtk_icon_theme_prepend_search_path(theme, dir);
     g_free(dir);
     g_set_prgname("qemu");
diff --git a/ui/icons/meson.build b/ui/icons/meson.build
index 12c52080ebd..1d99aff10ed 100644
--- a/ui/icons/meson.build
+++ b/ui/icons/meson.build
@@ -1,13 +1,29 @@
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
+  bundles += { qemu_bundledir / qemu_icondir / install: meson.current_source_dir() / source }
+endforeach
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 8cb77416af2..916815cc8a2 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -910,11 +910,11 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
     }
 
 #ifdef CONFIG_SDL_IMAGE
-    dir = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/128x128/apps/qemu.png");
+    dir = find_bundle(CONFIG_QEMU_ICONDIR "/hicolor/128x128/apps/qemu.png");
     icon = IMG_Load(dir);
 #else
     /* Load a 32x32x4 image. White pixels are transparent. */
-    dir = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/32x32/apps/qemu.bmp");
+    dir = find_bundle(CONFIG_QEMU_ICONDIR "/hicolor/32x32/apps/qemu.bmp");
     icon = SDL_LoadBMP(dir);
     if (icon) {
         uint32_t colorkey = SDL_MapRGB(icon->format, 255, 255, 255);
-- 
2.32.1 (Apple Git-133)


