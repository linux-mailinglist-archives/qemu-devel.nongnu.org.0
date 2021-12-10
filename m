Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104724703D7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:27:43 +0100 (CET)
Received: from localhost ([::1]:57606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvhoE-0003fz-2Y
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:27:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1mvgws-0004Xu-KY; Fri, 10 Dec 2021 09:32:34 -0500
Received: from [201.28.113.2] (port=6297 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1mvgwr-0002Cy-3L; Fri, 10 Dec 2021 09:32:34 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 10 Dec 2021 11:13:54 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id BB7EC8009F6;
 Fri, 10 Dec 2021 11:13:53 -0300 (-03)
From: Victor Colombo <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 4/4] target/ppc: move xscvqpdp to decodetree
Date: Fri, 10 Dec 2021 11:13:47 -0300
Message-Id: <20211210141347.38603-5-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210141347.38603-1-victor.colombo@eldorado.org.br>
References: <20211210141347.38603-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Dec 2021 14:13:54.0036 (UTC)
 FILETIME=[29C33B40:01D7EDD0]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Dec 2021 10:20:18 -0500
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
Cc: groug@kaod.org, danielhb413@gmail.com, matheus.ferst@eldorado.org.br,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c             | 10 +++-------
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  4 ++++
 target/ppc/translate/vsx-impl.c.inc | 24 +++++++++++++-----------
 target/ppc/translate/vsx-ops.c.inc  |  1 -
 5 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index ad41ef1606..46f507604f 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2676,18 +2676,14 @@ VSX_CVT_FP_TO_FP_HP(xscvhpdp, 1, float16, float64, VsrH(3), VsrD(0), 1)
 VSX_CVT_FP_TO_FP_HP(xvcvsphp, 4, float32, float16, VsrW(i), VsrH(2 * i  + 1), 0)
 VSX_CVT_FP_TO_FP_HP(xvcvhpsp, 4, float16, float32, VsrH(2 * i + 1), VsrW(i), 0)
 
-/*
- * xscvqpdp isn't using VSX_CVT_FP_TO_FP() because xscvqpdpo will be
- * added to this later.
- */
-void helper_xscvqpdp(CPUPPCState *env, uint32_t opcode,
-                     ppc_vsr_t *xt, ppc_vsr_t *xb)
+void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
+                     ppc_vsr_t *xb)
 {
     ppc_vsr_t t = { };
     float_status tstat;
 
     tstat = env->fp_status;
-    if (unlikely(Rc(opcode) != 0)) {
+    if (ro != 0) {
         tstat.float_rounding_mode = float_round_to_odd;
     }
 
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 12a3d5f269..ef5bdd38a7 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -400,7 +400,7 @@ DEF_HELPER_3(xscvdphp, void, env, vsr, vsr)
 DEF_HELPER_4(xscvdpqp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xscvdpsp, void, env, vsr, vsr)
 DEF_HELPER_2(xscvdpspn, i64, env, i64)
-DEF_HELPER_4(xscvqpdp, void, env, i32, vsr, vsr)
+DEF_HELPER_4(XSCVQPDP, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpsdz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpswz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpudz, void, env, i32, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 759b2a9aa5..fd6bb13fa0 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -438,3 +438,7 @@ XSMAXCDP        111100 ..... ..... ..... 10000000 ...   @XX3
 XSMINCDP        111100 ..... ..... ..... 10001000 ...   @XX3
 XSMAXJDP        111100 ..... ..... ..... 10010000 ...   @XX3
 XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
+
+## VSX Binary Floating-Point Convert Instructions
+
+XSCVQPDP        111111 ..... 10100 ..... 1101000100 .   @X_tb_rc
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index ab5cb21f13..f8669cae42 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -904,22 +904,24 @@ VSX_CMP(xvcmpgesp, 0x0C, 0x0A, 0, PPC2_VSX)
 VSX_CMP(xvcmpgtsp, 0x0C, 0x09, 0, PPC2_VSX)
 VSX_CMP(xvcmpnesp, 0x0C, 0x0B, 0, PPC2_VSX)
 
-static void gen_xscvqpdp(DisasContext *ctx)
+static bool trans_XSCVQPDP(DisasContext *ctx, arg_X_tb_rc *a)
 {
-    TCGv_i32 opc;
+    TCGv_i32 ro;
     TCGv_ptr xt, xb;
-    if (unlikely(!ctx->vsx_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_VSXU);
-        return;
-    }
-    opc = tcg_const_i32(ctx->opcode);
 
-    xt = gen_vsr_ptr(rD(ctx->opcode) + 32);
-    xb = gen_vsr_ptr(rB(ctx->opcode) + 32);
-    gen_helper_xscvqpdp(cpu_env, opc, xt, xb);
-    tcg_temp_free_i32(opc);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    ro = tcg_const_i32(a->rc);
+
+    xt = gen_avr_ptr(a->rt);
+    xb = gen_avr_ptr(a->rb);
+    gen_helper_XSCVQPDP(cpu_env, ro, xt, xb);
+    tcg_temp_free_i32(ro);
     tcg_temp_free_ptr(xt);
     tcg_temp_free_ptr(xb);
+
+    return true;
 }
 
 #define GEN_VSX_HELPER_2(name, op1, op2, inval, type)                         \
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index f980bc1bae..c974324c4c 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -133,7 +133,6 @@ GEN_VSX_XFORM_300_EO(xsnabsqp, 0x04, 0x19, 0x08, 0x00000001),
 GEN_VSX_XFORM_300_EO(xsnegqp, 0x04, 0x19, 0x10, 0x00000001),
 GEN_VSX_XFORM_300(xscpsgnqp, 0x04, 0x03, 0x00000001),
 GEN_VSX_XFORM_300_EO(xscvdpqp, 0x04, 0x1A, 0x16, 0x00000001),
-GEN_VSX_XFORM_300_EO(xscvqpdp, 0x04, 0x1A, 0x14, 0x0),
 GEN_VSX_XFORM_300_EO(xscvqpsdz, 0x04, 0x1A, 0x19, 0x00000001),
 GEN_VSX_XFORM_300_EO(xscvqpswz, 0x04, 0x1A, 0x09, 0x00000001),
 GEN_VSX_XFORM_300_EO(xscvqpudz, 0x04, 0x1A, 0x11, 0x00000001),
-- 
2.25.1


