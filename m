Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFF1381EF7
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:02:37 +0200 (CEST)
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGPk-00067g-TW
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzb-0007ob-7A
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:35 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:46936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz4-0007py-Au
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:33 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id w9so1838168qvi.13
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=03NFfJfR7Va9A6BPX7jobDuhZ8M2HBF6CsoZelx5Mi8=;
 b=DYB9qGURHaFUSEafxrK3dmIgMfwUXeMZF/XPWxuPWkealeBMSEsGcnC/7QnHvIumrS
 nGZwWDi+BjQm/xfjf10Idj+eZ7D0XSL2XdelfsmcqbwLjOfvsm2NOFI6SkseFeJglHf2
 eGM78UjGH6LxndVCSIChGCtUqaHrEUAXqO3WopdqfKsbauk74vVHl8WwEGVCVrBGh2V5
 Upu34TrFl8rdL0WQjGBK7wQTHY0efu8OP2eIvJzyMqcDdTrBd1DGBlsHkWH8NQFFw5lZ
 5fbWJxMypvCXamsv62NCpKpSCXpOk/OOr8FogRq+oY6cDHFhVeSdwTdxDYa0i3fkmB4p
 N9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=03NFfJfR7Va9A6BPX7jobDuhZ8M2HBF6CsoZelx5Mi8=;
 b=I5toYKWC8ZwUKi2RTQ80vvWGGJXEvUS0oyBp2u2FlTu7D3h5xO7q4UGqKzaXmuwztw
 a6+GdAC9HzSN4xnynD8WiErXUuuls+av9ExBlp5x03NdosApi9DTqWKGcagB8+V9FakG
 JpC16JMNvAT78Jo6izP66Xzh0uWHDzH5IIBrlI7K3ldXj73F6UQvFuvMb0qUucrwAjl1
 hbyT7Vr9PLCRCpO+p9BXdP6jQquSc3E1EyxiRwRfAK0SZ3BQBcjgBnPvJP1zhZ2KJfzu
 QtJdGkWk+bSNGRaeN1X7SPAUrGCOYXpAZNqd9kt6CnEZU76SVdCs0YSIvU0yUBFUx+of
 Dfhw==
X-Gm-Message-State: AOAM531ZMvCj7epz388l6e8TKNmbq7P28Skg/jz6f0qV7r7Ai8gyyOf9
 wCxs9RqXhxrsb4Gha+vLHe4JfpXjZsqNq1fLlEA=
X-Google-Smtp-Source: ABdhPJytyCF7zWjEXGCv1Gsg6w0GbqwGpe5Fu/QdEEJasQA+OYG+E8ndl+rTaNysIktu9GSqDgqjUQ==
X-Received: by 2002:a05:6214:d84:: with SMTP id
 e4mr54820942qve.48.1621168500728; 
 Sun, 16 May 2021 05:35:00 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:35:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/46] softfloat: Move addsub_floats to softfloat-parts.c.inc
Date: Sun, 16 May 2021 07:34:19 -0500
Message-Id: <20210516123431.718318-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for implementing multiple sizes.  Rename to parts_addsub,
split out parts_add/sub_normal for future reuse with muladd.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c                  | 253 ++++++++++++++-----------------
 fpu/softfloat-parts-addsub.c.inc |  62 ++++++++
 fpu/softfloat-parts.c.inc        |  81 ++++++++++
 3 files changed, 255 insertions(+), 141 deletions(-)
 create mode 100644 fpu/softfloat-parts-addsub.c.inc

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 817a91de85..afeef00097 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -749,6 +749,26 @@ static void parts128_uncanon(FloatParts128 *p, float_status *status,
 #define parts_uncanon(A, S, F) \
     PARTS_GENERIC_64_128(uncanon, A)(A, S, F)
 
+static void parts64_add_normal(FloatParts64 *a, FloatParts64 *b);
+static void parts128_add_normal(FloatParts128 *a, FloatParts128 *b);
+
+#define parts_add_normal(A, B) \
+    PARTS_GENERIC_64_128(add_normal, A)(A, B)
+
+static bool parts64_sub_normal(FloatParts64 *a, FloatParts64 *b);
+static bool parts128_sub_normal(FloatParts128 *a, FloatParts128 *b);
+
+#define parts_sub_normal(A, B) \
+    PARTS_GENERIC_64_128(sub_normal, A)(A, B)
+
+static FloatParts64 *parts64_addsub(FloatParts64 *a, FloatParts64 *b,
+                                    float_status *s, bool subtract);
+static FloatParts128 *parts128_addsub(FloatParts128 *a, FloatParts128 *b,
+                                      float_status *s, bool subtract);
+
+#define parts_addsub(A, B, S, Z) \
+    PARTS_GENERIC_64_128(addsub, A)(A, B, S, Z)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -756,6 +776,21 @@ static void parts128_uncanon(FloatParts128 *p, float_status *status,
 #define FRAC_GENERIC_64_128(NAME, P) \
     QEMU_GENERIC(P, (FloatParts128 *, frac128_##NAME), frac64_##NAME)
 
+static bool frac64_add(FloatParts64 *r, FloatParts64 *a, FloatParts64 *b)
+{
+    return uadd64_overflow(a->frac, b->frac, &r->frac);
+}
+
+static bool frac128_add(FloatParts128 *r, FloatParts128 *a, FloatParts128 *b)
+{
+    bool c = 0;
+    r->frac_lo = uadd64_carry(a->frac_lo, b->frac_lo, &c);
+    r->frac_hi = uadd64_carry(a->frac_hi, b->frac_hi, &c);
+    return c;
+}
+
+#define frac_add(R, A, B)  FRAC_GENERIC_64_128(add, R)(R, A, B)
+
 static bool frac64_addi(FloatParts64 *r, FloatParts64 *a, uint64_t c)
 {
     return uadd64_overflow(a->frac, c, &r->frac);
@@ -824,6 +859,20 @@ static bool frac128_eqz(FloatParts128 *a)
 
 #define frac_eqz(A)  FRAC_GENERIC_64_128(eqz, A)(A)
 
+static void frac64_neg(FloatParts64 *a)
+{
+    a->frac = -a->frac;
+}
+
+static void frac128_neg(FloatParts128 *a)
+{
+    bool c = 0;
+    a->frac_lo = usub64_borrow(0, a->frac_lo, &c);
+    a->frac_hi = usub64_borrow(0, a->frac_hi, &c);
+}
+
+#define frac_neg(A)  FRAC_GENERIC_64_128(neg, A)(A)
+
 static int frac64_normalize(FloatParts64 *a)
 {
     if (a->frac) {
@@ -891,18 +940,36 @@ static void frac128_shrjam(FloatParts128 *a, int c)
 
 #define frac_shrjam(A, C)  FRAC_GENERIC_64_128(shrjam, A)(A, C)
 
-#define partsN(NAME)   parts64_##NAME
-#define FloatPartsN    FloatParts64
+static bool frac64_sub(FloatParts64 *r, FloatParts64 *a, FloatParts64 *b)
+{
+    return usub64_overflow(a->frac, b->frac, &r->frac);
+}
 
+static bool frac128_sub(FloatParts128 *r, FloatParts128 *a, FloatParts128 *b)
+{
+    bool c = 0;
+    r->frac_lo = usub64_borrow(a->frac_lo, b->frac_lo, &c);
+    r->frac_hi = usub64_borrow(a->frac_hi, b->frac_hi, &c);
+    return c;
+}
+
+#define frac_sub(R, A, B)  FRAC_GENERIC_64_128(sub, R)(R, A, B)
+
+#define partsN(NAME)   glue(glue(glue(parts,N),_),NAME)
+#define FloatPartsN    glue(FloatParts,N)
+
+#define N 64
+
+#include "softfloat-parts-addsub.c.inc"
 #include "softfloat-parts.c.inc"
 
-#undef  partsN
-#undef  FloatPartsN
-#define partsN(NAME)   parts128_##NAME
-#define FloatPartsN    FloatParts128
+#undef  N
+#define N 128
 
+#include "softfloat-parts-addsub.c.inc"
 #include "softfloat-parts.c.inc"
 
+#undef  N
 #undef  partsN
 #undef  FloatPartsN
 
@@ -980,165 +1047,73 @@ static float64 float64_round_pack_canonical(FloatParts64 *p,
 }
 
 /*
- * Returns the result of adding or subtracting the values of the
- * floating-point values `a' and `b'. The operation is performed
- * according to the IEC/IEEE Standard for Binary Floating-Point
- * Arithmetic.
+ * Addition and subtraction
  */
 
-static FloatParts64 addsub_floats(FloatParts64 a, FloatParts64 b, bool subtract,
-                                float_status *s)
+static float16 QEMU_FLATTEN
+float16_addsub(float16 a, float16 b, float_status *status, bool subtract)
 {
-    bool a_sign = a.sign;
-    bool b_sign = b.sign ^ subtract;
-
-    if (a_sign != b_sign) {
-        /* Subtraction */
-
-        if (a.cls == float_class_normal && b.cls == float_class_normal) {
-            if (a.exp > b.exp || (a.exp == b.exp && a.frac >= b.frac)) {
-                shift64RightJamming(b.frac, a.exp - b.exp, &b.frac);
-                a.frac = a.frac - b.frac;
-            } else {
-                shift64RightJamming(a.frac, b.exp - a.exp, &a.frac);
-                a.frac = b.frac - a.frac;
-                a.exp = b.exp;
-                a_sign ^= 1;
-            }
-
-            if (a.frac == 0) {
-                a.cls = float_class_zero;
-                a.sign = s->float_rounding_mode == float_round_down;
-            } else {
-                int shift = clz64(a.frac);
-                a.frac = a.frac << shift;
-                a.exp = a.exp - shift;
-                a.sign = a_sign;
-            }
-            return a;
-        }
-        if (is_nan(a.cls) || is_nan(b.cls)) {
-            return *parts_pick_nan(&a, &b, s);
-        }
-        if (a.cls == float_class_inf) {
-            if (b.cls == float_class_inf) {
-                float_raise(float_flag_invalid, s);
-                parts_default_nan(&a, s);
-            }
-            return a;
-        }
-        if (a.cls == float_class_zero && b.cls == float_class_zero) {
-            a.sign = s->float_rounding_mode == float_round_down;
-            return a;
-        }
-        if (a.cls == float_class_zero || b.cls == float_class_inf) {
-            b.sign = a_sign ^ 1;
-            return b;
-        }
-        if (b.cls == float_class_zero) {
-            return a;
-        }
-    } else {
-        /* Addition */
-        if (a.cls == float_class_normal && b.cls == float_class_normal) {
-            if (a.exp > b.exp) {
-                shift64RightJamming(b.frac, a.exp - b.exp, &b.frac);
-            } else if (a.exp < b.exp) {
-                shift64RightJamming(a.frac, b.exp - a.exp, &a.frac);
-                a.exp = b.exp;
-            }
-
-            if (uadd64_overflow(a.frac, b.frac, &a.frac)) {
-                shift64RightJamming(a.frac, 1, &a.frac);
-                a.frac |= DECOMPOSED_IMPLICIT_BIT;
-                a.exp += 1;
-            }
-            return a;
-        }
-        if (is_nan(a.cls) || is_nan(b.cls)) {
-            return *parts_pick_nan(&a, &b, s);
-        }
-        if (a.cls == float_class_inf || b.cls == float_class_zero) {
-            return a;
-        }
-        if (b.cls == float_class_inf || a.cls == float_class_zero) {
-            b.sign = b_sign;
-            return b;
-        }
-    }
-    g_assert_not_reached();
-}
-
-/*
- * Returns the result of adding or subtracting the floating-point
- * values `a' and `b'. The operation is performed according to the
- * IEC/IEEE Standard for Binary Floating-Point Arithmetic.
- */
-
-float16 QEMU_FLATTEN float16_add(float16 a, float16 b, float_status *status)
-{
-    FloatParts64 pa, pb, pr;
+    FloatParts64 pa, pb, *pr;
 
     float16_unpack_canonical(&pa, a, status);
     float16_unpack_canonical(&pb, b, status);
-    pr = addsub_floats(pa, pb, false, status);
+    pr = parts_addsub(&pa, &pb, status, subtract);
 
-    return float16_round_pack_canonical(&pr, status);
+    return float16_round_pack_canonical(pr, status);
 }
 
-float16 QEMU_FLATTEN float16_sub(float16 a, float16 b, float_status *status)
+float16 float16_add(float16 a, float16 b, float_status *status)
 {
-    FloatParts64 pa, pb, pr;
+    return float16_addsub(a, b, status, false);
+}
 
-    float16_unpack_canonical(&pa, a, status);
-    float16_unpack_canonical(&pb, b, status);
-    pr = addsub_floats(pa, pb, true, status);
-
-    return float16_round_pack_canonical(&pr, status);
+float16 float16_sub(float16 a, float16 b, float_status *status)
+{
+    return float16_addsub(a, b, status, true);
 }
 
 static float32 QEMU_SOFTFLOAT_ATTR
-soft_f32_addsub(float32 a, float32 b, bool subtract, float_status *status)
+soft_f32_addsub(float32 a, float32 b, float_status *status, bool subtract)
 {
-    FloatParts64 pa, pb, pr;
+    FloatParts64 pa, pb, *pr;
 
     float32_unpack_canonical(&pa, a, status);
     float32_unpack_canonical(&pb, b, status);
-    pr = addsub_floats(pa, pb, subtract, status);
+    pr = parts_addsub(&pa, &pb, status, subtract);
 
-    return float32_round_pack_canonical(&pr, status);
+    return float32_round_pack_canonical(pr, status);
 }
 
-static inline float32 soft_f32_add(float32 a, float32 b, float_status *status)
+static float32 soft_f32_add(float32 a, float32 b, float_status *status)
 {
-    return soft_f32_addsub(a, b, false, status);
+    return soft_f32_addsub(a, b, status, false);
 }
 
-static inline float32 soft_f32_sub(float32 a, float32 b, float_status *status)
+static float32 soft_f32_sub(float32 a, float32 b, float_status *status)
 {
-    return soft_f32_addsub(a, b, true, status);
+    return soft_f32_addsub(a, b, status, true);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
-soft_f64_addsub(float64 a, float64 b, bool subtract, float_status *status)
+soft_f64_addsub(float64 a, float64 b, float_status *status, bool subtract)
 {
-    FloatParts64 pa, pb, pr;
+    FloatParts64 pa, pb, *pr;
 
     float64_unpack_canonical(&pa, a, status);
     float64_unpack_canonical(&pb, b, status);
-    pr = addsub_floats(pa, pb, subtract, status);
+    pr = parts_addsub(&pa, &pb, status, subtract);
 
-    return float64_round_pack_canonical(&pr, status);
+    return float64_round_pack_canonical(pr, status);
 }
 
-static inline float64 soft_f64_add(float64 a, float64 b, float_status *status)
+static float64 soft_f64_add(float64 a, float64 b, float_status *status)
 {
-    return soft_f64_addsub(a, b, false, status);
+    return soft_f64_addsub(a, b, status, false);
 }
 
-static inline float64 soft_f64_sub(float64 a, float64 b, float_status *status)
+static float64 soft_f64_sub(float64 a, float64 b, float_status *status)
 {
-    return soft_f64_addsub(a, b, true, status);
+    return soft_f64_addsub(a, b, status, true);
 }
 
 static float hard_f32_add(float a, float b)
@@ -1216,30 +1191,26 @@ float64_sub(float64 a, float64 b, float_status *s)
     return float64_addsub(a, b, s, hard_f64_sub, soft_f64_sub);
 }
 
-/*
- * Returns the result of adding or subtracting the bfloat16
- * values `a' and `b'.
- */
-bfloat16 QEMU_FLATTEN bfloat16_add(bfloat16 a, bfloat16 b, float_status *status)
+static bfloat16 QEMU_FLATTEN
+bfloat16_addsub(bfloat16 a, bfloat16 b, float_status *status, bool subtract)
 {
-    FloatParts64 pa, pb, pr;
+    FloatParts64 pa, pb, *pr;
 
     bfloat16_unpack_canonical(&pa, a, status);
     bfloat16_unpack_canonical(&pb, b, status);
-    pr = addsub_floats(pa, pb, false, status);
+    pr = parts_addsub(&pa, &pb, status, subtract);
 
-    return bfloat16_round_pack_canonical(&pr, status);
+    return bfloat16_round_pack_canonical(pr, status);
 }
 
-bfloat16 QEMU_FLATTEN bfloat16_sub(bfloat16 a, bfloat16 b, float_status *status)
+bfloat16 bfloat16_add(bfloat16 a, bfloat16 b, float_status *status)
 {
-    FloatParts64 pa, pb, pr;
+    return bfloat16_addsub(a, b, status, false);
+}
 
-    bfloat16_unpack_canonical(&pa, a, status);
-    bfloat16_unpack_canonical(&pb, b, status);
-    pr = addsub_floats(pa, pb, true, status);
-
-    return bfloat16_round_pack_canonical(&pr, status);
+bfloat16 bfloat16_sub(bfloat16 a, bfloat16 b, float_status *status)
+{
+    return bfloat16_addsub(a, b, status, true);
 }
 
 /*
diff --git a/fpu/softfloat-parts-addsub.c.inc b/fpu/softfloat-parts-addsub.c.inc
new file mode 100644
index 0000000000..ae5c1017c5
--- /dev/null
+++ b/fpu/softfloat-parts-addsub.c.inc
@@ -0,0 +1,62 @@
+/*
+ * Floating point arithmetic implementation
+ *
+ * The code in this source file is derived from release 2a of the SoftFloat
+ * IEC/IEEE Floating-point Arithmetic Package. Those parts of the code (and
+ * some later contributions) are provided under that license, as detailed below.
+ * It has subsequently been modified by contributors to the QEMU Project,
+ * so some portions are provided under:
+ *  the SoftFloat-2a license
+ *  the BSD license
+ *  GPL-v2-or-later
+ *
+ * Any future contributions to this file after December 1st 2014 will be
+ * taken to be licensed under the Softfloat-2a license unless specifically
+ * indicated otherwise.
+ */
+
+static void partsN(add_normal)(FloatPartsN *a, FloatPartsN *b)
+{
+    int exp_diff = a->exp - b->exp;
+
+    if (exp_diff > 0) {
+        frac_shrjam(b, exp_diff);
+    } else if (exp_diff < 0) {
+        frac_shrjam(a, -exp_diff);
+        a->exp = b->exp;
+    }
+
+    if (frac_add(a, a, b)) {
+        frac_shrjam(a, 1);
+        a->frac_hi |= DECOMPOSED_IMPLICIT_BIT;
+        a->exp += 1;
+    }
+}
+
+static bool partsN(sub_normal)(FloatPartsN *a, FloatPartsN *b)
+{
+    int exp_diff = a->exp - b->exp;
+    int shift;
+
+    if (exp_diff > 0) {
+        frac_shrjam(b, exp_diff);
+        frac_sub(a, a, b);
+    } else if (exp_diff < 0) {
+        a->exp = b->exp;
+        a->sign ^= 1;
+        frac_shrjam(a, -exp_diff);
+        frac_sub(a, b, a);
+    } else if (frac_sub(a, a, b)) {
+        /* Overflow means that A was less than B. */
+        frac_neg(a);
+        a->sign ^= 1;
+    }
+
+    shift = frac_normalize(a);
+    if (likely(shift < N)) {
+        a->exp -= shift;
+	return true;
+    }
+    a->cls = float_class_zero;
+    return false;
+}
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index efdc724770..cfce9f6421 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -281,3 +281,84 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
     p->exp = exp;
     float_raise(flags, s);
 }
+
+/*
+ * Returns the result of adding or subtracting the values of the
+ * floating-point values `a' and `b'. The operation is performed
+ * according to the IEC/IEEE Standard for Binary Floating-Point
+ * Arithmetic.
+ */
+static FloatPartsN *partsN(addsub)(FloatPartsN *a, FloatPartsN *b,
+                                   float_status *s, bool subtract)
+{
+    bool b_sign = b->sign ^ subtract;
+    int ab_mask = float_cmask(a->cls) | float_cmask(b->cls);
+
+    if (a->sign != b_sign) {
+        /* Subtraction */
+        if (likely(ab_mask == float_cmask_normal)) {
+            if (parts_sub_normal(a, b)) {
+                return a;
+            }
+            /* Subtract was exact, fall through to set sign. */
+            ab_mask = float_cmask_zero;
+        }
+
+        if (ab_mask == float_cmask_zero) {
+            a->sign = s->float_rounding_mode == float_round_down;
+            return a;
+        }
+
+        if (unlikely(ab_mask & float_cmask_anynan)) {
+            goto p_nan;
+        }
+
+        if (ab_mask & float_cmask_inf) {
+            if (a->cls != float_class_inf) {
+                /* N - Inf */
+                goto return_b;
+            }
+            if (b->cls != float_class_inf) {
+                /* Inf - N */
+                return a;
+            }
+            /* Inf - Inf */
+            float_raise(float_flag_invalid, s);
+            parts_default_nan(a, s);
+            return a;
+        }
+    } else {
+        /* Addition */
+        if (likely(ab_mask == float_cmask_normal)) {
+            parts_add_normal(a, b);
+            return a;
+        }
+
+        if (ab_mask == float_cmask_zero) {
+            return a;
+        }
+
+        if (unlikely(ab_mask & float_cmask_anynan)) {
+            goto p_nan;
+        }
+
+        if (ab_mask & float_cmask_inf) {
+            a->cls = float_class_inf;
+            return a;
+        }
+    }
+
+    if (b->cls == float_class_zero) {
+        g_assert(a->cls == float_class_normal);
+        return a;
+    }
+
+    g_assert(a->cls == float_class_zero);
+    g_assert(b->cls == float_class_normal);
+ return_b:
+    b->sign = b_sign;
+    return b;
+
+ p_nan:
+    return parts_pick_nan(a, b, s);
+}
-- 
2.25.1


