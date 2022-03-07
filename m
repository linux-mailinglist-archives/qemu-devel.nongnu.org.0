Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03BE4D00C9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:12:05 +0100 (CET)
Received: from localhost ([::1]:40458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRE5k-0001B4-P0
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:12:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRDkN-00043a-Vq
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:50:00 -0500
Received: from [2607:f8b0:4864:20::62c] (port=43969
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRDkM-0007jg-2X
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:49:59 -0500
Received: by mail-pl1-x62c.google.com with SMTP id e2so13799459pls.10
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EfTY8TLtEi3OCisjI7SCHQnGUVW3tHzs9UCEtgZJuz0=;
 b=XilTYKZDSUw89raljsBYMconzFClDQGssy628SWWEJxJYn0/FDeNv5X6Q0+LdSs2LQ
 c44BTf39ULqihYaE44cz9Wdr//XjB/Py6KQhoCmonWela/NnauFrSdp8dgTbVs6ruQpv
 7NO7fNOE1j7RdJS7a+Xni7/EbYjLAVnJWwBIiQwbMYjOef/UjA6BCXySIPkXsgqyD6O6
 lWMYkAReA4I3zOsxKfT8CJcklBXwCP21qJqEDunYllrdEdC9MwgXOomrg2wCCPDfk+3F
 TiREJ4eMsvimmkelQDJ6AAouqLhtaBSZH7V3floIb79gzQ3hbZVZ04Ms5frdGEh0JsDi
 FHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EfTY8TLtEi3OCisjI7SCHQnGUVW3tHzs9UCEtgZJuz0=;
 b=2kMbWZCtASzz11YVTemjonBWwRh7zdplZiVOia0TjURiGo3L831kOkncOD6CxqfWOm
 5ir/eI2jShV0X3qjtewfvy5hCKLFf9nvn4EzHlyDo+PMIkSV6H9megi2VTHoSHeM1ZLj
 niiDFoI5JMxzvUkDnQeHTyvJ1qEe1oa9UK0bA1lpOu6DIz6RlT3Bx6q0LRFDJ4v96WwL
 X0jalcrIekLFVBa9Kpjt+hMCYUoA3op1aeRlHILnq2Uzok8zRSJ7LcK3UECZXy/2cyxW
 Rt3Oitx8AR+3bL2n6m58I+a1UzTacFSQCKlsCyrKXvcUBAQhbxgxNC07rTYhQBG0IVyn
 kX7w==
X-Gm-Message-State: AOAM532TEzJPYNin6gIfq3thd+8ynwUqlPO8+5AG6gWBg4+rUJHQ0bCN
 jzlPYD8NMPL9gU+o/NLs/uYPKwXdfIQ=
X-Google-Smtp-Source: ABdhPJwzdgDdTkGIMuLrPsvbPyasjE7LddLY69EKcDlZE1Elhk1cTkPBNC5t5gjwyypuLbfzw1gsMA==
X-Received: by 2002:a17:902:b582:b0:14c:a63d:3df6 with SMTP id
 a2-20020a170902b58200b0014ca63d3df6mr12117861pls.51.1646660996399; 
 Mon, 07 Mar 2022 05:49:56 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:9058:25bf:2793:c7c7])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a17090a168f00b001bf66741097sm3622387pja.16.2022.03.07.05.49.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:49:55 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 1/2] ui/cocoa: Move create_initial_menus
Date: Mon,  7 Mar 2022 22:49:45 +0900
Message-Id: <20220307134946.61407-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220307134946.61407-1-akihiko.odaki@gmail.com>
References: <20220307134946.61407-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following change would make it use add_console_menu_entries and
addRemovableDevicesMenuItems so it should come after them.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 178 ++++++++++++++++++++++++++---------------------------
 1 file changed, 89 insertions(+), 89 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 8ab9ab5e84d..6c6e82afb90 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1604,6 +1604,95 @@ - (void)sendEvent:(NSEvent *)event
 }
 @end
 
+/* Returns a name for a given console */
+static NSString * getConsoleName(QemuConsole * console)
+{
+    g_autofree char *label = qemu_console_get_label(console);
+
+    return [NSString stringWithUTF8String:label];
+}
+
+/* Add an entry to the View menu for each console */
+static void add_console_menu_entries(void)
+{
+    NSMenu *menu;
+    NSMenuItem *menuItem;
+    int index = 0;
+
+    menu = [[[NSApp mainMenu] itemWithTitle:@"View"] submenu];
+
+    [menu addItem:[NSMenuItem separatorItem]];
+
+    while (qemu_console_lookup_by_index(index) != NULL) {
+        menuItem = [[[NSMenuItem alloc] initWithTitle: getConsoleName(qemu_console_lookup_by_index(index))
+                                               action: @selector(displayConsole:) keyEquivalent: @""] autorelease];
+        [menuItem setTag: index];
+        [menu addItem: menuItem];
+        index++;
+    }
+}
+
+/* Make menu items for all removable devices.
+ * Each device is given an 'Eject' and 'Change' menu item.
+ */
+static void addRemovableDevicesMenuItems(void)
+{
+    NSMenu *menu;
+    NSMenuItem *menuItem;
+    BlockInfoList *currentDevice, *pointerToFree;
+    NSString *deviceName;
+
+    currentDevice = qmp_query_block(NULL);
+    pointerToFree = currentDevice;
+
+    menu = [[[NSApp mainMenu] itemWithTitle:@"Machine"] submenu];
+
+    // Add a separator between related groups of menu items
+    [menu addItem:[NSMenuItem separatorItem]];
+
+    // Set the attributes to the "Removable Media" menu item
+    NSString *titleString = @"Removable Media";
+    NSMutableAttributedString *attString=[[NSMutableAttributedString alloc] initWithString:titleString];
+    NSColor *newColor = [NSColor blackColor];
+    NSFontManager *fontManager = [NSFontManager sharedFontManager];
+    NSFont *font = [fontManager fontWithFamily:@"Helvetica"
+                                          traits:NSBoldFontMask|NSItalicFontMask
+                                          weight:0
+                                            size:14];
+    [attString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [titleString length])];
+    [attString addAttribute:NSForegroundColorAttributeName value:newColor range:NSMakeRange(0, [titleString length])];
+    [attString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt: 1] range:NSMakeRange(0, [titleString length])];
+
+    // Add the "Removable Media" menu item
+    menuItem = [NSMenuItem new];
+    [menuItem setAttributedTitle: attString];
+    [menuItem setEnabled: NO];
+    [menu addItem: menuItem];
+
+    /* Loop through all the block devices in the emulator */
+    while (currentDevice) {
+        deviceName = [[NSString stringWithFormat: @"%s", currentDevice->value->device] retain];
+
+        if(currentDevice->value->removable) {
+            menuItem = [[NSMenuItem alloc] initWithTitle: [NSString stringWithFormat: @"Change %s...", currentDevice->value->device]
+                                                  action: @selector(changeDeviceMedia:)
+                                           keyEquivalent: @""];
+            [menu addItem: menuItem];
+            [menuItem setRepresentedObject: deviceName];
+            [menuItem autorelease];
+
+            menuItem = [[NSMenuItem alloc] initWithTitle: [NSString stringWithFormat: @"Eject %s", currentDevice->value->device]
+                                                  action: @selector(ejectDeviceMedia:)
+                                           keyEquivalent: @""];
+            [menu addItem: menuItem];
+            [menuItem setRepresentedObject: deviceName];
+            [menuItem autorelease];
+        }
+        currentDevice = currentDevice->next;
+    }
+    qapi_free_BlockInfoList(pointerToFree);
+}
+
 static void create_initial_menus(void)
 {
     // Add menus
@@ -1695,95 +1784,6 @@ static void create_initial_menus(void)
     [[NSApp mainMenu] addItem:menuItem];
 }
 
-/* Returns a name for a given console */
-static NSString * getConsoleName(QemuConsole * console)
-{
-    g_autofree char *label = qemu_console_get_label(console);
-
-    return [NSString stringWithUTF8String:label];
-}
-
-/* Add an entry to the View menu for each console */
-static void add_console_menu_entries(void)
-{
-    NSMenu *menu;
-    NSMenuItem *menuItem;
-    int index = 0;
-
-    menu = [[[NSApp mainMenu] itemWithTitle:@"View"] submenu];
-
-    [menu addItem:[NSMenuItem separatorItem]];
-
-    while (qemu_console_lookup_by_index(index) != NULL) {
-        menuItem = [[[NSMenuItem alloc] initWithTitle: getConsoleName(qemu_console_lookup_by_index(index))
-                                               action: @selector(displayConsole:) keyEquivalent: @""] autorelease];
-        [menuItem setTag: index];
-        [menu addItem: menuItem];
-        index++;
-    }
-}
-
-/* Make menu items for all removable devices.
- * Each device is given an 'Eject' and 'Change' menu item.
- */
-static void addRemovableDevicesMenuItems(void)
-{
-    NSMenu *menu;
-    NSMenuItem *menuItem;
-    BlockInfoList *currentDevice, *pointerToFree;
-    NSString *deviceName;
-
-    currentDevice = qmp_query_block(NULL);
-    pointerToFree = currentDevice;
-
-    menu = [[[NSApp mainMenu] itemWithTitle:@"Machine"] submenu];
-
-    // Add a separator between related groups of menu items
-    [menu addItem:[NSMenuItem separatorItem]];
-
-    // Set the attributes to the "Removable Media" menu item
-    NSString *titleString = @"Removable Media";
-    NSMutableAttributedString *attString=[[NSMutableAttributedString alloc] initWithString:titleString];
-    NSColor *newColor = [NSColor blackColor];
-    NSFontManager *fontManager = [NSFontManager sharedFontManager];
-    NSFont *font = [fontManager fontWithFamily:@"Helvetica"
-                                          traits:NSBoldFontMask|NSItalicFontMask
-                                          weight:0
-                                            size:14];
-    [attString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [titleString length])];
-    [attString addAttribute:NSForegroundColorAttributeName value:newColor range:NSMakeRange(0, [titleString length])];
-    [attString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt: 1] range:NSMakeRange(0, [titleString length])];
-
-    // Add the "Removable Media" menu item
-    menuItem = [NSMenuItem new];
-    [menuItem setAttributedTitle: attString];
-    [menuItem setEnabled: NO];
-    [menu addItem: menuItem];
-
-    /* Loop through all the block devices in the emulator */
-    while (currentDevice) {
-        deviceName = [[NSString stringWithFormat: @"%s", currentDevice->value->device] retain];
-
-        if(currentDevice->value->removable) {
-            menuItem = [[NSMenuItem alloc] initWithTitle: [NSString stringWithFormat: @"Change %s...", currentDevice->value->device]
-                                                  action: @selector(changeDeviceMedia:)
-                                           keyEquivalent: @""];
-            [menu addItem: menuItem];
-            [menuItem setRepresentedObject: deviceName];
-            [menuItem autorelease];
-
-            menuItem = [[NSMenuItem alloc] initWithTitle: [NSString stringWithFormat: @"Eject %s", currentDevice->value->device]
-                                                  action: @selector(ejectDeviceMedia:)
-                                           keyEquivalent: @""];
-            [menu addItem: menuItem];
-            [menuItem setRepresentedObject: deviceName];
-            [menuItem autorelease];
-        }
-        currentDevice = currentDevice->next;
-    }
-    qapi_free_BlockInfoList(pointerToFree);
-}
-
 @interface QemuCocoaPasteboardTypeOwner : NSObject<NSPasteboardTypeOwner>
 @end
 
-- 
2.32.0 (Apple Git-132)


