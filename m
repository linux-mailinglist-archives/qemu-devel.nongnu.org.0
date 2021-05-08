Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D321E376E93
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:28:45 +0200 (CEST)
Received: from localhost ([::1]:60362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfChw-0005Yc-OG
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC80-0002nG-Lp
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:36 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:34603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC7w-0005PE-JD
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:36 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 t2-20020a17090a0242b0290155433387beso5537710pje.1
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MZJE8gIUuQfpQ/ySHho/M1CJLdsIgFJthIThLJ57+OM=;
 b=rfgv0g4EaOS+NX+CqNbaaYLU/Oq4n3Ga6J1Te6/0GyVL2YteqXrHuz8t54AwsxC9pE
 brQ3MsOtbpG5BvweiTo7HopYU8v09tcGZEnHwf67FhwVvstG3OFf84NMbmrNNM3H2x48
 ZrRsu1rhUFAhsPn3XL7kSjqcEThN21h6lXlg6sQSAqz8MqJGiTbWqVZrA5/3ZTrrTWEV
 7E9S31OrG3sVcIHhAI/Tv8DmrkYBy2l584u4GJRHuYsKWyWRwo30Vo+TrQ58M9bxhKc+
 3Aoj7KESNg1/YRmq9MIm5nH+XPK5tqWTwqejehlzRJQ1sU0s+JjcO8s+a7gibBfaXeqb
 pYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MZJE8gIUuQfpQ/ySHho/M1CJLdsIgFJthIThLJ57+OM=;
 b=DkXUMP0tWHQrthwB+GEFb2osc9thPwgvlB6x4Oe84AOmPACqcgGNMPSJLD/G3+Ixon
 zfxZlQ9hbwUwEfp1MEBmu/TtIqtHLiLDWk4AY/kOLFI1aMJI/PIa/XTot0UA7F8j4wIK
 LJ93fcCVvmdzm67kjY/EEXjfmuWvFeO/UnqRz3td9FKt+Z0qwZm5dBvt6OTLpLT1kMgQ
 w6awafFMzT2eL8MSa+tg2lrx2GBJcK9PpNUPzEp1OBuQV0YqeWvM9qJRl2g48Skze8Xa
 4Ibb1nuOh8d/Y2WGr+gKFNSHKJBgxPwvA4a5QwxZ1DvhT5sSKxX/gLaZ3XCgTmNz+3j3
 poRA==
X-Gm-Message-State: AOAM531hdRnkpc3fBvifxb+rnJ2Tz0XM2A9/RLTBppTSQuxW1YmvCNr0
 3l0uUnTuRCrnwT2unkCqxMTrT9k+EkMTbA==
X-Google-Smtp-Source: ABdhPJx8uThVNBQYy07gpMOc50J7o+OE26b67GTfhYqb1K9QoUZI3XFyhlIAxlWbM44bvsVgq3i99w==
X-Received: by 2002:a17:90b:4b11:: with SMTP id
 lx17mr25878155pjb.130.1620438691261; 
 Fri, 07 May 2021 18:51:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 42/72] softfloat: Move div_floats to softfloat-parts.c.inc
Date: Fri,  7 May 2021 18:47:32 -0700
Message-Id: <20210508014802.892561-43-richard.henderson@linaro.org>
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

Rename to parts$N_div.
Implement float128_div with FloatParts128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 290 +++++++++++++++-----------------------
 fpu/softfloat-parts.c.inc |  55 ++++++++
 2 files changed, 171 insertions(+), 174 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index a42c297828..8efa52f7ec 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -802,6 +802,14 @@ static FloatParts128 *parts128_muladd(FloatParts128 *a, FloatParts128 *b,
 #define parts_muladd(A, B, C, Z, S) \
     PARTS_GENERIC_64_128(muladd, A)(A, B, C, Z, S)
 
+static FloatParts64 *parts64_div(FloatParts64 *a, FloatParts64 *b,
+                                 float_status *s);
+static FloatParts128 *parts128_div(FloatParts128 *a, FloatParts128 *b,
+                                   float_status *s);
+
+#define parts_div(A, B, S) \
+    PARTS_GENERIC_64_128(div, A)(A, B, S)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -894,6 +902,87 @@ static void frac128_clear(FloatParts128 *a)
 
 #define frac_clear(A)  FRAC_GENERIC_64_128(clear, A)(A)
 
+static bool frac64_div(FloatParts64 *a, FloatParts64 *b)
+{
+    uint64_t n1, n0, r, q;
+    bool ret;
+
+    /*
+     * We want a 2*N / N-bit division to produce exactly an N-bit
+     * result, so that we do not lose any precision and so that we
+     * do not have to renormalize afterward.  If A.frac < B.frac,
+     * then division would produce an (N-1)-bit result; shift A left
+     * by one to produce the an N-bit result, and return true to
+     * decrement the exponent to match.
+     *
+     * The udiv_qrnnd algorithm that we're using requires normalization,
+     * i.e. the msb of the denominator must be set, which is already true.
+     */
+    ret = a->frac < b->frac;
+    if (ret) {
+        n0 = a->frac;
+        n1 = 0;
+    } else {
+        n0 = a->frac >> 1;
+        n1 = a->frac << 63;
+    }
+    q = udiv_qrnnd(&r, n0, n1, b->frac);
+
+    /* Set lsb if there is a remainder, to set inexact. */
+    a->frac = q | (r != 0);
+
+    return ret;
+}
+
+static bool frac128_div(FloatParts128 *a, FloatParts128 *b)
+{
+    uint64_t q0, q1, a0, a1, b0, b1;
+    uint64_t r0, r1, r2, r3, t0, t1, t2, t3;
+    bool ret = false;
+
+    a0 = a->frac_hi, a1 = a->frac_lo;
+    b0 = b->frac_hi, b1 = b->frac_lo;
+
+    ret = lt128(a0, a1, b0, b1);
+    if (!ret) {
+        a1 = shr_double(a0, a1, 1);
+        a0 = a0 >> 1;
+    }
+
+    /* Use 128/64 -> 64 division as estimate for 192/128 -> 128 division. */
+    q0 = estimateDiv128To64(a0, a1, b0);
+
+    /*
+     * Estimate is high because B1 was not included (unless B1 == 0).
+     * Reduce quotient and increase remainder until remainder is non-negative.
+     * This loop will execute 0 to 2 times.
+     */
+    mul128By64To192(b0, b1, q0, &t0, &t1, &t2);
+    sub192(a0, a1, 0, t0, t1, t2, &r0, &r1, &r2);
+    while (r0 != 0) {
+        q0--;
+        add192(r0, r1, r2, 0, b0, b1, &r0, &r1, &r2);
+    }
+
+    /* Repeat using the remainder, producing a second word of quotient. */
+    q1 = estimateDiv128To64(r1, r2, b0);
+    mul128By64To192(b0, b1, q1, &t1, &t2, &t3);
+    sub192(r1, r2, 0, t1, t2, t3, &r1, &r2, &r3);
+    while (r1 != 0) {
+        q1--;
+        add192(r1, r2, r3, 0, b0, b1, &r1, &r2, &r3);
+    }
+
+    /* Any remainder indicates inexact; set sticky bit. */
+    q1 |= (r2 | r3) != 0;
+
+    a->frac_hi = q0;
+    a->frac_lo = q1;
+    return ret;
+}
+
+#define frac_div(A, B)  FRAC_GENERIC_64_128(div, A)(A, B)
+
 static bool frac64_eqz(FloatParts64 *a)
 {
     return a->frac == 0;
@@ -1820,110 +1909,42 @@ float128 QEMU_FLATTEN float128_muladd(float128 a, float128 b, float128 c,
 }
 
 /*
- * Returns the result of dividing the floating-point value `a' by the
- * corresponding value `b'. The operation is performed according to
- * the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
+ * Division
  */
 
-static FloatParts64 div_floats(FloatParts64 a, FloatParts64 b, float_status *s)
-{
-    bool sign = a.sign ^ b.sign;
-
-    if (a.cls == float_class_normal && b.cls == float_class_normal) {
-        uint64_t n0, n1, q, r;
-        int exp = a.exp - b.exp;
-
-        /*
-         * We want a 2*N / N-bit division to produce exactly an N-bit
-         * result, so that we do not lose any precision and so that we
-         * do not have to renormalize afterward.  If A.frac < B.frac,
-         * then division would produce an (N-1)-bit result; shift A left
-         * by one to produce the an N-bit result, and decrement the
-         * exponent to match.
-         *
-         * The udiv_qrnnd algorithm that we're using requires normalization,
-         * i.e. the msb of the denominator must be set, which is already true.
-         */
-        if (a.frac < b.frac) {
-            exp -= 1;
-            shift128Left(0, a.frac, DECOMPOSED_BINARY_POINT + 1, &n1, &n0);
-        } else {
-            shift128Left(0, a.frac, DECOMPOSED_BINARY_POINT, &n1, &n0);
-        }
-        q = udiv_qrnnd(&r, n1, n0, b.frac);
-
-        /* Set lsb if there is a remainder, to set inexact. */
-        a.frac = q | (r != 0);
-        a.sign = sign;
-        a.exp = exp;
-        return a;
-    }
-    /* handle all the NaN cases */
-    if (is_nan(a.cls) || is_nan(b.cls)) {
-        return *parts_pick_nan(&a, &b, s);
-    }
-    /* 0/0 or Inf/Inf */
-    if (a.cls == b.cls
-        &&
-        (a.cls == float_class_inf || a.cls == float_class_zero)) {
-        float_raise(float_flag_invalid, s);
-        parts_default_nan(&a, s);
-        return a;
-    }
-    /* Inf / x or 0 / x */
-    if (a.cls == float_class_inf || a.cls == float_class_zero) {
-        a.sign = sign;
-        return a;
-    }
-    /* Div 0 => Inf */
-    if (b.cls == float_class_zero) {
-        float_raise(float_flag_divbyzero, s);
-        a.cls = float_class_inf;
-        a.sign = sign;
-        return a;
-    }
-    /* Div by Inf */
-    if (b.cls == float_class_inf) {
-        a.cls = float_class_zero;
-        a.sign = sign;
-        return a;
-    }
-    g_assert_not_reached();
-}
-
 float16 float16_div(float16 a, float16 b, float_status *status)
 {
-    FloatParts64 pa, pb, pr;
+    FloatParts64 pa, pb, *pr;
 
     float16_unpack_canonical(&pa, a, status);
     float16_unpack_canonical(&pb, b, status);
-    pr = div_floats(pa, pb, status);
+    pr = parts_div(&pa, &pb, status);
 
-    return float16_round_pack_canonical(&pr, status);
+    return float16_round_pack_canonical(pr, status);
 }
 
 static float32 QEMU_SOFTFLOAT_ATTR
 soft_f32_div(float32 a, float32 b, float_status *status)
 {
-    FloatParts64 pa, pb, pr;
+    FloatParts64 pa, pb, *pr;
 
     float32_unpack_canonical(&pa, a, status);
     float32_unpack_canonical(&pb, b, status);
-    pr = div_floats(pa, pb, status);
+    pr = parts_div(&pa, &pb, status);
 
-    return float32_round_pack_canonical(&pr, status);
+    return float32_round_pack_canonical(pr, status);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_f64_div(float64 a, float64 b, float_status *status)
 {
-    FloatParts64 pa, pb, pr;
+    FloatParts64 pa, pb, *pr;
 
     float64_unpack_canonical(&pa, a, status);
     float64_unpack_canonical(&pb, b, status);
-    pr = div_floats(pa, pb, status);
+    pr = parts_div(&pa, &pb, status);
 
-    return float64_round_pack_canonical(&pr, status);
+    return float64_round_pack_canonical(pr, status);
 }
 
 static float hard_f32_div(float a, float b)
@@ -1984,20 +2005,28 @@ float64_div(float64 a, float64 b, float_status *s)
                         f64_div_pre, f64_div_post);
 }
 
-/*
- * Returns the result of dividing the bfloat16
- * value `a' by the corresponding value `b'.
- */
-
-bfloat16 bfloat16_div(bfloat16 a, bfloat16 b, float_status *status)
+bfloat16 QEMU_FLATTEN
+bfloat16_div(bfloat16 a, bfloat16 b, float_status *status)
 {
-    FloatParts64 pa, pb, pr;
+    FloatParts64 pa, pb, *pr;
 
     bfloat16_unpack_canonical(&pa, a, status);
     bfloat16_unpack_canonical(&pb, b, status);
-    pr = div_floats(pa, pb, status);
+    pr = parts_div(&pa, &pb, status);
 
-    return bfloat16_round_pack_canonical(&pr, status);
+    return bfloat16_round_pack_canonical(pr, status);
+}
+
+float128 QEMU_FLATTEN
+float128_div(float128 a, float128 b, float_status *status)
+{
+    FloatParts128 pa, pb, *pr;
+
+    float128_unpack_canonical(&pa, a, status);
+    float128_unpack_canonical(&pb, b, status);
+    pr = parts_div(&pa, &pb, status);
+
+    return float128_round_pack_canonical(pr, status);
 }
 
 /*
@@ -7122,93 +7151,6 @@ float128 float128_round_to_int(float128 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of dividing the quadruple-precision floating-point value
-| `a' by the corresponding value `b'.  The operation is performed according to
-| the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 float128_div(float128 a, float128 b, float_status *status)
-{
-    bool aSign, bSign, zSign;
-    int32_t aExp, bExp, zExp;
-    uint64_t aSig0, aSig1, bSig0, bSig1, zSig0, zSig1, zSig2;
-    uint64_t rem0, rem1, rem2, rem3, term0, term1, term2, term3;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    aSign = extractFloat128Sign( a );
-    bSig1 = extractFloat128Frac1( b );
-    bSig0 = extractFloat128Frac0( b );
-    bExp = extractFloat128Exp( b );
-    bSign = extractFloat128Sign( b );
-    zSign = aSign ^ bSign;
-    if ( aExp == 0x7FFF ) {
-        if (aSig0 | aSig1) {
-            return propagateFloat128NaN(a, b, status);
-        }
-        if ( bExp == 0x7FFF ) {
-            if (bSig0 | bSig1) {
-                return propagateFloat128NaN(a, b, status);
-            }
-            goto invalid;
-        }
-        return packFloat128( zSign, 0x7FFF, 0, 0 );
-    }
-    if ( bExp == 0x7FFF ) {
-        if (bSig0 | bSig1) {
-            return propagateFloat128NaN(a, b, status);
-        }
-        return packFloat128( zSign, 0, 0, 0 );
-    }
-    if ( bExp == 0 ) {
-        if ( ( bSig0 | bSig1 ) == 0 ) {
-            if ( ( aExp | aSig0 | aSig1 ) == 0 ) {
- invalid:
-                float_raise(float_flag_invalid, status);
-                return float128_default_nan(status);
-            }
-            float_raise(float_flag_divbyzero, status);
-            return packFloat128( zSign, 0x7FFF, 0, 0 );
-        }
-        normalizeFloat128Subnormal( bSig0, bSig1, &bExp, &bSig0, &bSig1 );
-    }
-    if ( aExp == 0 ) {
-        if ( ( aSig0 | aSig1 ) == 0 ) return packFloat128( zSign, 0, 0, 0 );
-        normalizeFloat128Subnormal( aSig0, aSig1, &aExp, &aSig0, &aSig1 );
-    }
-    zExp = aExp - bExp + 0x3FFD;
-    shortShift128Left(
-        aSig0 | UINT64_C(0x0001000000000000), aSig1, 15, &aSig0, &aSig1 );
-    shortShift128Left(
-        bSig0 | UINT64_C(0x0001000000000000), bSig1, 15, &bSig0, &bSig1 );
-    if ( le128( bSig0, bSig1, aSig0, aSig1 ) ) {
-        shift128Right( aSig0, aSig1, 1, &aSig0, &aSig1 );
-        ++zExp;
-    }
-    zSig0 = estimateDiv128To64( aSig0, aSig1, bSig0 );
-    mul128By64To192( bSig0, bSig1, zSig0, &term0, &term1, &term2 );
-    sub192( aSig0, aSig1, 0, term0, term1, term2, &rem0, &rem1, &rem2 );
-    while ( (int64_t) rem0 < 0 ) {
-        --zSig0;
-        add192( rem0, rem1, rem2, 0, bSig0, bSig1, &rem0, &rem1, &rem2 );
-    }
-    zSig1 = estimateDiv128To64( rem1, rem2, bSig0 );
-    if ( ( zSig1 & 0x3FFF ) <= 4 ) {
-        mul128By64To192( bSig0, bSig1, zSig1, &term1, &term2, &term3 );
-        sub192( rem1, rem2, 0, term1, term2, term3, &rem1, &rem2, &rem3 );
-        while ( (int64_t) rem1 < 0 ) {
-            --zSig1;
-            add192( rem1, rem2, rem3, 0, bSig0, bSig1, &rem1, &rem2, &rem3 );
-        }
-        zSig1 |= ( ( rem1 | rem2 | rem3 ) != 0 );
-    }
-    shift128ExtraRightJamming( zSig0, zSig1, 0, 15, &zSig0, &zSig1, &zSig2 );
-    return roundAndPackFloat128(zSign, zExp, zSig0, zSig1, zSig2, status);
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the remainder of the quadruple-precision floating-point value `a'
 | with respect to the corresponding value `b'.  The operation is performed
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index a203811299..f8165d92f9 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -539,3 +539,58 @@ static FloatPartsN *partsN(muladd)(FloatPartsN *a, FloatPartsN *b,
     parts_default_nan(a, s);
     return a;
 }
+
+/*
+ * Returns the result of dividing the floating-point value `a' by the
+ * corresponding value `b'. The operation is performed according to
+ * the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
+ */
+static FloatPartsN *partsN(div)(FloatPartsN *a, FloatPartsN *b,
+                                float_status *s)
+{
+    int ab_mask = float_cmask(a->cls) | float_cmask(b->cls);
+    bool sign = a->sign ^ b->sign;
+
+    if (likely(ab_mask == float_cmask_normal)) {
+        a->sign = sign;
+        a->exp -= b->exp + frac_div(a, b);
+        return a;
+    }
+
+    /* 0/0 or Inf/Inf => NaN */
+    if (unlikely(ab_mask == float_cmask_zero) ||
+        unlikely(ab_mask == float_cmask_inf)) {
+        float_raise(float_flag_invalid, s);
+        parts_default_nan(a, s);
+        return a;
+    }
+
+    /* All the NaN cases */
+    if (unlikely(ab_mask & float_cmask_anynan)) {
+        return parts_pick_nan(a, b, s);
+    }
+
+    a->sign = sign;
+
+    /* Inf / X */
+    if (a->cls == float_class_inf) {
+        return a;
+    }
+
+    /* 0 / X */
+    if (a->cls == float_class_zero) {
+        return a;
+    }
+
+    /* X / Inf */
+    if (b->cls == float_class_inf) {
+        a->cls = float_class_zero;
+        return a;
+    }
+
+    /* X / 0 => Inf */
+    g_assert(b->cls == float_class_zero);
+    float_raise(float_flag_divbyzero, s);
+    a->cls = float_class_inf;
+    return a;
+}
-- 
2.25.1


