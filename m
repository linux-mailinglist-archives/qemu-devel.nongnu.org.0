Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9903906C1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:37:26 +0200 (CEST)
Received: from localhost ([::1]:54082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lla3Z-0005k6-9W
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYed-0001y8-Cp
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:37 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeN-0006iK-DE
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:33 -0400
Received: by mail-pf1-x42c.google.com with SMTP id q25so5792020pfn.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2BYof1ybjsIxHUNZfvumVsH9xGhAIK1VpElG81z2ZqA=;
 b=mfKKUqZv3XHLRQVOUm9AhbVg/jlijc0xkOEXg5xQfsHfXtTqIZ3sY/uydRS0jvtjiD
 T2b0pdzwrSiY1av82z2pAI+bqRvPEC+if+DuUIrjLWSZhyAhnsUGM6XqpM9lXJa3dQTW
 vYksNrPyzqrKGK+rJA6lUjwAOMj9yiPDWjayPADvBrq1xnUEGNrNvF1XcIyRukWFM0Yq
 eJzNtLjm+BPuhkEpx3JnuJdMHPECCdOuujTR5+LRvjigVKDs2yfx3FqomfUBQ6HdX9OQ
 WagZWz8P3LJOrCFzrxA61n+Fs94GgvXTsNL5FcBJyZ7ig0nGZS19mAGfuOd5VwhuqvbQ
 J7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2BYof1ybjsIxHUNZfvumVsH9xGhAIK1VpElG81z2ZqA=;
 b=VcdZ9Fp+VWpQ/sdu0CHkG6O2h1hyGfbV1G3ckXtLr/srzQjk7GGYc749f9ZYhlmLPq
 swWlWh6uxWxjTcWTJmULk5PRQXobb9YZuaLGkXDUr4ZoEwAUQlS+e81+FzagPnNblt72
 cIuKEEVQPseqvpUfG7axREvkjNr67TIzOc7amdQqSfm2ugYemge44WQRhC2ovsZVRvZG
 UkdxDhq+qAunfuemNCbOpXPtuql4wwuM7DN9w6omYspEujouSKwTZbH5tH0zwq0xAJSk
 GRjLkllq0HHLEF621yxH7b+yHfClwMjwYoounEJt61qOf2qsW2+5UpC3Ih5mNF3az150
 uu4Q==
X-Gm-Message-State: AOAM531XJRtLLo70sv6lRfAS+WWCgoHFUcUIoWZO0Gxc/MUWUXnsm3n3
 9keXwdxme4wT/KGRqWZLZ09u8GtyRtCRzw==
X-Google-Smtp-Source: ABdhPJwYJE9qfU1gyDwuN2usBv8rt4Hj0DWtMSuEg9epZs0hbjsaT0w6EJ4oSavJl4Trc2LCh11Lxg==
X-Received: by 2002:a62:148e:0:b029:2e4:e5a5:7e33 with SMTP id
 136-20020a62148e0000b02902e4e5a57e33mr22350849pfu.9.1621955236880; 
 Tue, 25 May 2021 08:07:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/28] softfloat: Convert floatx80_mul to FloatParts
Date: Tue, 25 May 2021 08:06:52 -0700
Message-Id: <20210525150706.294968-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
 fpu/softfloat.c | 76 +++++++++----------------------------------------
 1 file changed, 14 insertions(+), 62 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 073b0440eb..2f2d1e50f7 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1944,6 +1944,20 @@ float128_mul(float128 a, float128 b, float_status *status)
     return float128_round_pack_canonical(pr, status);
 }
 
+floatx80 QEMU_FLATTEN
+floatx80_mul(floatx80 a, floatx80 b, float_status *status)
+{
+    FloatParts128 pa, pb, *pr;
+
+    if (!floatx80_unpack_canonical(&pa, a, status) ||
+        !floatx80_unpack_canonical(&pb, b, status)) {
+        return floatx80_default_nan(status);
+    }
+
+    pr = parts_mul(&pa, &pb, status);
+    return floatx80_round_pack_canonical(pr, status);
+}
+
 /*
  * Fused multiply-add
  */
@@ -5866,68 +5880,6 @@ floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of multiplying the extended double-precision floating-
-| point values `a' and `b'.  The operation is performed according to the
-| IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 floatx80_mul(floatx80 a, floatx80 b, float_status *status)
-{
-    bool aSign, bSign, zSign;
-    int32_t aExp, bExp, zExp;
-    uint64_t aSig, bSig, zSig0, zSig1;
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
-        if (    (uint64_t) ( aSig<<1 )
-             || ( ( bExp == 0x7FFF ) && (uint64_t) ( bSig<<1 ) ) ) {
-            return propagateFloatx80NaN(a, b, status);
-        }
-        if ( ( bExp | bSig ) == 0 ) goto invalid;
-        return packFloatx80(zSign, floatx80_infinity_high,
-                                   floatx80_infinity_low);
-    }
-    if ( bExp == 0x7FFF ) {
-        if ((uint64_t)(bSig << 1)) {
-            return propagateFloatx80NaN(a, b, status);
-        }
-        if ( ( aExp | aSig ) == 0 ) {
- invalid:
-            float_raise(float_flag_invalid, status);
-            return floatx80_default_nan(status);
-        }
-        return packFloatx80(zSign, floatx80_infinity_high,
-                                   floatx80_infinity_low);
-    }
-    if ( aExp == 0 ) {
-        if ( aSig == 0 ) return packFloatx80( zSign, 0, 0 );
-        normalizeFloatx80Subnormal( aSig, &aExp, &aSig );
-    }
-    if ( bExp == 0 ) {
-        if ( bSig == 0 ) return packFloatx80( zSign, 0, 0 );
-        normalizeFloatx80Subnormal( bSig, &bExp, &bSig );
-    }
-    zExp = aExp + bExp - 0x3FFE;
-    mul64To128( aSig, bSig, &zSig0, &zSig1 );
-    if ( 0 < (int64_t) zSig0 ) {
-        shortShift128Left( zSig0, zSig1, 1, &zSig0, &zSig1 );
-        --zExp;
-    }
-    return roundAndPackFloatx80(status->floatx80_rounding_precision,
-                                zSign, zExp, zSig0, zSig1, status);
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of dividing the extended double-precision floating-point
 | value `a' by the corresponding value `b'.  The operation is performed
-- 
2.25.1


