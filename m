Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AD7376E87
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:26:00 +0200 (CEST)
Received: from localhost ([::1]:54438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCfH-0001XU-Sb
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC83-0002zK-LX
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:39 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC7z-0005Re-T8
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:39 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so6554228pjb.4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qGY7aCHNZkCzk37MB6QkE9/q/X8JPmp9I2EqeH2GHLs=;
 b=pg4shd14mG+eOzHLBOi+i55J3HafWOLRzqg2FdJMkAvDqxNyOs3H8aURdtawdWB05J
 S4AcFpomYTUdDrrhSp4vVXtsqjzQCQduasCoG5m3jPlTppa8COGqdg+nO95ZANJ1RiTr
 yBrc4+gYbwA8farm7gy4ZP5QVdQ3Hi7cfVP+xzfLrgIluzUTw7PhgqnB7I6gAshmu/fU
 +VfEh9n7R3Z3WuC0wZYsNpRAwKpXeN7NgPgVxV2JFoJ6zHKAqSWhIAEZLjDh/B8QcUtX
 PE6z8zI98fOe8EM63UBYpTTToRrtwX3EacP8491IcnCDsN49j2GO99G6zu9s50w2E1aR
 bgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qGY7aCHNZkCzk37MB6QkE9/q/X8JPmp9I2EqeH2GHLs=;
 b=K1qvcco6+6umSSiTPsp2lMl1vQDbpGHS5RsXR73LA/g4EI3wUTwWxFC3xSUnNRv8dA
 yE7bK86V7BiXc/kNOSJZbE940i6yh15kjHmzASPIMjPwwVwkvhQI7vDMVrj//LFXmBc/
 5PNlQUoMb+5kSiBFwq4zMsk+4ElP88qiOSjs6i4Kx1/V3JqhWyPpvrAvz/ymptXtxktb
 FDsyL++H6bJewEw5qvnBtmBu2qH0w/tVWSU2/uDFm1cnjCkW+ee2JhTtNFUANyEuwVNN
 flyjmJ1hv/PfOBi9emE2o/G1rh9nnGLsJR3XaHRkG3jmR/wUFu8hayz1nPZKzaf/2N/S
 bmWQ==
X-Gm-Message-State: AOAM532xWrp1+zruHyQ5O6Lk6XxL37eAd9E3kBfi9mgxqNlVA/uXPwsX
 0zGpcrfAIaqakYYLXfdT6A2BI/kcw+SIeg==
X-Google-Smtp-Source: ABdhPJwMRO4MPfEz9tGNt23J6OfJ1WpEX3ekG4UXoW23zh6VukhraSgn+TrQj7pt3pcsevAfpU0MwA==
X-Received: by 2002:a17:90b:514:: with SMTP id
 r20mr26854444pjz.193.1620438694536; 
 Fri, 07 May 2021 18:51:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 47/72] softfloat: Move rount_to_uint_and_pack to
 softfloat-parts.c.inc
Date: Fri,  7 May 2021 18:47:37 -0700
Message-Id: <20210508014802.892561-48-richard.henderson@linaro.org>
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

Rename to parts$N_float_to_uint.  Reimplement
float128_to_uint{32,64}{_round_to_zero} with FloatParts128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 357 +++++++++-----------------------------
 fpu/softfloat-parts.c.inc |  68 +++++++-
 2 files changed, 147 insertions(+), 278 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index ac8e726935..235ddda7a0 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -838,6 +838,16 @@ static int64_t parts128_float_to_sint(FloatParts128 *p, FloatRoundMode rmode,
 #define parts_float_to_sint(P, R, Z, MN, MX, S) \
     PARTS_GENERIC_64_128(float_to_sint, P)(P, R, Z, MN, MX, S)
 
+static uint64_t parts64_float_to_uint(FloatParts64 *p, FloatRoundMode rmode,
+                                      int scale, uint64_t max,
+                                      float_status *s);
+static uint64_t parts128_float_to_uint(FloatParts128 *p, FloatRoundMode rmode,
+                                       int scale, uint64_t max,
+                                       float_status *s);
+
+#define parts_float_to_uint(P, R, Z, M, S) \
+    PARTS_GENERIC_64_128(float_to_uint, P)(P, R, Z, M, S)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -2645,80 +2655,16 @@ int64_t bfloat16_to_int64_round_to_zero(bfloat16 a, float_status *s)
 }
 
 /*
- *  Returns the result of converting the floating-point value `a' to
- *  the unsigned integer format. The conversion is performed according
- *  to the IEC/IEEE Standard for Binary Floating-Point
- *  Arithmetic---which means in particular that the conversion is
- *  rounded according to the current rounding mode. If `a' is a NaN,
- *  the largest unsigned integer is returned. Otherwise, if the
- *  conversion overflows, the largest unsigned integer is returned. If
- *  the 'a' is negative, the result is rounded and zero is returned;
- *  values that do not round to zero will raise the inexact exception
- *  flag.
+ * Floating-point to unsigned integer conversions
  */
 
-static uint64_t round_to_uint_and_pack(FloatParts64 p, FloatRoundMode rmode,
-                                       int scale, uint64_t max,
-                                       float_status *s)
-{
-    int flags = 0;
-    uint64_t r;
-
-    switch (p.cls) {
-    case float_class_snan:
-    case float_class_qnan:
-        flags = float_flag_invalid;
-        r = max;
-        break;
-
-    case float_class_inf:
-        flags = float_flag_invalid;
-        r = p.sign ? 0 : max;
-        break;
-
-    case float_class_zero:
-        return 0;
-
-    case float_class_normal:
-        /* TODO: 62 = N - 2, frac_size for rounding */
-        if (parts_round_to_int_normal(&p, rmode, scale, 62)) {
-            flags = float_flag_inexact;
-            if (p.cls == float_class_zero) {
-                r = 0;
-                break;
-            }
-        }
-
-        if (p.sign) {
-            flags = float_flag_invalid;
-            r = 0;
-        } else if (p.exp > DECOMPOSED_BINARY_POINT) {
-            flags = float_flag_invalid;
-            r = max;
-        } else {
-            r = p.frac >> (DECOMPOSED_BINARY_POINT - p.exp);
-            if (r > max) {
-                flags = float_flag_invalid;
-                r = max;
-            }
-        }
-        break;
-
-    default:
-        g_assert_not_reached();
-    }
-
-    float_raise(flags, s);
-    return r;
-}
-
 uint8_t float16_to_uint8_scalbn(float16 a, FloatRoundMode rmode, int scale,
                                 float_status *s)
 {
     FloatParts64 p;
 
     float16_unpack_canonical(&p, a, s);
-    return round_to_uint_and_pack(p, rmode, scale, UINT8_MAX, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT8_MAX, s);
 }
 
 uint16_t float16_to_uint16_scalbn(float16 a, FloatRoundMode rmode, int scale,
@@ -2727,7 +2673,7 @@ uint16_t float16_to_uint16_scalbn(float16 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float16_unpack_canonical(&p, a, s);
-    return round_to_uint_and_pack(p, rmode, scale, UINT16_MAX, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT16_MAX, s);
 }
 
 uint32_t float16_to_uint32_scalbn(float16 a, FloatRoundMode rmode, int scale,
@@ -2736,7 +2682,7 @@ uint32_t float16_to_uint32_scalbn(float16 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float16_unpack_canonical(&p, a, s);
-    return round_to_uint_and_pack(p, rmode, scale, UINT32_MAX, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT32_MAX, s);
 }
 
 uint64_t float16_to_uint64_scalbn(float16 a, FloatRoundMode rmode, int scale,
@@ -2745,7 +2691,7 @@ uint64_t float16_to_uint64_scalbn(float16 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float16_unpack_canonical(&p, a, s);
-    return round_to_uint_and_pack(p, rmode, scale, UINT64_MAX, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT64_MAX, s);
 }
 
 uint16_t float32_to_uint16_scalbn(float32 a, FloatRoundMode rmode, int scale,
@@ -2754,7 +2700,7 @@ uint16_t float32_to_uint16_scalbn(float32 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float32_unpack_canonical(&p, a, s);
-    return round_to_uint_and_pack(p, rmode, scale, UINT16_MAX, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT16_MAX, s);
 }
 
 uint32_t float32_to_uint32_scalbn(float32 a, FloatRoundMode rmode, int scale,
@@ -2763,7 +2709,7 @@ uint32_t float32_to_uint32_scalbn(float32 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float32_unpack_canonical(&p, a, s);
-    return round_to_uint_and_pack(p, rmode, scale, UINT32_MAX, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT32_MAX, s);
 }
 
 uint64_t float32_to_uint64_scalbn(float32 a, FloatRoundMode rmode, int scale,
@@ -2772,7 +2718,7 @@ uint64_t float32_to_uint64_scalbn(float32 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float32_unpack_canonical(&p, a, s);
-    return round_to_uint_and_pack(p, rmode, scale, UINT64_MAX, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT64_MAX, s);
 }
 
 uint16_t float64_to_uint16_scalbn(float64 a, FloatRoundMode rmode, int scale,
@@ -2781,7 +2727,7 @@ uint16_t float64_to_uint16_scalbn(float64 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float64_unpack_canonical(&p, a, s);
-    return round_to_uint_and_pack(p, rmode, scale, UINT16_MAX, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT16_MAX, s);
 }
 
 uint32_t float64_to_uint32_scalbn(float64 a, FloatRoundMode rmode, int scale,
@@ -2790,7 +2736,7 @@ uint32_t float64_to_uint32_scalbn(float64 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float64_unpack_canonical(&p, a, s);
-    return round_to_uint_and_pack(p, rmode, scale, UINT32_MAX, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT32_MAX, s);
 }
 
 uint64_t float64_to_uint64_scalbn(float64 a, FloatRoundMode rmode, int scale,
@@ -2799,7 +2745,52 @@ uint64_t float64_to_uint64_scalbn(float64 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float64_unpack_canonical(&p, a, s);
-    return round_to_uint_and_pack(p, rmode, scale, UINT64_MAX, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT64_MAX, s);
+}
+
+uint16_t bfloat16_to_uint16_scalbn(bfloat16 a, FloatRoundMode rmode,
+                                   int scale, float_status *s)
+{
+    FloatParts64 p;
+
+    bfloat16_unpack_canonical(&p, a, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT16_MAX, s);
+}
+
+uint32_t bfloat16_to_uint32_scalbn(bfloat16 a, FloatRoundMode rmode,
+                                   int scale, float_status *s)
+{
+    FloatParts64 p;
+
+    bfloat16_unpack_canonical(&p, a, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT32_MAX, s);
+}
+
+uint64_t bfloat16_to_uint64_scalbn(bfloat16 a, FloatRoundMode rmode,
+                                   int scale, float_status *s)
+{
+    FloatParts64 p;
+
+    bfloat16_unpack_canonical(&p, a, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT64_MAX, s);
+}
+
+static uint32_t float128_to_uint32_scalbn(float128 a, FloatRoundMode rmode,
+                                          int scale, float_status *s)
+{
+    FloatParts128 p;
+
+    float128_unpack_canonical(&p, a, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT32_MAX, s);
+}
+
+static uint64_t float128_to_uint64_scalbn(float128 a, FloatRoundMode rmode,
+                                          int scale, float_status *s)
+{
+    FloatParts128 p;
+
+    float128_unpack_canonical(&p, a, s);
+    return parts_float_to_uint(&p, rmode, scale, UINT64_MAX, s);
 }
 
 uint8_t float16_to_uint8(float16 a, float_status *s)
@@ -2852,6 +2843,16 @@ uint64_t float64_to_uint64(float64 a, float_status *s)
     return float64_to_uint64_scalbn(a, s->float_rounding_mode, 0, s);
 }
 
+uint32_t float128_to_uint32(float128 a, float_status *s)
+{
+    return float128_to_uint32_scalbn(a, s->float_rounding_mode, 0, s);
+}
+
+uint64_t float128_to_uint64(float128 a, float_status *s)
+{
+    return float128_to_uint64_scalbn(a, s->float_rounding_mode, 0, s);
+}
+
 uint16_t float16_to_uint16_round_to_zero(float16 a, float_status *s)
 {
     return float16_to_uint16_scalbn(a, float_round_to_zero, 0, s);
@@ -2897,36 +2898,14 @@ uint64_t float64_to_uint64_round_to_zero(float64 a, float_status *s)
     return float64_to_uint64_scalbn(a, float_round_to_zero, 0, s);
 }
 
-/*
- *  Returns the result of converting the bfloat16 value `a' to
- *  the unsigned integer format.
- */
-
-uint16_t bfloat16_to_uint16_scalbn(bfloat16 a, FloatRoundMode rmode,
-                                   int scale, float_status *s)
+uint32_t float128_to_uint32_round_to_zero(float128 a, float_status *s)
 {
-    FloatParts64 p;
-
-    bfloat16_unpack_canonical(&p, a, s);
-    return round_to_uint_and_pack(p, rmode, scale, UINT16_MAX, s);
+    return float128_to_uint32_scalbn(a, float_round_to_zero, 0, s);
 }
 
-uint32_t bfloat16_to_uint32_scalbn(bfloat16 a, FloatRoundMode rmode,
-                                   int scale, float_status *s)
+uint64_t float128_to_uint64_round_to_zero(float128 a, float_status *s)
 {
-    FloatParts64 p;
-
-    bfloat16_unpack_canonical(&p, a, s);
-    return round_to_uint_and_pack(p, rmode, scale, UINT32_MAX, s);
-}
-
-uint64_t bfloat16_to_uint64_scalbn(bfloat16 a, FloatRoundMode rmode,
-                                   int scale, float_status *s)
-{
-    FloatParts64 p;
-
-    bfloat16_unpack_canonical(&p, a, s);
-    return round_to_uint_and_pack(p, rmode, scale, UINT64_MAX, s);
+    return float128_to_uint64_scalbn(a, float_round_to_zero, 0, s);
 }
 
 uint16_t bfloat16_to_uint16(bfloat16 a, float_status *s)
@@ -4122,66 +4101,6 @@ static int64_t roundAndPackInt64(bool zSign, uint64_t absZ0, uint64_t absZ1,
 
 }
 
-/*----------------------------------------------------------------------------
-| Takes the 128-bit fixed-point value formed by concatenating `absZ0' and
-| `absZ1', with binary point between bits 63 and 64 (between the input words),
-| and returns the properly rounded 64-bit unsigned integer corresponding to the
-| input.  Ordinarily, the fixed-point input is simply rounded to an integer,
-| with the inexact exception raised if the input cannot be represented exactly
-| as an integer.  However, if the fixed-point input is too large, the invalid
-| exception is raised and the largest unsigned integer is returned.
-*----------------------------------------------------------------------------*/
-
-static int64_t roundAndPackUint64(bool zSign, uint64_t absZ0,
-                                uint64_t absZ1, float_status *status)
-{
-    int8_t roundingMode;
-    bool roundNearestEven, increment;
-
-    roundingMode = status->float_rounding_mode;
-    roundNearestEven = (roundingMode == float_round_nearest_even);
-    switch (roundingMode) {
-    case float_round_nearest_even:
-    case float_round_ties_away:
-        increment = ((int64_t)absZ1 < 0);
-        break;
-    case float_round_to_zero:
-        increment = 0;
-        break;
-    case float_round_up:
-        increment = !zSign && absZ1;
-        break;
-    case float_round_down:
-        increment = zSign && absZ1;
-        break;
-    case float_round_to_odd:
-        increment = !(absZ0 & 1) && absZ1;
-        break;
-    default:
-        abort();
-    }
-    if (increment) {
-        ++absZ0;
-        if (absZ0 == 0) {
-            float_raise(float_flag_invalid, status);
-            return UINT64_MAX;
-        }
-        if (!(absZ1 << 1) && roundNearestEven) {
-            absZ0 &= ~1;
-        }
-    }
-
-    if (zSign && absZ0) {
-        float_raise(float_flag_invalid, status);
-        return 0;
-    }
-
-    if (absZ1) {
-        float_raise(float_flag_inexact, status);
-    }
-    return absZ0;
-}
-
 /*----------------------------------------------------------------------------
 | Normalizes the subnormal single-precision floating-point value represented
 | by the denormalized significand `aSig'.  The normalized exponent and
@@ -6535,122 +6454,6 @@ floatx80 floatx80_sqrt(floatx80 a, float_status *status)
                                 0, zExp, zSig0, zSig1, status);
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the quadruple-precision floating-point value
-| `a' to the 64-bit unsigned integer format.  The conversion is
-| performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic---which means in particular that the conversion is rounded
-| according to the current rounding mode.  If `a' is a NaN, the largest
-| positive integer is returned.  If the conversion overflows, the
-| largest unsigned integer is returned.  If 'a' is negative, the value is
-| rounded and zero is returned; negative values that do not round to zero
-| will raise the inexact exception.
-*----------------------------------------------------------------------------*/
-
-uint64_t float128_to_uint64(float128 a, float_status *status)
-{
-    bool aSign;
-    int aExp;
-    int shiftCount;
-    uint64_t aSig0, aSig1;
-
-    aSig0 = extractFloat128Frac0(a);
-    aSig1 = extractFloat128Frac1(a);
-    aExp = extractFloat128Exp(a);
-    aSign = extractFloat128Sign(a);
-    if (aSign && (aExp > 0x3FFE)) {
-        float_raise(float_flag_invalid, status);
-        if (float128_is_any_nan(a)) {
-            return UINT64_MAX;
-        } else {
-            return 0;
-        }
-    }
-    if (aExp) {
-        aSig0 |= UINT64_C(0x0001000000000000);
-    }
-    shiftCount = 0x402F - aExp;
-    if (shiftCount <= 0) {
-        if (0x403E < aExp) {
-            float_raise(float_flag_invalid, status);
-            return UINT64_MAX;
-        }
-        shortShift128Left(aSig0, aSig1, -shiftCount, &aSig0, &aSig1);
-    } else {
-        shift64ExtraRightJamming(aSig0, aSig1, shiftCount, &aSig0, &aSig1);
-    }
-    return roundAndPackUint64(aSign, aSig0, aSig1, status);
-}
-
-uint64_t float128_to_uint64_round_to_zero(float128 a, float_status *status)
-{
-    uint64_t v;
-    signed char current_rounding_mode = status->float_rounding_mode;
-
-    set_float_rounding_mode(float_round_to_zero, status);
-    v = float128_to_uint64(a, status);
-    set_float_rounding_mode(current_rounding_mode, status);
-
-    return v;
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the quadruple-precision floating-point
-| value `a' to the 32-bit unsigned integer format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic except that the conversion is always rounded toward zero.
-| If `a' is a NaN, the largest positive integer is returned.  Otherwise,
-| if the conversion overflows, the largest unsigned integer is returned.
-| If 'a' is negative, the value is rounded and zero is returned; negative
-| values that do not round to zero will raise the inexact exception.
-*----------------------------------------------------------------------------*/
-
-uint32_t float128_to_uint32_round_to_zero(float128 a, float_status *status)
-{
-    uint64_t v;
-    uint32_t res;
-    int old_exc_flags = get_float_exception_flags(status);
-
-    v = float128_to_uint64_round_to_zero(a, status);
-    if (v > 0xffffffff) {
-        res = 0xffffffff;
-    } else {
-        return v;
-    }
-    set_float_exception_flags(old_exc_flags, status);
-    float_raise(float_flag_invalid, status);
-    return res;
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the quadruple-precision floating-point value
-| `a' to the 32-bit unsigned integer format.  The conversion is
-| performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic---which means in particular that the conversion is rounded
-| according to the current rounding mode.  If `a' is a NaN, the largest
-| positive integer is returned.  If the conversion overflows, the
-| largest unsigned integer is returned.  If 'a' is negative, the value is
-| rounded and zero is returned; negative values that do not round to zero
-| will raise the inexact exception.
-*----------------------------------------------------------------------------*/
-
-uint32_t float128_to_uint32(float128 a, float_status *status)
-{
-    uint64_t v;
-    uint32_t res;
-    int old_exc_flags = get_float_exception_flags(status);
-
-    v = float128_to_uint64(a, status);
-    if (v > 0xffffffff) {
-        res = 0xffffffff;
-    } else {
-        return v;
-    }
-    set_float_exception_flags(old_exc_flags, status);
-    float_raise(float_flag_invalid, status);
-    return res;
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of converting the quadruple-precision floating-point
 | value `a' to the extended double-precision floating-point format.  The
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index a897a5a743..c6e327547f 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -761,7 +761,7 @@ static void partsN(round_to_int)(FloatPartsN *a, FloatRoundMode rmode,
  * the largest positive integer is returned. Otherwise, if the
  * conversion overflows, the largest integer with the same sign as `a'
  * is returned.
-*/
+ */
 static int64_t partsN(float_to_sint)(FloatPartsN *p, FloatRoundMode rmode,
                                      int scale, int64_t min, int64_t max,
                                      float_status *s)
@@ -815,3 +815,69 @@ static int64_t partsN(float_to_sint)(FloatPartsN *p, FloatRoundMode rmode,
     float_raise(flags, s);
     return r;
 }
+
+/*
+ *  Returns the result of converting the floating-point value `a' to
+ *  the unsigned integer format. The conversion is performed according
+ *  to the IEC/IEEE Standard for Binary Floating-Point
+ *  Arithmetic---which means in particular that the conversion is
+ *  rounded according to the current rounding mode. If `a' is a NaN,
+ *  the largest unsigned integer is returned. Otherwise, if the
+ *  conversion overflows, the largest unsigned integer is returned. If
+ *  the 'a' is negative, the result is rounded and zero is returned;
+ *  values that do not round to zero will raise the inexact exception
+ *  flag.
+ */
+static uint64_t partsN(float_to_uint)(FloatPartsN *p, FloatRoundMode rmode,
+                                      int scale, uint64_t max, float_status *s)
+{
+    int flags = 0;
+    uint64_t r;
+
+    switch (p->cls) {
+    case float_class_snan:
+    case float_class_qnan:
+        flags = float_flag_invalid;
+        r = max;
+        break;
+
+    case float_class_inf:
+        flags = float_flag_invalid;
+        r = p->sign ? 0 : max;
+        break;
+
+    case float_class_zero:
+        return 0;
+
+    case float_class_normal:
+        /* TODO: N - 2 is frac_size for rounding; could use input fmt. */
+        if (parts_round_to_int_normal(p, rmode, scale, N - 2)) {
+            flags = float_flag_inexact;
+            if (p->cls == float_class_zero) {
+                r = 0;
+                break;
+            }
+        }
+
+        if (p->sign) {
+            flags = float_flag_invalid;
+            r = 0;
+        } else if (p->exp > DECOMPOSED_BINARY_POINT) {
+            flags = float_flag_invalid;
+            r = max;
+        } else {
+            r = p->frac_hi >> (DECOMPOSED_BINARY_POINT - p->exp);
+            if (r > max) {
+                flags = float_flag_invalid;
+                r = max;
+            }
+        }
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+
+    float_raise(flags, s);
+    return r;
+}
-- 
2.25.1


