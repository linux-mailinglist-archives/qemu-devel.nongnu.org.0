Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC44E49C16D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 03:46:08 +0100 (CET)
Received: from localhost ([::1]:60588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCYJz-0000s1-PH
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 21:46:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCYFC-0006wC-Id; Tue, 25 Jan 2022 21:41:10 -0500
Received: from [187.72.171.209] (port=15999 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCYFA-0002IA-Gd; Tue, 25 Jan 2022 21:41:09 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:47 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7FA608009AB;
 Tue, 25 Jan 2022 09:20:47 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 38/38] target/ppc: Implement xvcvbf16spn and xvcvspbf16
 instructions
Date: Tue, 25 Jan 2022 09:19:43 -0300
Message-Id: <20220125121943.3269077-39-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:47.0848 (UTC)
 FILETIME=[FBE19E80:01D811E5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c             | 21 +++++++++++++++++++
 target/ppc/helper.h                 |  1 +
 target/ppc/insn32.decode            | 11 +++++++---
 target/ppc/translate/vsx-impl.c.inc | 31 ++++++++++++++++++++++++++++-
 4 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index c724fa8a8d..f83a80e685 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2790,6 +2790,27 @@ VSX_CVT_FP_TO_FP_HP(xscvhpdp, 1, float16, float64, VsrH(3), VsrD(0), 1)
 VSX_CVT_FP_TO_FP_HP(xvcvsphp, 4, float32, float16, VsrW(i), VsrH(2 * i  + 1), 0)
 VSX_CVT_FP_TO_FP_HP(xvcvhpsp, 4, float16, float32, VsrH(2 * i + 1), VsrW(i), 0)
 
+void helper_XVCVSPBF16(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)
+{
+    ppc_vsr_t t = { };
+    int i;
+
+    helper_reset_fpstatus(env);
+    for (i = 0; i < 4; i++) {
+        if (unlikely(float32_is_signaling_nan(xb->VsrW(i), &env->fp_status))) {
+            float_invalid_op_vxsnan(env, GETPC());
+            t.VsrH(2 * i + 1) = float32_to_bfloat16(
+                float32_snan_to_qnan(xb->VsrW(i)), &env->fp_status);
+        } else {
+            t.VsrH(2 * i + 1) =
+                float32_to_bfloat16(xb->VsrW(i), &env->fp_status);
+        }
+    }
+
+    *xt = t;
+    do_float_check_status(env, GETPC());
+}
+
 void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
                      ppc_vsr_t *xb)
 {
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 81e5f968fd..aac5e497e4 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -499,6 +499,7 @@ DEF_HELPER_FLAGS_4(xvcmpnesp, TCG_CALL_NO_RWG, i32, env, vsr, vsr, vsr)
 DEF_HELPER_3(xvcvspdp, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvsphp, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvhpsp, void, env, vsr, vsr)
+DEF_HELPER_3(XVCVSPBF16, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvspsxds, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvspsxws, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvspuxds, void, env, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 0dd54d60c3..ebb5c22ee1 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -152,8 +152,11 @@
 %xx_xb          1:1 11:5
 %xx_xa          2:1 16:5
 %xx_xc          3:1 6:5
-&XX2            xt xb uim:uint8_t
-@XX2            ...... ..... ... uim:2 ..... ......... ..       &XX2 xt=%xx_xt xb=%xx_xb
+&XX2            xt xb
+@XX2            ...... ..... ..... ..... ......... ..           &XX2 xt=%xx_xt xb=%xx_xb
+
+&XX2_uim2       xt xb uim:uint8_t
+@XX2_uim2       ...... ..... ... uim:2 ..... ......... ..       &XX2_uim2 xt=%xx_xt xb=%xx_xb
 
 &XX2_bf_xb      bf xb
 @XX2_bf_xb      ...... bf:3 .. ..... ..... ......... . .        &XX2_bf_xb xb=%xx_xb
@@ -575,7 +578,7 @@ XSNMSUBQP       111111 ..... ..... ..... 0111100100 .   @X_rc
 ## VSX splat instruction
 
 XXSPLTIB        111100 ..... 00 ........ 0101101000 .   @X_imm8
-XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2
+XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2_uim2
 
 ## VSX Permute Instructions
 
@@ -615,6 +618,8 @@ XSCMPGTQP       111111 ..... ..... ..... 0011100100 -   @X
 ## VSX Binary Floating-Point Convert Instructions
 
 XSCVQPDP        111111 ..... 10100 ..... 1101000100 .   @X_tb_rc
+XVCVBF16SPN     111100 ..... 10000 ..... 111011011 ..   @XX2
+XVCVSPBF16      111100 ..... 10001 ..... 111011011 ..   @XX2
 
 ## VSX Vector Test Least-Significant Bit by Byte Instruction
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index d84b385e75..34ebc2c362 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1565,7 +1565,7 @@ static bool trans_XXSEL(DisasContext *ctx, arg_XX4 *a)
     return true;
 }
 
-static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2 *a)
+static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2_uim2 *a)
 {
     int tofs, bofs;
 
@@ -2492,6 +2492,35 @@ TRANS(XSCMPGTQP, do_xscmpqp, gen_helper_XSCMPGTQP)
 TRANS(XSMAXCQP, do_xscmpqp, gen_helper_XSMAXCQP)
 TRANS(XSMINCQP, do_xscmpqp, gen_helper_XSMINCQP)
 
+static bool trans_XVCVSPBF16(DisasContext *ctx, arg_XX2 *a)
+{
+    TCGv_ptr xt, xb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    xt = gen_vsr_ptr(a->xt);
+    xb = gen_vsr_ptr(a->xb);
+
+    gen_helper_XVCVSPBF16(cpu_env, xt, xb);
+
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(xb);
+
+    return true;
+}
+
+static bool trans_XVCVBF16SPN(DisasContext *ctx, arg_XX2 *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_shli(MO_32, vsr_full_offset(a->xt), vsr_full_offset(a->xb),
+                      16, 16, 16);
+
+    return true;
+}
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
-- 
2.25.1


