Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A360B5D6A3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 21:10:49 +0200 (CEST)
Received: from localhost ([::1]:56404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiOAy-0002Eu-Sq
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 15:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50480)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hiLlQ-00038x-Bh
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:36:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hiLlO-0000aS-0Q
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:36:16 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:59850 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hiLlN-0007pv-9W
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:36:13 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id EB68F1A2245;
 Tue,  2 Jul 2019 18:35:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id B7AE31A221C;
 Tue,  2 Jul 2019 18:35:33 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 18:35:27 +0200
Message-Id: <1562085328-5126-12-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562085328-5126-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1562085328-5126-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 11/12] target/mips: Unroll loops for MSA float
 max/min instructions
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Slight preformance improvement for MSA float max/min instructions.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Message-Id: <1562068213-11307-7-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/msa_helper.c | 198 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 125 insertions(+), 73 deletions(-)

diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 5377bc1..97f840b 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -3850,35 +3850,65 @@ void helper_msa_fmin_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     wr_t *pws = &(env->active_fpu.fpr[ws].wr);
     wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
-    uint32_t i;
 
     clear_msacsr_cause(env);
 
-    switch (df) {
-    case DF_WORD:
-        for (i = 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            if (NUMBER_QNAN_PAIR(pws->w[i], pwt->w[i], 32, status)) {
-                MSA_FLOAT_MAXOP(pwx->w[i], min, pws->w[i], pws->w[i], 32);
-            } else if (NUMBER_QNAN_PAIR(pwt->w[i], pws->w[i], 32, status)) {
-                MSA_FLOAT_MAXOP(pwx->w[i], min, pwt->w[i], pwt->w[i], 32);
-            } else {
-                MSA_FLOAT_MAXOP(pwx->w[i], min, pws->w[i], pwt->w[i], 32);
-            }
+    if (df == DF_WORD) {
+
+        if (NUMBER_QNAN_PAIR(pws->w[0], pwt->w[0], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[0], min, pws->w[0], pws->w[0], 32);
+        } else if (NUMBER_QNAN_PAIR(pwt->w[0], pws->w[0], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[0], min, pwt->w[0], pwt->w[0], 32);
+        } else {
+            MSA_FLOAT_MAXOP(pwx->w[0], min, pws->w[0], pwt->w[0], 32);
         }
-        break;
-    case DF_DOUBLE:
-        for (i = 0; i < DF_ELEMENTS(DF_DOUBLE); i++) {
-            if (NUMBER_QNAN_PAIR(pws->d[i], pwt->d[i], 64, status)) {
-                MSA_FLOAT_MAXOP(pwx->d[i], min, pws->d[i], pws->d[i], 64);
-            } else if (NUMBER_QNAN_PAIR(pwt->d[i], pws->d[i], 64, status)) {
-                MSA_FLOAT_MAXOP(pwx->d[i], min, pwt->d[i], pwt->d[i], 64);
-            } else {
-                MSA_FLOAT_MAXOP(pwx->d[i], min, pws->d[i], pwt->d[i], 64);
-            }
+
+        if (NUMBER_QNAN_PAIR(pws->w[1], pwt->w[1], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[1], min, pws->w[1], pws->w[1], 32);
+        } else if (NUMBER_QNAN_PAIR(pwt->w[1], pws->w[1], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[1], min, pwt->w[1], pwt->w[1], 32);
+        } else {
+            MSA_FLOAT_MAXOP(pwx->w[1], min, pws->w[1], pwt->w[1], 32);
         }
-        break;
-    default:
+
+        if (NUMBER_QNAN_PAIR(pws->w[2], pwt->w[2], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[2], min, pws->w[2], pws->w[2], 32);
+        } else if (NUMBER_QNAN_PAIR(pwt->w[2], pws->w[2], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[2], min, pwt->w[2], pwt->w[2], 32);
+        } else {
+            MSA_FLOAT_MAXOP(pwx->w[2], min, pws->w[2], pwt->w[2], 32);
+        }
+
+        if (NUMBER_QNAN_PAIR(pws->w[3], pwt->w[3], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[3], min, pws->w[3], pws->w[3], 32);
+        } else if (NUMBER_QNAN_PAIR(pwt->w[3], pws->w[3], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[3], min, pwt->w[3], pwt->w[3], 32);
+        } else {
+            MSA_FLOAT_MAXOP(pwx->w[3], min, pws->w[3], pwt->w[3], 32);
+        }
+
+    } else if (df == DF_DOUBLE) {
+
+        if (NUMBER_QNAN_PAIR(pws->d[0], pwt->d[0], 64, status)) {
+            MSA_FLOAT_MAXOP(pwx->d[0], min, pws->d[0], pws->d[0], 64);
+        } else if (NUMBER_QNAN_PAIR(pwt->d[0], pws->d[0], 64, status)) {
+            MSA_FLOAT_MAXOP(pwx->d[0], min, pwt->d[0], pwt->d[0], 64);
+        } else {
+            MSA_FLOAT_MAXOP(pwx->d[0], min, pws->d[0], pwt->d[0], 64);
+        }
+
+        if (NUMBER_QNAN_PAIR(pws->d[1], pwt->d[1], 64, status)) {
+            MSA_FLOAT_MAXOP(pwx->d[1], min, pws->d[1], pws->d[1], 64);
+        } else if (NUMBER_QNAN_PAIR(pwt->d[1], pws->d[1], 64, status)) {
+            MSA_FLOAT_MAXOP(pwx->d[1], min, pwt->d[1], pwt->d[1], 64);
+        } else {
+            MSA_FLOAT_MAXOP(pwx->d[1], min, pws->d[1], pwt->d[1], 64);
+        }
+
+    } else {
+
         assert(0);
+
     }
 
     check_msacsr_cause(env, GETPC());
@@ -3894,22 +3924,18 @@ void helper_msa_fmin_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     wr_t *pws = &(env->active_fpu.fpr[ws].wr);
     wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
-    uint32_t i;
 
     clear_msacsr_cause(env);
 
-    switch (df) {
-    case DF_WORD:
-        for (i = 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            FMAXMIN_A(min, max, pwx->w[i], pws->w[i], pwt->w[i], 32, status);
-        }
-        break;
-    case DF_DOUBLE:
-        for (i = 0; i < DF_ELEMENTS(DF_DOUBLE); i++) {
-            FMAXMIN_A(min, max, pwx->d[i], pws->d[i], pwt->d[i], 64, status);
-        }
-        break;
-    default:
+    if (df == DF_WORD) {
+        FMAXMIN_A(min, max, pwx->w[0], pws->w[0], pwt->w[0], 32, status);
+        FMAXMIN_A(min, max, pwx->w[1], pws->w[1], pwt->w[1], 32, status);
+        FMAXMIN_A(min, max, pwx->w[2], pws->w[2], pwt->w[2], 32, status);
+        FMAXMIN_A(min, max, pwx->w[3], pws->w[3], pwt->w[3], 32, status);
+    } else if (df == DF_DOUBLE) {
+        FMAXMIN_A(min, max, pwx->d[0], pws->d[0], pwt->d[0], 64, status);
+        FMAXMIN_A(min, max, pwx->d[1], pws->d[1], pwt->d[1], 64, status);
+    } else {
         assert(0);
     }
 
@@ -3921,40 +3947,70 @@ void helper_msa_fmin_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 void helper_msa_fmax_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         uint32_t ws, uint32_t wt)
 {
-    float_status *status = &env->active_tc.msa_fp_status;
+     float_status *status = &env->active_tc.msa_fp_status;
     wr_t wx, *pwx = &wx;
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     wr_t *pws = &(env->active_fpu.fpr[ws].wr);
     wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
-    uint32_t i;
 
     clear_msacsr_cause(env);
 
-    switch (df) {
-    case DF_WORD:
-        for (i = 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            if (NUMBER_QNAN_PAIR(pws->w[i], pwt->w[i], 32, status)) {
-                MSA_FLOAT_MAXOP(pwx->w[i], max, pws->w[i], pws->w[i], 32);
-            } else if (NUMBER_QNAN_PAIR(pwt->w[i], pws->w[i], 32, status)) {
-                MSA_FLOAT_MAXOP(pwx->w[i], max, pwt->w[i], pwt->w[i], 32);
-            } else {
-                MSA_FLOAT_MAXOP(pwx->w[i], max, pws->w[i], pwt->w[i], 32);
-            }
+    if (df == DF_WORD) {
+
+        if (NUMBER_QNAN_PAIR(pws->w[0], pwt->w[0], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[0], max, pws->w[0], pws->w[0], 32);
+        } else if (NUMBER_QNAN_PAIR(pwt->w[0], pws->w[0], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[0], max, pwt->w[0], pwt->w[0], 32);
+        } else {
+            MSA_FLOAT_MAXOP(pwx->w[0], max, pws->w[0], pwt->w[0], 32);
         }
-        break;
-    case DF_DOUBLE:
-        for (i = 0; i < DF_ELEMENTS(DF_DOUBLE); i++) {
-            if (NUMBER_QNAN_PAIR(pws->d[i], pwt->d[i], 64, status)) {
-                MSA_FLOAT_MAXOP(pwx->d[i], max, pws->d[i], pws->d[i], 64);
-            } else if (NUMBER_QNAN_PAIR(pwt->d[i], pws->d[i], 64, status)) {
-                MSA_FLOAT_MAXOP(pwx->d[i], max, pwt->d[i], pwt->d[i], 64);
-            } else {
-                MSA_FLOAT_MAXOP(pwx->d[i], max, pws->d[i], pwt->d[i], 64);
-            }
+
+        if (NUMBER_QNAN_PAIR(pws->w[1], pwt->w[1], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[1], max, pws->w[1], pws->w[1], 32);
+        } else if (NUMBER_QNAN_PAIR(pwt->w[1], pws->w[1], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[1], max, pwt->w[1], pwt->w[1], 32);
+        } else {
+            MSA_FLOAT_MAXOP(pwx->w[1], max, pws->w[1], pwt->w[1], 32);
         }
-        break;
-    default:
+
+        if (NUMBER_QNAN_PAIR(pws->w[2], pwt->w[2], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[2], max, pws->w[2], pws->w[2], 32);
+        } else if (NUMBER_QNAN_PAIR(pwt->w[2], pws->w[2], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[2], max, pwt->w[2], pwt->w[2], 32);
+        } else {
+            MSA_FLOAT_MAXOP(pwx->w[2], max, pws->w[2], pwt->w[2], 32);
+        }
+
+        if (NUMBER_QNAN_PAIR(pws->w[3], pwt->w[3], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[3], max, pws->w[3], pws->w[3], 32);
+        } else if (NUMBER_QNAN_PAIR(pwt->w[3], pws->w[3], 32, status)) {
+            MSA_FLOAT_MAXOP(pwx->w[3], max, pwt->w[3], pwt->w[3], 32);
+        } else {
+            MSA_FLOAT_MAXOP(pwx->w[3], max, pws->w[3], pwt->w[3], 32);
+        }
+
+    } else if (df == DF_DOUBLE) {
+
+        if (NUMBER_QNAN_PAIR(pws->d[0], pwt->d[0], 64, status)) {
+            MSA_FLOAT_MAXOP(pwx->d[0], max, pws->d[0], pws->d[0], 64);
+        } else if (NUMBER_QNAN_PAIR(pwt->d[0], pws->d[0], 64, status)) {
+            MSA_FLOAT_MAXOP(pwx->d[0], max, pwt->d[0], pwt->d[0], 64);
+        } else {
+            MSA_FLOAT_MAXOP(pwx->d[0], max, pws->d[0], pwt->d[0], 64);
+        }
+
+        if (NUMBER_QNAN_PAIR(pws->d[1], pwt->d[1], 64, status)) {
+            MSA_FLOAT_MAXOP(pwx->d[1], max, pws->d[1], pws->d[1], 64);
+        } else if (NUMBER_QNAN_PAIR(pwt->d[1], pws->d[1], 64, status)) {
+            MSA_FLOAT_MAXOP(pwx->d[1], max, pwt->d[1], pwt->d[1], 64);
+        } else {
+            MSA_FLOAT_MAXOP(pwx->d[1], max, pws->d[1], pwt->d[1], 64);
+        }
+
+    } else {
+
         assert(0);
+
     }
 
     check_msacsr_cause(env, GETPC());
@@ -3970,22 +4026,18 @@ void helper_msa_fmax_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     wr_t *pws = &(env->active_fpu.fpr[ws].wr);
     wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
-    uint32_t i;
 
     clear_msacsr_cause(env);
 
-    switch (df) {
-    case DF_WORD:
-        for (i = 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            FMAXMIN_A(max, min, pwx->w[i], pws->w[i], pwt->w[i], 32, status);
-        }
-        break;
-    case DF_DOUBLE:
-        for (i = 0; i < DF_ELEMENTS(DF_DOUBLE); i++) {
-            FMAXMIN_A(max, min, pwx->d[i], pws->d[i], pwt->d[i], 64, status);
-        }
-        break;
-    default:
+    if (df == DF_WORD) {
+        FMAXMIN_A(max, min, pwx->w[0], pws->w[0], pwt->w[0], 32, status);
+        FMAXMIN_A(max, min, pwx->w[1], pws->w[1], pwt->w[1], 32, status);
+        FMAXMIN_A(max, min, pwx->w[2], pws->w[2], pwt->w[2], 32, status);
+        FMAXMIN_A(max, min, pwx->w[3], pws->w[3], pwt->w[3], 32, status);
+    } else if (df == DF_DOUBLE) {
+        FMAXMIN_A(max, min, pwx->d[0], pws->d[0], pwt->d[0], 64, status);
+        FMAXMIN_A(max, min, pwx->d[1], pws->d[1], pwt->d[1], 64, status);
+    } else {
         assert(0);
     }
 
-- 
2.7.4


