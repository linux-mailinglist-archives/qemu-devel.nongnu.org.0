Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CFC2D925A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:00:50 +0100 (CET)
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kofyb-0007hN-Ku
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwR-0005Cb-3v; Sun, 13 Dec 2020 23:58:35 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41115 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwP-0004qn-6h; Sun, 13 Dec 2020 23:58:34 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfr4Kq5z9sVx; Mon, 14 Dec 2020 15:58:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921892;
 bh=DKCYJcfwqcpDrB5bFBgyrgn/tL2ij0jVnE7WbNZkSUo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kzu8UI13qBFK/NtXJt/KMnI4BA2wKg3fLcvaA1PtxS5CcwEoHmpLdt1SBFbKbKfjr
 DrEO0twZSUuCOc09tOOj3scbd0UoLqU+djX3YmWqKuqjp/M8WPe6egEMp526Mb1LE0
 Nsp0jCuA/IfnLg6eWcFc89pXD/xpeg7l8tNG1eF0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 12/30] ppc/translate: Delay NaN checking after comparison
Date: Mon, 14 Dec 2020 15:57:49 +1100
Message-Id: <20201214045807.41003-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Giuseppe Musacchio <thatlemon@gmail.com>

Since we always perform a comparison between the two operands avoid
checking for NaN unless the result states they're unordered.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201112230130.65262-4-thatlemon@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/fpu_helper.c | 80 +++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 34f5bc1f3c..f5a4be595a 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2475,25 +2475,6 @@ static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
 
     helper_reset_fpstatus(env);
 
-    if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||
-        float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {
-        vxsnan_flag = true;
-        if (fpscr_ve == 0 && ordered) {
-            vxvc_flag = true;
-        }
-    } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||
-               float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {
-        if (ordered) {
-            vxvc_flag = true;
-        }
-    }
-    if (vxsnan_flag) {
-        float_invalid_op_vxsnan(env, GETPC());
-    }
-    if (vxvc_flag) {
-        float_invalid_op_vxvc(env, 0, GETPC());
-    }
-
     switch (float64_compare(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {
     case float_relation_less:
         cc = CRF_LT;
@@ -2506,6 +2487,27 @@ static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
         break;
     case float_relation_unordered:
         cc = CRF_SO;
+
+        if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||
+            float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {
+            vxsnan_flag = true;
+            if (fpscr_ve == 0 && ordered) {
+                vxvc_flag = true;
+            }
+        } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||
+                   float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {
+            if (ordered) {
+                vxvc_flag = true;
+            }
+        }
+
+        if (vxsnan_flag) {
+            float_invalid_op_vxsnan(env, GETPC());
+        }
+        if (vxvc_flag) {
+            float_invalid_op_vxvc(env, 0, GETPC());
+        }
+
         break;
     default:
         g_assert_not_reached();
@@ -2538,25 +2540,6 @@ static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
 
     helper_reset_fpstatus(env);
 
-    if (float128_is_signaling_nan(xa->f128, &env->fp_status) ||
-        float128_is_signaling_nan(xb->f128, &env->fp_status)) {
-        vxsnan_flag = true;
-        if (fpscr_ve == 0 && ordered) {
-            vxvc_flag = true;
-        }
-    } else if (float128_is_quiet_nan(xa->f128, &env->fp_status) ||
-               float128_is_quiet_nan(xb->f128, &env->fp_status)) {
-        if (ordered) {
-            vxvc_flag = true;
-        }
-    }
-    if (vxsnan_flag) {
-        float_invalid_op_vxsnan(env, GETPC());
-    }
-    if (vxvc_flag) {
-        float_invalid_op_vxvc(env, 0, GETPC());
-    }
-
     switch (float128_compare(xa->f128, xb->f128, &env->fp_status)) {
     case float_relation_less:
         cc = CRF_LT;
@@ -2569,6 +2552,27 @@ static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
         break;
     case float_relation_unordered:
         cc = CRF_SO;
+
+        if (float128_is_signaling_nan(xa->f128, &env->fp_status) ||
+            float128_is_signaling_nan(xb->f128, &env->fp_status)) {
+            vxsnan_flag = true;
+            if (fpscr_ve == 0 && ordered) {
+                vxvc_flag = true;
+            }
+        } else if (float128_is_quiet_nan(xa->f128, &env->fp_status) ||
+                   float128_is_quiet_nan(xb->f128, &env->fp_status)) {
+            if (ordered) {
+                vxvc_flag = true;
+            }
+        }
+
+        if (vxsnan_flag) {
+            float_invalid_op_vxsnan(env, GETPC());
+        }
+        if (vxvc_flag) {
+            float_invalid_op_vxvc(env, 0, GETPC());
+        }
+
         break;
     default:
         g_assert_not_reached();
-- 
2.29.2


