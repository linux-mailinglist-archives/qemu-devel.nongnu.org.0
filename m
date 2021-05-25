Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488E93906B7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:32:37 +0200 (CEST)
Received: from localhost ([::1]:39276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZyu-0003rw-BI
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeT-0001n6-I0
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:25 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeM-0006iN-SB
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:25 -0400
Received: by mail-pj1-x102f.google.com with SMTP id t11so17030105pjm.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=17lWOhgcl+ZVqAbMQv1xvpusA/TYAXuediZfiyj2D18=;
 b=EVauJhgg+KIZPk17DqgyB874sQrsACp2mMAxtsnfz5bLU++Qg26t+GfSdue4aGaSnH
 RL5D0gZITXCrHzgOdFljXnxE356OTXqXL/UFtEQpyQtL+656P7zVh+/J9bMlY4rGXiou
 UyFGiN1Sn6CyPFpgVrl2oBpuIFfxk+WazG/aowMpcqQNHKF3KzlkXL659QAUUSMRZ/nM
 UynMX7J1/K4JkGfSHGGRECIVsBepjd5rSrvLOMQQbxFeI1Iv+kLBB5Of8P0Ji6q3vYmc
 y+WoUkCuvYKSzSux1LZlfI8MjWmSYJ+mdDL0ypmgsaXVS9rOsAsRXxh6T1KISGnyRA/8
 JXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=17lWOhgcl+ZVqAbMQv1xvpusA/TYAXuediZfiyj2D18=;
 b=nseNqc5MxH8tocLPmKv7FzEoNL0GY/IFCuzMGcgdMifkhEoqDbxvLPcJ4xYdyOdkmH
 tMh9pXj0JXFrgDnd9Vx2tP7W8aVA5t2IVbThHOEh2Pd6yCYlC1DWYn5JteXeR9TTStMf
 5gHPgaK29NC9tccJaaMi9VSVoYZF9Ue6VftsL0kJv1UrAW4G+SBNr/SSPRoAo3N8gPKZ
 PpyP094Yfk/1r+4CNNgb5ftq9u351Jzw1ApdO737mE4YQJJoBk8SHEPamRmjeJxh3K2V
 1XBAIfxHLGOtUc+/JQVjq1UFuwWRyEGLczqjt+hplLC5ppVWT4fKVU3B/SN5vkzpFFfI
 wRpw==
X-Gm-Message-State: AOAM533+fplAfM1si9k1wbWEGS2Q8zbXvobl6+8F+JMCiC3K/ZAj7p9c
 DpBeQpnchnyI3YfibBcK6QxpsQaROPW+jw==
X-Google-Smtp-Source: ABdhPJxBiC/XyDhmPLZwYvEnMpCY0JxthaaB70oW/1LvRznezMpUm778RjmjDxXNwAmbOZuhvmB9bw==
X-Received: by 2002:a17:90b:100f:: with SMTP id
 gm15mr31364738pjb.197.1621955237454; 
 Tue, 25 May 2021 08:07:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/28] softfloat: Convert floatx80_div to FloatParts
Date: Tue, 25 May 2021 08:06:53 -0700
Message-Id: <20210525150706.294968-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
 fpu/softfloat.c | 100 +++++++-----------------------------------------
 1 file changed, 13 insertions(+), 87 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 2f2d1e50f7..7b9ae29285 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2294,6 +2294,19 @@ float128_div(float128 a, float128 b, float_status *status)
     return float128_round_pack_canonical(pr, status);
 }
 
+floatx80 floatx80_div(floatx80 a, floatx80 b, float_status *status)
+{
+    FloatParts128 pa, pb, *pr;
+
+    if (!floatx80_unpack_canonical(&pa, a, status) ||
+        !floatx80_unpack_canonical(&pb, b, status)) {
+        return floatx80_default_nan(status);
+    }
+
+    pr = parts_div(&pa, &pb, status);
+    return floatx80_round_pack_canonical(pr, status);
+}
+
 /*
  * Float to Float conversions
  *
@@ -5880,93 +5893,6 @@ floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of dividing the extended double-precision floating-point
-| value `a' by the corresponding value `b'.  The operation is performed
-| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 floatx80_div(floatx80 a, floatx80 b, float_status *status)
-{
-    bool aSign, bSign, zSign;
-    int32_t aExp, bExp, zExp;
-    uint64_t aSig, bSig, zSig0, zSig1;
-    uint64_t rem0, rem1, rem2, term0, term1, term2;
-
-    if (floatx80_invalid_encoding(a) || floatx80_invalid_encoding(b)) {
-        float_raise(float_flag_invalid, status);
-        return floatx80_default_nan(status);
-    }
-    aSig = extractFloatx80Frac( a );
-    aExp = extractFloatx80Exp( a );
-    aSign = extractFloatx80Sign( a );
-    bSig = extractFloatx80Frac( b );
-    bExp = extractFloatx80Exp( b );
-    bSign = extractFloatx80Sign( b );
-    zSign = aSign ^ bSign;
-    if ( aExp == 0x7FFF ) {
-        if ((uint64_t)(aSig << 1)) {
-            return propagateFloatx80NaN(a, b, status);
-        }
-        if ( bExp == 0x7FFF ) {
-            if ((uint64_t)(bSig << 1)) {
-                return propagateFloatx80NaN(a, b, status);
-            }
-            goto invalid;
-        }
-        return packFloatx80(zSign, floatx80_infinity_high,
-                                   floatx80_infinity_low);
-    }
-    if ( bExp == 0x7FFF ) {
-        if ((uint64_t)(bSig << 1)) {
-            return propagateFloatx80NaN(a, b, status);
-        }
-        return packFloatx80( zSign, 0, 0 );
-    }
-    if ( bExp == 0 ) {
-        if ( bSig == 0 ) {
-            if ( ( aExp | aSig ) == 0 ) {
- invalid:
-                float_raise(float_flag_invalid, status);
-                return floatx80_default_nan(status);
-            }
-            float_raise(float_flag_divbyzero, status);
-            return packFloatx80(zSign, floatx80_infinity_high,
-                                       floatx80_infinity_low);
-        }
-        normalizeFloatx80Subnormal( bSig, &bExp, &bSig );
-    }
-    if ( aExp == 0 ) {
-        if ( aSig == 0 ) return packFloatx80( zSign, 0, 0 );
-        normalizeFloatx80Subnormal( aSig, &aExp, &aSig );
-    }
-    zExp = aExp - bExp + 0x3FFE;
-    rem1 = 0;
-    if ( bSig <= aSig ) {
-        shift128Right( aSig, 0, 1, &aSig, &rem1 );
-        ++zExp;
-    }
-    zSig0 = estimateDiv128To64( aSig, rem1, bSig );
-    mul64To128( bSig, zSig0, &term0, &term1 );
-    sub128( aSig, rem1, term0, term1, &rem0, &rem1 );
-    while ( (int64_t) rem0 < 0 ) {
-        --zSig0;
-        add128( rem0, rem1, 0, bSig, &rem0, &rem1 );
-    }
-    zSig1 = estimateDiv128To64( rem1, 0, bSig );
-    if ( (uint64_t) ( zSig1<<1 ) <= 8 ) {
-        mul64To128( bSig, zSig1, &term1, &term2 );
-        sub128( rem1, 0, term1, term2, &rem1, &rem2 );
-        while ( (int64_t) rem1 < 0 ) {
-            --zSig1;
-            add128( rem1, rem2, 0, bSig, &rem1, &rem2 );
-        }
-        zSig1 |= ( ( rem1 | rem2 ) != 0 );
-    }
-    return roundAndPackFloatx80(status->floatx80_rounding_precision,
-                                zSign, zExp, zSig0, zSig1, status);
-}
-
 /*----------------------------------------------------------------------------
 | Returns the remainder of the extended double-precision floating-point value
 | `a' with respect to the corresponding value `b'.  The operation is performed
-- 
2.25.1


