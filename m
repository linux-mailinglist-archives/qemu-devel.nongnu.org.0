Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FDF5760C1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 13:44:24 +0200 (CEST)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCJk7-0005Lx-LM
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 07:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCJgl-0001wc-9g
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:40:55 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCJgi-0003k1-NW
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:40:54 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y141so4448925pfb.7
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 04:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2l4sTRBHoOYn7g1OyBiPgo8eUwDDObSTkhW0AEDiHo8=;
 b=RmsZ2uu+3chaGRXrtIJDw3kmyYtmBlXqe5g40yUL7xHC292Y3mqxBweWwgmIEtNfHS
 0VuXftg6I+PlWS83xVYuMyfWC3NxLk/b5TENQGzCeFZiIoefq0e+/Skwdu8MiAyCWGNX
 36q8oIfyIP7K9zdxPDv2WwoBHSP6wex7pInJa7CWOCaoKrtyUSvh8Iyu8PPpdUGP5cb1
 j9NkMNjSNMi6kJ2I0dlqwUSY4KS3thHb9+HO78PkGdIMw+5n+QGAS8/sqwX6bv0s5V8/
 2gcoYOftm4vT0+qLcGSFGFTvfcO2e8sFAxW1Zosqhno/iu8FtwwY+4ekiXcu1bMTs147
 kFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2l4sTRBHoOYn7g1OyBiPgo8eUwDDObSTkhW0AEDiHo8=;
 b=gKikob3WeRLaG0HcqlMsSJTcaoOVBA2P0V2wz9yLZri4cMxGydgmLMdltkX8rVbS2E
 0svZFBl6ZbFgjzILq8h3HcZPQPxc3mtsvoPk99sCw7/Oc6rWXPoReMkcBamCOyGEKsM9
 iyNz68uoZsmZSSjVU59bTobuRLd5LZe3JQD2Qq/HsQy56lkC63SPKkaSRNIcyXET3/+v
 AhQ+IA1fd7LWzGLP4cnLrrfuJ+XjPxBXQOBdKPnWQJBcACmneBc9Sjc8Vr3HPsYQ4nLH
 LBlTHRjYRqVkfFCXIyyJ5yhaBGosSLf5MVAgiQZAsrId+8VhTVAzwQXh4Sa1QQ6VAqlM
 tfjQ==
X-Gm-Message-State: AJIora8Oe6EByibWM0ycRvmQ/5s5/75aLti6umUBjlQ82WU1RQ++Yhht
 ncDS2BlOMySYAHEGkYAazhm3axAXvNc=
X-Google-Smtp-Source: AGRyM1vh2xb/pVGf/zBaNNfcjFYlnhhfwrm9UBT5IHViXmD0y66QvNnfAciuRH5o5nnrRf757CE/ew==
X-Received: by 2002:a65:6d1a:0:b0:3fb:2109:7b87 with SMTP id
 bf26-20020a656d1a000000b003fb21097b87mr11639426pgb.127.1657885250713; 
 Fri, 15 Jul 2022 04:40:50 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d554:ffbd:f962:2efd])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a170902ca0400b0016c67a3b7d0sm3258627pld.61.2022.07.15.04.40.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 Jul 2022 04:40:50 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v2 1/3] ui/cocoa: Run qemu_init in the main thread
Date: Fri, 15 Jul 2022 20:40:37 +0900
Message-Id: <20220715114039.59790-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220715114039.59790-1-akihiko.odaki@gmail.com>
References: <20220715114039.59790-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42e.google.com
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

This work is based on:
https://patchew.org/QEMU/20220317125534.38706-1-philippe.mathieu.daude@gmail.com/

Simplify the initialization dance by running qemu_init() in the main
thread before the Cocoa event loop starts. The secondary thread only
runs only qemu_main_loop() and qemu_cleanup().

This fixes a case where addRemovableDevicesMenuItems() calls
qmp_query_block() while expecting the main thread to still hold
the BQL.

Overriding the code after calling qemu_init() is done by dynamically
replacing a function pointer variable, qemu_main when initializing
ui/cocoa, which unifies the static implementation of main() for
builds with ui/cocoa and ones without ui/cocoa.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 docs/devel/fuzzing.rst  |   4 +-
 include/qemu-main.h     |   3 +-
 include/sysemu/sysemu.h |   2 +-
 softmmu/main.c          |  14 ++--
 softmmu/vl.c            |   2 +-
 tests/qtest/fuzz/fuzz.c |   2 +-
 ui/cocoa.m              | 167 ++++++++++++++--------------------------
 7 files changed, 70 insertions(+), 124 deletions(-)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 784ecb99e66..715330c8561 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -287,8 +287,8 @@ select the fuzz target. Then, the qtest client is initialized. If the target
 requires qos, qgraph is set up and the QOM/LIBQOS modules are initialized.
 Then the QGraph is walked and the QEMU cmd_line is determined and saved.
 
-After this, the ``vl.c:qemu_main`` is called to set up the guest. There are
-target-specific hooks that can be called before and after qemu_main, for
+After this, the ``vl.c:main`` is called to set up the guest. There are
+target-specific hooks that can be called before and after main, for
 additional setup(e.g. PCI setup, or VM snapshotting).
 
 ``LLVMFuzzerTestOneInput``: Uses qtest/qos functions to act based on the fuzz
diff --git a/include/qemu-main.h b/include/qemu-main.h
index 6a3e90d0ad5..6889375e7c2 100644
--- a/include/qemu-main.h
+++ b/include/qemu-main.h
@@ -5,6 +5,7 @@
 #ifndef QEMU_MAIN_H
 #define QEMU_MAIN_H
 
-int qemu_main(int argc, char **argv, char **envp);
+void qemu_default_main(void);
+extern void (*qemu_main)(void);
 
 #endif /* QEMU_MAIN_H */
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 812f66a31a9..254c1eabf57 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -102,7 +102,7 @@ void qemu_boot_set(const char *boot_order, Error **errp);
 
 bool defaults_enabled(void);
 
-void qemu_init(int argc, char **argv, char **envp);
+void qemu_init(int argc, char **argv);
 void qemu_main_loop(void);
 void qemu_cleanup(void);
 
diff --git a/softmmu/main.c b/softmmu/main.c
index c00432ff098..41a091f2c72 100644
--- a/softmmu/main.c
+++ b/softmmu/main.c
@@ -30,18 +30,18 @@
 #include <SDL.h>
 #endif
 
-int qemu_main(int argc, char **argv, char **envp)
+void qemu_default_main(void)
 {
-    qemu_init(argc, argv, envp);
     qemu_main_loop();
     qemu_cleanup();
-
-    return 0;
 }
 
-#ifndef CONFIG_COCOA
+void (*qemu_main)(void) = qemu_default_main;
+
 int main(int argc, char **argv)
 {
-    return qemu_main(argc, argv, NULL);
+    qemu_init(argc, argv);
+    qemu_main();
+
+    return 0;
 }
-#endif
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 3f264d4b093..e8c73d0bb40 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2589,7 +2589,7 @@ void qmp_x_exit_preconfig(Error **errp)
     }
 }
 
-void qemu_init(int argc, char **argv, char **envp)
+void qemu_init(int argc, char **argv)
 {
     QemuOpts *opts;
     QemuOpts *icount_opts = NULL, *accel_opts = NULL;
diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 0ad4ba9e94d..678c312923a 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -236,7 +236,7 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
         g_free(pretty_cmd_line);
     }
 
-    qemu_init(result.we_wordc, result.we_wordv, NULL);
+    qemu_init(result.we_wordc, result.we_wordv);
 
     /* re-enable the rcu atfork, which was previously disabled in qemu_init */
     rcu_enable_atfork();
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 6a4dccff7f0..9bf56232691 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -100,13 +100,11 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 static int left_command_key_enabled = 1;
 static bool swap_opt_cmd;
 
-static int gArgc;
-static char **gArgv;
+static QemuThread qemu_main_thread;
+static bool qemu_main_terminating;
 static bool stretch_video;
 static NSTextField *pauseLabel;
 
-static QemuSemaphore display_init_sem;
-static QemuSemaphore app_started_sem;
 static bool allow_events;
 
 static NSInteger cbchangecount = -1;
@@ -585,7 +583,7 @@ - (void) updateUIInfo
         /*
          * Don't try to tell QEMU about UI information in the application
          * startup phase -- we haven't yet registered dcl with the QEMU UI
-         * layer, and also trying to take the iothread lock would deadlock.
+         * layer.
          * When cocoa_display_init() does register the dcl, the UI layer
          * will call cocoa_switch(), which will call updateUIInfo, so
          * we don't lose any information here.
@@ -778,16 +776,6 @@ - (void) handleMonitorInput:(NSEvent *)event
 
 - (bool) handleEvent:(NSEvent *)event
 {
-    if(!allow_events) {
-        /*
-         * Just let OSX have all events that arrive before
-         * applicationDidFinishLaunching.
-         * This avoids a deadlock on the iothread lock, which cocoa_display_init()
-         * will not drop until after the app_started_sem is posted. (In theory
-         * there should not be any such events, but OSX Catalina now emits some.)
-         */
-        return false;
-    }
     return bool_with_iothread_lock(^{
         return [self handleEventLocked:event];
     });
@@ -1283,8 +1271,6 @@ - (void)applicationDidFinishLaunching: (NSNotification *) note
 {
     COCOA_DEBUG("QemuCocoaAppController: applicationDidFinishLaunching\n");
     allow_events = true;
-    /* Tell cocoa_display_init to proceed */
-    qemu_sem_post(&app_started_sem);
 }
 
 - (void)applicationWillTerminate:(NSNotification *)aNotification
@@ -1292,16 +1278,13 @@ - (void)applicationWillTerminate:(NSNotification *)aNotification
     COCOA_DEBUG("QemuCocoaAppController: applicationWillTerminate\n");
 
     with_iothread_lock(^{
-        shutdown_action = SHUTDOWN_ACTION_POWEROFF;
-        qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
+        if (!qemu_main_terminating) {
+            shutdown_action = SHUTDOWN_ACTION_POWEROFF;
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
+        }
     });
 
-    /*
-     * Sleep here, because returning will cause OSX to kill us
-     * immediately; the QEMU main loop will handle the shutdown
-     * request and terminate the process.
-     */
-    [NSThread sleepForTimeInterval:INFINITY];
+    qemu_thread_join(&qemu_main_thread);
 }
 
 - (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
@@ -1313,7 +1296,7 @@ - (NSApplicationTerminateReply)applicationShouldTerminate:
                                                          (NSApplication *)sender
 {
     COCOA_DEBUG("QemuCocoaAppController: applicationShouldTerminate\n");
-    return [self verifyQuit];
+    return qatomic_read(&qemu_main_terminating) || [self verifyQuit];
 }
 
 - (void)windowDidChangeScreen:(NSNotification *)notification
@@ -1915,92 +1898,35 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
 /*
  * The startup process for the OSX/Cocoa UI is complicated, because
  * OSX insists that the UI runs on the initial main thread, and so we
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
+ * need to start a second thread which runs the qemu_default_main().
  */
 
 static void *call_qemu_main(void *opaque)
 {
-    int status;
-
-    COCOA_DEBUG("Second thread: calling qemu_main()\n");
-    status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
-    COCOA_DEBUG("Second thread: qemu_main() returned, exiting\n");
+    COCOA_DEBUG("Second thread: calling qemu_default_main()\n");
+    qemu_mutex_lock_iothread();
+    qemu_default_main();
+    qatomic_set(&qemu_main_terminating, true);
+    qemu_mutex_unlock_iothread();
+    COCOA_DEBUG("Second thread: qemu_default_main() returned, exiting\n");
     [cbowner release];
-    exit(status);
-}
-
-int main (int argc, char **argv) {
-    QemuThread thread;
-
-    COCOA_DEBUG("Entered main()\n");
-    gArgc = argc;
-    gArgv = argv;
-
-    qemu_sem_init(&display_init_sem, 0);
-    qemu_sem_init(&app_started_sem, 0);
-
-    qemu_thread_create(&thread, "qemu_main", call_qemu_main,
-                       NULL, QEMU_THREAD_DETACHED);
+    [NSApp terminate:nil];
 
-    COCOA_DEBUG("Main thread: waiting for display_init_sem\n");
-    qemu_sem_wait(&display_init_sem);
-    COCOA_DEBUG("Main thread: initializing app\n");
-
-    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
-
-    // Pull this console process up to being a fully-fledged graphical
-    // app with a menubar and Dock icon
-    ProcessSerialNumber psn = { 0, kCurrentProcess };
-    TransformProcessType(&psn, kProcessTransformToForegroundApplication);
-
-    [QemuApplication sharedApplication];
-
-    create_initial_menus();
+    return NULL;
+}
 
-    /*
-     * Create the menu entries which depend on QEMU state (for consoles
-     * and removeable devices). These make calls back into QEMU functions,
-     * which is OK because at this point we know that the second thread
-     * holds the iothread lock and is synchronously waiting for us to
-     * finish.
-     */
-    add_console_menu_entries();
-    addRemovableDevicesMenuItems();
+static void cocoa_main()
+{
+    COCOA_DEBUG("Entered %s()\n", __func__);
 
-    // Create an Application controller
-    QemuCocoaAppController *appController = [[QemuCocoaAppController alloc] init];
-    [NSApp setDelegate:appController];
+    qemu_mutex_unlock_iothread();
+    qemu_thread_create(&qemu_main_thread, "qemu_main", call_qemu_main,
+                       NULL, QEMU_THREAD_JOINABLE);
 
     // Start the main event loop
     COCOA_DEBUG("Main thread: entering OSX run loop\n");
     [NSApp run];
     COCOA_DEBUG("Main thread: left OSX run loop, exiting\n");
-
-    [appController release];
-    [pool release];
-
-    return 0;
 }
 
 
@@ -2079,25 +2005,42 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
 
 static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
 {
+    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
+
     COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
 
-    /* Tell main thread to go ahead and create the app and enter the run loop */
-    qemu_sem_post(&display_init_sem);
-    qemu_sem_wait(&app_started_sem);
-    COCOA_DEBUG("cocoa_display_init: app start completed\n");
+    qemu_main = cocoa_main;
+
+    // Pull this console process up to being a fully-fledged graphical
+    // app with a menubar and Dock icon
+    ProcessSerialNumber psn = { 0, kCurrentProcess };
+    TransformProcessType(&psn, kProcessTransformToForegroundApplication);
+
+    [QemuApplication sharedApplication];
+
+    create_initial_menus();
+
+    /*
+     * Create the menu entries which depend on QEMU state (for consoles
+     * and removeable devices). These make calls back into QEMU functions,
+     * which is OK because at this point we know that the second thread
+     * holds the iothread lock and is synchronously waiting for us to
+     * finish.
+     */
+    add_console_menu_entries();
+    addRemovableDevicesMenuItems();
+
+    // Create an Application controller
+    QemuCocoaAppController *controller = [[QemuCocoaAppController alloc] init];
+    [NSApp setDelegate:controller];
 
-    QemuCocoaAppController *controller = (QemuCocoaAppController *)[[NSApplication sharedApplication] delegate];
     /* if fullscreen mode is to be used */
     if (opts->has_full_screen && opts->full_screen) {
-        dispatch_async(dispatch_get_main_queue(), ^{
-            [NSApp activateIgnoringOtherApps: YES];
-            [controller toggleFullScreen: nil];
-        });
+        [NSApp activateIgnoringOtherApps: YES];
+        [controller toggleFullScreen: nil];
     }
     if (opts->u.cocoa.has_full_grab && opts->u.cocoa.full_grab) {
-        dispatch_async(dispatch_get_main_queue(), ^{
-            [controller setFullGrab: nil];
-        });
+        [controller setFullGrab: nil];
     }
 
     if (opts->has_show_cursor && opts->show_cursor) {
@@ -2117,6 +2060,8 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_event_init(&cbevent, false);
     cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
     qemu_clipboard_peer_register(&cbpeer);
+
+    [pool release];
 }
 
 static QemuDisplay qemu_display_cocoa = {
-- 
2.32.1 (Apple Git-133)


