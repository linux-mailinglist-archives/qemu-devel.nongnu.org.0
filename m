Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A5F475E51
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:14:59 +0100 (CET)
Received: from localhost ([::1]:41652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXrm-0004KQ-MK
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:14:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcN-00058O-5P
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:03 -0500
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:60203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcH-0003UD-IB
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.158])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2FBE82110E;
 Wed, 15 Dec 2021 16:58:54 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:58:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00102528941-e603-4887-86fb-0480bcae4db3,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL 003/102] target/ppc: Fixed call to deferred exception
Date: Wed, 15 Dec 2021 17:57:08 +0100
Message-ID: <20211215165847.321042-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215165847.321042-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b8355480-cdc3-41b2-aa54-d868016273eb
X-Ovh-Tracer-Id: 2219711670083816230
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20211201163808.440385-2-lucas.araujo@eldorado.org.br>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                |  1 +
 target/ppc/fpu_helper.c            | 48 ++++++++++++++++++++++++++++++
 target/ppc/translate/fp-impl.c.inc |  9 ++----
 3 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 627811cefc98..632a81c6766f 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -63,6 +63,7 @@ DEF_HELPER_FLAGS_1(cntlzw32, TCG_CALL_NO_RWG_SE, i32, i32)
 DEF_HELPER_FLAGS_2(brinc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 DEF_HELPER_1(float_check_status, void, env)
+DEF_HELPER_1(fpscr_check_status, void, env)
 DEF_HELPER_1(reset_fpstatus, void, env)
 DEF_HELPER_2(compute_fprf_float64, void, env, i64)
 DEF_HELPER_3(store_fpscr, void, env, i64, i32)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index c4896cecc80c..bb72715827c3 100644
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
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index c9e05201d9e7..8afd6a087d1d 100644
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


