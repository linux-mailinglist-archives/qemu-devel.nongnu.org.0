Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC78376E5C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:04:23 +0200 (CEST)
Received: from localhost ([::1]:53390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCKM-0004uu-BQ
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4j-00045a-C2
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:13 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:47030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4f-0003Wa-71
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:13 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 fa21-20020a17090af0d5b0290157eb6b590fso6550563pjb.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tsoe+BVssAGH6OVs2DygacO7h0Tml9zLW3atLp8I1f0=;
 b=M0SObHiq5cUl63fpaTJvnw93HEdnbdJKH5tVoPtE5grl+Ze6KTdWc1LFB6S17lZrfE
 8JXI5hJRIu0AMndr1cSN/rEwTuoqullWgyf/MNL54vCnMAofi5XHx+Mm91mkmX0LZmzJ
 YVPiCtX/+kjC42UCML7g1c2cQiAfmvEVTBj3gWtCo0OCzpgPwEF+jpz4yAxYFKtjn8ZM
 t+sIL64v0Uu5TDCTHiISmCU87XnizkRJmDB5PJoiTExTn/SjS7wArGmzLeSWjHTA56a/
 yxDvCxzSAMK5ZpkpAc0VbRLP2GiPWG/oSXdew1p1CzzR+vW87Nnvo2w4e0RfZJFCLJHL
 8H3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tsoe+BVssAGH6OVs2DygacO7h0Tml9zLW3atLp8I1f0=;
 b=jeOAoskseuduh1ofCtgkGbYGj5mPu66sfXkk44NkqEUHWpvYmJnNOmJD0Ai28sUhQs
 /hBELqM6d3Cxg4ZARPmkSy7hX2JjFCx9GlkBe0kus7ofkXmxQUllGBu5IysOk/VEYMKf
 +9BvVioQ7zE034+m0HImVQD0khkfwDq+6NuzbSc1dCq0+oms0IwMK/pej5SmGjGboB2P
 FHkLKcPb1DtXyUXWvvb6MIzkjfIcf8O+qoAmJkGEkpl4ZU4Hq8mE3tucG8B9rOTMS1Eq
 LlmmmFcxO9BOs2hC/lIWm3uQSg+TD64VHkJ9SpXaZw6Jsfr4YypfsI4/Mk2TlYtIk/Us
 y3oA==
X-Gm-Message-State: AOAM533RkVi25u3sk3wuWELzE3eIV5GSWVDPrypA+Xvlr4+K73ZkG5nV
 1C53CpDHDetpGdyOpD1/XF0pXI5oD+v5Rw==
X-Google-Smtp-Source: ABdhPJx4cm4K54SBVzYM0fysXjAkYnXtPDHmreewAMJCzN94guPSZgYeezV9GtzmOgTofu3+A3s12g==
X-Received: by 2002:a17:90a:8410:: with SMTP id
 j16mr13555454pjn.120.1620438487891; 
 Fri, 07 May 2021 18:48:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/72] softfloat: Move the binary point to the msb
Date: Fri,  7 May 2021 18:46:56 -0700
Message-Id: <20210508014802.892561-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Rather than point the binary point at msb-1, put it at the msb.
Use uadd64_overflow to detect when addition overflows instead
of DECOMPOSED_OVERFLOW_BIT.

This reduces the number of special cases within the code, such
as shifting an int64_t either left or right during conversion.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 169 +++++++++++++++++++-----------------------------
 1 file changed, 66 insertions(+), 103 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 67cfa0fd82..cd777743f1 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -503,9 +503,8 @@ typedef struct {
     bool sign;
 } FloatParts;
 
-#define DECOMPOSED_BINARY_POINT    (64 - 2)
+#define DECOMPOSED_BINARY_POINT    63
 #define DECOMPOSED_IMPLICIT_BIT    (1ull << DECOMPOSED_BINARY_POINT)
-#define DECOMPOSED_OVERFLOW_BIT    (DECOMPOSED_IMPLICIT_BIT << 1)
 
 /* Structure holding all of the relevant parameters for a format.
  *   exp_size: the size of the exponent field
@@ -657,7 +656,7 @@ static FloatParts sf_canonicalize(FloatParts part, const FloatFmt *parm,
             part.cls = float_class_zero;
             part.frac = 0;
         } else {
-            int shift = clz64(part.frac) - 1;
+            int shift = clz64(part.frac);
             part.cls = float_class_normal;
             part.exp = parm->frac_shift - parm->exp_bias - shift + 1;
             part.frac <<= shift;
@@ -727,9 +726,8 @@ static FloatParts round_canonical(FloatParts p, float_status *s,
         if (likely(exp > 0)) {
             if (frac & round_mask) {
                 flags |= float_flag_inexact;
-                frac += inc;
-                if (frac & DECOMPOSED_OVERFLOW_BIT) {
-                    frac >>= 1;
+                if (uadd64_overflow(frac, inc, &frac)) {
+                    frac = (frac >> 1) | DECOMPOSED_IMPLICIT_BIT;
                     exp++;
                 }
             }
@@ -758,9 +756,12 @@ static FloatParts round_canonical(FloatParts p, float_status *s,
             p.cls = float_class_zero;
             goto do_zero;
         } else {
-            bool is_tiny = s->tininess_before_rounding
-                        || (exp < 0)
-                        || !((frac + inc) & DECOMPOSED_OVERFLOW_BIT);
+            bool is_tiny = s->tininess_before_rounding || (exp < 0);
+
+            if (!is_tiny) {
+                uint64_t discard;
+                is_tiny = !uadd64_overflow(frac, inc, &discard);
+            }
 
             shift64RightJamming(frac, 1 - exp, &frac);
             if (frac & round_mask) {
@@ -985,7 +986,7 @@ static FloatParts addsub_floats(FloatParts a, FloatParts b, bool subtract,
                 a.cls = float_class_zero;
                 a.sign = s->float_rounding_mode == float_round_down;
             } else {
-                int shift = clz64(a.frac) - 1;
+                int shift = clz64(a.frac);
                 a.frac = a.frac << shift;
                 a.exp = a.exp - shift;
                 a.sign = a_sign;
@@ -1022,9 +1023,10 @@ static FloatParts addsub_floats(FloatParts a, FloatParts b, bool subtract,
                 shift64RightJamming(a.frac, b.exp - a.exp, &a.frac);
                 a.exp = b.exp;
             }
-            a.frac += b.frac;
-            if (a.frac & DECOMPOSED_OVERFLOW_BIT) {
+
+            if (uadd64_overflow(a.frac, b.frac, &a.frac)) {
                 shift64RightJamming(a.frac, 1, &a.frac);
+                a.frac |= DECOMPOSED_IMPLICIT_BIT;
                 a.exp += 1;
             }
             return a;
@@ -1219,16 +1221,17 @@ static FloatParts mul_floats(FloatParts a, FloatParts b, float_status *s)
         int exp = a.exp + b.exp;
 
         mul64To128(a.frac, b.frac, &hi, &lo);
-        shift128RightJamming(hi, lo, DECOMPOSED_BINARY_POINT, &hi, &lo);
-        if (lo & DECOMPOSED_OVERFLOW_BIT) {
-            shift64RightJamming(lo, 1, &lo);
+        if (hi & DECOMPOSED_IMPLICIT_BIT) {
             exp += 1;
+        } else {
+            hi <<= 1;
         }
+        hi |= (lo != 0);
 
         /* Re-use a */
         a.exp = exp;
         a.sign = sign;
-        a.frac = lo;
+        a.frac = hi;
         return a;
     }
     /* handle all the NaN cases */
@@ -1411,56 +1414,41 @@ static FloatParts muladd_floats(FloatParts a, FloatParts b, FloatParts c,
 
     p_exp = a.exp + b.exp;
 
-    /* Multiply of 2 62-bit numbers produces a (2*62) == 124-bit
-     * result.
-     */
     mul64To128(a.frac, b.frac, &hi, &lo);
-    /* binary point now at bit 124 */
 
-    /* check for overflow */
-    if (hi & (1ULL << (DECOMPOSED_BINARY_POINT * 2 + 1 - 64))) {
-        shift128RightJamming(hi, lo, 1, &hi, &lo);
+    /* Renormalize to the msb. */
+    if (hi & DECOMPOSED_IMPLICIT_BIT) {
         p_exp += 1;
+    } else {
+        shortShift128Left(hi, lo, 1, &hi, &lo);
     }
 
     /* + add/sub */
-    if (c.cls == float_class_zero) {
-        /* move binary point back to 62 */
-        shift128RightJamming(hi, lo, DECOMPOSED_BINARY_POINT, &hi, &lo);
-    } else {
+    if (c.cls != float_class_zero) {
         int exp_diff = p_exp - c.exp;
         if (p_sign == c.sign) {
             /* Addition */
             if (exp_diff <= 0) {
-                shift128RightJamming(hi, lo,
-                                     DECOMPOSED_BINARY_POINT - exp_diff,
-                                     &hi, &lo);
-                lo += c.frac;
+                shift64RightJamming(hi, -exp_diff, &hi);
                 p_exp = c.exp;
+                if (uadd64_overflow(hi, c.frac, &hi)) {
+                    shift64RightJamming(hi, 1, &hi);
+                    hi |= DECOMPOSED_IMPLICIT_BIT;
+                    p_exp += 1;
+                }
             } else {
-                uint64_t c_hi, c_lo;
-                /* shift c to the same binary point as the product (124) */
-                c_hi = c.frac >> 2;
-                c_lo = 0;
-                shift128RightJamming(c_hi, c_lo,
-                                     exp_diff,
-                                     &c_hi, &c_lo);
-                add128(hi, lo, c_hi, c_lo, &hi, &lo);
-                /* move binary point back to 62 */
-                shift128RightJamming(hi, lo, DECOMPOSED_BINARY_POINT, &hi, &lo);
+                uint64_t c_hi, c_lo, over;
+                shift128RightJamming(c.frac, 0, exp_diff, &c_hi, &c_lo);
+                add192(0, hi, lo, 0, c_hi, c_lo, &over, &hi, &lo);
+                if (over) {
+                    shift64RightJamming(hi, 1, &hi);
+                    hi |= DECOMPOSED_IMPLICIT_BIT;
+                    p_exp += 1;
+                }
             }
-
-            if (lo & DECOMPOSED_OVERFLOW_BIT) {
-                shift64RightJamming(lo, 1, &lo);
-                p_exp += 1;
-            }
-
         } else {
             /* Subtraction */
-            uint64_t c_hi, c_lo;
-            /* make C binary point match product at bit 124 */
-            c_hi = c.frac >> 2;
-            c_lo = 0;
+            uint64_t c_hi = c.frac, c_lo = 0;
 
             if (exp_diff <= 0) {
                 shift128RightJamming(hi, lo, -exp_diff, &hi, &lo);
@@ -1495,20 +1483,15 @@ static FloatParts muladd_floats(FloatParts a, FloatParts b, FloatParts c,
                 /* Normalizing to a binary point of 124 is the
                    correct adjust for the exponent.  However since we're
                    shifting, we might as well put the binary point back
-                   at 62 where we really want it.  Therefore shift as
+                   at 63 where we really want it.  Therefore shift as
                    if we're leaving 1 bit at the top of the word, but
                    adjust the exponent as if we're leaving 3 bits.  */
-                shift -= 1;
-                if (shift >= 64) {
-                    lo = lo << (shift - 64);
-                } else {
-                    hi = (hi << shift) | (lo >> (64 - shift));
-                    lo = hi | ((lo << shift) != 0);
-                }
-                p_exp -= shift - 2;
+                shift128Left(hi, lo, shift, &hi, &lo);
+                p_exp -= shift;
             }
         }
     }
+    hi |= (lo != 0);
 
     if (flags & float_muladd_halve_result) {
         p_exp -= 1;
@@ -1518,7 +1501,7 @@ static FloatParts muladd_floats(FloatParts a, FloatParts b, FloatParts c,
     a.cls = float_class_normal;
     a.sign = p_sign ^ sign_flip;
     a.exp = p_exp;
-    a.frac = lo;
+    a.frac = hi;
 
     return a;
 }
@@ -1742,25 +1725,17 @@ static FloatParts div_floats(FloatParts a, FloatParts b, float_status *s)
          * exponent to match.
          *
          * The udiv_qrnnd algorithm that we're using requires normalization,
-         * i.e. the msb of the denominator must be set.  Since we know that
-         * DECOMPOSED_BINARY_POINT is msb-1, the inputs must be shifted left
-         * by one (more), and the remainder must be shifted right by one.
+         * i.e. the msb of the denominator must be set, which is already true.
          */
         if (a.frac < b.frac) {
             exp -= 1;
-            shift128Left(0, a.frac, DECOMPOSED_BINARY_POINT + 2, &n1, &n0);
-        } else {
             shift128Left(0, a.frac, DECOMPOSED_BINARY_POINT + 1, &n1, &n0);
+        } else {
+            shift128Left(0, a.frac, DECOMPOSED_BINARY_POINT, &n1, &n0);
         }
-        q = udiv_qrnnd(&r, n1, n0, b.frac << 1);
+        q = udiv_qrnnd(&r, n1, n0, b.frac);
 
-        /*
-         * Set lsb if there is a remainder, to set inexact.
-         * As mentioned above, to find the actual value of the remainder we
-         * would need to shift right, but (1) we are only concerned about
-         * non-zero-ness, and (2) the remainder will always be even because
-         * both inputs to the division primitive are even.
-         */
+        /* Set lsb if there is a remainder, to set inexact. */
         a.frac = q | (r != 0);
         a.sign = sign;
         a.exp = exp;
@@ -2135,12 +2110,12 @@ static FloatParts round_to_int(FloatParts a, FloatRoundMode rmode,
 
             if (a.frac & rnd_mask) {
                 s->float_exception_flags |= float_flag_inexact;
-                a.frac += inc;
-                a.frac &= ~rnd_mask;
-                if (a.frac & DECOMPOSED_OVERFLOW_BIT) {
+                if (uadd64_overflow(a.frac, inc, &a.frac)) {
                     a.frac >>= 1;
+                    a.frac |= DECOMPOSED_IMPLICIT_BIT;
                     a.exp++;
                 }
+                a.frac &= ~rnd_mask;
             }
         }
         break;
@@ -2213,10 +2188,8 @@ static int64_t round_to_int_and_pack(FloatParts in, FloatRoundMode rmode,
     case float_class_zero:
         return 0;
     case float_class_normal:
-        if (p.exp < DECOMPOSED_BINARY_POINT) {
+        if (p.exp <= DECOMPOSED_BINARY_POINT) {
             r = p.frac >> (DECOMPOSED_BINARY_POINT - p.exp);
-        } else if (p.exp - DECOMPOSED_BINARY_POINT < 2) {
-            r = p.frac << (p.exp - DECOMPOSED_BINARY_POINT);
         } else {
             r = UINT64_MAX;
         }
@@ -2498,10 +2471,8 @@ static uint64_t round_to_uint_and_pack(FloatParts in, FloatRoundMode rmode,
             return 0;
         }
 
-        if (p.exp < DECOMPOSED_BINARY_POINT) {
+        if (p.exp <= DECOMPOSED_BINARY_POINT) {
             r = p.frac >> (DECOMPOSED_BINARY_POINT - p.exp);
-        } else if (p.exp - DECOMPOSED_BINARY_POINT < 2) {
-            r = p.frac << (p.exp - DECOMPOSED_BINARY_POINT);
         } else {
             s->float_exception_flags = orig_flags | float_flag_invalid;
             return max;
@@ -2765,11 +2736,11 @@ static FloatParts int_to_float(int64_t a, int scale, float_status *status)
             f = -f;
             r.sign = true;
         }
-        shift = clz64(f) - 1;
+        shift = clz64(f);
         scale = MIN(MAX(scale, -0x10000), 0x10000);
 
         r.exp = DECOMPOSED_BINARY_POINT - shift + scale;
-        r.frac = (shift < 0 ? DECOMPOSED_IMPLICIT_BIT : f << shift);
+        r.frac = f << shift;
     }
 
     return r;
@@ -2920,21 +2891,16 @@ bfloat16 int16_to_bfloat16(int16_t a, float_status *status)
 static FloatParts uint_to_float(uint64_t a, int scale, float_status *status)
 {
     FloatParts r = { .sign = false };
+    int shift;
 
     if (a == 0) {
         r.cls = float_class_zero;
     } else {
         scale = MIN(MAX(scale, -0x10000), 0x10000);
+        shift = clz64(a);
         r.cls = float_class_normal;
-        if ((int64_t)a < 0) {
-            r.exp = DECOMPOSED_BINARY_POINT + 1 + scale;
-            shift64RightJamming(a, 1, &a);
-            r.frac = a;
-        } else {
-            int shift = clz64(a) - 1;
-            r.exp = DECOMPOSED_BINARY_POINT - shift + scale;
-            r.frac = a << shift;
-        }
+        r.exp = DECOMPOSED_BINARY_POINT - shift + scale;
+        r.frac = a << shift;
     }
 
     return r;
@@ -3475,12 +3441,9 @@ static FloatParts sqrt_float(FloatParts a, float_status *s, const FloatFmt *p)
     /* We need two overflow bits at the top. Adding room for that is a
      * right shift. If the exponent is odd, we can discard the low bit
      * by multiplying the fraction by 2; that's a left shift. Combine
-     * those and we shift right if the exponent is even.
+     * those and we shift right by 1 if the exponent is odd, otherwise 2.
      */
-    a_frac = a.frac;
-    if (!(a.exp & 1)) {
-        a_frac >>= 1;
-    }
+    a_frac = a.frac >> (2 - (a.exp & 1));
     a.exp >>= 1;
 
     /* Bit-by-bit computation of sqrt.  */
@@ -3488,10 +3451,10 @@ static FloatParts sqrt_float(FloatParts a, float_status *s, const FloatFmt *p)
     s_frac = 0;
 
     /* Iterate from implicit bit down to the 3 extra bits to compute a
-     * properly rounded result. Remember we've inserted one more bit
-     * at the top, so these positions are one less.
+     * properly rounded result. Remember we've inserted two more bits
+     * at the top, so these positions are two less.
      */
-    bit = DECOMPOSED_BINARY_POINT - 1;
+    bit = DECOMPOSED_BINARY_POINT - 2;
     last_bit = MAX(p->frac_shift - 4, 0);
     do {
         uint64_t q = 1ULL << bit;
@@ -3507,7 +3470,7 @@ static FloatParts sqrt_float(FloatParts a, float_status *s, const FloatFmt *p)
     /* Undo the right shift done above. If there is any remaining
      * fraction, the result is inexact. Set the sticky bit.
      */
-    a.frac = (r_frac << 1) + (a_frac != 0);
+    a.frac = (r_frac << 2) + (a_frac != 0);
 
     return a;
 }
-- 
2.25.1


