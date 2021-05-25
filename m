Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82CD390682
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:21:13 +0200 (CEST)
Received: from localhost ([::1]:35122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZns-0006y3-Ty
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYei-00023t-8z
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:40 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeP-0006iX-Vp
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:40 -0400
Received: by mail-pf1-x435.google.com with SMTP id y15so12439736pfn.13
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ADKnkvRZV41OR8FpRzBFVdThnPU71bizMrztN5c22yI=;
 b=fh0nR8T6S04JkovZwdwvwnxn9n/ZTpNHD1LAfhfHxT2YVdKMeC1AFEFUlm0MNxVBtb
 X/qSuv2Cq9u5sFgJwJmV+dqTYyuPN5Wbfg6pN3+vh5uoG+p8vRLpWdFGTTZcGv6kA8VL
 V8HkgOv63mNZU1EfJSJV6lpMCrJQHvIAkxgRoB/xz9aA5mJeRCcdls8s38llmH98d/Cu
 zh1/r3nNSUsSsGekC6Ki23PUTST/M81oZWLercPgtBgA69KlMf8dKQ7gDVZJg7mrGzkl
 e+q4pVcmEHCdXuhFoFSsQUjPOfAFDkkfH3ECokPJEGlX6KsQATn9npdCkA+mck1w8QYY
 TA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ADKnkvRZV41OR8FpRzBFVdThnPU71bizMrztN5c22yI=;
 b=h72tgeO7yYN72aeHSq+XA7fhWUEQ0jnJLG3D0YbwwjJLyW6pdzrqdEMKR2kJqIwrlV
 W59r42BatFpXuGIC4q0AOnnTuwXhICIi2c7HtztcJW9kax/9dRJQlouXsrN5TDpm51Zm
 zKCK0V5UO5CJglm83phv0/3CkeLy40JUsDvOL30fOMmGDPimlBZkjsQy568aIh+NkVot
 tnC6l5PQUADEn0ocJ/juJOo9K4TdcXJX4+lwxxRrQ9TkrotMbcxYskvbdVpXZrT5NQCr
 pvSuUtgvoKfobuAiNr1whSyNyOhNsxMV7j/dSgKRZWjPMQvL/0cJ9r1EpTDThSuCCSLf
 sRkQ==
X-Gm-Message-State: AOAM533jlX580VA9/0HUu94hpJkIvvtnEsnMlr/xUQSYFP5b81y7nsJU
 dUcME/W+IGXAlBwpp/avNHJunAKeOa5oJg==
X-Google-Smtp-Source: ABdhPJzRx0x8UsxwEC6+yMgLcnrJM1mSpTaDpoJOP4dFQ9LLNb+LtGGpkcHNooDQK9hGFOKQXwABKw==
X-Received: by 2002:a63:9316:: with SMTP id b22mr19865846pge.70.1621955237991; 
 Tue, 25 May 2021 08:07:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/28] softfloat: Convert floatx80_sqrt to FloatParts
Date: Tue, 25 May 2021 08:06:54 -0700
Message-Id: <20210525150706.294968-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 82 +++++++------------------------------------------
 1 file changed, 11 insertions(+), 71 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 7b9ae29285..d7beb27982 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3884,6 +3884,17 @@ float128 QEMU_FLATTEN float128_sqrt(float128 a, float_status *status)
     return float128_round_pack_canonical(&p, status);
 }
 
+floatx80 floatx80_sqrt(floatx80 a, float_status *s)
+{
+    FloatParts128 p;
+
+    if (!floatx80_unpack_canonical(&p, a, s)) {
+        return floatx80_default_nan(s);
+    }
+    parts_sqrt(&p, s, &floatx80_params[s->floatx80_rounding_precision]);
+    return floatx80_round_pack_canonical(&p, s);
+}
+
 /*----------------------------------------------------------------------------
 | The pattern for a default generated NaN.
 *----------------------------------------------------------------------------*/
@@ -6047,77 +6058,6 @@ floatx80 floatx80_mod(floatx80 a, floatx80 b, float_status *status)
     return floatx80_modrem(a, b, true, &quotient, status);
 }
 
-/*----------------------------------------------------------------------------
-| Returns the square root of the extended double-precision floating-point
-| value `a'.  The operation is performed according to the IEC/IEEE Standard
-| for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 floatx80_sqrt(floatx80 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp, zExp;
-    uint64_t aSig0, aSig1, zSig0, zSig1, doubleZSig0;
-    uint64_t rem0, rem1, rem2, rem3, term0, term1, term2, term3;
-
-    if (floatx80_invalid_encoding(a)) {
-        float_raise(float_flag_invalid, status);
-        return floatx80_default_nan(status);
-    }
-    aSig0 = extractFloatx80Frac( a );
-    aExp = extractFloatx80Exp( a );
-    aSign = extractFloatx80Sign( a );
-    if ( aExp == 0x7FFF ) {
-        if ((uint64_t)(aSig0 << 1)) {
-            return propagateFloatx80NaN(a, a, status);
-        }
-        if ( ! aSign ) return a;
-        goto invalid;
-    }
-    if ( aSign ) {
-        if ( ( aExp | aSig0 ) == 0 ) return a;
- invalid:
-        float_raise(float_flag_invalid, status);
-        return floatx80_default_nan(status);
-    }
-    if ( aExp == 0 ) {
-        if ( aSig0 == 0 ) return packFloatx80( 0, 0, 0 );
-        normalizeFloatx80Subnormal( aSig0, &aExp, &aSig0 );
-    }
-    zExp = ( ( aExp - 0x3FFF )>>1 ) + 0x3FFF;
-    zSig0 = estimateSqrt32( aExp, aSig0>>32 );
-    shift128Right( aSig0, 0, 2 + ( aExp & 1 ), &aSig0, &aSig1 );
-    zSig0 = estimateDiv128To64( aSig0, aSig1, zSig0<<32 ) + ( zSig0<<30 );
-    doubleZSig0 = zSig0<<1;
-    mul64To128( zSig0, zSig0, &term0, &term1 );
-    sub128( aSig0, aSig1, term0, term1, &rem0, &rem1 );
-    while ( (int64_t) rem0 < 0 ) {
-        --zSig0;
-        doubleZSig0 -= 2;
-        add128( rem0, rem1, zSig0>>63, doubleZSig0 | 1, &rem0, &rem1 );
-    }
-    zSig1 = estimateDiv128To64( rem1, 0, doubleZSig0 );
-    if ( ( zSig1 & UINT64_C(0x3FFFFFFFFFFFFFFF) ) <= 5 ) {
-        if ( zSig1 == 0 ) zSig1 = 1;
-        mul64To128( doubleZSig0, zSig1, &term1, &term2 );
-        sub128( rem1, 0, term1, term2, &rem1, &rem2 );
-        mul64To128( zSig1, zSig1, &term2, &term3 );
-        sub192( rem1, rem2, 0, 0, term2, term3, &rem1, &rem2, &rem3 );
-        while ( (int64_t) rem1 < 0 ) {
-            --zSig1;
-            shortShift128Left( 0, zSig1, 1, &term2, &term3 );
-            term3 |= 1;
-            term2 |= doubleZSig0;
-            add192( rem1, rem2, rem3, 0, term2, term3, &rem1, &rem2, &rem3 );
-        }
-        zSig1 |= ( ( rem1 | rem2 | rem3 ) != 0 );
-    }
-    shortShift128Left( 0, zSig1, 1, &zSig0, &zSig1 );
-    zSig0 |= doubleZSig0;
-    return roundAndPackFloatx80(status->floatx80_rounding_precision,
-                                0, zExp, zSig0, zSig1, status);
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of converting the quadruple-precision floating-point
 | value `a' to the extended double-precision floating-point format.  The
-- 
2.25.1


