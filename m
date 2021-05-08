Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BE2376E78
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:17:40 +0200 (CEST)
Received: from localhost ([::1]:34826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCXD-000571-3V
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC5L-0004x9-Gf
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:52 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC50-0003ft-5D
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:51 -0400
Received: by mail-pg1-x532.google.com with SMTP id s22so8629125pgk.6
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Xkz1ybjWLeUjZCsE7o98Dkj/GU255PMCjv80HfDnbE=;
 b=hYjABf281qbp4B54Q9Y39BvAXJi6ngFPgDGw8dWDxKbfnV7rRwFc0Oqd5RNXyNjwXn
 dw79swvbeAibOF3VvJPwzMNcsK56EfIKMEabVTTWdEda1hp8vE9yQIM4qFIG8qKB6U8z
 7Md+GnRT2HLajIchjbXE8Wr1aohmg4OF0EvoSdwR1HW1+ClYxrz4QrkzuP/XufLfadkA
 sNwQ/Ls0cptupKZ5qljsXz5nzkH5VKufV6dj8tXTUW3pLZWUxaPkhFdIjfVjZUDC3q7c
 bWOfxo+7MkjKKEKxhqXkFfozZNvvnczDRb2RaZg/E5cTOi6+waCF4no5+82WqvKlI4hs
 MnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Xkz1ybjWLeUjZCsE7o98Dkj/GU255PMCjv80HfDnbE=;
 b=ECjfhtFGgKdTdOlE/S23unlxXIXDTM9yNbhOlDzPmZrQz+iACJi4LFseqjBmyPbabM
 xW9EjmYP3QvR0odvoVuu+PehfAj0yRxQt5K16lr/exvDJFRtP7zxmgMnDVQRkU3sLGYz
 GUSHfXuvQDczDOTfxw2XEK1omsA7ROV8HeLhrrJ2n4mH3otoPoyJJ1XqphuptH2lu+mQ
 htmBPYGFPhWonyILSzsFvqCfFQwbwWYmB4uRu4bTo5G9JEtDhYmNYEyV27wlyBygUnEu
 vEkGN4vUDwsVuAc4IwxD26nn8ky+lwo54QJZTA+Hqp+mcxMU6LQFlGJ5Nkj/0depdIGQ
 gKHw==
X-Gm-Message-State: AOAM53269JfdI2t36Ls5GpIY10nCYt10mhN7k12D0wbqTVLgxE6+Ck17
 RTon9IYF4UXnsjqOsw6s9wFWQ2UHWwuvEw==
X-Google-Smtp-Source: ABdhPJx+L3CeUZifByVD+t6BWeudEabo8jAvP9Zn0j838uPsyp28nzKL8f274aSlELc83b0eqbQ+ZQ==
X-Received: by 2002:aa7:8503:0:b029:27d:497f:1da6 with SMTP id
 v3-20020aa785030000b029027d497f1da6mr13642574pfn.28.1620438507603; 
 Fri, 07 May 2021 18:48:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 37/72] softfloat: Move muladd_floats to softfloat-parts.c.inc
Date: Fri,  7 May 2021 18:47:27 -0700
Message-Id: <20210508014802.892561-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Rename to parts$N_muladd.
Implement float128_muladd with FloatParts128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat.h   |   2 +
 fpu/softfloat.c           | 406 ++++++++++++++++++--------------------
 tests/fp/fp-bench.c       |   8 +-
 tests/fp/fp-test.c        |   2 +-
 fpu/softfloat-parts.c.inc | 126 ++++++++++++
 tests/fp/wrap.c.inc       |  12 ++
 6 files changed, 342 insertions(+), 214 deletions(-)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 019c2ec66d..53f2c2ea3c 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -1197,6 +1197,8 @@ float128 float128_round_to_int(float128, float_status *status);
 float128 float128_add(float128, float128, float_status *status);
 float128 float128_sub(float128, float128, float_status *status);
 float128 float128_mul(float128, float128, float_status *status);
+float128 float128_muladd(float128, float128, float128, int,
+                         float_status *status);
 float128 float128_div(float128, float128, float_status *status);
 float128 float128_rem(float128, float128, float_status *status);
 float128 float128_sqrt(float128, float_status *status);
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 4f498c11e5..a9ee8498ae 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -715,6 +715,10 @@ static float128 float128_pack_raw(const FloatParts128 *p)
 #define PARTS_GENERIC_64_128(NAME, P) \
     QEMU_GENERIC(P, (FloatParts128 *, parts128_##NAME), parts64_##NAME)
 
+#define PARTS_GENERIC_64_128_256(NAME, P) \
+    QEMU_GENERIC(P, (FloatParts256 *, parts256_##NAME), \
+                 (FloatParts128 *, parts128_##NAME), parts64_##NAME)
+
 #define parts_default_nan(P, S)    PARTS_GENERIC_64_128(default_nan, P)(P, S)
 #define parts_silence_nan(P, S)    PARTS_GENERIC_64_128(silence_nan, P)(P, S)
 
@@ -760,15 +764,17 @@ static void parts128_uncanon(FloatParts128 *p, float_status *status,
 
 static void parts64_add_normal(FloatParts64 *a, FloatParts64 *b);
 static void parts128_add_normal(FloatParts128 *a, FloatParts128 *b);
+static void parts256_add_normal(FloatParts256 *a, FloatParts256 *b);
 
 #define parts_add_normal(A, B) \
-    PARTS_GENERIC_64_128(add_normal, A)(A, B)
+    PARTS_GENERIC_64_128_256(add_normal, A)(A, B)
 
 static bool parts64_sub_normal(FloatParts64 *a, FloatParts64 *b);
 static bool parts128_sub_normal(FloatParts128 *a, FloatParts128 *b);
+static bool parts256_sub_normal(FloatParts256 *a, FloatParts256 *b);
 
 #define parts_sub_normal(A, B) \
-    PARTS_GENERIC_64_128(sub_normal, A)(A, B)
+    PARTS_GENERIC_64_128_256(sub_normal, A)(A, B)
 
 static FloatParts64 *parts64_addsub(FloatParts64 *a, FloatParts64 *b,
                                     float_status *s, bool subtract);
@@ -786,6 +792,16 @@ static FloatParts128 *parts128_mul(FloatParts128 *a, FloatParts128 *b,
 #define parts_mul(A, B, S) \
     PARTS_GENERIC_64_128(mul, A)(A, B, S)
 
+static FloatParts64 *parts64_muladd(FloatParts64 *a, FloatParts64 *b,
+                                    FloatParts64 *c, int flags,
+                                    float_status *s);
+static FloatParts128 *parts128_muladd(FloatParts128 *a, FloatParts128 *b,
+                                      FloatParts128 *c, int flags,
+                                      float_status *s);
+
+#define parts_muladd(A, B, C, Z, S) \
+    PARTS_GENERIC_64_128(muladd, A)(A, B, C, Z, S)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -793,6 +809,10 @@ static FloatParts128 *parts128_mul(FloatParts128 *a, FloatParts128 *b,
 #define FRAC_GENERIC_64_128(NAME, P) \
     QEMU_GENERIC(P, (FloatParts128 *, frac128_##NAME), frac64_##NAME)
 
+#define FRAC_GENERIC_64_128_256(NAME, P) \
+    QEMU_GENERIC(P, (FloatParts256 *, frac256_##NAME), \
+                 (FloatParts128 *, frac128_##NAME), frac64_##NAME)
+
 static bool frac64_add(FloatParts64 *r, FloatParts64 *a, FloatParts64 *b)
 {
     return uadd64_overflow(a->frac, b->frac, &r->frac);
@@ -806,7 +826,17 @@ static bool frac128_add(FloatParts128 *r, FloatParts128 *a, FloatParts128 *b)
     return c;
 }
 
-#define frac_add(R, A, B)  FRAC_GENERIC_64_128(add, R)(R, A, B)
+static bool frac256_add(FloatParts256 *r, FloatParts256 *a, FloatParts256 *b)
+{
+    bool c = 0;
+    r->frac_lo = uadd64_carry(a->frac_lo, b->frac_lo, &c);
+    r->frac_lm = uadd64_carry(a->frac_lm, b->frac_lm, &c);
+    r->frac_hm = uadd64_carry(a->frac_hm, b->frac_hm, &c);
+    r->frac_hi = uadd64_carry(a->frac_hi, b->frac_hi, &c);
+    return c;
+}
+
+#define frac_add(R, A, B)  FRAC_GENERIC_64_128_256(add, R)(R, A, B)
 
 static bool frac64_addi(FloatParts64 *r, FloatParts64 *a, uint64_t c)
 {
@@ -901,7 +931,16 @@ static void frac128_neg(FloatParts128 *a)
     a->frac_hi = usub64_borrow(0, a->frac_hi, &c);
 }
 
-#define frac_neg(A)  FRAC_GENERIC_64_128(neg, A)(A)
+static void frac256_neg(FloatParts256 *a)
+{
+    bool c = 0;
+    a->frac_lo = usub64_borrow(0, a->frac_lo, &c);
+    a->frac_lm = usub64_borrow(0, a->frac_lm, &c);
+    a->frac_hm = usub64_borrow(0, a->frac_hm, &c);
+    a->frac_hi = usub64_borrow(0, a->frac_hi, &c);
+}
+
+#define frac_neg(A)  FRAC_GENERIC_64_128_256(neg, A)(A)
 
 static int frac64_normalize(FloatParts64 *a)
 {
@@ -932,7 +971,55 @@ static int frac128_normalize(FloatParts128 *a)
     return 128;
 }
 
-#define frac_normalize(A)  FRAC_GENERIC_64_128(normalize, A)(A)
+static int frac256_normalize(FloatParts256 *a)
+{
+    uint64_t a0 = a->frac_hi, a1 = a->frac_hm;
+    uint64_t a2 = a->frac_lm, a3 = a->frac_lo;
+    int ret, shl, shr;
+
+    if (likely(a0)) {
+        shl = clz64(a0);
+        if (shl == 0) {
+            return 0;
+        }
+        ret = shl;
+    } else {
+        if (a1) {
+            ret = 64;
+            a0 = a1, a1 = a2, a2 = a3, a3 = 0;
+        } else if (a2) {
+            ret = 128;
+            a0 = a2, a1 = a3, a2 = 0, a3 = 0;
+        } else if (a3) {
+            ret = 192;
+            a0 = a3, a1 = 0, a2 = 0, a3 = 0;
+        } else {
+            ret = 256;
+            a0 = 0, a1 = 0, a2 = 0, a3 = 0;
+            goto done;
+        }
+        shl = clz64(a0);
+        if (shl == 0) {
+            goto done;
+        }
+        ret += shl;
+    }
+
+    shr = -shl & 63;
+    a0 = (a0 << shl) | (a1 >> shr);
+    a1 = (a1 << shl) | (a2 >> shr);
+    a2 = (a2 << shl) | (a3 >> shr);
+    a3 = (a3 << shl);
+
+ done:
+    a->frac_hi = a0;
+    a->frac_hm = a1;
+    a->frac_lm = a2;
+    a->frac_lo = a3;
+    return ret;
+}
+
+#define frac_normalize(A)  FRAC_GENERIC_64_128_256(normalize, A)(A)
 
 static void frac64_shl(FloatParts64 *a, int c)
 {
@@ -968,7 +1055,51 @@ static void frac128_shrjam(FloatParts128 *a, int c)
     shift128RightJamming(a->frac_hi, a->frac_lo, c, &a->frac_hi, &a->frac_lo);
 }
 
-#define frac_shrjam(A, C)  FRAC_GENERIC_64_128(shrjam, A)(A, C)
+static void frac256_shrjam(FloatParts256 *a, int c)
+{
+    uint64_t a0 = a->frac_hi, a1 = a->frac_hm;
+    uint64_t a2 = a->frac_lm, a3 = a->frac_lo;
+    uint64_t sticky = 0;
+    int invc;
+
+    if (unlikely(c == 0)) {
+        return;
+    } else if (likely(c < 64)) {
+        /* nothing */
+    } else if (likely(c < 256)) {
+        if (unlikely(c & 128)) {
+            sticky |= a2 | a3;
+            a3 = a1, a2 = a0, a1 = 0, a0 = 0;
+        }
+        if (unlikely(c & 64)) {
+            sticky |= a3;
+            a3 = a2, a2 = a1, a1 = a0, a0 = 0;
+        }
+        c &= 63;
+        if (c == 0) {
+            goto done;
+        }
+    } else {
+        sticky = a0 | a1 | a2 | a3;
+        a0 = a1 = a2 = a3 = 0;
+        goto done;
+    }
+
+    invc = -c & 63;
+    sticky |= a3 << invc;
+    a3 = (a3 >> c) | (a2 << invc);
+    a2 = (a2 >> c) | (a1 << invc);
+    a1 = (a1 >> c) | (a0 << invc);
+    a0 = (a0 >> c);
+
+ done:
+    a->frac_lo = a3 | (sticky != 0);
+    a->frac_lm = a2;
+    a->frac_hm = a1;
+    a->frac_hi = a0;
+}
+
+#define frac_shrjam(A, C)  FRAC_GENERIC_64_128_256(shrjam, A)(A, C)
 
 static bool frac64_sub(FloatParts64 *r, FloatParts64 *a, FloatParts64 *b)
 {
@@ -983,7 +1114,17 @@ static bool frac128_sub(FloatParts128 *r, FloatParts128 *a, FloatParts128 *b)
     return c;
 }
 
-#define frac_sub(R, A, B)  FRAC_GENERIC_64_128(sub, R)(R, A, B)
+static bool frac256_sub(FloatParts256 *r, FloatParts256 *a, FloatParts256 *b)
+{
+    bool c = 0;
+    r->frac_lo = usub64_borrow(a->frac_lo, b->frac_lo, &c);
+    r->frac_lm = usub64_borrow(a->frac_lm, b->frac_lm, &c);
+    r->frac_hm = usub64_borrow(a->frac_hm, b->frac_hm, &c);
+    r->frac_hi = usub64_borrow(a->frac_hi, b->frac_hi, &c);
+    return c;
+}
+
+#define frac_sub(R, A, B)  FRAC_GENERIC_64_128_256(sub, R)(R, A, B)
 
 static void frac64_truncjam(FloatParts64 *r, FloatParts128 *a)
 {
@@ -998,6 +1139,22 @@ static void frac128_truncjam(FloatParts128 *r, FloatParts256 *a)
 
 #define frac_truncjam(R, A)  FRAC_GENERIC_64_128(truncjam, R)(R, A)
 
+static void frac64_widen(FloatParts128 *r, FloatParts64 *a)
+{
+    r->frac_hi = a->frac;
+    r->frac_lo = 0;
+}
+
+static void frac128_widen(FloatParts256 *r, FloatParts128 *a)
+{
+    r->frac_hi = a->frac_hi;
+    r->frac_hm = a->frac_lo;
+    r->frac_lm = 0;
+    r->frac_lo = 0;
+}
+
+#define frac_widen(A, B)  FRAC_GENERIC_64_128(widen, B)(A, B)
+
 #define partsN(NAME)   glue(glue(glue(parts,N),_),NAME)
 #define FloatPartsN    glue(FloatParts,N)
 #define FloatPartsW    glue(FloatParts,W)
@@ -1016,6 +1173,12 @@ static void frac128_truncjam(FloatParts128 *r, FloatParts256 *a)
 #include "softfloat-parts-addsub.c.inc"
 #include "softfloat-parts.c.inc"
 
+#undef  N
+#undef  W
+#define N            256
+
+#include "softfloat-parts-addsub.c.inc"
+
 #undef  N
 #undef  W
 #undef  partsN
@@ -1386,230 +1549,48 @@ float128_mul(float128 a, float128 b, float_status *status)
 }
 
 /*
- * Returns the result of multiplying the floating-point values `a' and
- * `b' then adding 'c', with no intermediate rounding step after the
- * multiplication. The operation is performed according to the
- * IEC/IEEE Standard for Binary Floating-Point Arithmetic 754-2008.
- * The flags argument allows the caller to select negation of the
- * addend, the intermediate product, or the final result. (The
- * difference between this and having the caller do a separate
- * negation is that negating externally will flip the sign bit on
- * NaNs.)
+ * Fused multiply-add
  */
 
-static FloatParts64 muladd_floats(FloatParts64 a, FloatParts64 b, FloatParts64 c,
-                                int flags, float_status *s)
-{
-    bool inf_zero, p_sign;
-    bool sign_flip = flags & float_muladd_negate_result;
-    FloatClass p_class;
-    uint64_t hi, lo;
-    int p_exp;
-    int ab_mask, abc_mask;
-
-    ab_mask = float_cmask(a.cls) | float_cmask(b.cls);
-    abc_mask = float_cmask(c.cls) | ab_mask;
-    inf_zero = ab_mask == float_cmask_infzero;
-
-    /* It is implementation-defined whether the cases of (0,inf,qnan)
-     * and (inf,0,qnan) raise InvalidOperation or not (and what QNaN
-     * they return if they do), so we have to hand this information
-     * off to the target-specific pick-a-NaN routine.
-     */
-    if (unlikely(abc_mask & float_cmask_anynan)) {
-        return *parts_pick_nan_muladd(&a, &b, &c, s, ab_mask, abc_mask);
-    }
-
-    if (inf_zero) {
-        float_raise(float_flag_invalid, s);
-        parts_default_nan(&a, s);
-        return a;
-    }
-
-    if (flags & float_muladd_negate_c) {
-        c.sign ^= 1;
-    }
-
-    p_sign = a.sign ^ b.sign;
-
-    if (flags & float_muladd_negate_product) {
-        p_sign ^= 1;
-    }
-
-    if (ab_mask & float_cmask_inf) {
-        p_class = float_class_inf;
-    } else if (ab_mask & float_cmask_zero) {
-        p_class = float_class_zero;
-    } else {
-        p_class = float_class_normal;
-    }
-
-    if (c.cls == float_class_inf) {
-        if (p_class == float_class_inf && p_sign != c.sign) {
-            float_raise(float_flag_invalid, s);
-            parts_default_nan(&c, s);
-        } else {
-            c.sign ^= sign_flip;
-        }
-        return c;
-    }
-
-    if (p_class == float_class_inf) {
-        a.cls = float_class_inf;
-        a.sign = p_sign ^ sign_flip;
-        return a;
-    }
-
-    if (p_class == float_class_zero) {
-        if (c.cls == float_class_zero) {
-            if (p_sign != c.sign) {
-                p_sign = s->float_rounding_mode == float_round_down;
-            }
-            c.sign = p_sign;
-        } else if (flags & float_muladd_halve_result) {
-            c.exp -= 1;
-        }
-        c.sign ^= sign_flip;
-        return c;
-    }
-
-    /* a & b should be normals now... */
-    assert(a.cls == float_class_normal &&
-           b.cls == float_class_normal);
-
-    p_exp = a.exp + b.exp;
-
-    mul64To128(a.frac, b.frac, &hi, &lo);
-
-    /* Renormalize to the msb. */
-    if (hi & DECOMPOSED_IMPLICIT_BIT) {
-        p_exp += 1;
-    } else {
-        shortShift128Left(hi, lo, 1, &hi, &lo);
-    }
-
-    /* + add/sub */
-    if (c.cls != float_class_zero) {
-        int exp_diff = p_exp - c.exp;
-        if (p_sign == c.sign) {
-            /* Addition */
-            if (exp_diff <= 0) {
-                shift64RightJamming(hi, -exp_diff, &hi);
-                p_exp = c.exp;
-                if (uadd64_overflow(hi, c.frac, &hi)) {
-                    shift64RightJamming(hi, 1, &hi);
-                    hi |= DECOMPOSED_IMPLICIT_BIT;
-                    p_exp += 1;
-                }
-            } else {
-                uint64_t c_hi, c_lo, over;
-                shift128RightJamming(c.frac, 0, exp_diff, &c_hi, &c_lo);
-                add192(0, hi, lo, 0, c_hi, c_lo, &over, &hi, &lo);
-                if (over) {
-                    shift64RightJamming(hi, 1, &hi);
-                    hi |= DECOMPOSED_IMPLICIT_BIT;
-                    p_exp += 1;
-                }
-            }
-        } else {
-            /* Subtraction */
-            uint64_t c_hi = c.frac, c_lo = 0;
-
-            if (exp_diff <= 0) {
-                shift128RightJamming(hi, lo, -exp_diff, &hi, &lo);
-                if (exp_diff == 0
-                    &&
-                    (hi > c_hi || (hi == c_hi && lo >= c_lo))) {
-                    sub128(hi, lo, c_hi, c_lo, &hi, &lo);
-                } else {
-                    sub128(c_hi, c_lo, hi, lo, &hi, &lo);
-                    p_sign ^= 1;
-                    p_exp = c.exp;
-                }
-            } else {
-                shift128RightJamming(c_hi, c_lo,
-                                     exp_diff,
-                                     &c_hi, &c_lo);
-                sub128(hi, lo, c_hi, c_lo, &hi, &lo);
-            }
-
-            if (hi == 0 && lo == 0) {
-                a.cls = float_class_zero;
-                a.sign = s->float_rounding_mode == float_round_down;
-                a.sign ^= sign_flip;
-                return a;
-            } else {
-                int shift;
-                if (hi != 0) {
-                    shift = clz64(hi);
-                } else {
-                    shift = clz64(lo) + 64;
-                }
-                /* Normalizing to a binary point of 124 is the
-                   correct adjust for the exponent.  However since we're
-                   shifting, we might as well put the binary point back
-                   at 63 where we really want it.  Therefore shift as
-                   if we're leaving 1 bit at the top of the word, but
-                   adjust the exponent as if we're leaving 3 bits.  */
-                shift128Left(hi, lo, shift, &hi, &lo);
-                p_exp -= shift;
-            }
-        }
-    }
-    hi |= (lo != 0);
-
-    if (flags & float_muladd_halve_result) {
-        p_exp -= 1;
-    }
-
-    /* finally prepare our result */
-    a.cls = float_class_normal;
-    a.sign = p_sign ^ sign_flip;
-    a.exp = p_exp;
-    a.frac = hi;
-
-    return a;
-}
-
 float16 QEMU_FLATTEN float16_muladd(float16 a, float16 b, float16 c,
-                                                int flags, float_status *status)
+                                    int flags, float_status *status)
 {
-    FloatParts64 pa, pb, pc, pr;
+    FloatParts64 pa, pb, pc, *pr;
 
     float16_unpack_canonical(&pa, a, status);
     float16_unpack_canonical(&pb, b, status);
     float16_unpack_canonical(&pc, c, status);
-    pr = muladd_floats(pa, pb, pc, flags, status);
+    pr = parts_muladd(&pa, &pb, &pc, flags, status);
 
-    return float16_round_pack_canonical(&pr, status);
+    return float16_round_pack_canonical(pr, status);
 }
 
 static float32 QEMU_SOFTFLOAT_ATTR
 soft_f32_muladd(float32 a, float32 b, float32 c, int flags,
                 float_status *status)
 {
-    FloatParts64 pa, pb, pc, pr;
+    FloatParts64 pa, pb, pc, *pr;
 
     float32_unpack_canonical(&pa, a, status);
     float32_unpack_canonical(&pb, b, status);
     float32_unpack_canonical(&pc, c, status);
-    pr = muladd_floats(pa, pb, pc, flags, status);
+    pr = parts_muladd(&pa, &pb, &pc, flags, status);
 
-    return float32_round_pack_canonical(&pr, status);
+    return float32_round_pack_canonical(pr, status);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_f64_muladd(float64 a, float64 b, float64 c, int flags,
                 float_status *status)
 {
-    FloatParts64 pa, pb, pc, pr;
+    FloatParts64 pa, pb, pc, *pr;
 
     float64_unpack_canonical(&pa, a, status);
     float64_unpack_canonical(&pb, b, status);
     float64_unpack_canonical(&pc, c, status);
-    pr = muladd_floats(pa, pb, pc, flags, status);
+    pr = parts_muladd(&pa, &pb, &pc, flags, status);
 
-    return float64_round_pack_canonical(&pr, status);
+    return float64_round_pack_canonical(pr, status);
 }
 
 static bool force_soft_fma;
@@ -1756,23 +1737,30 @@ float64_muladd(float64 xa, float64 xb, float64 xc, int flags, float_status *s)
     return soft_f64_muladd(ua.s, ub.s, uc.s, flags, s);
 }
 
-/*
- * Returns the result of multiplying the bfloat16 values `a'
- * and `b' then adding 'c', with no intermediate rounding step after the
- * multiplication.
- */
-
 bfloat16 QEMU_FLATTEN bfloat16_muladd(bfloat16 a, bfloat16 b, bfloat16 c,
                                       int flags, float_status *status)
 {
-    FloatParts64 pa, pb, pc, pr;
+    FloatParts64 pa, pb, pc, *pr;
 
     bfloat16_unpack_canonical(&pa, a, status);
     bfloat16_unpack_canonical(&pb, b, status);
     bfloat16_unpack_canonical(&pc, c, status);
-    pr = muladd_floats(pa, pb, pc, flags, status);
+    pr = parts_muladd(&pa, &pb, &pc, flags, status);
 
-    return bfloat16_round_pack_canonical(&pr, status);
+    return bfloat16_round_pack_canonical(pr, status);
+}
+
+float128 QEMU_FLATTEN float128_muladd(float128 a, float128 b, float128 c,
+                                      int flags, float_status *status)
+{
+    FloatParts128 pa, pb, pc, *pr;
+
+    float128_unpack_canonical(&pa, a, status);
+    float128_unpack_canonical(&pb, b, status);
+    float128_unpack_canonical(&pc, c, status);
+    pr = parts_muladd(&pa, &pb, &pc, flags, status);
+
+    return float128_round_pack_canonical(pr, status);
 }
 
 /*
diff --git a/tests/fp/fp-bench.c b/tests/fp/fp-bench.c
index d319993280..c24baf8535 100644
--- a/tests/fp/fp-bench.c
+++ b/tests/fp/fp-bench.c
@@ -386,7 +386,7 @@ static void bench(enum precision prec, enum op op, int n_ops, bool no_neg)
             for (i = 0; i < OPS_PER_ITER; i++) {
                 float128 a = ops[0].f128;
                 float128 b = ops[1].f128;
-                /* float128 c = ops[2].f128; */
+                float128 c = ops[2].f128;
 
                 switch (op) {
                 case OP_ADD:
@@ -401,9 +401,9 @@ static void bench(enum precision prec, enum op op, int n_ops, bool no_neg)
                 case OP_DIV:
                     res.f128 = float128_div(a, b, &soft_status);
                     break;
-                /* case OP_FMA: */
-                /*     res.f128 = float128_muladd(a, b, c, 0, &soft_status); */
-                /*     break; */
+                case OP_FMA:
+                    res.f128 = float128_muladd(a, b, c, 0, &soft_status);
+                    break;
                 case OP_SQRT:
                     res.f128 = float128_sqrt(a, &soft_status);
                     break;
diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 5a4cad8c8b..ff131afbde 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -717,7 +717,7 @@ static void do_testfloat(int op, int rmode, bool exact)
         test_abz_f128(true_abz_f128M, subj_abz_f128M);
         break;
     case F128_MULADD:
-        not_implemented();
+        test_abcz_f128(slow_f128M_mulAdd, qemu_f128M_mulAdd);
         break;
     case F128_SQRT:
         test_az_f128(slow_f128M_sqrt, qemu_f128M_sqrt);
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 9a67ab2bea..a203811299 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -413,3 +413,129 @@ static FloatPartsN *partsN(mul)(FloatPartsN *a, FloatPartsN *b,
     a->sign = sign;
     return a;
 }
+
+/*
+ * Returns the result of multiplying the floating-point values `a' and
+ * `b' then adding 'c', with no intermediate rounding step after the
+ * multiplication. The operation is performed according to the
+ * IEC/IEEE Standard for Binary Floating-Point Arithmetic 754-2008.
+ * The flags argument allows the caller to select negation of the
+ * addend, the intermediate product, or the final result. (The
+ * difference between this and having the caller do a separate
+ * negation is that negating externally will flip the sign bit on NaNs.)
+ *
+ * Requires A and C extracted into a double-sized structure to provide the
+ * extra space for the widening multiply.
+ */
+static FloatPartsN *partsN(muladd)(FloatPartsN *a, FloatPartsN *b,
+                                   FloatPartsN *c, int flags, float_status *s)
+{
+    int ab_mask, abc_mask;
+    FloatPartsW p_widen, c_widen;
+
+    ab_mask = float_cmask(a->cls) | float_cmask(b->cls);
+    abc_mask = float_cmask(c->cls) | ab_mask;
+
+    /*
+     * It is implementation-defined whether the cases of (0,inf,qnan)
+     * and (inf,0,qnan) raise InvalidOperation or not (and what QNaN
+     * they return if they do), so we have to hand this information
+     * off to the target-specific pick-a-NaN routine.
+     */
+    if (unlikely(abc_mask & float_cmask_anynan)) {
+        return parts_pick_nan_muladd(a, b, c, s, ab_mask, abc_mask);
+    }
+
+    if (flags & float_muladd_negate_c) {
+        c->sign ^= 1;
+    }
+
+    /* Compute the sign of the product into A. */
+    a->sign ^= b->sign;
+    if (flags & float_muladd_negate_product) {
+        a->sign ^= 1;
+    }
+
+    if (unlikely(ab_mask != float_cmask_normal)) {
+        if (unlikely(ab_mask == float_cmask_infzero)) {
+            goto d_nan;
+        }
+
+        if (ab_mask & float_cmask_inf) {
+            if (c->cls == float_class_inf && a->sign != c->sign) {
+                goto d_nan;
+            }
+            goto return_inf;
+        }
+
+        g_assert(ab_mask & float_cmask_zero);
+        if (c->cls == float_class_normal) {
+            *a = *c;
+            goto return_normal;
+        }
+        if (c->cls == float_class_zero) {
+            if (a->sign != c->sign) {
+                goto return_sub_zero;
+            }
+            goto return_zero;
+        }
+        g_assert(c->cls == float_class_inf);
+    }
+
+    if (unlikely(c->cls == float_class_inf)) {
+        a->sign = c->sign;
+        goto return_inf;
+    }
+
+    /* Perform the multiplication step. */
+    p_widen.sign = a->sign;
+    p_widen.exp = a->exp + b->exp + 1;
+    frac_mulw(&p_widen, a, b);
+    if (!(p_widen.frac_hi & DECOMPOSED_IMPLICIT_BIT)) {
+        frac_add(&p_widen, &p_widen, &p_widen);
+        p_widen.exp -= 1;
+    }
+
+    /* Perform the addition step. */
+    if (c->cls != float_class_zero) {
+        /* Zero-extend C to less significant bits. */
+        frac_widen(&c_widen, c);
+        c_widen.exp = c->exp;
+
+        if (a->sign == c->sign) {
+            parts_add_normal(&p_widen, &c_widen);
+        } else if (!parts_sub_normal(&p_widen, &c_widen)) {
+            goto return_sub_zero;
+        }
+    }
+
+    /* Narrow with sticky bit, for proper rounding later. */
+    frac_truncjam(a, &p_widen);
+    a->sign = p_widen.sign;
+    a->exp = p_widen.exp;
+
+ return_normal:
+    if (flags & float_muladd_halve_result) {
+        a->exp -= 1;
+    }
+ finish_sign:
+    if (flags & float_muladd_negate_result) {
+        a->sign ^= 1;
+    }
+    return a;
+
+ return_sub_zero:
+    a->sign = s->float_rounding_mode == float_round_down;
+ return_zero:
+    a->cls = float_class_zero;
+    goto finish_sign;
+
+ return_inf:
+    a->cls = float_class_inf;
+    goto finish_sign;
+
+ d_nan:
+    float_raise(float_flag_invalid, s);
+    parts_default_nan(a, s);
+    return a;
+}
diff --git a/tests/fp/wrap.c.inc b/tests/fp/wrap.c.inc
index 0cbd20013e..cb1bb77e4c 100644
--- a/tests/fp/wrap.c.inc
+++ b/tests/fp/wrap.c.inc
@@ -574,6 +574,18 @@ WRAP_MULADD(qemu_f32_mulAdd, float32_muladd, float32)
 WRAP_MULADD(qemu_f64_mulAdd, float64_muladd, float64)
 #undef WRAP_MULADD
 
+static void qemu_f128M_mulAdd(const float128_t *ap, const float128_t *bp,
+                              const float128_t *cp, float128_t *res)
+{
+    float128 a, b, c, ret;
+
+    a = soft_to_qemu128(*ap);
+    b = soft_to_qemu128(*bp);
+    c = soft_to_qemu128(*cp);
+    ret = float128_muladd(a, b, c, 0, &qsf);
+    *res = qemu_to_soft128(ret);
+}
+
 #define WRAP_CMP16(name, func, retcond)         \
     static bool name(float16_t a, float16_t b)  \
     {                                           \
-- 
2.25.1


