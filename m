Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEEE44A70F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:52:57 +0100 (CET)
Received: from localhost ([::1]:42606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkL04-0006mp-SS
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:52:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3t-0004YE-Fp; Tue, 09 Nov 2021 00:52:49 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:37389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3p-0006iV-9d; Tue, 09 Nov 2021 00:52:48 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp2DQ3z4xdx; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=CZ/BbJ1K//D6MdhH5kgaowR2JZ1coU38I//lgMu/wus=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lT1KRVnyG8JaPEi6+MOAqwpYu+7K3mquHuiV5BZai6Z+xCn9G3iUQUZLmdG4unB2n
 5sgqWMehRVynPYKLGyS4LUuh51dJl1MSu759FsMnkduWQIi8woSjv1BBqcpaCg9JsI
 yIwauvlRv02m5Ly16WayvH04bBmNts/VEfeqzgbg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 22/54] target/ppc: Move dquai[q], drint{x,n}[q] to decodetree
Date: Tue,  9 Nov 2021 16:51:32 +1100
Message-Id: <20211109055204.230765-23-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Move the following instructions to decodetree:
dquai:   DFP Quantize Immediate
dquaiq:  DFP Quantize Immediate Quad
drintx:  DFP Round to FP Integer With Inexact
drintxq: DFP Round to FP Integer With Inexact Quad
drintn:  DFP Round to FP Integer Without Inexact
drintnq: DFP Round to FP Integer Without Inexact Quad

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029192417.400707-13-luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/dfp_helper.c             | 12 +++----
 target/ppc/helper.h                 | 12 +++----
 target/ppc/insn32.decode            | 23 +++++++++++++
 target/ppc/translate/dfp-impl.c.inc | 51 +++++++++++++----------------
 target/ppc/translate/dfp-ops.c.inc  | 18 ----------
 5 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 9be6809b33..df3e6c7cb1 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -751,8 +751,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,        \
     set_dfp##size(t, &dfp.vt);                                          \
 }
 
-DFP_HELPER_QUAI(dquai, 64)
-DFP_HELPER_QUAI(dquaiq, 128)
+DFP_HELPER_QUAI(DQUAI, 64)
+DFP_HELPER_QUAI(DQUAIQ, 128)
 
 #define DFP_HELPER_QUA(op, size)                                        \
 void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,        \
@@ -873,8 +873,8 @@ static void RINTX_PPs(struct PPC_DFP *dfp)
     dfp_check_for_VXSNAN(dfp);
 }
 
-DFP_HELPER_RINT(drintx, RINTX_PPs, 64)
-DFP_HELPER_RINT(drintxq, RINTX_PPs, 128)
+DFP_HELPER_RINT(DRINTX, RINTX_PPs, 64)
+DFP_HELPER_RINT(DRINTXQ, RINTX_PPs, 128)
 
 static void RINTN_PPs(struct PPC_DFP *dfp)
 {
@@ -882,8 +882,8 @@ static void RINTN_PPs(struct PPC_DFP *dfp)
     dfp_check_for_VXSNAN(dfp);
 }
 
-DFP_HELPER_RINT(drintn, RINTN_PPs, 64)
-DFP_HELPER_RINT(drintnq, RINTN_PPs, 128)
+DFP_HELPER_RINT(DRINTN, RINTN_PPs, 64)
+DFP_HELPER_RINT(DRINTNQ, RINTN_PPs, 128)
 
 void helper_dctdp(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
 {
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index a21c04ecf1..70bc8ac579 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -720,16 +720,16 @@ DEF_HELPER_3(DTSTSF, i32, env, fprp, fprp)
 DEF_HELPER_3(DTSTSFQ, i32, env, fprp, fprp)
 DEF_HELPER_3(DTSTSFI, i32, env, i32, fprp)
 DEF_HELPER_3(DTSTSFIQ, i32, env, i32, fprp)
-DEF_HELPER_5(dquai, void, env, fprp, fprp, i32, i32)
-DEF_HELPER_5(dquaiq, void, env, fprp, fprp, i32, i32)
+DEF_HELPER_5(DQUAI, void, env, fprp, fprp, i32, i32)
+DEF_HELPER_5(DQUAIQ, void, env, fprp, fprp, i32, i32)
 DEF_HELPER_5(dqua, void, env, fprp, fprp, fprp, i32)
 DEF_HELPER_5(dquaq, void, env, fprp, fprp, fprp, i32)
 DEF_HELPER_5(drrnd, void, env, fprp, fprp, fprp, i32)
 DEF_HELPER_5(drrndq, void, env, fprp, fprp, fprp, i32)
-DEF_HELPER_5(drintx, void, env, fprp, fprp, i32, i32)
-DEF_HELPER_5(drintxq, void, env, fprp, fprp, i32, i32)
-DEF_HELPER_5(drintn, void, env, fprp, fprp, i32, i32)
-DEF_HELPER_5(drintnq, void, env, fprp, fprp, i32, i32)
+DEF_HELPER_5(DRINTX, void, env, fprp, fprp, i32, i32)
+DEF_HELPER_5(DRINTXQ, void, env, fprp, fprp, i32, i32)
+DEF_HELPER_5(DRINTN, void, env, fprp, fprp, i32, i32)
+DEF_HELPER_5(DRINTNQ, void, env, fprp, fprp, i32, i32)
 DEF_HELPER_3(dctdp, void, env, fprp, fprp)
 DEF_HELPER_3(dctqpq, void, env, fprp, fprp)
 DEF_HELPER_3(drsp, void, env, fprp, fprp)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 263911d358..5369af17b6 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -84,6 +84,18 @@
 %z22_frap       17:4 !function=times_2
 @Z22_bf_frap    ...... bf:3 .. ....0 dm:6 ......... .           &Z22_bf_fra fra=%z22_frap
 
+&Z23_tb         frt frb r:bool rmc rc:bool
+@Z23_tb         ...... frt:5 .... r:1 frb:5 rmc:2 ........ rc:1 &Z23_tb
+
+%z23_frtp       22:4 !function=times_2
+%z23_frbp       12:4 !function=times_2
+@Z23_tbp        ...... ....0 .... r:1 ....0 rmc:2 ........ rc:1 &Z23_tb frt=%z23_frtp frb=%z23_frbp
+
+&Z23_te_tb      te frt frb rmc rc:bool
+@Z23_te_tb      ...... frt:5 te:5 frb:5 rmc:2 ........ rc:1     &Z23_te_tb
+
+@Z23_te_tbp     ...... ....0 te:5 ....0 rmc:2 ........ rc:1     &Z23_te_tb frt=%z23_frtp frb=%z23_frbp
+
 ### Fixed-Point Load Instructions
 
 LBZ             100010 ..... ..... ................     @D
@@ -233,6 +245,17 @@ DTSTSFQ         111111 ... -- ..... ..... 1010100010 -  @X_bf_a_bp
 DTSTSFI         111011 ... - ...... ..... 1010100011 -  @X_bf_uim
 DTSTSFIQ        111111 ... - ...... ..... 1010100011 -  @X_bf_uim_bp
 
+### Decimal Floating-Point Quantum Adjustment Instructions
+
+DQUAI           111011 ..... ..... ..... .. 01000011 .  @Z23_te_tb
+DQUAIQ          111111 ..... ..... ..... .. 01000011 .  @Z23_te_tbp
+
+DRINTX          111011 ..... ---- . ..... .. 01100011 . @Z23_tb
+DRINTXQ         111111 ..... ---- . ..... .. 01100011 . @Z23_tbp
+
+DRINTN          111011 ..... ---- . ..... .. 11100011 . @Z23_tb
+DRINTNQ         111111 ..... ---- . ..... .. 11100011 . @Z23_tbp
+
 ### Decimal Floating-Point Conversion Instructions
 
 DCFFIXQQ        111111 ..... 00000 ..... 1111100010 -   @X_frtp_vrb
diff --git a/target/ppc/translate/dfp-impl.c.inc b/target/ppc/translate/dfp-impl.c.inc
index d8dcc4c807..cb481d028a 100644
--- a/target/ppc/translate/dfp-impl.c.inc
+++ b/target/ppc/translate/dfp-impl.c.inc
@@ -67,27 +67,23 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
     return true;                                             \
 }
 
-#define GEN_DFP_T_B_U32_U32_Rc(name, u32f1, u32f2)    \
-static void gen_##name(DisasContext *ctx)             \
-{                                                     \
-    TCGv_ptr rt, rb;                                  \
-    TCGv_i32 u32_1, u32_2;                            \
-    if (unlikely(!ctx->fpu_enabled)) {                \
-        gen_exception(ctx, POWERPC_EXCP_FPU);         \
-        return;                                       \
-    }                                                 \
-    rt = gen_fprp_ptr(rD(ctx->opcode));               \
-    rb = gen_fprp_ptr(rB(ctx->opcode));               \
-    u32_1 = tcg_const_i32(u32f1(ctx->opcode));        \
-    u32_2 = tcg_const_i32(u32f2(ctx->opcode));        \
-    gen_helper_##name(cpu_env, rt, rb, u32_1, u32_2); \
-    if (unlikely(Rc(ctx->opcode) != 0)) {             \
-        gen_set_cr1_from_fpscr(ctx);                  \
-    }                                                 \
-    tcg_temp_free_ptr(rt);                            \
-    tcg_temp_free_ptr(rb);                            \
-    tcg_temp_free_i32(u32_1);                         \
-    tcg_temp_free_i32(u32_2);                         \
+#define TRANS_DFP_T_B_U32_U32_Rc(NAME, U32F1, U32F2)         \
+static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
+{                                                            \
+    TCGv_ptr rt, rb;                                         \
+    REQUIRE_INSNS_FLAGS2(ctx, DFP);                          \
+    REQUIRE_FPU(ctx);                                        \
+    rt = gen_fprp_ptr(a->frt);                               \
+    rb = gen_fprp_ptr(a->frb);                               \
+    gen_helper_##NAME(cpu_env, rt, rb,                       \
+                      tcg_constant_i32(a->U32F1),            \
+                      tcg_constant_i32(a->U32F2));           \
+    if (unlikely(a->rc)) {                                   \
+        gen_set_cr1_from_fpscr(ctx);                         \
+    }                                                        \
+    tcg_temp_free_ptr(rt);                                   \
+    tcg_temp_free_ptr(rb);                                   \
+    return true;                                             \
 }
 
 #define GEN_DFP_T_A_B_I32_Rc(name, i32fld)       \
@@ -174,16 +170,16 @@ TRANS_DFP_BF_A_B(DTSTSF)
 TRANS_DFP_BF_A_B(DTSTSFQ)
 TRANS_DFP_BF_I_B(DTSTSFI)
 TRANS_DFP_BF_I_B(DTSTSFIQ)
-GEN_DFP_T_B_U32_U32_Rc(dquai, SIMM5, RMC)
-GEN_DFP_T_B_U32_U32_Rc(dquaiq, SIMM5, RMC)
+TRANS_DFP_T_B_U32_U32_Rc(DQUAI, te, rmc)
+TRANS_DFP_T_B_U32_U32_Rc(DQUAIQ, te, rmc)
 GEN_DFP_T_A_B_I32_Rc(dqua, RMC)
 GEN_DFP_T_A_B_I32_Rc(dquaq, RMC)
 GEN_DFP_T_A_B_I32_Rc(drrnd, RMC)
 GEN_DFP_T_A_B_I32_Rc(drrndq, RMC)
-GEN_DFP_T_B_U32_U32_Rc(drintx, FPW, RMC)
-GEN_DFP_T_B_U32_U32_Rc(drintxq, FPW, RMC)
-GEN_DFP_T_B_U32_U32_Rc(drintn, FPW, RMC)
-GEN_DFP_T_B_U32_U32_Rc(drintnq, FPW, RMC)
+TRANS_DFP_T_B_U32_U32_Rc(DRINTX, r, rmc)
+TRANS_DFP_T_B_U32_U32_Rc(DRINTXQ, r, rmc)
+TRANS_DFP_T_B_U32_U32_Rc(DRINTN, r, rmc)
+TRANS_DFP_T_B_U32_U32_Rc(DRINTNQ, r, rmc)
 GEN_DFP_T_B_Rc(dctdp)
 GEN_DFP_T_B_Rc(dctqpq)
 GEN_DFP_T_B_Rc(drsp)
@@ -205,7 +201,6 @@ GEN_DFP_T_FPR_I32_Rc(dscliq, rA, DCM)
 GEN_DFP_T_FPR_I32_Rc(dscri, rA, DCM)
 GEN_DFP_T_FPR_I32_Rc(dscriq, rA, DCM)
 
-#undef GEN_DFP_T_B_U32_U32_Rc
 #undef GEN_DFP_T_A_B_I32_Rc
 #undef GEN_DFP_T_B_Rc
 #undef GEN_DFP_T_FPR_I32_Rc
diff --git a/target/ppc/translate/dfp-ops.c.inc b/target/ppc/translate/dfp-ops.c.inc
index e59425c8b2..c563f84a0b 100644
--- a/target/ppc/translate/dfp-ops.c.inc
+++ b/target/ppc/translate/dfp-ops.c.inc
@@ -45,18 +45,6 @@ _GEN_DFP_QUADx4(name, op1, op2, 0x02010800)
 #define GEN_DFP_Tp_A_Bp_RMC_Rc(name, op1, op2) \
 _GEN_DFP_QUADx4(name, op1, op2, 0x02000800)
 
-#define GEN_DFP_TE_T_B_RMC_Rc(name, op1, op2) \
-_GEN_DFP_LONGx4(name, op1, op2, 0x00000000)
-
-#define GEN_DFP_TE_Tp_Bp_RMC_Rc(name, op1, op2) \
-_GEN_DFP_QUADx4(name, op1, op2, 0x00200800)
-
-#define GEN_DFP_R_T_B_RMC_Rc(name, op1, op2) \
-_GEN_DFP_LONGx4(name, op1, op2, 0x001E0000)
-
-#define GEN_DFP_R_Tp_Bp_RMC_Rc(name, op1, op2) \
-_GEN_DFP_QUADx4(name, op1, op2, 0x003E0800)
-
 #define GEN_DFP_SP_T_B_Rc(name, op1, op2) \
 _GEN_DFP_LONG(name, op1, op2, 0x00070000)
 
@@ -75,16 +63,10 @@ _GEN_DFP_LONGx2(name, op1, op2, 0x00000000)
 #define GEN_DFP_Tp_Ap_SH_Rc(name, op1, op2) \
 _GEN_DFP_QUADx2(name, op1, op2, 0x00210000)
 
-GEN_DFP_TE_T_B_RMC_Rc(dquai, 0x03, 0x02),
-GEN_DFP_TE_Tp_Bp_RMC_Rc(dquaiq, 0x03, 0x02),
 GEN_DFP_T_A_B_RMC_Rc(dqua, 0x03, 0x00),
 GEN_DFP_Tp_Ap_Bp_RMC_Rc(dquaq, 0x03, 0x00),
 GEN_DFP_T_A_B_RMC_Rc(drrnd, 0x03, 0x01),
 GEN_DFP_Tp_A_Bp_RMC_Rc(drrndq, 0x03, 0x01),
-GEN_DFP_R_T_B_RMC_Rc(drintx, 0x03, 0x03),
-GEN_DFP_R_Tp_Bp_RMC_Rc(drintxq, 0x03, 0x03),
-GEN_DFP_R_T_B_RMC_Rc(drintn, 0x03, 0x07),
-GEN_DFP_R_Tp_Bp_RMC_Rc(drintnq, 0x03, 0x07),
 GEN_DFP_T_B_Rc(dctdp, 0x02, 0x08),
 GEN_DFP_Tp_B_Rc(dctqpq, 0x02, 0x08),
 GEN_DFP_T_B_Rc(drsp, 0x02, 0x18),
-- 
2.33.1


