Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069A72CB80E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:04:02 +0100 (CET)
Received: from localhost ([::1]:53018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkO3L-0001tD-OO
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkND4-0003TI-OA
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCS-0003mK-Py
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lPtkCMrw59X+r/5tChbjmh1zpKFLCVCtXqdsXYufkW0=;
 b=ReJrb3KgCFKF2B9PKVwVsZEkjwohgYJGcvW3LRYtMHjA93kKCT4M9BZq1z6GKiSRLEsPr+
 PxE0siMSkxa+AFC8oX690ZIOEFChZotjyy3s6qICAQIz7ZqpoCigXdrkTTfvQB1Gx5zsjX
 uL3Q4tJmSnqAxQ+UTum1qeBju03NowU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-i8HHR9ocO5e-dru7F2rfBA-1; Wed, 02 Dec 2020 03:09:17 -0500
X-MC-Unique: i8HHR9ocO5e-dru7F2rfBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C28068558EF
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:16 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EBBC5D9C6
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:16 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 071/113] vl: initialize displays before preconfig loop
Date: Wed,  2 Dec 2020 03:08:07 -0500
Message-Id: <20201202080849.4125477-72-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Displays should be available before the monitor starts, so that
it is possible to use the graphical console to interact with
the monitor itself.

This patch is quite ugly, but all this is temporary.  The double
call to qemu_init_displays will go away as soon we can unify machine
initialization between the preconfig and "normal" flows, and so will
the preconfig_exit_requested variable (that is only preconfig_requested
remains).

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 57 +++++++++++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 21 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 891f959572..6a2972938d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -137,6 +137,7 @@ static ram_addr_t maxram_size;
 static uint64_t ram_slots;
 static int display_remote;
 static int snapshot;
+static bool preconfig_requested;
 static QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
 static BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
 static bool nographic = false;
@@ -3223,12 +3224,12 @@ static void qemu_validate_options(void)
           }
     }
 
-    if (loadvm && !preconfig_exit_requested) {
+    if (loadvm && preconfig_requested) {
         error_report("'preconfig' and 'loadvm' options are "
                      "mutually exclusive");
         exit(EXIT_FAILURE);
     }
-    if (incoming && !preconfig_exit_requested) {
+    if (incoming && preconfig_requested) {
         error_report("'preconfig' and 'incoming' options are "
                      "mutually exclusive");
         exit(EXIT_FAILURE);
@@ -3392,6 +3393,28 @@ static void qemu_init_subsystems(void)
     socket_init();
 }
 
+static void qemu_init_displays(void)
+{
+    DisplayState *ds;
+
+    /* init local displays */
+    ds = init_displaystate();
+    qemu_display_init(ds, &dpy);
+
+    /* must be after terminal init, SDL library changes signal handlers */
+    os_setup_signal_handling();
+
+    /* init remote displays */
+#ifdef CONFIG_VNC
+    qemu_opts_foreach(qemu_find_opts("vnc"),
+                      vnc_init_func, NULL, &error_fatal);
+#endif
+
+    if (using_spice) {
+        qemu_spice.display_init();
+    }
+}
+
 /*
  * Called after leaving preconfig state.  From here on runstate is
  * RUN_STATE_PRELAUNCH or RUN_STATE_INMIGRATE.
@@ -3450,8 +3473,6 @@ static void qemu_create_cli_devices(void)
 
 static void qemu_machine_creation_done(void)
 {
-    DisplayState *ds;
-
     cpu_synchronize_all_post_init();
 
     /* Did we create any drives that we failed to create a device for? */
@@ -3474,23 +3495,6 @@ static void qemu_machine_creation_done(void)
         qemu_register_reset(restore_boot_order, g_strdup(boot_order));
     }
 
-    /* init local displays */
-    ds = init_displaystate();
-    qemu_display_init(ds, &dpy);
-
-    /* must be after terminal init, SDL library changes signal handlers */
-    os_setup_signal_handling();
-
-    /* init remote displays */
-#ifdef CONFIG_VNC
-    qemu_opts_foreach(qemu_find_opts("vnc"),
-                      vnc_init_func, NULL, &error_fatal);
-#endif
-
-    if (using_spice) {
-        qemu_spice.display_init();
-    }
-
     if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
         exit(1);
     }
@@ -4090,6 +4094,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 break;
             case QEMU_OPTION_preconfig:
                 preconfig_exit_requested = false;
+                preconfig_requested = true;
                 break;
             case QEMU_OPTION_enable_kvm:
                 olist = qemu_find_opts("machine");
@@ -4513,11 +4518,21 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_resolve_machine_memdev();
     parse_numa_opts(current_machine);
 
+    if (preconfig_requested) {
+        qemu_init_displays();
+    }
+
     /* do monitor/qmp handling at preconfig state if requested */
     qemu_main_loop();
 
     qemu_init_board();
+
     qemu_create_cli_devices();
+
+    /* initialize displays after all errors have been reported */
+    if (!preconfig_requested) {
+        qemu_init_displays();
+    }
     qemu_machine_creation_done();
 
     if (loadvm) {
-- 
2.26.2



