Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6D93906BC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:35:06 +0200 (CEST)
Received: from localhost ([::1]:45730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lla1J-0008JP-Gb
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYee-0001y9-1V
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:37 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:43812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeQ-0006jM-0P
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:35 -0400
Received: by mail-pg1-x531.google.com with SMTP id e22so7229707pgv.10
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jRtuMx867iiF9LnMJh9kaoCKipyhalwdeBb7t+R/rbM=;
 b=Kmy2FyQhJXUlQH1RDfhnjYgU/XNv8JAVpeMeD+l3H+4s647y2BhRIUFXXOZbRS4Evb
 L0iEGhsI3oBYbLXn2PSECdNqmuyhyDrQR5t4mhYAr9kopa3wp3+jqkMmxP4jQ3nYV2SE
 dc/Vij28uGnFlaggkyBm2c+JbUE3L5aq3i2mzqc12JemOCOJwIVjn1N9r0gPcuvlVGf+
 xow1KadOkSAjBm68P7MNGlJdelbFdtQnqHFhfFiECJUXP3o8qwZw9JqQhMXKcVIQFRHZ
 e1C9EBf7WCJmv81IXzLygejxCD1gkbiH7dG1L6FCCfDWCpwI9cSatTUQu/MwwKbr1VrK
 Yucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jRtuMx867iiF9LnMJh9kaoCKipyhalwdeBb7t+R/rbM=;
 b=ZjjDBG4fBeTk3jBg28CRbENJYaRW8QvokaKa0V+oVy+4hILbysyox3Ct9qEKb/Lqvq
 ZbYcZ4D4jcQF5nVZFzmvybF9mEzfMB/EtHaXb9hJ9bkN7wVkKCl85x0rT5jNheFIk1tZ
 hNARNhDMBejbZSL7MsUCglG832xCK5uFnZ8E1MOlDDn20gXJxTaJyeY1fDER7Ky85js9
 Df+bRnC3Dg3D50IwAF6uhNkysTSXFboy11zh69EYo28l6PHtMP7ew0q3d2P666Bux4YT
 8jYs/8ZuRck7MBZFyzU3UVWyxnYIYfHoe7E+QNuBCqrYKt3w6kwF21vccoKe+Uy8pLG+
 dJVA==
X-Gm-Message-State: AOAM532N6nQ0mUZN+5f+zDyXof7ggYS5fiRKYx3URc4+BBl5VhBnEk5n
 OtjtTtnFQQObyDzZNL8NHw3S9Yn6FUdq+g==
X-Google-Smtp-Source: ABdhPJzLlP/0H4/HqV8L1Y88/S5eOoLMHPcBv36b+TQc39yP76VzVfzJWpZOAz44qDhwKVDrjAElBQ==
X-Received: by 2002:a63:5052:: with SMTP id q18mr19338140pgl.349.1621955239085; 
 Tue, 25 May 2021 08:07:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/28] softfloat: Convert floatx80_round_to_int to
 FloatParts
Date: Tue, 25 May 2021 08:06:56 -0700
Message-Id: <20210525150706.294968-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
index 1f7260caec..5c4a32bcfc 100644
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
@@ -5803,109 +5816,6 @@ floatx80 floatx80_round(floatx80 a, float_status *status)
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


