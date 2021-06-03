Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB2639AD2C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:48:53 +0200 (CEST)
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovCu-0003bF-62
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov6A-0002do-QC
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:54 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov62-00019a-EZ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:54 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 jz2-20020a17090b14c2b0290162cf0b5a35so6234952pjb.5
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fUuOVml+4w79a3bxuCGZ23LxhkzpodhkprttyZbQk2E=;
 b=g63K/xb/Dkn1IpwTV0AkxycAjdOnZXPLHj4tw14bzLKwRdbChNJcmCJ/Ti08d8WDxa
 zxeufoRcAvvkvvZqyOyJoPRuWYIEC11gb9NpNtRfeXp4TkWkwfetsmvG5gT/O3waEML1
 dduiIQxZ9K3vQAuzneIJ3tUEJfw9wSjpjkCXqtH8UWoU4Q27polpIFksc7VKMeZ485qz
 lwXCFqIpj1dZORMu8N8ljZtW2ECU4W/JwIP608Ba/9JBmLn8nKkoMASbh/FKvJDHAOUf
 ygTlAN9ciH0HeupZnW2mbGSF15WpMfMK829Bm/wBQhH5taTLIvx4qFC9LgLMXGPSW0PH
 ncgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fUuOVml+4w79a3bxuCGZ23LxhkzpodhkprttyZbQk2E=;
 b=XI/+a+Eu09sThMisDyKQBcBajTLIjq6mYuk7PKh2o8RnIuHIYOK9WdSyhaeKxJ5BlO
 7jKR4qIJmILcQmmIssS0jGwKAmmkDzMbEmOUChVKXFGoD6dVEnGdA1ao5NvNKWyzB7zv
 x7DkA1wPgMP/HPVmq5W9y3zgxCYdSBy+EWROC3wRBOfY2ngwlfpJJi+mkQOzHoew37eA
 SYVNbNLPguji7nw4CI9JncFCNbG8VSYdumSbSTwTbddr+Txi7hqf+JOVHf/RQFFsfeUd
 iM6rbJMOpU2IRCgHA6fKwqdahwmGZdqHTYO8A2Ic/ErEBPnJo5JxyHkcdTr3RHmXyVPV
 pGYg==
X-Gm-Message-State: AOAM530LBTxuY7aoHtgjkH12E9tEyUjHLiNmBoTxonYKb2f4ASa1UnhF
 p+qk305zcwzYPGvYxLBGF5n4hJNDqyeP9Q==
X-Google-Smtp-Source: ABdhPJx1UminKBa41qFHDlbSkW2bUyXkBVFwD+qptjJ20VtjzeZe+pJnODO7MvxJ9uKNtFfOqr16Ww==
X-Received: by 2002:a17:902:bb92:b029:f4:4a28:3ed0 with SMTP id
 m18-20020a170902bb92b02900f44a283ed0mr1216920pls.48.1622756505134; 
 Thu, 03 Jun 2021 14:41:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/29] softfloat: Convert floatx80_round_to_int to FloatParts
Date: Thu,  3 Jun 2021 14:41:21 -0700
Message-Id: <20210603214131.629841-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
 fpu/softfloat.c | 116 ++++++------------------------------------------
 1 file changed, 13 insertions(+), 103 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 74787d5a6e..9caf1ecf9c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2610,6 +2610,19 @@ float128 float128_round_to_int(float128 a, float_status *s)
     return float128_round_pack_canonical(&p, s);
 }
 
+floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
+{
+    FloatParts128 p;
+
+    if (!floatx80_unpack_canonical(&p, a, status)) {
+        return floatx80_default_nan(status);
+    }
+
+    parts_round_to_int(&p, status->float_rounding_mode, 0, status,
+                       &floatx80_params[status->floatx80_rounding_precision]);
+    return floatx80_round_pack_canonical(&p, status);
+}
+
 /*
  * Floating-point to signed integer conversions
  */
@@ -5800,109 +5813,6 @@ floatx80 floatx80_round(floatx80 a, float_status *status)
     return floatx80_round_pack_canonical(&p, status);
 }
 
-/*----------------------------------------------------------------------------
-| Rounds the extended double-precision floating-point value `a' to an integer,
-| and returns the result as an extended quadruple-precision floating-point
-| value.  The operation is performed according to the IEC/IEEE Standard for
-| Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp;
-    uint64_t lastBitMask, roundBitsMask;
-    floatx80 z;
-
-    if (floatx80_invalid_encoding(a)) {
-        float_raise(float_flag_invalid, status);
-        return floatx80_default_nan(status);
-    }
-    aExp = extractFloatx80Exp( a );
-    if ( 0x403E <= aExp ) {
-        if ( ( aExp == 0x7FFF ) && (uint64_t) ( extractFloatx80Frac( a )<<1 ) ) {
-            return propagateFloatx80NaN(a, a, status);
-        }
-        return a;
-    }
-    if ( aExp < 0x3FFF ) {
-        if (    ( aExp == 0 )
-             && ( (uint64_t) ( extractFloatx80Frac( a ) ) == 0 ) ) {
-            return a;
-        }
-        float_raise(float_flag_inexact, status);
-        aSign = extractFloatx80Sign( a );
-        switch (status->float_rounding_mode) {
-         case float_round_nearest_even:
-            if ( ( aExp == 0x3FFE ) && (uint64_t) ( extractFloatx80Frac( a )<<1 )
-               ) {
-                return
-                    packFloatx80( aSign, 0x3FFF, UINT64_C(0x8000000000000000));
-            }
-            break;
-        case float_round_ties_away:
-            if (aExp == 0x3FFE) {
-                return packFloatx80(aSign, 0x3FFF, UINT64_C(0x8000000000000000));
-            }
-            break;
-         case float_round_down:
-            return
-                  aSign ?
-                      packFloatx80( 1, 0x3FFF, UINT64_C(0x8000000000000000))
-                : packFloatx80( 0, 0, 0 );
-         case float_round_up:
-            return
-                  aSign ? packFloatx80( 1, 0, 0 )
-                : packFloatx80( 0, 0x3FFF, UINT64_C(0x8000000000000000));
-
-        case float_round_to_zero:
-            break;
-        default:
-            g_assert_not_reached();
-        }
-        return packFloatx80( aSign, 0, 0 );
-    }
-    lastBitMask = 1;
-    lastBitMask <<= 0x403E - aExp;
-    roundBitsMask = lastBitMask - 1;
-    z = a;
-    switch (status->float_rounding_mode) {
-    case float_round_nearest_even:
-        z.low += lastBitMask>>1;
-        if ((z.low & roundBitsMask) == 0) {
-            z.low &= ~lastBitMask;
-        }
-        break;
-    case float_round_ties_away:
-        z.low += lastBitMask >> 1;
-        break;
-    case float_round_to_zero:
-        break;
-    case float_round_up:
-        if (!extractFloatx80Sign(z)) {
-            z.low += roundBitsMask;
-        }
-        break;
-    case float_round_down:
-        if (extractFloatx80Sign(z)) {
-            z.low += roundBitsMask;
-        }
-        break;
-    default:
-        abort();
-    }
-    z.low &= ~ roundBitsMask;
-    if ( z.low == 0 ) {
-        ++z.high;
-        z.low = UINT64_C(0x8000000000000000);
-    }
-    if (z.low != a.low) {
-        float_raise(float_flag_inexact, status);
-    }
-    return z;
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the remainder of the extended double-precision floating-point value
 | `a' with respect to the corresponding value `b'.  The operation is performed
-- 
2.25.1


