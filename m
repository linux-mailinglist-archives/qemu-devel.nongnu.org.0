Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98F239067F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:20:43 +0200 (CEST)
Received: from localhost ([::1]:34116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZnO-0006Ha-OD
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:20:42 -0400
Received: from [2001:470:142:3::10] (port=60600 helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYem-0002Bw-Mm
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:45 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeQ-0006jx-3u
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:40 -0400
Received: by mail-pj1-x102b.google.com with SMTP id q6so17013777pjj.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8jY2SfyYuHl84ybtoNE2cXZQw+chD95nctKoUYm9stI=;
 b=bQUqS0vOqDw3/LR9evNJ6tnnltvDc3sAkbLafYw8eF1qKCOi15miBhJ+oOj60fUyG2
 MM8oiwniIG0jW7PtRMXJ10dsxaepCMyR1XpPYa2JLoD//UJToOrBpMdBdrChGefcE5cw
 nAIImZXlWbOUKBe42SAOIF9TPQG6o693NFZQjoAUIco/+/czYXTjbKJfYEpjqbAw+Ju+
 uUQij3hCQH6UvKemxKTyU4vwfDnulXC/EK6SIPwB6tpLhNTXO3zyrJ2vbRjlOj4tV4Ew
 uOC2ES+1/XrDrYUDY951Xc7zDz51sqM7MLj+02lfxOS96Z8f9K8fBKETsyt1cedyUHaE
 rDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8jY2SfyYuHl84ybtoNE2cXZQw+chD95nctKoUYm9stI=;
 b=umI2AhSkzloaueW9Ju7f1ASCO2XhsJBtiSxYCSRZnGD606tCISDMAIpqv0cQTwNT09
 QHEFC8cmH9HyMCPzYZFFVjyPvxH2sGx5cQffe1fK6nfVsh1hAl3Ble5zLjlmuNpKTsu4
 hEf+p1bIF2f3NA1IWK1bd6GchL/2yd+Zh6JpHDU4VMOxIPGAlcaP3LLJ3cl7imaiAMGJ
 tzYIjeWi3VCtZaKVJ+jWsThXuz4dPzvRJRLuQqLtZUzHBBiSEX8DB2cAaDvDbJxDvRKF
 MxutN2Osd6d1f+Ka+bY5Wwb7Bdg0DtVIPtyZ3BmLCz7oGlZ945YH6WHQmg36gRLaQg8E
 xT4g==
X-Gm-Message-State: AOAM532zXIeEGWaNAi/2iqLJ4tMewE3EaNUJsApuwf+4lwGIP5Ots6Bh
 IZSWvB287kSarOALt81g5Yr4KniYDhZUUw==
X-Google-Smtp-Source: ABdhPJxhiXCOjbIigPtQd6RczVu/RZIOY8BBUoEHWa9rRcT6hz+hW8ntMkGX/B27yX5OpfY+e3IGpw==
X-Received: by 2002:a17:90b:194b:: with SMTP id
 nk11mr30006284pjb.42.1621955239684; 
 Tue, 25 May 2021 08:07:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/28] softfloat: Convert integer to floatx80 to FloatParts
Date: Tue, 25 May 2021 08:06:57 -0700
Message-Id: <20210525150706.294968-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
 fpu/softfloat.c | 58 +++++++++++--------------------------------------
 1 file changed, 13 insertions(+), 45 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5c4a32bcfc..1cccc40db5 100644
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
@@ -5036,51 +5049,6 @@ static float128 normalizeRoundAndPackFloat128(bool zSign, int32_t zExp,
 
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


