Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937E14453D7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 14:27:52 +0100 (CET)
Received: from localhost ([::1]:45536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1micmV-0003cR-Ae
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 09:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic3l-0002HJ-HV; Thu, 04 Nov 2021 08:41:42 -0400
Received: from [201.28.113.2] (port=58980 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic3i-0006gQ-G1; Thu, 04 Nov 2021 08:41:36 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 4 Nov 2021 09:39:21 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 1EA9F800BA7;
 Thu,  4 Nov 2021 09:39:21 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 14/25] target/ppc: added the instructions LXVP and STXVP
Date: Thu,  4 Nov 2021 09:37:08 -0300
Message-Id: <20211104123719.323713-15-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
References: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Nov 2021 12:39:21.0464 (UTC)
 FILETIME=[FDC66F80:01D7D178]
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Implemented the instructions lxvp and stxvp using decodetree

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  5 +++
 target/ppc/translate/vsx-impl.c.inc | 55 ++++++++++++++++++++++-------
 2 files changed, 48 insertions(+), 12 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 3ce26b2e6e..c252dec02f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -31,6 +31,9 @@
 %dq_rt_tsx      3:1 21:5
 @DQ_TSX         ...... ..... ra:5 ............ ....             &D si=%dq_si rt=%dq_rt_tsx
 
+%rt_tsxp        21:1 22:4 !function=times_2
+@DQ_TSXP        ...... ..... ra:5 ............ ....             &D si=%dq_si rt=%rt_tsxp
+
 %ds_si          2:s14  !function=times_4
 @DS             ...... rt:5 ra:5 .............. ..      &D si=%ds_si
 
@@ -396,5 +399,7 @@ VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
 
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
 STXV            111101 ..... ..... ............ . 101   @DQ_TSX
+LXVP            000110 ..... ..... ............ 0000    @DQ_TSXP
+STXVP           000110 ..... ..... ............ 0001    @DQ_TSXP
 LXVX            011111 ..... ..... ..... 0100 - 01100 . @X_TSX
 STXVX           011111 ..... ..... ..... 0110001100 .   @X_TSX
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 1973bb18f3..05bf6ea40c 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1945,11 +1945,12 @@ static void gen_xvxsigdp(DisasContext *ctx)
 }
 
 static bool do_lstxv(DisasContext *ctx, int ra, TCGv displ,
-                     int rt, bool store)
+                     int rt, bool store, bool paired)
 {
     TCGv ea;
     TCGv_i64 xt;
     MemOp mop;
+    int rt1, rt2;
 
     xt = tcg_temp_new_i64();
 
@@ -1958,18 +1959,42 @@ static bool do_lstxv(DisasContext *ctx, int ra, TCGv displ,
     gen_set_access_type(ctx, ACCESS_INT);
     ea = do_ea_calc(ctx, ra, displ);
 
+    if (paired && ctx->le_mode) {
+        rt1 = rt + 1;
+        rt2 = rt;
+    } else {
+        rt1 = rt;
+        rt2 = rt + 1;
+    }
+
     if (store) {
-        get_cpu_vsr(xt, rt, !ctx->le_mode);
+        get_cpu_vsr(xt, rt1, !ctx->le_mode);
         tcg_gen_qemu_st_i64(xt, ea, ctx->mem_idx, mop);
         gen_addr_add(ctx, ea, ea, 8);
-        get_cpu_vsr(xt, rt, ctx->le_mode);
+        get_cpu_vsr(xt, rt1, ctx->le_mode);
         tcg_gen_qemu_st_i64(xt, ea, ctx->mem_idx, mop);
+        if (paired) {
+            gen_addr_add(ctx, ea, ea, 8);
+            get_cpu_vsr(xt, rt2, !ctx->le_mode);
+            tcg_gen_qemu_st_i64(xt, ea, ctx->mem_idx, mop);
+            gen_addr_add(ctx, ea, ea, 8);
+            get_cpu_vsr(xt, rt2, ctx->le_mode);
+            tcg_gen_qemu_st_i64(xt, ea, ctx->mem_idx, mop);
+        }
     } else {
         tcg_gen_qemu_ld_i64(xt, ea, ctx->mem_idx, mop);
-        set_cpu_vsr(rt, xt, !ctx->le_mode);
+        set_cpu_vsr(rt1, xt, !ctx->le_mode);
         gen_addr_add(ctx, ea, ea, 8);
         tcg_gen_qemu_ld_i64(xt, ea, ctx->mem_idx, mop);
-        set_cpu_vsr(rt, xt, ctx->le_mode);
+        set_cpu_vsr(rt1, xt, ctx->le_mode);
+        if (paired) {
+            gen_addr_add(ctx, ea, ea, 8);
+            tcg_gen_qemu_ld_i64(xt, ea, ctx->mem_idx, mop);
+            set_cpu_vsr(rt2, xt, !ctx->le_mode);
+            gen_addr_add(ctx, ea, ea, 8);
+            tcg_gen_qemu_ld_i64(xt, ea, ctx->mem_idx, mop);
+            set_cpu_vsr(rt2, xt, ctx->le_mode);
+        }
     }
 
     tcg_temp_free(ea);
@@ -1977,17 +2002,21 @@ static bool do_lstxv(DisasContext *ctx, int ra, TCGv displ,
     return true;
 }
 
-static bool do_lstxv_D(DisasContext *ctx, arg_D *a, bool store)
+static bool do_lstxv_D(DisasContext *ctx, arg_D *a, bool store, bool paired)
 {
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    if (paired) {
+        REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    } else {
+        REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    }
 
-    if (a->rt >= 32) {
+    if (paired || a->rt >= 32) {
         REQUIRE_VSX(ctx);
     } else {
         REQUIRE_VECTOR(ctx);
     }
 
-    return do_lstxv(ctx, a->ra, tcg_constant_tl(a->si), a->rt, store);
+    return do_lstxv(ctx, a->ra, tcg_constant_tl(a->si), a->rt, store, paired);
 }
 
 static bool do_lstxv_X(DisasContext *ctx, arg_X *a, bool store)
@@ -2000,11 +2029,13 @@ static bool do_lstxv_X(DisasContext *ctx, arg_X *a, bool store)
         REQUIRE_VECTOR(ctx);
     }
 
-    return do_lstxv(ctx, a->ra, cpu_gpr[a->rb], a->rt, store);
+    return do_lstxv(ctx, a->ra, cpu_gpr[a->rb], a->rt, store, false);
 }
 
-TRANS(STXV, do_lstxv_D, true)
-TRANS(LXV, do_lstxv_D, false)
+TRANS(STXV, do_lstxv_D, true, false)
+TRANS(LXV, do_lstxv_D, false, false)
+TRANS(STXVP, do_lstxv_D, true, true)
+TRANS(LXVP, do_lstxv_D, false, true)
 TRANS(STXVX, do_lstxv_X, true)
 TRANS(LXVX, do_lstxv_X, false)
 
-- 
2.25.1


