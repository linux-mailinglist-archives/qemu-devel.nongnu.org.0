Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8C3376EE0
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:38:42 +0200 (CEST)
Received: from localhost ([::1]:40942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCrY-0004sg-2P
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8Q-0003Xa-4Q
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:52:02 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8B-0005Z2-Jz
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:52:00 -0400
Received: by mail-pl1-x62f.google.com with SMTP id h7so6158921plt.1
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ltq9KWrtl6pugUyz3NqOHMcpR3SEv8kdTtkfgRcKHZM=;
 b=Y5ZIVA6/WXoHS4zKa7NBJpZ7yV0B96+dz8JeyGHFvdchbPmJCn4hAvD0zC9aqXX3So
 KuXmDGyVJvVf/l4OUGmJd1sHpoX++5P0SWDkLtf03zIOptHfW71lzzOde5raSucNhAwz
 QSgHNuniYpD2dg7j/S3vmVmSKyg71V3LOHIt9vh0vodkuoaDqGTKBTZFhlv89DAhELR+
 v/AqDEDUcZYVKE8A4wjHrS4eWhRXttQnRTcfy8QPFyAxxixfE2ltsPWNrTEd2LcUdsjs
 KWLlsjI+oKTzC3+tO0Jp3ryrwmX+9w0BfoSfVXBADZd/IksruONCCtJbLbFXV/T7vnFo
 Gmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ltq9KWrtl6pugUyz3NqOHMcpR3SEv8kdTtkfgRcKHZM=;
 b=O4mV9fkgwF4ZjCekY3dR71Wtl4mYctOqUOWojBcSZV3y+DV0sAqkFRQaKs9TKbfG+r
 66dwIrmFhWqe8d3vVsALsey95hs08yBEjd6x9gJ5SKDhTZ7zISZUKADIi9tPDG6GvOo7
 LxPwLFOJS812xZRiCVKamd+wHG6KpuxXnijnhouPf1Hb1flJkrKCV5l0Rrw4ZDooAWrH
 nDZcn/4NS/whBxIPnoeRfp7w/PvCfq9PjjbhEyRYInPLaYI15m8y+s1QwDUfxjmuHJrs
 +sIzdQDTCQxjIruB1s8g3KCaAjnYeRwYHF+7OqdTZWw9/NBlFnd/Si+r+apexZOQfa3u
 8efQ==
X-Gm-Message-State: AOAM530Ak0gYGTypemNOJU7SjrGslMGj4iMx3BIIGsAR7Gkst7NrBNxN
 VtBC5jv7R31xyRB8mizJWTx5SdDB+T0W9Q==
X-Google-Smtp-Source: ABdhPJxCN9Uhm3EAptuE+RU0e15CZGwB+jQH47HkJe6gfnTtKJKZxS/1qj57MU7sjeaEnEqo1d8HCw==
X-Received: by 2002:a17:90a:f2d3:: with SMTP id
 gt19mr26887343pjb.52.1620438705353; 
 Fri, 07 May 2021 18:51:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 64/72] softfloat: Convert floatx80_round_to_int to FloatParts
Date: Fri,  7 May 2021 18:47:54 -0700
Message-Id: <20210508014802.892561-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
 fpu/softfloat.c | 116 ++++++------------------------------------------
 1 file changed, 13 insertions(+), 103 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index faccc8df41..914cf2688c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2609,6 +2609,19 @@ float128 float128_round_to_int(float128 a, float_status *s)
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
@@ -5802,109 +5815,6 @@ floatx80 floatx80_round(floatx80 a, float_status *status)
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


