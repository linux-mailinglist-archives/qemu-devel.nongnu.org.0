Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B18376E52
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:00:25 +0200 (CEST)
Received: from localhost ([::1]:44888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCGW-0007Pt-R9
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4r-0004C4-PB
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:25 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4n-0003bC-90
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:20 -0400
Received: by mail-pf1-x429.google.com with SMTP id h127so9114410pfe.9
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lv754BNFiT0WY9Gu5PCjCwyGp1j/2FG0ontxfnvbfDM=;
 b=Sjoxa2mqfi4r66N+hnftKUFzK057DD1/8IQ8xizex+7dZIi6GVO/eNAXhc42yGAjJM
 X70AjE6WisguHC80JJixoGFXzuQG0F8GBqfkO1blzypxOwAFW/NaWDHpF83cCIW+i/uR
 OL4iDwUZTlznV6eUIRS7o9HUXREvyf1dt2+XgCboQSF2jshNY31ZvvtqvW6797EirEew
 AVyyhpva+95gVnGlm1K/5nIdnW6F/dsDrIWURCj8eh+9uStc0sjn2zEuRy7LyRkjN38X
 mOl5H87lGIqQqxCs/quUH7XIzV6A1FDdgk4BB1lfdDAs2OGzQp3UaK2upolhk3nf8B7j
 YlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lv754BNFiT0WY9Gu5PCjCwyGp1j/2FG0ontxfnvbfDM=;
 b=Ei7GdosivteC7a74B3djPcAhXUmAlVonelEIMlC5LDzbv9+kQebM5nGyGQIlkxDGKi
 owssR+9Xd6cOenewNH4mk/a4P35N6kekwQ8QuzQYxhAFbQpS/bVbIhE5TxUAkKYfW9gg
 MtGTEk6KN2e8oIle7iirQKg0V1iOLi0L6vLj9ljSnWOqtHiG6k04JH1UMbAtmFKUKhPS
 /EBY8Tkj7ZG+v5DNHoK7DIBK/vRkfDU4WCiR+ZHDNWf5sjF8ErkrUxc88K6WvIjTJ3Wn
 /xaclBZ4coczA7sCJvT8pS7uEc/cHGAedxUa3tLJjsnZf9hWLJFX30t/P0UHsvM731VX
 B8Wg==
X-Gm-Message-State: AOAM533PKNWSYaAUERax3ThiMXEioKAi0cT6mByoUNkgILq1xhte+etO
 uw+/aC/bhgdK4q52xWcmBkDX9uAunL3Wbw==
X-Google-Smtp-Source: ABdhPJz3iDLBSoNVbH4h8wBOdWu5yxhpVY49A8QkIF8NLjoLOHcxEcWV9BIQaVPpi/TGU19BnFYIeg==
X-Received: by 2002:a65:538d:: with SMTP id x13mr13248453pgq.108.1620438494826; 
 Fri, 07 May 2021 18:48:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/72] softfloat: Use pointers with parts_default_nan
Date: Fri,  7 May 2021 18:47:07 -0700
Message-Id: <20210508014802.892561-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

At the same time, rename to parts64_default_nan and define
a macro for parts_default_nan using QEMU_GENERIC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c                | 47 +++++++++++++++++++++++-----------
 fpu/softfloat-specialize.c.inc |  4 +--
 2 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 398a068b58..c7f95961cf 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -650,6 +650,8 @@ static inline float64 float64_pack_raw(FloatParts64 p)
 *----------------------------------------------------------------------------*/
 #include "softfloat-specialize.c.inc"
 
+#define parts_default_nan  parts64_default_nan
+
 /* Canonicalize EXP and FRAC, setting CLS.  */
 static FloatParts64 sf_canonicalize(FloatParts64 part, const FloatFmt *parm,
                                   float_status *status)
@@ -848,7 +850,8 @@ static FloatParts64 return_nan(FloatParts64 a, float_status *s)
     } else if (!s->default_nan_mode) {
         return a;
     }
-    return parts_default_nan(s);
+    parts_default_nan(&a, s);
+    return a;
 }
 
 static FloatParts64 pick_nan(FloatParts64 a, FloatParts64 b, float_status *s)
@@ -858,7 +861,7 @@ static FloatParts64 pick_nan(FloatParts64 a, FloatParts64 b, float_status *s)
     }
 
     if (s->default_nan_mode) {
-        return parts_default_nan(s);
+        parts_default_nan(&a, s);
     } else {
         if (pickNaN(a.cls, b.cls,
                     a.frac > b.frac ||
@@ -900,7 +903,8 @@ static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64
         a = c;
         break;
     case 3:
-        return parts_default_nan(s);
+        parts_default_nan(&a, s);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -1011,7 +1015,7 @@ static FloatParts64 addsub_floats(FloatParts64 a, FloatParts64 b, bool subtract,
         if (a.cls == float_class_inf) {
             if (b.cls == float_class_inf) {
                 float_raise(float_flag_invalid, s);
-                return parts_default_nan(s);
+                parts_default_nan(&a, s);
             }
             return a;
         }
@@ -1254,7 +1258,8 @@ static FloatParts64 mul_floats(FloatParts64 a, FloatParts64 b, float_status *s)
     if ((a.cls == float_class_inf && b.cls == float_class_zero) ||
         (a.cls == float_class_zero && b.cls == float_class_inf)) {
         float_raise(float_flag_invalid, s);
-        return parts_default_nan(s);
+        parts_default_nan(&a, s);
+        return a;
     }
     /* Multiply by 0 or Inf */
     if (a.cls == float_class_inf || a.cls == float_class_zero) {
@@ -1372,7 +1377,8 @@ static FloatParts64 muladd_floats(FloatParts64 a, FloatParts64 b, FloatParts64 c
 
     if (inf_zero) {
         float_raise(float_flag_invalid, s);
-        return parts_default_nan(s);
+        parts_default_nan(&a, s);
+        return a;
     }
 
     if (flags & float_muladd_negate_c) {
@@ -1396,11 +1402,11 @@ static FloatParts64 muladd_floats(FloatParts64 a, FloatParts64 b, FloatParts64 c
     if (c.cls == float_class_inf) {
         if (p_class == float_class_inf && p_sign != c.sign) {
             float_raise(float_flag_invalid, s);
-            return parts_default_nan(s);
+            parts_default_nan(&c, s);
         } else {
             c.sign ^= sign_flip;
-            return c;
         }
+        return c;
     }
 
     if (p_class == float_class_inf) {
@@ -1764,7 +1770,8 @@ static FloatParts64 div_floats(FloatParts64 a, FloatParts64 b, float_status *s)
         &&
         (a.cls == float_class_inf || a.cls == float_class_zero)) {
         float_raise(float_flag_invalid, s);
-        return parts_default_nan(s);
+        parts_default_nan(&a, s);
+        return a;
     }
     /* Inf / x or 0 / x */
     if (a.cls == float_class_inf || a.cls == float_class_zero) {
@@ -3438,7 +3445,8 @@ static FloatParts64 sqrt_float(FloatParts64 a, float_status *s, const FloatFmt *
     }
     if (a.sign) {
         float_raise(float_flag_invalid, s);
-        return parts_default_nan(s);
+        parts_default_nan(&a, s);
+        return a;
     }
     if (a.cls == float_class_inf) {
         return a;  /* sqrt(+inf) = +inf */
@@ -3573,30 +3581,37 @@ bfloat16 QEMU_FLATTEN bfloat16_sqrt(bfloat16 a, float_status *status)
 
 float16 float16_default_nan(float_status *status)
 {
-    FloatParts64 p = parts_default_nan(status);
+    FloatParts64 p;
+
+    parts_default_nan(&p, status);
     p.frac >>= float16_params.frac_shift;
     return float16_pack_raw(p);
 }
 
 float32 float32_default_nan(float_status *status)
 {
-    FloatParts64 p = parts_default_nan(status);
+    FloatParts64 p;
+
+    parts_default_nan(&p, status);
     p.frac >>= float32_params.frac_shift;
     return float32_pack_raw(p);
 }
 
 float64 float64_default_nan(float_status *status)
 {
-    FloatParts64 p = parts_default_nan(status);
+    FloatParts64 p;
+
+    parts_default_nan(&p, status);
     p.frac >>= float64_params.frac_shift;
     return float64_pack_raw(p);
 }
 
 float128 float128_default_nan(float_status *status)
 {
-    FloatParts64 p = parts_default_nan(status);
+    FloatParts64 p;
     float128 r;
 
+    parts_default_nan(&p, status);
     /* Extrapolate from the choices made by parts_default_nan to fill
      * in the quad-floating format.  If the low bit is set, assume we
      * want to set all non-snan bits.
@@ -3611,7 +3626,9 @@ float128 float128_default_nan(float_status *status)
 
 bfloat16 bfloat16_default_nan(float_status *status)
 {
-    FloatParts64 p = parts_default_nan(status);
+    FloatParts64 p;
+
+    parts_default_nan(&p, status);
     p.frac >>= bfloat16_params.frac_shift;
     return bfloat16_pack_raw(p);
 }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 52fc76d800..085ddea62b 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -129,7 +129,7 @@ static bool parts_is_snan_frac(uint64_t frac, float_status *status)
 | The pattern for a default generated deconstructed floating-point NaN.
 *----------------------------------------------------------------------------*/
 
-static FloatParts64 parts_default_nan(float_status *status)
+static void parts64_default_nan(FloatParts64 *p, float_status *status)
 {
     bool sign = 0;
     uint64_t frac;
@@ -164,7 +164,7 @@ static FloatParts64 parts_default_nan(float_status *status)
     }
 #endif
 
-    return (FloatParts64) {
+    *p = (FloatParts64) {
         .cls = float_class_qnan,
         .sign = sign,
         .exp = INT_MAX,
-- 
2.25.1


