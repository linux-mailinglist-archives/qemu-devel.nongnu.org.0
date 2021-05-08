Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C75376ED3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:34:20 +0200 (CEST)
Received: from localhost ([::1]:54400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCnL-0003UI-VG
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC81-0002rQ-PE
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:37 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC7y-0005R4-Kt
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:37 -0400
Received: by mail-pl1-x634.google.com with SMTP id z18so2558961plg.8
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lD4M3xdqIE8r914VjTd/jttQJ/e/mxQ3BCpgAvIfUlU=;
 b=zXI42KrXmJ8wWhg4UQfr5JLQwGxQRljTYOqIcseHFB6flqYrTX6QR7xJTTa8K/lqL+
 BlZlA/VcbzdmZk3eRcVSVoYAAyUgaSUVWW5jTRSz2NZKgk078m3E2BQd4+rd6Iq5jnhv
 TviTToJ8Wtra1A/vSXAIbI8XdGoRufTsvhvUAW0dHvmAS3qsEfCqSDFqkLqUzRmKe703
 VNgHPlh6o2U7XUZ7nSTg4qAcV3aS16/b5QSw+BQsxTxvXXMm8QB2z91Cyktq1g+2rk4n
 SHecCQmNLQ0AwUc+RuKbHXS80UUIHZ6YlexNWTmhDwHtVVP+XvTR0ur+e9sjiTWw9pQ3
 bMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lD4M3xdqIE8r914VjTd/jttQJ/e/mxQ3BCpgAvIfUlU=;
 b=nWfvdbt9ypVi81Gw4ThxuSONze4gflznSSxhQdTKufJKLht9AiZ4rkGFXWDqbH3FQ+
 CRvXsB2WnqCMbNzfGrmE4OFO4sovjAg6rpXE+iADQMMBjOOzHqbhR/prNWwqUp8IAksy
 LB+wHjDuvlTPZowWyDiWar8pmPcJWkBs0qs73emAIGnKyNYyqdIqpAz8BSRsj2n7hLvv
 BKbul2Jq93MkTH9UZfpFwxLy32bYMbsDq20pOJ7afDayXtH5eYgV0zX7lFgXL+4FmAF1
 Pfxb0GorRiD8PLwezjdJ9gZZaECOpjKlAnUzhBPHi26x1OZDBJTvR7caoHCm2vhMq3Nu
 xYHg==
X-Gm-Message-State: AOAM530vu7hLk8F4xfmy0t7t2kPSKQ105Wx/sPiFdc84rlALM+BTx6bL
 NJF+BVsM5QRXfufyzL8wC311LOUzJ1Od/A==
X-Google-Smtp-Source: ABdhPJz5FxD8L84om6uMp78Uo7JOGt+lwpvSQLN9Do886HfngG/T+wKHbQ4Y3e6VzkTOGUAArCoAIQ==
X-Received: by 2002:a17:90b:2390:: with SMTP id
 mr16mr13836588pjb.133.1620438693131; 
 Fri, 07 May 2021 18:51:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 45/72] softfloat: Move round_to_int to softfloat-parts.c.inc
Date: Fri,  7 May 2021 18:47:35 -0700
Message-Id: <20210508014802.892561-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

At the same time, convert to pointers, split out
parts$N_round_to_int_normal, define a macro for
parts_round_to_int using QEMU_GENERIC.

This necessarily meant some rearrangement to the
rount_to_{,u}int_and_pack routines, so go ahead and
convert to parts_round_to_int_normal, which in turn
allows cleaning up of the raised exception handling.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 434 ++++++++++----------------------------
 fpu/softfloat-parts.c.inc | 157 ++++++++++++++
 2 files changed, 263 insertions(+), 328 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 1b86111279..ce96ea753c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -810,6 +810,24 @@ static FloatParts128 *parts128_div(FloatParts128 *a, FloatParts128 *b,
 #define parts_div(A, B, S) \
     PARTS_GENERIC_64_128(div, A)(A, B, S)
 
+static bool parts64_round_to_int_normal(FloatParts64 *a, FloatRoundMode rm,
+                                        int scale, int frac_size);
+static bool parts128_round_to_int_normal(FloatParts128 *a, FloatRoundMode r,
+                                         int scale, int frac_size);
+
+#define parts_round_to_int_normal(A, R, C, F) \
+    PARTS_GENERIC_64_128(round_to_int_normal, A)(A, R, C, F)
+
+static void parts64_round_to_int(FloatParts64 *a, FloatRoundMode rm,
+                                 int scale, float_status *s,
+                                 const FloatFmt *fmt);
+static void parts128_round_to_int(FloatParts128 *a, FloatRoundMode r,
+                                  int scale, float_status *s,
+                                  const FloatFmt *fmt);
+
+#define parts_round_to_int(A, R, C, S, F) \
+    PARTS_GENERIC_64_128(round_to_int, A)(A, R, C, S, F)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -2284,153 +2302,52 @@ float128 float64_to_float128(float64 a, float_status *s)
 }
 
 /*
- * Rounds the floating-point value `a' to an integer, and returns the
- * result as a floating-point value. The operation is performed
- * according to the IEC/IEEE Standard for Binary Floating-Point
- * Arithmetic.
+ * Round to integral value
  */
 
-static FloatParts64 round_to_int(FloatParts64 a, FloatRoundMode rmode,
-                               int scale, float_status *s)
-{
-    switch (a.cls) {
-    case float_class_qnan:
-    case float_class_snan:
-        parts_return_nan(&a, s);
-        break;
-
-    case float_class_zero:
-    case float_class_inf:
-        /* already "integral" */
-        break;
-
-    case float_class_normal:
-        scale = MIN(MAX(scale, -0x10000), 0x10000);
-        a.exp += scale;
-
-        if (a.exp >= DECOMPOSED_BINARY_POINT) {
-            /* already integral */
-            break;
-        }
-        if (a.exp < 0) {
-            bool one;
-            /* all fractional */
-            float_raise(float_flag_inexact, s);
-            switch (rmode) {
-            case float_round_nearest_even:
-                one = a.exp == -1 && a.frac > DECOMPOSED_IMPLICIT_BIT;
-                break;
-            case float_round_ties_away:
-                one = a.exp == -1 && a.frac >= DECOMPOSED_IMPLICIT_BIT;
-                break;
-            case float_round_to_zero:
-                one = false;
-                break;
-            case float_round_up:
-                one = !a.sign;
-                break;
-            case float_round_down:
-                one = a.sign;
-                break;
-            case float_round_to_odd:
-                one = true;
-                break;
-            default:
-                g_assert_not_reached();
-            }
-
-            if (one) {
-                a.frac = DECOMPOSED_IMPLICIT_BIT;
-                a.exp = 0;
-            } else {
-                a.cls = float_class_zero;
-            }
-        } else {
-            uint64_t frac_lsb = DECOMPOSED_IMPLICIT_BIT >> a.exp;
-            uint64_t frac_lsbm1 = frac_lsb >> 1;
-            uint64_t rnd_even_mask = (frac_lsb - 1) | frac_lsb;
-            uint64_t rnd_mask = rnd_even_mask >> 1;
-            uint64_t inc;
-
-            switch (rmode) {
-            case float_round_nearest_even:
-                inc = ((a.frac & rnd_even_mask) != frac_lsbm1 ? frac_lsbm1 : 0);
-                break;
-            case float_round_ties_away:
-                inc = frac_lsbm1;
-                break;
-            case float_round_to_zero:
-                inc = 0;
-                break;
-            case float_round_up:
-                inc = a.sign ? 0 : rnd_mask;
-                break;
-            case float_round_down:
-                inc = a.sign ? rnd_mask : 0;
-                break;
-            case float_round_to_odd:
-                inc = a.frac & frac_lsb ? 0 : rnd_mask;
-                break;
-            default:
-                g_assert_not_reached();
-            }
-
-            if (a.frac & rnd_mask) {
-                float_raise(float_flag_inexact, s);
-                if (uadd64_overflow(a.frac, inc, &a.frac)) {
-                    a.frac >>= 1;
-                    a.frac |= DECOMPOSED_IMPLICIT_BIT;
-                    a.exp++;
-                }
-                a.frac &= ~rnd_mask;
-            }
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    return a;
-}
-
 float16 float16_round_to_int(float16 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float16_unpack_canonical(&pa, a, s);
-    pr = round_to_int(pa, s->float_rounding_mode, 0, s);
-    return float16_round_pack_canonical(&pr, s);
+    float16_unpack_canonical(&p, a, s);
+    parts_round_to_int(&p, s->float_rounding_mode, 0, s, &float16_params);
+    return float16_round_pack_canonical(&p, s);
 }
 
 float32 float32_round_to_int(float32 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float32_unpack_canonical(&pa, a, s);
-    pr = round_to_int(pa, s->float_rounding_mode, 0, s);
-    return float32_round_pack_canonical(&pr, s);
+    float32_unpack_canonical(&p, a, s);
+    parts_round_to_int(&p, s->float_rounding_mode, 0, s, &float32_params);
+    return float32_round_pack_canonical(&p, s);
 }
 
 float64 float64_round_to_int(float64 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float64_unpack_canonical(&pa, a, s);
-    pr = round_to_int(pa, s->float_rounding_mode, 0, s);
-    return float64_round_pack_canonical(&pr, s);
+    float64_unpack_canonical(&p, a, s);
+    parts_round_to_int(&p, s->float_rounding_mode, 0, s, &float64_params);
+    return float64_round_pack_canonical(&p, s);
 }
 
-/*
- * Rounds the bfloat16 value `a' to an integer, and returns the
- * result as a bfloat16 value.
- */
-
 bfloat16 bfloat16_round_to_int(bfloat16 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    bfloat16_unpack_canonical(&pa, a, s);
-    pr = round_to_int(pa, s->float_rounding_mode, 0, s);
-    return bfloat16_round_pack_canonical(&pr, s);
+    bfloat16_unpack_canonical(&p, a, s);
+    parts_round_to_int(&p, s->float_rounding_mode, 0, s, &bfloat16_params);
+    return bfloat16_round_pack_canonical(&p, s);
+}
+
+float128 float128_round_to_int(float128 a, float_status *s)
+{
+    FloatParts128 p;
+
+    float128_unpack_canonical(&p, a, s);
+    parts_round_to_int(&p, s->float_rounding_mode, 0, s, &float128_params);
+    return float128_round_pack_canonical(&p, s);
 }
 
 /*
@@ -2444,48 +2361,58 @@ bfloat16 bfloat16_round_to_int(bfloat16 a, float_status *s)
  * is returned.
 */
 
-static int64_t round_to_int_and_pack(FloatParts64 in, FloatRoundMode rmode,
+static int64_t round_to_int_and_pack(FloatParts64 p, FloatRoundMode rmode,
                                      int scale, int64_t min, int64_t max,
                                      float_status *s)
 {
+    int flags = 0;
     uint64_t r;
-    int orig_flags = get_float_exception_flags(s);
-    FloatParts64 p = round_to_int(in, rmode, scale, s);
 
     switch (p.cls) {
     case float_class_snan:
     case float_class_qnan:
-        s->float_exception_flags = orig_flags | float_flag_invalid;
-        return max;
+        flags = float_flag_invalid;
+        r = max;
+        break;
+
     case float_class_inf:
-        s->float_exception_flags = orig_flags | float_flag_invalid;
-        return p.sign ? min : max;
+        flags = float_flag_invalid;
+        r = p.sign ? min : max;
+        break;
+
     case float_class_zero:
         return 0;
+
     case float_class_normal:
+        /* TODO: 62 = N - 2, frac_size for rounding */
+        if (parts_round_to_int_normal(&p, rmode, scale, 62)) {
+            flags = float_flag_inexact;
+        }
+
         if (p.exp <= DECOMPOSED_BINARY_POINT) {
             r = p.frac >> (DECOMPOSED_BINARY_POINT - p.exp);
         } else {
             r = UINT64_MAX;
         }
         if (p.sign) {
-            if (r <= -(uint64_t) min) {
-                return -r;
+            if (r <= -(uint64_t)min) {
+                r = -r;
             } else {
-                s->float_exception_flags = orig_flags | float_flag_invalid;
-                return min;
-            }
-        } else {
-            if (r <= max) {
-                return r;
-            } else {
-                s->float_exception_flags = orig_flags | float_flag_invalid;
-                return max;
+                flags = float_flag_invalid;
+                r = min;
             }
+        } else if (r > max) {
+            flags = float_flag_invalid;
+            r = max;
         }
+        break;
+
     default:
         g_assert_not_reached();
     }
+
+    float_raise(flags, s);
+    return r;
 }
 
 int8_t float16_to_int8_scalbn(float16 a, FloatRoundMode rmode, int scale,
@@ -2748,49 +2675,59 @@ int64_t bfloat16_to_int64_round_to_zero(bfloat16 a, float_status *s)
  *  flag.
  */
 
-static uint64_t round_to_uint_and_pack(FloatParts64 in, FloatRoundMode rmode,
+static uint64_t round_to_uint_and_pack(FloatParts64 p, FloatRoundMode rmode,
                                        int scale, uint64_t max,
                                        float_status *s)
 {
-    int orig_flags = get_float_exception_flags(s);
-    FloatParts64 p = round_to_int(in, rmode, scale, s);
+    int flags = 0;
     uint64_t r;
 
     switch (p.cls) {
     case float_class_snan:
     case float_class_qnan:
-        s->float_exception_flags = orig_flags | float_flag_invalid;
-        return max;
+        flags = float_flag_invalid;
+        r = max;
+        break;
+
     case float_class_inf:
-        s->float_exception_flags = orig_flags | float_flag_invalid;
-        return p.sign ? 0 : max;
+        flags = float_flag_invalid;
+        r = p.sign ? 0 : max;
+        break;
+
     case float_class_zero:
         return 0;
+
     case float_class_normal:
+        /* TODO: 62 = N - 2, frac_size for rounding */
+        if (parts_round_to_int_normal(&p, rmode, scale, 62)) {
+            flags = float_flag_inexact;
+            if (p.cls == float_class_zero) {
+                r = 0;
+                break;
+            }
+        }
+
         if (p.sign) {
-            s->float_exception_flags = orig_flags | float_flag_invalid;
-            return 0;
-        }
-
-        if (p.exp <= DECOMPOSED_BINARY_POINT) {
-            r = p.frac >> (DECOMPOSED_BINARY_POINT - p.exp);
+            flags = float_flag_invalid;
+            r = 0;
+        } else if (p.exp > DECOMPOSED_BINARY_POINT) {
+            flags = float_flag_invalid;
+            r = max;
         } else {
-            s->float_exception_flags = orig_flags | float_flag_invalid;
-            return max;
+            r = p.frac >> (DECOMPOSED_BINARY_POINT - p.exp);
+            if (r > max) {
+                flags = float_flag_invalid;
+                r = max;
+            }
         }
+        break;
 
-        /* For uint64 this will never trip, but if p.exp is too large
-         * to shift a decomposed fraction we shall have exited via the
-         * 3rd leg above.
-         */
-        if (r > max) {
-            s->float_exception_flags = orig_flags | float_flag_invalid;
-            return max;
-        }
-        return r;
     default:
         g_assert_not_reached();
     }
+
+    float_raise(flags, s);
+    return r;
 }
 
 uint8_t float16_to_uint8_scalbn(float16 a, FloatRoundMode rmode, int scale,
@@ -6955,165 +6892,6 @@ floatx80 float128_to_floatx80(float128 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Rounds the quadruple-precision floating-point value `a' to an integer, and
-| returns the result as a quadruple-precision floating-point value.  The
-| operation is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 float128_round_to_int(float128 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp;
-    uint64_t lastBitMask, roundBitsMask;
-    float128 z;
-
-    aExp = extractFloat128Exp( a );
-    if ( 0x402F <= aExp ) {
-        if ( 0x406F <= aExp ) {
-            if (    ( aExp == 0x7FFF )
-                 && ( extractFloat128Frac0( a ) | extractFloat128Frac1( a ) )
-               ) {
-                return propagateFloat128NaN(a, a, status);
-            }
-            return a;
-        }
-        lastBitMask = 1;
-        lastBitMask = ( lastBitMask<<( 0x406E - aExp ) )<<1;
-        roundBitsMask = lastBitMask - 1;
-        z = a;
-        switch (status->float_rounding_mode) {
-        case float_round_nearest_even:
-            if ( lastBitMask ) {
-                add128( z.high, z.low, 0, lastBitMask>>1, &z.high, &z.low );
-                if ( ( z.low & roundBitsMask ) == 0 ) z.low &= ~ lastBitMask;
-            }
-            else {
-                if ( (int64_t) z.low < 0 ) {
-                    ++z.high;
-                    if ( (uint64_t) ( z.low<<1 ) == 0 ) z.high &= ~1;
-                }
-            }
-            break;
-        case float_round_ties_away:
-            if (lastBitMask) {
-                add128(z.high, z.low, 0, lastBitMask >> 1, &z.high, &z.low);
-            } else {
-                if ((int64_t) z.low < 0) {
-                    ++z.high;
-                }
-            }
-            break;
-        case float_round_to_zero:
-            break;
-        case float_round_up:
-            if (!extractFloat128Sign(z)) {
-                add128(z.high, z.low, 0, roundBitsMask, &z.high, &z.low);
-            }
-            break;
-        case float_round_down:
-            if (extractFloat128Sign(z)) {
-                add128(z.high, z.low, 0, roundBitsMask, &z.high, &z.low);
-            }
-            break;
-        case float_round_to_odd:
-            /*
-             * Note that if lastBitMask == 0, the last bit is the lsb
-             * of high, and roundBitsMask == -1.
-             */
-            if ((lastBitMask ? z.low & lastBitMask : z.high & 1) == 0) {
-                add128(z.high, z.low, 0, roundBitsMask, &z.high, &z.low);
-            }
-            break;
-        default:
-            abort();
-        }
-        z.low &= ~ roundBitsMask;
-    }
-    else {
-        if ( aExp < 0x3FFF ) {
-            if ( ( ( (uint64_t) ( a.high<<1 ) ) | a.low ) == 0 ) return a;
-            float_raise(float_flag_inexact, status);
-            aSign = extractFloat128Sign( a );
-            switch (status->float_rounding_mode) {
-            case float_round_nearest_even:
-                if (    ( aExp == 0x3FFE )
-                     && (   extractFloat128Frac0( a )
-                          | extractFloat128Frac1( a ) )
-                   ) {
-                    return packFloat128( aSign, 0x3FFF, 0, 0 );
-                }
-                break;
-            case float_round_ties_away:
-                if (aExp == 0x3FFE) {
-                    return packFloat128(aSign, 0x3FFF, 0, 0);
-                }
-                break;
-            case float_round_down:
-                return
-                      aSign ? packFloat128( 1, 0x3FFF, 0, 0 )
-                    : packFloat128( 0, 0, 0, 0 );
-            case float_round_up:
-                return
-                      aSign ? packFloat128( 1, 0, 0, 0 )
-                    : packFloat128( 0, 0x3FFF, 0, 0 );
-
-            case float_round_to_odd:
-                return packFloat128(aSign, 0x3FFF, 0, 0);
-
-            case float_round_to_zero:
-                break;
-            }
-            return packFloat128( aSign, 0, 0, 0 );
-        }
-        lastBitMask = 1;
-        lastBitMask <<= 0x402F - aExp;
-        roundBitsMask = lastBitMask - 1;
-        z.low = 0;
-        z.high = a.high;
-        switch (status->float_rounding_mode) {
-        case float_round_nearest_even:
-            z.high += lastBitMask>>1;
-            if ( ( ( z.high & roundBitsMask ) | a.low ) == 0 ) {
-                z.high &= ~ lastBitMask;
-            }
-            break;
-        case float_round_ties_away:
-            z.high += lastBitMask>>1;
-            break;
-        case float_round_to_zero:
-            break;
-        case float_round_up:
-            if (!extractFloat128Sign(z)) {
-                z.high |= ( a.low != 0 );
-                z.high += roundBitsMask;
-            }
-            break;
-        case float_round_down:
-            if (extractFloat128Sign(z)) {
-                z.high |= (a.low != 0);
-                z.high += roundBitsMask;
-            }
-            break;
-        case float_round_to_odd:
-            if ((z.high & lastBitMask) == 0) {
-                z.high |= (a.low != 0);
-                z.high += roundBitsMask;
-            }
-            break;
-        default:
-            abort();
-        }
-        z.high &= ~ roundBitsMask;
-    }
-    if ( ( z.low != a.low ) || ( z.high != a.high ) ) {
-        float_raise(float_flag_inexact, status);
-    }
-    return z;
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the remainder of the quadruple-precision floating-point value `a'
 | with respect to the corresponding value `b'.  The operation is performed
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index f8165d92f9..b2c4624d8c 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -594,3 +594,160 @@ static FloatPartsN *partsN(div)(FloatPartsN *a, FloatPartsN *b,
     a->cls = float_class_inf;
     return a;
 }
+
+/*
+ * Rounds the floating-point value `a' to an integer, and returns the
+ * result as a floating-point value. The operation is performed
+ * according to the IEC/IEEE Standard for Binary Floating-Point
+ * Arithmetic.
+ *
+ * parts_round_to_int_normal is an internal helper function for
+ * normal numbers only, returning true for inexact but not directly
+ * raising float_flag_inexact.
+ */
+static bool partsN(round_to_int_normal)(FloatPartsN *a, FloatRoundMode rmode,
+                                        int scale, int frac_size)
+{
+    uint64_t frac_lsb, frac_lsbm1, rnd_even_mask, rnd_mask, inc;
+    int shift_adj;
+
+    scale = MIN(MAX(scale, -0x10000), 0x10000);
+    a->exp += scale;
+
+    if (a->exp < 0) {
+        bool one;
+
+        /* All fractional */
+        switch (rmode) {
+        case float_round_nearest_even:
+            one = false;
+            if (a->exp == -1) {
+                FloatPartsN tmp;
+                /* Shift left one, discarding DECOMPOSED_IMPLICIT_BIT */
+                frac_add(&tmp, a, a);
+                /* Anything remaining means frac > 0.5. */
+                one = !frac_eqz(&tmp);
+            }
+            break;
+        case float_round_ties_away:
+            one = a->exp == -1;
+            break;
+        case float_round_to_zero:
+            one = false;
+            break;
+        case float_round_up:
+            one = !a->sign;
+            break;
+        case float_round_down:
+            one = a->sign;
+            break;
+        case float_round_to_odd:
+            one = true;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        frac_clear(a);
+        a->exp = 0;
+        if (one) {
+            a->frac_hi = DECOMPOSED_IMPLICIT_BIT;
+        } else {
+            a->cls = float_class_zero;
+        }
+        return true;
+    }
+
+    if (a->exp >= frac_size) {
+        /* All integral */
+        return false;
+    }
+
+    if (N > 64 && a->exp < N - 64) {
+        /*
+         * Rounding is not in the low word -- shift lsb to bit 2,
+         * which leaves room for sticky and rounding bit.
+         */
+        shift_adj = (N - 1) - (a->exp + 2);
+        frac_shrjam(a, shift_adj);
+        frac_lsb = 1 << 2;
+    } else {
+        shift_adj = 0;
+        frac_lsb = DECOMPOSED_IMPLICIT_BIT >> (a->exp & 63);
+    }
+
+    frac_lsbm1 = frac_lsb >> 1;
+    rnd_mask = frac_lsb - 1;
+    rnd_even_mask = rnd_mask | frac_lsb;
+
+    if (!(a->frac_lo & rnd_mask)) {
+        /* Fractional bits already clear, undo the shift above. */
+        frac_shl(a, shift_adj);
+        return false;
+    }
+
+    switch (rmode) {
+    case float_round_nearest_even:
+        inc = ((a->frac_lo & rnd_even_mask) != frac_lsbm1 ? frac_lsbm1 : 0);
+        break;
+    case float_round_ties_away:
+        inc = frac_lsbm1;
+        break;
+    case float_round_to_zero:
+        inc = 0;
+        break;
+    case float_round_up:
+        inc = a->sign ? 0 : rnd_mask;
+        break;
+    case float_round_down:
+        inc = a->sign ? rnd_mask : 0;
+        break;
+    case float_round_to_odd:
+        inc = a->frac_lo & frac_lsb ? 0 : rnd_mask;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (shift_adj == 0) {
+        if (frac_addi(a, a, inc)) {
+            frac_shr(a, 1);
+            a->frac_hi |= DECOMPOSED_IMPLICIT_BIT;
+            a->exp++;
+        }
+        a->frac_lo &= ~rnd_mask;
+    } else {
+        frac_addi(a, a, inc);
+        a->frac_lo &= ~rnd_mask;
+        /* Be careful shifting back, not to overflow */
+        frac_shl(a, shift_adj - 1);
+        if (a->frac_hi & DECOMPOSED_IMPLICIT_BIT) {
+            a->exp++;
+        } else {
+            frac_add(a, a, a);
+        }
+    }
+    return true;
+}
+
+static void partsN(round_to_int)(FloatPartsN *a, FloatRoundMode rmode,
+                                 int scale, float_status *s,
+                                 const FloatFmt *fmt)
+{
+    switch (a->cls) {
+    case float_class_qnan:
+    case float_class_snan:
+        parts_return_nan(a, s);
+        break;
+    case float_class_zero:
+    case float_class_inf:
+        break;
+    case float_class_normal:
+        if (parts_round_to_int_normal(a, rmode, scale, fmt->frac_size)) {
+            float_raise(float_flag_inexact, s);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.25.1


