Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A2B543612
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:08:41 +0200 (CEST)
Received: from localhost ([::1]:53304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyxIV-0007Uy-Nn
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nyx7Q-0002KM-99
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:57:12 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nyx7O-0006kR-2Z
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:57:12 -0400
Received: from fraeml738-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LJ9Dj5lsYz685ZZ;
 Wed,  8 Jun 2022 22:52:21 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml738-chm.china.huawei.com (10.206.15.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 16:57:07 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 15:57:06 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v3 5/8] pci/pci_expander_bridge: For CXL HB delay the HB
 register memory region setup.
Date: Wed, 8 Jun 2022 15:54:37 +0100
Message-ID: <20220608145440.26106-6-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220608145440.26106-1-Jonathan.Cameron@huawei.com>
References: <20220608145440.26106-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml703-chm.china.huawei.com (10.201.108.52) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

As the CXLState will no long be accessible via MachineState
at time of PXB_CXL realization, come back later from the machine specific
code to fill in the missing memory region setup. Only at this stage
is it possible to check if cxl=on, so that check is moved to this
later point.

Note that for multiple host bridges, the allocation order of the
register spaces is changed. This will be reflected in ACPI CEDT.

Stubs are added to handle case of CONFIG_PXB=n for machines that
call these functions.

The bus walking logic is common to all machines so add a utility
function + stub to cxl-host*.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
---
 hw/cxl/cxl-host-stubs.c                     |  1 +
 hw/cxl/cxl-host.c                           | 20 +++++++++++++
 hw/i386/pc.c                                |  3 ++
 hw/pci-bridge/meson.build                   |  5 +++-
 hw/pci-bridge/pci_expander_bridge.c         | 32 +++++++++++++--------
 hw/pci-bridge/pci_expander_bridge_stubs.c   | 14 +++++++++
 include/hw/cxl/cxl_host.h                   |  1 +
 include/hw/pci-bridge/pci_expander_bridge.h | 12 ++++++++
 8 files changed, 75 insertions(+), 13 deletions(-)

diff --git a/hw/cxl/cxl-host-stubs.c b/hw/cxl/cxl-host-stubs.c
index e0d5ec8ad5..cae4afcdde 100644
--- a/hw/cxl/cxl-host-stubs.c
+++ b/hw/cxl/cxl-host-stubs.c
@@ -10,5 +10,6 @@
 
 void cxl_fmws_link_targets(CXLState *stat, Error **errp) {};
 void cxl_machine_init(Object *obj, CXLState *state) {};
+void cxl_hook_up_pxb_registers(PCIBus *bus, CXLState *state, Error **errp) {};
 
 const MemoryRegionOps cfmws_ops;
diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 8e7738a65b..efa14908d8 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -20,6 +20,7 @@
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci/pcie_port.h"
+#include "hw/pci-bridge/pci_expander_bridge.h"
 
 static void cxl_fixed_memory_window_config(CXLState *cxl_state,
                                            CXLFixedMemoryWindowOptions *object,
@@ -280,3 +281,22 @@ void cxl_machine_init(Object *obj, CXLState *state)
     object_property_set_description(obj, "cxl-fmw",
                                     "CXL Fixed Memory Windows (array)");
 }
+
+void cxl_hook_up_pxb_registers(PCIBus *bus, CXLState *state, Error **errp)
+{
+    /* Walk the pci busses looking for pxb busses to hook up */
+    if (bus) {
+        QLIST_FOREACH(bus, &bus->child, sibling) {
+            if (!pci_bus_is_root(bus)) {
+                continue;
+            }
+            if (pci_bus_is_cxl(bus)) {
+                if (!state->is_enabled) {
+                    error_setg(errp, "CXL host bridges present, but cxl=off");
+                    return;
+                }
+                pxb_cxl_hook_up_registers(state, bus, errp);
+            }
+        }
+    }
+}
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6cecd74d58..9f48d02739 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -37,6 +37,7 @@
 #include "hw/ide.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/pci-bridge/pci_expander_bridge.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/timer/hpet.h"
 #include "hw/firmware/smbios.h"
@@ -735,6 +736,8 @@ void pc_machine_done(Notifier *notifier, void *data)
     MachineState *ms = MACHINE(pcms);
 
     if (ms->cxl_devices_state) {
+        cxl_hook_up_pxb_registers(pcms->bus, ms->cxl_devices_state,
+                                  &error_fatal);
         cxl_fmws_link_targets(ms->cxl_devices_state, &error_fatal);
     }
 
diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
index b6d26a03d5..fdbe2e07c5 100644
--- a/hw/pci-bridge/meson.build
+++ b/hw/pci-bridge/meson.build
@@ -3,7 +3,8 @@ pci_ss.add(files('pci_bridge_dev.c'))
 pci_ss.add(when: 'CONFIG_I82801B11', if_true: files('i82801b11.c'))
 pci_ss.add(when: 'CONFIG_IOH3420', if_true: files('ioh3420.c'))
 pci_ss.add(when: 'CONFIG_PCIE_PORT', if_true: files('pcie_root_port.c', 'gen_pcie_root_port.c', 'pcie_pci_bridge.c'))
-pci_ss.add(when: 'CONFIG_PXB', if_true: files('pci_expander_bridge.c'))
+pci_ss.add(when: 'CONFIG_PXB', if_true: files('pci_expander_bridge.c'),
+                               if_false: files('pci_expander_bridge_stubs.c'))
 pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c', 'xio3130_downstream.c'))
 pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c'))
 
@@ -13,3 +14,5 @@ pci_ss.add(when: 'CONFIG_DEC_PCI', if_true: files('dec.c'))
 pci_ss.add(when: 'CONFIG_SIMBA', if_true: files('simba.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
+
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('pci_expander_bridge_stubs.c'))
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 02032360f5..c9e817aa58 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -17,6 +17,7 @@
 #include "hw/pci/pci_host.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci_bridge.h"
+#include "hw/pci-bridge/pci_expander_bridge.h"
 #include "hw/cxl/cxl.h"
 #include "qemu/range.h"
 #include "qemu/error-report.h"
@@ -186,25 +187,38 @@ static const TypeInfo pxb_host_info = {
 
 static void pxb_cxl_realize(DeviceState *dev, Error **errp)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     CXLHost *cxl = PXB_CXL_HOST(dev);
     CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
     struct MemoryRegion *mr = &cxl_cstate->crb.component_registers;
-    hwaddr offset;
 
     cxl_component_register_block_init(OBJECT(dev), cxl_cstate,
                                       TYPE_PXB_CXL_HOST);
     sysbus_init_mmio(sbd, mr);
+}
+
+/*
+ * Host bridge realization has no means of knowning state associated
+ * with a particular machine. As such, it is nececssary to delay
+ * final setup of the host bridge register space until later in the
+ * machine bring up.
+ */
+void pxb_cxl_hook_up_registers(CXLState *cxl_state, PCIBus *bus, Error **errp)
+{
+    PXBDev *pxb =  PXB_CXL_DEV(pci_bridge_get_device(bus));
+    CXLHost *cxl = pxb->cxl.cxl_host_bridge;
+    CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
+    struct MemoryRegion *mr = &cxl_cstate->crb.component_registers;
+    hwaddr offset;
 
-    offset = memory_region_size(mr) * ms->cxl_devices_state->next_mr_idx;
-    if (offset > memory_region_size(&ms->cxl_devices_state->host_mr)) {
+    offset = memory_region_size(mr) * cxl_state->next_mr_idx;
+    if (offset > memory_region_size(&cxl_state->host_mr)) {
         error_setg(errp, "Insufficient space for pxb cxl host register space");
         return;
     }
 
-    memory_region_add_subregion(&ms->cxl_devices_state->host_mr, offset, mr);
-    ms->cxl_devices_state->next_mr_idx++;
+    memory_region_add_subregion(&cxl_state->host_mr, offset, mr);
+    cxl_state->next_mr_idx++;
 }
 
 static void pxb_cxl_host_class_init(ObjectClass *class, void *data)
@@ -461,17 +475,11 @@ static const TypeInfo pxb_pcie_dev_info = {
 
 static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
-
     /* A CXL PXB's parent bus is still PCIe */
     if (!pci_bus_is_express(pci_get_bus(dev))) {
         error_setg(errp, "pxb-cxl devices cannot reside on a PCI bus");
         return;
     }
-    if (!ms->cxl_devices_state || !ms->cxl_devices_state->is_enabled) {
-        error_setg(errp, "Machine does not have cxl=on");
-        return;
-    }
 
     pxb_dev_realize_common(dev, CXL, errp);
     pxb_dev_reset(DEVICE(dev));
diff --git a/hw/pci-bridge/pci_expander_bridge_stubs.c b/hw/pci-bridge/pci_expander_bridge_stubs.c
new file mode 100644
index 0000000000..b35180311f
--- /dev/null
+++ b/hw/pci-bridge/pci_expander_bridge_stubs.c
@@ -0,0 +1,14 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Stubs for calls made from machines to handle the case where CONFIG_PXB
+ * is not enabled.
+ */
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci-bridge/pci_expander_bridge.h"
+#include "hw/cxl/cxl.h"
+
+void pxb_cxl_hook_up_registers(CXLState *state, PCIBus *bus, Error **errp) {};
diff --git a/include/hw/cxl/cxl_host.h b/include/hw/cxl/cxl_host.h
index 4d642a81fa..a1b662ce40 100644
--- a/include/hw/cxl/cxl_host.h
+++ b/include/hw/cxl/cxl_host.h
@@ -16,6 +16,7 @@
 
 void cxl_machine_init(Object *obj, CXLState *state);
 void cxl_fmws_link_targets(CXLState *stat, Error **errp);
+void cxl_hook_up_pxb_registers(PCIBus *bus, CXLState *state, Error **errp);
 
 extern const MemoryRegionOps cfmws_ops;
 
diff --git a/include/hw/pci-bridge/pci_expander_bridge.h b/include/hw/pci-bridge/pci_expander_bridge.h
new file mode 100644
index 0000000000..0b3856d615
--- /dev/null
+++ b/include/hw/pci-bridge/pci_expander_bridge.h
@@ -0,0 +1,12 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef PCI_EXPANDER_BRIDGE_H
+#define PCI_EXPANDER_BRIDGE_H
+
+#include "hw/cxl/cxl.h"
+
+void pxb_cxl_hook_up_registers(CXLState *state, PCIBus *bus, Error **errp);
+
+#endif /* PCI_EXPANDER_BRIDGE_H */
-- 
2.32.0


