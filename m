Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536B14C608B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 02:02:07 +0100 (CET)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOUQQ-0002bO-Cb
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 20:02:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOUM2-00055p-KT
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 19:57:34 -0500
Received: from [2607:f8b0:4864:20::536] (port=46952
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOUM0-0004cs-TA
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 19:57:34 -0500
Received: by mail-pg1-x536.google.com with SMTP id o23so10017514pgk.13
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 16:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IM6VwbNeSlgOErfo82BYeQWh1KPCm7vngBaTl/7ROWk=;
 b=fGXkQ0O7AE16WlSe2voh4qSbluwwuyT8+1dGKUpUDsISq2lX9tvrd97W8HvXiA4Pb+
 vCMWmYyTYLRuhVrwGe8EWKuTtRiFpKxq9OcVzn8fCTRfa9dSIOy6RHQtmwYPxkrHImc6
 Q4HXmc3ftc7eXd5c+F3jvai4kzcxFZpnX9vEcjGnAl1iRp/16wnA4ujM375BHO/xBTbQ
 3ZvNcAj9FP3lR56csIO3cYiHhAb5/UmsndWm+ecID3vyA0HlWyrNC8uYjMCmuaxB01HB
 C0TDN1a+C1zgYKyonbDdRzKsTqAFMzC+IsaFZQQWkAnjEDUxY6BqwN4+Iz5AMabmvxbB
 zmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IM6VwbNeSlgOErfo82BYeQWh1KPCm7vngBaTl/7ROWk=;
 b=BSA+HkBoCyFe9+G/g/J3QgqJXYtILItSMzqLxaEu6NesL6GKgLLMAdA91xiq4rDT8H
 u3jjdUxPz10lzo8JvZSNW8lOogotX4wQUxCZ3u1yw7Huas+V4ANeukP6eyRP9UiWAO9a
 3iVQy83mVc+QINxKBpVm7Lji3RV18uTZZU9bbpRdPPDa2/26vO118fKCMMzFjn3nvJhQ
 Tw0p3Fe0APcZXlsHgBDojWpyFjMubgjogYEeXeOjBReQ93SwAIh/R0y5n+pI7jtbJ9tR
 SxmrKcRC0cVggsDTBFgXblcYWL0rlYUspTw7yU6PkT4y8ysmNWjG6BoZx3vHGT9U8ysh
 6iEQ==
X-Gm-Message-State: AOAM5316f+e9nKEiAtUYJuZFg7/xsaSfvww5lh+7opZWDt6IU2DyBpQz
 ppjYT5yt6Vxk2SkZVn3Smv+Eql/xJQo=
X-Google-Smtp-Source: ABdhPJwgUFyHZlHgN72HahYm1ktZQ4BG1F76cUJtypBpc9ou55NkRhKE+/RZfq0CwBywSYVN+WHjtw==
X-Received: by 2002:a63:ef4f:0:b0:375:6898:f6b8 with SMTP id
 c15-20020a63ef4f000000b003756898f6b8mr15236768pgk.59.1646009851491; 
 Sun, 27 Feb 2022 16:57:31 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:6839:3c6:46aa:5d85])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a056a00130100b004df82ad0498sm10634610pfu.82.2022.02.27.16.57.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 27 Feb 2022 16:57:31 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Use the standard about panel
Date: Mon, 28 Feb 2022 09:57:07 +0900
Message-Id: <20220228005710.10442-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220228005710.10442-1-akihiko.odaki@gmail.com>
References: <20220228005710.10442-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x536.google.com
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

This provides standard look and feel for the about panel and reduces
code.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 112 +++++++++++------------------------------------------
 1 file changed, 23 insertions(+), 89 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index a8f1cdaf926..59672fee775 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -83,7 +83,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 
 static void cocoa_refresh(DisplayChangeListener *dcl);
 
-static NSWindow *normalWindow, *about_window;
+static NSWindow *normalWindow;
 static const DisplayChangeListenerOps dcl_ops = {
     .dpy_name          = "cocoa",
     .dpy_gfx_update = cocoa_update,
@@ -1120,7 +1120,6 @@ - (void)changeDeviceMedia:(id)sender;
 - (BOOL)verifyQuit;
 - (void)openDocumentation:(NSString *)filename;
 - (IBAction) do_about_menu_item: (id) sender;
-- (void)make_about_window;
 - (void)adjustSpeed:(id)sender;
 @end
 
@@ -1166,8 +1165,6 @@ - (id) init
         [pauseLabel setFont: [NSFont fontWithName: @"Helvetica" size: 90]];
         [pauseLabel setTextColor: [NSColor blackColor]];
         [pauseLabel sizeToFit];
-
-        [self make_about_window];
     }
     return self;
 }
@@ -1451,92 +1448,29 @@ - (BOOL)verifyQuit
 /* The action method for the About menu item */
 - (IBAction) do_about_menu_item: (id) sender
 {
-    [about_window makeKeyAndOrderFront: nil];
-}
-
-/* Create and display the about dialog */
-- (void)make_about_window
-{
-    /* Make the window */
-    int x = 0, y = 0, about_width = 400, about_height = 200;
-    NSRect window_rect = NSMakeRect(x, y, about_width, about_height);
-    about_window = [[NSWindow alloc] initWithContentRect:window_rect
-                    styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |
-                    NSWindowStyleMaskMiniaturizable
-                    backing:NSBackingStoreBuffered
-                    defer:NO];
-    [about_window setTitle: @"About"];
-    [about_window setReleasedWhenClosed: NO];
-    [about_window center];
-    NSView *superView = [about_window contentView];
-
-    /* Create the dimensions of the picture */
-    int picture_width = 80, picture_height = 80;
-    x = (about_width - picture_width)/2;
-    y = about_height - picture_height - 10;
-    NSRect picture_rect = NSMakeRect(x, y, picture_width, picture_height);
-
-    /* Make the picture of QEMU */
-    NSImageView *picture_view = [[NSImageView alloc] initWithFrame:
-                                                     picture_rect];
-    char *qemu_image_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
-    NSString *qemu_image_path = [NSString stringWithUTF8String:qemu_image_path_c];
-    g_free(qemu_image_path_c);
-    NSImage *qemu_image = [[NSImage alloc] initWithContentsOfFile:qemu_image_path];
-    [picture_view setImage: qemu_image];
-    [picture_view setImageScaling: NSImageScaleProportionallyUpOrDown];
-    [superView addSubview: picture_view];
-
-    /* Make the name label */
-    NSBundle *bundle = [NSBundle mainBundle];
-    if (bundle) {
-        x = 0;
-        y = y - 25;
-        int name_width = about_width, name_height = 20;
-        NSRect name_rect = NSMakeRect(x, y, name_width, name_height);
-        NSTextField *name_label = [[NSTextField alloc] initWithFrame: name_rect];
-        [name_label setEditable: NO];
-        [name_label setBezeled: NO];
-        [name_label setDrawsBackground: NO];
-        [name_label setAlignment: NSTextAlignmentCenter];
-        NSString *qemu_name = [[bundle executablePath] lastPathComponent];
-        [name_label setStringValue: qemu_name];
-        [superView addSubview: name_label];
+    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
+    char *icon_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
+    NSString *icon_path = [NSString stringWithUTF8String:icon_path_c];
+    g_free(icon_path_c);
+    NSImage *icon = [[NSImage alloc] initWithContentsOfFile:icon_path];
+    NSString *version = @"QEMU emulator version " QEMU_FULL_VERSION;
+    NSString *copyright = @QEMU_COPYRIGHT;
+    NSDictionary *options;
+    if (icon) {
+        options = @{
+            NSAboutPanelOptionApplicationIcon : icon,
+            NSAboutPanelOptionApplicationVersion : version,
+            @"Copyright" : copyright,
+        };
+        [icon release];
+    } else {
+        options = @{
+            NSAboutPanelOptionApplicationVersion : version,
+            @"Copyright" : copyright,
+        };
     }
-
-    /* Set the version label's attributes */
-    x = 0;
-    y = 50;
-    int version_width = about_width, version_height = 20;
-    NSRect version_rect = NSMakeRect(x, y, version_width, version_height);
-    NSTextField *version_label = [[NSTextField alloc] initWithFrame:
-                                                      version_rect];
-    [version_label setEditable: NO];
-    [version_label setBezeled: NO];
-    [version_label setAlignment: NSTextAlignmentCenter];
-    [version_label setDrawsBackground: NO];
-
-    /* Create the version string*/
-    NSString *version_string;
-    version_string = [[NSString alloc] initWithFormat:
-    @"QEMU emulator version %s", QEMU_FULL_VERSION];
-    [version_label setStringValue: version_string];
-    [superView addSubview: version_label];
-
-    /* Make copyright label */
-    x = 0;
-    y = 35;
-    int copyright_width = about_width, copyright_height = 20;
-    NSRect copyright_rect = NSMakeRect(x, y, copyright_width, copyright_height);
-    NSTextField *copyright_label = [[NSTextField alloc] initWithFrame:
-                                                        copyright_rect];
-    [copyright_label setEditable: NO];
-    [copyright_label setBezeled: NO];
-    [copyright_label setDrawsBackground: NO];
-    [copyright_label setAlignment: NSTextAlignmentCenter];
-    [copyright_label setStringValue: [NSString stringWithFormat: @"%s",
-                                     QEMU_COPYRIGHT]];
-    [superView addSubview: copyright_label];
+    [NSApp orderFrontStandardAboutPanelWithOptions:options];
+    [pool release];
 }
 
 /* Used by the Speed menu items */
-- 
2.32.0 (Apple Git-132)


