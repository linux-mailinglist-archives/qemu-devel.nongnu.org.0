Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFC0406B19
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:00:09 +0200 (CEST)
Received: from localhost ([::1]:38756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOfCS-0002Uc-O1
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOeie-0005wi-R4; Fri, 10 Sep 2021 07:29:20 -0400
Received: from [201.28.113.2] (port=29928 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOeic-0003iy-Qu; Fri, 10 Sep 2021 07:29:20 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 10 Sep 2021 08:26:54 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 070518014C3;
 Fri, 10 Sep 2021 08:26:54 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 22/22] target/ppc: Move ddedpd[q], denbcd[q], dscli[q],
 dscri[q] to decodetree
Date: Fri, 10 Sep 2021 08:26:24 -0300
Message-Id: <20210910112624.72748-23-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910112624.72748-1-luis.pires@eldorado.org.br>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Sep 2021 11:26:54.0248 (UTC)
 FILETIME=[C1E9AA80:01D7A636]
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
ddedpd:  DFP Decode DPD To BCD
ddedpdq: DFP Decode DPD To BCD Quad
denbcd:  DFP Encode BCD To DPD
denbcdq: DFP Encode BCD To DPD Quad
dscli:   DFP Shift Significand Left Immediate
dscliq:  DFP Shift Significand Left Immediate Quad
dscri:   DFP Shift Significand Right Immediate
dscriq:  DFP Shift Significand Right Immediate Quad

Also deleted dfp-ops.c.inc, now that all PPC DFP instructions were
moved to decodetree.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/dfp_helper.c             | 16 ++++-----
 target/ppc/helper.h                 | 16 ++++-----
 target/ppc/insn32.decode            | 28 +++++++++++++++
 target/ppc/translate.c              |  2 --
 target/ppc/translate/dfp-impl.c.inc | 54 +++++++++++++----------------
 target/ppc/translate/dfp-ops.c.inc  | 40 ---------------------
 6 files changed, 68 insertions(+), 88 deletions(-)
 delete mode 100644 target/ppc/translate/dfp-ops.c.inc

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 7bb394c02b..0dcb1249f7 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -1131,8 +1131,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,          \
     set_dfp##size(t, &dfp.vt);                                            \
 }
 
-DFP_HELPER_DEDPD(ddedpd, 64)
-DFP_HELPER_DEDPD(ddedpdq, 128)
+DFP_HELPER_DEDPD(DDEDPD, 64)
+DFP_HELPER_DEDPD(DDEDPDQ, 128)
 
 static inline uint8_t dfp_get_bcd_digit_64(ppc_vsr_t *t, unsigned n)
 {
@@ -1199,8 +1199,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,             \
     set_dfp##size(t, &dfp.vt);                                               \
 }
 
-DFP_HELPER_ENBCD(denbcd, 64)
-DFP_HELPER_ENBCD(denbcdq, 128)
+DFP_HELPER_ENBCD(DENBCD, 64)
+DFP_HELPER_ENBCD(DENBCDQ, 128)
 
 #define DFP_HELPER_XEX(op, size)                               \
 void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b) \
@@ -1387,7 +1387,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,    \
     set_dfp##size(t, &dfp.vt);                                      \
 }
 
-DFP_HELPER_SHIFT(dscli, 64, 1)
-DFP_HELPER_SHIFT(dscliq, 128, 1)
-DFP_HELPER_SHIFT(dscri, 64, 0)
-DFP_HELPER_SHIFT(dscriq, 128, 0)
+DFP_HELPER_SHIFT(DSCLI, 64, 1)
+DFP_HELPER_SHIFT(DSCLIQ, 128, 1)
+DFP_HELPER_SHIFT(DSCRI, 64, 0)
+DFP_HELPER_SHIFT(DSCRIQ, 128, 0)
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 4c2a349ce6..6fa3e15fe9 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -738,18 +738,18 @@ DEF_HELPER_3(DCFFIXQQ, void, env, fprp, avr)
 DEF_HELPER_3(DCTFIX, void, env, fprp, fprp)
 DEF_HELPER_3(DCTFIXQ, void, env, fprp, fprp)
 DEF_HELPER_3(DCTFIXQQ, void, env, avr, fprp)
-DEF_HELPER_4(ddedpd, void, env, fprp, fprp, i32)
-DEF_HELPER_4(ddedpdq, void, env, fprp, fprp, i32)
-DEF_HELPER_4(denbcd, void, env, fprp, fprp, i32)
-DEF_HELPER_4(denbcdq, void, env, fprp, fprp, i32)
+DEF_HELPER_4(DDEDPD, void, env, fprp, fprp, i32)
+DEF_HELPER_4(DDEDPDQ, void, env, fprp, fprp, i32)
+DEF_HELPER_4(DENBCD, void, env, fprp, fprp, i32)
+DEF_HELPER_4(DENBCDQ, void, env, fprp, fprp, i32)
 DEF_HELPER_3(DXEX, void, env, fprp, fprp)
 DEF_HELPER_3(DXEXQ, void, env, fprp, fprp)
 DEF_HELPER_4(DIEX, void, env, fprp, fprp, fprp)
 DEF_HELPER_4(DIEXQ, void, env, fprp, fprp, fprp)
-DEF_HELPER_4(dscri, void, env, fprp, fprp, i32)
-DEF_HELPER_4(dscriq, void, env, fprp, fprp, i32)
-DEF_HELPER_4(dscli, void, env, fprp, fprp, i32)
-DEF_HELPER_4(dscliq, void, env, fprp, fprp, i32)
+DEF_HELPER_4(DSCRI, void, env, fprp, fprp, i32)
+DEF_HELPER_4(DSCRIQ, void, env, fprp, fprp, i32)
+DEF_HELPER_4(DSCLI, void, env, fprp, fprp, i32)
+DEF_HELPER_4(DSCLIQ, void, env, fprp, fprp, i32)
 
 DEF_HELPER_1(tbegin, void, env)
 DEF_HELPER_FLAGS_1(fixup_thrm, TCG_CALL_NO_RWG, void, env)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 2ce8b0ab95..6aec1c0728 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -74,6 +74,16 @@
 &X_bfl          bf l:bool ra rb
 @X_bfl          ...... bf:3 - l:1 ra:5 rb:5 ..........- &X_bfl
 
+&X_tb_sp_rc     rt rb sp rc:bool
+@X_tb_sp_rc     ...... rt:5 sp:2 ... rb:5 .......... rc:1       &X_tb_sp_rc
+
+@X_tbp_sp_rc    ...... ....0 sp:2 ... ....0 .......... rc:1     &X_tb_sp_rc rt=%x_frtp rb=%x_frbp
+
+&X_tb_s_rc      rt rb s:bool rc:bool
+@X_tb_s_rc      ...... rt:5 s:1 .... rb:5 .......... rc:1       &X_tb_s_rc
+
+@X_tbp_s_rc     ...... ....0 s:1 .... ....0 .......... rc:1     &X_tb_s_rc rt=%x_frtp rb=%x_frbp
+
 &X_frtp_vrb     frtp vrb
 @X_frtp_vrb     ...... ....0 ..... vrb:5 .......... .           &X_frtp_vrb frtp=%x_frtp
 
@@ -86,6 +96,12 @@
 %z22_frap       17:4 !function=times_2
 @Z22_bf_frap    ...... bf:3 .. ....0 dm:6 ......... .           &Z22_bf_fra fra=%z22_frap
 
+&Z22_ta_sh_rc   rt ra sh rc:bool
+@Z22_ta_sh_rc   ...... rt:5 ra:5 sh:6 ......... rc:1            &Z22_ta_sh_rc
+
+%z22_frtp       22:4 !function=times_2
+@Z22_tap_sh_rc  ...... ....0 ....0 sh:6 ......... rc:1          &Z22_ta_sh_rc rt=%z22_frtp ra=%z22_frap
+
 &Z23_tab        frt fra frb rmc rc:bool
 @Z23_tab        ...... frt:5 fra:5 frb:5 rmc:2 ........ rc:1    &Z23_tab
 
@@ -258,12 +274,24 @@ DCTFIXQQ        111111 ..... 00001 ..... 1111100010 -   @X_vrt_frbp
 
 ### Decimal Floating-Point Format Instructions
 
+DDEDPD          111011 ..... .. --- ..... 0101000010 .  @X_tb_sp_rc
+DDEDPDQ         111111 ..... .. --- ..... 0101000010 .  @X_tbp_sp_rc
+
+DENBCD          111011 ..... . ---- ..... 1101000010 .  @X_tb_s_rc
+DENBCDQ         111111 ..... . ---- ..... 1101000010 .  @X_tbp_s_rc
+
 DXEX            111011 ..... ----- ..... 0101100010 .   @X_tb_rc
 DXEXQ           111111 ..... ----- ..... 0101100010 .   @X_t_bp_rc
 
 DIEX            111011 ..... ..... ..... 1101100010 .   @X_rc
 DIEXQ           111111 ..... ..... ..... 1101100010 .   @X_tp_a_bp_rc
 
+DSCLI           111011 ..... ..... ...... 001000010 .   @Z22_ta_sh_rc
+DSCLIQ          111111 ..... ..... ...... 001000010 .   @Z22_tap_sh_rc
+
+DSCRI           111011 ..... ..... ...... 001100010 .   @Z22_ta_sh_rc
+DSCRIQ          111111 ..... ..... ...... 001100010 .   @Z22_tap_sh_rc
+
 ## Vector Bit Manipulation Instruction
 
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 9e940a1a17..db0f278128 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -8176,8 +8176,6 @@ GEN_HANDLER2_E(trechkpt, "trechkpt", 0x1F, 0x0E, 0x1F, 0x03FFF800, \
 
 #include "translate/vsx-ops.c.inc"
 
-#include "translate/dfp-ops.c.inc"
-
 #include "translate/spe-ops.c.inc"
 };
 
diff --git a/target/ppc/translate/dfp-impl.c.inc b/target/ppc/translate/dfp-impl.c.inc
index 408769efb6..f9f1d58d44 100644
--- a/target/ppc/translate/dfp-impl.c.inc
+++ b/target/ppc/translate/dfp-impl.c.inc
@@ -123,26 +123,22 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
     return true;                                             \
 }
 
-#define GEN_DFP_T_FPR_I32_Rc(name, fprfld, i32fld) \
-static void gen_##name(DisasContext *ctx)          \
-{                                                  \
-    TCGv_ptr rt, rs;                               \
-    TCGv_i32 i32;                                  \
-    if (unlikely(!ctx->fpu_enabled)) {             \
-        gen_exception(ctx, POWERPC_EXCP_FPU);      \
-        return;                                    \
-    }                                              \
-    gen_update_nip(ctx, ctx->base.pc_next - 4);    \
-    rt = gen_fprp_ptr(rD(ctx->opcode));            \
-    rs = gen_fprp_ptr(fprfld(ctx->opcode));        \
-    i32 = tcg_const_i32(i32fld(ctx->opcode));      \
-    gen_helper_##name(cpu_env, rt, rs, i32);       \
-    if (unlikely(Rc(ctx->opcode) != 0)) {          \
-        gen_set_cr1_from_fpscr(ctx);               \
-    }                                              \
-    tcg_temp_free_ptr(rt);                         \
-    tcg_temp_free_ptr(rs);                         \
-    tcg_temp_free_i32(i32);                        \
+#define TRANS_DFP_T_FPR_I32_Rc(NAME, FPRFLD, I32FLD)         \
+static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
+{                                                            \
+    TCGv_ptr rt, rx;                                         \
+    REQUIRE_INSNS_FLAGS2(ctx, DFP);                          \
+    REQUIRE_FPU(ctx);                                        \
+    rt = gen_fprp_ptr(a->rt);                                \
+    rx = gen_fprp_ptr(a->FPRFLD);                            \
+    gen_helper_##NAME(cpu_env, rt, rx,                       \
+                      tcg_constant_i32(a->I32FLD));          \
+    if (unlikely(a->rc)) {                                   \
+        gen_set_cr1_from_fpscr(ctx);                         \
+    }                                                        \
+    tcg_temp_free_ptr(rt);                                   \
+    tcg_temp_free_ptr(rx);                                   \
+    return true;                                             \
 }
 
 TRANS_DFP_T_A_B_Rc(DADD)
@@ -185,20 +181,18 @@ TRANS_DFP_T_B_Rc(DCFFIX)
 TRANS_DFP_T_B_Rc(DCFFIXQ)
 TRANS_DFP_T_B_Rc(DCTFIX)
 TRANS_DFP_T_B_Rc(DCTFIXQ)
-GEN_DFP_T_FPR_I32_Rc(ddedpd, rB, SP)
-GEN_DFP_T_FPR_I32_Rc(ddedpdq, rB, SP)
-GEN_DFP_T_FPR_I32_Rc(denbcd, rB, SP)
-GEN_DFP_T_FPR_I32_Rc(denbcdq, rB, SP)
+TRANS_DFP_T_FPR_I32_Rc(DDEDPD, rb, sp)
+TRANS_DFP_T_FPR_I32_Rc(DDEDPDQ, rb, sp)
+TRANS_DFP_T_FPR_I32_Rc(DENBCD, rb, s)
+TRANS_DFP_T_FPR_I32_Rc(DENBCDQ, rb, s)
 TRANS_DFP_T_B_Rc(DXEX)
 TRANS_DFP_T_B_Rc(DXEXQ)
 TRANS_DFP_T_A_B_Rc(DIEX)
 TRANS_DFP_T_A_B_Rc(DIEXQ)
-GEN_DFP_T_FPR_I32_Rc(dscli, rA, DCM)
-GEN_DFP_T_FPR_I32_Rc(dscliq, rA, DCM)
-GEN_DFP_T_FPR_I32_Rc(dscri, rA, DCM)
-GEN_DFP_T_FPR_I32_Rc(dscriq, rA, DCM)
-
-#undef GEN_DFP_T_FPR_I32_Rc
+TRANS_DFP_T_FPR_I32_Rc(DSCLI, ra, sh)
+TRANS_DFP_T_FPR_I32_Rc(DSCLIQ, ra, sh)
+TRANS_DFP_T_FPR_I32_Rc(DSCRI, ra, sh)
+TRANS_DFP_T_FPR_I32_Rc(DSCRIQ, ra, sh)
 
 static bool trans_DCFFIXQQ(DisasContext *ctx, arg_DCFFIXQQ *a)
 {
diff --git a/target/ppc/translate/dfp-ops.c.inc b/target/ppc/translate/dfp-ops.c.inc
deleted file mode 100644
index e29c4b2194..0000000000
--- a/target/ppc/translate/dfp-ops.c.inc
+++ /dev/null
@@ -1,40 +0,0 @@
-#define _GEN_DFP_LONG(name, op1, op2, mask) \
-GEN_HANDLER_E(name, 0x3B, op1, op2, mask, PPC_NONE, PPC2_DFP)
-
-#define _GEN_DFP_LONGx2(name, op1, op2, mask) \
-GEN_HANDLER_E(name, 0x3B, op1, 0x00 | op2, mask, PPC_NONE, PPC2_DFP), \
-GEN_HANDLER_E(name, 0x3B, op1, 0x10 | op2, mask, PPC_NONE, PPC2_DFP)
-
-#define _GEN_DFP_QUAD(name, op1, op2, mask) \
-GEN_HANDLER_E(name, 0x3F, op1, op2, mask, PPC_NONE, PPC2_DFP)
-
-#define _GEN_DFP_QUADx2(name, op1, op2, mask) \
-GEN_HANDLER_E(name, 0x3F, op1, 0x00 | op2, mask, PPC_NONE, PPC2_DFP), \
-GEN_HANDLER_E(name, 0x3F, op1, 0x10 | op2, mask, PPC_NONE, PPC2_DFP)
-
-#define GEN_DFP_SP_T_B_Rc(name, op1, op2) \
-_GEN_DFP_LONG(name, op1, op2, 0x00070000)
-
-#define GEN_DFP_SP_Tp_Bp_Rc(name, op1, op2) \
-_GEN_DFP_QUAD(name, op1, op2, 0x00270800)
-
-#define GEN_DFP_S_T_B_Rc(name, op1, op2) \
-_GEN_DFP_LONG(name, op1, op2, 0x000F0000)
-
-#define GEN_DFP_S_Tp_Bp_Rc(name, op1, op2) \
-_GEN_DFP_QUAD(name, op1, op2, 0x002F0800)
-
-#define GEN_DFP_T_A_SH_Rc(name, op1, op2) \
-_GEN_DFP_LONGx2(name, op1, op2, 0x00000000)
-
-#define GEN_DFP_Tp_Ap_SH_Rc(name, op1, op2) \
-_GEN_DFP_QUADx2(name, op1, op2, 0x00210000)
-
-GEN_DFP_SP_T_B_Rc(ddedpd, 0x02, 0x0a),
-GEN_DFP_SP_Tp_Bp_Rc(ddedpdq, 0x02, 0x0a),
-GEN_DFP_S_T_B_Rc(denbcd, 0x02, 0x1a),
-GEN_DFP_S_Tp_Bp_Rc(denbcdq, 0x02, 0x1a),
-GEN_DFP_T_A_SH_Rc(dscli, 0x02, 0x02),
-GEN_DFP_Tp_Ap_SH_Rc(dscliq, 0x02, 0x02),
-GEN_DFP_T_A_SH_Rc(dscri, 0x02, 0x03),
-GEN_DFP_Tp_Ap_SH_Rc(dscriq, 0x02, 0x03),
-- 
2.25.1


