Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489664ECB84
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:13:26 +0200 (CEST)
Received: from localhost ([::1]:56742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcov-0007mX-B0
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:13:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbr-0000rp-8x; Wed, 30 Mar 2022 13:59:55 -0400
Received: from [187.72.171.209] (port=21948 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbp-0004ik-NS; Wed, 30 Mar 2022 13:59:55 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 30 Mar 2022 14:59:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2274C8002AF;
 Wed, 30 Mar 2022 14:59:36 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 7/8] target/ppc: implement xscv[su]qqp
Date: Wed, 30 Mar 2022 14:59:31 -0300
Message-Id: <20220330175932.6995-8-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Mar 2022 17:59:36.0528 (UTC)
 FILETIME=[EB280500:01D8445F]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
xscvsqqp: VSX Scalar Convert with round Signed Quadword to
          Quad-Precision
xscvuqqp: VSX Scalar Convert with round Unsigned Quadword to
          Quad-Precision format

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c             | 12 ++++++++++++
 target/ppc/helper.h                 |  2 ++
 target/ppc/insn32.decode            |  5 +++++
 target/ppc/translate/vsx-impl.c.inc | 20 ++++++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 7e8be99cc0..97892afa95 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3058,6 +3058,18 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
 VSX_CVT_INT_TO_FP2(xvcvsxdsp, int64, float32)
 VSX_CVT_INT_TO_FP2(xvcvuxdsp, uint64, float32)
 
+#define VSX_CVT_INT128_TO_FP(op, tp)                            \
+void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)\
+{                                                               \
+    helper_reset_fpstatus(env);                                 \
+    xt->f128 = tp##_to_float128(xb->s128, &env->fp_status);     \
+    helper_compute_fprf_float128(env, xt->f128);                \
+    do_float_check_status(env, GETPC());                        \
+}
+
+VSX_CVT_INT128_TO_FP(XSCVUQQP, uint128);
+VSX_CVT_INT128_TO_FP(XSCVSQQP, int128);
+
 /*
  * VSX_CVT_INT_TO_FP_VECTOR - VSX integer to floating point conversion
  *   op    - instruction mnemonic
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 57da11c77e..7df0c01819 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -388,6 +388,8 @@ DEF_HELPER_4(xscvqpsdz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpswz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpudz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpuwz, void, env, i32, vsr, vsr)
+DEF_HELPER_3(XSCVUQQP, void, env, vsr, vsr)
+DEF_HELPER_3(XSCVSQQP, void, env, vsr, vsr)
 DEF_HELPER_3(xscvhpdp, void, env, vsr, vsr)
 DEF_HELPER_4(xscvsdqp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xscvspdp, void, env, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index ac2d3da9a7..6fb568c1fe 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -91,6 +91,9 @@
 
 @X_tp_a_bp_rc   ...... ....0 ra:5 ....0 .......... rc:1         &X_rc rt=%x_frtp rb=%x_frbp
 
+&X_tb           rt rb
+@X_tb           ...... rt:5 ..... rb:5 .......... .             &X_tb
+
 &X_tb_rc        rt rb rc:bool
 @X_tb_rc        ...... rt:5 ..... rb:5 .......... rc:1          &X_tb_rc
 
@@ -692,6 +695,8 @@ XSCMPGTQP       111111 ..... ..... ..... 0011100100 -   @X
 ## VSX Binary Floating-Point Convert Instructions
 
 XSCVQPDP        111111 ..... 10100 ..... 1101000100 .   @X_tb_rc
+XSCVUQQP        111111 ..... 00011 ..... 1101000100 -   @X_tb
+XSCVSQQP        111111 ..... 01011 ..... 1101000100 -   @X_tb
 XVCVBF16SPN     111100 ..... 10000 ..... 111011011 ..   @XX2
 XVCVSPBF16      111100 ..... 10001 ..... 111011011 ..   @XX2
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index d1f6333314..a305579ecc 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -838,6 +838,26 @@ static bool trans_XSCVQPDP(DisasContext *ctx, arg_X_tb_rc *a)
     return true;
 }
 
+static bool do_helper_env_X_tb(DisasContext *ctx, arg_X_tb *a,
+                               void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr))
+{
+    TCGv_ptr xt, xb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    xt = gen_avr_ptr(a->rt);
+    xb = gen_avr_ptr(a->rb);
+    gen_helper(cpu_env, xt, xb);
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(xb);
+
+    return true;
+}
+
+TRANS(XSCVUQQP, do_helper_env_X_tb, gen_helper_XSCVUQQP)
+TRANS(XSCVSQQP, do_helper_env_X_tb, gen_helper_XSCVSQQP)
+
 #define GEN_VSX_HELPER_2(name, op1, op2, inval, type)                         \
 static void gen_##name(DisasContext *ctx)                                     \
 {                                                                             \
-- 
2.25.1


