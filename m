Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50D6376EC6
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:30:06 +0200 (CEST)
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCjF-0000RH-LK
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC7z-0002hR-9B
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:35 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:56032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC7x-0005Pm-5x
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:35 -0400
Received: by mail-pj1-x102d.google.com with SMTP id gj14so6202021pjb.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PjO/WBUjzkzU9o07Kk08nMAvxZvCi1gtdxM9VqO6fzs=;
 b=zfAPywz0BDPYnh1ZJ/bLY7gJ/dpEoUUu5RZUhDNA+EFjXY61j0hf2Hu6RUltW/Dmb+
 zj/rwiIEalT6AWYZNF/Lq6wYJiiR7hf7Rm2GPX+Cn9K+2jXpaTlTE6GZT4+hSc6nNvJB
 bfDJ/APxTv5uXiA8hldOKV/QLu7LK++oWqXFDsIlvgSMxnY/6GzKyS/jypg3zCfYLOME
 QVwLbbTATiCZjYDv7nTFxG2GtbflODNewkWJeEfhXfiRwubcEro42WfWgcq7SXZskGqu
 YN3fcKxEHdX7lhhh1TGnRXzVe0HGCv+hnv3WZuR/HzhYSm5Zs8GTEKyNyM/vtvIu8iDy
 TBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PjO/WBUjzkzU9o07Kk08nMAvxZvCi1gtdxM9VqO6fzs=;
 b=d4NPPynUhHrJCCnqOuoXN1jN8VG5RWb27rmu0njY/R7W4vTOIUFzy5aYZ+5S+ajjCV
 GL5jqGCOyKc3ocnrMPxeurpelQXhc6De6eWMlMhv2hmxyHnbAew6aok9fQlP/3sZzRc/
 uEvCt6p3S27wiKBlX/1clV3vohENhG3+EYTGySuCWtNogTURuOzjqF1DHCbwmVasmmno
 YyxbkGGCAM9TYfjhzEaGwqIuDSDjG7NaUUQEh/TaJf7cIUQJ/bOMYUg7xO12aU0e3vlW
 DTWMYmPnYr9Lr+oXeb7utkeCP7PWPodQTRFRvrlWVImPnbmHz3aLiNhR16SC9h8XwGy2
 59UA==
X-Gm-Message-State: AOAM5331kgOz+WGPyOn+RLPmMTPXLPfLod/C1jZSjweVWXKq1Wvufpsc
 XfyjTWnU+8PjdkBVibbQCeJAo7i3TRIDkQ==
X-Google-Smtp-Source: ABdhPJwTQUa56OA4rOMgK4CWPAAq19nmbRzR97k5FovLRjCfKuKNaxP5SOwIUtrPl7pCQP8ylTvEzA==
X-Received: by 2002:a17:90b:8d5:: with SMTP id
 ds21mr26119352pjb.65.1620438691840; 
 Fri, 07 May 2021 18:51:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 43/72] softfloat: Split float_to_float
Date: Fri,  7 May 2021 18:47:33 -0700
Message-Id: <20210508014802.892561-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Split out parts_float_to_ahp and parts_float_to_float.
Convert to pointers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 174 ++++++++++++++++++++++++++++--------------------
 1 file changed, 101 insertions(+), 73 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 8efa52f7ec..06fac8f41c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2036,83 +2036,105 @@ float128_div(float128 a, float128 b, float_status *status)
  * conversion is performed according to the IEC/IEEE Standard for
  * Binary Floating-Point Arithmetic.
  *
- * The float_to_float helper only needs to take care of raising
- * invalid exceptions and handling the conversion on NaNs.
+ * Usually this only needs to take care of raising invalid exceptions
+ * and handling the conversion on NaNs.
  */
 
-static FloatParts64 float_to_float(FloatParts64 a, const FloatFmt *dstf,
-                                 float_status *s)
+static void parts_float_to_ahp(FloatParts64 *a, float_status *s)
 {
-    if (dstf->arm_althp) {
-        switch (a.cls) {
-        case float_class_qnan:
-        case float_class_snan:
-            /* There is no NaN in the destination format.  Raise Invalid
-             * and return a zero with the sign of the input NaN.
-             */
-            float_raise(float_flag_invalid, s);
-            a.cls = float_class_zero;
-            a.frac = 0;
-            a.exp = 0;
-            break;
+    switch (a->cls) {
+    case float_class_qnan:
+    case float_class_snan:
+        /*
+         * There is no NaN in the destination format.  Raise Invalid
+         * and return a zero with the sign of the input NaN.
+         */
+        float_raise(float_flag_invalid, s);
+        a->cls = float_class_zero;
+        break;
 
-        case float_class_inf:
-            /* There is no Inf in the destination format.  Raise Invalid
-             * and return the maximum normal with the correct sign.
-             */
-            float_raise(float_flag_invalid, s);
-            a.cls = float_class_normal;
-            a.exp = dstf->exp_max;
-            a.frac = ((1ull << dstf->frac_size) - 1) << dstf->frac_shift;
-            break;
+    case float_class_inf:
+        /*
+         * There is no Inf in the destination format.  Raise Invalid
+         * and return the maximum normal with the correct sign.
+         */
+        float_raise(float_flag_invalid, s);
+        a->cls = float_class_normal;
+        a->exp = float16_params_ahp.exp_max;
+        a->frac = MAKE_64BIT_MASK(float16_params_ahp.frac_shift,
+                                  float16_params_ahp.frac_size + 1);
+        break;
 
-        default:
-            break;
-        }
-    } else if (is_nan(a.cls)) {
-        parts_return_nan(&a, s);
+    case float_class_normal:
+    case float_class_zero:
+        break;
+
+    default:
+        g_assert_not_reached();
     }
-    return a;
 }
 
+static void parts64_float_to_float(FloatParts64 *a, float_status *s)
+{
+    if (is_nan(a->cls)) {
+        parts_return_nan(a, s);
+    }
+}
+
+static void parts128_float_to_float(FloatParts128 *a, float_status *s)
+{
+    if (is_nan(a->cls)) {
+        parts_return_nan(a, s);
+    }
+}
+
+#define parts_float_to_float(P, S) \
+    PARTS_GENERIC_64_128(float_to_float, P)(P, S)
+
 float32 float16_to_float32(float16 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float16a_unpack_canonical(&pa, a, s, fmt16);
-    pr = float_to_float(pa, &float32_params, s);
-    return float32_round_pack_canonical(&pr, s);
+    float16a_unpack_canonical(&p, a, s, fmt16);
+    parts_float_to_float(&p, s);
+    return float32_round_pack_canonical(&p, s);
 }
 
 float64 float16_to_float64(float16 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float16a_unpack_canonical(&pa, a, s, fmt16);
-    pr = float_to_float(pa, &float64_params, s);
-    return float64_round_pack_canonical(&pr, s);
+    float16a_unpack_canonical(&p, a, s, fmt16);
+    parts_float_to_float(&p, s);
+    return float64_round_pack_canonical(&p, s);
 }
 
 float16 float32_to_float16(float32 a, bool ieee, float_status *s)
 {
-    const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts64 pa, pr;
+    FloatParts64 p;
+    const FloatFmt *fmt;
 
-    float32_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, fmt16, s);
-    return float16a_round_pack_canonical(&pr, s, fmt16);
+    float32_unpack_canonical(&p, a, s);
+    if (ieee) {
+        parts_float_to_float(&p, s);
+        fmt = &float16_params;
+    } else {
+        parts_float_to_ahp(&p, s);
+        fmt = &float16_params_ahp;
+    }
+    return float16a_round_pack_canonical(&p, s, fmt);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_float32_to_float64(float32 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float32_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, &float64_params, s);
-    return float64_round_pack_canonical(&pr, s);
+    float32_unpack_canonical(&p, a, s);
+    parts_float_to_float(&p, s);
+    return float64_round_pack_canonical(&p, s);
 }
 
 float64 float32_to_float64(float32 a, float_status *s)
@@ -2133,57 +2155,63 @@ float64 float32_to_float64(float32 a, float_status *s)
 
 float16 float64_to_float16(float64 a, bool ieee, float_status *s)
 {
-    const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts64 pa, pr;
+    FloatParts64 p;
+    const FloatFmt *fmt;
 
-    float64_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, fmt16, s);
-    return float16a_round_pack_canonical(&pr, s, fmt16);
+    float64_unpack_canonical(&p, a, s);
+    if (ieee) {
+        parts_float_to_float(&p, s);
+        fmt = &float16_params;
+    } else {
+        parts_float_to_ahp(&p, s);
+        fmt = &float16_params_ahp;
+    }
+    return float16a_round_pack_canonical(&p, s, fmt);
 }
 
 float32 float64_to_float32(float64 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float64_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, &float32_params, s);
-    return float32_round_pack_canonical(&pr, s);
+    float64_unpack_canonical(&p, a, s);
+    parts_float_to_float(&p, s);
+    return float32_round_pack_canonical(&p, s);
 }
 
 float32 bfloat16_to_float32(bfloat16 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    bfloat16_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, &float32_params, s);
-    return float32_round_pack_canonical(&pr, s);
+    bfloat16_unpack_canonical(&p, a, s);
+    parts_float_to_float(&p, s);
+    return float32_round_pack_canonical(&p, s);
 }
 
 float64 bfloat16_to_float64(bfloat16 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    bfloat16_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, &float64_params, s);
-    return float64_round_pack_canonical(&pr, s);
+    bfloat16_unpack_canonical(&p, a, s);
+    parts_float_to_float(&p, s);
+    return float64_round_pack_canonical(&p, s);
 }
 
 bfloat16 float32_to_bfloat16(float32 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float32_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, &bfloat16_params, s);
-    return bfloat16_round_pack_canonical(&pr, s);
+    float32_unpack_canonical(&p, a, s);
+    parts_float_to_float(&p, s);
+    return bfloat16_round_pack_canonical(&p, s);
 }
 
 bfloat16 float64_to_bfloat16(float64 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float64_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, &bfloat16_params, s);
-    return bfloat16_round_pack_canonical(&pr, s);
+    float64_unpack_canonical(&p, a, s);
+    parts_float_to_float(&p, s);
+    return bfloat16_round_pack_canonical(&p, s);
 }
 
 /*
-- 
2.25.1


