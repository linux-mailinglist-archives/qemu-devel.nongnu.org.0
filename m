Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E74C2CB814
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:07:07 +0100 (CET)
Received: from localhost ([::1]:60960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkO6M-0005ep-4G
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:07:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCy-0003Rj-U9
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCN-0003k2-4h
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ht4US+5pOoerk/gH7zEnBPKZlzGlnkzTTDX1Ts5dqx4=;
 b=Q25yGWIrlaiRg5vAfpxwHByG0PyhWycCt+emkhdWqrO+q7b6imfXx8aMeE4Uu95n5W92wZ
 XNPMbbQXMfDuZx5WswPtlRKU5AtbVlMN+JtrXvwUhxeNG7TUpNxHnZ+EDlctx6o6kETdqM
 8Rd/2UH0xyMqPr0EuG2nJGFAMo/4ILo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-qVYOfmbxMuO11wm5HoRhIw-1; Wed, 02 Dec 2020 03:09:11 -0500
X-MC-Unique: qVYOfmbxMuO11wm5HoRhIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06C5D1006C85
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:11 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4BE75D705
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:10 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 057/113] vl: move prelaunch part of qemu_init to new functions
Date: Wed,  2 Dec 2020 03:07:53 -0500
Message-Id: <20201202080849.4125477-58-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The final part of qemu_init, starting with the completion of
board init, is already relatively clean.  Split it out of
qemu_init so that qemu_init keeps only the messy parts.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 249 +++++++++++++++++++++++++++------------------------
 1 file changed, 134 insertions(+), 115 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 41a685bb5d..90f9782107 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -120,6 +120,9 @@
 static const char *cpu_option;
 static const char *data_dir[16];
 static int data_dir_idx;
+static const char *mem_path;
+static const char *boot_order;
+static const char *boot_once;
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
 int display_opengl;
 const char* keyboard_layout = NULL;
@@ -3002,6 +3005,134 @@ static void qemu_init_subsystems(void)
     socket_init();
 }
 
+/*
+ * Called after leaving preconfig state.  From here on runstate is
+ * RUN_STATE_PRELAUNCH or RUN_STATE_INMIGRATE.
+ */
+static void qemu_init_board(void)
+{
+    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
+
+    if (machine_class->default_ram_id && current_machine->ram_size &&
+        numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
+        create_default_memdev(current_machine, mem_path);
+    }
+
+    machine_run_board_init(current_machine);
+
+    /*
+     * TODO To drop support for deprecated bogus if=..., move
+     * drive_check_orphaned() here, replacing this call.  Also drop
+     * its deprecation warning, along with DriveInfo member
+     * @claimed_by_board.
+     */
+    drive_mark_claimed_by_board();
+
+    realtime_init();
+
+    if (hax_enabled()) {
+        /* FIXME: why isn't cpu_synchronize_all_post_init enough? */
+        hax_sync_vcpus();
+    }
+}
+
+static void qemu_create_cli_devices(void)
+{
+    soundhw_init();
+
+    qemu_opts_foreach(qemu_find_opts("fw_cfg"),
+                      parse_fw_cfg, fw_cfg_find(), &error_fatal);
+
+    /* init USB devices */
+    if (machine_usb(current_machine)) {
+        if (foreach_device_config(DEV_USB, usb_parse) < 0)
+            exit(1);
+    }
+
+    /* init generic devices */
+    rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
+    qemu_opts_foreach(qemu_find_opts("device"),
+                      device_init_func, NULL, &error_fatal);
+    rom_reset_order_override();
+}
+
+static void qemu_machine_creation_done(void)
+{
+    DisplayState *ds;
+
+    cpu_synchronize_all_post_init();
+
+    /* Did we create any drives that we failed to create a device for? */
+    drive_check_orphaned();
+
+    /* Don't warn about the default network setup that you get if
+     * no command line -net or -netdev options are specified. There
+     * are two cases that we would otherwise complain about:
+     * (1) board doesn't support a NIC but the implicit "-net nic"
+     * requested one
+     * (2) CONFIG_SLIRP not set, in which case the implicit "-net nic"
+     * sets up a nic that isn't connected to anything.
+     */
+    if (!default_net && (!qtest_enabled() || has_defaults)) {
+        net_check_clients();
+    }
+
+    if (boot_once) {
+        qemu_boot_set(boot_once, &error_fatal);
+        qemu_register_reset(restore_boot_order, g_strdup(boot_order));
+    }
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
+
+    if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
+        exit(1);
+    }
+
+    qdev_machine_creation_done();
+
+    /* TODO: once all bus devices are qdevified, this should be done
+     * when bus is created by qdev.c */
+    /*
+     * TODO: If we had a main 'reset container' that the whole system
+     * lived in, we could reset that using the multi-phase reset
+     * APIs. For the moment, we just reset the sysbus, which will cause
+     * all devices hanging off it (and all their child buses, recursively)
+     * to be reset. Note that this will *not* reset any Device objects
+     * which are not attached to some part of the qbus tree!
+     */
+    qemu_register_reset(resettable_cold_reset_fn, sysbus_get_default());
+    qemu_run_machine_init_done_notifiers();
+
+    if (rom_check_and_register_reset() != 0) {
+        error_report("rom check and register reset failed");
+        exit(1);
+    }
+
+    replay_start();
+
+    /* This checkpoint is required by replay to separate prior clock
+       reading from the other reads, because timer polling functions query
+       clock values from the log. */
+    replay_checkpoint(CHECKPOINT_RESET);
+    qemu_system_reset(SHUTDOWN_CAUSE_NONE);
+    register_global_state();
+}
+
 void qemu_init(int argc, char **argv, char **envp)
 {
     int i;
@@ -3009,9 +3140,6 @@ void qemu_init(int argc, char **argv, char **envp)
     int linux_boot;
     const char *initrd_filename;
     const char *kernel_filename, *kernel_cmdline;
-    const char *boot_order = NULL;
-    const char *boot_once = NULL;
-    DisplayState *ds;
     QemuOpts *opts, *machine_opts;
     QemuOpts *icount_opts = NULL, *accel_opts = NULL;
     QemuOptsList *olist;
@@ -3028,7 +3156,6 @@ void qemu_init(int argc, char **argv, char **envp)
     uint64_t ram_slots = 0;
     FILE *vmstate_dump_file = NULL;
     Error *err = NULL;
-    const char *mem_path = NULL;
     bool have_custom_ram_size;
     BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
     QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
@@ -4351,117 +4478,10 @@ void qemu_init(int argc, char **argv, char **envp)
     /* do monitor/qmp handling at preconfig state if requested */
     qemu_main_loop();
 
-    if (machine_class->default_ram_id && current_machine->ram_size &&
-        numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
-        create_default_memdev(current_machine, mem_path);
-    }
-
-    /* from here on runstate is RUN_STATE_PRELAUNCH */
-    machine_run_board_init(current_machine);
-
-    /*
-     * TODO To drop support for deprecated bogus if=..., move
-     * drive_check_orphaned() here, replacing this call.  Also drop
-     * its deprecation warning, along with DriveInfo member
-     * @claimed_by_board.
-     */
-    drive_mark_claimed_by_board();
-
-    realtime_init();
-
-    soundhw_init();
-
-    if (hax_enabled()) {
-        hax_sync_vcpus();
-    }
-
-    qemu_opts_foreach(qemu_find_opts("fw_cfg"),
-                      parse_fw_cfg, fw_cfg_find(), &error_fatal);
-
-    /* init USB devices */
-    if (machine_usb(current_machine)) {
-        if (foreach_device_config(DEV_USB, usb_parse) < 0)
-            exit(1);
-    }
-
-    /* init generic devices */
-    rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
-    qemu_opts_foreach(qemu_find_opts("device"),
-                      device_init_func, NULL, &error_fatal);
-
-    cpu_synchronize_all_post_init();
-
-    rom_reset_order_override();
-
-    /* Did we create any drives that we failed to create a device for? */
-    drive_check_orphaned();
-
-    /* Don't warn about the default network setup that you get if
-     * no command line -net or -netdev options are specified. There
-     * are two cases that we would otherwise complain about:
-     * (1) board doesn't support a NIC but the implicit "-net nic"
-     * requested one
-     * (2) CONFIG_SLIRP not set, in which case the implicit "-net nic"
-     * sets up a nic that isn't connected to anything.
-     */
-    if (!default_net && (!qtest_enabled() || has_defaults)) {
-        net_check_clients();
-    }
-
-    if (boot_once) {
-        qemu_boot_set(boot_once, &error_fatal);
-        qemu_register_reset(restore_boot_order, g_strdup(boot_order));
-    }
-
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
-    if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
-        exit(1);
-    }
-
-    qdev_machine_creation_done();
-
-    /* TODO: once all bus devices are qdevified, this should be done
-     * when bus is created by qdev.c */
-    /*
-     * TODO: If we had a main 'reset container' that the whole system
-     * lived in, we could reset that using the multi-phase reset
-     * APIs. For the moment, we just reset the sysbus, which will cause
-     * all devices hanging off it (and all their child buses, recursively)
-     * to be reset. Note that this will *not* reset any Device objects
-     * which are not attached to some part of the qbus tree!
-     */
-    qemu_register_reset(resettable_cold_reset_fn, sysbus_get_default());
-    qemu_run_machine_init_done_notifiers();
+    qemu_init_board();
+    qemu_create_cli_devices();
+    qemu_machine_creation_done();
 
-    if (rom_check_and_register_reset() != 0) {
-        error_report("rom check and register reset failed");
-        exit(1);
-    }
-
-    replay_start();
-
-    /* This checkpoint is required by replay to separate prior clock
-       reading from the other reads, because timer polling functions query
-       clock values from the log. */
-    replay_checkpoint(CHECKPOINT_RESET);
-    qemu_system_reset(SHUTDOWN_CAUSE_NONE);
-    register_global_state();
     if (loadvm) {
         Error *local_err = NULL;
         if (load_snapshot(loadvm, &local_err) < 0) {
@@ -4480,7 +4500,6 @@ void qemu_init(int argc, char **argv, char **envp)
         dump_vmstate_json_to_file(vmstate_dump_file);
         exit(0);
     }
-
     if (incoming) {
         Error *local_err = NULL;
         qemu_start_incoming_migration(incoming, &local_err);
-- 
2.26.2



