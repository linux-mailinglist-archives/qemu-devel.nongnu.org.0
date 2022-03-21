Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2824E1F76
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 05:15:46 +0100 (CET)
Received: from localhost ([::1]:39950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW9SL-0000NO-2u
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 00:15:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nW9No-0005Ac-JX
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 00:11:04 -0400
Received: from [2607:f8b0:4864:20::c29] (port=35795
 helo=mail-oo1-xc29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nW9Nm-00082a-39
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 00:11:03 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 y27-20020a4a9c1b000000b0032129651bb0so17759657ooj.2
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 21:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MhuFPTfCk4RjPdqBQI4ir7T0lCoIotv5YI31DLkcHm8=;
 b=VoRVhMmxymuufztpwDqEEnnsbOl5HMsNJpT3D2gVDkWy97/6bGT2ZzBBXWwzorNLqs
 1m8p4RKMnX+zsGJhTEd7Kv3z2dZtoox5brB/7ifQHKAodyxNU/w12Td3Agn2yFJwxlAX
 XpCEseyIZ51GwnI0wRuZHiyfkKlT+P/sy9YCgfHm2buURFmXuI5+ODr5FbFYM4Kn2oKK
 HfftclY4RXwxm1+2d3S8jPsAR/5Oyx1ncyS3Xv+qNjqdv8eCVyC6y1VG6eYHkFaT5im/
 oEOeQPmZpo8gOChYBNK277qGK25gx3LUW+UnPXPM0OBmliQLHnA4omRnbZACfDwZQqj5
 CLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MhuFPTfCk4RjPdqBQI4ir7T0lCoIotv5YI31DLkcHm8=;
 b=iiKs9WqwajMEThTNuk/P6oYB+ysqJKreeRklwpRjjci73j9IYs6iuK0g9pbpfUiYEZ
 Pd6xzG+k9wRqOACcb5zu1arlc+WvCAVWM49kVcRR06h8ECITdel0P4Na2+i3DzLaDa2A
 Su2aKPH3Fz3Wz+NE7l0isNuY8gCU7l8n2SjW1YWJksbDAWYDKdrbxat0b+gkkXMZ8pUs
 H6onuGKKR3dKV88sr0fhF+vOSSoo3JTou+BmbNdP91U3EzY66DCC6nszTkUm4ICz1f4Q
 SOb1zbyJ6LO7qGb+4feC+1kFXNhT9I/+xb5OCdS4xvGiqfx14IPikuwnLSEyYUXceEQM
 k2Hw==
X-Gm-Message-State: AOAM5321WYOVyjThRiT6U8NHm2oj//HW1vMLwcaWECagokY3Cij2bVQ2
 6lkMaUotgz/CEFCokaBT2ShkSGmD3uA=
X-Google-Smtp-Source: ABdhPJzDQKMnki+EbpBSgg9jsg1WV2sItONHTgB+0J9nt3dujgtTnpKkPIKIXjqtCBWsJrKG81lx0Q==
X-Received: by 2002:a05:6871:79f:b0:db:1ebf:429d with SMTP id
 o31-20020a056871079f00b000db1ebf429dmr7664688oap.146.1647835860198; 
 Sun, 20 Mar 2022 21:11:00 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:e0e3:734:1053:5eaa])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a9d4d03000000b005b236de8911sm6936593otf.24.2022.03.20.21.10.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 20 Mar 2022 21:10:59 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 1/2] ui/cocoa: Move create_initial_menus
Date: Mon, 21 Mar 2022 13:10:42 +0900
Message-Id: <20220321041043.24112-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220321041043.24112-1-akihiko.odaki@gmail.com>
References: <20220321041043.24112-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc29.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following change would make it use add_console_menu_entries and
addRemovableDevicesMenuItems so it should come after them.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 178 ++++++++++++++++++++++++++---------------------------
 1 file changed, 89 insertions(+), 89 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index cb6e7c41dc6..2f25358f540 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1624,6 +1624,95 @@ - (void)sendEvent:(NSEvent *)event
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
@@ -1715,95 +1804,6 @@ static void create_initial_menus(void)
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


