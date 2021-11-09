Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E2E44A6D8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:30:21 +0100 (CET)
Received: from localhost ([::1]:39290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKeC-0001oO-FP
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:30:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4D-0004zy-SS; Tue, 09 Nov 2021 00:53:09 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=46719
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4B-0006ls-CX; Tue, 09 Nov 2021 00:53:09 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp2dVSz4xf1; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=m0sIVeFUTJCPqROuWG/25oMv5e5j/nQxyw3Ume+ucaQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j7qhAvh41/UpeGAh9RfYnWIjPg58zEoC8bI59s5Bi8H/CYHf75Br5LXL8BxkClhQV
 40RNFfBCSGG/sYoWxtYZZwy8GZkdcMGcYXTCsm2MmnhOnXNJ4IhVS64Ob5Kd6o4JMo
 Hb2iDlvBXgLsZy2wqISkYueAS8AQofYs3mGVA6ts=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 24/54] target/ppc: Move dct{dp, qpq}, dr{sp, dpq}, dc{f,
 t}fix[q], dxex[q] to decodetree
Date: Tue,  9 Nov 2021 16:51:34 +1100
Message-Id: <20211109055204.230765-25-david@gibson.dropbear.id.au>
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
dctdp:   DFP Convert To DFP Long
dctqpq:  DFP Convert To DFP Extended
drsp:    DFP Round To DFP Short
drdpq:   DFP Round To DFP Long
dcffix:  DFP Convert From Fixed
dcffixq: DFP Convert From Fixed Quad
dctfix:  DFP Convert To Fixed
dctfixq: DFP Convert To Fixed Quad
dxex:    DFP Extract Biased Exponent
dxexq:   DFP Extract Biased Exponent Quad

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029192417.400707-15-luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/dfp_helper.c             | 20 +++++------
 target/ppc/helper.h                 | 20 +++++------
 target/ppc/insn32.decode            | 23 ++++++++++++
 target/ppc/translate/dfp-impl.c.inc | 54 ++++++++++++++---------------
 target/ppc/translate/dfp-ops.c.inc  | 22 ------------
 5 files changed, 69 insertions(+), 70 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index a50a73d3c0..d950d0d3fc 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -885,7 +885,7 @@ static void RINTN_PPs(struct PPC_DFP *dfp)
 DFP_HELPER_RINT(DRINTN, RINTN_PPs, 64)
 DFP_HELPER_RINT(DRINTNQ, RINTN_PPs, 128)
 
-void helper_dctdp(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
+void helper_DCTDP(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
 {
     struct PPC_DFP dfp;
     ppc_vsr_t vb;
@@ -901,7 +901,7 @@ void helper_dctdp(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
     dfp_set_FPRF_from_FRT(&dfp);
 }
 
-void helper_dctqpq(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
+void helper_DCTQPQ(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
 {
     struct PPC_DFP dfp;
     ppc_vsr_t vb;
@@ -916,7 +916,7 @@ void helper_dctqpq(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
     set_dfp128(t, &dfp.vt);
 }
 
-void helper_drsp(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
+void helper_DRSP(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
 {
     struct PPC_DFP dfp;
     uint32_t t_short = 0;
@@ -934,7 +934,7 @@ void helper_drsp(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
     set_dfp64(t, &vt);
 }
 
-void helper_drdpq(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
+void helper_DRDPQ(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
 {
     struct PPC_DFP dfp;
     dfp_prepare_decimal128(&dfp, 0, b, env);
@@ -972,8 +972,8 @@ static void CFFIX_PPs(struct PPC_DFP *dfp)
     dfp_check_for_XX(dfp);
 }
 
-DFP_HELPER_CFFIX(dcffix, 64)
-DFP_HELPER_CFFIX(dcffixq, 128)
+DFP_HELPER_CFFIX(DCFFIX, 64)
+DFP_HELPER_CFFIX(DCFFIXQ, 128)
 
 void helper_DCFFIXQQ(CPUPPCState *env, ppc_fprp_t *t, ppc_avr_t *b)
 {
@@ -1022,8 +1022,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)              \
     set_dfp64(t, &dfp.vt);                                                    \
 }
 
-DFP_HELPER_CTFIX(dctfix, 64)
-DFP_HELPER_CTFIX(dctfixq, 128)
+DFP_HELPER_CTFIX(DCTFIX, 64)
+DFP_HELPER_CTFIX(DCTFIXQ, 128)
 
 void helper_DCTFIXQQ(CPUPPCState *env, ppc_avr_t *t, ppc_fprp_t *b)
 {
@@ -1233,8 +1233,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b) \
     }                                                          \
 }
 
-DFP_HELPER_XEX(dxex, 64)
-DFP_HELPER_XEX(dxexq, 128)
+DFP_HELPER_XEX(DXEX, 64)
+DFP_HELPER_XEX(DXEXQ, 128)
 
 static void dfp_set_raw_exp_64(ppc_vsr_t *t, uint64_t raw)
 {
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 70aebdfeff..b302928a78 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -730,22 +730,22 @@ DEF_HELPER_5(DRINTX, void, env, fprp, fprp, i32, i32)
 DEF_HELPER_5(DRINTXQ, void, env, fprp, fprp, i32, i32)
 DEF_HELPER_5(DRINTN, void, env, fprp, fprp, i32, i32)
 DEF_HELPER_5(DRINTNQ, void, env, fprp, fprp, i32, i32)
-DEF_HELPER_3(dctdp, void, env, fprp, fprp)
-DEF_HELPER_3(dctqpq, void, env, fprp, fprp)
-DEF_HELPER_3(drsp, void, env, fprp, fprp)
-DEF_HELPER_3(drdpq, void, env, fprp, fprp)
-DEF_HELPER_3(dcffix, void, env, fprp, fprp)
-DEF_HELPER_3(dcffixq, void, env, fprp, fprp)
+DEF_HELPER_3(DCTDP, void, env, fprp, fprp)
+DEF_HELPER_3(DCTQPQ, void, env, fprp, fprp)
+DEF_HELPER_3(DRSP, void, env, fprp, fprp)
+DEF_HELPER_3(DRDPQ, void, env, fprp, fprp)
+DEF_HELPER_3(DCFFIX, void, env, fprp, fprp)
+DEF_HELPER_3(DCFFIXQ, void, env, fprp, fprp)
 DEF_HELPER_3(DCFFIXQQ, void, env, fprp, avr)
-DEF_HELPER_3(dctfix, void, env, fprp, fprp)
-DEF_HELPER_3(dctfixq, void, env, fprp, fprp)
+DEF_HELPER_3(DCTFIX, void, env, fprp, fprp)
+DEF_HELPER_3(DCTFIXQ, void, env, fprp, fprp)
 DEF_HELPER_3(DCTFIXQQ, void, env, avr, fprp)
 DEF_HELPER_4(ddedpd, void, env, fprp, fprp, i32)
 DEF_HELPER_4(ddedpdq, void, env, fprp, fprp, i32)
 DEF_HELPER_4(denbcd, void, env, fprp, fprp, i32)
 DEF_HELPER_4(denbcdq, void, env, fprp, fprp, i32)
-DEF_HELPER_3(dxex, void, env, fprp, fprp)
-DEF_HELPER_3(dxexq, void, env, fprp, fprp)
+DEF_HELPER_3(DXEX, void, env, fprp, fprp)
+DEF_HELPER_3(DXEXQ, void, env, fprp, fprp)
 DEF_HELPER_4(DIEX, void, env, fprp, fprp, fprp)
 DEF_HELPER_4(DIEXQ, void, env, fprp, fprp, fprp)
 DEF_HELPER_4(dscri, void, env, fprp, fprp, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index f7c8d50bd9..033bae2b32 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -54,6 +54,15 @@
 
 @X_tp_a_bp_rc   ...... ....0 ra:5 ....0 .......... rc:1         &X_rc rt=%x_frtp rb=%x_frbp
 
+&X_tb_rc        rt rb rc:bool
+@X_tb_rc        ...... rt:5 ..... rb:5 .......... rc:1          &X_tb_rc
+
+@X_tbp_rc       ...... ....0 ..... ....0 .......... rc:1        &X_tb_rc rt=%x_frtp rb=%x_frbp
+
+@X_tp_b_rc      ...... ....0 ..... rb:5 .......... rc:1         &X_tb_rc rt=%x_frtp
+
+@X_t_bp_rc      ...... rt:5 ..... ....0 .......... rc:1         &X_tb_rc rb=%x_frbp
+
 &X_bi           rt bi
 @X_bi           ...... rt:5 bi:5 ----- .......... -     &X_bi
 
@@ -272,11 +281,25 @@ DRINTNQ         111111 ..... ---- . ..... .. 11100011 . @Z23_tbp
 
 ### Decimal Floating-Point Conversion Instructions
 
+DCTDP           111011 ..... ----- ..... 0100000010 .   @X_tb_rc
+DCTQPQ          111111 ..... ----- ..... 0100000010 .   @X_tp_b_rc
+
+DRSP            111011 ..... ----- ..... 1100000010 .   @X_tb_rc
+DRDPQ           111111 ..... ----- ..... 1100000010 .   @X_tbp_rc
+
+DCFFIX          111011 ..... ----- ..... 1100100010 .   @X_tb_rc
+DCFFIXQ         111111 ..... ----- ..... 1100100010 .   @X_tp_b_rc
 DCFFIXQQ        111111 ..... 00000 ..... 1111100010 -   @X_frtp_vrb
+
+DCTFIX          111011 ..... ----- ..... 0100100010 .   @X_tb_rc
+DCTFIXQ         111111 ..... ----- ..... 0100100010 .   @X_t_bp_rc
 DCTFIXQQ        111111 ..... 00001 ..... 1111100010 -   @X_vrt_frbp
 
 ### Decimal Floating-Point Format Instructions
 
+DXEX            111011 ..... ----- ..... 0101100010 .   @X_tb_rc
+DXEXQ           111111 ..... ----- ..... 0101100010 .   @X_t_bp_rc
+
 DIEX            111011 ..... ..... ..... 1101100010 .   @X_rc
 DIEXQ           111111 ..... ..... ..... 1101100010 .   @X_tp_a_bp_rc
 
diff --git a/target/ppc/translate/dfp-impl.c.inc b/target/ppc/translate/dfp-impl.c.inc
index 30d65ffb46..736292584c 100644
--- a/target/ppc/translate/dfp-impl.c.inc
+++ b/target/ppc/translate/dfp-impl.c.inc
@@ -106,23 +106,22 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
     return true;                                             \
 }
 
-#define GEN_DFP_T_B_Rc(name)                     \
-static void gen_##name(DisasContext *ctx)        \
-{                                                \
-    TCGv_ptr rt, rb;                             \
-    if (unlikely(!ctx->fpu_enabled)) {           \
-        gen_exception(ctx, POWERPC_EXCP_FPU);    \
-        return;                                  \
-    }                                            \
-    rt = gen_fprp_ptr(rD(ctx->opcode));          \
-    rb = gen_fprp_ptr(rB(ctx->opcode));          \
-    gen_helper_##name(cpu_env, rt, rb);          \
-    if (unlikely(Rc(ctx->opcode) != 0)) {        \
-        gen_set_cr1_from_fpscr(ctx);             \
-    }                                            \
-    tcg_temp_free_ptr(rt);                       \
-    tcg_temp_free_ptr(rb);                       \
-    }
+#define TRANS_DFP_T_B_Rc(NAME)                               \
+static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
+{                                                            \
+    TCGv_ptr rt, rb;                                         \
+    REQUIRE_INSNS_FLAGS2(ctx, DFP);                          \
+    REQUIRE_FPU(ctx);                                        \
+    rt = gen_fprp_ptr(a->rt);                                \
+    rb = gen_fprp_ptr(a->rb);                                \
+    gen_helper_##NAME(cpu_env, rt, rb);                      \
+    if (unlikely(a->rc)) {                                   \
+        gen_set_cr1_from_fpscr(ctx);                         \
+    }                                                        \
+    tcg_temp_free_ptr(rt);                                   \
+    tcg_temp_free_ptr(rb);                                   \
+    return true;                                             \
+}
 
 #define GEN_DFP_T_FPR_I32_Rc(name, fprfld, i32fld) \
 static void gen_##name(DisasContext *ctx)          \
@@ -177,20 +176,20 @@ TRANS_DFP_T_B_U32_U32_Rc(DRINTX, r, rmc)
 TRANS_DFP_T_B_U32_U32_Rc(DRINTXQ, r, rmc)
 TRANS_DFP_T_B_U32_U32_Rc(DRINTN, r, rmc)
 TRANS_DFP_T_B_U32_U32_Rc(DRINTNQ, r, rmc)
-GEN_DFP_T_B_Rc(dctdp)
-GEN_DFP_T_B_Rc(dctqpq)
-GEN_DFP_T_B_Rc(drsp)
-GEN_DFP_T_B_Rc(drdpq)
-GEN_DFP_T_B_Rc(dcffix)
-GEN_DFP_T_B_Rc(dcffixq)
-GEN_DFP_T_B_Rc(dctfix)
-GEN_DFP_T_B_Rc(dctfixq)
+TRANS_DFP_T_B_Rc(DCTDP)
+TRANS_DFP_T_B_Rc(DCTQPQ)
+TRANS_DFP_T_B_Rc(DRSP)
+TRANS_DFP_T_B_Rc(DRDPQ)
+TRANS_DFP_T_B_Rc(DCFFIX)
+TRANS_DFP_T_B_Rc(DCFFIXQ)
+TRANS_DFP_T_B_Rc(DCTFIX)
+TRANS_DFP_T_B_Rc(DCTFIXQ)
 GEN_DFP_T_FPR_I32_Rc(ddedpd, rB, SP)
 GEN_DFP_T_FPR_I32_Rc(ddedpdq, rB, SP)
 GEN_DFP_T_FPR_I32_Rc(denbcd, rB, SP)
 GEN_DFP_T_FPR_I32_Rc(denbcdq, rB, SP)
-GEN_DFP_T_B_Rc(dxex)
-GEN_DFP_T_B_Rc(dxexq)
+TRANS_DFP_T_B_Rc(DXEX)
+TRANS_DFP_T_B_Rc(DXEXQ)
 TRANS_DFP_T_A_B_Rc(DIEX)
 TRANS_DFP_T_A_B_Rc(DIEXQ)
 GEN_DFP_T_FPR_I32_Rc(dscli, rA, DCM)
@@ -198,7 +197,6 @@ GEN_DFP_T_FPR_I32_Rc(dscliq, rA, DCM)
 GEN_DFP_T_FPR_I32_Rc(dscri, rA, DCM)
 GEN_DFP_T_FPR_I32_Rc(dscriq, rA, DCM)
 
-#undef GEN_DFP_T_B_Rc
 #undef GEN_DFP_T_FPR_I32_Rc
 
 static bool trans_DCFFIXQQ(DisasContext *ctx, arg_DCFFIXQQ *a)
diff --git a/target/ppc/translate/dfp-ops.c.inc b/target/ppc/translate/dfp-ops.c.inc
index 3e0dfae796..e29c4b2194 100644
--- a/target/ppc/translate/dfp-ops.c.inc
+++ b/target/ppc/translate/dfp-ops.c.inc
@@ -12,18 +12,6 @@ GEN_HANDLER_E(name, 0x3F, op1, op2, mask, PPC_NONE, PPC2_DFP)
 GEN_HANDLER_E(name, 0x3F, op1, 0x00 | op2, mask, PPC_NONE, PPC2_DFP), \
 GEN_HANDLER_E(name, 0x3F, op1, 0x10 | op2, mask, PPC_NONE, PPC2_DFP)
 
-#define GEN_DFP_T_B_Rc(name, op1, op2) \
-_GEN_DFP_LONG(name, op1, op2, 0x001F0000)
-
-#define GEN_DFP_Tp_Bp_Rc(name, op1, op2) \
-_GEN_DFP_QUAD(name, op1, op2, 0x003F0800)
-
-#define GEN_DFP_Tp_B_Rc(name, op1, op2) \
-_GEN_DFP_QUAD(name, op1, op2, 0x003F0000)
-
-#define GEN_DFP_T_Bp_Rc(name, op1, op2) \
-_GEN_DFP_QUAD(name, op1, op2, 0x001F0800)
-
 #define GEN_DFP_SP_T_B_Rc(name, op1, op2) \
 _GEN_DFP_LONG(name, op1, op2, 0x00070000)
 
@@ -42,20 +30,10 @@ _GEN_DFP_LONGx2(name, op1, op2, 0x00000000)
 #define GEN_DFP_Tp_Ap_SH_Rc(name, op1, op2) \
 _GEN_DFP_QUADx2(name, op1, op2, 0x00210000)
 
-GEN_DFP_T_B_Rc(dctdp, 0x02, 0x08),
-GEN_DFP_Tp_B_Rc(dctqpq, 0x02, 0x08),
-GEN_DFP_T_B_Rc(drsp, 0x02, 0x18),
-GEN_DFP_Tp_Bp_Rc(drdpq, 0x02, 0x18),
-GEN_DFP_T_B_Rc(dcffix, 0x02, 0x19),
-GEN_DFP_Tp_B_Rc(dcffixq, 0x02, 0x19),
-GEN_DFP_T_B_Rc(dctfix, 0x02, 0x09),
-GEN_DFP_T_Bp_Rc(dctfixq, 0x02, 0x09),
 GEN_DFP_SP_T_B_Rc(ddedpd, 0x02, 0x0a),
 GEN_DFP_SP_Tp_Bp_Rc(ddedpdq, 0x02, 0x0a),
 GEN_DFP_S_T_B_Rc(denbcd, 0x02, 0x1a),
 GEN_DFP_S_Tp_Bp_Rc(denbcdq, 0x02, 0x1a),
-GEN_DFP_T_B_Rc(dxex, 0x02, 0x0b),
-GEN_DFP_T_Bp_Rc(dxexq, 0x02, 0x0b),
 GEN_DFP_T_A_SH_Rc(dscli, 0x02, 0x02),
 GEN_DFP_Tp_Ap_SH_Rc(dscliq, 0x02, 0x02),
 GEN_DFP_T_A_SH_Rc(dscri, 0x02, 0x03),
-- 
2.33.1


