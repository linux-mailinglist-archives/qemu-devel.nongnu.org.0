Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E081381EDD
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:46:46 +0200 (CEST)
Received: from localhost ([::1]:54026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGAP-0002E5-Kx
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzZ-0007nX-BY
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:34 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:43926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz2-0007p9-CV
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:31 -0400
Received: by mail-qk1-x72e.google.com with SMTP id a22so3279032qkl.10
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=74NlCKDbpHkPFqR2JzO3Ur0kB3kiLvQefB+wXAjOI4U=;
 b=NOYD++5YbgYiHTHNiN9OyoZzOtlc9Dat/6gA/Cu6RtYQD4qnwQEx4T9DtQeepMGeBt
 Yhr7SpQbdzMfTbT119zJA3T++TuJdPafa1H3azsDz6vd1wPD6plcYnVc/XwsqnqHa+UK
 klOIYg+TcawFXDR0rfIy+EpD61OXxY9pDu3C3kw3EUDf2HOiumXZOfLOLBp5kQpN7ad/
 5PuxqCz/T4hTnXjcbcT9dpdN9Y2g+hCBqBq2ceE7Wfs05J4Z0WS/Ag5eprdhoOdoNMNs
 O7GW+BYk4LXYDSL4x+82YFOyxnZDqeowBXdkDAK8JtstggoFZJyrTz8Zn0lEqkqF3P+n
 4Wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=74NlCKDbpHkPFqR2JzO3Ur0kB3kiLvQefB+wXAjOI4U=;
 b=IYAO1pKK97gSKHBAue9LK4tWWGLDfgH3uKWdqWw7xDIEZA/AuLDAGv/AlfMl1eEE/h
 biAantURqshxiC25coHenSV80A6o6CUbmVy2C4byprkEgfuk8xKBaAl6KlNwlDKsZ2/w
 wXqcez8OWz6yZQCzJdN+Y7zu10+Z/jW0ot0WviXfyFBhVgHVjr8t8Apds1KG2vkfnWWx
 qNQNNdd1ROVpLfrYbgOFQxUOWG1AMiEMORzfSkQtYTGZxRm3y9NtYp8M4gXY8HH5KmI7
 7aKA7avDXKiXz6CfksbzylJd4HX1h2rn3cJ6ZBz2GGfKxGDckaP/6ryD79N6s5Dkc+60
 2TFA==
X-Gm-Message-State: AOAM532fE7oO37ctpxcsIZlWOQZCjB2EoMP9VhhT6IYpI4/AuCdfZKcr
 c4+Fagp9TGBG/6XUxnhkFsFiyBJw80SBexuciIU=
X-Google-Smtp-Source: ABdhPJyZGgCSJrGdK79g2c7By0UgBbI5utoPv1w4yB6R/BVd81xKAt5Eef9GvCUUhS1dcn1AZNCmtA==
X-Received: by 2002:a37:30c:: with SMTP id 12mr52829277qkd.355.1621168499233; 
 Sun, 16 May 2021 05:34:59 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/46] softfloat: Move round_canonical to softfloat-parts.c.inc
Date: Sun, 16 May 2021 07:34:17 -0500
Message-Id: <20210516123431.718318-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the same time, convert to pointers, renaming to parts$N_uncanon,
and define a macro for parts_uncanon using QEMU_GENERIC.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 201 +++++++++-----------------------------
 fpu/softfloat-parts.c.inc | 148 ++++++++++++++++++++++++++++
 2 files changed, 193 insertions(+), 156 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 535261db44..817a91de85 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -741,6 +741,14 @@ static void parts128_canonicalize(FloatParts128 *p, float_status *status,
 #define parts_canonicalize(A, S, F) \
     PARTS_GENERIC_64_128(canonicalize, A)(A, S, F)
 
+static void parts64_uncanon(FloatParts64 *p, float_status *status,
+                            const FloatFmt *fmt);
+static void parts128_uncanon(FloatParts128 *p, float_status *status,
+                             const FloatFmt *fmt);
+
+#define parts_uncanon(A, S, F) \
+    PARTS_GENERIC_64_128(uncanon, A)(A, S, F)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -748,6 +756,31 @@ static void parts128_canonicalize(FloatParts128 *p, float_status *status,
 #define FRAC_GENERIC_64_128(NAME, P) \
     QEMU_GENERIC(P, (FloatParts128 *, frac128_##NAME), frac64_##NAME)
 
+static bool frac64_addi(FloatParts64 *r, FloatParts64 *a, uint64_t c)
+{
+    return uadd64_overflow(a->frac, c, &r->frac);
+}
+
+static bool frac128_addi(FloatParts128 *r, FloatParts128 *a, uint64_t c)
+{
+    c = uadd64_overflow(a->frac_lo, c, &r->frac_lo);
+    return uadd64_overflow(a->frac_hi, c, &r->frac_hi);
+}
+
+#define frac_addi(R, A, C)  FRAC_GENERIC_64_128(addi, R)(R, A, C)
+
+static void frac64_allones(FloatParts64 *a)
+{
+    a->frac = -1;
+}
+
+static void frac128_allones(FloatParts128 *a)
+{
+    a->frac_hi = a->frac_lo = -1;
+}
+
+#define frac_allones(A)  FRAC_GENERIC_64_128(allones, A)(A)
+
 static int frac64_cmp(FloatParts64 *a, FloatParts64 *b)
 {
     return a->frac == b->frac ? 0 : a->frac < b->frac ? -1 : 1;
@@ -846,161 +879,17 @@ static void frac128_shr(FloatParts128 *a, int c)
 
 #define frac_shr(A, C)  FRAC_GENERIC_64_128(shr, A)(A, C)
 
-
-/* Round and uncanonicalize a floating-point number by parts. There
- * are FRAC_SHIFT bits that may require rounding at the bottom of the
- * fraction; these bits will be removed. The exponent will be biased
- * by EXP_BIAS and must be bounded by [EXP_MAX-1, 0].
- */
-
-static FloatParts64 round_canonical(FloatParts64 p, float_status *s,
-                                  const FloatFmt *parm)
+static void frac64_shrjam(FloatParts64 *a, int c)
 {
-    const uint64_t frac_lsb = parm->frac_lsb;
-    const uint64_t frac_lsbm1 = parm->frac_lsbm1;
-    const uint64_t round_mask = parm->round_mask;
-    const uint64_t roundeven_mask = parm->roundeven_mask;
-    const int exp_max = parm->exp_max;
-    const int frac_shift = parm->frac_shift;
-    uint64_t frac, inc;
-    int exp, flags = 0;
-    bool overflow_norm;
-
-    frac = p.frac;
-    exp = p.exp;
-
-    switch (p.cls) {
-    case float_class_normal:
-        switch (s->float_rounding_mode) {
-        case float_round_nearest_even:
-            overflow_norm = false;
-            inc = ((frac & roundeven_mask) != frac_lsbm1 ? frac_lsbm1 : 0);
-            break;
-        case float_round_ties_away:
-            overflow_norm = false;
-            inc = frac_lsbm1;
-            break;
-        case float_round_to_zero:
-            overflow_norm = true;
-            inc = 0;
-            break;
-        case float_round_up:
-            inc = p.sign ? 0 : round_mask;
-            overflow_norm = p.sign;
-            break;
-        case float_round_down:
-            inc = p.sign ? round_mask : 0;
-            overflow_norm = !p.sign;
-            break;
-        case float_round_to_odd:
-            overflow_norm = true;
-            inc = frac & frac_lsb ? 0 : round_mask;
-            break;
-        default:
-            g_assert_not_reached();
-        }
-
-        exp += parm->exp_bias;
-        if (likely(exp > 0)) {
-            if (frac & round_mask) {
-                flags |= float_flag_inexact;
-                if (uadd64_overflow(frac, inc, &frac)) {
-                    frac = (frac >> 1) | DECOMPOSED_IMPLICIT_BIT;
-                    exp++;
-                }
-            }
-            frac >>= frac_shift;
-
-            if (parm->arm_althp) {
-                /* ARM Alt HP eschews Inf and NaN for a wider exponent.  */
-                if (unlikely(exp > exp_max)) {
-                    /* Overflow.  Return the maximum normal.  */
-                    flags = float_flag_invalid;
-                    exp = exp_max;
-                    frac = -1;
-                }
-            } else if (unlikely(exp >= exp_max)) {
-                flags |= float_flag_overflow | float_flag_inexact;
-                if (overflow_norm) {
-                    exp = exp_max - 1;
-                    frac = -1;
-                } else {
-                    p.cls = float_class_inf;
-                    goto do_inf;
-                }
-            }
-        } else if (s->flush_to_zero) {
-            flags |= float_flag_output_denormal;
-            p.cls = float_class_zero;
-            goto do_zero;
-        } else {
-            bool is_tiny = s->tininess_before_rounding || (exp < 0);
-
-            if (!is_tiny) {
-                uint64_t discard;
-                is_tiny = !uadd64_overflow(frac, inc, &discard);
-            }
-
-            shift64RightJamming(frac, 1 - exp, &frac);
-            if (frac & round_mask) {
-                /* Need to recompute round-to-even.  */
-                switch (s->float_rounding_mode) {
-                case float_round_nearest_even:
-                    inc = ((frac & roundeven_mask) != frac_lsbm1
-                           ? frac_lsbm1 : 0);
-                    break;
-                case float_round_to_odd:
-                    inc = frac & frac_lsb ? 0 : round_mask;
-                    break;
-                default:
-                    break;
-                }
-                flags |= float_flag_inexact;
-                frac += inc;
-            }
-
-            exp = (frac & DECOMPOSED_IMPLICIT_BIT ? 1 : 0);
-            frac >>= frac_shift;
-
-            if (is_tiny && (flags & float_flag_inexact)) {
-                flags |= float_flag_underflow;
-            }
-            if (exp == 0 && frac == 0) {
-                p.cls = float_class_zero;
-            }
-        }
-        break;
-
-    case float_class_zero:
-    do_zero:
-        exp = 0;
-        frac = 0;
-        break;
-
-    case float_class_inf:
-    do_inf:
-        assert(!parm->arm_althp);
-        exp = exp_max;
-        frac = 0;
-        break;
-
-    case float_class_qnan:
-    case float_class_snan:
-        assert(!parm->arm_althp);
-        exp = exp_max;
-        frac >>= parm->frac_shift;
-        break;
-
-    default:
-        g_assert_not_reached();
-    }
-
-    float_raise(flags, s);
-    p.exp = exp;
-    p.frac = frac;
-    return p;
+    shift64RightJamming(a->frac, c, &a->frac);
 }
 
+static void frac128_shrjam(FloatParts128 *a, int c)
+{
+    shift128RightJamming(a->frac_hi, a->frac_lo, c, &a->frac_hi, &a->frac_lo);
+}
+
+#define frac_shrjam(A, C)  FRAC_GENERIC_64_128(shrjam, A)(A, C)
 
 #define partsN(NAME)   parts64_##NAME
 #define FloatPartsN    FloatParts64
@@ -1045,7 +934,7 @@ static float16 float16a_round_pack_canonical(FloatParts64 *p,
                                              float_status *s,
                                              const FloatFmt *params)
 {
-    *p = round_canonical(*p, s, params);
+    parts_uncanon(p, s, params);
     return float16_pack_raw(p);
 }
 
@@ -1058,7 +947,7 @@ static float16 float16_round_pack_canonical(FloatParts64 *p,
 static bfloat16 bfloat16_round_pack_canonical(FloatParts64 *p,
                                               float_status *s)
 {
-    *p = round_canonical(*p, s, &bfloat16_params);
+    parts_uncanon(p, s, &bfloat16_params);
     return bfloat16_pack_raw(p);
 }
 
@@ -1072,7 +961,7 @@ static void float32_unpack_canonical(FloatParts64 *p, float32 f,
 static float32 float32_round_pack_canonical(FloatParts64 *p,
                                             float_status *s)
 {
-    *p = round_canonical(*p, s, &float32_params);
+    parts_uncanon(p, s, &float32_params);
     return float32_pack_raw(p);
 }
 
@@ -1086,7 +975,7 @@ static void float64_unpack_canonical(FloatParts64 *p, float64 f,
 static float64 float64_round_pack_canonical(FloatParts64 *p,
                                             float_status *s)
 {
-    *p = round_canonical(*p, s, &float64_params);
+    parts_uncanon(p, s, &float64_params);
     return float64_pack_raw(p);
 }
 
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 25bf99bd0f..efdc724770 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -133,3 +133,151 @@ static void partsN(canonicalize)(FloatPartsN *p, float_status *status,
                   ? float_class_snan : float_class_qnan);
     }
 }
+
+/*
+ * Round and uncanonicalize a floating-point number by parts. There
+ * are FRAC_SHIFT bits that may require rounding at the bottom of the
+ * fraction; these bits will be removed. The exponent will be biased
+ * by EXP_BIAS and must be bounded by [EXP_MAX-1, 0].
+ */
+static void partsN(uncanon)(FloatPartsN *p, float_status *s,
+                            const FloatFmt *fmt)
+{
+    const int exp_max = fmt->exp_max;
+    const int frac_shift = fmt->frac_shift;
+    const uint64_t frac_lsb = fmt->frac_lsb;
+    const uint64_t frac_lsbm1 = fmt->frac_lsbm1;
+    const uint64_t round_mask = fmt->round_mask;
+    const uint64_t roundeven_mask = fmt->roundeven_mask;
+    uint64_t inc;
+    bool overflow_norm;
+    int exp, flags = 0;
+
+    if (unlikely(p->cls != float_class_normal)) {
+        switch (p->cls) {
+        case float_class_zero:
+            p->exp = 0;
+            frac_clear(p);
+            return;
+        case float_class_inf:
+            g_assert(!fmt->arm_althp);
+            p->exp = fmt->exp_max;
+            frac_clear(p);
+            return;
+        case float_class_qnan:
+        case float_class_snan:
+            g_assert(!fmt->arm_althp);
+            p->exp = fmt->exp_max;
+            frac_shr(p, fmt->frac_shift);
+            return;
+        default:
+            break;
+        }
+        g_assert_not_reached();
+    }
+
+    switch (s->float_rounding_mode) {
+    case float_round_nearest_even:
+        overflow_norm = false;
+        inc = ((p->frac_lo & roundeven_mask) != frac_lsbm1 ? frac_lsbm1 : 0);
+        break;
+    case float_round_ties_away:
+        overflow_norm = false;
+        inc = frac_lsbm1;
+        break;
+    case float_round_to_zero:
+        overflow_norm = true;
+        inc = 0;
+        break;
+    case float_round_up:
+        inc = p->sign ? 0 : round_mask;
+        overflow_norm = p->sign;
+        break;
+    case float_round_down:
+        inc = p->sign ? round_mask : 0;
+        overflow_norm = !p->sign;
+        break;
+    case float_round_to_odd:
+        overflow_norm = true;
+        inc = p->frac_lo & frac_lsb ? 0 : round_mask;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    exp = p->exp + fmt->exp_bias;
+    if (likely(exp > 0)) {
+        if (p->frac_lo & round_mask) {
+            flags |= float_flag_inexact;
+            if (frac_addi(p, p, inc)) {
+                frac_shr(p, 1);
+                p->frac_hi |= DECOMPOSED_IMPLICIT_BIT;
+                exp++;
+            }
+        }
+        frac_shr(p, frac_shift);
+
+        if (fmt->arm_althp) {
+            /* ARM Alt HP eschews Inf and NaN for a wider exponent.  */
+            if (unlikely(exp > exp_max)) {
+                /* Overflow.  Return the maximum normal.  */
+                flags = float_flag_invalid;
+                exp = exp_max;
+                frac_allones(p);
+            }
+        } else if (unlikely(exp >= exp_max)) {
+            flags |= float_flag_overflow | float_flag_inexact;
+            if (overflow_norm) {
+                exp = exp_max - 1;
+                frac_allones(p);
+            } else {
+                p->cls = float_class_inf;
+                exp = exp_max;
+                frac_clear(p);
+            }
+        }
+    } else if (s->flush_to_zero) {
+        flags |= float_flag_output_denormal;
+        p->cls = float_class_zero;
+        exp = 0;
+        frac_clear(p);
+    } else {
+        bool is_tiny = s->tininess_before_rounding || exp < 0;
+
+        if (!is_tiny) {
+            FloatPartsN discard;
+            is_tiny = !frac_addi(&discard, p, inc);
+        }
+
+        frac_shrjam(p, 1 - exp);
+
+        if (p->frac_lo & round_mask) {
+            /* Need to recompute round-to-even/round-to-odd. */
+            switch (s->float_rounding_mode) {
+            case float_round_nearest_even:
+                inc = ((p->frac_lo & roundeven_mask) != frac_lsbm1
+                       ? frac_lsbm1 : 0);
+                break;
+            case float_round_to_odd:
+                inc = p->frac_lo & frac_lsb ? 0 : round_mask;
+                break;
+            default:
+                break;
+            }
+            flags |= float_flag_inexact;
+            frac_addi(p, p, inc);
+        }
+
+        exp = (p->frac_hi & DECOMPOSED_IMPLICIT_BIT) != 0;
+        frac_shr(p, frac_shift);
+
+        if (is_tiny && (flags & float_flag_inexact)) {
+            flags |= float_flag_underflow;
+        }
+        if (exp == 0 && frac_eqz(p)) {
+            p->cls = float_class_zero;
+        }
+    }
+    p->exp = exp;
+    float_raise(flags, s);
+}
-- 
2.25.1


