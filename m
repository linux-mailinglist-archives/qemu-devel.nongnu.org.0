Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A02245CB1C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 18:35:52 +0100 (CET)
Received: from localhost ([::1]:57684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpwBT-0004Hx-6B
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 12:35:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mpw2e-0000i0-Iv; Wed, 24 Nov 2021 12:26:44 -0500
Received: from [201.28.113.2] (port=53237 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mpw2c-0008FR-TY; Wed, 24 Nov 2021 12:26:44 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 24 Nov 2021 14:25:29 -0300
Received: from eldorado.org.br (unknown [10.10.71.29])
 by power9a (Postfix) with ESMTP id C9319800A92;
 Wed, 24 Nov 2021 14:25:29 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 1/3] target/ppc: Fixed call to deferred exception
Date: Wed, 24 Nov 2021 14:25:21 -0300
Message-Id: <20211124172523.3598396-2-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211124172523.3598396-1-lucas.araujo@eldorado.org.br>
References: <20211124172523.3598396-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Nov 2021 17:25:29.0961 (UTC)
 FILETIME=[47422D90:01D7E158]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 pc@us.ibm.com, david@gibson.dropbear.id.au, matheus.ferst@eldorado.org.br,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mtfsf, mtfsfi and mtfsb1 instructions call helper_float_check_status
after updating the value of FPSCR, but helper_float_check_status
checks fp_status and fp_status isn't updated based on FPSCR and
since the value of fp_status is reset earlier in the instruction,
it's always 0.

Because of this helper_float_check_status would change the FI bit to 0
as this bit checks if the last operation was inexact and
float_flag_inexact is always 0.

These instructions also don't throw exceptions correctly since
helper_float_check_status throw exceptions based on fp_status.

This commit created a new helper, helper_fpscr_check_status that checks
FPSCR value instead of fp_status and checks for a larger variety of
exceptions than do_float_check_status.

Since fp_status isn't used, gen_reset_fpstatus() was removed.

The hardware used to compare QEMU's behavior to was a Power9.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/fpu_helper.c            | 48 ++++++++++++++++++++++++++++++
 target/ppc/helper.h                |  1 +
 target/ppc/translate/fp-impl.c.inc |  9 ++----
 3 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index c4896cecc8..bb72715827 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -414,6 +414,54 @@ void helper_store_fpscr(CPUPPCState *env, uint64_t val, uint32_t nibbles)
     ppc_store_fpscr(env, val);
 }
 
+void helper_fpscr_check_status(CPUPPCState *env)
+{
+    CPUState *cs = env_cpu(env);
+    target_ulong fpscr = env->fpscr;
+    int error = 0;
+
+    if ((fpscr & FP_OX) && (fpscr & FP_OE)) {
+        error = POWERPC_EXCP_FP_OX;
+    } else if ((fpscr & FP_UX) && (fpscr & FP_UE)) {
+        error = POWERPC_EXCP_FP_UX;
+    } else if ((fpscr & FP_XX) && (fpscr & FP_XE)) {
+        error = POWERPC_EXCP_FP_XX;
+    } else if ((fpscr & FP_ZX) && (fpscr & FP_ZE)) {
+        error = POWERPC_EXCP_FP_ZX;
+    } else if (fpscr & FP_VE) {
+        if (fpscr & FP_VXSOFT) {
+            error = POWERPC_EXCP_FP_VXSOFT;
+        } else if (fpscr & FP_VXSNAN) {
+            error = POWERPC_EXCP_FP_VXSNAN;
+        } else if (fpscr & FP_VXISI) {
+            error = POWERPC_EXCP_FP_VXISI;
+        } else if (fpscr & FP_VXIDI) {
+            error = POWERPC_EXCP_FP_VXIDI;
+        } else if (fpscr & FP_VXZDZ) {
+            error = POWERPC_EXCP_FP_VXZDZ;
+        } else if (fpscr & FP_VXIMZ) {
+            error = POWERPC_EXCP_FP_VXIMZ;
+        } else if (fpscr & FP_VXVC) {
+            error = POWERPC_EXCP_FP_VXVC;
+        } else if (fpscr & FP_VXSQRT) {
+            error = POWERPC_EXCP_FP_VXSQRT;
+        } else if (fpscr & FP_VXCVI) {
+            error = POWERPC_EXCP_FP_VXCVI;
+        } else {
+            return;
+        }
+    } else {
+        return;
+    }
+    cs->exception_index = POWERPC_EXCP_PROGRAM;
+    env->error_code = error | POWERPC_EXCP_FP;
+    /* Deferred floating-point exception after target FPSCR update */
+    if (fp_exceptions_enabled(env)) {
+        raise_exception_err_ra(env, cs->exception_index,
+                               env->error_code, GETPC());
+    }
+}
+
 static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
 {
     CPUState *cs = env_cpu(env);
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 627811cefc..632a81c676 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -63,6 +63,7 @@ DEF_HELPER_FLAGS_1(cntlzw32, TCG_CALL_NO_RWG_SE, i32, i32)
 DEF_HELPER_FLAGS_2(brinc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 DEF_HELPER_1(float_check_status, void, env)
+DEF_HELPER_1(fpscr_check_status, void, env)
 DEF_HELPER_1(reset_fpstatus, void, env)
 DEF_HELPER_2(compute_fprf_float64, void, env, i64)
 DEF_HELPER_3(store_fpscr, void, env, i64, i32)
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index d1dbb1b96b..ca195fd9d2 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -769,7 +769,6 @@ static void gen_mtfsb1(DisasContext *ctx)
         return;
     }
     crb = 31 - crbD(ctx->opcode);
-    gen_reset_fpstatus();
     /* XXX: we pretend we can only do IEEE floating-point computations */
     if (likely(crb != FPSCR_FEX && crb != FPSCR_VX && crb != FPSCR_NI)) {
         TCGv_i32 t0;
@@ -782,7 +781,7 @@ static void gen_mtfsb1(DisasContext *ctx)
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
     /* We can raise a deferred exception */
-    gen_helper_float_check_status(cpu_env);
+    gen_helper_fpscr_check_status(cpu_env);
 }
 
 /* mtfsf */
@@ -803,7 +802,6 @@ static void gen_mtfsf(DisasContext *ctx)
         gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
         return;
     }
-    gen_reset_fpstatus();
     if (l) {
         t0 = tcg_const_i32((ctx->insns_flags2 & PPC2_ISA205) ? 0xffff : 0xff);
     } else {
@@ -818,7 +816,7 @@ static void gen_mtfsf(DisasContext *ctx)
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
     /* We can raise a deferred exception */
-    gen_helper_float_check_status(cpu_env);
+    gen_helper_fpscr_check_status(cpu_env);
     tcg_temp_free_i64(t1);
 }
 
@@ -840,7 +838,6 @@ static void gen_mtfsfi(DisasContext *ctx)
         return;
     }
     sh = (8 * w) + 7 - bf;
-    gen_reset_fpstatus();
     t0 = tcg_const_i64(((uint64_t)FPIMM(ctx->opcode)) << (4 * sh));
     t1 = tcg_const_i32(1 << sh);
     gen_helper_store_fpscr(cpu_env, t0, t1);
@@ -851,7 +848,7 @@ static void gen_mtfsfi(DisasContext *ctx)
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
     /* We can raise a deferred exception */
-    gen_helper_float_check_status(cpu_env);
+    gen_helper_fpscr_check_status(cpu_env);
 }
 
 static void gen_qemu_ld32fs(DisasContext *ctx, TCGv_i64 dest, TCGv addr)
-- 
2.31.1


