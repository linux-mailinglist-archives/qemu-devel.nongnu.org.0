Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA884BFDD7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:56:11 +0100 (CET)
Received: from localhost ([::1]:51090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXWM-00067u-Rs
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:56:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWPN-0002HA-07; Tue, 22 Feb 2022 09:44:53 -0500
Received: from [187.72.171.209] (port=14718 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWPL-0006Am-3f; Tue, 22 Feb 2022 09:44:52 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:51 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2CCB58000A7;
 Tue, 22 Feb 2022 11:37:51 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 46/47] target/ppc: implement plxssp/pstxssp
Date: Tue, 22 Feb 2022 11:36:44 -0300
Message-Id: <20220222143646.1268606-47-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:51.0559 (UTC)
 FILETIME=[C5295570:01D827F9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

Implement instructions plxssp/pstxssp and port lxssp/stxssp to
decode tree.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  2 +
 target/ppc/insn64.decode            |  6 ++
 target/ppc/translate.c              | 29 +++------
 target/ppc/translate/vsx-impl.c.inc | 93 +++++++++++++++--------------
 4 files changed, 62 insertions(+), 68 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d84ff333ec..5d3cfadfc6 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -602,6 +602,8 @@ VCLRRB          000100 ..... ..... ..... 00111001101    @VX
 
 LXSD            111001 ..... ..... .............. 10    @DS
 STXSD           111101 ..... ..... .............. 10    @DS
+LXSSP           111001 ..... ..... .............. 11    @DS
+STXSSP          111101 ..... ..... .............. 11    @DS
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
 STXV            111101 ..... ..... ............ . 101   @DQ_TSX
 LXVP            000110 ..... ..... ............ 0000    @DQ_TSXP
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index b7426f5b24..691e8fe6c0 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -190,6 +190,12 @@ PLXSD           000001 00 0--.-- .................. \
 PSTXSD          000001 00 0--.-- .................. \
                 101110 ..... ..... ................     @8LS_D
 
+PLXSSP          000001 00 0--.-- .................. \
+                101011 ..... ..... ................     @8LS_D
+
+PSTXSSP         000001 00 0--.-- .................. \
+                101111 ..... ..... ................     @8LS_D
+
 PLXV            000001 00 0--.-- .................. \
                 11001 ...... ..... ................     @8LS_D_TSX
 PSTXV           000001 00 0--.-- .................. \
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index aa860d6bf9..589ed8b7c1 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6668,39 +6668,24 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
 
 #include "translate/branch-impl.c.inc"
 
-/* Handles lfdp, lxssp */
+/* Handles lfdp */
 static void gen_dform39(DisasContext *ctx)
 {
-    switch (ctx->opcode & 0x3) {
-    case 0: /* lfdp */
+    if ((ctx->opcode & 0x3) == 0) {
         if (ctx->insns_flags2 & PPC2_ISA205) {
             return gen_lfdp(ctx);
         }
-        break;
-    case 3: /* lxssp */
-        if (ctx->insns_flags2 & PPC2_ISA300) {
-            return gen_lxssp(ctx);
-        }
-        break;
     }
     return gen_invalid(ctx);
 }
 
-/* handles stfdp, lxv, stxssp lxvx */
+/* Handles stfdp */
 static void gen_dform3D(DisasContext *ctx)
 {
-    if ((ctx->opcode & 3) != 1) { /* DS-FORM */
-        switch (ctx->opcode & 0x3) {
-        case 0: /* stfdp */
-            if (ctx->insns_flags2 & PPC2_ISA205) {
-                return gen_stfdp(ctx);
-            }
-            break;
-        case 3: /* stxssp */
-            if (ctx->insns_flags2 & PPC2_ISA300) {
-                return gen_stxssp(ctx);
-            }
-            break;
+    if ((ctx->opcode & 3) == 0) { /* DS-FORM */
+        /* stfdp */
+        if (ctx->insns_flags2 & PPC2_ISA205) {
+            return gen_stfdp(ctx);
         }
     }
     return gen_invalid(ctx);
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index cabadcf106..48a398da0e 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -288,29 +288,6 @@ VSX_VECTOR_LOAD_STORE_LENGTH(stxvl)
 VSX_VECTOR_LOAD_STORE_LENGTH(stxvll)
 #endif
 
-#define VSX_LOAD_SCALAR_DS(name, operation)                       \
-static void gen_##name(DisasContext *ctx)                         \
-{                                                                 \
-    TCGv EA;                                                      \
-    TCGv_i64 xth;                                                 \
-                                                                  \
-    if (unlikely(!ctx->altivec_enabled)) {                        \
-        gen_exception(ctx, POWERPC_EXCP_VPU);                     \
-        return;                                                   \
-    }                                                             \
-    xth = tcg_temp_new_i64();                                     \
-    gen_set_access_type(ctx, ACCESS_INT);                         \
-    EA = tcg_temp_new();                                          \
-    gen_addr_imm_index(ctx, EA, 0x03);                            \
-    gen_qemu_##operation(ctx, xth, EA);                           \
-    set_cpu_vsr(rD(ctx->opcode) + 32, xth, true);                 \
-    /* NOTE: cpu_vsrl is undefined */                             \
-    tcg_temp_free(EA);                                            \
-    tcg_temp_free_i64(xth);                                       \
-}
-
-VSX_LOAD_SCALAR_DS(lxssp, ld32fs)
-
 #define VSX_STORE_SCALAR(name, operation)                     \
 static void gen_##name(DisasContext *ctx)                     \
 {                                                             \
@@ -460,29 +437,6 @@ static void gen_stxvb16x(DisasContext *ctx)
     tcg_temp_free_i64(xsl);
 }
 
-#define VSX_STORE_SCALAR_DS(name, operation)                      \
-static void gen_##name(DisasContext *ctx)                         \
-{                                                                 \
-    TCGv EA;                                                      \
-    TCGv_i64 xth;                                                 \
-                                                                  \
-    if (unlikely(!ctx->altivec_enabled)) {                        \
-        gen_exception(ctx, POWERPC_EXCP_VPU);                     \
-        return;                                                   \
-    }                                                             \
-    xth = tcg_temp_new_i64();                                     \
-    get_cpu_vsr(xth, rD(ctx->opcode) + 32, true);                 \
-    gen_set_access_type(ctx, ACCESS_INT);                         \
-    EA = tcg_temp_new();                                          \
-    gen_addr_imm_index(ctx, EA, 0x03);                            \
-    gen_qemu_##operation(ctx, xth, EA);                           \
-    /* NOTE: cpu_vsrl is undefined */                             \
-    tcg_temp_free(EA);                                            \
-    tcg_temp_free_i64(xth);                                       \
-}
-
-VSX_STORE_SCALAR_DS(stxssp, st32fs)
-
 static void gen_mfvsrwz(DisasContext *ctx)
 {
     if (xS(ctx->opcode) < 32) {
@@ -2328,8 +2282,53 @@ static bool do_plstxsd_PLS_D(DisasContext *ctx, arg_PLS_D *a, bool store)
     return do_lstxsd(ctx, d.rt, d.ra, tcg_constant_tl(d.si), store);
 }
 
+static bool do_lstxssp(DisasContext *ctx, int rt, int ra, TCGv displ, bool store)
+{
+    TCGv ea;
+    TCGv_i64 xt;
+
+    REQUIRE_VECTOR(ctx);
+
+    xt = tcg_temp_new_i64();
+
+    gen_set_access_type(ctx, ACCESS_INT);
+    ea = do_ea_calc(ctx, ra, displ);
+
+    if (store) {
+        get_cpu_vsr(xt, rt + 32, true);
+        gen_qemu_st32fs(ctx, xt, ea);
+    } else {
+        gen_qemu_ld32fs(ctx, xt, ea);
+        set_cpu_vsr(rt + 32, xt, true);
+        set_cpu_vsr(rt + 32, tcg_constant_i64(0), false);
+    }
+
+    tcg_temp_free(ea);
+    tcg_temp_free_i64(xt);
+
+    return true;
+}
+
+static bool do_lstxssp_DS(DisasContext *ctx, arg_D *a, bool store)
+{
+    return do_lstxssp(ctx, a->rt, a->ra, tcg_constant_tl(a->si), store);
+}
+
+static bool do_plstxssp_PLS_D(DisasContext *ctx, arg_PLS_D *a, bool store)
+{
+    arg_D d;
+
+    if (!resolve_PLS_D(ctx, &d, a)) {
+        return true;
+    }
+
+    return do_lstxssp(ctx, d.rt, d.ra, tcg_constant_tl(d.si), store);
+}
+
 TRANS_FLAGS2(ISA300, LXSD, do_lstxsd_DS, false)
 TRANS_FLAGS2(ISA300, STXSD, do_lstxsd_DS, true)
+TRANS_FLAGS2(ISA300, LXSSP, do_lstxssp_DS, false)
+TRANS_FLAGS2(ISA300, STXSSP, do_lstxssp_DS, true)
 TRANS_FLAGS2(ISA300, STXV, do_lstxv_D, true, false)
 TRANS_FLAGS2(ISA300, LXV, do_lstxv_D, false, false)
 TRANS_FLAGS2(ISA310, STXVP, do_lstxv_D, true, true)
@@ -2340,6 +2339,8 @@ TRANS_FLAGS2(ISA310, STXVPX, do_lstxv_X, true, true)
 TRANS_FLAGS2(ISA310, LXVPX, do_lstxv_X, false, true)
 TRANS64_FLAGS2(ISA310, PLXSD, do_plstxsd_PLS_D, false)
 TRANS64_FLAGS2(ISA310, PSTXSD, do_plstxsd_PLS_D, true)
+TRANS64_FLAGS2(ISA310, PLXSSP, do_plstxssp_PLS_D, false)
+TRANS64_FLAGS2(ISA310, PSTXSSP, do_plstxssp_PLS_D, true)
 TRANS64_FLAGS2(ISA310, PSTXV, do_lstxv_PLS_D, true, false)
 TRANS64_FLAGS2(ISA310, PLXV, do_lstxv_PLS_D, false, false)
 TRANS64_FLAGS2(ISA310, PSTXVP, do_lstxv_PLS_D, true, true)
-- 
2.25.1


