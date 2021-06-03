Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A853B39AD58
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:58:49 +0200 (CEST)
Received: from localhost ([::1]:57924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovMV-0006Ev-Tw
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov6F-0002pn-6T
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:59 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:47034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov63-00019h-NI
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:58 -0400
Received: by mail-pf1-x435.google.com with SMTP id u126so1936059pfu.13
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMHyBtePJctFFVLhiljAsXW1cd3DwdhgWcEK6bYLQDk=;
 b=JRpLLMtdiRutBWGRjBoQ5FVYOqY+o9dGY+FOgAROcQ2hv1+bqJZ9XzipCMgER2RvNL
 odT0UAkgNuL36jYvoJmFJUnEWO1yPfKbYzc62OWwqTO5k5VY3FZWPPd0brBmetg8hhBK
 b0aNdvBzSQ9wPtLbQTboEzTWwfcIyElbwFlH5eNxOfrG+hGdNCuIuey1e+pAJQVdXKWM
 xpfh1mnWWHDuCBEf5viEg4qNbJfGxoylHDdNQc9aih7srm/aXXgxj205RfeHCG3XRbPI
 KFr2b9dIWoH3aBSlBEYqbUkBdGQfp3rqu2HziW5n1/zBu8mJF0cxrezLSUvGySjqsMvf
 kyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMHyBtePJctFFVLhiljAsXW1cd3DwdhgWcEK6bYLQDk=;
 b=W09kyp2w75Y620Se5kr0eS2QzcE/PzODmx9YloyuANsanAJIuWAurvwTwqwNXrM1n5
 ZOUlkjVOkLyPHVOdhmQ1aBbbnJFE66jUti+WOPjG7Qr78xdc8o8PgtNX303j00s1o/Rx
 p2HRGysmVCWLCNBx4erxa2nC/jUID4LbvkRdnFchtrtOQEZOX1pj2GmhwnJJXZCWemmc
 ZOV6QB0Dc4/BFZDvm1mOZSuViestjuSmrjEXFjoSWa/AbM18Yoh/ADRV6xW1SM+TOVbw
 0TbOUzfJWWffbuLbBs+mTacYtibtDAEBTYbtZTx3ytGx1IBnCwU5qeFG54jWsXIwehKF
 +bwQ==
X-Gm-Message-State: AOAM531C6i3QA8/ModJILKnBkcOVI+6qYkL8/1V3IdN+ugo90VZLejLx
 b1EnrPal4lLcrvKQQSQDXwfV1k+P4F/mKw==
X-Google-Smtp-Source: ABdhPJyA9sc5eNSW7jO6cqh6fwUTJwAX5i4VclmCtLWWoHw2FKgJdzGAHeW8t8HpAzOxhBgPhG6Skw==
X-Received: by 2002:a63:914b:: with SMTP id l72mr1495174pge.99.1622756505694; 
 Thu, 03 Jun 2021 14:41:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/29] softfloat: Convert integer to floatx80 to FloatParts
Date: Thu,  3 Jun 2021 14:41:22 -0700
Message-Id: <20210603214131.629841-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 58 +++++++++++--------------------------------------
 1 file changed, 13 insertions(+), 45 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 9caf1ecf9c..be7583780d 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3345,6 +3345,19 @@ float128 int32_to_float128(int32_t a, float_status *status)
     return int64_to_float128(a, status);
 }
 
+floatx80 int64_to_floatx80(int64_t a, float_status *status)
+{
+    FloatParts128 p;
+
+    parts_sint_to_float(&p, a, 0, status);
+    return floatx80_round_pack_canonical(&p, status);
+}
+
+floatx80 int32_to_floatx80(int32_t a, float_status *status)
+{
+    return int64_to_floatx80(a, status);
+}
+
 /*
  * Unsigned Integer to floating-point conversions
  */
@@ -5033,51 +5046,6 @@ static float128 normalizeRoundAndPackFloat128(bool zSign, int32_t zExp,
 
 }
 
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the 32-bit two's complement integer `a'
-| to the extended double-precision floating-point format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 int32_to_floatx80(int32_t a, float_status *status)
-{
-    bool zSign;
-    uint32_t absA;
-    int8_t shiftCount;
-    uint64_t zSig;
-
-    if ( a == 0 ) return packFloatx80( 0, 0, 0 );
-    zSign = ( a < 0 );
-    absA = zSign ? - a : a;
-    shiftCount = clz32(absA) + 32;
-    zSig = absA;
-    return packFloatx80( zSign, 0x403E - shiftCount, zSig<<shiftCount );
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the 64-bit two's complement integer `a'
-| to the extended double-precision floating-point format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 int64_to_floatx80(int64_t a, float_status *status)
-{
-    bool zSign;
-    uint64_t absA;
-    int8_t shiftCount;
-
-    if ( a == 0 ) return packFloatx80( 0, 0, 0 );
-    zSign = ( a < 0 );
-    absA = zSign ? - a : a;
-    shiftCount = clz64(absA);
-    return packFloatx80( zSign, 0x403E - shiftCount, absA<<shiftCount );
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of converting the single-precision floating-point value
 | `a' to the extended double-precision floating-point format.  The conversion
-- 
2.25.1


