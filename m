Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF8254CECE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:35:28 +0200 (CEST)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1VzL-0005MY-Nx
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1VOE-00008f-GQ
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:57:06 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1VOC-00087u-Tl
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:57:06 -0400
Received: by mail-pl1-x62b.google.com with SMTP id f9so10819483plg.0
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 08:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DQtJaRgK10AOuN9AFp97oqWrDlmZlm3MK6vebjeI1so=;
 b=DPQ6dIFnu6Wz34BQAap1dhuD72PkXzZCiVClN6BSKmsVmYdODu915TobJPSwRsdI3t
 7kzkM/6Yepkib4VJbpduhZ2eNEkz8jEwyJCPkuzAhhFjaI4HZXcT4UZz+APEfG5wnA9q
 w9KeIS0hWwiywQt3N49C13zEjEhNR7CLW5Jxw5m1umsi4/wKZ8v2uFCfiVc0x1+dukpV
 sx/AbX1oKdDySSVFwl9TgkqT8EXCGhmrkVW3D0jeJNO9uuDzpT7wZMYt5ZYC5bNoyFPN
 OVekeE5a6KhJHs5kN7mno/zHpMJLsMgDmrTWE6dtmhUwJgn0onrSYQ42MBzd0HgH3YNY
 yDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DQtJaRgK10AOuN9AFp97oqWrDlmZlm3MK6vebjeI1so=;
 b=AMqvuG9R0cp4oVvUO/dI+Fj9Yp9ojjkV63vM9EPbgGYP1rqLg/EKRg8CyfopGZCvmw
 7pLghvM95Gv2JX/+DiBr78SiERmTauBTt9xmGQDuEtR8/h2kl0PJe7poItD2j3wOkaR0
 PXzxRNmA6oUKOBiPwzVpZRRNocyFEn6GxextuBmmAtIfJLM487lC90y7pHVKb0L3cvJb
 6F3PjlvmyHjphRMK2gJwXFdtwJakxK6NeJNjZNFwo6T9saMT2E5ZZuuxYBlUou/FYPkz
 To+OXoTs8Kz6HGIteXgjB8jDpnvLO9pxNN6k2rhd34JeTn3kMvujM2MXkLEnzmwukAjX
 NXsQ==
X-Gm-Message-State: AJIora/J2KayjNYGcqFycG1szInhnxX9pk+0GjSxfZ3vEzTk9THczCRD
 9D+ULbyD3LaC2PL2Gxqm0LI=
X-Google-Smtp-Source: AGRyM1ti5gJP4STBKlRjs8KANz+ER6clcbEZ80FAyFsiZEw86R4Rh6u2jqwJRdk+t9U47m14Lw4ywQ==
X-Received: by 2002:a17:902:ecc2:b0:163:fe60:43cd with SMTP id
 a2-20020a170902ecc200b00163fe6043cdmr242963plh.43.1655308624163; 
 Wed, 15 Jun 2022 08:57:04 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 a34-20020a056a001d2200b0051874318772sm9860038pfx.201.2022.06.15.08.57.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 08:57:03 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v6 6/7] ui/icons: Use bundle mechanism
Date: Thu, 16 Jun 2022 00:56:33 +0900
Message-Id: <20220615155634.578-7-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220615155634.578-1-akihiko.odaki@gmail.com>
References: <20220615155634.578-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62b.google.com
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


