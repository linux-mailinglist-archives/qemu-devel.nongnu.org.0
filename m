Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792972D6F1D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 05:25:28 +0100 (CET)
Received: from localhost ([::1]:44414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knZzh-0007cq-Mu
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 23:25:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq9-0005d8-3z; Thu, 10 Dec 2020 23:15:33 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35153 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq6-0000jw-LK; Thu, 10 Dec 2020 23:15:32 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cscrb3szPz9sWm; Fri, 11 Dec 2020 15:15:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607660111;
 bh=YJ4Jigd9pqVM/AMHgPpnrIhzspdOwtzbr2NR178Pci8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W9rGj2p6Si0IW5H3xpPSDtGnMuWPq/0MxaTwXW2Yytou6ZSRM0Xhh9H9kugPzR+0j
 3tt6hLAUVamNTetGjKhJAHRDmu3A0obxuqI9ubaU59i68uxFgaMSdM/IRoAKG7H9CH
 A/GFEz4KXWbHMgTg2rD18/ulA2DI8bZeVZ9EBIRI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 10/30] ppc/translate: Fix unordered f64/f128 comparisons
Date: Fri, 11 Dec 2020 15:14:47 +1100
Message-Id: <20201211041507.425378-11-david@gibson.dropbear.id.au>
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
Cc: LemonBoy <thatlemon@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LemonBoy <thatlemon@gmail.com>

According to the PowerISA v3.1 reference, Table 68 "Actions for xscmpudp
- Part 1: Compare Unordered", whenever one of the two operands is a NaN
the SO bit is set while the other three bits are cleared.

Apply the same change to xscmpuqp.

The respective ordered counterparts are unaffected.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Message-Id: <20201112230130.65262-2-thatlemon@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/fpu_helper.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 32a9a8a0f8..6d3648f5b1 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2479,13 +2479,11 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                      \
     if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||        \
         float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {        \
         vxsnan_flag = true;                                              \
-        cc = CRF_SO;                                                     \
         if (fpscr_ve == 0 && ordered) {                                  \
             vxvc_flag = true;                                            \
         }                                                                \
     } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||     \
                float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {     \
-        cc = CRF_SO;                                                     \
         if (ordered) {                                                   \
             vxvc_flag = true;                                            \
         }                                                                \
@@ -2497,12 +2495,19 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                      \
         float_invalid_op_vxvc(env, 0, GETPC());                          \
     }                                                                    \
                                                                          \
-    if (float64_lt(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {         \
+    switch (float64_compare(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {\
+    case float_relation_less:                                            \
         cc |= CRF_LT;                                                    \
-    } else if (!float64_le(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) { \
-        cc |= CRF_GT;                                                    \
-    } else {                                                             \
+        break;                                                           \
+    case float_relation_equal:                                           \
         cc |= CRF_EQ;                                                    \
+        break;                                                           \
+    case float_relation_greater:                                         \
+        cc |= CRF_GT;                                                    \
+        break;                                                           \
+    case float_relation_unordered:                                       \
+        cc |= CRF_SO;                                                    \
+        break;                                                           \
     }                                                                    \
                                                                          \
     env->fpscr &= ~FP_FPCC;                                              \
@@ -2545,12 +2550,19 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
         float_invalid_op_vxvc(env, 0, GETPC());                         \
     }                                                                   \
                                                                         \
-    if (float128_lt(xa->f128, xb->f128, &env->fp_status)) {             \
+    switch (float128_compare(xa->f128, xb->f128, &env->fp_status)) {    \
+    case float_relation_less:                                           \
         cc |= CRF_LT;                                                   \
-    } else if (!float128_le(xa->f128, xb->f128, &env->fp_status)) {     \
-        cc |= CRF_GT;                                                   \
-    } else {                                                            \
+        break;                                                          \
+    case float_relation_equal:                                          \
         cc |= CRF_EQ;                                                   \
+        break;                                                          \
+    case float_relation_greater:                                        \
+        cc |= CRF_GT;                                                   \
+        break;                                                          \
+    case float_relation_unordered:                                      \
+        cc |= CRF_SO;                                                   \
+        break;                                                          \
     }                                                                   \
                                                                         \
     env->fpscr &= ~FP_FPCC;                                             \
-- 
2.29.2


