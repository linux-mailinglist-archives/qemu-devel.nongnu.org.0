Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC692D6F1C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 05:25:00 +0100 (CET)
Received: from localhost ([::1]:42894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knZzH-0006s5-Gq
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 23:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq9-0005dY-RY; Thu, 10 Dec 2020 23:15:33 -0500
Received: from ozlabs.org ([203.11.71.1]:38183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq6-0000kB-KN; Thu, 10 Dec 2020 23:15:33 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cscrb4wjYz9sWr; Fri, 11 Dec 2020 15:15:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607660111;
 bh=17cTpbz/QhNvG4fokN1yrwIa9P/Ftht4ag1uIyHuKAQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R/2H3BO5l+oQb7X0U2jwnzAjUPnfwGwhvncBU9ZHE02hzHpYr0NdGCOpbmiLg9nzb
 GfuBGKj3tKlhO4QgPy9agscPFIyVMlcUuHfGTMH4XxcJvC7sHRfR1MDkuz2qIrg7kx
 DIYW6ExfVlStFCK0nKUYZgh7txLbKeKp0hbZ44mU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 11/30] ppc/translate: Turn the helper macros into functions
Date: Fri, 11 Dec 2020 15:14:48 +1100
Message-Id: <20201211041507.425378-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211041507.425378-1-david@gibson.dropbear.id.au>
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: LemonBoy <thatlemon@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LemonBoy <thatlemon@gmail.com>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201112230130.65262-3-thatlemon@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/fpu_helper.c | 228 ++++++++++++++++++++++------------------
 1 file changed, 123 insertions(+), 105 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 6d3648f5b1..34f5bc1f3c 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2467,113 +2467,131 @@ void helper_xscmpexpqp(CPUPPCState *env, uint32_t opcode,
     do_float_check_status(env, GETPC());
 }
 
-#define VSX_SCALAR_CMP(op, ordered)                                      \
-void helper_##op(CPUPPCState *env, uint32_t opcode,                      \
-                 ppc_vsr_t *xa, ppc_vsr_t *xb)                           \
-{                                                                        \
-    uint32_t cc = 0;                                                     \
-    bool vxsnan_flag = false, vxvc_flag = false;                         \
-                                                                         \
-    helper_reset_fpstatus(env);                                          \
-                                                                         \
-    if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||        \
-        float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {        \
-        vxsnan_flag = true;                                              \
-        if (fpscr_ve == 0 && ordered) {                                  \
-            vxvc_flag = true;                                            \
-        }                                                                \
-    } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||     \
-               float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {     \
-        if (ordered) {                                                   \
-            vxvc_flag = true;                                            \
-        }                                                                \
-    }                                                                    \
-    if (vxsnan_flag) {                                                   \
-        float_invalid_op_vxsnan(env, GETPC());                           \
-    }                                                                    \
-    if (vxvc_flag) {                                                     \
-        float_invalid_op_vxvc(env, 0, GETPC());                          \
-    }                                                                    \
-                                                                         \
-    switch (float64_compare(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {\
-    case float_relation_less:                                            \
-        cc |= CRF_LT;                                                    \
-        break;                                                           \
-    case float_relation_equal:                                           \
-        cc |= CRF_EQ;                                                    \
-        break;                                                           \
-    case float_relation_greater:                                         \
-        cc |= CRF_GT;                                                    \
-        break;                                                           \
-    case float_relation_unordered:                                       \
-        cc |= CRF_SO;                                                    \
-        break;                                                           \
-    }                                                                    \
-                                                                         \
-    env->fpscr &= ~FP_FPCC;                                              \
-    env->fpscr |= cc << FPSCR_FPCC;                                      \
-    env->crf[BF(opcode)] = cc;                                           \
-                                                                         \
-    do_float_check_status(env, GETPC());                                 \
-}
-
-VSX_SCALAR_CMP(xscmpodp, 1)
-VSX_SCALAR_CMP(xscmpudp, 0)
-
-#define VSX_SCALAR_CMPQ(op, ordered)                                    \
-void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
-                 ppc_vsr_t *xa, ppc_vsr_t *xb)                          \
-{                                                                       \
-    uint32_t cc = 0;                                                    \
-    bool vxsnan_flag = false, vxvc_flag = false;                        \
-                                                                        \
-    helper_reset_fpstatus(env);                                         \
-                                                                        \
-    if (float128_is_signaling_nan(xa->f128, &env->fp_status) ||         \
-        float128_is_signaling_nan(xb->f128, &env->fp_status)) {         \
-        vxsnan_flag = true;                                             \
-        cc = CRF_SO;                                                    \
-        if (fpscr_ve == 0 && ordered) {                                 \
-            vxvc_flag = true;                                           \
-        }                                                               \
-    } else if (float128_is_quiet_nan(xa->f128, &env->fp_status) ||      \
-               float128_is_quiet_nan(xb->f128, &env->fp_status)) {      \
-        cc = CRF_SO;                                                    \
-        if (ordered) {                                                  \
-            vxvc_flag = true;                                           \
-        }                                                               \
-    }                                                                   \
-    if (vxsnan_flag) {                                                  \
-        float_invalid_op_vxsnan(env, GETPC());                          \
-    }                                                                   \
-    if (vxvc_flag) {                                                    \
-        float_invalid_op_vxvc(env, 0, GETPC());                         \
-    }                                                                   \
-                                                                        \
-    switch (float128_compare(xa->f128, xb->f128, &env->fp_status)) {    \
-    case float_relation_less:                                           \
-        cc |= CRF_LT;                                                   \
-        break;                                                          \
-    case float_relation_equal:                                          \
-        cc |= CRF_EQ;                                                   \
-        break;                                                          \
-    case float_relation_greater:                                        \
-        cc |= CRF_GT;                                                   \
-        break;                                                          \
-    case float_relation_unordered:                                      \
-        cc |= CRF_SO;                                                   \
-        break;                                                          \
-    }                                                                   \
-                                                                        \
-    env->fpscr &= ~FP_FPCC;                                             \
-    env->fpscr |= cc << FPSCR_FPCC;                                     \
-    env->crf[BF(opcode)] = cc;                                          \
-                                                                        \
-    do_float_check_status(env, GETPC());                                \
+static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
+                                 int crf_idx, bool ordered)
+{
+    uint32_t cc;
+    bool vxsnan_flag = false, vxvc_flag = false;
+
+    helper_reset_fpstatus(env);
+
+    if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||
+        float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {
+        vxsnan_flag = true;
+        if (fpscr_ve == 0 && ordered) {
+            vxvc_flag = true;
+        }
+    } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||
+               float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {
+        if (ordered) {
+            vxvc_flag = true;
+        }
+    }
+    if (vxsnan_flag) {
+        float_invalid_op_vxsnan(env, GETPC());
+    }
+    if (vxvc_flag) {
+        float_invalid_op_vxvc(env, 0, GETPC());
+    }
+
+    switch (float64_compare(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {
+    case float_relation_less:
+        cc = CRF_LT;
+        break;
+    case float_relation_equal:
+        cc = CRF_EQ;
+        break;
+    case float_relation_greater:
+        cc = CRF_GT;
+        break;
+    case float_relation_unordered:
+        cc = CRF_SO;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    env->fpscr &= ~FP_FPCC;
+    env->fpscr |= cc << FPSCR_FPCC;
+    env->crf[crf_idx] = cc;
+
+    do_float_check_status(env, GETPC());
+}
+
+void helper_xscmpodp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
+                     ppc_vsr_t *xb)
+{
+    do_scalar_cmp(env, xa, xb, BF(opcode), true);
+}
+
+void helper_xscmpudp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
+                     ppc_vsr_t *xb)
+{
+    do_scalar_cmp(env, xa, xb, BF(opcode), false);
+}
+
+static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
+                                  ppc_vsr_t *xb, int crf_idx, bool ordered)
+{
+    uint32_t cc;
+    bool vxsnan_flag = false, vxvc_flag = false;
+
+    helper_reset_fpstatus(env);
+
+    if (float128_is_signaling_nan(xa->f128, &env->fp_status) ||
+        float128_is_signaling_nan(xb->f128, &env->fp_status)) {
+        vxsnan_flag = true;
+        if (fpscr_ve == 0 && ordered) {
+            vxvc_flag = true;
+        }
+    } else if (float128_is_quiet_nan(xa->f128, &env->fp_status) ||
+               float128_is_quiet_nan(xb->f128, &env->fp_status)) {
+        if (ordered) {
+            vxvc_flag = true;
+        }
+    }
+    if (vxsnan_flag) {
+        float_invalid_op_vxsnan(env, GETPC());
+    }
+    if (vxvc_flag) {
+        float_invalid_op_vxvc(env, 0, GETPC());
+    }
+
+    switch (float128_compare(xa->f128, xb->f128, &env->fp_status)) {
+    case float_relation_less:
+        cc = CRF_LT;
+        break;
+    case float_relation_equal:
+        cc = CRF_EQ;
+        break;
+    case float_relation_greater:
+        cc = CRF_GT;
+        break;
+    case float_relation_unordered:
+        cc = CRF_SO;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    env->fpscr &= ~FP_FPCC;
+    env->fpscr |= cc << FPSCR_FPCC;
+    env->crf[crf_idx] = cc;
+
+    do_float_check_status(env, GETPC());
 }
 
-VSX_SCALAR_CMPQ(xscmpoqp, 1)
-VSX_SCALAR_CMPQ(xscmpuqp, 0)
+void helper_xscmpoqp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
+                     ppc_vsr_t *xb)
+{
+    do_scalar_cmpq(env, xa, xb, BF(opcode), true);
+}
+
+void helper_xscmpuqp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
+                     ppc_vsr_t *xb)
+{
+    do_scalar_cmpq(env, xa, xb, BF(opcode), false);
+}
 
 /*
  * VSX_MAX_MIN - VSX floating point maximum/minimum
-- 
2.29.2


