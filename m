Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334402EB105
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:08:13 +0100 (CET)
Received: from localhost ([::1]:36532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpoZ-0006Kl-UL
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:08:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpc8-00016f-QA
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:55:24 -0500
Received: from mga11.intel.com ([192.55.52.93]:21242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpc3-00012E-Bg
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:55:20 -0500
IronPort-SDR: FTddpgbaXCsnlo1O3QlvkmfWr3rZuA+D3u2tOPQAIu+1K91LDDCePMgn130zpyRiWA/ZxOrmuh
 Kixq76Bg9CUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629571"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629571"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:05 -0800
IronPort-SDR: i0NwePPMUZmUmyMrOd/06thRucyCPaLKFduDqhh82eL2XrPaksI7x6Xp5gqGzi/jH/1/vWuVCb
 ISNro/AHe/Hw==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346338072"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:04 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 25/32] hw/cxl/device: Implement MMIO HDM decoding
 (8.2.5.12)
Date: Tue,  5 Jan 2021 08:53:16 -0800
Message-Id: <20210105165323.783725-26-ben.widawsky@intel.com>
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
however is implemented directly by the device implementation. The
generic cxl-utils probably should be the correct place to put this since
HDM decoders aren't unique to a type3 device. It is however easier at
the moment, and requires less design consideration to simply implement
it in the device, and figure out how to consolidate it later.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/mem/cxl_type3.c | 82 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 77 insertions(+), 5 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 3985bb8d0b..dee5a8884b 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -57,6 +57,71 @@ static void build_dvsecs(CXLType3Dev *ct3d)
                                REG_LOC_DVSEC_REVID, dvsec);
 }
 
+static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)
+{
+    MemoryRegion *pmem = ct3d->cxl_dstate.pmem;
+    MemoryRegion *mr = host_memory_backend_get_memory(ct3d->hostmem);
+    Range window, device;
+    ComponentRegisters *cregs = &ct3d->cxl_cstate.crb;
+    uint32_t *cache_mem = cregs->cache_mem_registers;
+    uint64_t offset, size;
+    Error *err = NULL;
+
+    assert(which == 0);
+
+    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
+    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERROR, 0);
+
+    offset = ((uint64_t)cache_mem[R_CXL_HDM_DECODER0_BASE_HI] << 32) |
+             cache_mem[R_CXL_HDM_DECODER0_BASE_LO];
+    size = ((uint64_t)cache_mem[R_CXL_HDM_DECODER0_SIZE_HI] << 32) |
+           cache_mem[R_CXL_HDM_DECODER0_SIZE_LO];
+
+    range_init_nofail(&window, mr->addr, memory_region_size(mr));
+    range_init_nofail(&device, offset, size);
+
+    if (!range_contains_range(&window, &device)) {
+        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERROR, 1);
+        return;
+    }
+
+    memory_region_ram_resize(pmem, size, &err);
+    if (err) {
+        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERROR, 1);
+        return;
+    }
+
+    offset -= mr->addr;
+    memory_region_add_subregion(mr, offset, pmem);
+
+    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
+}
+
+static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value, unsigned size)
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
+    if (should_commit)
+        hdm_decoder_commit(ct3d, which_hdm);
+}
+
 static void ct3_instance_init(Object *obj)
 {
     /* MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(obj); */
@@ -65,7 +130,10 @@ static void ct3_instance_init(Object *obj)
 static void ct3_finalize(Object *obj)
 {
     CXLType3Dev *ct3d = CT3(obj);
+    CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
+    ComponentRegisters *regs = &cxl_cstate->crb;
 
+    g_free((void *)regs->special_ops);
     g_free(ct3d->cxl_dstate.pmem);
 }
 
@@ -81,11 +149,12 @@ static void cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
         return;
     }
 
-    /* FIXME: need to check mr is the host bridge's MR */
-    mr = host_memory_backend_get_memory(ct3d->hostmem);
-
     /* Create our new subregion */
     ct3d->cxl_dstate.pmem = g_new(MemoryRegion, 1);
+    memory_region_set_nonvolatile(ct3d->cxl_dstate.pmem, true);
+
+    /* FIXME: need to check mr is the host bridge's MR */
+    mr = host_memory_backend_get_memory(ct3d->hostmem);
 
     /* Find the first free space in the window */
     WITH_RCU_READ_LOCK_GUARD()
@@ -108,8 +177,6 @@ static void cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
     /* Register our subregion as non-volatile */
     memory_region_init_ram(ct3d->cxl_dstate.pmem, OBJECT(ct3d),
                            "cxl_type3-memory", ct3d->size, errp);
-    memory_region_set_nonvolatile(ct3d->cxl_dstate.pmem, true);
-
 #ifdef SET_PMEM_PADDR
     memory_region_add_subregion(mr, offset, ct3d->cxl_dstate.pmem);
 #endif
@@ -148,6 +215,11 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     ct3d->cxl_cstate.pdev = pci_dev;
     build_dvsecs(ct3d);
 
+#ifndef SET_PMEM_PADDR
+    regs->special_ops = g_new0(MemoryRegionOps, 1);
+    regs->special_ops->write = ct3d_reg_write;
+#endif
+
     cxl_component_register_block_init(OBJECT(pci_dev), cxl_cstate,
                                       TYPE_CXL_TYPE3_DEV);
 
-- 
2.30.0


