Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEBB381ED9
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:43:20 +0200 (CEST)
Received: from localhost ([::1]:45554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liG75-00051K-9o
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyp-0007NV-Va
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:49 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:33480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyi-0007k1-IV
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:47 -0400
Received: by mail-qt1-x834.google.com with SMTP id 1so3064446qtb.0
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h6yGPb1D0TPpeLoEn2DTqwUkL4N32JMarhisyJlcM+Q=;
 b=v5cI4gmFAumKikxAiKXUjxUp5GopbP9qZSbWIVTVwPyMza77R1kc6kiUHyHveKU4DV
 LfvVn2XRPNdZ5uQ+CPuLYVGD6OlJxbjQPzir1apyl/qQZ2j/kkPU8PyDIqBKdtWvH7YH
 LOJZJQ0obtJj2jZLJmGRZH/mPJlndErdW1t39Nw/avd6c0/6kSKMCut03euern6fmVQX
 MEInajj80fOVYkRZy60uOnJn1ItAjeBKBnnyuD7LXRki/xlvUPbAf84T50TNUCJRWVtp
 nYI9/UQA4IeXuL+n2f46MsUuAwkhjzDFBEiPXb6OcXdAlS4XoQqa1zVCGqust/fxgHTI
 /jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h6yGPb1D0TPpeLoEn2DTqwUkL4N32JMarhisyJlcM+Q=;
 b=GqYK45UBzPXFleF4XaGwGYLYp2yGay8jAotwv4rw13I+4R7N5K3CiKi+2MZH3b7hZ0
 VrDkua4ibAzJ2VoF4Ekk86pLghqwos9XsULL/v1cCLQPUQBy/AXvd9try5G8qYonq9lo
 076B4baMDbl7Y7Gtbdkdcodg9fBjL7AH4iWQEBPJYTxX0+ftlLsTLu8ri9CepOkZGuON
 UsCkb3N71eF0Fm4St8+pRXLDfwgKuD6YmRmoSX5Ez5z4F2F5eKuG/px4zMxgGgkP53qZ
 gZGu98ujaddgLdb1VgLegO3TlpM/zYFPu+n/cTQHmivwBKILnpC4nmvJB23XaHSLXu28
 +XuA==
X-Gm-Message-State: AOAM530sPMInQkEjTTAQm/Tu9WejqtDqVSIQCPZ7k1uT5mPP4umSDd14
 RbSr4/xR8+KnmdqaGopSO8g1uuMdK42NkjXvDAo=
X-Google-Smtp-Source: ABdhPJyCOcDNokH9UUo3UGfJtOMzEhXcy09mai1o/s5JJZpbGoDfZigTqwXLf3l62j2xXCbdlFlWxw==
X-Received: by 2002:a05:622a:130a:: with SMTP id
 v10mr38156820qtk.113.1621168479591; 
 Sun, 16 May 2021 05:34:39 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/46] softfloat: Use float_raise in more places
Date: Sun, 16 May 2021 07:33:53 -0500
Message-Id: <20210516123431.718318-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have been somewhat inconsistent about when to use
float_raise and when to or in the bit by hand.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 87 +++++++++++++++++++++++++------------------------
 1 file changed, 44 insertions(+), 43 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index cd777743f1..93fe785809 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -132,7 +132,7 @@ this code that are retained.
         if (unlikely(soft_t ## _is_denormal(*a))) {                     \
             *a = soft_t ## _set_sign(soft_t ## _zero,                   \
                                      soft_t ## _is_neg(*a));            \
-            s->float_exception_flags |= float_flag_input_denormal;      \
+            float_raise(float_flag_input_denormal, s);                  \
         }                                                               \
     }
 
@@ -360,7 +360,7 @@ float32_gen2(float32 xa, float32 xb, float_status *s,
 
     ur.h = hard(ua.h, ub.h);
     if (unlikely(f32_is_inf(ur))) {
-        s->float_exception_flags |= float_flag_overflow;
+        float_raise(float_flag_overflow, s);
     } else if (unlikely(fabsf(ur.h) <= FLT_MIN) && post(ua, ub)) {
         goto soft;
     }
@@ -391,7 +391,7 @@ float64_gen2(float64 xa, float64 xb, float_status *s,
 
     ur.h = hard(ua.h, ub.h);
     if (unlikely(f64_is_inf(ur))) {
-        s->float_exception_flags |= float_flag_overflow;
+        float_raise(float_flag_overflow, s);
     } else if (unlikely(fabs(ur.h) <= DBL_MIN) && post(ua, ub)) {
         goto soft;
     }
@@ -880,7 +880,7 @@ static FloatParts return_nan(FloatParts a, float_status *s)
 {
     switch (a.cls) {
     case float_class_snan:
-        s->float_exception_flags |= float_flag_invalid;
+        float_raise(float_flag_invalid, s);
         a = parts_silence_nan(a, s);
         /* fall through */
     case float_class_qnan:
@@ -898,7 +898,7 @@ static FloatParts return_nan(FloatParts a, float_status *s)
 static FloatParts pick_nan(FloatParts a, FloatParts b, float_status *s)
 {
     if (is_snan(a.cls) || is_snan(b.cls)) {
-        s->float_exception_flags |= float_flag_invalid;
+        float_raise(float_flag_invalid, s);
     }
 
     if (s->default_nan_mode) {
@@ -922,7 +922,7 @@ static FloatParts pick_nan_muladd(FloatParts a, FloatParts b, FloatParts c,
     int which;
 
     if (is_snan(a.cls) || is_snan(b.cls) || is_snan(c.cls)) {
-        s->float_exception_flags |= float_flag_invalid;
+        float_raise(float_flag_invalid, s);
     }
 
     which = pickNaNMulAdd(a.cls, b.cls, c.cls, inf_zero, s);
@@ -1241,7 +1241,7 @@ static FloatParts mul_floats(FloatParts a, FloatParts b, float_status *s)
     /* Inf * Zero == NaN */
     if ((a.cls == float_class_inf && b.cls == float_class_zero) ||
         (a.cls == float_class_zero && b.cls == float_class_inf)) {
-        s->float_exception_flags |= float_flag_invalid;
+        float_raise(float_flag_invalid, s);
         return parts_default_nan(s);
     }
     /* Multiply by 0 or Inf */
@@ -1356,6 +1356,7 @@ static FloatParts muladd_floats(FloatParts a, FloatParts b, FloatParts c,
     }
 
     if (inf_zero) {
+        float_raise(float_flag_invalid, s);
         s->float_exception_flags |= float_flag_invalid;
         return parts_default_nan(s);
     }
@@ -1380,7 +1381,7 @@ static FloatParts muladd_floats(FloatParts a, FloatParts b, FloatParts c,
 
     if (c.cls == float_class_inf) {
         if (p_class == float_class_inf && p_sign != c.sign) {
-            s->float_exception_flags |= float_flag_invalid;
+            float_raise(float_flag_invalid, s);
             return parts_default_nan(s);
         } else {
             a.cls = float_class_inf;
@@ -1598,7 +1599,7 @@ float32_muladd(float32 xa, float32 xb, float32 xc, int flags, float_status *s)
         ur.h = fmaf(ua.h, ub.h, uc.h);
 
         if (unlikely(f32_is_inf(ur))) {
-            s->float_exception_flags |= float_flag_overflow;
+            float_raise(float_flag_overflow, s);
         } else if (unlikely(fabsf(ur.h) <= FLT_MIN)) {
             ua = ua_orig;
             uc = uc_orig;
@@ -1669,7 +1670,7 @@ float64_muladd(float64 xa, float64 xb, float64 xc, int flags, float_status *s)
         ur.h = fma(ua.h, ub.h, uc.h);
 
         if (unlikely(f64_is_inf(ur))) {
-            s->float_exception_flags |= float_flag_overflow;
+            float_raise(float_flag_overflow, s);
         } else if (unlikely(fabs(ur.h) <= FLT_MIN)) {
             ua = ua_orig;
             uc = uc_orig;
@@ -1749,7 +1750,7 @@ static FloatParts div_floats(FloatParts a, FloatParts b, float_status *s)
     if (a.cls == b.cls
         &&
         (a.cls == float_class_inf || a.cls == float_class_zero)) {
-        s->float_exception_flags |= float_flag_invalid;
+        float_raise(float_flag_invalid, s);
         return parts_default_nan(s);
     }
     /* Inf / x or 0 / x */
@@ -1759,7 +1760,7 @@ static FloatParts div_floats(FloatParts a, FloatParts b, float_status *s)
     }
     /* Div 0 => Inf */
     if (b.cls == float_class_zero) {
-        s->float_exception_flags |= float_flag_divbyzero;
+        float_raise(float_flag_divbyzero, s);
         a.cls = float_class_inf;
         a.sign = sign;
         return a;
@@ -1895,7 +1896,7 @@ static FloatParts float_to_float(FloatParts a, const FloatFmt *dstf,
             /* There is no NaN in the destination format.  Raise Invalid
              * and return a zero with the sign of the input NaN.
              */
-            s->float_exception_flags |= float_flag_invalid;
+            float_raise(float_flag_invalid, s);
             a.cls = float_class_zero;
             a.frac = 0;
             a.exp = 0;
@@ -1905,7 +1906,7 @@ static FloatParts float_to_float(FloatParts a, const FloatFmt *dstf,
             /* There is no Inf in the destination format.  Raise Invalid
              * and return the maximum normal with the correct sign.
              */
-            s->float_exception_flags |= float_flag_invalid;
+            float_raise(float_flag_invalid, s);
             a.cls = float_class_normal;
             a.exp = dstf->exp_max;
             a.frac = ((1ull << dstf->frac_size) - 1) << dstf->frac_shift;
@@ -1916,7 +1917,7 @@ static FloatParts float_to_float(FloatParts a, const FloatFmt *dstf,
         }
     } else if (is_nan(a.cls)) {
         if (is_snan(a.cls)) {
-            s->float_exception_flags |= float_flag_invalid;
+            float_raise(float_flag_invalid, s);
             a = parts_silence_nan(a, s);
         }
         if (s->default_nan_mode) {
@@ -2048,7 +2049,7 @@ static FloatParts round_to_int(FloatParts a, FloatRoundMode rmode,
         if (a.exp < 0) {
             bool one;
             /* all fractional */
-            s->float_exception_flags |= float_flag_inexact;
+            float_raise(float_flag_inexact, s);
             switch (rmode) {
             case float_round_nearest_even:
                 one = a.exp == -1 && a.frac > DECOMPOSED_IMPLICIT_BIT;
@@ -2109,7 +2110,7 @@ static FloatParts round_to_int(FloatParts a, FloatRoundMode rmode,
             }
 
             if (a.frac & rnd_mask) {
-                s->float_exception_flags |= float_flag_inexact;
+                float_raise(float_flag_inexact, s);
                 if (uadd64_overflow(a.frac, inc, &a.frac)) {
                     a.frac >>= 1;
                     a.frac |= DECOMPOSED_IMPLICIT_BIT;
@@ -3188,7 +3189,7 @@ static FloatRelation compare_floats(FloatParts a, FloatParts b, bool is_quiet,
         if (!is_quiet ||
             a.cls == float_class_snan ||
             b.cls == float_class_snan) {
-            s->float_exception_flags |= float_flag_invalid;
+            float_raise(float_flag_invalid, s);
         }
         return float_relation_unordered;
     }
@@ -3429,7 +3430,7 @@ static FloatParts sqrt_float(FloatParts a, float_status *s, const FloatFmt *p)
         return a;  /* sqrt(+-0) = +-0 */
     }
     if (a.sign) {
-        s->float_exception_flags |= float_flag_invalid;
+        float_raise(float_flag_invalid, s);
         return parts_default_nan(s);
     }
     if (a.cls == float_class_inf) {
@@ -3760,7 +3761,7 @@ static int32_t roundAndPackInt32(bool zSign, uint64_t absZ,
         return zSign ? INT32_MIN : INT32_MAX;
     }
     if (roundBits) {
-        status->float_exception_flags |= float_flag_inexact;
+        float_raise(float_flag_inexact, status);
     }
     return z;
 
@@ -3822,7 +3823,7 @@ static int64_t roundAndPackInt64(bool zSign, uint64_t absZ0, uint64_t absZ1,
         return zSign ? INT64_MIN : INT64_MAX;
     }
     if (absZ1) {
-        status->float_exception_flags |= float_flag_inexact;
+        float_raise(float_flag_inexact, status);
     }
     return z;
 
@@ -3883,7 +3884,7 @@ static int64_t roundAndPackUint64(bool zSign, uint64_t absZ0,
     }
 
     if (absZ1) {
-        status->float_exception_flags |= float_flag_inexact;
+        float_raise(float_flag_inexact, status);
     }
     return absZ0;
 }
@@ -3994,7 +3995,7 @@ static float32 roundAndPackFloat32(bool zSign, int zExp, uint32_t zSig,
         }
     }
     if (roundBits) {
-        status->float_exception_flags |= float_flag_inexact;
+        float_raise(float_flag_inexact, status);
     }
     zSig = ( zSig + roundIncrement )>>7;
     if (!(roundBits ^ 0x40) && roundNearestEven) {
@@ -4150,7 +4151,7 @@ static float64 roundAndPackFloat64(bool zSign, int zExp, uint64_t zSig,
         }
     }
     if (roundBits) {
-        status->float_exception_flags |= float_flag_inexact;
+        float_raise(float_flag_inexact, status);
     }
     zSig = ( zSig + roundIncrement )>>10;
     if (!(roundBits ^ 0x200) && roundNearestEven) {
@@ -4284,7 +4285,7 @@ floatx80 roundAndPackFloatx80(int8_t roundingPrecision, bool zSign,
                 float_raise(float_flag_underflow, status);
             }
             if (roundBits) {
-                status->float_exception_flags |= float_flag_inexact;
+                float_raise(float_flag_inexact, status);
             }
             zSig0 += roundIncrement;
             if ( (int64_t) zSig0 < 0 ) zExp = 1;
@@ -4297,7 +4298,7 @@ floatx80 roundAndPackFloatx80(int8_t roundingPrecision, bool zSign,
         }
     }
     if (roundBits) {
-        status->float_exception_flags |= float_flag_inexact;
+        float_raise(float_flag_inexact, status);
     }
     zSig0 += roundIncrement;
     if ( zSig0 < roundIncrement ) {
@@ -4360,7 +4361,7 @@ floatx80 roundAndPackFloatx80(int8_t roundingPrecision, bool zSign,
                 float_raise(float_flag_underflow, status);
             }
             if (zSig1) {
-                status->float_exception_flags |= float_flag_inexact;
+                float_raise(float_flag_inexact, status);
             }
             switch (roundingMode) {
             case float_round_nearest_even:
@@ -4390,7 +4391,7 @@ floatx80 roundAndPackFloatx80(int8_t roundingPrecision, bool zSign,
         }
     }
     if (zSig1) {
-        status->float_exception_flags |= float_flag_inexact;
+        float_raise(float_flag_inexact, status);
     }
     if ( increment ) {
         ++zSig0;
@@ -4667,7 +4668,7 @@ static float128 roundAndPackFloat128(bool zSign, int32_t zExp,
         }
     }
     if (zSig2) {
-        status->float_exception_flags |= float_flag_inexact;
+        float_raise(float_flag_inexact, status);
     }
     if ( increment ) {
         add128( zSig0, zSig1, 0, 1, &zSig0, &zSig1 );
@@ -5405,7 +5406,7 @@ int32_t floatx80_to_int32_round_to_zero(floatx80 a, float_status *status)
     }
     else if ( aExp < 0x3FFF ) {
         if (aExp || aSig) {
-            status->float_exception_flags |= float_flag_inexact;
+            float_raise(float_flag_inexact, status);
         }
         return 0;
     }
@@ -5420,7 +5421,7 @@ int32_t floatx80_to_int32_round_to_zero(floatx80 a, float_status *status)
         return aSign ? (int32_t) 0x80000000 : 0x7FFFFFFF;
     }
     if ( ( aSig<<shiftCount ) != savedASig ) {
-        status->float_exception_flags |= float_flag_inexact;
+        float_raise(float_flag_inexact, status);
     }
     return z;
 
@@ -5504,13 +5505,13 @@ int64_t floatx80_to_int64_round_to_zero(floatx80 a, float_status *status)
     }
     else if ( aExp < 0x3FFF ) {
         if (aExp | aSig) {
-            status->float_exception_flags |= float_flag_inexact;
+            float_raise(float_flag_inexact, status);
         }
         return 0;
     }
     z = aSig>>( - shiftCount );
     if ( (uint64_t) ( aSig<<( shiftCount & 63 ) ) ) {
-        status->float_exception_flags |= float_flag_inexact;
+        float_raise(float_flag_inexact, status);
     }
     if ( aSign ) z = - z;
     return z;
@@ -5661,7 +5662,7 @@ floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
              && ( (uint64_t) ( extractFloatx80Frac( a ) ) == 0 ) ) {
             return a;
         }
-        status->float_exception_flags |= float_flag_inexact;
+        float_raise(float_flag_inexact, status);
         aSign = extractFloatx80Sign( a );
         switch (status->float_rounding_mode) {
          case float_round_nearest_even:
@@ -5728,7 +5729,7 @@ floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
         z.low = UINT64_C(0x8000000000000000);
     }
     if (z.low != a.low) {
-        status->float_exception_flags |= float_flag_inexact;
+        float_raise(float_flag_inexact, status);
     }
     return z;
 
@@ -6364,7 +6365,7 @@ int32_t float128_to_int32_round_to_zero(float128 a, float_status *status)
     }
     else if ( aExp < 0x3FFF ) {
         if (aExp || aSig0) {
-            status->float_exception_flags |= float_flag_inexact;
+            float_raise(float_flag_inexact, status);
         }
         return 0;
     }
@@ -6380,7 +6381,7 @@ int32_t float128_to_int32_round_to_zero(float128 a, float_status *status)
         return aSign ? INT32_MIN : INT32_MAX;
     }
     if ( ( aSig0<<shiftCount ) != savedASig ) {
-        status->float_exception_flags |= float_flag_inexact;
+        float_raise(float_flag_inexact, status);
     }
     return z;
 
@@ -6458,7 +6459,7 @@ int64_t float128_to_int64_round_to_zero(float128 a, float_status *status)
             if (    ( a.high == UINT64_C(0xC03E000000000000) )
                  && ( aSig1 < UINT64_C(0x0002000000000000) ) ) {
                 if (aSig1) {
-                    status->float_exception_flags |= float_flag_inexact;
+                    float_raise(float_flag_inexact, status);
                 }
             }
             else {
@@ -6471,20 +6472,20 @@ int64_t float128_to_int64_round_to_zero(float128 a, float_status *status)
         }
         z = ( aSig0<<shiftCount ) | ( aSig1>>( ( - shiftCount ) & 63 ) );
         if ( (uint64_t) ( aSig1<<shiftCount ) ) {
-            status->float_exception_flags |= float_flag_inexact;
+            float_raise(float_flag_inexact, status);
         }
     }
     else {
         if ( aExp < 0x3FFF ) {
             if ( aExp | aSig0 | aSig1 ) {
-                status->float_exception_flags |= float_flag_inexact;
+                float_raise(float_flag_inexact, status);
             }
             return 0;
         }
         z = aSig0>>( - shiftCount );
         if (    aSig1
              || ( shiftCount && (uint64_t) ( aSig0<<( shiftCount & 63 ) ) ) ) {
-            status->float_exception_flags |= float_flag_inexact;
+            float_raise(float_flag_inexact, status);
         }
     }
     if ( aSign ) z = - z;
@@ -6793,7 +6794,7 @@ float128 float128_round_to_int(float128 a, float_status *status)
     else {
         if ( aExp < 0x3FFF ) {
             if ( ( ( (uint64_t) ( a.high<<1 ) ) | a.low ) == 0 ) return a;
-            status->float_exception_flags |= float_flag_inexact;
+            float_raise(float_flag_inexact, status);
             aSign = extractFloat128Sign( a );
             switch (status->float_rounding_mode) {
             case float_round_nearest_even:
@@ -6867,7 +6868,7 @@ float128 float128_round_to_int(float128 a, float_status *status)
         z.high &= ~ roundBitsMask;
     }
     if ( ( z.low != a.low ) || ( z.high != a.high ) ) {
-        status->float_exception_flags |= float_flag_inexact;
+        float_raise(float_flag_inexact, status);
     }
     return z;
 
-- 
2.25.1


