Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18FF2DB330
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:01:39 +0100 (CET)
Received: from localhost ([::1]:60652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEdm-00025K-A1
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXI-000308-HF
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:54:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXE-0001SS-JV
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:54:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQQPBNkfcJsFiBKV4tfYovBE3sDVUDeqGyei4quWNRg=;
 b=Z8pMj0w4IG8Y5xNe0cMgm+NuzGCCPQCzFcg769fa/rW3tUpm77yZO9lT1dfo9KgrLbiOBY
 COzuqbxvgqrVpkGiZdUh3hicw8mHqf1TnUdMW4D5fEv+KGMcKEo6B6SV7ENYE0eBDbTQ7D
 +vYGOCiUlONJQui6ejdjAkAxQP/ay/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-MbWwDKYVPzmPGUoQ3hcIDw-1; Tue, 15 Dec 2020 12:54:50 -0500
X-MC-Unique: MbWwDKYVPzmPGUoQ3hcIDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C346801817
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE61F60C15
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/45] machine: introduce MachineInitPhase
Date: Tue, 15 Dec 2020 12:54:08 -0500
Message-Id: <20201215175445.1272776-9-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Generalize the qdev_hotplug variable to the different phases of
machine initialization.  We would like to allow different
monitor commands depending on the phase.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine-qmp-cmds.c |  6 +++---
 hw/core/machine.c          |  8 +++-----
 hw/core/qdev.c             | 16 ++++++++++++++--
 hw/pci/pci.c               |  2 +-
 hw/usb/core.c              |  2 +-
 hw/virtio/virtio-iommu.c   |  2 +-
 include/hw/qdev-core.h     | 32 +++++++++++++++++++++++++++++++-
 monitor/hmp.c              |  2 +-
 softmmu/qdev-monitor.c     | 24 +++++++++++++-----------
 softmmu/vl.c               |  9 ++++-----
 ui/console.c               |  2 +-
 11 files changed, 73 insertions(+), 32 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index cb9387c5f5..87f14140a3 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -286,9 +286,9 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(Error **errp)
 
 void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
 {
-    if (qdev_hotplug) {
-         error_setg(errp, "The command is permitted only before the machine has been created");
-         return;
+    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
+        error_setg(errp, "The command is permitted only before the machine has been created");
+        return;
     }
 
     set_numa_options(MACHINE(qdev_get_machine()), cmd, errp);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 07268afe52..607eb88291 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1174,17 +1174,16 @@ void machine_run_board_init(MachineState *machine)
     }
 
     machine_class->init(machine);
+    phase_advance(PHASE_MACHINE_INITIALIZED);
 }
 
 static NotifierList machine_init_done_notifiers =
     NOTIFIER_LIST_INITIALIZER(machine_init_done_notifiers);
 
-static bool machine_init_done;
-
 void qemu_add_machine_init_done_notifier(Notifier *notify)
 {
     notifier_list_add(&machine_init_done_notifiers, notify);
-    if (machine_init_done) {
+    if (phase_check(PHASE_MACHINE_READY)) {
         notify->notify(notify, NULL);
     }
 }
@@ -1207,7 +1206,7 @@ void qdev_machine_creation_done(void)
      * ok, initial machine setup is done, starting from now we can
      * only create hotpluggable devices
      */
-    qdev_hotplug = true;
+    phase_advance(PHASE_MACHINE_READY);
     qdev_assert_realized_properly();
 
     /* TODO: once all bus devices are qdevified, this should be done
@@ -1222,7 +1221,6 @@ void qdev_machine_creation_done(void)
      */
     qemu_register_reset(resettable_cold_reset_fn, sysbus_get_default());
 
-    machine_init_done = true;
     notifier_list_notify(&machine_init_done_notifiers, NULL);
 
     if (rom_check_and_register_reset() != 0) {
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index dddb0b2d69..cefc5eaa0a 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -41,7 +41,6 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 
-bool qdev_hotplug = false;
 static bool qdev_hot_added = false;
 bool qdev_hot_removed = false;
 
@@ -905,7 +904,7 @@ static void device_initfn(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
 
-    if (qdev_hotplug) {
+    if (phase_check(PHASE_MACHINE_READY)) {
         dev->hotplugged = 1;
         qdev_hot_added = true;
     }
@@ -1138,6 +1137,19 @@ Object *qdev_get_machine(void)
     return dev;
 }
 
+static MachineInitPhase machine_phase;
+
+bool phase_check(MachineInitPhase phase)
+{
+    return machine_phase >= phase;
+}
+
+void phase_advance(MachineInitPhase phase)
+{
+    assert(machine_phase == phase - 1);
+    machine_phase = phase;
+}
+
 static const TypeInfo device_type_info = {
     .name = TYPE_DEVICE,
     .parent = TYPE_OBJECT,
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 9424231542..d4349ea577 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1062,7 +1062,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
     address_space_init(&pci_dev->bus_master_as,
                        &pci_dev->bus_master_container_region, pci_dev->name);
 
-    if (qdev_hotplug) {
+    if (phase_check(PHASE_MACHINE_READY)) {
         pci_init_bus_master(pci_dev);
     }
     pci_dev->irq_state = 0;
diff --git a/hw/usb/core.c b/hw/usb/core.c
index 5234dcc73f..e960036f4d 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -97,7 +97,7 @@ void usb_wakeup(USBEndpoint *ep, unsigned int stream)
     USBDevice *dev = ep->dev;
     USBBus *bus = usb_bus_from_device(dev);
 
-    if (!qdev_hotplug) {
+    if (!phase_check(PHASE_MACHINE_READY)) {
         /*
          * This is machine init cold plug.  No need to wakeup anyone,
          * all devices will be reset anyway.  And trying to wakeup can
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index cea8811295..6b9ef7f6b2 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -930,7 +930,7 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
      * accept it. Having a different masks is possible but the guest will use
      * sub-optimal block sizes, so warn about it.
      */
-    if (qdev_hotplug) {
+    if (phase_check(PHASE_MACHINE_READY)) {
         int new_granule = ctz64(new_mask);
         int cur_granule = ctz64(cur_mask);
 
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 3dab50cd87..bafc311bfa 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -786,7 +786,6 @@ Object *qdev_get_machine(void);
 /* FIXME: make this a link<> */
 bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp);
 
-extern bool qdev_hotplug;
 extern bool qdev_hot_removed;
 
 char *qdev_get_dev_path(DeviceState *dev);
@@ -812,4 +811,35 @@ void device_listener_unregister(DeviceListener *listener);
  */
 bool qdev_should_hide_device(QemuOpts *opts);
 
+typedef enum MachineInitPhase {
+    /* current_machine is NULL.  */
+    PHASE_NO_MACHINE,
+
+    /* current_machine is not NULL, but current_machine->accel is NULL.  */
+    PHASE_MACHINE_CREATED,
+
+    /*
+     * current_machine->accel is not NULL, but the machine properties have
+     * not been validated and machine_class->init has not yet been called.
+     */
+    PHASE_ACCEL_CREATED,
+
+    /*
+     * machine_class->init has been called, thus creating any embedded
+     * devices and validating machine properties.  Devices created at
+     * this time are considered to be cold-plugged.
+     */
+    PHASE_MACHINE_INITIALIZED,
+
+    /*
+     * QEMU is ready to start CPUs and devices created at this time
+     * are considered to be hot-plugged.  The monitor is not restricted
+     * to "preconfig" commands.
+     */
+    PHASE_MACHINE_READY,
+} MachineInitPhase;
+
+extern bool phase_check(MachineInitPhase phase);
+extern void phase_advance(MachineInitPhase phase);
+
 #endif
diff --git a/monitor/hmp.c b/monitor/hmp.c
index f2fe192d69..6c0b33a0b1 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -216,7 +216,7 @@ static bool cmd_can_preconfig(const HMPCommand *cmd)
 
 static bool cmd_available(const HMPCommand *cmd)
 {
-    return qdev_hotplug || cmd_can_preconfig(cmd);
+    return phase_check(PHASE_MACHINE_READY) || cmd_can_preconfig(cmd);
 }
 
 static void help_cmd_dump_one(Monitor *mon,
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 3f1e67267d..2c57e36c9a 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -245,7 +245,7 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
 
     dc = DEVICE_CLASS(oc);
     if (!dc->user_creatable ||
-        (qdev_hotplug && !dc->hotpluggable)) {
+        (phase_check(PHASE_MACHINE_READY) && !dc->hotpluggable)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
                    "a pluggable device type");
         return NULL;
@@ -627,7 +627,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         }
     }
 
-    if (qdev_hotplug && bus && !qbus_is_hotpluggable(bus)) {
+    if (phase_check(PHASE_MACHINE_READY) && bus && !qbus_is_hotpluggable(bus)) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
         return NULL;
     }
@@ -641,15 +641,17 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
     dev = qdev_new(driver);
 
     /* Check whether the hotplug is allowed by the machine */
-    if (qdev_hotplug && !qdev_hotplug_allowed(dev, errp)) {
-        goto err_del_dev;
-    }
+    if (phase_check(PHASE_MACHINE_READY)) {
+        if (!qdev_hotplug_allowed(dev, errp)) {
+            goto err_del_dev;
+        }
 
-    if (!bus && qdev_hotplug && !qdev_get_machine_hotplug_handler(dev)) {
-        /* No bus, no machine hotplug handler --> device is not hotpluggable */
-        error_setg(errp, "Device '%s' can not be hotplugged on this machine",
-                   driver);
-        goto err_del_dev;
+        if (!bus && !qdev_get_machine_hotplug_handler(dev)) {
+            /* No bus, no machine hotplug handler --> device is not hotpluggable */
+            error_setg(errp, "Device '%s' can not be hotplugged on this machine",
+                       driver);
+            goto err_del_dev;
+        }
     }
 
     qdev_set_id(dev, qemu_opts_id(opts));
@@ -987,7 +989,7 @@ int qemu_global_option(const char *str)
 
 bool qmp_command_available(const QmpCommand *cmd, Error **errp)
 {
-    if (!qdev_hotplug &&
+    if (!phase_check(PHASE_MACHINE_READY) &&
         !(cmd->options & QCO_ALLOW_PRECONFIG)) {
         error_setg(errp, "The command '%s' is permitted only after machine initialization has completed",
                    cmd->name);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 8e18c52f6e..4fece1b9db 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2406,10 +2406,6 @@ static void qemu_init_displays(void)
     }
 }
 
-/*
- * Called after leaving preconfig state.  From here on runstate is
- * RUN_STATE_PRELAUNCH or RUN_STATE_INMIGRATE.
- */
 static void qemu_init_board(void)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
@@ -2424,6 +2420,7 @@ static void qemu_init_board(void)
         exit(1);
     }
 
+    /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
     machine_run_board_init(current_machine);
 
     /*
@@ -2490,7 +2487,7 @@ static void qemu_machine_creation_done(void)
 
 void qmp_x_exit_preconfig(Error **errp)
 {
-    if (qdev_hotplug) {
+    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
         error_setg(errp, "The command is permitted only before machine initialization");
         return;
     }
@@ -3469,12 +3466,14 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_create_early_backends();
 
     qemu_apply_machine_options();
+    phase_advance(PHASE_MACHINE_CREATED);
 
     /*
      * Note: uses machine properties such as kernel-irqchip, must run
      * after machine_set_property().
      */
     configure_accelerators(argv[0]);
+    phase_advance(PHASE_ACCEL_CREATED);
 
     /*
      * Beware, QOM objects created before this point miss global and
diff --git a/ui/console.c b/ui/console.c
index 30e70be555..4db5b04cc2 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1345,7 +1345,7 @@ static QemuConsole *new_console(DisplayState *ds, console_type_t console_type,
     if (QTAILQ_EMPTY(&consoles)) {
         s->index = 0;
         QTAILQ_INSERT_TAIL(&consoles, s, next);
-    } else if (console_type != GRAPHIC_CONSOLE || qdev_hotplug) {
+    } else if (console_type != GRAPHIC_CONSOLE || phase_check(PHASE_MACHINE_READY)) {
         QemuConsole *last = QTAILQ_LAST(&consoles);
         s->index = last->index + 1;
         QTAILQ_INSERT_TAIL(&consoles, s, next);
-- 
2.26.2



