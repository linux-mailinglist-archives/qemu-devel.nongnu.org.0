Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201A5E9E76
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 11:59:18 +0200 (CEST)
Received: from localhost ([::1]:53424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocktR-0001yR-3Q
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 05:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpd-0004mj-Mm
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpa-0003fh-Vr
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/zq3OWtNsr/F8P8xBpqtvQmjLKJC+788Jtr6JhyFLLk=;
 b=TOjeLB5egnejK4AQNmDn1l/lPTI+wJfs8gdX0oCTSGc8ppdZbwIbtiwP51T2FXDfxiA649
 bchc0TPjRdw+QWElNmxDRXyVlmQRWToPQvwejhvsklQOc3AFN8WrTjNX+mCUlpz1mO68TJ
 E/sIYrgSq+5kNNvSSRk0Omo959UlUFk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-8oNYam9xNmSdlZqvc4lHSQ-1; Mon, 26 Sep 2022 05:55:14 -0400
X-MC-Unique: 8oNYam9xNmSdlZqvc4lHSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 356C5811E67;
 Mon, 26 Sep 2022 09:55:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A13222166B26;
 Mon, 26 Sep 2022 09:55:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0E89A18030A8; Mon, 26 Sep 2022 11:55:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 02/25] ui/cocoa: Run qemu_init in the main thread
Date: Mon, 26 Sep 2022 11:54:46 +0200
Message-Id: <20220926095509.3759409-3-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@gmail.com>

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
Message-Id: <20220819132756.74641-2-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/qemu-main.h     |   3 +-
 include/sysemu/sysemu.h |   2 +-
 softmmu/main.c          |  10 +--
 softmmu/vl.c            |   2 +-
 tests/qtest/fuzz/fuzz.c |   2 +-
 docs/devel/fuzzing.rst  |   4 +-
 ui/cocoa.m              | 144 ++++++++++++++--------------------------
 7 files changed, 62 insertions(+), 105 deletions(-)

diff --git a/include/qemu-main.h b/include/qemu-main.h
index 6a3e90d0ad59..940960a7dbcb 100644
--- a/include/qemu-main.h
+++ b/include/qemu-main.h
@@ -5,6 +5,7 @@
 #ifndef QEMU_MAIN_H
 #define QEMU_MAIN_H
 
-int qemu_main(int argc, char **argv, char **envp);
+int qemu_default_main(void);
+extern int (*qemu_main)(void);
 
 #endif /* QEMU_MAIN_H */
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 31aa45160be8..6a7a31e64dea 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -102,7 +102,7 @@ void qemu_boot_set(const char *boot_order, Error **errp);
 
 bool defaults_enabled(void);
 
-void qemu_init(int argc, char **argv, char **envp);
+void qemu_init(int argc, char **argv);
 int qemu_main_loop(void);
 void qemu_cleanup(void);
 
diff --git a/softmmu/main.c b/softmmu/main.c
index 1b675a8c036f..694388bd7f7f 100644
--- a/softmmu/main.c
+++ b/softmmu/main.c
@@ -30,20 +30,20 @@
 #include <SDL.h>
 #endif
 
-int qemu_main(int argc, char **argv, char **envp)
+int qemu_default_main(void)
 {
     int status;
 
-    qemu_init(argc, argv, envp);
     status = qemu_main_loop();
     qemu_cleanup();
 
     return status;
 }
 
-#ifndef CONFIG_COCOA
+int (*qemu_main)(void) = qemu_default_main;
+
 int main(int argc, char **argv)
 {
-    return qemu_main(argc, argv, NULL);
+    qemu_init(argc, argv);
+    return qemu_main();
 }
-#endif
diff --git a/softmmu/vl.c b/softmmu/vl.c
index e62b9cc35d75..9abadcc15051 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2605,7 +2605,7 @@ void qmp_x_exit_preconfig(Error **errp)
     }
 }
 
-void qemu_init(int argc, char **argv, char **envp)
+void qemu_init(int argc, char **argv)
 {
     QemuOpts *opts;
     QemuOpts *icount_opts = NULL, *accel_opts = NULL;
diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 2b3bc1fb9df5..eb7520544b80 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -218,7 +218,7 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
         g_free(pretty_cmd_line);
     }
 
-    qemu_init(result.we_wordc, result.we_wordv, NULL);
+    qemu_init(result.we_wordc, result.we_wordv);
 
     /* re-enable the rcu atfork, which was previously disabled in qemu_init */
     rcu_enable_atfork();
diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 784ecb99e667..715330c85613 100644
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
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 5a8bd5dd84e0..660d3e093569 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -100,13 +100,9 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 static int left_command_key_enabled = 1;
 static bool swap_opt_cmd;
 
-static int gArgc;
-static char **gArgv;
 static bool stretch_video;
 static NSTextField *pauseLabel;
 
-static QemuSemaphore display_init_sem;
-static QemuSemaphore app_started_sem;
 static bool allow_events;
 
 static NSInteger cbchangecount = -1;
@@ -597,7 +593,7 @@ - (void) updateUIInfo
         /*
          * Don't try to tell QEMU about UI information in the application
          * startup phase -- we haven't yet registered dcl with the QEMU UI
-         * layer, and also trying to take the iothread lock would deadlock.
+         * layer.
          * When cocoa_display_init() does register the dcl, the UI layer
          * will call cocoa_switch(), which will call updateUIInfo, so
          * we don't lose any information here.
@@ -790,16 +786,6 @@ - (void) handleMonitorInput:(NSEvent *)event
 
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
@@ -1287,8 +1273,6 @@ - (void)applicationDidFinishLaunching: (NSNotification *) note
 {
     COCOA_DEBUG("QemuCocoaAppController: applicationDidFinishLaunching\n");
     allow_events = true;
-    /* Tell cocoa_display_init to proceed */
-    qemu_sem_post(&app_started_sem);
 }
 
 - (void)applicationWillTerminate:(NSNotification *)aNotification
@@ -1919,92 +1903,45 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
 /*
  * The startup process for the OSX/Cocoa UI is complicated, because
  * OSX insists that the UI runs on the initial main thread, and so we
- * need to start a second thread which runs the vl.c qemu_main():
- *
- * Initial thread:                    2nd thread:
+ * need to start a second thread which runs the qemu_default_main():
  * in main():
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
+ *  in cocoa_display_init():
+ *   assign cocoa_main to qemu_main
+ *   create application, menus, etc
+ *  in cocoa_main():
+ *   create qemu-main thread
+ *   enter OSX run loop
  */
 
 static void *call_qemu_main(void *opaque)
 {
     int status;
 
-    COCOA_DEBUG("Second thread: calling qemu_main()\n");
-    status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
-    COCOA_DEBUG("Second thread: qemu_main() returned, exiting\n");
+    COCOA_DEBUG("Second thread: calling qemu_default_main()\n");
+    qemu_mutex_lock_iothread();
+    status = qemu_default_main();
+    qemu_mutex_unlock_iothread();
+    COCOA_DEBUG("Second thread: qemu_default_main() returned, exiting\n");
     [cbowner release];
     exit(status);
 }
 
-int main (int argc, char **argv) {
+static int cocoa_main()
+{
     QemuThread thread;
 
-    COCOA_DEBUG("Entered main()\n");
-    gArgc = argc;
-    gArgv = argv;
-
-    qemu_sem_init(&display_init_sem, 0);
-    qemu_sem_init(&app_started_sem, 0);
+    COCOA_DEBUG("Entered %s()\n", __func__);
 
+    qemu_mutex_unlock_iothread();
     qemu_thread_create(&thread, "qemu_main", call_qemu_main,
                        NULL, QEMU_THREAD_DETACHED);
 
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
-    // Create an Application controller
-    QemuCocoaAppController *appController = [[QemuCocoaAppController alloc] init];
-    [NSApp setDelegate:appController];
-
     // Start the main event loop
     COCOA_DEBUG("Main thread: entering OSX run loop\n");
     [NSApp run];
-    COCOA_DEBUG("Main thread: left OSX run loop, exiting\n");
+    COCOA_DEBUG("Main thread: left OSX run loop, which should never happen\n");
 
-    [appController release];
-    [pool release];
-
-    return 0;
+    abort();
 }
 
 
@@ -2083,25 +2020,42 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
 
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
@@ -2121,6 +2075,8 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_event_init(&cbevent, false);
     cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
     qemu_clipboard_peer_register(&cbpeer);
+
+    [pool release];
 }
 
 static QemuDisplay qemu_display_cocoa = {
-- 
2.37.3


