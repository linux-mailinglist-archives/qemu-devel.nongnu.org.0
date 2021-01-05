Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190CA2EB109
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:09:19 +0100 (CET)
Received: from localhost ([::1]:42198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwppe-0000ki-0C
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:09:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbR-0000Im-7K
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:37 -0500
Received: from mga11.intel.com ([192.55.52.93]:21248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbP-00012W-4T
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:36 -0500
IronPort-SDR: BPbRzsyU54z+hKSbDGfMl3InzA/X/MrA09gCNW6vTcpsQKqIP8wPekjrmQwK2XOOy6NwnZQx7P
 6T4RxrgPvztg==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629535"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629535"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:58 -0800
IronPort-SDR: A1KMrCaggsAAH9s5J4UQ/+5JmdiZfMHyq/pP3sOqZgZ2y4WFvGq6w4oPdaLN1I1ouweDWy68G0
 Cxu7UJiJhkaQ==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346338006"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:57 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 15/32] hw/pxb: Allow creation of a CXL PXB (host bridge)
Date: Tue,  5 Jan 2021 08:53:06 -0800
Message-Id: <20210105165323.783725-16-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105165323.783725-1-ben.widawsky@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=ben.widawsky@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

Upcoming patches will allow creating multiple host bridges.

v2: Remove vendor and device ID (Ben)

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/pci-bridge/pci_expander_bridge.c | 67 ++++++++++++++++++++++++++++-
 hw/pci/pci.c                        |  7 +++
 include/hw/pci/pci.h                |  6 +++
 3 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 88c45dc3b5..b42592e1ff 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -56,6 +56,10 @@ DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
 DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
                          TYPE_PXB_PCIE_DEVICE)
 
+#define TYPE_PXB_CXL_DEVICE "pxb-cxl"
+DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
+                         TYPE_PXB_CXL_DEVICE)
+
 struct PXBDev {
     /*< private >*/
     PCIDevice parent_obj;
@@ -67,6 +71,11 @@ struct PXBDev {
 
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
@@ -111,11 +120,20 @@ static const TypeInfo pxb_pcie_bus_info = {
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
@@ -380,13 +398,58 @@ static const TypeInfo pxb_pcie_dev_info = {
     },
 };
 
+static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
+{
+    /* A CXL PXB's parent bus is still PCIe */
+    if (!pci_bus_is_express(pci_get_bus(dev))) {
+        error_setg(errp, "pxb-cxl devices cannot reside on a PCI bus");
+        return;
+    }
+
+    pxb_dev_realize_common(dev, CXL, errp);
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
index 50fc61c81f..fb454e2317 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -222,6 +222,12 @@ static const TypeInfo pcie_bus_info = {
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
@@ -2849,6 +2855,7 @@ static void pci_register_types(void)
 {
     type_register_static(&pci_bus_info);
     type_register_static(&pcie_bus_info);
+    type_register_static(&cxl_bus_info);
     type_register_static(&conventional_pci_interface_info);
     type_register_static(&cxl_interface_info);
     type_register_static(&pcie_interface_info);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index f6b1eff446..c464597e53 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -405,6 +405,7 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
 #define TYPE_PCI_BUS "PCI"
 OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
 #define TYPE_PCIE_BUS "PCIE"
+#define TYPE_CXL_BUS "CXL"
 
 bool pci_bus_is_express(PCIBus *bus);
 
@@ -753,6 +754,11 @@ static inline void pci_irq_pulse(PCIDevice *pci_dev)
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
-- 
2.30.0


