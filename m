Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C793C1ED9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:23:20 +0200 (CEST)
Received: from localhost ([::1]:50124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iyt-0001HC-SU
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itb-0000tv-AG; Fri, 09 Jul 2021 01:17:51 -0400
Received: from ozlabs.org ([203.11.71.1]:34179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itV-0001pD-L1; Fri, 09 Jul 2021 01:17:51 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHd1Cl6z9sWd; Fri,  9 Jul 2021 15:17:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807853;
 bh=xoc67/6UDUyRNCCPD8TosCLtaV2h3o1+SiaxBon11aI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hr5UbdQXQ4f73Ze31WDBJeQ6PKkaS/295SvI6W2yppsKeAuVp4JqfVjzRscpC0Gn2
 apKvfNG15rItKx7QjPibWXI0LtJrpC7HD+SJW9/UK4NGqTeMShhUVS5fs5ay8nhrWg
 RxRG1X5txZSZz7YUlXhf/jXTFCFVLARsWMEyUczc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 03/33] spapr: tune rtas-size
Date: Fri,  9 Jul 2021 15:16:58 +1000
Message-Id: <20210709051728.170203-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

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
Message-Id: <20210622070336.1463250-1-aik@ozlabs.ru>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c         | 8 ++++++--
 include/hw/ppc/spapr.h | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4dd90b75cc..9e19c57032 100644
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
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index f05219f75e..5697327e4c 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -770,7 +770,7 @@ void spapr_load_rtas(SpaprMachineState *spapr, void *fdt, hwaddr addr);
 #define SPAPR_IS_PCI_LIOBN(liobn)   (!!((liobn) & 0x80000000))
 #define SPAPR_PCI_DMA_WINDOW_NUM(liobn) ((liobn) & 0xff)
 
-#define RTAS_SIZE               2048
+#define RTAS_MIN_SIZE           20 /* hv_rtas_size in SLOF */
 #define RTAS_ERROR_LOG_MAX      2048
 
 /* Offset from rtas-base where error log is placed */
-- 
2.31.1


