Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DC83AFD89
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 09:05:18 +0200 (CEST)
Received: from localhost ([::1]:52684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaTF-0007M3-2h
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 03:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1lvaRl-0006Rc-Uw; Tue, 22 Jun 2021 03:03:46 -0400
Received: from ozlabs.ru ([107.174.27.60]:43358)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1lvaRj-00041i-Gp; Tue, 22 Jun 2021 03:03:45 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 3E08CAE80048;
 Tue, 22 Jun 2021 03:03:38 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Subject: [PATCH qemu] spapr: tune rtas-size
Date: Tue, 22 Jun 2021 17:03:36 +1000
Message-Id: <20210622070336.1463250-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU reserves space for RTAS via /rtas/rtas-size which tells the client
how much space the RTAS requires to work which includes the RTAS binary
blob implementing RTAS runtime. Because pseries supports FWNMI which
requires plenty of space, QEMU reserves more than 2KB which is
enough for the RTAS blob as it is just 20 bytes (under QEMU).

Since FWNMI reset delivery was added, RTAS_SIZE macro is not used anymore.
This replaces RTAS_SIZE with RTAS_MIN_SIZE and uses it in
the /rtas/rtas-size calculation to account for the RTAS blob.

Fixes: 0e236d347790 ("ppc/spapr: Implement FWNMI System Reset delivery")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

Alternatively SLOF could add hv_rtas_size to the property itself
but splitting calculations between 2 chunks of code seems an overkill.
The RTAS blob has always been 20 bytes and unlikely to ever change.
---
 include/hw/ppc/spapr.h | 2 +-
 hw/ppc/spapr.c         | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index f05219f75ef6..5697327e4c00 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -770,7 +770,7 @@ void spapr_load_rtas(SpaprMachineState *spapr, void *fdt, hwaddr addr);
 #define SPAPR_IS_PCI_LIOBN(liobn)   (!!((liobn) & 0x80000000))
 #define SPAPR_PCI_DMA_WINDOW_NUM(liobn) ((liobn) & 0xff)
 
-#define RTAS_SIZE               2048
+#define RTAS_MIN_SIZE           20 /* hv_rtas_size in SLOF */
 #define RTAS_ERROR_LOG_MAX      2048
 
 /* Offset from rtas-base where error log is placed */
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4dd90b75cc52..9e19c570327e 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -919,9 +919,13 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
      *
      * The extra 8 bytes is required because Linux's FWNMI error log check
      * is off-by-one.
+     *
+     * RTAS_MIN_SIZE is required for the RTAS blob itself.
      */
-    _FDT(fdt_setprop_cell(fdt, rtas, "rtas-size", RTAS_ERROR_LOG_MAX +
-			  ms->smp.max_cpus * sizeof(uint64_t)*2 + sizeof(uint64_t)));
+    _FDT(fdt_setprop_cell(fdt, rtas, "rtas-size", RTAS_MIN_SIZE +
+                          RTAS_ERROR_LOG_MAX +
+                          ms->smp.max_cpus * sizeof(uint64_t) * 2 +
+                          sizeof(uint64_t)));
     _FDT(fdt_setprop_cell(fdt, rtas, "rtas-error-log-max",
                           RTAS_ERROR_LOG_MAX));
     _FDT(fdt_setprop_cell(fdt, rtas, "rtas-event-scan-rate",
-- 
2.30.2


