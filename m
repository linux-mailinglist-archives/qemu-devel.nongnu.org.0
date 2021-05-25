Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D313906A6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:29:25 +0200 (CEST)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZvo-0006Gc-3v
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeT-0001mG-7j
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:25 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeI-0006ei-9H
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:24 -0400
Received: by mail-pj1-x102a.google.com with SMTP id t11so17029923pjm.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zLpvJW2BRkZR5YJ9c51EUMDgKNW3YnVi2U2Lfv7yp2o=;
 b=hQajEDCYCjOC6Ay9h42E0EQZ6Y9uX031Qfk6Ih+VdYGd+CsCyVjsftuJ8qIYEtVZbS
 gSnSt8uH4Ul5mNN4x6ns1iLVknbY11erwgestkj1ESwJBOegJuNusB7+bm12Y975TbS6
 JDPorFjBHopQSdXRbUFp6zH4q36ItyRAQqGM/+aOUgEDhxVLM197sw24mL0syKvPFkWO
 mSrjySfkNyQiqLaHLZotYdxgtbiJFwhkeVINBjCwsHP+CqtU1XWWUFJA2B84Rsc1U57W
 2dCkAMbtWQfWfcOl5HLk5TprcNuU1UOY+/1zb0VoTHITnFdIkxWnhNBbz7YO6kG5LTCa
 cnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zLpvJW2BRkZR5YJ9c51EUMDgKNW3YnVi2U2Lfv7yp2o=;
 b=d/c3qtrAwQ3duJyepo5gePh8Xo5yFp/XG9YjTZchG/eoamuJazKm2BY/9jSH+SUc/O
 J65LTk6CbsqxG95IiFPR90w9/df9gIqORvaMa6OaITXU5n+du2pjTacxyWhY+Zu33a2H
 zjs4kEk8EWjXbQ0pXIlxUGc4Rt0iBI9LdO2jL6qw6gAh2YDIRAv4LLUEN61oog3FFDk3
 fuPwdfoIs+EgxbSJaNn8ijDhi3VxwZRjv1yDkYEjncwSraSfS4dEPDV1BojhTtQeu8zF
 QkSRhY3LA6AU/y1r52TSGN72xJ0t8HYGFncDPqxR2PE+o8VTzWs6uCVrrpJ/ugZ3UIrL
 puoQ==
X-Gm-Message-State: AOAM532rk4TogULJ/aUTHJuNeRAYhQGxyDphrLoS4tDcVYDGXciD6neB
 34cPhJR+6Jz0H+oMYc1NaW0ykYTCSBpr1Q==
X-Google-Smtp-Source: ABdhPJwgSDOnqkwbn0FAwiyuQwHDMhLrSnqH0NRD3TWw9GcLpeLXHXRBxlJx8BeDLWrFp5mmZC9hbQ==
X-Received: by 2002:a17:90a:ba07:: with SMTP id
 s7mr31054163pjr.129.1621955232557; 
 Tue, 25 May 2021 08:07:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/28] softfloat: Split out parts_uncanon_normal
Date: Tue, 25 May 2021 08:06:46 -0700
Message-Id: <20210525150706.294968-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will need to treat the non-normal cases of floatx80 specially,
so split out the normal case that we can reuse.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           |  8 ++++++
 fpu/softfloat-parts.c.inc | 56 ++++++++++++++++++++++-----------------
 2 files changed, 39 insertions(+), 25 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 50af8e4e09..2f2bea84da 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -764,6 +764,14 @@ static void parts128_canonicalize(FloatParts128 *p, float_status *status,
 #define parts_canonicalize(A, S, F) \
     PARTS_GENERIC_64_128(canonicalize, A)(A, S, F)
 
+static void parts64_uncanon_normal(FloatParts64 *p, float_status *status,
+                                   const FloatFmt *fmt);
+static void parts128_uncanon_normal(FloatParts128 *p, float_status *status,
+                                    const FloatFmt *fmt);
+
+#define parts_uncanon_normal(A, S, F) \
+    PARTS_GENERIC_64_128(uncanon_normal, A)(A, S, F)
+
 static void parts64_uncanon(FloatParts64 *p, float_status *status,
                             const FloatFmt *fmt);
 static void parts128_uncanon(FloatParts128 *p, float_status *status,
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 840ccfdf20..d72fe3ab08 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -140,8 +140,8 @@ static void partsN(canonicalize)(FloatPartsN *p, float_status *status,
  * fraction; these bits will be removed. The exponent will be biased
  * by EXP_BIAS and must be bounded by [EXP_MAX-1, 0].
  */
-static void partsN(uncanon)(FloatPartsN *p, float_status *s,
-                            const FloatFmt *fmt)
+static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
+                                   const FloatFmt *fmt)
 {
     const int exp_max = fmt->exp_max;
     const int frac_shift = fmt->frac_shift;
@@ -153,29 +153,6 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
     bool overflow_norm;
     int exp, flags = 0;
 
-    if (unlikely(p->cls != float_class_normal)) {
-        switch (p->cls) {
-        case float_class_zero:
-            p->exp = 0;
-            frac_clear(p);
-            return;
-        case float_class_inf:
-            g_assert(!fmt->arm_althp);
-            p->exp = fmt->exp_max;
-            frac_clear(p);
-            return;
-        case float_class_qnan:
-        case float_class_snan:
-            g_assert(!fmt->arm_althp);
-            p->exp = fmt->exp_max;
-            frac_shr(p, fmt->frac_shift);
-            return;
-        default:
-            break;
-        }
-        g_assert_not_reached();
-    }
-
     switch (s->float_rounding_mode) {
     case float_round_nearest_even:
         overflow_norm = false;
@@ -282,6 +259,35 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
     float_raise(flags, s);
 }
 
+static void partsN(uncanon)(FloatPartsN *p, float_status *s,
+                            const FloatFmt *fmt)
+{
+    if (likely(p->cls == float_class_normal)) {
+        parts_uncanon_normal(p, s, fmt);
+    } else {
+        switch (p->cls) {
+        case float_class_zero:
+            p->exp = 0;
+            frac_clear(p);
+            return;
+        case float_class_inf:
+            g_assert(!fmt->arm_althp);
+            p->exp = fmt->exp_max;
+            frac_clear(p);
+            return;
+        case float_class_qnan:
+        case float_class_snan:
+            g_assert(!fmt->arm_althp);
+            p->exp = fmt->exp_max;
+            frac_shr(p, fmt->frac_shift);
+            return;
+        default:
+            break;
+        }
+        g_assert_not_reached();
+    }
+}
+
 /*
  * Returns the result of adding or subtracting the values of the
  * floating-point values `a' and `b'. The operation is performed
-- 
2.25.1


