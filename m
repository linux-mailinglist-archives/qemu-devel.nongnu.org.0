Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF3A4AA05B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 20:47:27 +0100 (CET)
Received: from localhost ([::1]:55694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG4YI-0003n1-Ho
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 14:47:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nG3C9-0006Ct-Tm; Fri, 04 Feb 2022 13:20:31 -0500
Received: from [187.72.171.209] (port=36849 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nG3C2-0000bg-VV; Fri, 04 Feb 2022 13:20:29 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 4 Feb 2022 15:20:16 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 1C11580030A;
 Fri,  4 Feb 2022 15:20:16 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH] target/ppc: Change VSX instructions behavior to fill with
 zeros
Date: Fri,  4 Feb 2022 15:19:44 -0300
Message-Id: <20220204181944.65063-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Feb 2022 18:20:16.0572 (UTC)
 FILETIME=[DBF937C0:01D819F3]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
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
Cc: danielhb413@gmail.com, groug@kaod.org, victor.colombo@eldorado.org.br,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ISA v3.1 changed some VSX instructions behavior by changing what the
other words/doubleword in the result should contain when the result is
only one word/doubleword. e.g. xsmaxdp operates on doubleword 0 and
saves the result also in doubleword 0.
Before, the second doubleword result was undefined according to the
ISA, but now it's stated that it should be zeroed.

Even tough the result was undefined before, hardware implementing these
instructions already filled these fields with 0s. Changing every ISA
version in QEMU to this behavior makes the results match what happens
in hardware.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>

---

This patch is a proposal on a previous RFC I sent on this topic [1].
I preferred this approach because it makes QEMU behavior closer to the
real hardware.

The affected instructions have the following note in the ISA:

"""
Previous versions of the architecture allowed the
contents of doubleword 1 of the result register to be
undefined. However, all processors that support
this instruction write 0s into doubleword 1 of the
result register, as is required by this version of the
architecture.
"""

This patch is not exhaustive as
1. some instructions that had its behavior changed are not 'corrected'
    by this patch (mostly multiply-add instructions);
2. some instructions changed the behavior to also replicate the result
    in the other word from the doubleword if the result is a single
    word e.g. xscvdpuxws. So, this patch only focus on the 'zeroing'
    part, not the replication;

Best regards,

-- Víctor

[1] https://lists.gnu.org/archive/html/qemu-ppc/2021-12/msg00198.html
---
 target/ppc/fpu_helper.c             | 26 +++++++++++++-------------
 target/ppc/translate/vsx-impl.c.inc |  4 +++-
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index e5c29b53b8..bd76bee7f1 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -1696,7 +1696,7 @@ uint32_t helper_efdcmpeq(CPUPPCState *env, uint64_t op1, uint64_t op2)
 void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                          \
                    ppc_vsr_t *xa, ppc_vsr_t *xb)                             \
 {                                                                            \
-    ppc_vsr_t t = *xt;                                                       \
+    ppc_vsr_t t = { };                                                       \
     int i;                                                                   \
                                                                              \
     helper_reset_fpstatus(env);                                              \
@@ -1772,7 +1772,7 @@ void helper_xsaddqp(CPUPPCState *env, uint32_t opcode,
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                            \
                  ppc_vsr_t *xa, ppc_vsr_t *xb)                               \
 {                                                                            \
-    ppc_vsr_t t = *xt;                                                       \
+    ppc_vsr_t t = { };                                                       \
     int i;                                                                   \
                                                                              \
     helper_reset_fpstatus(env);                                              \
@@ -1843,7 +1843,7 @@ void helper_xsmulqp(CPUPPCState *env, uint32_t opcode,
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
                  ppc_vsr_t *xa, ppc_vsr_t *xb)                                \
 {                                                                             \
-    ppc_vsr_t t = *xt;                                                        \
+    ppc_vsr_t t = { };                                                        \
     int i;                                                                    \
                                                                               \
     helper_reset_fpstatus(env);                                               \
@@ -1919,7 +1919,7 @@ void helper_xsdivqp(CPUPPCState *env, uint32_t opcode,
 #define VSX_RE(op, nels, tp, fld, sfprf, r2sp)                                \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)              \
 {                                                                             \
-    ppc_vsr_t t = *xt;                                                        \
+    ppc_vsr_t t = { };                                                        \
     int i;                                                                    \
                                                                               \
     helper_reset_fpstatus(env);                                               \
@@ -1959,7 +1959,7 @@ VSX_RE(xvresp, 4, float32, VsrW(i), 0, 0)
 #define VSX_SQRT(op, nels, tp, fld, sfprf, r2sp)                             \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
-    ppc_vsr_t t = *xt;                                                       \
+    ppc_vsr_t t = { };                                                       \
     int i;                                                                   \
                                                                              \
     helper_reset_fpstatus(env);                                              \
@@ -2004,7 +2004,7 @@ VSX_SQRT(xvsqrtsp, 4, float32, VsrW(i), 0, 0)
 #define VSX_RSQRTE(op, nels, tp, fld, sfprf, r2sp)                           \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
-    ppc_vsr_t t = *xt;                                                       \
+    ppc_vsr_t t = { };                                                       \
     int i;                                                                   \
                                                                              \
     helper_reset_fpstatus(env);                                              \
@@ -2472,7 +2472,7 @@ void helper_xscmpuqp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
 void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                           \
                    ppc_vsr_t *xa, ppc_vsr_t *xb)                              \
 {                                                                             \
-    ppc_vsr_t t = *xt;                                                        \
+    ppc_vsr_t t = { };                                                        \
     int i;                                                                    \
                                                                               \
     for (i = 0; i < nels; i++) {                                              \
@@ -2498,7 +2498,7 @@ VSX_MAX_MIN(xvminsp, minnum, 4, float32, VsrW(i))
 void helper_##name(CPUPPCState *env,                                          \
                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)               \
 {                                                                             \
-    ppc_vsr_t t = *xt;                                                        \
+    ppc_vsr_t t = { };                                                        \
     bool vxsnan_flag = false, vex_flag = false;                               \
                                                                               \
     if (unlikely(float64_is_any_nan(xa->VsrD(0)) ||                           \
@@ -2533,7 +2533,7 @@ VSX_MAX_MINC(xsmincdp, 0);
 void helper_##name(CPUPPCState *env,                                          \
                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)               \
 {                                                                             \
-    ppc_vsr_t t = *xt;                                                        \
+    ppc_vsr_t t = { };                                                        \
     bool vxsnan_flag = false, vex_flag = false;                               \
                                                                               \
     if (unlikely(float64_is_any_nan(xa->VsrD(0)))) {                          \
@@ -2654,7 +2654,7 @@ VSX_CMP(xvcmpnesp, 4, float32, VsrW(i), eq, 0, 0)
 #define VSX_CVT_FP_TO_FP(op, nels, stp, ttp, sfld, tfld, sfprf)    \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
 {                                                                  \
-    ppc_vsr_t t = *xt;                                             \
+    ppc_vsr_t t = { };                                             \
     int i;                                                         \
                                                                    \
     for (i = 0; i < nels; i++) {                                   \
@@ -2833,7 +2833,7 @@ uint64_t helper_xscvspdpn(CPUPPCState *env, uint64_t xb)
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
     int all_flags = env->fp_status.float_exception_flags, flags;             \
-    ppc_vsr_t t = *xt;                                                       \
+    ppc_vsr_t t = { };                                                       \
     int i;                                                                   \
                                                                              \
     for (i = 0; i < nels; i++) {                                             \
@@ -2917,7 +2917,7 @@ VSX_CVT_FP_TO_INT_VECTOR(xscvqpuwz, float128, uint32, f128, VsrD(0), 0x0ULL)
 #define VSX_CVT_INT_TO_FP(op, nels, stp, ttp, sfld, tfld, sfprf, r2sp)  \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
 {                                                                       \
-    ppc_vsr_t t = *xt;                                                  \
+    ppc_vsr_t t = { };                                                  \
     int i;                                                              \
                                                                         \
     for (i = 0; i < nels; i++) {                                        \
@@ -2990,7 +2990,7 @@ VSX_CVT_INT_TO_FP_VECTOR(xscvudqp, uint64, float128, VsrD(0), f128)
 #define VSX_ROUND(op, nels, tp, fld, rmode, sfprf)                     \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
 {                                                                      \
-    ppc_vsr_t t = *xt;                                                 \
+    ppc_vsr_t t = { };                                                 \
     int i;                                                             \
     FloatRoundMode curr_rounding_mode;                                 \
                                                                        \
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index c636e38164..128968b5e7 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -747,6 +747,7 @@ static void glue(gen_, name)(DisasContext *ctx)                   \
             }                                                     \
         }                                                         \
         set_cpu_vsr(xT(ctx->opcode), xb, true);                   \
+        set_cpu_vsr(xT(ctx->opcode), tcg_constant_i64(0), false); \
         tcg_temp_free_i64(xb);                                    \
         tcg_temp_free_i64(sgm);                                   \
     }
@@ -1073,6 +1074,7 @@ static void gen_##name(DisasContext *ctx)                     \
     get_cpu_vsr(t0, xB(ctx->opcode), true);                   \
     gen_helper_##name(t1, cpu_env, t0);                       \
     set_cpu_vsr(xT(ctx->opcode), t1, true);                   \
+    set_cpu_vsr(xT(ctx->opcode), tcg_constant_i64(0), false); \
     tcg_temp_free_i64(t0);                                    \
     tcg_temp_free_i64(t1);                                    \
 }
@@ -1700,7 +1702,7 @@ static void gen_xsiexpdp(DisasContext *ctx)
     tcg_gen_shli_i64(t0, t0, 52);
     tcg_gen_or_i64(xth, xth, t0);
     set_cpu_vsr(xT(ctx->opcode), xth, true);
-    /* dword[1] is undefined */
+    set_cpu_vsr(xT(ctx->opcode), tcg_constant_i64(0), false);
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(xth);
 }
-- 
2.25.1


