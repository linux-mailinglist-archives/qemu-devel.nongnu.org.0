Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E80D406AC8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 13:37:46 +0200 (CEST)
Received: from localhost ([::1]:37066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOeqn-0006rG-Ex
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 07:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOeiX-0005h4-Cj; Fri, 10 Sep 2021 07:29:13 -0400
Received: from [201.28.113.2] (port=29928 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOeiV-0003iy-Fx; Fri, 10 Sep 2021 07:29:13 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 10 Sep 2021 08:26:53 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id A80018014C3;
 Fri, 10 Sep 2021 08:26:53 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 20/22] target/ppc: Move dqua[q], drrnd[q] to decodetree
Date: Fri, 10 Sep 2021 08:26:22 -0300
Message-Id: <20210910112624.72748-21-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910112624.72748-1-luis.pires@eldorado.org.br>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Sep 2021 11:26:53.0904 (UTC)
 FILETIME=[C1B52D00:01D7A636]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the following instructions to decodetree:
dqua:   DFP Quantize
dquaq:  DFP Quantize Quad
drrnd:  DFP Reround
drrndq: DFP Reround Quad

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/dfp_helper.c             |  8 ++---
 target/ppc/helper.h                 |  8 ++---
 target/ppc/insn32.decode            | 18 ++++++++--
 target/ppc/translate/dfp-impl.c.inc | 51 +++++++++++++----------------
 target/ppc/translate/dfp-ops.c.inc  | 25 --------------
 5 files changed, 47 insertions(+), 63 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 56d8846308..9c75cbb79b 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -770,8 +770,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,        \
     set_dfp##size(t, &dfp.vt);                                          \
 }
 
-DFP_HELPER_QUA(dqua, 64)
-DFP_HELPER_QUA(dquaq, 128)
+DFP_HELPER_QUA(DQUA, 64)
+DFP_HELPER_QUA(DQUAQ, 128)
 
 static void _dfp_reround(uint8_t rmc, int32_t ref_sig, int32_t xmax,
                              struct PPC_DFP *dfp)
@@ -848,8 +848,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,        \
     set_dfp##size(t, &dfp.vt);                                          \
 }
 
-DFP_HELPER_RRND(drrnd, 64)
-DFP_HELPER_RRND(drrndq, 128)
+DFP_HELPER_RRND(DRRND, 64)
+DFP_HELPER_RRND(DRRNDQ, 128)
 
 #define DFP_HELPER_RINT(op, postprocs, size)                                   \
 void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,               \
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 520cce8378..cb05cc168c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -720,10 +720,10 @@ DEF_HELPER_3(DTSTSFI, i32, env, i32, fprp)
 DEF_HELPER_3(DTSTSFIQ, i32, env, i32, fprp)
 DEF_HELPER_5(DQUAI, void, env, fprp, fprp, i32, i32)
 DEF_HELPER_5(DQUAIQ, void, env, fprp, fprp, i32, i32)
-DEF_HELPER_5(dqua, void, env, fprp, fprp, fprp, i32)
-DEF_HELPER_5(dquaq, void, env, fprp, fprp, fprp, i32)
-DEF_HELPER_5(drrnd, void, env, fprp, fprp, fprp, i32)
-DEF_HELPER_5(drrndq, void, env, fprp, fprp, fprp, i32)
+DEF_HELPER_5(DQUA, void, env, fprp, fprp, fprp, i32)
+DEF_HELPER_5(DQUAQ, void, env, fprp, fprp, fprp, i32)
+DEF_HELPER_5(DRRND, void, env, fprp, fprp, fprp, i32)
+DEF_HELPER_5(DRRNDQ, void, env, fprp, fprp, fprp, i32)
 DEF_HELPER_5(DRINTX, void, env, fprp, fprp, i32, i32)
 DEF_HELPER_5(DRINTXQ, void, env, fprp, fprp, i32, i32)
 DEF_HELPER_5(DRINTN, void, env, fprp, fprp, i32, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index f0e17580e0..86dbdada47 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -77,11 +77,19 @@
 %z22_frap       17:4 !function=times_2
 @Z22_bf_frap    ...... bf:3 .. ....0 dm:6 ......... .           &Z22_bf_fra fra=%z22_frap
 
-&Z23_tb         frt frb r:bool rmc rc:bool
-@Z23_tb         ...... frt:5 .... r:1 frb:5 rmc:2 ........ rc:1 &Z23_tb
+&Z23_tab        frt fra frb rmc rc:bool
+@Z23_tab        ...... frt:5 fra:5 frb:5 rmc:2 ........ rc:1    &Z23_tab
 
 %z23_frtp       22:4 !function=times_2
+%z23_frap       17:4 !function=times_2
 %z23_frbp       12:4 !function=times_2
+@Z23_tabp       ...... ....0 ....0 ....0 rmc:2 ........ rc:1    &Z23_tab frt=%z23_frtp fra=%z23_frap frb=%z23_frbp
+
+@Z23_tp_a_bp    ...... ....0 fra:5 ....0 rmc:2 ........ rc:1    &Z23_tab frt=%z23_frtp frb=%z23_frbp
+
+&Z23_tb         frt frb r:bool rmc rc:bool
+@Z23_tb         ...... frt:5 .... r:1 frb:5 rmc:2 ........ rc:1 &Z23_tb
+
 @Z23_tbp        ...... ....0 .... r:1 ....0 rmc:2 ........ rc:1 &Z23_tb frt=%z23_frtp frb=%z23_frbp
 
 &Z23_te_tb      te frt frb rmc rc:bool
@@ -211,6 +219,12 @@ DTSTSFIQ        111111 ... - ...... ..... 1010100011 -  @X_bf_uim_bp
 DQUAI           111011 ..... ..... ..... .. 01000011 .  @Z23_te_tb
 DQUAIQ          111111 ..... ..... ..... .. 01000011 .  @Z23_te_tbp
 
+DQUA            111011 ..... ..... ..... .. 00000011 .  @Z23_tab
+DQUAQ           111111 ..... ..... ..... .. 00000011 .  @Z23_tabp
+
+DRRND           111011 ..... ..... ..... .. 00100011 .  @Z23_tab
+DRRNDQ          111111 ..... ..... ..... .. 00100011 .  @Z23_tp_a_bp
+
 DRINTX          111011 ..... ---- . ..... .. 01100011 . @Z23_tb
 DRINTXQ         111111 ..... ---- . ..... .. 01100011 . @Z23_tbp
 
diff --git a/target/ppc/translate/dfp-impl.c.inc b/target/ppc/translate/dfp-impl.c.inc
index a499b17e7c..73c8906b45 100644
--- a/target/ppc/translate/dfp-impl.c.inc
+++ b/target/ppc/translate/dfp-impl.c.inc
@@ -86,29 +86,25 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
     return true;                                             \
 }
 
-#define GEN_DFP_T_A_B_I32_Rc(name, i32fld)       \
-static void gen_##name(DisasContext *ctx)        \
-{                                                \
-    TCGv_ptr rt, ra, rb;                         \
-    TCGv_i32 i32;                                \
-    if (unlikely(!ctx->fpu_enabled)) {           \
-        gen_exception(ctx, POWERPC_EXCP_FPU);    \
-        return;                                  \
-    }                                            \
-    gen_update_nip(ctx, ctx->base.pc_next - 4);  \
-    rt = gen_fprp_ptr(rD(ctx->opcode));          \
-    ra = gen_fprp_ptr(rA(ctx->opcode));          \
-    rb = gen_fprp_ptr(rB(ctx->opcode));          \
-    i32 = tcg_const_i32(i32fld(ctx->opcode));    \
-    gen_helper_##name(cpu_env, rt, ra, rb, i32); \
-    if (unlikely(Rc(ctx->opcode) != 0)) {        \
-        gen_set_cr1_from_fpscr(ctx);             \
-    }                                            \
-    tcg_temp_free_ptr(rt);                       \
-    tcg_temp_free_ptr(rb);                       \
-    tcg_temp_free_ptr(ra);                       \
-    tcg_temp_free_i32(i32);                      \
-    }
+#define TRANS_DFP_T_A_B_I32_Rc(NAME, I32FLD)                 \
+static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
+{                                                            \
+    TCGv_ptr rt, ra, rb;                                     \
+    REQUIRE_INSNS_FLAGS2(ctx, DFP);                          \
+    REQUIRE_FPU(ctx);                                        \
+    rt = gen_fprp_ptr(a->frt);                               \
+    ra = gen_fprp_ptr(a->fra);                               \
+    rb = gen_fprp_ptr(a->frb);                               \
+    gen_helper_##NAME(cpu_env, rt, ra, rb,                   \
+                      tcg_constant_i32(a->I32FLD));          \
+    if (unlikely(a->rc)) {                                   \
+        gen_set_cr1_from_fpscr(ctx);                         \
+    }                                                        \
+    tcg_temp_free_ptr(rt);                                   \
+    tcg_temp_free_ptr(ra);                                   \
+    tcg_temp_free_ptr(rb);                                   \
+    return true;                                             \
+}
 
 #define GEN_DFP_T_B_Rc(name)                     \
 static void gen_##name(DisasContext *ctx)        \
@@ -175,10 +171,10 @@ TRANS_DFP_BF_I_B(DTSTSFI)
 TRANS_DFP_BF_I_B(DTSTSFIQ)
 TRANS_DFP_T_B_U32_U32_Rc(DQUAI, te, rmc)
 TRANS_DFP_T_B_U32_U32_Rc(DQUAIQ, te, rmc)
-GEN_DFP_T_A_B_I32_Rc(dqua, RMC)
-GEN_DFP_T_A_B_I32_Rc(dquaq, RMC)
-GEN_DFP_T_A_B_I32_Rc(drrnd, RMC)
-GEN_DFP_T_A_B_I32_Rc(drrndq, RMC)
+TRANS_DFP_T_A_B_I32_Rc(DQUA, rmc)
+TRANS_DFP_T_A_B_I32_Rc(DQUAQ, rmc)
+TRANS_DFP_T_A_B_I32_Rc(DRRND, rmc)
+TRANS_DFP_T_A_B_I32_Rc(DRRNDQ, rmc)
 TRANS_DFP_T_B_U32_U32_Rc(DRINTX, r, rmc)
 TRANS_DFP_T_B_U32_U32_Rc(DRINTXQ, r, rmc)
 TRANS_DFP_T_B_U32_U32_Rc(DRINTN, r, rmc)
@@ -204,7 +200,6 @@ GEN_DFP_T_FPR_I32_Rc(dscliq, rA, DCM)
 GEN_DFP_T_FPR_I32_Rc(dscri, rA, DCM)
 GEN_DFP_T_FPR_I32_Rc(dscriq, rA, DCM)
 
-#undef GEN_DFP_T_A_B_I32_Rc
 #undef GEN_DFP_T_B_Rc
 #undef GEN_DFP_T_FPR_I32_Rc
 
diff --git a/target/ppc/translate/dfp-ops.c.inc b/target/ppc/translate/dfp-ops.c.inc
index c563f84a0b..3e0dfae796 100644
--- a/target/ppc/translate/dfp-ops.c.inc
+++ b/target/ppc/translate/dfp-ops.c.inc
@@ -5,12 +5,6 @@ GEN_HANDLER_E(name, 0x3B, op1, op2, mask, PPC_NONE, PPC2_DFP)
 GEN_HANDLER_E(name, 0x3B, op1, 0x00 | op2, mask, PPC_NONE, PPC2_DFP), \
 GEN_HANDLER_E(name, 0x3B, op1, 0x10 | op2, mask, PPC_NONE, PPC2_DFP)
 
-#define _GEN_DFP_LONGx4(name, op1, op2, mask) \
-GEN_HANDLER_E(name, 0x3B, op1, 0x00 | op2, mask, PPC_NONE, PPC2_DFP), \
-GEN_HANDLER_E(name, 0x3B, op1, 0x08 | op2, mask, PPC_NONE, PPC2_DFP), \
-GEN_HANDLER_E(name, 0x3B, op1, 0x10 | op2, mask, PPC_NONE, PPC2_DFP), \
-GEN_HANDLER_E(name, 0x3B, op1, 0x18 | op2, mask, PPC_NONE, PPC2_DFP)
-
 #define _GEN_DFP_QUAD(name, op1, op2, mask) \
 GEN_HANDLER_E(name, 0x3F, op1, op2, mask, PPC_NONE, PPC2_DFP)
 
@@ -18,12 +12,6 @@ GEN_HANDLER_E(name, 0x3F, op1, op2, mask, PPC_NONE, PPC2_DFP)
 GEN_HANDLER_E(name, 0x3F, op1, 0x00 | op2, mask, PPC_NONE, PPC2_DFP), \
 GEN_HANDLER_E(name, 0x3F, op1, 0x10 | op2, mask, PPC_NONE, PPC2_DFP)
 
-#define _GEN_DFP_QUADx4(name, op1, op2, mask)                         \
-GEN_HANDLER_E(name, 0x3F, op1, 0x00 | op2, mask, PPC_NONE, PPC2_DFP), \
-GEN_HANDLER_E(name, 0x3F, op1, 0x08 | op2, mask, PPC_NONE, PPC2_DFP), \
-GEN_HANDLER_E(name, 0x3F, op1, 0x10 | op2, mask, PPC_NONE, PPC2_DFP), \
-GEN_HANDLER_E(name, 0x3F, op1, 0x18 | op2, mask, PPC_NONE, PPC2_DFP)
-
 #define GEN_DFP_T_B_Rc(name, op1, op2) \
 _GEN_DFP_LONG(name, op1, op2, 0x001F0000)
 
@@ -36,15 +24,6 @@ _GEN_DFP_QUAD(name, op1, op2, 0x003F0000)
 #define GEN_DFP_T_Bp_Rc(name, op1, op2) \
 _GEN_DFP_QUAD(name, op1, op2, 0x001F0800)
 
-#define GEN_DFP_T_A_B_RMC_Rc(name, op1, op2) \
-_GEN_DFP_LONGx4(name, op1, op2, 0x00000000)
-
-#define GEN_DFP_Tp_Ap_Bp_RMC_Rc(name, op1, op2) \
-_GEN_DFP_QUADx4(name, op1, op2, 0x02010800)
-
-#define GEN_DFP_Tp_A_Bp_RMC_Rc(name, op1, op2) \
-_GEN_DFP_QUADx4(name, op1, op2, 0x02000800)
-
 #define GEN_DFP_SP_T_B_Rc(name, op1, op2) \
 _GEN_DFP_LONG(name, op1, op2, 0x00070000)
 
@@ -63,10 +42,6 @@ _GEN_DFP_LONGx2(name, op1, op2, 0x00000000)
 #define GEN_DFP_Tp_Ap_SH_Rc(name, op1, op2) \
 _GEN_DFP_QUADx2(name, op1, op2, 0x00210000)
 
-GEN_DFP_T_A_B_RMC_Rc(dqua, 0x03, 0x00),
-GEN_DFP_Tp_Ap_Bp_RMC_Rc(dquaq, 0x03, 0x00),
-GEN_DFP_T_A_B_RMC_Rc(drrnd, 0x03, 0x01),
-GEN_DFP_Tp_A_Bp_RMC_Rc(drrndq, 0x03, 0x01),
 GEN_DFP_T_B_Rc(dctdp, 0x02, 0x08),
 GEN_DFP_Tp_B_Rc(dctqpq, 0x02, 0x08),
 GEN_DFP_T_B_Rc(drsp, 0x02, 0x18),
-- 
2.25.1


