Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B2D55121C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 10:04:35 +0200 (CEST)
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3COb-00061Z-4N
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 04:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1o3CLa-0004nP-Hv; Mon, 20 Jun 2022 04:01:25 -0400
Received: from ozlabs.ru ([107.174.27.60]:48080)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1o3CLW-00073Q-V2; Mon, 20 Jun 2022 04:01:20 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id AC91E80A9A;
 Mon, 20 Jun 2022 04:01:13 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH qemu] spapr/ddw: Reset DMA when the last non-default window is
 removed
Date: Mon, 20 Jun 2022 18:01:09 +1000
Message-Id: <20220620080109.998804-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

PAPR+/LoPAPR says:
===
The platform must restore the default DMA window for the PE on a call
to the ibm,remove-pe-dma-window RTAS call when all of the following
are true:
 a. The call removes the last DMA window remaining for the PE.
 b. The DMA window being removed is not the default window

===

This resets DMA as PAPR mandates.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 include/hw/ppc/spapr.h  |  3 ++-
 hw/ppc/spapr_iommu.c    |  8 +++++---
 hw/ppc/spapr_pci.c      |  2 +-
 hw/ppc/spapr_rtas_ddw.c | 17 ++++++++++++++++-
 hw/ppc/spapr_vio.c      |  3 ++-
 5 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 072dda2c7265..0adbe1566d40 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -902,6 +902,7 @@ struct SpaprTceTable {
     bool bypass;
     bool need_vfio;
     bool skipping_replay;
+    bool def_win;
     int fd;
     MemoryRegion root;
     IOMMUMemoryRegion iommu;
@@ -928,7 +929,7 @@ void spapr_check_mmu_mode(bool guest_radix);
 SpaprTceTable *spapr_tce_new_table(DeviceState *owner, uint32_t liobn);
 void spapr_tce_table_enable(SpaprTceTable *tcet,
                             uint32_t page_shift, uint64_t bus_offset,
-                            uint32_t nb_table);
+                            uint32_t nb_table, bool def_win);
 void spapr_tce_table_disable(SpaprTceTable *tcet);
 void spapr_tce_set_need_vfio(SpaprTceTable *tcet, bool need_vfio);
 
diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index 81e5a1aea3a6..f8c1627d0782 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -242,7 +242,7 @@ static int spapr_tce_table_post_load(void *opaque, int version_id)
     if (tcet->mig_nb_table) {
         if (!tcet->nb_table) {
             spapr_tce_table_enable(tcet, old_page_shift, old_bus_offset,
-                                   tcet->mig_nb_table);
+                                   tcet->mig_nb_table, tcet->def_win);
         }
 
         memcpy(tcet->table, tcet->mig_table,
@@ -279,7 +279,7 @@ static const VMStateDescription vmstate_spapr_tce_table_ex = {
 
 static const VMStateDescription vmstate_spapr_tce_table = {
     .name = "spapr_iommu",
-    .version_id = 2,
+    .version_id = 3,
     .minimum_version_id = 2,
     .pre_save = spapr_tce_table_pre_save,
     .post_load = spapr_tce_table_post_load,
@@ -292,6 +292,7 @@ static const VMStateDescription vmstate_spapr_tce_table = {
         VMSTATE_BOOL(bypass, SpaprTceTable),
         VMSTATE_VARRAY_UINT32_ALLOC(mig_table, SpaprTceTable, mig_nb_table, 0,
                                     vmstate_info_uint64, uint64_t),
+        VMSTATE_BOOL_V(def_win, SpaprTceTable, 3),
 
         VMSTATE_END_OF_LIST()
     },
@@ -380,7 +381,7 @@ SpaprTceTable *spapr_tce_new_table(DeviceState *owner, uint32_t liobn)
 
 void spapr_tce_table_enable(SpaprTceTable *tcet,
                             uint32_t page_shift, uint64_t bus_offset,
-                            uint32_t nb_table)
+                            uint32_t nb_table, bool def_win)
 {
     if (tcet->nb_table) {
         warn_report("trying to enable already enabled TCE table");
@@ -390,6 +391,7 @@ void spapr_tce_table_enable(SpaprTceTable *tcet,
     tcet->bus_offset = bus_offset;
     tcet->page_shift = page_shift;
     tcet->nb_table = nb_table;
+    tcet->def_win = def_win;
     tcet->table = spapr_tce_alloc_table(tcet->liobn,
                                         tcet->page_shift,
                                         tcet->bus_offset,
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index b2f5fbef0c83..e1dbccfc7547 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2066,7 +2066,7 @@ void spapr_phb_dma_reset(SpaprPhbState *sphb)
     /* Register default 32bit DMA window */
     tcet = spapr_tce_find_by_liobn(sphb->dma_liobn[0]);
     spapr_tce_table_enable(tcet, SPAPR_TCE_PAGE_SHIFT, sphb->dma_win_addr,
-                           sphb->dma_win_size >> SPAPR_TCE_PAGE_SHIFT);
+                           sphb->dma_win_size >> SPAPR_TCE_PAGE_SHIFT, true);
 }
 
 static void spapr_phb_reset(DeviceState *qdev)
diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
index 13d339c807c1..4fe41b0c4539 100644
--- a/hw/ppc/spapr_rtas_ddw.c
+++ b/hw/ppc/spapr_rtas_ddw.c
@@ -182,7 +182,7 @@ static void rtas_ibm_create_pe_dma_window(PowerPCCPU *cpu,
      */
     tcet->skipping_replay = true;
     spapr_tce_table_enable(tcet, page_shift, win_addr,
-                           1ULL << (window_shift - page_shift));
+                           1ULL << (window_shift - page_shift), false);
     tcet->skipping_replay = false;
     if (!tcet->nb_table) {
         goto hw_error_exit;
@@ -215,6 +215,7 @@ static void rtas_ibm_remove_pe_dma_window(PowerPCCPU *cpu,
     SpaprPhbState *sphb;
     SpaprTceTable *tcet;
     uint32_t liobn;
+    bool def_win_removed;
 
     if ((nargs != 1) || (nret != 1)) {
         goto param_error_exit;
@@ -231,9 +232,23 @@ static void rtas_ibm_remove_pe_dma_window(PowerPCCPU *cpu,
         goto param_error_exit;
     }
 
+    def_win_removed = tcet->def_win;
     spapr_tce_table_disable(tcet);
     trace_spapr_iommu_ddw_remove(liobn);
 
+    /*
+     * PAPR+/LoPAPR says:
+     * The platform must restore the default DMA window for the PE on a call
+     * to the ibm,remove-pe-dma-window RTAS call when all of the following
+     * are true:
+     * a. The call removes the last DMA window remaining for the PE.
+     * b. The DMA window being removed is not the default window
+     */
+    if (spapr_phb_get_active_win_num(sphb) == 0 && !def_win_removed) {
+        spapr_phb_dma_reset(sphb);
+        trace_spapr_iommu_ddw_reset(sphb->buid, 0);
+    }
+
     rtas_st(rets, 0, RTAS_OUT_SUCCESS);
     return;
 
diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index 9d4fec2c04d8..14506df19d62 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -533,7 +533,8 @@ static void spapr_vio_busdev_realize(DeviceState *qdev, Error **errp)
 
         dev->tcet = spapr_tce_new_table(qdev, liobn);
         spapr_tce_table_enable(dev->tcet, SPAPR_TCE_PAGE_SHIFT, 0,
-                               pc->rtce_window_size >> SPAPR_TCE_PAGE_SHIFT);
+                               pc->rtce_window_size >> SPAPR_TCE_PAGE_SHIFT,
+                               false);
         dev->tcet->vdev = dev;
         memory_region_add_subregion_overlap(&dev->mrroot, 0,
                                             spapr_tce_get_iommu(dev->tcet), 2);
-- 
2.30.2


