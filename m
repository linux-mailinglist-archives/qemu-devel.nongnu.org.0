Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5482C6427
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 13:02:23 +0100 (CET)
Received: from localhost ([::1]:58248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kicSB-0003pJ-Pq
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 07:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kicQd-0003I3-48
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:00:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kicQO-0001yQ-Lw
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606478425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WftYRWHj8Rb/gn0/VZRcWgh+dko2d0dsJLIa/BQZ+os=;
 b=PfpzZ7J1aB0YQ5Gsey12gf/mWWcmBEu7m94zksQWQJ9FsSBGKPOrB2bFDiReN+AW94vVCU
 ZsrluVTPBRMzcWrwNu0F75jRFlp6zjtKfwhHu929kndld2TtozWHPVr0Ivbc+C9zzzuEFP
 wDUMBxFbl2Kkznz157RxvUbS+bwa1Ks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-kTFuWI72MzSNul4_h8cdWg-1; Fri, 27 Nov 2020 07:00:23 -0500
X-MC-Unique: kTFuWI72MzSNul4_h8cdWg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25963185E49B
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 12:00:22 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D92C95D9CC;
 Fri, 27 Nov 2020 12:00:21 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 37/36] machine: introduce MachineInitPhase
Date: Fri, 27 Nov 2020 07:00:21 -0500
Message-Id: <20201127120021.3221679-1-pbonzini@redhat.com>
In-Reply-To: <20201123141435.2726558-1-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
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
Cc: imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generalize the qdev_hotplug variable to the different phases of
machine initialization.  We would like to allow different
monitor commands depending on the phase.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
	This has to be the last patch because patch 36 is where
	hw/core/machine.c takes care of setting qdev_hotplug to true.

	And this explains the weird [PATCH 00/37] in the previous
	version of the RFC. :)

 hw/core/machine-qmp-cmds.c |  6 +++---
 hw/core/machine.c          |  3 ++-
 hw/core/qdev.c             | 16 ++++++++++++++--
 hw/pci/pci.c               |  2 +-
 hw/usb/core.c              |  2 +-
 hw/virtio/virtio-iommu.c   |  2 +-
 include/hw/qdev-core.h     | 12 +++++++++++-
 monitor/hmp.c              |  2 +-
 softmmu/qdev-monitor.c     | 24 +++++++++++++-----------
 softmmu/vl.c               |  4 +++-
 ui/console.c               |  2 +-
 11 files changed, 51 insertions(+), 24 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index cb9387c5f5..6cbeb688c4 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -286,9 +286,9 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(Error **errp)
 
 void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
 {
-    if (qdev_hotplug) {
-         error_setg(errp, "The command is permitted only before the machine has been created");
-         return;
+    if (phase_check(PHASE_MACHINE_READY)) {
+        error_setg(errp, "The command is permitted only before the machine has been created");
+        return;
     }
 
     set_numa_options(MACHINE(qdev_get_machine()), cmd, errp);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 025c4f9749..a71cb23ecf 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1171,6 +1171,7 @@ void machine_run_board_init(MachineState *machine)
     }
 
     machine_class->init(machine);
+    phase_advance(PHASE_MACHINE_INITIALIZED);
 }
 
 static NotifierList machine_init_done_notifiers =
@@ -1204,7 +1205,7 @@ void qdev_machine_creation_done(void)
      * ok, initial machine setup is done, starting from now we can
      * only create hotpluggable devices
      */
-    qdev_hotplug = true;
+    phase_advance(PHASE_MACHINE_READY);
     qdev_assert_realized_properly();
 
     /* TODO: once all bus devices are qdevified, this should be done
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index bc5df8ce69..beb35879c6 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -41,7 +41,6 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 
-bool qdev_hotplug = false;
 static bool qdev_hot_added = false;
 bool qdev_hot_removed = false;
 
@@ -1023,7 +1022,7 @@ static void device_initfn(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
 
-    if (qdev_hotplug) {
+    if (phase_check(PHASE_MACHINE_READY)) {
         dev->hotplugged = 1;
         qdev_hot_added = true;
     }
@@ -1267,6 +1266,19 @@ Object *qdev_get_machine(void)
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
index fc5c75d693..8370fd80d7 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -928,7 +928,7 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
      * accept it. Having a different masks is possible but the guest will use
      * sub-optimal block sizes, so warn about it.
      */
-    if (qdev_hotplug) {
+    if (phase_check(PHASE_MACHINE_READY)) {
         int new_granule = ctz64(new_mask);
         int cur_granule = ctz64(cur_mask);
 
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 6446846752..05e7e7bc45 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -821,7 +821,6 @@ Object *qdev_get_machine(void);
 /* FIXME: make this a link<> */
 bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp);
 
-extern bool qdev_hotplug;
 extern bool qdev_hot_removed;
 
 char *qdev_get_dev_path(DeviceState *dev);
@@ -847,4 +846,15 @@ void device_listener_unregister(DeviceListener *listener);
  */
 bool qdev_should_hide_device(QemuOpts *opts);
 
+typedef enum MachineInitPhase {
+    PHASE_NO_MACHINE,
+    PHASE_MACHINE_CREATED,
+    PHASE_ACCEL_CREATED,
+    PHASE_MACHINE_INITIALIZED,
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
index e967d13bd0..184fe317af 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -244,7 +244,7 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
 
     dc = DEVICE_CLASS(oc);
     if (!dc->user_creatable ||
-        (qdev_hotplug && !dc->hotpluggable)) {
+        (phase_check(PHASE_MACHINE_READY) && !dc->hotpluggable)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
                    "pluggable device type");
         return NULL;
@@ -637,7 +637,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
     }
     hide = should_hide_device(opts);
 
-    if ((hide || qdev_hotplug) && bus && !qbus_is_hotpluggable(bus)) {
+    if ((hide || phase_check(PHASE_MACHINE_READY)) && bus && !qbus_is_hotpluggable(bus)) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
         return NULL;
     }
@@ -655,15 +655,17 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
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
@@ -1001,7 +1003,7 @@ int qemu_global_option(const char *str)
 
 bool qmp_command_available(const QmpCommand *cmd, Error **errp)
 {
-    if (!qdev_hotplug &&
+    if (!phase_check(PHASE_MACHINE_READY) &&
         !(cmd->options & QCO_ALLOW_PRECONFIG)) {
         error_setg(errp, "The command '%s' is permitted only after machine initialization has completed",
                    cmd->name);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1fde4a17a9..2dd5c2c775 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2451,7 +2451,7 @@ static void qemu_machine_creation_done(void)
 
 void qmp_x_exit_preconfig(Error **errp)
 {
-    if (qdev_hotplug) {
+    if (phase_check(PHASE_MACHINE_READY)) {
         error_setg(errp, "The command is permitted only before machine initialization");
         return;
     }
@@ -3428,12 +3428,14 @@ void qemu_init(int argc, char **argv, char **envp)
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
index e07d2c380d..3a98135daa 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1343,7 +1343,7 @@ static QemuConsole *new_console(DisplayState *ds, console_type_t console_type,
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


