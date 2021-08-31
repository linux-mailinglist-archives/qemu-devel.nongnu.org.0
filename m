Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8A13FCC11
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:09:26 +0200 (CEST)
Received: from localhost ([::1]:56420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7G8-0004qg-9t
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6tb-0000m5-Ff; Tue, 31 Aug 2021 12:46:00 -0400
Received: from [201.28.113.2] (port=19047 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6tY-0001DD-31; Tue, 31 Aug 2021 12:45:58 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 31 Aug 2021 13:43:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 4BCB1800930;
 Tue, 31 Aug 2021 13:43:33 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 14/19] target/ppc: Move d{add, sub, mul, div,
 iex}[q] to decodetree
Date: Tue, 31 Aug 2021 13:40:02 -0300
Message-Id: <20210831164007.297781-15-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831164007.297781-1-luis.pires@eldorado.org.br>
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Aug 2021 16:43:35.0382 (UTC)
 FILETIME=[57571F60:01D79E87]
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
dadd:  DFP Add
daddq: DFP Add Quad
dsub:  DFP Subtract
dsubq: DFP Subtract Quad
dmul:  DFP Multiply
dmulq: DFP Multiply Quad
ddiv:  DFP Divide
ddivq: DFP Divide Quad
diex:  DFP Insert Biased Exponent
diexq: DFP Insert Biased Exponent Quad

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/dfp_helper.c             | 20 +++++-----
 target/ppc/helper.h                 | 20 +++++-----
 target/ppc/insn32.decode            | 31 +++++++++++++++-
 target/ppc/translate/dfp-impl.c.inc | 57 ++++++++++++++---------------
 target/ppc/translate/dfp-ops.c.inc  | 19 ----------
 5 files changed, 76 insertions(+), 71 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index b4945fe48f..14080cecc8 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -446,8 +446,8 @@ static void ADD_PPs(struct PPC_DFP *dfp)
     dfp_check_for_VXISI_add(dfp);
 }
 
-DFP_HELPER_TAB(dadd, decNumberAdd, ADD_PPs, 64)
-DFP_HELPER_TAB(daddq, decNumberAdd, ADD_PPs, 128)
+DFP_HELPER_TAB(DADD, decNumberAdd, ADD_PPs, 64)
+DFP_HELPER_TAB(DADDQ, decNumberAdd, ADD_PPs, 128)
 
 static void SUB_PPs(struct PPC_DFP *dfp)
 {
@@ -459,8 +459,8 @@ static void SUB_PPs(struct PPC_DFP *dfp)
     dfp_check_for_VXISI_subtract(dfp);
 }
 
-DFP_HELPER_TAB(dsub, decNumberSubtract, SUB_PPs, 64)
-DFP_HELPER_TAB(dsubq, decNumberSubtract, SUB_PPs, 128)
+DFP_HELPER_TAB(DSUB, decNumberSubtract, SUB_PPs, 64)
+DFP_HELPER_TAB(DSUBQ, decNumberSubtract, SUB_PPs, 128)
 
 static void MUL_PPs(struct PPC_DFP *dfp)
 {
@@ -472,8 +472,8 @@ static void MUL_PPs(struct PPC_DFP *dfp)
     dfp_check_for_VXIMZ(dfp);
 }
 
-DFP_HELPER_TAB(dmul, decNumberMultiply, MUL_PPs, 64)
-DFP_HELPER_TAB(dmulq, decNumberMultiply, MUL_PPs, 128)
+DFP_HELPER_TAB(DMUL, decNumberMultiply, MUL_PPs, 64)
+DFP_HELPER_TAB(DMULQ, decNumberMultiply, MUL_PPs, 128)
 
 static void DIV_PPs(struct PPC_DFP *dfp)
 {
@@ -487,8 +487,8 @@ static void DIV_PPs(struct PPC_DFP *dfp)
     dfp_check_for_VXIDI(dfp);
 }
 
-DFP_HELPER_TAB(ddiv, decNumberDivide, DIV_PPs, 64)
-DFP_HELPER_TAB(ddivq, decNumberDivide, DIV_PPs, 128)
+DFP_HELPER_TAB(DDIV, decNumberDivide, DIV_PPs, 64)
+DFP_HELPER_TAB(DDIVQ, decNumberDivide, DIV_PPs, 128)
 
 #define DFP_HELPER_BF_AB(op, dnop, postprocs, size)                            \
 uint32_t helper_##op(CPUPPCState *env, ppc_fprp_t *a, ppc_fprp_t *b)           \
@@ -1299,8 +1299,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,          \
     set_dfp##size(t, &dfp.vt);                                            \
 }
 
-DFP_HELPER_IEX(diex, 64)
-DFP_HELPER_IEX(diexq, 128)
+DFP_HELPER_IEX(DIEX, 64)
+DFP_HELPER_IEX(DIEXQ, 128)
 
 static void dfp_clear_lmd_from_g5msb(uint64_t *t)
 {
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 30e9247a5a..1f00e47b82 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -696,14 +696,14 @@ DEF_HELPER_3(store_601_batu, void, env, i32, tl)
 #define dh_alias_fprp ptr
 #define dh_ctype_fprp ppc_fprp_t *
 
-DEF_HELPER_4(dadd, void, env, fprp, fprp, fprp)
-DEF_HELPER_4(daddq, void, env, fprp, fprp, fprp)
-DEF_HELPER_4(dsub, void, env, fprp, fprp, fprp)
-DEF_HELPER_4(dsubq, void, env, fprp, fprp, fprp)
-DEF_HELPER_4(dmul, void, env, fprp, fprp, fprp)
-DEF_HELPER_4(dmulq, void, env, fprp, fprp, fprp)
-DEF_HELPER_4(ddiv, void, env, fprp, fprp, fprp)
-DEF_HELPER_4(ddivq, void, env, fprp, fprp, fprp)
+DEF_HELPER_4(DADD, void, env, fprp, fprp, fprp)
+DEF_HELPER_4(DADDQ, void, env, fprp, fprp, fprp)
+DEF_HELPER_4(DSUB, void, env, fprp, fprp, fprp)
+DEF_HELPER_4(DSUBQ, void, env, fprp, fprp, fprp)
+DEF_HELPER_4(DMUL, void, env, fprp, fprp, fprp)
+DEF_HELPER_4(DMULQ, void, env, fprp, fprp, fprp)
+DEF_HELPER_4(DDIV, void, env, fprp, fprp, fprp)
+DEF_HELPER_4(DDIVQ, void, env, fprp, fprp, fprp)
 DEF_HELPER_3(dcmpo, i32, env, fprp, fprp)
 DEF_HELPER_3(dcmpoq, i32, env, fprp, fprp)
 DEF_HELPER_3(dcmpu, i32, env, fprp, fprp)
@@ -744,8 +744,8 @@ DEF_HELPER_4(denbcd, void, env, fprp, fprp, i32)
 DEF_HELPER_4(denbcdq, void, env, fprp, fprp, i32)
 DEF_HELPER_3(dxex, void, env, fprp, fprp)
 DEF_HELPER_3(dxexq, void, env, fprp, fprp)
-DEF_HELPER_4(diex, void, env, fprp, fprp, fprp)
-DEF_HELPER_4(diexq, void, env, fprp, fprp, fprp)
+DEF_HELPER_4(DIEX, void, env, fprp, fprp, fprp)
+DEF_HELPER_4(DIEXQ, void, env, fprp, fprp, fprp)
 DEF_HELPER_4(dscri, void, env, fprp, fprp, i32)
 DEF_HELPER_4(dscriq, void, env, fprp, fprp, i32)
 DEF_HELPER_4(dscli, void, env, fprp, fprp, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 38f8525d54..c4a8cc7ec5 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -37,6 +37,16 @@
 &X              rt ra rb
 @X              ...... rt:5 ra:5 rb:5 .......... .      &X
 
+&X_rc           rt ra rb rc:bool
+@X_rc           ...... rt:5 ra:5 rb:5 .......... rc:1           &X_rc
+
+%x_frtp         22:4 !function=times_2
+%x_frap         17:4 !function=times_2
+%x_frbp         12:4 !function=times_2
+@X_tp_ap_bp_rc  ...... ....0 ....0 ....0 .......... rc:1        &X_rc rt=%x_frtp ra=%x_frap rb=%x_frbp
+
+@X_tp_a_bp_rc   ...... ....0 ra:5 ....0 .......... rc:1         &X_rc rt=%x_frtp rb=%x_frbp
+
 &X_bi           rt bi
 @X_bi           ...... rt:5 bi:5 ----- .......... -     &X_bi
 
@@ -44,11 +54,9 @@
 @X_bfl          ...... bf:3 - l:1 ra:5 rb:5 ..........- &X_bfl
 
 &X_frtp_vrb     frtp vrb
-%x_frtp         22:4 !function=times_2
 @X_frtp_vrb     ...... ....0 ..... vrb:5 .......... .           &X_frtp_vrb frtp=%x_frtp
 
 &X_vrt_frbp     vrt frbp
-%x_frbp         12:4 !function=times_2
 @X_vrt_frbp     ...... vrt:5 ..... ....0 .......... .           &X_vrt_frbp frbp=%x_frbp
 
 &Z22_bf_fra     bf fra dm
@@ -135,6 +143,20 @@ SETBCR          011111 ..... ..... ----- 0110100000 -   @X_bi
 SETNBC          011111 ..... ..... ----- 0111000000 -   @X_bi
 SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 
+### Decimal Floating-Point Arithmetic Instructions
+
+DADD            111011 ..... ..... ..... 0000000010 .   @X_rc
+DADDQ           111111 ..... ..... ..... 0000000010 .   @X_tp_ap_bp_rc
+
+DSUB            111011 ..... ..... ..... 1000000010 .   @X_rc
+DSUBQ           111111 ..... ..... ..... 1000000010 .   @X_tp_ap_bp_rc
+
+DMUL            111011 ..... ..... ..... 0000100010 .   @X_rc
+DMULQ           111111 ..... ..... ..... 0000100010 .   @X_tp_ap_bp_rc
+
+DDIV            111011 ..... ..... ..... 1000100010 .   @X_rc
+DDIVQ           111111 ..... ..... ..... 1000100010 .   @X_tp_ap_bp_rc
+
 ### Decimal Floating-Point Test Instructions
 
 DTSTDC          111011 ... -- ..... ...... 011000010 -  @Z22_bf_fra
@@ -148,6 +170,11 @@ DTSTDGQ         111111 ... -- ..... ...... 011100010 -  @Z22_bf_frap
 DCFFIXQQ        111111 ..... 00000 ..... 1111100010 -   @X_frtp_vrb
 DCTFIXQQ        111111 ..... 00001 ..... 1111100010 -   @X_vrt_frbp
 
+### Decimal Floating-Point Format Instructions
+
+DIEX            111011 ..... ..... ..... 1101100010 .   @X_rc
+DIEXQ           111111 ..... ..... ..... 1101100010 .   @X_tp_a_bp_rc
+
 ## Vector Bit Manipulation Instruction
 
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
diff --git a/target/ppc/translate/dfp-impl.c.inc b/target/ppc/translate/dfp-impl.c.inc
index b9029841b3..c54ea16106 100644
--- a/target/ppc/translate/dfp-impl.c.inc
+++ b/target/ppc/translate/dfp-impl.c.inc
@@ -7,25 +7,23 @@ static inline TCGv_ptr gen_fprp_ptr(int reg)
     return r;
 }
 
-#define GEN_DFP_T_A_B_Rc(name)                   \
-static void gen_##name(DisasContext *ctx)        \
-{                                                \
-    TCGv_ptr rd, ra, rb;                         \
-    if (unlikely(!ctx->fpu_enabled)) {           \
-        gen_exception(ctx, POWERPC_EXCP_FPU);    \
-        return;                                  \
-    }                                            \
-    gen_update_nip(ctx, ctx->base.pc_next - 4);  \
-    rd = gen_fprp_ptr(rD(ctx->opcode));          \
-    ra = gen_fprp_ptr(rA(ctx->opcode));          \
-    rb = gen_fprp_ptr(rB(ctx->opcode));          \
-    gen_helper_##name(cpu_env, rd, ra, rb);      \
-    if (unlikely(Rc(ctx->opcode) != 0)) {        \
-        gen_set_cr1_from_fpscr(ctx);             \
-    }                                            \
-    tcg_temp_free_ptr(rd);                       \
-    tcg_temp_free_ptr(ra);                       \
-    tcg_temp_free_ptr(rb);                       \
+#define TRANS_DFP_T_A_B_Rc(NAME)                             \
+static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
+{                                                            \
+    TCGv_ptr rt, ra, rb;                                     \
+    REQUIRE_INSNS_FLAGS2(ctx, DFP);                          \
+    REQUIRE_FPU(ctx);                                        \
+    rt = gen_fprp_ptr(a->rt);                                \
+    ra = gen_fprp_ptr(a->ra);                                \
+    rb = gen_fprp_ptr(a->rb);                                \
+    gen_helper_##NAME(cpu_env, rt, ra, rb);                  \
+    if (unlikely(a->rc)) {                                   \
+        gen_set_cr1_from_fpscr(ctx);                         \
+    }                                                        \
+    tcg_temp_free_ptr(rt);                                   \
+    tcg_temp_free_ptr(ra);                                   \
+    tcg_temp_free_ptr(rb);                                   \
+    return true;                                             \
 }
 
 #define GEN_DFP_BF_A_B(name)                      \
@@ -165,14 +163,14 @@ static void gen_##name(DisasContext *ctx)          \
     tcg_temp_free_i32(i32);                        \
 }
 
-GEN_DFP_T_A_B_Rc(dadd)
-GEN_DFP_T_A_B_Rc(daddq)
-GEN_DFP_T_A_B_Rc(dsub)
-GEN_DFP_T_A_B_Rc(dsubq)
-GEN_DFP_T_A_B_Rc(dmul)
-GEN_DFP_T_A_B_Rc(dmulq)
-GEN_DFP_T_A_B_Rc(ddiv)
-GEN_DFP_T_A_B_Rc(ddivq)
+TRANS_DFP_T_A_B_Rc(DADD)
+TRANS_DFP_T_A_B_Rc(DADDQ)
+TRANS_DFP_T_A_B_Rc(DSUB)
+TRANS_DFP_T_A_B_Rc(DSUBQ)
+TRANS_DFP_T_A_B_Rc(DMUL)
+TRANS_DFP_T_A_B_Rc(DMULQ)
+TRANS_DFP_T_A_B_Rc(DDIV)
+TRANS_DFP_T_A_B_Rc(DDIVQ)
 GEN_DFP_BF_A_B(dcmpu)
 GEN_DFP_BF_A_B(dcmpuq)
 GEN_DFP_BF_A_B(dcmpo)
@@ -211,14 +209,13 @@ GEN_DFP_T_FPR_I32_Rc(denbcd, rB, SP)
 GEN_DFP_T_FPR_I32_Rc(denbcdq, rB, SP)
 GEN_DFP_T_B_Rc(dxex)
 GEN_DFP_T_B_Rc(dxexq)
-GEN_DFP_T_A_B_Rc(diex)
-GEN_DFP_T_A_B_Rc(diexq)
+TRANS_DFP_T_A_B_Rc(DIEX)
+TRANS_DFP_T_A_B_Rc(DIEXQ)
 GEN_DFP_T_FPR_I32_Rc(dscli, rA, DCM)
 GEN_DFP_T_FPR_I32_Rc(dscliq, rA, DCM)
 GEN_DFP_T_FPR_I32_Rc(dscri, rA, DCM)
 GEN_DFP_T_FPR_I32_Rc(dscriq, rA, DCM)
 
-#undef GEN_DFP_T_A_B_Rc
 #undef GEN_DFP_BF_A_B
 #undef GEN_DFP_T_B_U32_U32_Rc
 #undef GEN_DFP_T_A_B_I32_Rc
diff --git a/target/ppc/translate/dfp-ops.c.inc b/target/ppc/translate/dfp-ops.c.inc
index e1df98d52e..38ea551488 100644
--- a/target/ppc/translate/dfp-ops.c.inc
+++ b/target/ppc/translate/dfp-ops.c.inc
@@ -30,15 +30,6 @@ GEN_HANDLER_E(name, 0x3F, op1, 0x08 | op2, mask, PPC_NONE, PPC2_DFP), \
 GEN_HANDLER_E(name, 0x3F, op1, 0x10 | op2, mask, PPC_NONE, PPC2_DFP), \
 GEN_HANDLER_E(name, 0x3F, op1, 0x18 | op2, mask, PPC_NONE, PPC2_DFP)
 
-#define GEN_DFP_T_A_B_Rc(name, op1, op2) \
-_GEN_DFP_LONG(name, op1, op2, 0x00000000)
-
-#define GEN_DFP_Tp_Ap_Bp_Rc(name, op1, op2) \
-_GEN_DFP_QUAD(name, op1, op2, 0x00210800)
-
-#define GEN_DFP_Tp_A_Bp_Rc(name, op1, op2) \
-_GEN_DFP_QUAD(name, op1, op2, 0x00200800)
-
 #define GEN_DFP_T_B_Rc(name, op1, op2) \
 _GEN_DFP_LONG(name, op1, op2, 0x001F0000)
 
@@ -105,14 +96,6 @@ _GEN_DFP_LONGx2(name, op1, op2, 0x00000000)
 #define GEN_DFP_Tp_Ap_SH_Rc(name, op1, op2) \
 _GEN_DFP_QUADx2(name, op1, op2, 0x00210000)
 
-GEN_DFP_T_A_B_Rc(dadd, 0x02, 0x00),
-GEN_DFP_Tp_Ap_Bp_Rc(daddq, 0x02, 0x00),
-GEN_DFP_T_A_B_Rc(dsub, 0x02, 0x10),
-GEN_DFP_Tp_Ap_Bp_Rc(dsubq, 0x02, 0x10),
-GEN_DFP_T_A_B_Rc(dmul, 0x02, 0x01),
-GEN_DFP_Tp_Ap_Bp_Rc(dmulq, 0x02, 0x01),
-GEN_DFP_T_A_B_Rc(ddiv, 0x02, 0x11),
-GEN_DFP_Tp_Ap_Bp_Rc(ddivq, 0x02, 0x11),
 GEN_DFP_BF_A_B(dcmpu, 0x02, 0x14),
 GEN_DFP_BF_Ap_Bp(dcmpuq, 0x02, 0x14),
 GEN_DFP_BF_A_B(dcmpo, 0x02, 0x04),
@@ -147,8 +130,6 @@ GEN_DFP_S_T_B_Rc(denbcd, 0x02, 0x1a),
 GEN_DFP_S_Tp_Bp_Rc(denbcdq, 0x02, 0x1a),
 GEN_DFP_T_B_Rc(dxex, 0x02, 0x0b),
 GEN_DFP_T_Bp_Rc(dxexq, 0x02, 0x0b),
-GEN_DFP_T_A_B_Rc(diex, 0x02, 0x1b),
-GEN_DFP_Tp_A_Bp_Rc(diexq, 0x02, 0x1b),
 GEN_DFP_T_A_SH_Rc(dscli, 0x02, 0x02),
 GEN_DFP_Tp_Ap_SH_Rc(dscliq, 0x02, 0x02),
 GEN_DFP_T_A_SH_Rc(dscri, 0x02, 0x03),
-- 
2.25.1


