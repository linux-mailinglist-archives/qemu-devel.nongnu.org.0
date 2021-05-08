Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37EB376ED9
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:35:53 +0200 (CEST)
Received: from localhost ([::1]:60586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCor-0007b3-3G
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8M-0003Wk-LM
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:52:00 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8B-0005Zs-UM
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:57 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 b14-20020a17090a6e0eb0290155c7f6a356so5542382pjk.0
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=krbccElr6YBGv/dTDG8O6hv4U6UMSoNxQsDJQmD9EcE=;
 b=gYq0cjMvPMbh0vFKsUhAveW1xnYBWLRtdjRjiud7ZdJZdL44RKnXpE/+SSMCP7E+pL
 +g4t1a5avnqdtBfgrUtAli9YOl5KxF7CR5phwb/q/V6LhPBtJKM4fM6Nux78XQSLFq6p
 NKbFSnId+/zMPNMvjEMZML+aBsE6q0A9YTEzMERolaWYhaj5zYggovW1ydyKJtFogC20
 SWDFP5aPEB6VB8+rGKu8284EmUQlkj2j6faTWbo1v7b+TAEKpVbzZgPqY7wgnewougB1
 bFRgamlytLAUQ024d9dMQAo/n/VPqZ2w1w2PMmB8N9o4SVhec1t6dbZLnWwSya1K0BYc
 TOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=krbccElr6YBGv/dTDG8O6hv4U6UMSoNxQsDJQmD9EcE=;
 b=N49FvzB0HL8/ZAbSMcMOrH6LlOFq+5DeOZ1zoCEroTl05aygGS8DnTi1XDFEX6KVYq
 gG8DE+vmGhhPzNVFQG/tn/oBQsWs9vuG/RRPt/VFx+ePjGBz9RnBpx2om6x1yXx1Tqjd
 Atu4KDFUGyDU9Fp3mD2DqdGe5ATBQa0nQEnqR4zCZ9D9fgzSNJ84iot8k4v6Yg9gNXZO
 m6vtMrgyEwYcEEGtGAIiKj9yiSVaFjs+zmVfbMFp42Pecx01sasOVSUyGasojoZvLC/f
 2ph+zLIJXBaYqWhAqxq+XRBicJTQ6XvED46W2G1rpmsCHbybRWfmAmaCB/qBL9InWesI
 JAEw==
X-Gm-Message-State: AOAM533eyRH1WFMjrtKBOifxF1rgzgMYLNF6CZdJY+e6g2ETsP5MQ2GZ
 Af5xAtjMJemnTPOpnfMfIRoGXHFokkDfaA==
X-Google-Smtp-Source: ABdhPJxa8q+UyDvp8AdtKb5WRYjzUnstoPgZEc9A2mS9e7gc3OEObSQN0bE0sbd+bo4BnRD3acHrrw==
X-Received: by 2002:a17:90a:744e:: with SMTP id
 o14mr1621318pjk.96.1620438706637; 
 Fri, 07 May 2021 18:51:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 66/72] softfloat: Convert floatx80 float conversions to
 FloatParts
Date: Fri,  7 May 2021 18:47:56 -0700
Message-Id: <20210508014802.892561-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
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

This is the last use of commonNaNT and all of the routines
that use it, so remove all of them for Werror.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c                | 276 ++++++++-------------------------
 fpu/softfloat-specialize.c.inc | 175 ---------------------
 2 files changed, 67 insertions(+), 384 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 82f71896ac..d7c6c37d99 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2560,6 +2560,73 @@ float128 float64_to_float128(float64 a, float_status *s)
     return float128_round_pack_canonical(&p128, s);
 }
 
+float32 floatx80_to_float32(floatx80 a, float_status *s)
+{
+    FloatParts64 p64;
+    FloatParts128 p128;
+
+    if (floatx80_unpack_canonical(&p128, a, s)) {
+        parts_float_to_float_narrow(&p64, &p128, s);
+    } else {
+        parts_default_nan(&p64, s);
+    }
+    return float32_round_pack_canonical(&p64, s);
+}
+
+float64 floatx80_to_float64(floatx80 a, float_status *s)
+{
+    FloatParts64 p64;
+    FloatParts128 p128;
+
+    if (floatx80_unpack_canonical(&p128, a, s)) {
+        parts_float_to_float_narrow(&p64, &p128, s);
+    } else {
+        parts_default_nan(&p64, s);
+    }
+    return float64_round_pack_canonical(&p64, s);
+}
+
+float128 floatx80_to_float128(floatx80 a, float_status *s)
+{
+    FloatParts128 p;
+
+    if (floatx80_unpack_canonical(&p, a, s)) {
+        parts_float_to_float(&p, s);
+    } else {
+        parts_default_nan(&p, s);
+    }
+    return float128_round_pack_canonical(&p, s);
+}
+
+floatx80 float32_to_floatx80(float32 a, float_status *s)
+{
+    FloatParts64 p64;
+    FloatParts128 p128;
+
+    float32_unpack_canonical(&p64, a, s);
+    parts_float_to_float_widen(&p128, &p64, s);
+    return floatx80_round_pack_canonical(&p128, s);
+}
+
+floatx80 float64_to_floatx80(float64 a, float_status *s)
+{
+    FloatParts64 p64;
+    FloatParts128 p128;
+
+    float64_unpack_canonical(&p64, a, s);
+    parts_float_to_float_widen(&p128, &p64, s);
+    return floatx80_round_pack_canonical(&p128, s);
+}
+
+floatx80 float128_to_floatx80(float128 a, float_status *s)
+{
+    FloatParts128 p;
+
+    float128_unpack_canonical(&p, a, s);
+    parts_float_to_float(&p, s);
+    return floatx80_round_pack_canonical(&p, s);
+}
+
 /*
  * Round to integral value
  */
@@ -5048,42 +5115,6 @@ static float128 normalizeRoundAndPackFloat128(bool zSign, int32_t zExp,
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the single-precision floating-point value
-| `a' to the extended double-precision floating-point format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 float32_to_floatx80(float32 a, float_status *status)
-{
-    bool aSign;
-    int aExp;
-    uint32_t aSig;
-
-    a = float32_squash_input_denormal(a, status);
-    aSig = extractFloat32Frac( a );
-    aExp = extractFloat32Exp( a );
-    aSign = extractFloat32Sign( a );
-    if ( aExp == 0xFF ) {
-        if (aSig) {
-            floatx80 res = commonNaNToFloatx80(float32ToCommonNaN(a, status),
-                                               status);
-            return floatx80_silence_nan(res, status);
-        }
-        return packFloatx80(aSign,
-                            floatx80_infinity_high,
-                            floatx80_infinity_low);
-    }
-    if ( aExp == 0 ) {
-        if ( aSig == 0 ) return packFloatx80( aSign, 0, 0 );
-        normalizeFloat32Subnormal( aSig, &aExp, &aSig );
-    }
-    aSig |= 0x00800000;
-    return packFloatx80( aSign, aExp + 0x3F80, ( (uint64_t) aSig )<<40 );
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the remainder of the single-precision floating-point value `a'
 | with respect to the corresponding value `b'.  The operation is performed
@@ -5320,43 +5351,6 @@ float32 float32_log2(float32 a, float_status *status)
     return normalizeRoundAndPackFloat32(zSign, 0x85, zSig, status);
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the double-precision floating-point value
-| `a' to the extended double-precision floating-point format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 float64_to_floatx80(float64 a, float_status *status)
-{
-    bool aSign;
-    int aExp;
-    uint64_t aSig;
-
-    a = float64_squash_input_denormal(a, status);
-    aSig = extractFloat64Frac( a );
-    aExp = extractFloat64Exp( a );
-    aSign = extractFloat64Sign( a );
-    if ( aExp == 0x7FF ) {
-        if (aSig) {
-            floatx80 res = commonNaNToFloatx80(float64ToCommonNaN(a, status),
-                                               status);
-            return floatx80_silence_nan(res, status);
-        }
-        return packFloatx80(aSign,
-                            floatx80_infinity_high,
-                            floatx80_infinity_low);
-    }
-    if ( aExp == 0 ) {
-        if ( aSig == 0 ) return packFloatx80( aSign, 0, 0 );
-        normalizeFloat64Subnormal( aSig, &aExp, &aSig );
-    }
-    return
-        packFloatx80(
-            aSign, aExp + 0x3C00, (aSig | UINT64_C(0x0010000000000000)) << 11);
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the remainder of the double-precision floating-point value `a'
 | with respect to the corresponding value `b'.  The operation is performed
@@ -5667,104 +5661,6 @@ int64_t floatx80_to_int64_round_to_zero(floatx80 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the extended double-precision floating-
-| point value `a' to the single-precision floating-point format.  The
-| conversion is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float32 floatx80_to_float32(floatx80 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp;
-    uint64_t aSig;
-
-    if (floatx80_invalid_encoding(a)) {
-        float_raise(float_flag_invalid, status);
-        return float32_default_nan(status);
-    }
-    aSig = extractFloatx80Frac( a );
-    aExp = extractFloatx80Exp( a );
-    aSign = extractFloatx80Sign( a );
-    if ( aExp == 0x7FFF ) {
-        if ( (uint64_t) ( aSig<<1 ) ) {
-            float32 res = commonNaNToFloat32(floatx80ToCommonNaN(a, status),
-                                             status);
-            return float32_silence_nan(res, status);
-        }
-        return packFloat32( aSign, 0xFF, 0 );
-    }
-    shift64RightJamming( aSig, 33, &aSig );
-    if ( aExp || aSig ) aExp -= 0x3F81;
-    return roundAndPackFloat32(aSign, aExp, aSig, status);
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the extended double-precision floating-
-| point value `a' to the double-precision floating-point format.  The
-| conversion is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float64 floatx80_to_float64(floatx80 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp;
-    uint64_t aSig, zSig;
-
-    if (floatx80_invalid_encoding(a)) {
-        float_raise(float_flag_invalid, status);
-        return float64_default_nan(status);
-    }
-    aSig = extractFloatx80Frac( a );
-    aExp = extractFloatx80Exp( a );
-    aSign = extractFloatx80Sign( a );
-    if ( aExp == 0x7FFF ) {
-        if ( (uint64_t) ( aSig<<1 ) ) {
-            float64 res = commonNaNToFloat64(floatx80ToCommonNaN(a, status),
-                                             status);
-            return float64_silence_nan(res, status);
-        }
-        return packFloat64( aSign, 0x7FF, 0 );
-    }
-    shift64RightJamming( aSig, 1, &zSig );
-    if ( aExp || aSig ) aExp -= 0x3C01;
-    return roundAndPackFloat64(aSign, aExp, zSig, status);
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the extended double-precision floating-
-| point value `a' to the quadruple-precision floating-point format.  The
-| conversion is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 floatx80_to_float128(floatx80 a, float_status *status)
-{
-    bool aSign;
-    int aExp;
-    uint64_t aSig, zSig0, zSig1;
-
-    if (floatx80_invalid_encoding(a)) {
-        float_raise(float_flag_invalid, status);
-        return float128_default_nan(status);
-    }
-    aSig = extractFloatx80Frac( a );
-    aExp = extractFloatx80Exp( a );
-    aSign = extractFloatx80Sign( a );
-    if ( ( aExp == 0x7FFF ) && (uint64_t) ( aSig<<1 ) ) {
-        float128 res = commonNaNToFloat128(floatx80ToCommonNaN(a, status),
-                                           status);
-        return float128_silence_nan(res, status);
-    }
-    shift128Right( aSig<<1, 0, 16, &zSig0, &zSig1 );
-    return packFloat128( aSign, aExp, zSig0, zSig1 );
-
-}
-
 /*----------------------------------------------------------------------------
 | Rounds the extended double-precision floating-point value `a'
 | to the precision provided by floatx80_rounding_precision and returns the
@@ -5937,44 +5833,6 @@ floatx80 floatx80_mod(floatx80 a, floatx80 b, float_status *status)
     return floatx80_modrem(a, b, true, &quotient, status);
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the quadruple-precision floating-point
-| value `a' to the extended double-precision floating-point format.  The
-| conversion is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 float128_to_floatx80(float128 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp;
-    uint64_t aSig0, aSig1;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    aSign = extractFloat128Sign( a );
-    if ( aExp == 0x7FFF ) {
-        if ( aSig0 | aSig1 ) {
-            floatx80 res = commonNaNToFloatx80(float128ToCommonNaN(a, status),
-                                               status);
-            return floatx80_silence_nan(res, status);
-        }
-        return packFloatx80(aSign, floatx80_infinity_high,
-                                   floatx80_infinity_low);
-    }
-    if ( aExp == 0 ) {
-        if ( ( aSig0 | aSig1 ) == 0 ) return packFloatx80( aSign, 0, 0 );
-        normalizeFloat128Subnormal( aSig0, aSig1, &aExp, &aSig0, &aSig1 );
-    }
-    else {
-        aSig0 |= UINT64_C(0x0001000000000000);
-    }
-    shortShift128Left( aSig0, aSig1, 15, &aSig0, &aSig1 );
-    return roundAndPackFloatx80(80, aSign, aExp, aSig0, aSig1, status);
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the remainder of the quadruple-precision floating-point value `a'
 | with respect to the corresponding value `b'.  The operation is performed
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index a0cf016b4f..88eab344df 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -257,14 +257,6 @@ floatx80 floatx80_default_nan(float_status *status)
 const floatx80 floatx80_infinity
     = make_floatx80_init(floatx80_infinity_high, floatx80_infinity_low);
 
-/*----------------------------------------------------------------------------
-| Internal canonical NaN format.
-*----------------------------------------------------------------------------*/
-typedef struct {
-    bool sign;
-    uint64_t high, low;
-} commonNaNT;
-
 /*----------------------------------------------------------------------------
 | Returns 1 if the half-precision floating-point value `a' is a quiet
 | NaN; otherwise returns 0.
@@ -380,46 +372,6 @@ bool float32_is_signaling_nan(float32 a_, float_status *status)
     }
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the single-precision floating-point NaN
-| `a' to the canonical NaN format.  If `a' is a signaling NaN, the invalid
-| exception is raised.
-*----------------------------------------------------------------------------*/
-
-static commonNaNT float32ToCommonNaN(float32 a, float_status *status)
-{
-    commonNaNT z;
-
-    if (float32_is_signaling_nan(a, status)) {
-        float_raise(float_flag_invalid, status);
-    }
-    z.sign = float32_val(a) >> 31;
-    z.low = 0;
-    z.high = ((uint64_t)float32_val(a)) << 41;
-    return z;
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the canonical NaN `a' to the single-
-| precision floating-point format.
-*----------------------------------------------------------------------------*/
-
-static float32 commonNaNToFloat32(commonNaNT a, float_status *status)
-{
-    uint32_t mantissa = a.high >> 41;
-
-    if (status->default_nan_mode) {
-        return float32_default_nan(status);
-    }
-
-    if (mantissa) {
-        return make_float32(
-            (((uint32_t)a.sign) << 31) | 0x7F800000 | (a.high >> 41));
-    } else {
-        return float32_default_nan(status);
-    }
-}
-
 /*----------------------------------------------------------------------------
 | Select which NaN to propagate for a two-input operation.
 | IEEE754 doesn't specify all the details of this, so the
@@ -780,48 +732,6 @@ bool float64_is_signaling_nan(float64 a_, float_status *status)
     }
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the double-precision floating-point NaN
-| `a' to the canonical NaN format.  If `a' is a signaling NaN, the invalid
-| exception is raised.
-*----------------------------------------------------------------------------*/
-
-static commonNaNT float64ToCommonNaN(float64 a, float_status *status)
-{
-    commonNaNT z;
-
-    if (float64_is_signaling_nan(a, status)) {
-        float_raise(float_flag_invalid, status);
-    }
-    z.sign = float64_val(a) >> 63;
-    z.low = 0;
-    z.high = float64_val(a) << 12;
-    return z;
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the canonical NaN `a' to the double-
-| precision floating-point format.
-*----------------------------------------------------------------------------*/
-
-static float64 commonNaNToFloat64(commonNaNT a, float_status *status)
-{
-    uint64_t mantissa = a.high >> 12;
-
-    if (status->default_nan_mode) {
-        return float64_default_nan(status);
-    }
-
-    if (mantissa) {
-        return make_float64(
-              (((uint64_t) a.sign) << 63)
-            | UINT64_C(0x7FF0000000000000)
-            | (a.high >> 12));
-    } else {
-        return float64_default_nan(status);
-    }
-}
-
 /*----------------------------------------------------------------------------
 | Takes two double-precision floating-point values `a' and `b', one of which
 | is a NaN, and returns the appropriate NaN result.  If either `a' or `b' is a
@@ -941,55 +851,6 @@ floatx80 floatx80_silence_nan(floatx80 a, float_status *status)
     return a;
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the extended double-precision floating-
-| point NaN `a' to the canonical NaN format.  If `a' is a signaling NaN, the
-| invalid exception is raised.
-*----------------------------------------------------------------------------*/
-
-static commonNaNT floatx80ToCommonNaN(floatx80 a, float_status *status)
-{
-    floatx80 dflt;
-    commonNaNT z;
-
-    if (floatx80_is_signaling_nan(a, status)) {
-        float_raise(float_flag_invalid, status);
-    }
-    if (a.low >> 63) {
-        z.sign = a.high >> 15;
-        z.low = 0;
-        z.high = a.low << 1;
-    } else {
-        dflt = floatx80_default_nan(status);
-        z.sign = dflt.high >> 15;
-        z.low = 0;
-        z.high = dflt.low << 1;
-    }
-    return z;
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the canonical NaN `a' to the extended
-| double-precision floating-point format.
-*----------------------------------------------------------------------------*/
-
-static floatx80 commonNaNToFloatx80(commonNaNT a, float_status *status)
-{
-    floatx80 z;
-
-    if (status->default_nan_mode) {
-        return floatx80_default_nan(status);
-    }
-
-    if (a.high >> 1) {
-        z.low = UINT64_C(0x8000000000000000) | a.high >> 1;
-        z.high = (((uint16_t)a.sign) << 15) | 0x7FFF;
-    } else {
-        z = floatx80_default_nan(status);
-    }
-    return z;
-}
-
 /*----------------------------------------------------------------------------
 | Takes two extended double-precision floating-point values `a' and `b', one
 | of which is a NaN, and returns the appropriate NaN result.  If either `a' or
@@ -1082,42 +943,6 @@ bool float128_is_signaling_nan(float128 a, float_status *status)
     }
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the quadruple-precision floating-point NaN
-| `a' to the canonical NaN format.  If `a' is a signaling NaN, the invalid
-| exception is raised.
-*----------------------------------------------------------------------------*/
-
-static commonNaNT float128ToCommonNaN(float128 a, float_status *status)
-{
-    commonNaNT z;
-
-    if (float128_is_signaling_nan(a, status)) {
-        float_raise(float_flag_invalid, status);
-    }
-    z.sign = a.high >> 63;
-    shortShift128Left(a.high, a.low, 16, &z.high, &z.low);
-    return z;
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the canonical NaN `a' to the quadruple-
-| precision floating-point format.
-*----------------------------------------------------------------------------*/
-
-static float128 commonNaNToFloat128(commonNaNT a, float_status *status)
-{
-    float128 z;
-
-    if (status->default_nan_mode) {
-        return float128_default_nan(status);
-    }
-
-    shift128Right(a.high, a.low, 16, &z.high, &z.low);
-    z.high |= (((uint64_t)a.sign) << 63) | UINT64_C(0x7FFF000000000000);
-    return z;
-}
-
 /*----------------------------------------------------------------------------
 | Takes two quadruple-precision floating-point values `a' and `b', one of
 | which is a NaN, and returns the appropriate NaN result.  If either `a' or
-- 
2.25.1


