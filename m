Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E474440422
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:32:23 +0200 (CEST)
Received: from localhost ([::1]:41598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYY2-0001JS-35
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYRQ-0000sM-Di; Fri, 29 Oct 2021 16:25:33 -0400
Received: from [201.28.113.2] (port=65208 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYRO-0001sK-Q4; Fri, 29 Oct 2021 16:25:32 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 17:24:57 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 75AFF800B36;
 Fri, 29 Oct 2021 17:24:57 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 01/34] target/ppc: introduce do_ea_calc
Date: Fri, 29 Oct 2021 17:23:51 -0300
Message-Id: <20211029202424.175401-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 20:24:58.0006 (UTC)
 FILETIME=[0AC5F360:01D7CD03]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fernando Eckhardt Valle <phervalle@gmail.com>, lucas.castro@eldorado.org.br,
 richard.henderson@linaro.org, groug@kaod.org, luis.pires@eldorado.org.br,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fernando Eckhardt Valle <phervalle@gmail.com>

The do_ea_calc function will calculate the effective address(EA)
according to PowerIsa 3.1. With that, it was replaced part of
do_ldst() that calculates the EA by this new function.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fernando Eckhardt Valle (pherde) <phervalle@gmail.com>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v2:
- Allocate and return ea
- inline attribute removed
---
 target/ppc/translate.c                     | 14 ++++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 10 +---------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 62414adb75..cc809341e4 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3197,6 +3197,20 @@ static inline void gen_align_no_le(DisasContext *ctx)
                       (ctx->opcode & 0x03FF0000) | POWERPC_EXCP_ALIGN_LE);
 }
 
+static TCGv do_ea_calc(DisasContext *ctx, int ra, TCGv displ)
+{
+    TCGv ea = tcg_temp_new();
+    if (ra) {
+        tcg_gen_add_tl(ea, cpu_gpr[ra], displ);
+    } else {
+        tcg_gen_mov_tl(ea, displ);
+    }
+    if (NARROW_MODE(ctx)) {
+        tcg_gen_ext32u_tl(ea, ea);
+    }
+    return ea;
+}
+
 /***                             Integer load                              ***/
 #define DEF_MEMOP(op) ((op) | ctx->default_tcg_memop_mask)
 #define BSWAP_MEMOP(op) ((op) | (ctx->default_tcg_memop_mask ^ MO_BSWAP))
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 2e2518ee15..caef5d89cd 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -51,15 +51,7 @@ static bool do_ldst(DisasContext *ctx, int rt, int ra, TCGv displ, bool update,
     }
     gen_set_access_type(ctx, ACCESS_INT);
 
-    ea = tcg_temp_new();
-    if (ra) {
-        tcg_gen_add_tl(ea, cpu_gpr[ra], displ);
-    } else {
-        tcg_gen_mov_tl(ea, displ);
-    }
-    if (NARROW_MODE(ctx)) {
-        tcg_gen_ext32u_tl(ea, ea);
-    }
+    ea = do_ea_calc(ctx, ra, displ);
     mop ^= ctx->default_tcg_memop_mask;
     if (store) {
         tcg_gen_qemu_st_tl(cpu_gpr[rt], ea, ctx->mem_idx, mop);
-- 
2.25.1


