Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB54737F440
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 10:38:03 +0200 (CEST)
Received: from localhost ([::1]:57364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh6r4-0005Rc-O9
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 04:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gL-0004np-Cm
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:26:57 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:56654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gI-0001G2-W5
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:26:57 -0400
Received: from localhost.localdomain (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id BE09421C73;
 Thu, 13 May 2021 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620894413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WNo7CtIlV1nUC+MT6o5NPS0vP03TQKdfgKYWl92rKaI=;
 b=raUbx9PLXmb6hfdp3VFgz2D7CZIglCEIMch2nis1ZPVm+1Myie5iyt5VAqkJMBlE9Zp/rV
 G9+i7vfzHT/S2wqpDUdUArIymP2RUcXPCOC60O5f8BU++9vCyRH5mtG6+8iCL506WYoqdt
 9XGcMCDfem16g/DSNkXtfnBwpLG1o60=
From: Mirela Grujic <mirela.grujic@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/9] replace machine phase_check with
 machine_is_initialized/ready calls
Date: Thu, 13 May 2021 10:25:42 +0200
Message-Id: <20210513082549.114275-3-mirela.grujic@greensocs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513082549.114275-1-mirela.grujic@greensocs.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mirela.grujic@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 mark.burton@greensocs.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Once we define MachineInitPhase in qapi, the generated enumeration
constants will be prefixed with the MACHINE_INIT_PHASE_.
We need to define the MachineInitPhase enum in qapi in order to
add the QMP command that will query current machine init phase.

Since in the existing definition of enum MachineInitPhase the
enumeration constants are prefixed with PHASE_, there will be a
massive find/replace to rename the existing enum constants.
We'll do this in 2 phases:
1) hide explicit use of PHASE_ prefixed enums by replacing
    phase_check(PHASE_MACHINE_INITIALIZED) -> machine_is_initialized()
    phase_check(PHASE_MACHINE_READY) -> machine_is_ready()
2) rename enums

Once 1) and 2) are done MachineInitPhase enum will be generated.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 include/hw/qdev-core.h     |  2 ++
 hw/core/machine-qmp-cmds.c |  2 +-
 hw/core/machine.c          |  2 +-
 hw/core/qdev.c             | 12 +++++++++++-
 hw/pci/pci.c               |  2 +-
 hw/usb/core.c              |  2 +-
 hw/virtio/virtio-iommu.c   |  2 +-
 monitor/hmp.c              |  2 +-
 softmmu/qdev-monitor.c     |  9 ++++-----
 softmmu/vl.c               |  2 +-
 ui/console.c               |  2 +-
 11 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 6e52240d92..5e3c6d4482 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -842,5 +842,7 @@ typedef enum MachineInitPhase {
 extern bool phase_check(MachineInitPhase phase);
 extern void phase_advance(MachineInitPhase phase);
 extern MachineInitPhase phase_get(void);
+extern bool machine_is_initialized(void);
+extern bool machine_is_ready(void);
 
 #endif
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 68a942595a..be286882cc 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -149,7 +149,7 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(Error **errp)
 
 void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
 {
-    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
+    if (machine_is_initialized()) {
         error_setg(errp, "The command is permitted only before the machine has been created");
         return;
     }
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 40def78183..eba046924d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1239,7 +1239,7 @@ static NotifierList machine_init_done_notifiers =
 void qemu_add_machine_init_done_notifier(Notifier *notify)
 {
     notifier_list_add(&machine_init_done_notifiers, notify);
-    if (phase_check(PHASE_MACHINE_READY)) {
+    if (machine_is_ready()) {
         notify->notify(notify, NULL);
     }
 }
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 4a4a4d8c52..71906170f9 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -904,7 +904,7 @@ static void device_initfn(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
 
-    if (phase_check(PHASE_MACHINE_READY)) {
+    if (machine_is_ready()) {
         dev->hotplugged = 1;
         qdev_hot_added = true;
     }
@@ -1155,6 +1155,16 @@ MachineInitPhase phase_get(void)
     return machine_phase;
 }
 
+bool machine_is_initialized(void)
+{
+    return machine_phase >= PHASE_MACHINE_INITIALIZED;
+}
+
+bool machine_is_ready(void)
+{
+    return machine_phase >= PHASE_MACHINE_READY;
+}
+
 static const TypeInfo device_type_info = {
     .name = TYPE_DEVICE,
     .parent = TYPE_OBJECT,
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8f35e13a0c..19b584c3d1 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1071,7 +1071,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
     address_space_init(&pci_dev->bus_master_as,
                        &pci_dev->bus_master_container_region, pci_dev->name);
 
-    if (phase_check(PHASE_MACHINE_READY)) {
+    if (machine_is_ready()) {
         pci_init_bus_master(pci_dev);
     }
     pci_dev->irq_state = 0;
diff --git a/hw/usb/core.c b/hw/usb/core.c
index 975f76250a..2ec0dea6a0 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -97,7 +97,7 @@ void usb_wakeup(USBEndpoint *ep, unsigned int stream)
     USBDevice *dev = ep->dev;
     USBBus *bus = usb_bus_from_device(dev);
 
-    if (!phase_check(PHASE_MACHINE_READY)) {
+    if (!machine_is_ready()) {
         /*
          * This is machine init cold plug.  No need to wakeup anyone,
          * all devices will be reset anyway.  And trying to wakeup can
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1b23e8e18c..8b1bcb2848 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -948,7 +948,7 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
      * accept it. Having a different masks is possible but the guest will use
      * sub-optimal block sizes, so warn about it.
      */
-    if (phase_check(PHASE_MACHINE_READY)) {
+    if (machine_is_ready()) {
         int new_granule = ctz64(new_mask);
         int cur_granule = ctz64(cur_mask);
 
diff --git a/monitor/hmp.c b/monitor/hmp.c
index 6c0b33a0b1..c24511db6d 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -216,7 +216,7 @@ static bool cmd_can_preconfig(const HMPCommand *cmd)
 
 static bool cmd_available(const HMPCommand *cmd)
 {
-    return phase_check(PHASE_MACHINE_READY) || cmd_can_preconfig(cmd);
+    return machine_is_ready() || cmd_can_preconfig(cmd);
 }
 
 static void help_cmd_dump_one(Monitor *mon,
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index a9955b97a0..be8a892517 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -254,7 +254,7 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
 
     dc = DEVICE_CLASS(oc);
     if (!dc->user_creatable ||
-        (phase_check(PHASE_MACHINE_READY) && !dc->hotpluggable)) {
+        (machine_is_ready() && !dc->hotpluggable)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
                    "a pluggable device type");
         return NULL;
@@ -636,7 +636,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         }
     }
 
-    if (phase_check(PHASE_MACHINE_READY) && bus && !qbus_is_hotpluggable(bus)) {
+    if (machine_is_ready() && bus && !qbus_is_hotpluggable(bus)) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
         return NULL;
     }
@@ -650,7 +650,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
     dev = qdev_new(driver);
 
     /* Check whether the hotplug is allowed by the machine */
-    if (phase_check(PHASE_MACHINE_READY)) {
+    if (machine_is_ready()) {
         if (!qdev_hotplug_allowed(dev, errp)) {
             goto err_del_dev;
         }
@@ -998,8 +998,7 @@ int qemu_global_option(const char *str)
 
 bool qmp_command_available(const QmpCommand *cmd, Error **errp)
 {
-    if (!phase_check(PHASE_MACHINE_READY) &&
-        !(cmd->options & QCO_ALLOW_PRECONFIG)) {
+    if (!machine_is_ready() && !(cmd->options & QCO_ALLOW_PRECONFIG)) {
         error_setg(errp, "The command '%s' is permitted only after machine initialization has completed",
                    cmd->name);
         return false;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index cbf62abeb4..3af9743ceb 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2636,7 +2636,7 @@ static void qemu_machine_enter_phase(MachineInitPhase target_phase,
 
 void qmp_x_exit_preconfig(Error **errp)
 {
-    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
+    if (machine_is_initialized()) {
         error_setg(errp, "The command is permitted only before machine initialization");
         return;
     }
diff --git a/ui/console.c b/ui/console.c
index 2de5f4105b..3513da6a54 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1353,7 +1353,7 @@ static QemuConsole *new_console(DisplayState *ds, console_type_t console_type,
     if (QTAILQ_EMPTY(&consoles)) {
         s->index = 0;
         QTAILQ_INSERT_TAIL(&consoles, s, next);
-    } else if (console_type != GRAPHIC_CONSOLE || phase_check(PHASE_MACHINE_READY)) {
+    } else if (console_type != GRAPHIC_CONSOLE || machine_is_ready()) {
         QemuConsole *last = QTAILQ_LAST(&consoles);
         s->index = last->index + 1;
         QTAILQ_INSERT_TAIL(&consoles, s, next);
-- 
2.25.1


