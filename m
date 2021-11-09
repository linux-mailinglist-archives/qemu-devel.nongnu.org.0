Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4404A44A714
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:57:07 +0100 (CET)
Received: from localhost ([::1]:55688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkL46-0007CA-BZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:57:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4B-0004x8-G1; Tue, 09 Nov 2021 00:53:07 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=43937
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK49-0006iT-AR; Tue, 09 Nov 2021 00:53:07 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp2Sq2z4xf0; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=LILgmEznju+QPOvo1xvLJQ8HjKW/VMXX8cWXlO0ALVg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IaYL8uFGreAxcMn5G4rJCvp0j5nVLUbRRuD7uoLkhC0vz7//0kXDpBzUuPB4v6Ru8
 m55QauOo32aEvmhQ3ZkJA7SR9IVlmSxMFp296H2Un817k/Zmcf1MWI2pA7InZqYc80
 U8MSgBhu9oAOBDvWklxZ8V9R5Jqf1zY0s3wKJP8o=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 23/54] target/ppc: Move dqua[q], drrnd[q] to decodetree
Date: Tue,  9 Nov 2021 16:51:33 +1100
Message-Id: <20211109055204.230765-24-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Move the following instructions to decodetree:
dqua:   DFP Quantize
dquaq:  DFP Quantize Quad
drrnd:  DFP Reround
drrndq: DFP Reround Quad

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029192417.400707-14-luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/dfp_helper.c             |  8 ++---
 target/ppc/helper.h                 |  8 ++---
 target/ppc/insn32.decode            | 18 +++++++++--
 target/ppc/translate/dfp-impl.c.inc | 50 +++++++++++++----------------
 target/ppc/translate/dfp-ops.c.inc  | 25 ---------------
 5 files changed, 47 insertions(+), 62 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index df3e6c7cb1..a50a73d3c0 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -769,8 +769,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,        \
     set_dfp##size(t, &dfp.vt);                                          \
 }
 
-DFP_HELPER_QUA(dqua, 64)
-DFP_HELPER_QUA(dquaq, 128)
+DFP_HELPER_QUA(DQUA, 64)
+DFP_HELPER_QUA(DQUAQ, 128)
 
 static void _dfp_reround(uint8_t rmc, int32_t ref_sig, int32_t xmax,
                              struct PPC_DFP *dfp)
@@ -847,8 +847,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,        \
     set_dfp##size(t, &dfp.vt);                                          \
 }
 
-DFP_HELPER_RRND(drrnd, 64)
-DFP_HELPER_RRND(drrndq, 128)
+DFP_HELPER_RRND(DRRND, 64)
+DFP_HELPER_RRND(DRRNDQ, 128)
 
 #define DFP_HELPER_RINT(op, postprocs, size)                                   \
 void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,               \
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 70bc8ac579..70aebdfeff 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -722,10 +722,10 @@ DEF_HELPER_3(DTSTSFI, i32, env, i32, fprp)
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
index 5369af17b6..f7c8d50bd9 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -84,11 +84,19 @@
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
@@ -250,6 +258,12 @@ DTSTSFIQ        111111 ... - ...... ..... 1010100011 -  @X_bf_uim_bp
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
index cb481d028a..30d65ffb46 100644
--- a/target/ppc/translate/dfp-impl.c.inc
+++ b/target/ppc/translate/dfp-impl.c.inc
@@ -86,28 +86,25 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
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
@@ -172,10 +169,10 @@ TRANS_DFP_BF_I_B(DTSTSFI)
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
@@ -201,7 +198,6 @@ GEN_DFP_T_FPR_I32_Rc(dscliq, rA, DCM)
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
2.33.1


