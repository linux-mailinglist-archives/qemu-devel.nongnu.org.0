Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD739AD0D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:43:51 +0200 (CEST)
Received: from localhost ([::1]:52546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lov82-0006zi-3U
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5x-00029k-V6
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:41 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5w-00014W-2i
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:41 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 29so6148241pgu.11
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X7rkp8u5Uk7lnJ0IeUz2DjyUeUy9fzT1UPPQAOiqDA8=;
 b=UZv6SVXsy9sTyZRnlyZjyODYqzlOChVUaAogKSHtq6KQ0lAzkVVd3C+r2erz2ec8Ik
 S0C5z46iK+RANLWOMKxWcMCtk0OIWX5kWoFEGaGQ7iw92g5+UtWpB6sxtgcD2N2vj/Po
 LHSRt+3ztwTpa+9SfpFmTQyBXeYHse/vVZ4dCXTOHEizPoMON6puNQ7q4qsgUcWz+NTp
 +Bk+Uht6TFy2MrLVvAwpMlu3HG0wQ2ZTuThdpspg47ioL2IqpRowoUUrxmUtxAAOfMDJ
 T8KP3p/97EpcFdwCQbNdDCPFZp3HcmawyCePAxAkzGV0nNnhNTHPRCyFLY1V9l8X+aet
 vNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X7rkp8u5Uk7lnJ0IeUz2DjyUeUy9fzT1UPPQAOiqDA8=;
 b=lzX1QHZ0V9L9+zeXuPTG4YeGRPQ1RMtiazKcMFxW0ipkTO56QkV5M6SBQ9fGmlmcSk
 G0P8O/25DBFRmOHUWQ7Uh1kvYhgvrqjVY1I41W22Z/DiuODeJUxNuf+zBgxE5LpaOhGm
 ybC+EorOCIC/mafYzWWxZCDkYrgqI8rLL2SIqPCh/jED5PpeX0gnEt1Yni742JKapJ98
 LjehA9DOhO6pzEQ25mSseqU/B/q9RIuaHA6FUP9loQuny/RVCOcyIQbFYYsjUSXDDYwe
 i4gqytKMh9N/9rR/O2qhyZfooPJabzK5qgNw1C32yGvtmp8pyRz82CwY+LBjse62vZGm
 Jy4w==
X-Gm-Message-State: AOAM531/5MQ8AHwrzEGh0kLvsUVM5gUkQbYJiUPWKzJeAurBh7Gg8PjU
 nGyjZdzSx2g646NYYRGsfl1+UrQLEDMfFw==
X-Google-Smtp-Source: ABdhPJzVs+0BTaSNmGciC76faUZDoSFNjGkeMt1cRj0V7DTP72193DY8lzIt8zVujB9or9eQpV767Q==
X-Received: by 2002:a63:fa51:: with SMTP id g17mr1503659pgk.340.1622756498802; 
 Thu, 03 Jun 2021 14:41:38 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/29] softfloat: Split out parts_uncanon_normal
Date: Thu,  3 Jun 2021 14:41:11 -0700
Message-Id: <20210603214131.629841-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will need to treat the non-normal cases of floatx80 specially,
so split out the normal case that we can reuse.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           |  8 ++++++
 fpu/softfloat-parts.c.inc | 59 +++++++++++++++++++++------------------
 2 files changed, 40 insertions(+), 27 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 0f2eed8d29..ea7ee13201 100644
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
index d69f357352..e05909db8c 100644
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
@@ -150,33 +150,9 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
     const uint64_t round_mask = fmt->round_mask;
     const uint64_t roundeven_mask = fmt->roundeven_mask;
     uint64_t inc;
-    bool overflow_norm;
+    bool overflow_norm = false;
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
-    overflow_norm = false;
     switch (s->float_rounding_mode) {
     case float_round_nearest_even:
         inc = ((p->frac_lo & roundeven_mask) != frac_lsbm1 ? frac_lsbm1 : 0);
@@ -284,6 +260,35 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
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


