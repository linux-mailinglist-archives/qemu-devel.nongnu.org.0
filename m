Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8306B3758E7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 19:07:14 +0200 (CEST)
Received: from localhost ([::1]:40154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lehSx-0005cN-Ae
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 13:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1leh37-0004w4-RU; Thu, 06 May 2021 12:40:30 -0400
Received: from [201.28.113.2] (port=23611 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1leh35-0001sf-86; Thu, 06 May 2021 12:40:29 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 6 May 2021 13:39:52 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id D57B6800E42;
 Thu,  6 May 2021 13:39:52 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 4/4] hw/ppc: Altered calls from oea_read to read
Date: Thu,  6 May 2021 13:39:41 -0300
Message-Id: <20210506163941.106984-5-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506163941.106984-1-lucas.araujo@eldorado.org.br>
References: <20210506163941.106984-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 06 May 2021 16:39:53.0013 (UTC)
 FILETIME=[70778E50:01D74296]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bruno.larsen@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 farosas@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changed spapr.c and pnv.c from calls of ppc_spr_t.oea_read to
ppc_spr_t.name as oea_read is not available in !TCG builds.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 hw/ppc/pnv.c   | 2 +-
 hw/ppc/spapr.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 77af846cdf..06849b8802 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -199,7 +199,7 @@ static void pnv_dt_core(PnvChip *chip, PnvCore *pc, void *fdt)
     _FDT((fdt_setprop_string(fdt, offset, "status", "okay")));
     _FDT((fdt_setprop(fdt, offset, "64-bit", NULL, 0)));
 
-    if (env->spr_cb[SPR_PURR].oea_read) {
+    if (env->spr_cb[SPR_PURR].name) {
         _FDT((fdt_setprop(fdt, offset, "ibm,purr", NULL, 0)));
     }
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b37ceb8ee8..61653cbe2e 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -705,10 +705,10 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
     _FDT((fdt_setprop_string(fdt, offset, "status", "okay")));
     _FDT((fdt_setprop(fdt, offset, "64-bit", NULL, 0)));
 
-    if (env->spr_cb[SPR_PURR].oea_read) {
+    if (env->spr_cb[SPR_PURR].name) {
         _FDT((fdt_setprop_cell(fdt, offset, "ibm,purr", 1)));
     }
-    if (env->spr_cb[SPR_SPURR].oea_read) {
+    if (env->spr_cb[SPR_SPURR].name) {
         _FDT((fdt_setprop_cell(fdt, offset, "ibm,spurr", 1)));
     }
 
-- 
2.17.1


