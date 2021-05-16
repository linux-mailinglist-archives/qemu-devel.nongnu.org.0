Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B30381EF0
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:59:31 +0200 (CEST)
Received: from localhost ([::1]:60130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGMk-0000To-En
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liG2B-0003or-MU
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:38:15 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:33772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liG26-0001N6-Vm
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:38:15 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id 5so1894278qvk.0
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtiGKpdh5DJMz2+k60GL7qgBI13NuhGDzP/LkQRlm78=;
 b=HgaqwUlOkAIUlhIHZaI+AuBq5O8vddp+5nZOlJUdmmnPuerImvG7RRK8Gb75mUqmQ/
 EWpZwUc7si52FbIlvcaPTbg/eeihUy1aCMO8MfqdRxDhlYf0Jge6GUro5HPMcXtObtau
 mKyr+zx65y2UKMaMrXr5k8zBwstDWQEdjs979Mq6Z0LF1yuDXjOHsc1RdkFeGtaLmKQG
 WqdIn7pYe5L3HQxKup8prGu3U4CVgiknHUGPzGdOtvx9SxBZJPlwFAnicJt4f+rBCrpx
 QI6Og5LnrnROt1+bn/qPx4SM4RM6e9bABYEPMUbgfvEcLCLQTovRPMOtuz5ES2b2M9tv
 1tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtiGKpdh5DJMz2+k60GL7qgBI13NuhGDzP/LkQRlm78=;
 b=qq/gHawIpuHb6FEOI4v3Q5Najs0GfWQLA4j6AvMJjJVwi50nkCMPWQfDhABilHEc87
 4sITqf67N+Ag6pvqKfd5tziVhqI0ji6djBMN+T07yfOGYYOUOXMOSPJ3SGiUbY+8Fx2s
 gvnY3g7/CkM6O4hbfbRM7Y9kJ1J+JVl7hYszET6pc1NcYHRVgUxAvIIeOVamq9Ntxq0z
 Jj7HrHa4QTw960A8QWKfVDgD4mXPNxcblNViz+LNowV9WtFu1fqtHN271apHveQjhJIy
 kbdhlZzX1S9tuvWLI/xy8tKKVUz+XDwqaUX9fW2YckbkQFTX7Lz+baMkxRcTKoG5lMJF
 A2Zg==
X-Gm-Message-State: AOAM530tsPP2hEsr93qVDMzdQ+0tTDWB/0vw0rw9E0qD/zrFGhaM1PDV
 spOAyWHZvzp1RacA/NJCAzdDBlOf9WNL4XOExss=
X-Google-Smtp-Source: ABdhPJyFgwrVC9c5XRgXKD2XYOdzG3PAlCDUZFRv/iB4vsrWrk6mEnOoRCpNdxM7ErBMI9NFFInKOw==
X-Received: by 2002:a0c:a909:: with SMTP id y9mr55091304qva.20.1621168689817; 
 Sun, 16 May 2021 05:38:09 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 195sm8180765qkj.1.2021.05.16.05.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:38:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/46] softfloat: Convert float-to-float conversions with
 float128
Date: Sun, 16 May 2021 07:34:29 -0500
Message-Id: <20210516123431.718318-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce parts_float_to_float_widen and parts_float_to_float_narrow.
Use them for float128_to_float{32,64} and float{32,64}_to_float128.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 203 ++++++++++++++++--------------------------------
 1 file changed, 69 insertions(+), 134 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 80025539ef..d056b5730b 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2092,6 +2092,35 @@ static void parts128_float_to_float(FloatParts128 *a, float_status *s)
 #define parts_float_to_float(P, S) \
     PARTS_GENERIC_64_128(float_to_float, P)(P, S)
 
+static void parts_float_to_float_narrow(FloatParts64 *a, FloatParts128 *b,
+                                        float_status *s)
+{
+    a->cls = b->cls;
+    a->sign = b->sign;
+    a->exp = b->exp;
+
+    if (a->cls == float_class_normal) {
+        frac_truncjam(a, b);
+    } else if (is_nan(a->cls)) {
+        /* Discard the low bits of the NaN. */
+        a->frac = b->frac_hi;
+        parts_return_nan(a, s);
+    }
+}
+
+static void parts_float_to_float_widen(FloatParts128 *a, FloatParts64 *b,
+                                       float_status *s)
+{
+    a->cls = b->cls;
+    a->sign = b->sign;
+    a->exp = b->exp;
+    frac_widen(a, b);
+
+    if (is_nan(a->cls)) {
+        parts_return_nan(a, s);
+    }
+}
+
 float32 float16_to_float32(float16 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
@@ -2215,6 +2244,46 @@ bfloat16 float64_to_bfloat16(float64 a, float_status *s)
     return bfloat16_round_pack_canonical(&p, s);
 }
 
+float32 float128_to_float32(float128 a, float_status *s)
+{
+    FloatParts64 p64;
+    FloatParts128 p128;
+
+    float128_unpack_canonical(&p128, a, s);
+    parts_float_to_float_narrow(&p64, &p128, s);
+    return float32_round_pack_canonical(&p64, s);
+}
+
+float64 float128_to_float64(float128 a, float_status *s)
+{
+    FloatParts64 p64;
+    FloatParts128 p128;
+
+    float128_unpack_canonical(&p128, a, s);
+    parts_float_to_float_narrow(&p64, &p128, s);
+    return float64_round_pack_canonical(&p64, s);
+}
+
+float128 float32_to_float128(float32 a, float_status *s)
+{
+    FloatParts64 p64;
+    FloatParts128 p128;
+
+    float32_unpack_canonical(&p64, a, s);
+    parts_float_to_float_widen(&p128, &p64, s);
+    return float128_round_pack_canonical(&p128, s);
+}
+
+float128 float64_to_float128(float64 a, float_status *s)
+{
+    FloatParts64 p64;
+    FloatParts128 p128;
+
+    float64_unpack_canonical(&p64, a, s);
+    parts_float_to_float_widen(&p128, &p64, s);
+    return float128_round_pack_canonical(&p128, s);
+}
+
 /*
  * Rounds the floating-point value `a' to an integer, and returns the
  * result as a floating-point value. The operation is performed
@@ -5175,38 +5244,6 @@ floatx80 float32_to_floatx80(float32 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the single-precision floating-point value
-| `a' to the double-precision floating-point format.  The conversion is
-| performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 float32_to_float128(float32 a, float_status *status)
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
-            return commonNaNToFloat128(float32ToCommonNaN(a, status), status);
-        }
-        return packFloat128( aSign, 0x7FFF, 0, 0 );
-    }
-    if ( aExp == 0 ) {
-        if ( aSig == 0 ) return packFloat128( aSign, 0, 0, 0 );
-        normalizeFloat32Subnormal( aSig, &aExp, &aSig );
-        --aExp;
-    }
-    return packFloat128( aSign, aExp + 0x3F80, ( (uint64_t) aSig )<<25, 0 );
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the remainder of the single-precision floating-point value `a'
 | with respect to the corresponding value `b'.  The operation is performed
@@ -5480,40 +5517,6 @@ floatx80 float64_to_floatx80(float64 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the double-precision floating-point value
-| `a' to the quadruple-precision floating-point format.  The conversion is
-| performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 float64_to_float128(float64 a, float_status *status)
-{
-    bool aSign;
-    int aExp;
-    uint64_t aSig, zSig0, zSig1;
-
-    a = float64_squash_input_denormal(a, status);
-    aSig = extractFloat64Frac( a );
-    aExp = extractFloat64Exp( a );
-    aSign = extractFloat64Sign( a );
-    if ( aExp == 0x7FF ) {
-        if (aSig) {
-            return commonNaNToFloat128(float64ToCommonNaN(a, status), status);
-        }
-        return packFloat128( aSign, 0x7FFF, 0, 0 );
-    }
-    if ( aExp == 0 ) {
-        if ( aSig == 0 ) return packFloat128( aSign, 0, 0, 0 );
-        normalizeFloat64Subnormal( aSig, &aExp, &aSig );
-        --aExp;
-    }
-    shift128Right( aSig, 0, 4, &zSig0, &zSig1 );
-    return packFloat128( aSign, aExp + 0x3C00, zSig0, zSig1 );
-
-}
-
-
 /*----------------------------------------------------------------------------
 | Returns the remainder of the double-precision floating-point value `a'
 | with respect to the corresponding value `b'.  The operation is performed
@@ -6915,74 +6918,6 @@ uint32_t float128_to_uint32(float128 a, float_status *status)
     return res;
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the quadruple-precision floating-point
-| value `a' to the single-precision floating-point format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float32 float128_to_float32(float128 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp;
-    uint64_t aSig0, aSig1;
-    uint32_t zSig;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    aSign = extractFloat128Sign( a );
-    if ( aExp == 0x7FFF ) {
-        if ( aSig0 | aSig1 ) {
-            return commonNaNToFloat32(float128ToCommonNaN(a, status), status);
-        }
-        return packFloat32( aSign, 0xFF, 0 );
-    }
-    aSig0 |= ( aSig1 != 0 );
-    shift64RightJamming( aSig0, 18, &aSig0 );
-    zSig = aSig0;
-    if ( aExp || zSig ) {
-        zSig |= 0x40000000;
-        aExp -= 0x3F81;
-    }
-    return roundAndPackFloat32(aSign, aExp, zSig, status);
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the quadruple-precision floating-point
-| value `a' to the double-precision floating-point format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float64 float128_to_float64(float128 a, float_status *status)
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
-            return commonNaNToFloat64(float128ToCommonNaN(a, status), status);
-        }
-        return packFloat64( aSign, 0x7FF, 0 );
-    }
-    shortShift128Left( aSig0, aSig1, 14, &aSig0, &aSig1 );
-    aSig0 |= ( aSig1 != 0 );
-    if ( aExp || aSig0 ) {
-        aSig0 |= UINT64_C(0x4000000000000000);
-        aExp -= 0x3C01;
-    }
-    return roundAndPackFloat64(aSign, aExp, aSig0, status);
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of converting the quadruple-precision floating-point
 | value `a' to the extended double-precision floating-point format.  The
-- 
2.25.1


