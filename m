Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A577514EAA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:06:15 +0200 (CEST)
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSCE-0000Um-5B
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkRuz-0003PF-KU
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:48:25 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkRux-0000pu-LK
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:48:25 -0400
Received: from fraeml709-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KqZzF1d9Tz67J5F;
 Fri, 29 Apr 2022 22:45:29 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml709-chm.china.huawei.com (10.206.15.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 16:48:21 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 15:48:20 +0100
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>, 
 Marcel Apfelbaum <marcel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, <f4bug@amsat.org>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, Chris Browy <cbrowy@avery-design.com>,
 "Samarth Saxena" <samarths@cadence.com>, Dan Williams
 <dan.j.williams@intel.com>, <k.jensen@samsung.com>, <dave@stgolabs.net>,
 Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH v10 14/45] hw/pxb: Allow creation of a CXL PXB (host bridge)
Date: Fri, 29 Apr 2022 15:40:39 +0100
Message-ID: <20220429144110.25167-15-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
References: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml727-chm.china.huawei.com (10.201.108.78) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ben Widawsky <ben.widawsky@intel.com>

This works like adding a typical pxb device, except the name is
'pxb-cxl' instead of 'pxb-pcie'. An example command line would be as
follows:
  -device pxb-cxl,id=cxl.0,bus="pcie.0",bus_nr=1

A CXL PXB is backward compatible with PCIe. What this means in practice
is that an operating system that is unaware of CXL should still be able
to enumerate this topology as if it were PCIe.

One can create multiple CXL PXB host bridges, but a host bridge can only
be connected to the main root bus. Host bridges cannot appear elsewhere
in the topology.

Note that as of this patch, the ACPI tables needed for the host bridge
(specifically, an ACPI object in _SB named ACPI0016 and the CEDT) aren't
created. So while this patch internally creates it, it cannot be
properly used by an operating system or other system software.

Also necessary is to add an exception to scripts/device-crash-test
similar to that for exiting pxb as both must created on a PCIexpress
host bus.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan.Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/pci-bridge/pci_expander_bridge.c | 86 ++++++++++++++++++++++++++++-
 hw/pci/pci.c                        |  7 +++
 include/hw/pci/pci.h                |  6 ++
 scripts/device-crash-test           |  1 +
 4 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index a6caa1e7b5..f762eb4a6e 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -17,6 +17,7 @@
 #include "hw/pci/pci_host.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci_bridge.h"
+#include "hw/cxl/cxl.h"
 #include "qemu/range.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
@@ -56,6 +57,16 @@ DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
 DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
                          TYPE_PXB_PCIE_DEVICE)
 
+#define TYPE_PXB_CXL_DEVICE "pxb-cxl"
+DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
+                         TYPE_PXB_CXL_DEVICE)
+
+typedef struct CXLHost {
+    PCIHostState parent_obj;
+
+    CXLComponentState cxl_cstate;
+} CXLHost;
+
 struct PXBDev {
     /*< private >*/
     PCIDevice parent_obj;
@@ -68,6 +79,11 @@ struct PXBDev {
 
 static PXBDev *convert_to_pxb(PCIDevice *dev)
 {
+    /* A CXL PXB's parent bus is PCIe, so the normal check won't work */
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PXB_CXL_DEVICE)) {
+        return PXB_CXL_DEV(dev);
+    }
+
     return pci_bus_is_express(pci_get_bus(dev))
         ? PXB_PCIE_DEV(dev) : PXB_DEV(dev);
 }
@@ -112,11 +128,20 @@ static const TypeInfo pxb_pcie_bus_info = {
     .class_init    = pxb_bus_class_init,
 };
 
+static const TypeInfo pxb_cxl_bus_info = {
+    .name          = TYPE_PXB_CXL_BUS,
+    .parent        = TYPE_CXL_BUS,
+    .instance_size = sizeof(PXBBus),
+    .class_init    = pxb_bus_class_init,
+};
+
 static const char *pxb_host_root_bus_path(PCIHostState *host_bridge,
                                           PCIBus *rootbus)
 {
-    PXBBus *bus = pci_bus_is_express(rootbus) ?
-                  PXB_PCIE_BUS(rootbus) : PXB_BUS(rootbus);
+    PXBBus *bus = pci_bus_is_cxl(rootbus) ?
+                      PXB_CXL_BUS(rootbus) :
+                      pci_bus_is_express(rootbus) ? PXB_PCIE_BUS(rootbus) :
+                                                    PXB_BUS(rootbus);
 
     snprintf(bus->bus_path, 8, "0000:%02x", pxb_bus_num(rootbus));
     return bus->bus_path;
@@ -218,6 +243,10 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, int pin)
     return pin - PCI_SLOT(pxb->devfn);
 }
 
+static void pxb_dev_reset(DeviceState *dev)
+{
+}
+
 static gint pxb_compare(gconstpointer a, gconstpointer b)
 {
     const PXBDev *pxb_a = a, *pxb_b = b;
@@ -389,13 +418,66 @@ static const TypeInfo pxb_pcie_dev_info = {
     },
 };
 
+static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    /* A CXL PXB's parent bus is still PCIe */
+    if (!pci_bus_is_express(pci_get_bus(dev))) {
+        error_setg(errp, "pxb-cxl devices cannot reside on a PCI bus");
+        return;
+    }
+    if (!ms->cxl_devices_state->is_enabled) {
+        error_setg(errp, "Machine does not have cxl=on");
+        return;
+    }
+
+    pxb_dev_realize_common(dev, CXL, errp);
+    pxb_dev_reset(DEVICE(dev));
+}
+
+static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc   = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize             = pxb_cxl_dev_realize;
+    k->exit                = pxb_dev_exitfn;
+    /*
+     * XXX: These types of bridges don't actually show up in the hierarchy so
+     * vendor, device, class, etc. ids are intentionally left out.
+     */
+
+    dc->desc = "CXL Host Bridge";
+    device_class_set_props(dc, pxb_dev_properties);
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+
+    /* Host bridges aren't hotpluggable. FIXME: spec reference */
+    dc->hotpluggable = false;
+    dc->reset = pxb_dev_reset;
+}
+
+static const TypeInfo pxb_cxl_dev_info = {
+    .name          = TYPE_PXB_CXL_DEVICE,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(PXBDev),
+    .class_init    = pxb_cxl_dev_class_init,
+    .interfaces =
+        (InterfaceInfo[]){
+            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+            {},
+        },
+};
+
 static void pxb_register_types(void)
 {
     type_register_static(&pxb_bus_info);
     type_register_static(&pxb_pcie_bus_info);
+    type_register_static(&pxb_cxl_bus_info);
     type_register_static(&pxb_host_info);
     type_register_static(&pxb_dev_info);
     type_register_static(&pxb_pcie_dev_info);
+    type_register_static(&pxb_cxl_dev_info);
 }
 
 type_init(pxb_register_types)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 08bd2db2ad..41ec9ed43d 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -228,6 +228,12 @@ static const TypeInfo pcie_bus_info = {
     .class_init = pcie_bus_class_init,
 };
 
+static const TypeInfo cxl_bus_info = {
+    .name       = TYPE_CXL_BUS,
+    .parent     = TYPE_PCIE_BUS,
+    .class_init = pcie_bus_class_init,
+};
+
 static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
 static void pci_update_mappings(PCIDevice *d);
 static void pci_irq_handler(void *opaque, int irq_num, int level);
@@ -2945,6 +2951,7 @@ static void pci_register_types(void)
 {
     type_register_static(&pci_bus_info);
     type_register_static(&pcie_bus_info);
+    type_register_static(&cxl_bus_info);
     type_register_static(&conventional_pci_interface_info);
     type_register_static(&cxl_interface_info);
     type_register_static(&pcie_interface_info);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 98f0d1b844..44dacfa224 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -408,6 +408,7 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
 #define TYPE_PCI_BUS "PCI"
 OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
 #define TYPE_PCIE_BUS "PCIE"
+#define TYPE_CXL_BUS "CXL"
 
 typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque);
 typedef void (*pci_bus_fn)(PCIBus *b, void *opaque);
@@ -770,6 +771,11 @@ static inline void pci_irq_pulse(PCIDevice *pci_dev)
     pci_irq_deassert(pci_dev);
 }
 
+static inline int pci_is_cxl(const PCIDevice *d)
+{
+    return d->cap_present & QEMU_PCIE_CAP_CXL;
+}
+
 static inline int pci_is_express(const PCIDevice *d)
 {
     return d->cap_present & QEMU_PCI_CAP_EXPRESS;
diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 4bfc68c008..a203b3fdea 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -93,6 +93,7 @@ ERROR_RULE_LIST = [
     {'device':'pci-bridge', 'expected':True},              # Bridge chassis not specified. Each bridge is required to be assigned a unique chassis id > 0.
     {'device':'pci-bridge-seat', 'expected':True},         # Bridge chassis not specified. Each bridge is required to be assigned a unique chassis id > 0.
     {'device':'pxb', 'expected':True},                     # Bridge chassis not specified. Each bridge is required to be assigned a unique chassis id > 0.
+    {'device':'pxb-cxl', 'expected':True},                 # pxb-cxl devices cannot reside on a PCI bus.
     {'device':'scsi-block', 'expected':True},              # drive property not set
     {'device':'scsi-generic', 'expected':True},            # drive property not set
     {'device':'scsi-hd', 'expected':True},                 # drive property not set
-- 
2.32.0


