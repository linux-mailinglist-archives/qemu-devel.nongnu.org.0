Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42712EB126
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:13:41 +0100 (CET)
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwptr-00083F-DM
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:13:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbs-0000tp-Vf
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:55:04 -0500
Received: from mga11.intel.com ([192.55.52.93]:21242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbq-00012E-Pb
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:55:04 -0500
IronPort-SDR: KXIlyTrxyC1Wb96OV2mC4T0djdq7WAzzZMcnZ/y4sQsV3QPxCMqI4EJRMj/DeObP5TMdwGf+hv
 AyTssU7iEmmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629558"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629558"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:02 -0800
IronPort-SDR: lOqAwoisGwNNzOBsuy64bc2RxU7iMrGKGSiQBvv/MqIh0sjQ6ClOgayVGxfnBL9FvVj/sM5n2F
 aNSlWtBHhUqA==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346338047"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:02 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 22/32] hw/pxb/cxl: Add "windows" for host bridges
Date: Tue,  5 Jan 2021 08:53:13 -0800
Message-Id: <20210105165323.783725-23-ben.widawsky@intel.com>
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

In a bare metal CXL capable system, system firmware will program
physical address ranges on the host. This is done by programming
internal registers that aren't typically known to OS. These address
ranges might be contiguous or interleaved across host bridges.

For a QEMU guest a new construct is introduced allowing passing a memory
backend to the host bridge for this same purpose. Each memory backend
needs to be passed to the host bridge as well as any device that will be
emulating that memory (not implemented here).

I'm hopeful the interleaving work in the link can be re-purposed here
(see Link).

An example to create a host bridges with a 512M window at 0x4c0000000
 -object memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M
 -device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52,uid=0,len-memory-base=1,memory-base\[0\]=0x4c0000000,memory\[0\]=cxl-mem1

Link: https://lists.nongnu.org/archive/html/qemu-devel/2020-08/msg03680.html
Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/pci-bridge/pci_expander_bridge.c | 65 +++++++++++++++++++++++++++--
 include/hw/cxl/cxl.h                |  1 +
 2 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 226a8a5fff..af1450c69d 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -69,12 +69,19 @@ struct PXBDev {
     uint8_t bus_nr;
     uint16_t numa_node;
     int32_t uid;
+    struct cxl_dev {
+        HostMemoryBackend *memory_window[CXL_WINDOW_MAX];
+
+        uint32_t num_windows;
+        hwaddr *window_base[CXL_WINDOW_MAX];
+    } cxl;
 };
 
 typedef struct CXLHost {
     PCIHostState parent_obj;
 
     CXLComponentState cxl_cstate;
+    PXBDev *dev;
 } CXLHost;
 
 static PXBDev *convert_to_pxb(PCIDevice *dev)
@@ -213,16 +220,31 @@ static void pxb_cxl_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     PCIHostState *phb = PCI_HOST_BRIDGE(dev);
     CXLHost *cxl = PXB_CXL_HOST(dev);
+    struct cxl_dev *cxl_dev = &cxl->dev->cxl;
     CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
     struct MemoryRegion *mr = &cxl_cstate->crb.component_registers;
+    int uid = pci_bus_uid(phb->bus);
 
     cxl_component_register_block_init(OBJECT(dev), cxl_cstate,
                                       TYPE_PXB_CXL_HOST);
     sysbus_init_mmio(sbd, mr);
 
-    /* FIXME: support multiple host bridges. */
-    sysbus_mmio_map(sbd, 0, CXL_HOST_BASE +
-                            memory_region_size(mr) * pci_bus_uid(phb->bus));
+    sysbus_mmio_map(sbd, 0, CXL_HOST_BASE + memory_region_size(mr) * uid);
+
+    /*
+     * A CXL host bridge can exist without a fixed memory window, but it would
+     * only operate in legacy PCIe mode.
+     */
+    if (!cxl_dev->memory_window[uid]) {
+        warn_report(
+            "CXL expander bridge created without window. Consider using %s",
+            "memdev[0]=<memory_backend>");
+        return;
+    }
+
+    mr = host_memory_backend_get_memory(cxl_dev->memory_window[uid]);
+    sysbus_init_mmio(sbd, mr);
+    sysbus_mmio_map(sbd, 1 + uid, *cxl_dev->window_base[uid]);
 }
 
 static void pxb_cxl_host_class_init(ObjectClass *class, void *data)
@@ -328,6 +350,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
     } else if (type == CXL) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_CXL_BUS);
         bus->flags |= PCI_BUS_CXL;
+        PXB_CXL_HOST(ds)->dev = PXB_CXL_DEV(dev);
     } else {
         bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
         bds = qdev_new("pci-bridge");
@@ -389,6 +412,8 @@ static Property pxb_dev_properties[] = {
     DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
     DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
     DEFINE_PROP_INT32("uid", PXBDev, uid, -1),
+    DEFINE_PROP_ARRAY("window-base", PXBDev, cxl.num_windows, cxl.window_base,
+                      qdev_prop_uint64, hwaddr),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -460,7 +485,9 @@ static const TypeInfo pxb_pcie_dev_info = {
 
 static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
 {
-    PXBDev *pxb = convert_to_pxb(dev);
+    PXBDev *pxb = PXB_CXL_DEV(dev);
+    struct cxl_dev *cxl = &pxb->cxl;
+    int count = 0;
 
     /* A CXL PXB's parent bus is still PCIe */
     if (!pci_bus_is_express(pci_get_bus(dev))) {
@@ -476,6 +503,23 @@ static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
     /* FIXME: Check that uid doesn't collide with UIDs of other host bridges */
 
     pxb_dev_realize_common(dev, CXL, errp);
+
+    for (unsigned i = 0; i < CXL_WINDOW_MAX; i++) {
+        if (!cxl->memory_window[i]) {
+            continue;
+        }
+
+        count++;
+    }
+
+    if (!count) {
+        warn_report("memory-windows should be set when creating CXL host bridges");
+    }
+
+    if (count != cxl->num_windows) {
+        error_setg(errp, "window bases count (%d) must match window count (%d)",
+                   cxl->num_windows, count);
+    }
 }
 
 static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
@@ -496,6 +540,19 @@ static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
 
     /* Host bridges aren't hotpluggable. FIXME: spec reference */
     dc->hotpluggable = false;
+
+    /*
+     * Below is moral equivalent of:
+     *   DEFINE_PROP_ARRAY("memdev", PXBDev, window_count, windows,
+     *                     qdev_prop_memory_device, HostMemoryBackend)
+     */
+    for (unsigned i = 0; i < CXL_WINDOW_MAX; i++) {
+        g_autofree char *name = g_strdup_printf("memdev[%u]", i);
+        object_class_property_add_link(klass, name, TYPE_MEMORY_BACKEND,
+                offsetof(PXBDev, cxl.memory_window[i]),
+                qdev_prop_allow_set_link_before_realize,
+                OBJ_PROP_LINK_STRONG);
+    }
 }
 
 static const TypeInfo pxb_cxl_dev_info = {
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 6bc344f205..b1e5f4a8fa 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -18,6 +18,7 @@
 #define DEVICE_REG_BAR_IDX 2
 
 #define CXL_HOST_BASE 0xD0000000
+#define CXL_WINDOW_MAX 10
 
 #endif
 
-- 
2.30.0


