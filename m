Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 783D8436B96
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 21:55:41 +0200 (CEST)
Received: from localhost ([::1]:46230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeA8-0004Hy-EJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 15:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde1p-0002r3-76; Thu, 21 Oct 2021 15:47:05 -0400
Received: from [201.28.113.2] (port=45000 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde1n-00078b-DP; Thu, 21 Oct 2021 15:47:04 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:46:54 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id BAF49800145;
 Thu, 21 Oct 2021 16:46:53 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 01/33] target/ppc: introduce do_ea_calc
Date: Thu, 21 Oct 2021 16:45:15 -0300
Message-Id: <20211021194547.672988-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:46:54.0274 (UTC)
 FILETIME=[66421A20:01D7C6B4]
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
Cc: pherde <phervalle@gmail.com>, lucas.castro@eldorado.org.br,
 richard.henderson@linaro.org, groug@kaod.org, luis.pires@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: pherde <phervalle@gmail.com>

The do_ea_calc function will calculate the effective address(EA)
according to PowerIsa 3.1. With that, it was replaced part of
do_ldst() that calculates the EA by this new function.

Signed-off-by: Fernando Eckhardt Valle (pherde) <phervalle@gmail.com>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c                     | 12 ++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc |  9 +--------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 62414adb75..bb8edd9d8f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3197,6 +3197,18 @@ static inline void gen_align_no_le(DisasContext *ctx)
                       (ctx->opcode & 0x03FF0000) | POWERPC_EXCP_ALIGN_LE);
 }
 
+static inline void do_ea_calc(DisasContext *ctx, int ra, TCGv displ, TCGv ea)
+{
+    if (ra) {
+        tcg_gen_add_tl(ea, cpu_gpr[ra], displ);
+    } else {
+        tcg_gen_mov_tl(ea, displ);
+    }
+    if (NARROW_MODE(ctx)) {
+        tcg_gen_ext32u_tl(ea, ea);
+    }
+}
+
 /***                             Integer load                              ***/
 #define DEF_MEMOP(op) ((op) | ctx->default_tcg_memop_mask)
 #define BSWAP_MEMOP(op) ((op) | (ctx->default_tcg_memop_mask ^ MO_BSWAP))
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 2e2518ee15..53d8fbdcfe 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -52,14 +52,7 @@ static bool do_ldst(DisasContext *ctx, int rt, int ra, TCGv displ, bool update,
     gen_set_access_type(ctx, ACCESS_INT);
 
     ea = tcg_temp_new();
-    if (ra) {
-        tcg_gen_add_tl(ea, cpu_gpr[ra], displ);
-    } else {
-        tcg_gen_mov_tl(ea, displ);
-    }
-    if (NARROW_MODE(ctx)) {
-        tcg_gen_ext32u_tl(ea, ea);
-    }
+    do_ea_calc(ctx, ra, displ, ea);
     mop ^= ctx->default_tcg_memop_mask;
     if (store) {
         tcg_gen_qemu_st_tl(cpu_gpr[rt], ea, ctx->mem_idx, mop);
-- 
2.25.1


