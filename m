Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 393812AD430
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:57:43 +0100 (CET)
Received: from localhost ([::1]:59486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRLK-00076D-A8
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcRJE-0005Kh-3k; Tue, 10 Nov 2020 05:55:32 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:34945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcRJB-000787-Uz; Tue, 10 Nov 2020 05:55:31 -0500
Received: by mail-wm1-x344.google.com with SMTP id w24so2567562wmi.0;
 Tue, 10 Nov 2020 02:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HLZxyyzJDYkGmst/aSo5y9dTOYqo1Jsa9SrqA3ZLEWU=;
 b=byVtpDEk7b6wSFLgy/j1qucas/1uRTYuRX9NgfzeoHx8fLUviVRn65vM6QIfHOnKS8
 Ha2qaLNu+vq2UtLfqrjsf0xJ/Cp/uF+eitHULQVzz8i0r7pi5gFFIZscT3k0YiKE8+d5
 fQOcXsxM7HhCDYubTjevSU3srZk4BTZSZ7Goztq7Bw2Z/uIJgXpOmShFEoxCD2yWTt+1
 K4rlI/gia58eJhTcGLYw6Y5YMu2cxCF83EXccU7kOtW5gn6tX5E0/HcWmE9Wrtc/AMyB
 giafSZmU1Sx5l5/95zuAZVjqp5wxw0JwCrBnOs5BUmLuSujgzw7NzZWAw4fKL2XNL/Ag
 F15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HLZxyyzJDYkGmst/aSo5y9dTOYqo1Jsa9SrqA3ZLEWU=;
 b=AY9MjpwuNjDt9QJG++1bw4EMlqMPYtdVsMaFWt3rVBzA/1RCphu/rGOer9+dAiaCEa
 Gt8gMAV1J0auTzjiEwEZpvgnpJqqws46W2zKVCQ0xLIMMEOLbw4nuAMx0jjH/04n7AF2
 supxT+pz8cCD6ZfYH1uKxDU9g1Vg6Vl7FrP57hZ0YxyEctUs/Aj9q1Gl8wsWuVcRW/9V
 02oM701pb3uL0y8U9fboHcyM9fbHdPkzQPtdNoS6/rKDCXC1xVeS2xCAMt78aV8SLRhE
 AVrjwazMtUYuXnRAi/GhdGu5cAbm84lCC0bc0FCBP3xh0zI/5vhiZmsg+ZpMYSgcReaa
 2L+g==
X-Gm-Message-State: AOAM532iGjNZm0V9lGHI6uv+Vjo8YcCevzyvEA+5K7dCmE61Kr1aYmnl
 JFPn16GfnZo1O8kFJxLjc8zfcTP2dfAu9A==
X-Google-Smtp-Source: ABdhPJyiBbhtnZXyYKBihwDWGpZnuUGXRJ3wQ9XLQpEWjgvuFVcOIv34gIoKYCXpzhSw6hXSvp13Wg==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr4066923wme.0.1605005727867; 
 Tue, 10 Nov 2020 02:55:27 -0800 (PST)
Received: from localhost.localdomain ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id x6sm2567891wmc.48.2020.11.10.02.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 02:55:27 -0800 (PST)
From: LemonBoy <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] ppc/translate: Delay NaN checking after comparison
Date: Tue, 10 Nov 2020 11:53:20 +0100
Message-Id: <20201110105321.25889-4-thatlemon@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201110105321.25889-1-thatlemon@gmail.com>
References: <20201110105321.25889-1-thatlemon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=thatlemon@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: LemonBoy <thatlemon@gmail.com>, richard.henderson@linaro.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we always perform a comparison between the two operands avoid
checking for NaN unless the result states they're unordered.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
---
 target/ppc/fpu_helper.c | 82 +++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 40 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index c74c080c17..315959f681 100644
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
         cc |= CRF_LT;
@@ -2506,6 +2487,27 @@ static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
         break;
     case float_relation_unordered:
         cc |= CRF_SO;
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
     }
 
@@ -2536,27 +2538,6 @@ static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
 
     helper_reset_fpstatus(env);
 
-    if (float128_is_signaling_nan(xa->f128, &env->fp_status) ||
-        float128_is_signaling_nan(xb->f128, &env->fp_status)) {
-        vxsnan_flag = true;
-        cc = CRF_SO;
-        if (fpscr_ve == 0 && ordered) {
-            vxvc_flag = true;
-        }
-    } else if (float128_is_quiet_nan(xa->f128, &env->fp_status) ||
-               float128_is_quiet_nan(xb->f128, &env->fp_status)) {
-        cc = CRF_SO;
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
         cc |= CRF_LT;
@@ -2569,6 +2550,27 @@ static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
         break;
     case float_relation_unordered:
         cc |= CRF_SO;
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
     }
 
-- 
2.27.0


