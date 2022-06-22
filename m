Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6B9554248
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 07:31:44 +0200 (CEST)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3sxp-0008SI-QJ
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 01:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1o3swG-0007Rw-6A; Wed, 22 Jun 2022 01:30:04 -0400
Received: from ozlabs.ru ([107.174.27.60]:57856)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1o3swD-00052J-Ow; Wed, 22 Jun 2022 01:30:03 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 85C3B8218B;
 Wed, 22 Jun 2022 01:29:56 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	qemu-devel@nongnu.org
Subject: [PATCH qemu v2] spapr/ddw: Reset DMA when the last non-default window
 is removed
Date: Wed, 22 Jun 2022 15:29:55 +1000
Message-Id: <20220622052955.1069903-1-aik@ozlabs.ru>
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
Changes:
v2:
* reverted changes to spapr_tce_table_enable()
---
 include/hw/ppc/spapr.h  |  1 +
 hw/ppc/spapr_iommu.c    |  3 ++-
 hw/ppc/spapr_pci.c      |  1 +
 hw/ppc/spapr_rtas_ddw.c | 15 +++++++++++++++
 4 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 072dda2c7265..4ba2b27b8c4f 100644
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
diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index 81e5a1aea3a6..63e34d457a0e 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
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
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index b2f5fbef0c83..5e95d7940fc8 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2067,6 +2067,7 @@ void spapr_phb_dma_reset(SpaprPhbState *sphb)
     tcet = spapr_tce_find_by_liobn(sphb->dma_liobn[0]);
     spapr_tce_table_enable(tcet, SPAPR_TCE_PAGE_SHIFT, sphb->dma_win_addr,
                            sphb->dma_win_size >> SPAPR_TCE_PAGE_SHIFT);
+    tcet->def_win = true;
 }
 
 static void spapr_phb_reset(DeviceState *qdev)
diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
index 13d339c807c1..bb7d91b6d1af 100644
--- a/hw/ppc/spapr_rtas_ddw.c
+++ b/hw/ppc/spapr_rtas_ddw.c
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
 
-- 
2.30.2


