Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864EE376ECB
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:31:43 +0200 (CEST)
Received: from localhost ([::1]:43824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCko-0004xy-Ks
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8H-0003UM-94
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:53 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC89-0005Yf-BY
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:52 -0400
Received: by mail-pl1-x62c.google.com with SMTP id n16so6145213plf.7
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t3Jy5CANfNVfC3/a+h+EOADacahyzwCmvSWB6DnAZSc=;
 b=fbM6omQOq6zPGyhIxhYmL5o1OUHhwGhHtdZ9krBkTBPFAkUMZGTLO5PpO3dq2gn7Bq
 dI30o0vyNmh7NWh4OzZQ/7vC/IzhVfOnHLxGXctSzLc4ia0TtirxVbFpSJ14Yh2NuCAA
 cWQSJ4Zhg9jLAvnZz6lds3PFTfiZzm5KqB/CcevqfRyj27WjPXyAyWoOnTQA2mjEbaE0
 1hf5YZN45w7qo2iQ/AFXe0HwGZ1b5vhgvKvbs6PBXVHsY2HrnX9Z3x1PBzWX0jFqej8B
 CvybECNxV9QaVdDZDS8SUxIx9gUr0h9SU//M0ldwzBumoQPUI9J6NDhSl1igFqIqTAfX
 v4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t3Jy5CANfNVfC3/a+h+EOADacahyzwCmvSWB6DnAZSc=;
 b=BKDC7qN5pKSXqeR9hNNQusQB4xYetG+H+lWGugP70RcTPUFarw3kdsuzcKEW7vypIq
 vPMZvOjRO1tUkLx4dMKd6lqe3yExyZeQeXXD8h1Izs5LnJ2gJfyT8lcJC6lm2ItAG7iI
 pLuawlPKhbifIagG6/f8/0nwRJnbtba8KcBLO9l5KDs4UOACriEWqEqHQiThliNyt3se
 UDVxg2h/d2kprPD7Wp+1LDict6DbhVYNKm5ml0L5k6218+icolLEDO3U25/G1YVhbKgJ
 6OWLZOxo/FyeRPPzglQR0NsD+TrKp0vG0lbDsPmtTg8lkwmLBhVuQqXHhUQHl4DjQKC4
 pOUQ==
X-Gm-Message-State: AOAM5301+HpCId8/gPtJGPG6d582HAY85SoJNXLfj2ynyIIj/fFiXnKQ
 jmYsYdWStfvaTKSV+gan5tE+APzwvv2FGQ==
X-Google-Smtp-Source: ABdhPJxOuwkOvGjlrumQwmqiQXEjuGpbcqrPjAlCvl60YuGJsgeYhVJC2mf6XZYLLY0JkVdxt+UCOw==
X-Received: by 2002:a17:90b:17d2:: with SMTP id
 me18mr13979402pjb.22.1620438704139; 
 Fri, 07 May 2021 18:51:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 62/72] softfloat: Convert floatx80_sqrt to FloatParts
Date: Fri,  7 May 2021 18:47:52 -0700
Message-Id: <20210508014802.892561-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
index 352f359bc5..7050d8f012 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3883,6 +3883,17 @@ float128 QEMU_FLATTEN float128_sqrt(float128 a, float_status *status)
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
@@ -6046,77 +6057,6 @@ floatx80 floatx80_mod(floatx80 a, floatx80 b, float_status *status)
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


