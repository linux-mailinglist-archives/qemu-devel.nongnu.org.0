Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740694D0282
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 16:11:39 +0100 (CET)
Received: from localhost ([::1]:39182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRF1M-0008EA-6c
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 10:11:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nREzz-0007Ua-DC
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:10:11 -0500
Received: from [2a00:1450:4864:20::62b] (port=40955
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nREzx-0007NZ-2r
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:10:11 -0500
Received: by mail-ej1-x62b.google.com with SMTP id p15so32632987ejc.7
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 07:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cnD788hIOjr871vPv9bQLtK41Z/dH+AtWxFib/Bzn/M=;
 b=d4Z/i8HPa2ZuT9DgBJLVL/+gu6l/r5mRjT4FPlc5fBbgYef45UfjEs8eGy9n5DRVll
 kjJWRvsmqwAeRs0fhRD1ljV6bPqpX+4e0BlTlSCWj8LKy3U0oJNYb1MQ4aXCvOSzkMIE
 drPCpgjXMoy1DPVKsl76XuuUTgYS2nFiB4s5hnm0LLHTB3qazq9mRP/4HxQ1aWLJonv+
 hsP/YqVsLq8WQThJrQTtjjbGydztY0POPx+f1Oof/Cykx9q/zns8TEF/hRbU8bB8GmUl
 UZrm3CbHB95eT1i0ZXywDrkvT7Fnn/G2cylWtVYEu0fevowyqpSsFwhKXnlhVCIC6ckL
 Lokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=cnD788hIOjr871vPv9bQLtK41Z/dH+AtWxFib/Bzn/M=;
 b=3uv1BQUn9LpD86tBuNw4Aa+MJDtSgg0Uoyi3Mh7srFIqJwsc0q02JIMaR08xyGfv6/
 UlY0cHFNOi3Rjh2dUa9KJa0vSk+tP2kLoE/sdOQvmndVnW1rQ58B1yaf4lEEpDNAfXl9
 qRvm67pqI8LSGYqVqBUBfXoQgH1kNM7o4zkTaPIYAWnJ4+dAitzSM5K/ZtfwoTImGOfl
 +GufMu1xbU6FjyrtEtzs5kzt/JVVf/1frO+pmB1V3UnynGmqTOo2ojYRid/Ipvhh+HJu
 NxmY7c93Y+JGW0WnTxQLumNntJokSmKc98rT0nYtnjc5j5kypy6vmUhQxDwqTQciGP0x
 cAWw==
X-Gm-Message-State: AOAM531FalxU2+1121bzJP5B3d3Q5VToa7kA3x47M7Anh1TmkzNXPp4Q
 bgGunt6UCFtgyN/8rfNOZEKx9A8i5bc=
X-Google-Smtp-Source: ABdhPJxnqzW5Ua9VR36k/dWcvQbasXCitotzcneY/RB0OSwzWwGb1nOt4SPMOot4Qem+xe14Ro72AQ==
X-Received: by 2002:a17:906:b893:b0:6da:ab5e:ea34 with SMTP id
 hb19-20020a170906b89300b006daab5eea34mr9431669ejb.657.1646665807527; 
 Mon, 07 Mar 2022 07:10:07 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a056402115500b00413c824e422sm6354308edw.72.2022.03.07.07.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 07:10:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC uncompiled PATCH] cocoa: run qemu_init in the main thread
Date: Mon,  7 Mar 2022 16:10:04 +0100
Message-Id: <20220307151004.578069-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: peter.maydell@linaro.org, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify the initialization dance by running qemu_init() in the main
thread before the Cocoa event loop starts.  The cocoa_display_init()
code that is post-applicationDidFinishLaunching: moves to the
application delegate itself, and the secondary thread only runs
the rest of qemu_main(), namely qemu_main_loop() and qemu_cleanup().

This fixes a case where addRemovableDevicesMenuItems() calls
qmp_query_block() while expecting the main thread to still hold
the BQL.  The newly-introduced assertions in the block layer
complain about this.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/main.c |  12 +++--
 ui/cocoa.m     | 122 +++++++++++++++++++------------------------------
 2 files changed, 53 insertions(+), 81 deletions(-)

diff --git a/softmmu/main.c b/softmmu/main.c
index 639c67ff48..0c4384e980 100644
--- a/softmmu/main.c
+++ b/softmmu/main.c
@@ -39,16 +39,18 @@ int main(int argc, char **argv)
 #endif
 #endif /* CONFIG_SDL */
 
-#ifdef CONFIG_COCOA
-#undef main
-#define main qemu_main
-#endif /* CONFIG_COCOA */
-
+#ifndef CONFIG_COCOA
 int main(int argc, char **argv, char **envp)
 {
+    /*
+     * ui/cocoa.m relies on this being the exact content of main(),
+     * because it has to run everything after qemu_init in a secondary
+     * thread.
+     */
     qemu_init(argc, argv, envp);
     qemu_main_loop();
     qemu_cleanup();
 
     return 0;
 }
+#endif /* CONFIG_COCOA */
diff --git a/ui/cocoa.m b/ui/cocoa.m
index a8f1cdaf92..44d8ea7a39 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -95,14 +95,11 @@ static DisplayChangeListener dcl = {
 };
 static int last_buttons;
 static int cursor_hide = 1;
+static bool full_screen;
 
-static int gArgc;
-static char **gArgv;
 static bool stretch_video;
 static NSTextField *pauseLabel;
 
-static QemuSemaphore display_init_sem;
-static QemuSemaphore app_started_sem;
 static bool allow_events;
 
 static NSInteger cbchangecount = -1;
@@ -140,6 +137,32 @@ static bool bool_with_iothread_lock(BoolCodeBlock block)
     return val;
 }
 
+/*
+ * The startup process for the OSX/Cocoa UI is complicated, because
+ * OSX insists that the UI runs on the initial main thread, and so we
+ * need to start a second thread which runs qemu_main_loop():
+ *
+ * Initial thread:                    2nd thread:
+ * in main():
+ *  qemu_init()
+ *  create application, menus, etc
+ *  enter OSX run loop
+ * in applicationDidFinishLaunching:
+ *  fullscreen if needed
+ *  create main loop thread
+ *                                    call qemu_main_loop()
+ */
+
+static void *call_qemu_main_loop(void *opaque)
+{
+    COCOA_DEBUG("Second thread: calling qemu_main()\n");
+    qemu_main_loop();
+    COCOA_DEBUG("Second thread: qemu_main_loop() returned, exiting\n");
+    qemu_cleanup();
+    [cbowner release];
+    exit(0);
+}
+
 // Mac to QKeyCode conversion
 static const int mac_to_qkeycode_map[] = {
     [kVK_ANSI_A] = Q_KEY_CODE_A,
@@ -708,9 +731,7 @@ QemuCocoaView *cocoaView;
         /*
          * Just let OSX have all events that arrive before
          * applicationDidFinishLaunching.
-         * This avoids a deadlock on the iothread lock, which cocoa_display_init()
-         * will not drop until after the app_started_sem is posted. (In theory
-         * there should not be any such events, but OSX Catalina now emits some.)
+         * This may not be needed anymore?
          */
         return false;
     }
@@ -1185,8 +1206,19 @@ QemuCocoaView *cocoaView;
 {
     COCOA_DEBUG("QemuCocoaAppController: applicationDidFinishLaunching\n");
     allow_events = true;
-    /* Tell cocoa_display_init to proceed */
-    qemu_sem_post(&app_started_sem);
+
+    // register vga output callbacks
+    register_displaychangelistener(&dcl);
+
+    qemu_clipboard_peer_register(&cbpeer);
+    qemu_mutex_unlock_iothread();
+    qemu_thread_create(&thread, "qemu_main_loop", call_qemu_main_loop,
+                       NULL, QEMU_THREAD_DETACHED);
+
+    if (full_screen) {
+        [NSApp activateIgnoringOtherApps: YES];
+        [self toggleFullScreen: nil];
+    }
 }
 
 - (void)applicationWillTerminate:(NSNotification *)aNotification
@@ -1859,60 +1891,14 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
     }
 }
 
-/*
- * The startup process for the OSX/Cocoa UI is complicated, because
- * OSX insists that the UI runs on the initial main thread, and so we
- * need to start a second thread which runs the vl.c qemu_main():
- *
- * Initial thread:                    2nd thread:
- * in main():
- *  create qemu-main thread
- *  wait on display_init semaphore
- *                                    call qemu_main()
- *                                    ...
- *                                    in cocoa_display_init():
- *                                     post the display_init semaphore
- *                                     wait on app_started semaphore
- *  create application, menus, etc
- *  enter OSX run loop
- * in applicationDidFinishLaunching:
- *  post app_started semaphore
- *                                     tell main thread to fullscreen if needed
- *                                    [...]
- *                                    run qemu main-loop
- *
- * We do this in two stages so that we don't do the creation of the
- * GUI application menus and so on for command line options like --help
- * where we want to just print text to stdout and exit immediately.
- */
-
-static void *call_qemu_main(void *opaque)
-{
-    int status;
-
-    COCOA_DEBUG("Second thread: calling qemu_main()\n");
-    status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
-    COCOA_DEBUG("Second thread: qemu_main() returned, exiting\n");
-    [cbowner release];
-    exit(status);
-}
-
 int main (int argc, char **argv) {
     QemuThread thread;
 
     COCOA_DEBUG("Entered main()\n");
-    gArgc = argc;
-    gArgv = argv;
+    qemu_event_init(&cbevent, false);
 
-    qemu_sem_init(&display_init_sem, 0);
-    qemu_sem_init(&app_started_sem, 0);
-
-    qemu_thread_create(&thread, "qemu_main", call_qemu_main,
-                       NULL, QEMU_THREAD_DETACHED);
-
-    COCOA_DEBUG("Main thread: waiting for display_init_sem\n");
-    qemu_sem_wait(&display_init_sem);
-    COCOA_DEBUG("Main thread: initializing app\n");
+    /* Takes iothread lock, released in applicationDidFinishLaunching:.  */
+    qemu_init(argc, argv);
 
     NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
 
@@ -1934,6 +1920,7 @@ int main (int argc, char **argv) {
      */
     add_console_menu_entries();
     addRemovableDevicesMenuItems();
+    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
 
     // Create an Application controller
     QemuCocoaAppController *appController = [[QemuCocoaAppController alloc] init];
@@ -2034,29 +2021,12 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
 static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
 {
     COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
-
-    /* Tell main thread to go ahead and create the app and enter the run loop */
-    qemu_sem_post(&display_init_sem);
-    qemu_sem_wait(&app_started_sem);
-    COCOA_DEBUG("cocoa_display_init: app start completed\n");
-
-    /* if fullscreen mode is to be used */
     if (opts->has_full_screen && opts->full_screen) {
-        dispatch_async(dispatch_get_main_queue(), ^{
-            [NSApp activateIgnoringOtherApps: YES];
-            [(QemuCocoaAppController *)[[NSApplication sharedApplication] delegate] toggleFullScreen: nil];
-        });
+        full_screen = 1;
     }
     if (opts->has_show_cursor && opts->show_cursor) {
         cursor_hide = 0;
     }
-
-    // register vga output callbacks
-    register_displaychangelistener(&dcl);
-
-    qemu_event_init(&cbevent, false);
-    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
-    qemu_clipboard_peer_register(&cbpeer);
 }
 
 static QemuDisplay qemu_display_cocoa = {
-- 
2.34.1


