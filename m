Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0F04D00DA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:14:08 +0100 (CET)
Received: from localhost ([::1]:44908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRE7j-0004GI-76
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:14:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRDkP-000475-MW
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:50:03 -0500
Received: from [2607:f8b0:4864:20::102f] (port=35743
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRDkN-0007jp-Oj
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:50:01 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso13338456pjb.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fC0I4u+vWOgSM0UukBH5UPvzAJhk5E76i7ScCIK/+pg=;
 b=md4xgTeD1jEr1TG/kNETuRmmtWA3/HjW8WwvQnP6M9kpdNF5I0pMCOFcaHRxFa3IFH
 ZumafnZ0B9NbtWsnhRXLznNkWh3sDBwwFja0+vwgVUbUq3j6yt18j8WS9Iz8OzVumVHR
 ghejrulp+Z6xikALtPl/zhLqcnIV063mkxjNzFvVSpflzXl6BJ+9lQNp0Uc4FPKSgRSk
 wqccv4knbQyOmM2lzqJiW8u4IEZzfLeXuy10R0mj4oYiVymZ5DcYwA26QZ33m/cui/Lp
 Cmq23akqlDRuzBWKeR3RSWy+4QyiDx6vNvRRug3JQ4Msh4p9OfccFHVh1tf/49iX3hP3
 L6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fC0I4u+vWOgSM0UukBH5UPvzAJhk5E76i7ScCIK/+pg=;
 b=zMkrYQ/JrhN83sjbHtKagbUV5e7i+oT1EmbLizU/hZyk3cc4wTnKuXfcW+3Q9Ax9/Q
 hRy4IwUngv0O8TuBEQeJMhK8rwGFU2wsDsuc7GXhqCQ4UTPgQ09JXqoUFonds4kWHjNZ
 G8+RLhBRzEQe6NPCfPKJF1Qm0lGFgUXLReNMxINgRmmQYAb3rC7uGkWAw0p03xXfxiw2
 rBPsGUT4ovWo7hwwAty3SGFsJ+wyHnJYot/9FN6j3JZTvTI55k8pna9Fgf1LamIRaj6n
 YSBtB12kQcAV2KpErmvdArH4vHS6KocUyOl7pamGr2WkSnZs0yeKPgDnonXHd8AX0AhG
 rGvw==
X-Gm-Message-State: AOAM532pMBm6Hv2dmnUYUGohlNntyAI0Czo3iHnuUMbDKjI62G2BRkfw
 PZkyMcXTD+ItcQOqPiKr//GeH7+htIQ=
X-Google-Smtp-Source: ABdhPJyjM0hbsxm54w+0wGMSPjdF88jcUSo+Yy7DFZHpMbbMnGlAO8E3AvqNl6TQU5Hu8aVDsIuDbQ==
X-Received: by 2002:a17:902:d485:b0:151:f798:c8da with SMTP id
 c5-20020a170902d48500b00151f798c8damr1029743plg.108.1646660998199; 
 Mon, 07 Mar 2022 05:49:58 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:9058:25bf:2793:c7c7])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a17090a168f00b001bf66741097sm3622387pja.16.2022.03.07.05.49.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:49:57 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 2/2] ui/cocoa: Create menus in iothread
Date: Mon,  7 Mar 2022 22:49:46 +0900
Message-Id: <20220307134946.61407-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220307134946.61407-1-akihiko.odaki@gmail.com>
References: <20220307134946.61407-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102f.google.com
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

Commit 0439c5a4623d674efa0c72abd62ca6e98bb7cf87 introduced an
assertion that blk_all_next is called in the main thread. The function
is called in the following chain:
- blk_all_next
- qmp_query_block
- addRemovableDevicesMenuItems
- main

This change moves the menu creation to the iothread. This also changes
the menu creation procedure to construct the entire menu tree before
setting to NSApp, which is necessary because a menu set once cannot be
modified if NSApp is already running.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 59 +++++++++++++++++++++---------------------------------
 1 file changed, 23 insertions(+), 36 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 6c6e82afb90..edacbef9f7a 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1613,14 +1613,11 @@ - (void)sendEvent:(NSEvent *)event
 }
 
 /* Add an entry to the View menu for each console */
-static void add_console_menu_entries(void)
+static void add_console_menu_entries(NSMenu *menu)
 {
-    NSMenu *menu;
     NSMenuItem *menuItem;
     int index = 0;
 
-    menu = [[[NSApp mainMenu] itemWithTitle:@"View"] submenu];
-
     [menu addItem:[NSMenuItem separatorItem]];
 
     while (qemu_console_lookup_by_index(index) != NULL) {
@@ -1635,9 +1632,8 @@ static void add_console_menu_entries(void)
 /* Make menu items for all removable devices.
  * Each device is given an 'Eject' and 'Change' menu item.
  */
-static void addRemovableDevicesMenuItems(void)
+static void addRemovableDevicesMenuItems(NSMenu *menu)
 {
-    NSMenu *menu;
     NSMenuItem *menuItem;
     BlockInfoList *currentDevice, *pointerToFree;
     NSString *deviceName;
@@ -1645,8 +1641,6 @@ static void addRemovableDevicesMenuItems(void)
     currentDevice = qmp_query_block(NULL);
     pointerToFree = currentDevice;
 
-    menu = [[[NSApp mainMenu] itemWithTitle:@"Machine"] submenu];
-
     // Add a separator between related groups of menu items
     [menu addItem:[NSMenuItem separatorItem]];
 
@@ -1693,17 +1687,19 @@ static void addRemovableDevicesMenuItems(void)
     qapi_free_BlockInfoList(pointerToFree);
 }
 
-static void create_initial_menus(void)
+static void create_menus(void)
 {
     // Add menus
+    NSString    *title = [[[NSBundle mainBundle] executablePath] lastPathComponent];
+    NSMenu      *mainMenu;
     NSMenu      *menu;
     NSMenuItem  *menuItem;
 
-    [NSApp setMainMenu:[[NSMenu alloc] init]];
+    mainMenu = [[NSMenu alloc] initWithTitle:@"Main Menu"];
     [NSApp setServicesMenu:[[NSMenu alloc] initWithTitle:@"Services"]];
 
     // Application menu
-    menu = [[NSMenu alloc] initWithTitle:@""];
+    menu = [[NSMenu alloc] initWithTitle:title];
     [menu addItemWithTitle:@"About QEMU" action:@selector(do_about_menu_item:) keyEquivalent:@""]; // About QEMU
     [menu addItem:[NSMenuItem separatorItem]]; //Separator
     menuItem = [menu addItemWithTitle:@"Services" action:nil keyEquivalent:@""];
@@ -1715,10 +1711,8 @@ static void create_initial_menus(void)
     [menu addItemWithTitle:@"Show All" action:@selector(unhideAllApplications:) keyEquivalent:@""]; // Show All
     [menu addItem:[NSMenuItem separatorItem]]; //Separator
     [menu addItemWithTitle:@"Quit QEMU" action:@selector(terminate:) keyEquivalent:@"q"];
-    menuItem = [[NSMenuItem alloc] initWithTitle:@"Apple" action:nil keyEquivalent:@""];
+    menuItem = [mainMenu addItemWithTitle:title action:nil keyEquivalent:@""];
     [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
-    [NSApp performSelector:@selector(setAppleMenu:) withObject:menu]; // Workaround (this method is private since 10.4+)
 
     // Machine menu
     menu = [[NSMenu alloc] initWithTitle: @"Machine"];
@@ -1730,17 +1724,17 @@ static void create_initial_menus(void)
     [menu addItem: [NSMenuItem separatorItem]];
     [menu addItem: [[[NSMenuItem alloc] initWithTitle: @"Reset" action: @selector(restartQEMU:) keyEquivalent: @""] autorelease]];
     [menu addItem: [[[NSMenuItem alloc] initWithTitle: @"Power Down" action: @selector(powerDownQEMU:) keyEquivalent: @""] autorelease]];
-    menuItem = [[[NSMenuItem alloc] initWithTitle: @"Machine" action:nil keyEquivalent:@""] autorelease];
+    addRemovableDevicesMenuItems(menu);
+    menuItem = [mainMenu addItemWithTitle: @"Machine" action:nil keyEquivalent:@""];
     [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
 
     // View menu
     menu = [[NSMenu alloc] initWithTitle:@"View"];
     [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Enter Fullscreen" action:@selector(doToggleFullScreen:) keyEquivalent:@"f"] autorelease]]; // Fullscreen
     [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Zoom To Fit" action:@selector(zoomToFit:) keyEquivalent:@""] autorelease]];
-    menuItem = [[[NSMenuItem alloc] initWithTitle:@"View" action:nil keyEquivalent:@""] autorelease];
+    add_console_menu_entries(menu);
+    menuItem = [mainMenu addItemWithTitle:@"View" action:nil keyEquivalent:@""];
     [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
 
     // Speed menu
     menu = [[NSMenu alloc] initWithTitle:@"Speed"];
@@ -1764,24 +1758,23 @@ static void create_initial_menus(void)
         [menuItem setTag: throttle_pct];
         [menu addItem: menuItem];
     }
-    menuItem = [[[NSMenuItem alloc] initWithTitle:@"Speed" action:nil keyEquivalent:@""] autorelease];
+    menuItem = [mainMenu addItemWithTitle:@"Speed" action:nil keyEquivalent:@""];
     [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
 
     // Window menu
     menu = [[NSMenu alloc] initWithTitle:@"Window"];
     [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Minimize" action:@selector(performMiniaturize:) keyEquivalent:@"m"] autorelease]]; // Miniaturize
-    menuItem = [[[NSMenuItem alloc] initWithTitle:@"Window" action:nil keyEquivalent:@""] autorelease];
+    menuItem = [mainMenu addItemWithTitle:@"Window" action:nil keyEquivalent:@""];
     [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
     [NSApp setWindowsMenu:menu];
 
     // Help menu
     menu = [[NSMenu alloc] initWithTitle:@"Help"];
     [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"QEMU Documentation" action:@selector(showQEMUDoc:) keyEquivalent:@"?"] autorelease]]; // QEMU Help
-    menuItem = [[[NSMenuItem alloc] initWithTitle:@"Window" action:nil keyEquivalent:@""] autorelease];
+    menuItem = [mainMenu addItemWithTitle:@"Window" action:nil keyEquivalent:@""];
     [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
+
+    [NSApp setMainMenu:mainMenu];
 }
 
 @interface QemuCocoaPasteboardTypeOwner : NSObject<NSPasteboardTypeOwner>
@@ -1947,18 +1940,6 @@ int main (int argc, char **argv) {
 
     [QemuApplication sharedApplication];
 
-    create_initial_menus();
-
-    /*
-     * Create the menu entries which depend on QEMU state (for consoles
-     * and removeable devices). These make calls back into QEMU functions,
-     * which is OK because at this point we know that the second thread
-     * holds the iothread lock and is synchronously waiting for us to
-     * finish.
-     */
-    add_console_menu_entries();
-    addRemovableDevicesMenuItems();
-
     // Create an Application controller
     QemuCocoaAppController *appController = [[QemuCocoaAppController alloc] init];
     [NSApp setDelegate:appController];
@@ -2050,6 +2031,8 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
 
 static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
 {
+    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
+
     COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
 
     /* Tell main thread to go ahead and create the app and enter the run loop */
@@ -2057,6 +2040,8 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_sem_wait(&app_started_sem);
     COCOA_DEBUG("cocoa_display_init: app start completed\n");
 
+    create_menus();
+
     /* if fullscreen mode is to be used */
     if (opts->has_full_screen && opts->full_screen) {
         dispatch_async(dispatch_get_main_queue(), ^{
@@ -2074,6 +2059,8 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_event_init(&cbevent, false);
     cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
     qemu_clipboard_peer_register(&cbpeer);
+
+    [pool release];
 }
 
 static QemuDisplay qemu_display_cocoa = {
-- 
2.32.0 (Apple Git-132)


