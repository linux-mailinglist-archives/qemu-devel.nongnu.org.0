Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79093376E64
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:08:16 +0200 (CEST)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCO7-0004Y8-F9
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC5B-0004cm-8n
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:41 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:34603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4w-0003eb-Vn
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:40 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 t2-20020a17090a0242b0290155433387beso5535188pje.1
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGpOakjV0VOj6azWVGKzsBGpzQYOaN2R/8eKbyrZbMU=;
 b=fLkgAwwHg5gJQi23BooROnxI7JKl/nKSMGwyBQHIJWLlCJbtySSnOF6L2BOk752N8C
 P4EA4VdwLdpqlKk8dQOQlD35v+5cIuY96edZVw48Ud+5MyshnbeLJ7iCXjd5WHTv66v/
 QKiqulcOHTbSTTL1cT5plxymw0ij6VuuyBe63hLCnyB7e3nNbM9JifLU8//SFY+OP8Lp
 iNDjz9ROQlgRuRuAFNkAtmwuxO6oWb+ceDJBQeUyxYHZXeeKWMm6U6luAl11/KAfY1NC
 RUji72/3PxQGye/qpwds8YmnhCkPjdy5GW1xZSx/dUy0+RA2rVwrYZqI0BCuyHqeaYbg
 m/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGpOakjV0VOj6azWVGKzsBGpzQYOaN2R/8eKbyrZbMU=;
 b=czqD0PycV2Zr9w+Dq14CTUTIBlCnfQTXQh1jVUcvWX8Jprvx2yETzOFe/JnoGSxsmJ
 8IzIWNUBxlPTj7evVB6ZPMKZLZoSugdzHnqr/3UTRbO/pln5VsJZjqTxjcWORKlf3Fus
 Sw1wqOYR0iIruj5fp0VEVLfIkIyz1XxotvDk6xkHewAfWNXkxPPN+YqRSVINbl7fNmf5
 g/k3pClN+O+DCb5Of5a+iIGsVpsYClISpC3tdg9KIXOKgVa7GwOshnpmDMHGZO2rym4Y
 mKiCxY5JIAwkCW8hDdnXcQdi7QQSDS1d1SdHsh3WmF2yPnToV/2e1tuWek+MV07D1O+Z
 ba9Q==
X-Gm-Message-State: AOAM530AVUiGjQ4DbnF/xUF8EbdpoaSCbz+3/ojfpxAJUkj2u8pyQe43
 xrgH02BoI8anF6gx4mY7gPYIU5ybXrvSHw==
X-Google-Smtp-Source: ABdhPJy79x5Ck4KQBUi4NCsimPpQL9jOLFJY2suXjkmqCiHxWtYUyAylUuXxkgkAiaqIHy8syQr+WA==
X-Received: by 2002:a17:902:4d:b029:ec:94df:c9aa with SMTP id
 71-20020a170902004db02900ec94dfc9aamr13263991pla.7.1620438504470; 
 Fri, 07 May 2021 18:48:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 32/72] softfloat: Move round_canonical to softfloat-parts.c.inc
Date: Fri,  7 May 2021 18:47:22 -0700
Message-Id: <20210508014802.892561-33-richard.henderson@linaro.org>
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

At the same time, convert to pointers, renaming to parts$N_uncanon,
and define a macro for parts_uncanon using QEMU_GENERIC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 201 +++++++++-----------------------------
 fpu/softfloat-parts.c.inc | 148 ++++++++++++++++++++++++++++
 2 files changed, 193 insertions(+), 156 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index bad4b54cd2..e9d644385d 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -740,6 +740,14 @@ static void parts128_canonicalize(FloatParts128 *p, float_status *status,
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
@@ -747,6 +755,31 @@ static void parts128_canonicalize(FloatParts128 *p, float_status *status,
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
@@ -845,161 +878,17 @@ static void frac128_shr(FloatParts128 *a, int c)
 
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
@@ -1044,7 +933,7 @@ static float16 float16a_round_pack_canonical(FloatParts64 *p,
                                              float_status *s,
                                              const FloatFmt *params)
 {
-    *p = round_canonical(*p, s, params);
+    parts_uncanon(p, s, params);
     return float16_pack_raw(p);
 }
 
@@ -1057,7 +946,7 @@ static float16 float16_round_pack_canonical(FloatParts64 *p,
 static bfloat16 bfloat16_round_pack_canonical(FloatParts64 *p,
                                               float_status *s)
 {
-    *p = round_canonical(*p, s, &bfloat16_params);
+    parts_uncanon(p, s, &bfloat16_params);
     return bfloat16_pack_raw(p);
 }
 
@@ -1071,7 +960,7 @@ static void float32_unpack_canonical(FloatParts64 *p, float32 f,
 static float32 float32_round_pack_canonical(FloatParts64 *p,
                                             float_status *s)
 {
-    *p = round_canonical(*p, s, &float32_params);
+    parts_uncanon(p, s, &float32_params);
     return float32_pack_raw(p);
 }
 
@@ -1085,7 +974,7 @@ static void float64_unpack_canonical(FloatParts64 *p, float64 f,
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


