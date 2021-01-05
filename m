Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7FB2EB0F1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:05:34 +0100 (CET)
Received: from localhost ([::1]:56226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpm1-0002Lk-R9
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbq-0000nf-N2
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:55:02 -0500
Received: from mga11.intel.com ([192.55.52.93]:21251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbo-00012q-H3
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:55:02 -0500
IronPort-SDR: yIoPzcPcgGXbo/FuAcDJhbRFvGEYyIWpLt5pqO9fk4ZfKFVz8sXCO307EXTNBomgD4V6IZLtpp
 liSpy8v8XJ4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629551"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629551"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:01 -0800
IronPort-SDR: srId7JcmHfjrU7xA27JeGEICfcFjYt4c0Y7pDm69AC0VtJq+w8Am+jzasDySEQUQYBXYktlMEA
 Ej1tCW5LIPQQ==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346338037"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:00 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 20/32] hw/cxl/component: Implement host bridge MMIO
 (8.2.5, table 142)
Date: Tue,  5 Jan 2021 08:53:11 -0800
Message-Id: <20210105165323.783725-21-ben.widawsky@intel.com>
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

CXL host bridges themselves may have MMIO. Since host bridges don't have
a BAR they are treated as special for MMIO.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

--

It's arbitrarily chosen here to pick 0xD0000000 as the base for the host
bridge MMIO. I'm not sure what the right way to find free space for
platform hardcoded things like this is.
---
 hw/pci-bridge/pci_expander_bridge.c | 53 ++++++++++++++++++++++++++++-
 include/hw/cxl/cxl.h                |  2 ++
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 5021b60435..226a8a5fff 100644
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
@@ -70,6 +71,12 @@ struct PXBDev {
     int32_t uid;
 };
 
+typedef struct CXLHost {
+    PCIHostState parent_obj;
+
+    CXLComponentState cxl_cstate;
+} CXLHost;
+
 static PXBDev *convert_to_pxb(PCIDevice *dev)
 {
     /* A CXL PXB's parent bus is PCIe, so the normal check won't work */
@@ -85,6 +92,9 @@ static GList *pxb_dev_list;
 
 #define TYPE_PXB_HOST "pxb-host"
 
+#define TYPE_PXB_CXL_HOST "pxb-cxl-host"
+#define PXB_CXL_HOST(obj) OBJECT_CHECK(CXLHost, (obj), TYPE_PXB_CXL_HOST)
+
 static int pxb_bus_num(PCIBus *bus)
 {
     PXBDev *pxb = convert_to_pxb(bus->parent_dev);
@@ -198,6 +208,46 @@ static const TypeInfo pxb_host_info = {
     .class_init    = pxb_host_class_init,
 };
 
+static void pxb_cxl_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    PCIHostState *phb = PCI_HOST_BRIDGE(dev);
+    CXLHost *cxl = PXB_CXL_HOST(dev);
+    CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
+    struct MemoryRegion *mr = &cxl_cstate->crb.component_registers;
+
+    cxl_component_register_block_init(OBJECT(dev), cxl_cstate,
+                                      TYPE_PXB_CXL_HOST);
+    sysbus_init_mmio(sbd, mr);
+
+    /* FIXME: support multiple host bridges. */
+    sysbus_mmio_map(sbd, 0, CXL_HOST_BASE +
+                            memory_region_size(mr) * pci_bus_uid(phb->bus));
+}
+
+static void pxb_cxl_host_class_init(ObjectClass *class, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(class);
+
+    hc->root_bus_path = pxb_host_root_bus_path;
+    dc->fw_name = "cxl";
+    dc->realize = pxb_cxl_realize;
+    /* Reason: Internal part of the pxb/pxb-pcie device, not usable by itself */
+    dc->user_creatable = false;
+}
+
+/*
+ * This is a device to handle the MMIO for a CXL host bridge. It does nothing
+ * else.
+ */
+static const TypeInfo cxl_host_info = {
+    .name          = TYPE_PXB_CXL_HOST,
+    .parent        = TYPE_PCI_HOST_BRIDGE,
+    .instance_size = sizeof(CXLHost),
+    .class_init    = pxb_cxl_host_class_init,
+};
+
 /*
  * Registers the PXB bus as a child of pci host root bus.
  */
@@ -272,7 +322,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
         dev_name = dev->qdev.id;
     }
 
-    ds = qdev_new(TYPE_PXB_HOST);
+    ds = qdev_new(type == CXL ? TYPE_PXB_CXL_HOST : TYPE_PXB_HOST);
     if (type == PCIE) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_PCIE_BUS);
     } else if (type == CXL) {
@@ -466,6 +516,7 @@ static void pxb_register_types(void)
     type_register_static(&pxb_pcie_bus_info);
     type_register_static(&pxb_cxl_bus_info);
     type_register_static(&pxb_host_info);
+    type_register_static(&cxl_host_info);
     type_register_static(&pxb_dev_info);
     type_register_static(&pxb_pcie_dev_info);
     type_register_static(&pxb_cxl_dev_info);
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 362cda40de..6bc344f205 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -17,5 +17,7 @@
 #define COMPONENT_REG_BAR_IDX 0
 #define DEVICE_REG_BAR_IDX 2
 
+#define CXL_HOST_BASE 0xD0000000
+
 #endif
 
-- 
2.30.0


