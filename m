Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D04338174
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:28:41 +0100 (CET)
Received: from localhost ([::1]:38210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKUjQ-0005BU-Aa
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:28:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1lKUiT-0004hS-Jg
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:27:41 -0500
Received: from mga02.intel.com ([134.134.136.20]:54021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1lKUiN-0003RD-4L
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:27:41 -0500
IronPort-SDR: 0Q2Lj5HDJ+R4n9ABrN0WksPpYO3xvWGgIbOhG6ddBK+HGj+5qXE45djufEOGcHSy/MVT9gC3mt
 dgqXUezQhUFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="175871736"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="175871736"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 15:27:22 -0800
IronPort-SDR: teaSKXpLvFcQarF53R16lOalW9EtB027bxO6LzssNKNPFOuQQJO8O0XJ41Pf7Pzj9LqsVIcbsG
 3tF3ugbpvS6w==
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="404233888"
Received: from askassar-mobl2.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.143.84])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 15:27:22 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] hw/mem/cxl_type3: Go back to subregions
Date: Thu, 11 Mar 2021 15:27:16 -0800
Message-Id: <20210311232716.3914084-1-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210202005948.241655-1-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=ben.widawsky@intel.com; helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 Chris Browy <cbrowy@avery-design.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Each device allocates its memory (persistent only for now) out of a
container memory that represents a "window" that would be defined by the
host bridge. For example, a host bridge may claim all traffic from 0x0 -
0x4000; it might then also direct 0x1000-0x1fff to a specific CXL
device. Change the memory region type claiming 0x1000-0x1fff from an
alias, to a subregion.

v1 and v2 of the patch series both used a subregion. There were two
issues with this and so for v3, an alias was chosen mimicking nvdimm.

The switch to alias left an issue in the implementation. There's logic
that check to make sure two memory regions (ie. two devices under the
same host bridge) couldn't collide. While hardware doesn't make this
guarantee, it's nice for driver debug. There is no clean way to do that
with an alias.

More importantly, this change was inspired by implementing support for
both volatile and persistent memory. In that case, you may have multiple
devices which the BIOS is going to assign address ranges to. Since we
are the BIOS in this case, having a way of finding used space in the
memory window so that you can allocate the next chunk is easily
accomplished here.

With this, I have the following output from `info mtree`
    0000004c00000000-0000004c1fffffff (prio 0, ram): cxl-mem1
      0000004c00000000-0000004c0fffffff (prio 1, i/o): cxl_type3-memory

And `info memory-devices`
Memory device [cxl]: "cxl-pmem0"
  addr: 0x4c00000000
  slot: 0
  node: 0
  size: 268435456
  memdev: /objects/cxl-mem1
  hotplugged: false
  hotpluggable: true

This functionality has been tested with a WIP linux patch which amounts
to this:
       reg = readl(cxlm->regs.hdm_decoder + CXL_HDM_DECODER_CAP_OFFSET);

       dev_err(dev, "decoder cap:\n"
                    "\tcount: %lu\n",
               FIELD_GET(CXL_HDM_DECODER_COUNT_MASK, reg));

       writel(0x4c, cxlm->regs.hdm_decoder + CXL_HDM_DECODER0_BASE_HIGH_OFFSET);
       writel(0, cxlm->regs.hdm_decoder + CXL_HDM_DECODER0_BASE_LOW_OFFSET);
       writel(0, cxlm->regs.hdm_decoder + CXL_HDM_DECODER0_SIZE_HIGH_OFFSET);
       writel(256 << 20, cxlm->regs.hdm_decoder + CXL_HDM_DECODER0_SIZE_LOW_OFFSET);
       writel(BIT(9),  cxlm->regs.hdm_decoder + CXL_HDM_DECODER0_CTRL_OFFSET);

       tmp = ioremap_uc(0x4c00000000, 4096);
       writel(0x20, tmp);

Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/mem/cxl_type3.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index bf33ddb915..33991079a6 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -46,7 +46,9 @@ static void build_dvsecs(CXLType3Dev *ct3d)
 static void cxl_set_addr(CXLType3Dev *ct3d, hwaddr addr, Error **errp)
 {
     MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(ct3d);
-    mdc->set_addr(MEMORY_DEVICE(ct3d), addr, errp);
+    MemoryRegion *mr = host_memory_backend_get_memory(ct3d->hostmem);
+
+    mdc->set_addr(MEMORY_DEVICE(ct3d), addr - mr->addr, errp);
 }
 
 static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)
@@ -180,13 +182,13 @@ static void cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
 
     memory_region_set_nonvolatile(pmem, true);
     memory_region_set_enabled(pmem, false);
-    memory_region_init_alias(pmem, OBJECT(ct3d), "cxl_type3-memory", mr, 0,
-                             ct3d->size);
+    memory_region_init(pmem, OBJECT(ct3d), "cxl_type3-memory", ct3d->size);
+    memory_region_add_subregion_overlap(mr, 0, pmem, 1);
     ct3d->cxl_dstate.pmem = pmem;
 
 #ifdef SET_PMEM_PADDR
     /* This path will initialize the memory device as if BIOS had done it */
-    cxl_set_addr(ct3d, mr->addr + offset, errp);
+    cxl_set_addr(ct3d, offset, errp);
     memory_region_set_enabled(pmem, true);
 #endif
 }
@@ -246,8 +248,11 @@ static uint64_t cxl_md_get_addr(const MemoryDeviceState *md)
     CXLType3Dev *ct3d = CT3(md);
     MemoryRegion *pmem = ct3d->cxl_dstate.pmem;
 
-    assert(pmem->alias);
-    return pmem->alias_offset;
+    if (pmem) {
+        return pmem->addr + pmem->container->addr;
+    }
+
+    return 0;
 }
 
 static void cxl_md_set_addr(MemoryDeviceState *md, uint64_t addr, Error **errp)
@@ -255,8 +260,6 @@ static void cxl_md_set_addr(MemoryDeviceState *md, uint64_t addr, Error **errp)
     CXLType3Dev *ct3d = CT3(md);
     MemoryRegion *pmem = ct3d->cxl_dstate.pmem;
 
-    assert(pmem->alias);
-    memory_region_set_alias_offset(pmem, addr);
     memory_region_set_address(pmem, addr);
 }
 
-- 
2.30.2


