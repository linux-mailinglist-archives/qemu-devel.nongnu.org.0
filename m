Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD3E4CE9D7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 07:59:17 +0100 (CET)
Received: from localhost ([::1]:47516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQkrM-0007wh-LQ
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 01:59:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQkq7-0007Gm-9l
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 01:57:59 -0500
Received: from [2607:f8b0:4864:20::635] (port=34573
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQkq4-0003gJ-99
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 01:57:58 -0500
Received: by mail-pl1-x635.google.com with SMTP id ay5so11250662plb.1
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 22:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dg7UQn2NAdaqlLgkGA+v5Q7l7LORHpenzt/i/slwTOs=;
 b=qaTlfRD05DAIByCa5D8lzP6AGM73UOReY6P4ZJpkyK+O1gZSE32S6vDg0gGaMvgqX6
 7waAsz77+AOpNexn4QKKpvKUKlOFHSqSscbS/W7gvxU3SSUiLAH72xnWo0YqLmQkCTBn
 PEiRBWMonHEQxhHlqex7cVIUVI9QAZo6VMAUUerJwudJ/AaoSc8V+Wqq1KRVGrvn1He5
 g5NO9DJmsCfUyikq37rrXyJ5Ad6kynF20hmtYIc8PWrcPjsQS2Vo8BmKTCTxjVX+EN6O
 K9n9dvLlIRh0jDn/er928Z76ZLanqjrTNV3EBm9AnqjBu8xLv3+76jNR6ki8xCkl086g
 Fd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dg7UQn2NAdaqlLgkGA+v5Q7l7LORHpenzt/i/slwTOs=;
 b=vVp87ZyoAsMPpikGD16f0Q/19AoAlqhiebiBzqVY0fcpB3g0DdnCqgk9yzgJua16qu
 dKRsSAmq5+FIJA5H5HJF8JnFQSKOVzSJuGekxsTcMlW9OMsqJkszd1ibNhydfhatb8U3
 T0B0WbbZ39kKK8QHEhCwtOcAYQ+ErT3DqttFHyAusPy8kJXpdyE7C2PowwuGNhDYzQ78
 /WMB6ZqhTPYjAPaUptCbYArtWds2Si+QuZjUJE/hVgDGGydKL3KR8DE/682HV6D9VJiE
 Rgg/BNwx1ILpvIjkfdToED01rW7AL7pihHx643naqJDom0o45haw/OUrAKfc4N+BUSq9
 qI8w==
X-Gm-Message-State: AOAM530YWdbSY3ZSltvkPmgYD7Hg2/iiIF8PqS7BT1kZ6d6fn/MV1h5h
 Q/nD/3tRYYUQbhRxaCyhQWyB4aPzzF4=
X-Google-Smtp-Source: ABdhPJz7+ll+OYez1LLVdnwe7RTosE2Sbt9S2XDoQEpF71RvG3kuMWtY9XfakTVNJfUGGsTPF6/H9Q==
X-Received: by 2002:a17:902:a582:b0:151:e09a:4e1a with SMTP id
 az2-20020a170902a58200b00151e09a4e1amr1356054plb.101.1646549874036; 
 Sat, 05 Mar 2022 22:57:54 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:f82b:4f21:14ee:1481])
 by smtp.gmail.com with ESMTPSA id
 nk5-20020a17090b194500b001bf01e6e558sm9037728pjb.29.2022.03.05.22.57.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 05 Mar 2022 22:57:53 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] ui/cocoa: Create menus in iothread
Date: Sun,  6 Mar 2022 15:57:47 +0900
Message-Id: <20220306065747.46486-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x635.google.com
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
 ui/cocoa.m | 209 +++++++++++++++++++++++++----------------------------
 1 file changed, 98 insertions(+), 111 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 8ab9ab5e84d..edacbef9f7a 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1604,97 +1604,6 @@ - (void)sendEvent:(NSEvent *)event
 }
 @end
 
-static void create_initial_menus(void)
-{
-    // Add menus
-    NSMenu      *menu;
-    NSMenuItem  *menuItem;
-
-    [NSApp setMainMenu:[[NSMenu alloc] init]];
-    [NSApp setServicesMenu:[[NSMenu alloc] initWithTitle:@"Services"]];
-
-    // Application menu
-    menu = [[NSMenu alloc] initWithTitle:@""];
-    [menu addItemWithTitle:@"About QEMU" action:@selector(do_about_menu_item:) keyEquivalent:@""]; // About QEMU
-    [menu addItem:[NSMenuItem separatorItem]]; //Separator
-    menuItem = [menu addItemWithTitle:@"Services" action:nil keyEquivalent:@""];
-    [menuItem setSubmenu:[NSApp servicesMenu]];
-    [menu addItem:[NSMenuItem separatorItem]];
-    [menu addItemWithTitle:@"Hide QEMU" action:@selector(hide:) keyEquivalent:@"h"]; //Hide QEMU
-    menuItem = (NSMenuItem *)[menu addItemWithTitle:@"Hide Others" action:@selector(hideOtherApplications:) keyEquivalent:@"h"]; // Hide Others
-    [menuItem setKeyEquivalentModifierMask:(NSEventModifierFlagOption|NSEventModifierFlagCommand)];
-    [menu addItemWithTitle:@"Show All" action:@selector(unhideAllApplications:) keyEquivalent:@""]; // Show All
-    [menu addItem:[NSMenuItem separatorItem]]; //Separator
-    [menu addItemWithTitle:@"Quit QEMU" action:@selector(terminate:) keyEquivalent:@"q"];
-    menuItem = [[NSMenuItem alloc] initWithTitle:@"Apple" action:nil keyEquivalent:@""];
-    [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
-    [NSApp performSelector:@selector(setAppleMenu:) withObject:menu]; // Workaround (this method is private since 10.4+)
-
-    // Machine menu
-    menu = [[NSMenu alloc] initWithTitle: @"Machine"];
-    [menu setAutoenablesItems: NO];
-    [menu addItem: [[[NSMenuItem alloc] initWithTitle: @"Pause" action: @selector(pauseQEMU:) keyEquivalent: @""] autorelease]];
-    menuItem = [[[NSMenuItem alloc] initWithTitle: @"Resume" action: @selector(resumeQEMU:) keyEquivalent: @""] autorelease];
-    [menu addItem: menuItem];
-    [menuItem setEnabled: NO];
-    [menu addItem: [NSMenuItem separatorItem]];
-    [menu addItem: [[[NSMenuItem alloc] initWithTitle: @"Reset" action: @selector(restartQEMU:) keyEquivalent: @""] autorelease]];
-    [menu addItem: [[[NSMenuItem alloc] initWithTitle: @"Power Down" action: @selector(powerDownQEMU:) keyEquivalent: @""] autorelease]];
-    menuItem = [[[NSMenuItem alloc] initWithTitle: @"Machine" action:nil keyEquivalent:@""] autorelease];
-    [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
-
-    // View menu
-    menu = [[NSMenu alloc] initWithTitle:@"View"];
-    [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Enter Fullscreen" action:@selector(doToggleFullScreen:) keyEquivalent:@"f"] autorelease]]; // Fullscreen
-    [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Zoom To Fit" action:@selector(zoomToFit:) keyEquivalent:@""] autorelease]];
-    menuItem = [[[NSMenuItem alloc] initWithTitle:@"View" action:nil keyEquivalent:@""] autorelease];
-    [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
-
-    // Speed menu
-    menu = [[NSMenu alloc] initWithTitle:@"Speed"];
-
-    // Add the rest of the Speed menu items
-    int p, percentage, throttle_pct;
-    for (p = 10; p >= 0; p--)
-    {
-        percentage = p * 10 > 1 ? p * 10 : 1; // prevent a 0% menu item
-
-        menuItem = [[[NSMenuItem alloc]
-                   initWithTitle: [NSString stringWithFormat: @"%d%%", percentage] action:@selector(adjustSpeed:) keyEquivalent:@""] autorelease];
-
-        if (percentage == 100) {
-            [menuItem setState: NSControlStateValueOn];
-        }
-
-        /* Calculate the throttle percentage */
-        throttle_pct = -1 * percentage + 100;
-
-        [menuItem setTag: throttle_pct];
-        [menu addItem: menuItem];
-    }
-    menuItem = [[[NSMenuItem alloc] initWithTitle:@"Speed" action:nil keyEquivalent:@""] autorelease];
-    [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
-
-    // Window menu
-    menu = [[NSMenu alloc] initWithTitle:@"Window"];
-    [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Minimize" action:@selector(performMiniaturize:) keyEquivalent:@"m"] autorelease]]; // Miniaturize
-    menuItem = [[[NSMenuItem alloc] initWithTitle:@"Window" action:nil keyEquivalent:@""] autorelease];
-    [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
-    [NSApp setWindowsMenu:menu];
-
-    // Help menu
-    menu = [[NSMenu alloc] initWithTitle:@"Help"];
-    [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"QEMU Documentation" action:@selector(showQEMUDoc:) keyEquivalent:@"?"] autorelease]]; // QEMU Help
-    menuItem = [[[NSMenuItem alloc] initWithTitle:@"Window" action:nil keyEquivalent:@""] autorelease];
-    [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
-}
-
 /* Returns a name for a given console */
 static NSString * getConsoleName(QemuConsole * console)
 {
@@ -1704,14 +1613,11 @@ static void create_initial_menus(void)
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
@@ -1726,9 +1632,8 @@ static void add_console_menu_entries(void)
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
@@ -1736,8 +1641,6 @@ static void addRemovableDevicesMenuItems(void)
     currentDevice = qmp_query_block(NULL);
     pointerToFree = currentDevice;
 
-    menu = [[[NSApp mainMenu] itemWithTitle:@"Machine"] submenu];
-
     // Add a separator between related groups of menu items
     [menu addItem:[NSMenuItem separatorItem]];
 
@@ -1784,6 +1687,96 @@ static void addRemovableDevicesMenuItems(void)
     qapi_free_BlockInfoList(pointerToFree);
 }
 
+static void create_menus(void)
+{
+    // Add menus
+    NSString    *title = [[[NSBundle mainBundle] executablePath] lastPathComponent];
+    NSMenu      *mainMenu;
+    NSMenu      *menu;
+    NSMenuItem  *menuItem;
+
+    mainMenu = [[NSMenu alloc] initWithTitle:@"Main Menu"];
+    [NSApp setServicesMenu:[[NSMenu alloc] initWithTitle:@"Services"]];
+
+    // Application menu
+    menu = [[NSMenu alloc] initWithTitle:title];
+    [menu addItemWithTitle:@"About QEMU" action:@selector(do_about_menu_item:) keyEquivalent:@""]; // About QEMU
+    [menu addItem:[NSMenuItem separatorItem]]; //Separator
+    menuItem = [menu addItemWithTitle:@"Services" action:nil keyEquivalent:@""];
+    [menuItem setSubmenu:[NSApp servicesMenu]];
+    [menu addItem:[NSMenuItem separatorItem]];
+    [menu addItemWithTitle:@"Hide QEMU" action:@selector(hide:) keyEquivalent:@"h"]; //Hide QEMU
+    menuItem = (NSMenuItem *)[menu addItemWithTitle:@"Hide Others" action:@selector(hideOtherApplications:) keyEquivalent:@"h"]; // Hide Others
+    [menuItem setKeyEquivalentModifierMask:(NSEventModifierFlagOption|NSEventModifierFlagCommand)];
+    [menu addItemWithTitle:@"Show All" action:@selector(unhideAllApplications:) keyEquivalent:@""]; // Show All
+    [menu addItem:[NSMenuItem separatorItem]]; //Separator
+    [menu addItemWithTitle:@"Quit QEMU" action:@selector(terminate:) keyEquivalent:@"q"];
+    menuItem = [mainMenu addItemWithTitle:title action:nil keyEquivalent:@""];
+    [menuItem setSubmenu:menu];
+
+    // Machine menu
+    menu = [[NSMenu alloc] initWithTitle: @"Machine"];
+    [menu setAutoenablesItems: NO];
+    [menu addItem: [[[NSMenuItem alloc] initWithTitle: @"Pause" action: @selector(pauseQEMU:) keyEquivalent: @""] autorelease]];
+    menuItem = [[[NSMenuItem alloc] initWithTitle: @"Resume" action: @selector(resumeQEMU:) keyEquivalent: @""] autorelease];
+    [menu addItem: menuItem];
+    [menuItem setEnabled: NO];
+    [menu addItem: [NSMenuItem separatorItem]];
+    [menu addItem: [[[NSMenuItem alloc] initWithTitle: @"Reset" action: @selector(restartQEMU:) keyEquivalent: @""] autorelease]];
+    [menu addItem: [[[NSMenuItem alloc] initWithTitle: @"Power Down" action: @selector(powerDownQEMU:) keyEquivalent: @""] autorelease]];
+    addRemovableDevicesMenuItems(menu);
+    menuItem = [mainMenu addItemWithTitle: @"Machine" action:nil keyEquivalent:@""];
+    [menuItem setSubmenu:menu];
+
+    // View menu
+    menu = [[NSMenu alloc] initWithTitle:@"View"];
+    [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Enter Fullscreen" action:@selector(doToggleFullScreen:) keyEquivalent:@"f"] autorelease]]; // Fullscreen
+    [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Zoom To Fit" action:@selector(zoomToFit:) keyEquivalent:@""] autorelease]];
+    add_console_menu_entries(menu);
+    menuItem = [mainMenu addItemWithTitle:@"View" action:nil keyEquivalent:@""];
+    [menuItem setSubmenu:menu];
+
+    // Speed menu
+    menu = [[NSMenu alloc] initWithTitle:@"Speed"];
+
+    // Add the rest of the Speed menu items
+    int p, percentage, throttle_pct;
+    for (p = 10; p >= 0; p--)
+    {
+        percentage = p * 10 > 1 ? p * 10 : 1; // prevent a 0% menu item
+
+        menuItem = [[[NSMenuItem alloc]
+                   initWithTitle: [NSString stringWithFormat: @"%d%%", percentage] action:@selector(adjustSpeed:) keyEquivalent:@""] autorelease];
+
+        if (percentage == 100) {
+            [menuItem setState: NSControlStateValueOn];
+        }
+
+        /* Calculate the throttle percentage */
+        throttle_pct = -1 * percentage + 100;
+
+        [menuItem setTag: throttle_pct];
+        [menu addItem: menuItem];
+    }
+    menuItem = [mainMenu addItemWithTitle:@"Speed" action:nil keyEquivalent:@""];
+    [menuItem setSubmenu:menu];
+
+    // Window menu
+    menu = [[NSMenu alloc] initWithTitle:@"Window"];
+    [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Minimize" action:@selector(performMiniaturize:) keyEquivalent:@"m"] autorelease]]; // Miniaturize
+    menuItem = [mainMenu addItemWithTitle:@"Window" action:nil keyEquivalent:@""];
+    [menuItem setSubmenu:menu];
+    [NSApp setWindowsMenu:menu];
+
+    // Help menu
+    menu = [[NSMenu alloc] initWithTitle:@"Help"];
+    [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"QEMU Documentation" action:@selector(showQEMUDoc:) keyEquivalent:@"?"] autorelease]]; // QEMU Help
+    menuItem = [mainMenu addItemWithTitle:@"Window" action:nil keyEquivalent:@""];
+    [menuItem setSubmenu:menu];
+
+    [NSApp setMainMenu:mainMenu];
+}
+
 @interface QemuCocoaPasteboardTypeOwner : NSObject<NSPasteboardTypeOwner>
 @end
 
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


