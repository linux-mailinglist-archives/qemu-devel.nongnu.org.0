Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A6E376E69
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:11:43 +0200 (CEST)
Received: from localhost ([::1]:45814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCRS-000227-TD
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC5D-0004kq-4W
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:43 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC50-0003et-3c
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:42 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 cl24-20020a17090af698b0290157efd14899so6550775pjb.2
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6i53BfFJgz07MWWKwgEBG9wk32Qsx014902OXCtKmIE=;
 b=HQiX0aS7S1w8nXYQlcw55llTHwWVEfGsSrB2cFrUj4VNKV/KfZZvW8gDzKji5R/8X3
 BdunHb0bT33IL2cWAsAlDAMI7x+7iQ7w4xnUAQEXl4XVWBdrRj4l3eJBADtkDC3EyHx9
 GPOaCsT5/BwihWad69r59DAejoTBdWXjLxpnUgrpEHRm9ju1BhEsV2jzFQV4ff6n466m
 I2cA8llpkY3yd+sRILkec6tH8QpIVyPDLFkw8YzHq9E9b1HPrE2E0i9gRAx1nzdwpZvl
 nQjJgR6Ko5GsWD2L6LiRCf9H34avXZlYC62kBIHqcLBw8StOUwUOGnj1uV8icIFqBb5V
 bepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6i53BfFJgz07MWWKwgEBG9wk32Qsx014902OXCtKmIE=;
 b=LFzZmDB3wxlAl/Bovj11Asj0RHaw/O5WyyPbk9wBvtB1FLxTGbEZ5IRYonP88oNqfL
 p7n1Ly0W88J5zTcDwK2HYQLpHwnS4DjhrVDvsrORi7EKKcPikvBjRV4tfrNbBs2q9fBl
 aZeqwHaCvNbX7BUmur1fRQcE29KE820ZRNS1bttoEKzKuGD6kMw4e8g2xQO3gw6qamMN
 UPQ/GucLp9Abzei6szbpjtNobKpeUxMcgtC05xtx/xlO1FJxx7B0p6z0DrO0+vih+eRZ
 06T8xUjg9HoFgptw4NHQBjx1/0tNCtEdq8d0A/XcqKdlM9CMbTcxMHwst33Wxm20BlOr
 c8kg==
X-Gm-Message-State: AOAM5338KebBdnMDxjeDVxy3fRNJf6jRhQaWandh3K0Y7dgP6YyG8z3k
 AP9zjDLfhxdg9lw7rqRxEeC05Q2Tsf/aCg==
X-Google-Smtp-Source: ABdhPJye6aY388QurYEcyO/AYxGCyCHojRqZfBb1tIzN7tkpA/6brRau7ORP2zIPw9G8DfxOLJCdsg==
X-Received: by 2002:a17:902:7402:b029:ed:1bf0:1ef1 with SMTP id
 g2-20020a1709027402b02900ed1bf01ef1mr13467596pll.24.1620438506304; 
 Fri, 07 May 2021 18:48:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 35/72] softfloat: Implement float128_add/sub via parts
Date: Fri,  7 May 2021 18:47:25 -0700
Message-Id: <20210508014802.892561-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Replace the existing Berkeley implementation with the
FloatParts implementation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 257 +++++++-----------------------------------------
 1 file changed, 36 insertions(+), 221 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 22dc6da5ef..f48e6b1f64 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1045,6 +1045,20 @@ static float64 float64_round_pack_canonical(FloatParts64 *p,
     return float64_pack_raw(p);
 }
 
+static void float128_unpack_canonical(FloatParts128 *p, float128 f,
+                                      float_status *s)
+{
+    float128_unpack_raw(p, f);
+    parts_canonicalize(p, s, &float128_params);
+}
+
+static float128 float128_round_pack_canonical(FloatParts128 *p,
+                                              float_status *s)
+{
+    parts_uncanon(p, s, &float128_params);
+    return float128_pack_raw(p);
+}
+
 /*
  * Addition and subtraction
  */
@@ -1212,6 +1226,28 @@ bfloat16 bfloat16_sub(bfloat16 a, bfloat16 b, float_status *status)
     return bfloat16_addsub(a, b, status, true);
 }
 
+static float128 QEMU_FLATTEN
+float128_addsub(float128 a, float128 b, float_status *status, bool subtract)
+{
+    FloatParts128 pa, pb, *pr;
+
+    float128_unpack_canonical(&pa, a, status);
+    float128_unpack_canonical(&pb, b, status);
+    pr = parts_addsub(&pa, &pb, status, subtract);
+
+    return float128_round_pack_canonical(pr, status);
+}
+
+float128 float128_add(float128 a, float128 b, float_status *status)
+{
+    return float128_addsub(a, b, status, false);
+}
+
+float128 float128_sub(float128 a, float128 b, float_status *status)
+{
+    return float128_addsub(a, b, status, true);
+}
+
 /*
  * Returns the result of multiplying the floating-point values `a' and
  * `b'. The operation is performed according to the IEC/IEEE Standard
@@ -7031,227 +7067,6 @@ float128 float128_round_to_int(float128 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of adding the absolute values of the quadruple-precision
-| floating-point values `a' and `b'.  If `zSign' is 1, the sum is negated
-| before being returned.  `zSign' is ignored if the result is a NaN.
-| The addition is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-static float128 addFloat128Sigs(float128 a, float128 b, bool zSign,
-                                float_status *status)
-{
-    int32_t aExp, bExp, zExp;
-    uint64_t aSig0, aSig1, bSig0, bSig1, zSig0, zSig1, zSig2;
-    int32_t expDiff;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    bSig1 = extractFloat128Frac1( b );
-    bSig0 = extractFloat128Frac0( b );
-    bExp = extractFloat128Exp( b );
-    expDiff = aExp - bExp;
-    if ( 0 < expDiff ) {
-        if ( aExp == 0x7FFF ) {
-            if (aSig0 | aSig1) {
-                return propagateFloat128NaN(a, b, status);
-            }
-            return a;
-        }
-        if ( bExp == 0 ) {
-            --expDiff;
-        }
-        else {
-            bSig0 |= UINT64_C(0x0001000000000000);
-        }
-        shift128ExtraRightJamming(
-            bSig0, bSig1, 0, expDiff, &bSig0, &bSig1, &zSig2 );
-        zExp = aExp;
-    }
-    else if ( expDiff < 0 ) {
-        if ( bExp == 0x7FFF ) {
-            if (bSig0 | bSig1) {
-                return propagateFloat128NaN(a, b, status);
-            }
-            return packFloat128( zSign, 0x7FFF, 0, 0 );
-        }
-        if ( aExp == 0 ) {
-            ++expDiff;
-        }
-        else {
-            aSig0 |= UINT64_C(0x0001000000000000);
-        }
-        shift128ExtraRightJamming(
-            aSig0, aSig1, 0, - expDiff, &aSig0, &aSig1, &zSig2 );
-        zExp = bExp;
-    }
-    else {
-        if ( aExp == 0x7FFF ) {
-            if ( aSig0 | aSig1 | bSig0 | bSig1 ) {
-                return propagateFloat128NaN(a, b, status);
-            }
-            return a;
-        }
-        add128( aSig0, aSig1, bSig0, bSig1, &zSig0, &zSig1 );
-        if ( aExp == 0 ) {
-            if (status->flush_to_zero) {
-                if (zSig0 | zSig1) {
-                    float_raise(float_flag_output_denormal, status);
-                }
-                return packFloat128(zSign, 0, 0, 0);
-            }
-            return packFloat128( zSign, 0, zSig0, zSig1 );
-        }
-        zSig2 = 0;
-        zSig0 |= UINT64_C(0x0002000000000000);
-        zExp = aExp;
-        goto shiftRight1;
-    }
-    aSig0 |= UINT64_C(0x0001000000000000);
-    add128( aSig0, aSig1, bSig0, bSig1, &zSig0, &zSig1 );
-    --zExp;
-    if ( zSig0 < UINT64_C(0x0002000000000000) ) goto roundAndPack;
-    ++zExp;
- shiftRight1:
-    shift128ExtraRightJamming(
-        zSig0, zSig1, zSig2, 1, &zSig0, &zSig1, &zSig2 );
- roundAndPack:
-    return roundAndPackFloat128(zSign, zExp, zSig0, zSig1, zSig2, status);
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of subtracting the absolute values of the quadruple-
-| precision floating-point values `a' and `b'.  If `zSign' is 1, the
-| difference is negated before being returned.  `zSign' is ignored if the
-| result is a NaN.  The subtraction is performed according to the IEC/IEEE
-| Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-static float128 subFloat128Sigs(float128 a, float128 b, bool zSign,
-                                float_status *status)
-{
-    int32_t aExp, bExp, zExp;
-    uint64_t aSig0, aSig1, bSig0, bSig1, zSig0, zSig1;
-    int32_t expDiff;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    bSig1 = extractFloat128Frac1( b );
-    bSig0 = extractFloat128Frac0( b );
-    bExp = extractFloat128Exp( b );
-    expDiff = aExp - bExp;
-    shortShift128Left( aSig0, aSig1, 14, &aSig0, &aSig1 );
-    shortShift128Left( bSig0, bSig1, 14, &bSig0, &bSig1 );
-    if ( 0 < expDiff ) goto aExpBigger;
-    if ( expDiff < 0 ) goto bExpBigger;
-    if ( aExp == 0x7FFF ) {
-        if ( aSig0 | aSig1 | bSig0 | bSig1 ) {
-            return propagateFloat128NaN(a, b, status);
-        }
-        float_raise(float_flag_invalid, status);
-        return float128_default_nan(status);
-    }
-    if ( aExp == 0 ) {
-        aExp = 1;
-        bExp = 1;
-    }
-    if ( bSig0 < aSig0 ) goto aBigger;
-    if ( aSig0 < bSig0 ) goto bBigger;
-    if ( bSig1 < aSig1 ) goto aBigger;
-    if ( aSig1 < bSig1 ) goto bBigger;
-    return packFloat128(status->float_rounding_mode == float_round_down,
-                        0, 0, 0);
- bExpBigger:
-    if ( bExp == 0x7FFF ) {
-        if (bSig0 | bSig1) {
-            return propagateFloat128NaN(a, b, status);
-        }
-        return packFloat128( zSign ^ 1, 0x7FFF, 0, 0 );
-    }
-    if ( aExp == 0 ) {
-        ++expDiff;
-    }
-    else {
-        aSig0 |= UINT64_C(0x4000000000000000);
-    }
-    shift128RightJamming( aSig0, aSig1, - expDiff, &aSig0, &aSig1 );
-    bSig0 |= UINT64_C(0x4000000000000000);
- bBigger:
-    sub128( bSig0, bSig1, aSig0, aSig1, &zSig0, &zSig1 );
-    zExp = bExp;
-    zSign ^= 1;
-    goto normalizeRoundAndPack;
- aExpBigger:
-    if ( aExp == 0x7FFF ) {
-        if (aSig0 | aSig1) {
-            return propagateFloat128NaN(a, b, status);
-        }
-        return a;
-    }
-    if ( bExp == 0 ) {
-        --expDiff;
-    }
-    else {
-        bSig0 |= UINT64_C(0x4000000000000000);
-    }
-    shift128RightJamming( bSig0, bSig1, expDiff, &bSig0, &bSig1 );
-    aSig0 |= UINT64_C(0x4000000000000000);
- aBigger:
-    sub128( aSig0, aSig1, bSig0, bSig1, &zSig0, &zSig1 );
-    zExp = aExp;
- normalizeRoundAndPack:
-    --zExp;
-    return normalizeRoundAndPackFloat128(zSign, zExp - 14, zSig0, zSig1,
-                                         status);
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of adding the quadruple-precision floating-point values
-| `a' and `b'.  The operation is performed according to the IEC/IEEE Standard
-| for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 float128_add(float128 a, float128 b, float_status *status)
-{
-    bool aSign, bSign;
-
-    aSign = extractFloat128Sign( a );
-    bSign = extractFloat128Sign( b );
-    if ( aSign == bSign ) {
-        return addFloat128Sigs(a, b, aSign, status);
-    }
-    else {
-        return subFloat128Sigs(a, b, aSign, status);
-    }
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of subtracting the quadruple-precision floating-point
-| values `a' and `b'.  The operation is performed according to the IEC/IEEE
-| Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 float128_sub(float128 a, float128 b, float_status *status)
-{
-    bool aSign, bSign;
-
-    aSign = extractFloat128Sign( a );
-    bSign = extractFloat128Sign( b );
-    if ( aSign == bSign ) {
-        return subFloat128Sigs(a, b, aSign, status);
-    }
-    else {
-        return addFloat128Sigs(a, b, aSign, status);
-    }
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of multiplying the quadruple-precision floating-point
 | values `a' and `b'.  The operation is performed according to the IEC/IEEE
-- 
2.25.1


