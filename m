Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930324987F4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 19:11:11 +0100 (CET)
Received: from localhost ([::1]:44792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC3o6-00062v-6e
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 13:11:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nC38C-000310-8J
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:27:52 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nC38A-0000v6-7H
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:27:51 -0500
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JjGzW01tpz6FGMt;
 Tue, 25 Jan 2022 01:23:35 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 24 Jan 2022 18:27:48 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 24 Jan 2022 17:27:47 +0000
To: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, <linuxarm@huawei.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: [PATCH v4 21/42] hw/cxl/device: Implement MMIO HDM decoding (8.2.5.12)
Date: Mon, 24 Jan 2022 17:16:44 +0000
Message-ID: <20220124171705.10432-22-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

From: Ben Widawsky <ben.widawsky@intel.com>

A device's volatile and persistent memory are known Host Defined Memory
(HDM) regions. The mechanism by which the device is programmed to claim
the addresses associated with those regions is through dedicated logic
known as the HDM decoder. In order to allow the OS to properly program
the HDMs, the HDM decoders must be modeled.

There are two ways the HDM decoders can be implemented, the legacy
mechanism is through the PCIe DVSEC programming from CXL 1.1 (8.1.3.8),
and MMIO is found in 8.2.5.12 of the spec. For now, 8.1.3.8 is not
implemented.

Much of CXL device logic is implemented in cxl-utils. The HDM decoder
however is implemented directly by the device implementation.
Whilst the implementation currently does no validity checks on the
encoder set up, future work will add sanity checking specific to
the type of cxl component.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/mem/cxl_type3.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index c4021d2434..0033b1b28e 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -61,6 +61,56 @@ static void build_dvsecs(CXLType3Dev *ct3d)
                                REG_LOC_DVSEC_REVID, dvsec);
 }
 
+static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)
+{
+    ComponentRegisters *cregs = &ct3d->cxl_cstate.crb;
+    uint32_t *cache_mem = cregs->cache_mem_registers;
+
+    assert(which == 0);
+
+    /* TODO: Sanity checks that the decoder is possible */
+    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
+    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERROR, 0);
+
+    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
+}
+
+static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
+                           unsigned size)
+{
+    CXLComponentState *cxl_cstate = opaque;
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+    CXLType3Dev *ct3d = container_of(cxl_cstate, CXLType3Dev, cxl_cstate);
+    uint32_t *cache_mem = cregs->cache_mem_registers;
+    bool should_commit = false;
+    int which_hdm = -1;
+
+    assert(size == 4);
+
+    switch (offset) {
+    case A_CXL_HDM_DECODER0_CTRL:
+        should_commit = FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COMMIT);
+        which_hdm = 0;
+        break;
+    default:
+        break;
+    }
+
+    stl_le_p((uint8_t *)cache_mem + offset, value);
+    if (should_commit) {
+        hdm_decoder_commit(ct3d, which_hdm);
+    }
+}
+
+static void ct3_finalize(Object *obj)
+{
+    CXLType3Dev *ct3d = CT3(obj);
+    CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
+    ComponentRegisters *regs = &cxl_cstate->crb;
+
+    g_free((void *)regs->special_ops);
+}
+
 static void cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
 {
     MemoryRegion *mr;
@@ -103,6 +153,9 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     ct3d->cxl_cstate.pdev = pci_dev;
     build_dvsecs(ct3d);
 
+    regs->special_ops = g_new0(MemoryRegionOps, 1);
+    regs->special_ops->write = ct3d_reg_write;
+
     cxl_component_register_block_init(OBJECT(pci_dev), cxl_cstate,
                                       TYPE_CXL_TYPE3_DEV);
 
@@ -155,6 +208,7 @@ static const TypeInfo ct3d_info = {
     .parent = TYPE_PCI_DEVICE,
     .class_init = ct3_class_init,
     .instance_size = sizeof(CXLType3Dev),
+    .instance_finalize = ct3_finalize,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CXL_DEVICE },
         { INTERFACE_PCIE_DEVICE },
-- 
2.32.0


