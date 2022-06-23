Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A2D557403
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 09:34:14 +0200 (CEST)
Received: from localhost ([::1]:52216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4HLx-0001nF-86
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 03:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1o4HJa-000139-GF; Thu, 23 Jun 2022 03:31:47 -0400
Received: from ozlabs.ru ([107.174.27.60]:57520)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1o4HJY-0003UI-1g; Thu, 23 Jun 2022 03:31:45 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 38CC4804B2;
 Thu, 23 Jun 2022 03:31:38 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	qemu-devel@nongnu.org
Subject: [PATCH qemu] spapr/ddw: Implement 64bit query extension
Date: Thu, 23 Jun 2022 17:31:36 +1000
Message-Id: <20220623073136.1380214-1-aik@ozlabs.ru>
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

PAPR 2.8 (2018) defines an extension to return 64bit value for
the largest TCE block in "ibm,query-pe-dma-window". Recent Linux kernels
support this already.

This adds the extension and supports the older format.

This advertises a bigger window for the new format as the biggest
window with 2M pages below the start of the 64bit window as it is
the maximum we will see in practice.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 hw/ppc/spapr_pci.c      |  5 +++--
 hw/ppc/spapr_rtas_ddw.c | 19 +++++++++++++++----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 5e95d7940fc8..67e9d468aa9c 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2360,8 +2360,9 @@ int spapr_dt_phb(SpaprMachineState *spapr, SpaprPhbState *phb,
         cpu_to_be32(RTAS_IBM_REMOVE_PE_DMA_WINDOW)
     };
     uint32_t ddw_extensions[] = {
-        cpu_to_be32(1),
-        cpu_to_be32(RTAS_IBM_RESET_PE_DMA_WINDOW)
+        cpu_to_be32(2),
+        cpu_to_be32(RTAS_IBM_RESET_PE_DMA_WINDOW),
+        cpu_to_be32(1), /* 1: ibm,query-pe-dma-window 6 outputs, PAPR 2.8 */
     };
     SpaprTceTable *tcet;
     SpaprDrc *drc;
diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
index bb7d91b6d1af..7ba11382bc3f 100644
--- a/hw/ppc/spapr_rtas_ddw.c
+++ b/hw/ppc/spapr_rtas_ddw.c
@@ -100,7 +100,7 @@ static void rtas_ibm_query_pe_dma_window(PowerPCCPU *cpu,
     uint64_t buid;
     uint32_t avail, addr, pgmask = 0;
 
-    if ((nargs != 3) || (nret != 5)) {
+    if ((nargs != 3) || ((nret != 5) && (nret != 6))) {
         goto param_error_exit;
     }
 
@@ -118,9 +118,20 @@ static void rtas_ibm_query_pe_dma_window(PowerPCCPU *cpu,
 
     rtas_st(rets, 0, RTAS_OUT_SUCCESS);
     rtas_st(rets, 1, avail);
-    rtas_st(rets, 2, 0x80000000); /* The largest window we can possibly have */
-    rtas_st(rets, 3, pgmask);
-    rtas_st(rets, 4, 0); /* DMA migration mask, not supported */
+    if (nret == 6) {
+        /*
+         * Set the Max TCE number as 1<<(58-21) = 0x20.0000.0000
+         * 1<<59 is the huge window start and 21 is 2M page shift.
+         */
+        rtas_st(rets, 2, 0x00000020);
+        rtas_st(rets, 3, 0x00000000);
+        rtas_st(rets, 4, pgmask);
+        rtas_st(rets, 5, 0); /* DMA migration mask, not supported */
+    } else {
+        rtas_st(rets, 2, 0x80000000);
+        rtas_st(rets, 3, pgmask);
+        rtas_st(rets, 4, 0); /* DMA migration mask, not supported */
+    }
 
     trace_spapr_iommu_ddw_query(buid, addr, avail, 0x80000000, pgmask);
     return;
-- 
2.30.2


