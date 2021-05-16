Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0328E381EE1
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:49:53 +0200 (CEST)
Received: from localhost ([::1]:34356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGDP-0008H8-I5
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzb-0007p4-AH
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:35 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:35564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz4-0007qG-Dg
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:35 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id q6so1874550qvb.2
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/724DOTnSsXxgPOEGihu7EL04hGHfEbGiz+wNztnOCA=;
 b=MoQDpXRTxAHtys1sbUuGJd3HTHq0Lx0T+gY3XmMptlElHQbqE2ixz1UEd9AXnzvOr/
 mYpHhzcxWUqBs/G3kQXs4YXRN4AfZfgVClIplzTanc6ZG1KZCRYM7AkEJDb9d3J0/Miy
 YcYWB9/m6r/yfVKK98hjWQnfsqS13NEeBu21YnXpCj/y36eD3hWhMUJo7I96/iYkjRYa
 0BUkMkXrBszuLAhVybbiLnQYLN+jRzyiDczhFnOUGIvbcMcUl0YqlilRBEn+O3Sv6/dc
 BWRY2lw9+n7HkKC1Ydvqan1I5FlNTDNb2+0BIkPoOyC2J/vK0WcRhT0IWaWo9NeycTuO
 GY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/724DOTnSsXxgPOEGihu7EL04hGHfEbGiz+wNztnOCA=;
 b=C1wAHLi7apHACvpBCM1CLRguXYVuEMbYNRnGcjDdeCM7HDVrMdLwZySA1ENYLcMm0b
 tT+3/fcM3AuwWpKBTEayYsX637oO07kLn1oQmMl+4X0OoWo9wjQ/KAMOhn9EDjbNppaF
 UsIFl8IZc0bXmIZQniEeZLkr9u21uJRNdzVhgcx3H3fy6oz7LHlYXzlslfVxM382b42W
 4xiuWxVElYSrJbsnFUkiadRh4yTjkS5/LghNL9Qz6rqxitXt4c1POWgYABZfJibYu0PF
 CQApd950L6QKY42zoFk88V3tl+9ndCAjWylIALjve+ax5sZJMWa4SKQam0kXUdS02kOX
 N0sw==
X-Gm-Message-State: AOAM531T3r0na5T68qPeT3KyTvlMhkROxKUZS/9IbKTuUxWLMM6y4TDM
 WUbiaMAtGM0q5uSl+FqW4GgajxZ4+LMcLIXSDKU=
X-Google-Smtp-Source: ABdhPJyIAljm+TPPZlkouDQ2PncwWVlCc/KeH1sjppgWP6dpPz+8/Iku8I6mASTGGVfEBX0QsAXAHQ==
X-Received: by 2002:a05:6214:a91:: with SMTP id
 ev17mr10145348qvb.9.1621168501518; 
 Sun, 16 May 2021 05:35:01 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:35:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/46] softfloat: Implement float128_add/sub via parts
Date: Sun, 16 May 2021 07:34:20 -0500
Message-Id: <20210516123431.718318-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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

Replace the existing Berkeley implementation with the
FloatParts implementation.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 257 +++++++-----------------------------------------
 1 file changed, 36 insertions(+), 221 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index afeef00097..8f734f6020 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1046,6 +1046,20 @@ static float64 float64_round_pack_canonical(FloatParts64 *p,
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
@@ -1213,6 +1227,28 @@ bfloat16 bfloat16_sub(bfloat16 a, bfloat16 b, float_status *status)
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
@@ -7032,227 +7068,6 @@ float128 float128_round_to_int(float128 a, float_status *status)
 
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


