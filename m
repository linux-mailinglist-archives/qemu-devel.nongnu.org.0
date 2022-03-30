Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93D04ECB78
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:12:24 +0200 (CEST)
Received: from localhost ([::1]:55368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcnv-0006pC-Tm
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:12:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbt-0000yY-Qs; Wed, 30 Mar 2022 13:59:57 -0400
Received: from [187.72.171.209] (port=21948 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbs-0004ik-5b; Wed, 30 Mar 2022 13:59:57 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 30 Mar 2022 14:59:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7E5E38002AF;
 Wed, 30 Mar 2022 14:59:36 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 8/8] target/ppc: implement xscvqp[su]qz
Date: Wed, 30 Mar 2022 14:59:32 -0300
Message-Id: <20220330175932.6995-9-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Mar 2022 17:59:36.0872 (UTC)
 FILETIME=[EB5C8280:01D8445F]
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
xscvqpsqz: VSX Scalar Convert with round to zero Quad-Precision to
           Signed Quadword
xscvqpuqz: VSX Scalar Convert with round to zero Quad-Precision to
           Unsigned Quadword

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c             | 21 +++++++++++++++++++++
 target/ppc/helper.h                 |  2 ++
 target/ppc/insn32.decode            |  2 ++
 target/ppc/translate/vsx-impl.c.inc |  2 ++
 4 files changed, 27 insertions(+)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 97892afa95..99281cc37a 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2925,6 +2925,27 @@ VSX_CVT_FP_TO_INT(xvcvspsxws, 4, float32, int32, VsrW(i), VsrW(i), 0x80000000U)
 VSX_CVT_FP_TO_INT(xvcvspuxds, 2, float32, uint64, VsrW(2 * i), VsrD(i), 0ULL)
 VSX_CVT_FP_TO_INT(xvcvspuxws, 4, float32, uint32, VsrW(i), VsrW(i), 0U)
 
+#define VSX_CVT_FP_TO_INT128(op, tp, rnan)                                     \
+void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)               \
+{                                                                              \
+    ppc_vsr_t t;                                                               \
+    int flags;                                                                 \
+                                                                               \
+    helper_reset_fpstatus(env);                                                \
+    t.s128 = float128_to_##tp##_round_to_zero(xb->f128, &env->fp_status);      \
+    flags = get_float_exception_flags(&env->fp_status);                        \
+    if (unlikely(flags & float_flag_invalid)) {                                \
+        t.VsrD(0) = float_invalid_cvt(env, flags, t.VsrD(0), rnan, 0, GETPC());\
+        t.VsrD(1) = -(t.VsrD(0) & 1);                                          \
+    }                                                                          \
+                                                                               \
+    *xt = t;                                                                   \
+    do_float_check_status(env, GETPC());                                       \
+}
+
+VSX_CVT_FP_TO_INT128(XSCVQPUQZ, uint128, 0)
+VSX_CVT_FP_TO_INT128(XSCVQPSQZ, int128, 0x8000000000000000ULL);
+
 /*
  * Likewise, except that the result is duplicated into both subwords.
  * Power ISA v3.1 has Programming Notes for these insns:
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 7df0c01819..aa6773c4a5 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -388,6 +388,8 @@ DEF_HELPER_4(xscvqpsdz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpswz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpudz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpuwz, void, env, i32, vsr, vsr)
+DEF_HELPER_3(XSCVQPUQZ, void, env, vsr, vsr)
+DEF_HELPER_3(XSCVQPSQZ, void, env, vsr, vsr)
 DEF_HELPER_3(XSCVUQQP, void, env, vsr, vsr)
 DEF_HELPER_3(XSCVSQQP, void, env, vsr, vsr)
 DEF_HELPER_3(xscvhpdp, void, env, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6fb568c1fe..39372fe673 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -695,6 +695,8 @@ XSCMPGTQP       111111 ..... ..... ..... 0011100100 -   @X
 ## VSX Binary Floating-Point Convert Instructions
 
 XSCVQPDP        111111 ..... 10100 ..... 1101000100 .   @X_tb_rc
+XSCVQPUQZ       111111 ..... 00000 ..... 1101000100 -   @X_tb
+XSCVQPSQZ       111111 ..... 01000 ..... 1101000100 -   @X_tb
 XSCVUQQP        111111 ..... 00011 ..... 1101000100 -   @X_tb
 XSCVSQQP        111111 ..... 01011 ..... 1101000100 -   @X_tb
 XVCVBF16SPN     111100 ..... 10000 ..... 111011011 ..   @XX2
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index a305579ecc..6e8a3342dc 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -857,6 +857,8 @@ static bool do_helper_env_X_tb(DisasContext *ctx, arg_X_tb *a,
 
 TRANS(XSCVUQQP, do_helper_env_X_tb, gen_helper_XSCVUQQP)
 TRANS(XSCVSQQP, do_helper_env_X_tb, gen_helper_XSCVSQQP)
+TRANS(XSCVQPUQZ, do_helper_env_X_tb, gen_helper_XSCVQPUQZ)
+TRANS(XSCVQPSQZ, do_helper_env_X_tb, gen_helper_XSCVQPSQZ)
 
 #define GEN_VSX_HELPER_2(name, op1, op2, inval, type)                         \
 static void gen_##name(DisasContext *ctx)                                     \
-- 
2.25.1


