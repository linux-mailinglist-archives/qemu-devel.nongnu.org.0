Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61343FCC0A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:07:27 +0200 (CEST)
Received: from localhost ([::1]:52646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7EM-0002Ix-Re
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6tq-000181-6u; Tue, 31 Aug 2021 12:46:14 -0400
Received: from [201.28.113.2] (port=19047 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6to-0001DD-2e; Tue, 31 Aug 2021 12:46:13 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 31 Aug 2021 13:43:45 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 8B1B0800930;
 Tue, 31 Aug 2021 13:43:43 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 18/19] target/ppc: Move dct{dp, qpq}, dr{sp, dpq}, dc{f,
 t}fix[q], dxex[q] to decodetree
Date: Tue, 31 Aug 2021 13:40:06 -0300
Message-Id: <20210831164007.297781-19-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831164007.297781-1-luis.pires@eldorado.org.br>
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Aug 2021 16:43:45.0686 (UTC)
 FILETIME=[5D7B6360:01D79E87]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 target/ppc/dfp_helper.c             | 20 +++++------
 target/ppc/helper.h                 | 20 +++++------
 target/ppc/insn32.decode            | 23 ++++++++++++
 target/ppc/translate/dfp-impl.c.inc | 55 ++++++++++++++---------------
 target/ppc/translate/dfp-ops.c.inc  | 22 ------------
 5 files changed, 69 insertions(+), 71 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 9c75cbb79b..7bb394c02b 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -886,7 +886,7 @@ static void RINTN_PPs(struct PPC_DFP *dfp)
 DFP_HELPER_RINT(DRINTN, RINTN_PPs, 64)
 DFP_HELPER_RINT(DRINTNQ, RINTN_PPs, 128)
 
-void helper_dctdp(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
+void helper_DCTDP(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
 {
     struct PPC_DFP dfp;
     ppc_vsr_t vb;
@@ -902,7 +902,7 @@ void helper_dctdp(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
     dfp_set_FPRF_from_FRT(&dfp);
 }
 
-void helper_dctqpq(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
+void helper_DCTQPQ(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
 {
     struct PPC_DFP dfp;
     ppc_vsr_t vb;
@@ -917,7 +917,7 @@ void helper_dctqpq(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
     set_dfp128(t, &dfp.vt);
 }
 
-void helper_drsp(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
+void helper_DRSP(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
 {
     struct PPC_DFP dfp;
     uint32_t t_short = 0;
@@ -935,7 +935,7 @@ void helper_drsp(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
     set_dfp64(t, &vt);
 }
 
-void helper_drdpq(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
+void helper_DRDPQ(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
 {
     struct PPC_DFP dfp;
     dfp_prepare_decimal128(&dfp, 0, b, env);
@@ -973,8 +973,8 @@ static void CFFIX_PPs(struct PPC_DFP *dfp)
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
index cb05cc168c..4c2a349ce6 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -728,22 +728,22 @@ DEF_HELPER_5(DRINTX, void, env, fprp, fprp, i32, i32)
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
index 86dbdada47..2ce8b0ab95 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -47,6 +47,15 @@
 
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
 
@@ -233,11 +242,25 @@ DRINTNQ         111111 ..... ---- . ..... .. 11100011 . @Z23_tbp
 
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
index 73c8906b45..408769efb6 100644
--- a/target/ppc/translate/dfp-impl.c.inc
+++ b/target/ppc/translate/dfp-impl.c.inc
@@ -106,24 +106,22 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
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
-    gen_update_nip(ctx, ctx->base.pc_next - 4);  \
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
@@ -179,20 +177,20 @@ TRANS_DFP_T_B_U32_U32_Rc(DRINTX, r, rmc)
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
@@ -200,7 +198,6 @@ GEN_DFP_T_FPR_I32_Rc(dscliq, rA, DCM)
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
2.25.1


