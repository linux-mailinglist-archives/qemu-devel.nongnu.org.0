Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D8030AB0F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:23:34 +0100 (CET)
Received: from localhost ([::1]:37650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6b37-0006TZ-ED
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6b1Q-0004jB-1Q
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:21:48 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6b1N-0003ol-Br
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:21:47 -0500
Received: from fraeml738-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DTs4M6yP5z67jbT;
 Mon,  1 Feb 2021 23:17:07 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml738-chm.china.huawei.com (10.206.15.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 16:21:43 +0100
Received: from lhrphicprd00229.huawei.com (10.123.41.22) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 15:21:43 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 4/4] hw/mem/cxl_type3: Enabled DOE mailbox for access to
 CDAT
Date: Mon, 1 Feb 2021 23:16:29 +0800
Message-ID: <20210201151629.29656-5-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20210201151629.29656-1-Jonathan.Cameron@huawei.com>
References: <20210201151629.29656-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.41.22]
X-ClientProxiedBy: lhreml751-chm.china.huawei.com (10.201.108.201) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Vishal
 Verma <vishal.l.verma@intel.com>, f.fangjian@huawei.com,
 Chris Browy <cbrowy@avery-design.com>, f4bug@amsat.org, linuxarm@openeuler.org,
 jcm@redhat.com, Prashant V Agarwal <agpr123@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This enables basic read back of CDAT entries via a DOE mailbox in
the devices PCI config space.

Note that for now a few possible entries are provided that
don't make a lot of sense for current instances of this device.
It will need to be made somewhat dynamic and possibly require
additional command line parameters.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/mem/cxl_type3.c   | 49 ++++++++++++++++++++++++++++++++++++++++++--
 include/hw/cxl/cxl.h |  1 +
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index dee5a8884b..3449f02090 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -4,6 +4,7 @@
 #include "hw/mem/memory-device.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/doe.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
@@ -11,6 +12,7 @@
 #include "qemu/range.h"
 #include "qemu/rcu.h"
 #include "sysemu/hostmem.h"
+#include "sysemu/numa.h"
 #include "hw/cxl/cxl.h"
 
 typedef struct cxl_type3_dev {
@@ -21,6 +23,9 @@ typedef struct cxl_type3_dev {
     uint64_t size;
     HostMemoryBackend *hostmem;
 
+    PCIEDOE doe;
+    CXLCDAT cdat;
+
     /* State */
     CXLComponentState cxl_cstate;
     CXLDeviceState cxl_dstate;
@@ -28,7 +33,7 @@ typedef struct cxl_type3_dev {
 
 #define CT3(obj) OBJECT_CHECK(CXLType3Dev, (obj), TYPE_CXL_TYPE3_DEV)
 
-static void build_dvsecs(CXLType3Dev *ct3d)
+static int build_dvsecs(CXLType3Dev *ct3d)
 {
     CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
     uint8_t *dvsec;
@@ -55,6 +60,7 @@ static void build_dvsecs(CXLType3Dev *ct3d)
     };
     cxl_component_create_dvsec(cxl_cstate, REG_LOC_DVSEC_LENGTH, REG_LOC_DVSEC,
                                REG_LOC_DVSEC_REVID, dvsec);
+    return cxl_cstate->dvsec_offset;
 }
 
 static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)
@@ -201,6 +207,7 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     ComponentRegisters *regs = &cxl_cstate->crb;
     MemoryRegion *mr = &regs->component_registers;
     uint8_t *pci_conf = pci_dev->config;
+    int offset;
 
     if (!ct3d->cxl_dstate.pmem) {
         cxl_setup_memory(ct3d, errp);
@@ -213,7 +220,21 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     cxl_cstate->dvsec_offset = 0x100;
 
     ct3d->cxl_cstate.pdev = pci_dev;
-    build_dvsecs(ct3d);
+    offset = build_dvsecs(ct3d);
+
+    /* Build DOE - no interrupt for now */
+    offset = pcie_doe_ecap(&ct3d->doe, pci_dev, offset);
+    doe_add_message_handler(&ct3d->doe, 0x1e98, 0x2, &cxl_table_access,
+                            &ct3d->cdat);
+
+    /* Store entires of CDAT  for read back from DOE */
+    cdat_add_dsmas(&ct3d->cdat, 0, CDAT_DSMAS_FLAG_NV, 0x3345000000,
+                   0x0001000000);
+    cdat_add_dsmas(&ct3d->cdat, 1, 0, 0x33460000000, 0x00010000000);
+    cdat_add_dslbis(&ct3d->cdat, 0, HMAT_LB_MEM_MEMORY,
+                    (uint8_t)HMAT_LB_DATA_ACCESS_LATENCY,
+                    1000, /* microsecs */
+                    90, 0, 0);
 
 #ifndef SET_PMEM_PADDR
     regs->special_ops = g_new0(MemoryRegionOps, 1);
@@ -287,6 +308,28 @@ static void pc_dimm_md_fill_device_info(const MemoryDeviceState *md,
     info->type = MEMORY_DEVICE_INFO_KIND_CXL;
 }
 
+static void ct3d_config_write(PCIDevice *pci_dev, uint32_t addr, uint32_t val, int len)
+{
+    CXLType3Dev *ct3d = CT3(pci_dev);
+
+    pci_default_write_config(pci_dev, addr, val, len);
+    pcie_doe_write(&ct3d->doe, addr, val, len);
+
+}
+
+static uint32_t ct3d_config_read(PCIDevice *pci_dev, uint32_t addr, int len)
+{
+    CXLType3Dev *ct3d = CT3(pci_dev);
+    int found = 0;
+    uint32_t val;
+
+    val = pcie_doe_read(&ct3d->doe, addr, len, &found);
+    if (found) {
+        return val;
+    }
+    return pci_default_read_config(pci_dev, addr, len);
+}
+
 static void ct3_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -298,6 +341,8 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     pc->vendor_id = PCI_VENDOR_ID_INTEL;
     pc->device_id = 0xd93; /* LVF for now */
     pc->revision = 1;
+    pc->config_write = ct3d_config_write;
+    pc->config_read = ct3d_config_read;
 
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->desc = "CXL PMEM Device (Type 3)";
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 6961e47076..ec3b4d7398 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -13,6 +13,7 @@
 #include "cxl_pci.h"
 #include "cxl_component.h"
 #include "cxl_device.h"
+#include "cxl_cdat.h"
 
 #define COMPONENT_REG_BAR_IDX 0
 #define DEVICE_REG_BAR_IDX 2
-- 
2.19.1


