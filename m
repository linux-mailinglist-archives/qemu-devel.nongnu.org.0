Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D3A381EF9
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:04:56 +0200 (CEST)
Received: from localhost ([::1]:46350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGRz-0001mN-61
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzW-0007iu-L5
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:30 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:36454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz1-0007oj-FI
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:24 -0400
Received: by mail-qk1-x72c.google.com with SMTP id c20so3321916qkm.3
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9VdzNFszTdcD2ktO3zGU/bD6+PDA34XFo6jM/oZ00K8=;
 b=ses4bz4QEGorYBkf7xNApBGMq5JwYnoh2YIlOi8T6BtfGJU7i5N0gs7Voq2pr64urk
 sl8BNnSRHzUJICDqQ84hDCTvUq6QioSHBswtITl3J+PQL943KTTzFQ9KyjTq6uSYcal+
 7aK0Pn0E+vrknImXCJpGFtgaHyhrArye4QmcQ7P1QOcV3P+CzMBkgjnpR79tctS2a/Ma
 g2CQKzsCSLQcd/GbyMQ4PAL2YhTf07fsqLCD7g+AWpqL1nNjRUGvAoDImU7j33KE+51o
 xIWIWTp/BEtQzZpi3gxD9itHCa174KUnSZ9JjbldrSoacZDMXG0LvSVD35wV8EHLMJbw
 bCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9VdzNFszTdcD2ktO3zGU/bD6+PDA34XFo6jM/oZ00K8=;
 b=lJZ5uXFF6ldC6zSqJgiCoQFZ0OeYX1CcHi/fRqLbc9DNH/Hu1dC2zuVoOEuOyepfxv
 BnJqfPYCp6pTEoE5t8QzheD4DDTiVBLXRN5upMOGfDMcOjDqoKegqbz3nCjo+uw8TRwH
 L6XjyMwyKal3ScX6AN0f/dBLrMy89C0AnJMeWzp5jd36WfhEdm1reUTMSzGQTjDzEVJq
 4cLqoyfMc9gj7lM5gY6mhS8f5Yi6d0n5h6t0p7pfQTRRxk51vW1TY1XL9RRqK+a3wX16
 qhubXKUZmfYW1mUozvha6EnxeIe9sHT3ueRtKsjyRPuPsmeYu64XSUiqVIT/ULPeKkKK
 Qd1Q==
X-Gm-Message-State: AOAM530+LIY8SMoWLo9A+7GFQ6XrK4eJu6QKXtWuO+6gbKJ2r/Kok4sn
 arwjkoHnGqUKf6zSqZ4o2m5zEIFh6yeoBQw0UhY=
X-Google-Smtp-Source: ABdhPJy3JUsjAhN7qCXr3sdxVU0rUPXgAmIliP3+86n+tA68mNhog3ySnNoJdLuNkFYp4TAZy4Yfag==
X-Received: by 2002:a37:94e:: with SMTP id 75mr52421068qkj.128.1621168496697; 
 Sun, 16 May 2021 05:34:56 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/46] softfloat: Move pick_nan to softfloat-parts.c.inc
Date: Sun, 16 May 2021 07:34:14 -0500
Message-Id: <20210516123431.718318-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the same time, convert to pointers, rename to parts$N_pick_nan
and define a macro for parts_pick_nan using QEMU_GENERIC.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 62 ++++++++++++++++++++++-----------------
 fpu/softfloat-parts.c.inc | 25 ++++++++++++++++
 2 files changed, 60 insertions(+), 27 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index bdc3125e5c..019b34d378 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -714,10 +714,39 @@ static void parts128_return_nan(FloatParts128 *a, float_status *s);
 
 #define parts_return_nan(P, S)     PARTS_GENERIC_64_128(return_nan, P)(P, S)
 
+static FloatParts64 *parts64_pick_nan(FloatParts64 *a, FloatParts64 *b,
+                                      float_status *s);
+static FloatParts128 *parts128_pick_nan(FloatParts128 *a, FloatParts128 *b,
+                                        float_status *s);
+
+#define parts_pick_nan(A, B, S)    PARTS_GENERIC_64_128(pick_nan, A)(A, B, S)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
 
+#define FRAC_GENERIC_64_128(NAME, P) \
+    QEMU_GENERIC(P, (FloatParts128 *, frac128_##NAME), frac64_##NAME)
+
+static int frac64_cmp(FloatParts64 *a, FloatParts64 *b)
+{
+    return a->frac == b->frac ? 0 : a->frac < b->frac ? -1 : 1;
+}
+
+static int frac128_cmp(FloatParts128 *a, FloatParts128 *b)
+{
+    uint64_t ta = a->frac_hi, tb = b->frac_hi;
+    if (ta == tb) {
+        ta = a->frac_lo, tb = b->frac_lo;
+        if (ta == tb) {
+            return 0;
+        }
+    }
+    return ta < tb ? -1 : 1;
+}
+
+#define frac_cmp(A, B)  FRAC_GENERIC_64_128(cmp, A)(A, B)
+
 static void frac128_shl(FloatParts128 *a, int c)
 {
     shift128Left(a->frac_hi, a->frac_lo, c, &a->frac_hi, &a->frac_lo);
@@ -919,27 +948,6 @@ static FloatParts64 round_canonical(FloatParts64 p, float_status *s,
     return p;
 }
 
-static FloatParts64 pick_nan(FloatParts64 a, FloatParts64 b, float_status *s)
-{
-    if (is_snan(a.cls) || is_snan(b.cls)) {
-        float_raise(float_flag_invalid, s);
-    }
-
-    if (s->default_nan_mode) {
-        parts_default_nan(&a, s);
-    } else {
-        if (pickNaN(a.cls, b.cls,
-                    a.frac > b.frac ||
-                    (a.frac == b.frac && a.sign < b.sign), s)) {
-            a = b;
-        }
-        if (is_snan(a.cls)) {
-            parts_silence_nan(&a, s);
-        }
-    }
-    return a;
-}
-
 static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64 c,
                                   bool inf_zero, float_status *s)
 {
@@ -1107,7 +1115,7 @@ static FloatParts64 addsub_floats(FloatParts64 a, FloatParts64 b, bool subtract,
             return a;
         }
         if (is_nan(a.cls) || is_nan(b.cls)) {
-            return pick_nan(a, b, s);
+            return *parts_pick_nan(&a, &b, s);
         }
         if (a.cls == float_class_inf) {
             if (b.cls == float_class_inf) {
@@ -1145,7 +1153,7 @@ static FloatParts64 addsub_floats(FloatParts64 a, FloatParts64 b, bool subtract,
             return a;
         }
         if (is_nan(a.cls) || is_nan(b.cls)) {
-            return pick_nan(a, b, s);
+            return *parts_pick_nan(&a, &b, s);
         }
         if (a.cls == float_class_inf || b.cls == float_class_zero) {
             return a;
@@ -1361,7 +1369,7 @@ static FloatParts64 mul_floats(FloatParts64 a, FloatParts64 b, float_status *s)
     }
     /* handle all the NaN cases */
     if (is_nan(a.cls) || is_nan(b.cls)) {
-        return pick_nan(a, b, s);
+        return *parts_pick_nan(&a, &b, s);
     }
     /* Inf * Zero == NaN */
     if ((a.cls == float_class_inf && b.cls == float_class_zero) ||
@@ -1888,7 +1896,7 @@ static FloatParts64 div_floats(FloatParts64 a, FloatParts64 b, float_status *s)
     }
     /* handle all the NaN cases */
     if (is_nan(a.cls) || is_nan(b.cls)) {
-        return pick_nan(a, b, s);
+        return *parts_pick_nan(&a, &b, s);
     }
     /* 0/0 or Inf/Inf */
     if (a.cls == b.cls
@@ -3296,14 +3304,14 @@ static FloatParts64 minmax_floats(FloatParts64 a, FloatParts64 b, bool ismin,
              * the invalid exception is raised.
              */
             if (is_snan(a.cls) || is_snan(b.cls)) {
-                return pick_nan(a, b, s);
+                return *parts_pick_nan(&a, &b, s);
             } else if (is_nan(a.cls) && !is_nan(b.cls)) {
                 return b;
             } else if (is_nan(b.cls) && !is_nan(a.cls)) {
                 return a;
             }
         }
-        return pick_nan(a, b, s);
+        return *parts_pick_nan(&a, &b, s);
     } else {
         int a_exp, b_exp;
 
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 2a3075d6fe..11a71650f7 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -35,3 +35,28 @@ static void partsN(return_nan)(FloatPartsN *a, float_status *s)
         g_assert_not_reached();
     }
 }
+
+static FloatPartsN *partsN(pick_nan)(FloatPartsN *a, FloatPartsN *b,
+                                     float_status *s)
+{
+    if (is_snan(a->cls) || is_snan(b->cls)) {
+        float_raise(float_flag_invalid, s);
+    }
+
+    if (s->default_nan_mode) {
+        parts_default_nan(a, s);
+    } else {
+        int cmp = frac_cmp(a, b);
+        if (cmp == 0) {
+            cmp = a->sign < b->sign;
+        }
+
+        if (pickNaN(a->cls, b->cls, cmp > 0, s)) {
+            a = b;
+        }
+        if (is_snan(a->cls)) {
+            parts_silence_nan(a, s);
+        }
+    }
+    return a;
+}
-- 
2.25.1


