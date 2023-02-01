Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A7F6815A3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 16:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMWUk-0005C6-U4; Mon, 30 Jan 2023 10:54:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMWUg-00058r-Dc
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:54:55 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMWUe-0002vl-PM
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:54:54 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P5CMl5qZnz67N3D;
 Mon, 30 Jan 2023 23:51:15 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 30 Jan 2023 15:54:50 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Gregory Price
 <gourry.memverge@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mike Maslenkin <mike.maslenkin@gmail.com>
Subject: [PATCH v3 4/8] hw/pci-bridge/cxl_root_port: Wire up MSI
Date: Mon, 30 Jan 2023 15:52:47 +0000
Message-ID: <20230130155251.3430-5-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230130155251.3430-1-Jonathan.Cameron@huawei.com>
References: <20230130155251.3430-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Done to avoid fixing ACPI route description of traditional PCI interrupts on q35
and because we should probably move with the times anyway.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/pci-bridge/cxl_root_port.c | 61 +++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/hw/pci-bridge/cxl_root_port.c b/hw/pci-bridge/cxl_root_port.c
index 00195257f7..7dfd20aa67 100644
--- a/hw/pci-bridge/cxl_root_port.c
+++ b/hw/pci-bridge/cxl_root_port.c
@@ -22,6 +22,7 @@
 #include "qemu/range.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pcie_port.h"
+#include "hw/pci/msi.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "qapi/error.h"
@@ -29,6 +30,10 @@
 
 #define CXL_ROOT_PORT_DID 0x7075
 
+#define CXL_RP_MSI_OFFSET               0x60
+#define CXL_RP_MSI_SUPPORTED_FLAGS      PCI_MSI_FLAGS_MASKBIT
+#define CXL_RP_MSI_NR_VECTOR            2
+
 /* Copied from the gen root port which we derive */
 #define GEN_PCIE_ROOT_PORT_AER_OFFSET 0x100
 #define GEN_PCIE_ROOT_PORT_ACS_OFFSET \
@@ -47,6 +52,49 @@ typedef struct CXLRootPort {
 #define TYPE_CXL_ROOT_PORT "cxl-rp"
 DECLARE_INSTANCE_CHECKER(CXLRootPort, CXL_ROOT_PORT, TYPE_CXL_ROOT_PORT)
 
+/*
+ * If two MSI vector are allocated, Advanced Error Interrupt Message Number
+ * is 1. otherwise 0.
+ * 17.12.5.10 RPERRSTS,  32:27 bit Advanced Error Interrupt Message Number.
+ */
+static uint8_t cxl_rp_aer_vector(const PCIDevice *d)
+{
+    switch (msi_nr_vectors_allocated(d)) {
+    case 1:
+        return 0;
+    case 2:
+        return 1;
+    case 4:
+    case 8:
+    case 16:
+    case 32:
+    default:
+        break;
+    }
+    abort();
+    return 0;
+}
+
+static int cxl_rp_interrupts_init(PCIDevice *d, Error **errp)
+{
+    int rc;
+
+    rc = msi_init(d, CXL_RP_MSI_OFFSET, CXL_RP_MSI_NR_VECTOR,
+                  CXL_RP_MSI_SUPPORTED_FLAGS & PCI_MSI_FLAGS_64BIT,
+                  CXL_RP_MSI_SUPPORTED_FLAGS & PCI_MSI_FLAGS_MASKBIT,
+                  errp);
+    if (rc < 0) {
+        assert(rc == -ENOTSUP);
+    }
+
+    return rc;
+}
+
+static void cxl_rp_interrupts_uninit(PCIDevice *d)
+{
+    msi_uninit(d);
+}
+
 static void latch_registers(CXLRootPort *crp)
 {
     uint32_t *reg_state = crp->cxl_cstate.crb.cache_mem_registers;
@@ -183,6 +231,15 @@ static void cxl_rp_dvsec_write_config(PCIDevice *dev, uint32_t addr,
     }
 }
 
+static void cxl_rp_aer_vector_update(PCIDevice *d)
+{
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(d);
+
+    if (rpc->aer_vector) {
+        pcie_aer_root_set_vector(d, rpc->aer_vector(d));
+    }
+}
+
 static void cxl_rp_write_config(PCIDevice *d, uint32_t address, uint32_t val,
                                 int len)
 {
@@ -192,6 +249,7 @@ static void cxl_rp_write_config(PCIDevice *d, uint32_t address, uint32_t val,
 
     pcie_cap_slot_get(d, &slt_ctl, &slt_sta);
     pci_bridge_write_config(d, address, val, len);
+    cxl_rp_aer_vector_update(d);
     pcie_cap_flr_write_config(d, address, val, len);
     pcie_cap_slot_write_config(d, slt_ctl, slt_sta, address, val, len);
     pcie_aer_write_config(d, address, val, len);
@@ -220,6 +278,9 @@ static void cxl_root_port_class_init(ObjectClass *oc, void *data)
 
     rpc->aer_offset = GEN_PCIE_ROOT_PORT_AER_OFFSET;
     rpc->acs_offset = GEN_PCIE_ROOT_PORT_ACS_OFFSET;
+    rpc->aer_vector = cxl_rp_aer_vector;
+    rpc->interrupts_init = cxl_rp_interrupts_init;
+    rpc->interrupts_uninit = cxl_rp_interrupts_uninit;
 
     dc->hotpluggable = false;
 }
-- 
2.37.2


