Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A3939AD3E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:53:56 +0200 (CEST)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovHn-00023F-Su
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov67-0002Yf-LP
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:53 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:41805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov60-000186-Dy
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:51 -0400
Received: by mail-pf1-x431.google.com with SMTP id x73so5921289pfc.8
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jsR0mGCWglTMXoS6de3IaqXp8GNTb2/ROWC0tZcxiWk=;
 b=UrFi3pSveaG22A0ssi1yj502GiL63JDT39ZLaSptjkLbp4evKPZ0ZJv5T72dzO057I
 x+V9ek6FJJzeSL4kUkB8ESkzEWC7YytzoApfR1NtaGY25BVQNZHpvJBgFoRcoR46AKTs
 3tfWYlYEeOpe/zLjI21d3pMVrExaaHfL/w5wp7seeKvZ/zUojMHIMCH/R3JLU0Em4WZx
 yDezCZsZRl3o4JhUtNM11CPrWy4/LZ4UBuG3kteR4pZaPj5TwqUKTH0gb2/c+/bksVJV
 IwUOk9Vh5z1i3uDGiOBWFfBlJpmraqRr93E+sp6nv04Ri7wXr08t6LWzIjfRQshECCbj
 BJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jsR0mGCWglTMXoS6de3IaqXp8GNTb2/ROWC0tZcxiWk=;
 b=FZ88/M4BuhHFuj31xAYne6F1VZ4WEskeJ5RlJ0alpSeXwU8NQpLE9yW1S7afasDaF2
 hcq24Z8u+gmhyVcelsLOpp4uSw1EAzUkV1oyccpB4yS94L5i0xrBhSJFuIml8uYvcbjP
 cCiGpXwXl4y3+Mj8g8RBCD/DTKAqiaZQUn5ByxWe0pLHzKv8KXxDytinqqNof0e5PLWu
 DZlt4E9N/z4kJafQaig22RDWo2bkKeW0fDXVQqNfkWGBRkeWz3XH6jilljT5emnGbez7
 pue9n3JRLhPjusE4DkLr6heVjIQWSzodsOmjE4iAGLWj9zpDbmf8bjVUBszgvl0dd9wM
 tGHQ==
X-Gm-Message-State: AOAM531XzvGTVd6K6Mm8SBWSvcOvqWteISwQcUyLfAV30dSPqBFcFXXK
 DSqqyyMxbl8dILa9HYiNMxQ4z/3Hd+IOCQ==
X-Google-Smtp-Source: ABdhPJy/hzqLluUPIv8iQoclV0s+atnW+Zz6I+exQb7Sx+R2EJB7p27Iz4QRP+ms2t4jKgfVyf1ZYg==
X-Received: by 2002:a63:bc19:: with SMTP id q25mr1483310pge.211.1622756503107; 
 Thu, 03 Jun 2021 14:41:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/29] softfloat: Convert floatx80_div to FloatParts
Date: Thu,  3 Jun 2021 14:41:18 -0700
Message-Id: <20210603214131.629841-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 100 +++++++-----------------------------------------
 1 file changed, 13 insertions(+), 87 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index ae2e7aa274..9c26ba5960 100644
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
@@ -5877,93 +5890,6 @@ floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
 
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


