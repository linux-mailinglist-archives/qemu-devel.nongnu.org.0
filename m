Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAEA436BE8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:17:44 +0200 (CEST)
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeVT-00074H-7U
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde61-0000Xi-M1; Thu, 21 Oct 2021 15:51:25 -0400
Received: from [201.28.113.2] (port=62474 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde5y-0003ye-Ni; Thu, 21 Oct 2021 15:51:24 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:47:02 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 7D31380012A;
 Thu, 21 Oct 2021 16:47:02 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 21/33] target/ppc: moved stxv and lxv from legacy to decodtree
Date: Thu, 21 Oct 2021 16:45:35 -0300
Message-Id: <20211021194547.672988-22-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:47:02.0978 (UTC)
 FILETIME=[6B723A20:01D7C6B4]
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Moved stxv and lxv implementation from the legacy system to
decodetree.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  8 ++++
 target/ppc/translate.c              | 17 +-------
 target/ppc/translate/vsx-impl.c.inc | 60 ++++++++++++++++++++++++++++-
 3 files changed, 68 insertions(+), 17 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e438177b32..296d6d6c5a 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -28,6 +28,9 @@
 %dq_rtp         22:4   !function=times_2
 @DQ_rtp         ...... ....0 ra:5 ............ ....             &D rt=%dq_rtp si=%dq_si
 
+%dq_rt_tsx      3:1 21:5
+@DQ_TSX         ...... ..... ra:5 ............ ....             &D si=%dq_si rt=%dq_rt_tsx
+
 %ds_si          2:s14  !function=times_4
 @DS             ...... rt:5 ra:5 .............. ..      &D si=%ds_si
 
@@ -385,3 +388,8 @@ VINSWVRX        000100 ..... ..... ..... 00110001111    @VX
 
 VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
 VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
+
+# VSX Load/Store Instructions
+
+LXV             111101 ..... ..... ............ . 001   @DQ_TSX
+STXV            111101 ..... ..... ............ . 101   @DQ_TSX
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d11029d03a..f109830207 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7444,20 +7444,7 @@ static void gen_dform39(DisasContext *ctx)
 /* handles stfdp, lxv, stxsd, stxssp lxvx */
 static void gen_dform3D(DisasContext *ctx)
 {
-    if ((ctx->opcode & 3) == 1) { /* DQ-FORM */
-        switch (ctx->opcode & 0x7) {
-        case 1: /* lxv */
-            if (ctx->insns_flags2 & PPC2_ISA300) {
-                return gen_lxv(ctx);
-            }
-            break;
-        case 5: /* stxv */
-            if (ctx->insns_flags2 & PPC2_ISA300) {
-                return gen_stxv(ctx);
-            }
-            break;
-        }
-    } else { /* DS-FORM */
+    if ((ctx->opcode & 3) != 1) { /* DS-FORM */
         switch (ctx->opcode & 0x3) {
         case 0: /* stfdp */
             if (ctx->insns_flags2 & PPC2_ISA205) {
@@ -7582,7 +7569,7 @@ GEN_HANDLER2_E(extswsli1, "extswsli", 0x1F, 0x1B, 0x1B, 0x00000000,
 #endif
 /* handles lfdp, lxsd, lxssp */
 GEN_HANDLER_E(dform39, 0x39, 0xFF, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA205),
-/* handles stfdp, lxv, stxsd, stxssp, stxv */
+/* handles stfdp, stxsd, stxssp */
 GEN_HANDLER_E(dform3D, 0x3D, 0xFF, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA205),
 GEN_HANDLER(lmw, 0x2E, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER(stmw, 0x2F, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 57a7f73bba..dd14be6ee5 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -317,7 +317,6 @@ static void gen_##name(DisasContext *ctx)                   \
     tcg_temp_free_i64(xtl);                                 \
 }
 
-VSX_VECTOR_LOAD(lxv, ld_i64, 0)
 VSX_VECTOR_LOAD(lxvx, ld_i64, 1)
 
 #define VSX_VECTOR_STORE(name, op, indexed)                 \
@@ -370,7 +369,6 @@ static void gen_##name(DisasContext *ctx)                   \
     tcg_temp_free_i64(xtl);                                 \
 }
 
-VSX_VECTOR_STORE(stxv, st_i64, 0)
 VSX_VECTOR_STORE(stxvx, st_i64, 1)
 
 #ifdef TARGET_PPC64
@@ -2077,6 +2075,64 @@ static void gen_xvxsigdp(DisasContext *ctx)
     tcg_temp_free_i64(xbl);
 }
 
+static bool do_lstxv(DisasContext *ctx, int ra, int displ,
+                     int rt, bool store)
+{
+    TCGv ea;
+    TCGv_i64 xt;
+    MemOp mop;
+    int offset;
+
+    ea = tcg_temp_new();
+    xt = tcg_temp_new_i64();
+
+    mop = DEF_MEMOP(MO_Q);
+
+    gen_set_access_type(ctx, ACCESS_INT);
+    do_ea_calc(ctx, ra, tcg_const_tl(displ), ea);
+
+    if (ctx->le_mode) {
+        gen_addr_add(ctx, ea, ea, 8);
+        offset = -8;
+    } else {
+        offset = 8;
+    }
+
+    if (store) {
+        get_cpu_vsrh(xt, rt);
+        tcg_gen_qemu_st_i64(xt, ea, ctx->mem_idx, mop);
+        gen_addr_add(ctx, ea, ea, offset);
+        get_cpu_vsrl(xt, rt);
+        tcg_gen_qemu_st_i64(xt, ea, ctx->mem_idx, mop);
+    } else {
+        tcg_gen_qemu_ld_i64(xt, ea, ctx->mem_idx, mop);
+        set_cpu_vsrh(rt, xt);
+        gen_addr_add(ctx, ea, ea, offset);
+        tcg_gen_qemu_ld_i64(xt, ea, ctx->mem_idx, mop);
+        set_cpu_vsrl(rt, xt);
+    }
+
+    tcg_temp_free(ea);
+    tcg_temp_free_i64(xt);
+    return true;
+}
+
+static bool do_lstxv_D(DisasContext *ctx, arg_D *a, bool store)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+
+    if (a->rt >= 32) {
+        REQUIRE_VSX(ctx);
+    } else {
+        REQUIRE_VECTOR(ctx);
+    }
+
+    return do_lstxv(ctx, a->ra, a->si, a->rt, store);
+}
+
+TRANS(STXV, do_lstxv_D, true)
+TRANS(LXV, do_lstxv_D, false)
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
-- 
2.25.1


