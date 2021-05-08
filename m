Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E59376EE4
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:41:29 +0200 (CEST)
Received: from localhost ([::1]:49892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCuG-0002OW-Uk
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8S-0003YA-C5
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:52:04 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8F-0005bT-5E
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:52:04 -0400
Received: by mail-pg1-x535.google.com with SMTP id d29so8636759pgd.4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HKpES++YzydctcZZ/K52SO5JvpywviZhDsWevoMxn68=;
 b=dhbsNS2pnUX+XkgIxVOtkVOcYTqsAfl19HlAuHSweUEzo4iEhXW80iETDALkH1ppFG
 vVSo8ZBzmfzA98wcjn80c2KEMy65Zx5iOkbqcTdoMhPpeROLGLrqdRXqUUuWCdbcSREw
 PwhmlCtTyKLTOIKvwCdTViGbgSa2Bt2MTY+yGe44tJflm1SQZTzpnGJMkfEIZuQf/3L3
 a/Lul1riH/MAcICyogAi+r5ZKvlRtnfumvmCXHEVncpc+Idh7sZ0hIIx01RFRMsXyioj
 k0vRFkq/9Aci8x360cdIYE0EQhxFTWK0nQ656jH66vZMza4w0YMDxZl2QdyDv6O+amEo
 SgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HKpES++YzydctcZZ/K52SO5JvpywviZhDsWevoMxn68=;
 b=nQ85beENOLuH/cd4ZcCM1fOp2RD944UoEICnLKtZ0DKbgeQj3B/LsgmQ3iu9nXD37c
 1wykb71krO5ePsguPpJTbqXe3iKYc27GtlTUmT1XOkZPYSX2pu8gDhDcN5svD58RtNii
 00v6ICw8ZzvNuV6n2y7W39odeV0T3iUID/bbidFsTmqYtoj8RBv4OI3ZEzECtXohJo/j
 0OJjqaKThcQ+NdaKgUlY86HccGmKE2fXfSYJYBtyRzoQNdDk6ReqfkakqWLWIW2vVm64
 7mqn64n6+nImF6vZYMoiUy+RXIYKJYvUW5yoIFB6PhAtTeSv5RP9ILysi17/kDSZnCdx
 HpSQ==
X-Gm-Message-State: AOAM531IRjAs9C7pJd+MHUjgegryjFFoYG3SLZOwOolW+qoXnhvq13SC
 HpztjtFulNYlscXT/HsE95ZniDH7VFDGQg==
X-Google-Smtp-Source: ABdhPJw7wBdWh2ZfJoQBeKb+oQqsyqBLz3mgrY2wQGpFHSLPoGt0QzIq/06GAuqcyyKqMVIwvEwJ4Q==
X-Received: by 2002:a63:e515:: with SMTP id r21mr13014531pgh.412.1620438709678; 
 Fri, 07 May 2021 18:51:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 71/72] softfloat: Move floatN_log2 to softfloat-parts.c.inc
Date: Fri,  7 May 2021 18:48:01 -0700
Message-Id: <20210508014802.892561-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Rename to parts$N_log2.  Though this is partly a ruse, since I do not
believe the code will succeed for float128 without work.  Which is ok
for now, because we do not need this for more than float32 and float64.

Since berkeley-testfloat-3 doesn't support log2, compare float64_log2
vs the system log2.  Fix the errors for inputs near 1.0:

test: 3ff00000000000b0  +0x1.00000000000b0p+0
  sf: 3d2fa00000000000  +0x1.fa00000000000p-45
libm: 3d2fbd422b1bd36f  +0x1.fbd422b1bd36fp-45
Error in fraction: 32170028290927 ulp

test: 3feec24f6770b100  +0x1.ec24f6770b100p-1
  sf: bfad3740d13c9ec0  -0x1.d3740d13c9ec0p-5
libm: bfad3740d13c9e98  -0x1.d3740d13c9e98p-5
Error in fraction: 40 ulp

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 126 ++++++++------------------------------
 tests/fp/fp-test-log2.c   | 118 +++++++++++++++++++++++++++++++++++
 fpu/softfloat-parts.c.inc | 125 +++++++++++++++++++++++++++++++++++++
 tests/fp/meson.build      |  11 ++++
 4 files changed, 281 insertions(+), 99 deletions(-)
 create mode 100644 tests/fp/fp-test-log2.c

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 906bb427ae..3823a7ec6f 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -926,6 +926,12 @@ static void parts128_scalbn(FloatParts128 *a, int n, float_status *s);
 #define parts_scalbn(A, N, S) \
     PARTS_GENERIC_64_128(scalbn, A)(A, N, S)
 
+static void parts64_log2(FloatParts64 *a, float_status *s, const FloatFmt *f);
+static void parts128_log2(FloatParts128 *a, float_status *s, const FloatFmt *f);
+
+#define parts_log2(A, S, F) \
+    PARTS_GENERIC_64_128(log2, A)(A, S, F)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -4062,6 +4068,27 @@ floatx80 floatx80_sqrt(floatx80 a, float_status *s)
     return floatx80_round_pack_canonical(&p, s);
 }
 
+/*
+ * log2
+ */
+float32 float32_log2(float32 a, float_status *status)
+{
+    FloatParts64 p;
+
+    float32_unpack_canonical(&p, a, status);
+    parts_log2(&p, status, &float32_params);
+    return float32_round_pack_canonical(&p, status);
+}
+
+float64 float64_log2(float64 a, float_status *status)
+{
+    FloatParts64 p;
+
+    float64_unpack_canonical(&p, a, status);
+    parts_log2(&p, status, &float64_params);
+    return float64_round_pack_canonical(&p, status);
+}
+
 /*----------------------------------------------------------------------------
 | The pattern for a default generated NaN.
 *----------------------------------------------------------------------------*/
@@ -5248,56 +5275,6 @@ float32 float32_exp2(float32 a, float_status *status)
     return float32_round_pack_canonical(&rp, status);
 }
 
-/*----------------------------------------------------------------------------
-| Returns the binary log of the single-precision floating-point value `a'.
-| The operation is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-float32 float32_log2(float32 a, float_status *status)
-{
-    bool aSign, zSign;
-    int aExp;
-    uint32_t aSig, zSig, i;
-
-    a = float32_squash_input_denormal(a, status);
-    aSig = extractFloat32Frac( a );
-    aExp = extractFloat32Exp( a );
-    aSign = extractFloat32Sign( a );
-
-    if ( aExp == 0 ) {
-        if ( aSig == 0 ) return packFloat32( 1, 0xFF, 0 );
-        normalizeFloat32Subnormal( aSig, &aExp, &aSig );
-    }
-    if ( aSign ) {
-        float_raise(float_flag_invalid, status);
-        return float32_default_nan(status);
-    }
-    if ( aExp == 0xFF ) {
-        if (aSig) {
-            return propagateFloat32NaN(a, float32_zero, status);
-        }
-        return a;
-    }
-
-    aExp -= 0x7F;
-    aSig |= 0x00800000;
-    zSign = aExp < 0;
-    zSig = aExp << 23;
-
-    for (i = 1 << 22; i > 0; i >>= 1) {
-        aSig = ( (uint64_t)aSig * aSig ) >> 23;
-        if ( aSig & 0x01000000 ) {
-            aSig >>= 1;
-            zSig |= i;
-        }
-    }
-
-    if ( zSign )
-        zSig = -zSig;
-
-    return normalizeRoundAndPackFloat32(zSign, 0x85, zSig, status);
-}
-
 /*----------------------------------------------------------------------------
 | Returns the remainder of the double-precision floating-point value `a'
 | with respect to the corresponding value `b'.  The operation is performed
@@ -5386,55 +5363,6 @@ float64 float64_rem(float64 a, float64 b, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the binary log of the double-precision floating-point value `a'.
-| The operation is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-float64 float64_log2(float64 a, float_status *status)
-{
-    bool aSign, zSign;
-    int aExp;
-    uint64_t aSig, aSig0, aSig1, zSig, i;
-    a = float64_squash_input_denormal(a, status);
-
-    aSig = extractFloat64Frac( a );
-    aExp = extractFloat64Exp( a );
-    aSign = extractFloat64Sign( a );
-
-    if ( aExp == 0 ) {
-        if ( aSig == 0 ) return packFloat64( 1, 0x7FF, 0 );
-        normalizeFloat64Subnormal( aSig, &aExp, &aSig );
-    }
-    if ( aSign ) {
-        float_raise(float_flag_invalid, status);
-        return float64_default_nan(status);
-    }
-    if ( aExp == 0x7FF ) {
-        if (aSig) {
-            return propagateFloat64NaN(a, float64_zero, status);
-        }
-        return a;
-    }
-
-    aExp -= 0x3FF;
-    aSig |= UINT64_C(0x0010000000000000);
-    zSign = aExp < 0;
-    zSig = (uint64_t)aExp << 52;
-    for (i = 1LL << 51; i > 0; i >>= 1) {
-        mul64To128( aSig, aSig, &aSig0, &aSig1 );
-        aSig = ( aSig0 << 12 ) | ( aSig1 >> 52 );
-        if ( aSig & UINT64_C(0x0020000000000000) ) {
-            aSig >>= 1;
-            zSig |= i;
-        }
-    }
-
-    if ( zSign )
-        zSig = -zSig;
-    return normalizeRoundAndPackFloat64(zSign, 0x408, zSig, status);
-}
-
 /*----------------------------------------------------------------------------
 | Rounds the extended double-precision floating-point value `a'
 | to the precision provided by floatx80_rounding_precision and returns the
diff --git a/tests/fp/fp-test-log2.c b/tests/fp/fp-test-log2.c
new file mode 100644
index 0000000000..8ad856509b
--- /dev/null
+++ b/tests/fp/fp-test-log2.c
@@ -0,0 +1,118 @@
+/*
+ * fp-test-log2.c - test QEMU's softfloat log2
+ *
+ * Copyright (C) 2020, Linaro, Ltd.
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+#ifndef HW_POISON_H
+#error Must define HW_POISON_H to work around TARGET_* poisoning
+#endif
+
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include <math.h>
+#include "fpu/softfloat.h"
+
+typedef union {
+    double d;
+    float64 i;
+} ufloat64;
+
+static int errors;
+
+static void compare(ufloat64 test, ufloat64 real, ufloat64 soft, bool exact)
+{
+    int msb;
+    uint64_t ulp = UINT64_MAX;
+
+    if (real.i == soft.i) {
+        return;
+    }
+    msb = 63 - __builtin_clzll(real.i ^ soft.i);
+
+    if (msb < 52) {
+        if (real.i > soft.i) {
+            ulp = real.i - soft.i;
+        } else {
+            ulp = soft.i - real.i;
+        }
+    }
+
+    /* glibc allows 3 ulp error in its libm-test-ulps; allow 4 here */
+    if (!exact && ulp <= 4) {
+        return;
+    }
+   
+    printf("test: %016" PRIx64 "  %+.13a\n"
+           "  sf: %016" PRIx64 "  %+.13a\n"
+           "libm: %016" PRIx64 "  %+.13a\n",
+           test.i, test.d, soft.i, soft.d, real.i, real.d);
+
+    if (msb == 63) {
+        printf("Error in sign!\n\n");
+    } else if (msb >= 52) {
+        printf("Error in exponent: %d\n\n",
+               (int)(soft.i >> 52) - (int)(real.i >> 52));
+    } else {
+        printf("Error in fraction: %" PRIu64 " ulp\n\n", ulp);
+    }
+
+    if (++errors == 20) {
+        exit(1);
+    }
+}
+
+int main(int ac, char **av)
+{
+    ufloat64 test, real, soft;
+    float_status qsf = {0};
+    int i;
+
+    set_float_rounding_mode(float_round_nearest_even, &qsf);
+
+    test.d = 0.0;
+    real.d = -__builtin_inf();
+    soft.i = float64_log2(test.i, &qsf);
+    compare(test, real, soft, true);
+
+    test.d = 1.0;
+    real.d = 0.0;
+    soft.i = float64_log2(test.i, &qsf);
+    compare(test, real, soft, true);
+
+    test.d = 2.0;
+    real.d = 1.0;
+    soft.i = float64_log2(test.i, &qsf);
+    compare(test, real, soft, true);
+
+    test.d = 4.0;
+    real.d = 2.0;
+    soft.i = float64_log2(test.i, &qsf);
+    compare(test, real, soft, true);
+
+    test.d = 0x1p64;
+    real.d = 64.0;
+    soft.i = float64_log2(test.i, &qsf);
+    compare(test, real, soft, true);
+
+    test.d = __builtin_inf();
+    real.d = __builtin_inf();
+    soft.i = float64_log2(test.i, &qsf);
+    compare(test, real, soft, true);
+
+    for (i = 0; i < 10000; ++i) {
+        test.d = drand48() + 1.0;    /* [1.0, 2.0) */
+        real.d = log2(test.d);
+        soft.i = float64_log2(test.i, &qsf);
+        compare(test, real, soft, false);
+
+        test.d = drand48() * 100;    /* [0.0, 100) */
+        real.d = log2(test.d);
+        soft.i = float64_log2(test.i, &qsf);
+        compare(test, real, soft, false);
+    }
+
+    return 0;
+}
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index c18f77f2cf..3659c6a4c0 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1319,3 +1319,128 @@ static void partsN(scalbn)(FloatPartsN *a, int n, float_status *s)
         g_assert_not_reached();
     }
 }
+
+/*
+ * Return log2(A)
+ */
+static void partsN(log2)(FloatPartsN *a, float_status *s, const FloatFmt *fmt)
+{
+    uint64_t a0, a1, r, t, ign;
+    FloatPartsN f;
+    int i, n, a_exp, f_exp;
+
+    if (unlikely(a->cls != float_class_normal)) {
+        switch (a->cls) {
+        case float_class_snan:
+        case float_class_qnan:
+            parts_return_nan(a, s);
+            return;
+        case float_class_zero:
+            /* log2(0) = -inf */
+            a->cls = float_class_inf;
+            a->sign = 1;
+            return;
+        case float_class_inf:
+            if (unlikely(a->sign)) {
+                goto d_nan;
+            }
+            return;
+        default:
+            break;
+        }
+        g_assert_not_reached();
+    }
+    if (unlikely(a->sign)) {
+        goto d_nan;
+    }
+
+    /* TODO: This algorithm looses bits too quickly for float128. */
+    g_assert(N == 64);
+
+    a_exp = a->exp;
+    f_exp = -1;
+
+    r = 0;
+    t = DECOMPOSED_IMPLICIT_BIT;
+    a0 = a->frac_hi;
+    a1 = 0;
+
+    n = fmt->frac_size + 2;
+    if (unlikely(a_exp == -1)) {
+        /*
+         * When a_exp == -1, we're computing the log2 of a value [0.5,1.0).
+         * When the value is very close to 1.0, there are lots of 1's in
+         * the msb parts of the fraction.  At the end, when we subtract
+         * this value from -1.0, we can see a catastrophic loss of precision,
+         * as 0x800..000 - 0x7ff..ffx becomes 0x000..00y, leaving only the
+         * bits of y in the final result.  To minimize this, compute as many
+         * digits as we can.
+         * ??? This case needs another algorithm to avoid this.
+         */
+        n = fmt->frac_size * 2 + 2;
+        /* Don't compute a value overlapping the sticky bit */
+        n = MIN(n, 62);
+    }
+
+    for (i = 0; i < n; i++) {
+        if (a1) {
+            mul128To256(a0, a1, a0, a1, &a0, &a1, &ign, &ign);
+        } else if (a0 & 0xffffffffull) {
+            mul64To128(a0, a0, &a0, &a1);
+        } else if (a0 & ~DECOMPOSED_IMPLICIT_BIT) {
+            a0 >>= 32;
+            a0 *= a0;
+        } else {
+            goto exact;
+        }
+
+        if (a0 & DECOMPOSED_IMPLICIT_BIT) {
+            if (unlikely(a_exp == 0 && r == 0)) {
+                /*
+                 * When a_exp == 0, we're computing the log2 of a value
+                 * [1.0,2.0).  When the value is very close to 1.0, there
+                 * are lots of 0's in the msb parts of the fraction.
+                 * We need to compute more digits to produce a correct
+                 * result -- restart at the top of the fraction.
+                 * ??? This is likely to lose precision quickly, as for
+                 * float128; we may need another method.
+                 */
+                f_exp -= i;
+                t = r = DECOMPOSED_IMPLICIT_BIT;
+                i = 0;
+            } else {
+                r |= t;
+            }
+        } else {
+            add128(a0, a1, a0, a1, &a0, &a1);
+        }
+        t >>= 1;
+    }
+
+    /* Set sticky for inexact. */
+    r |= (a1 || a0 & ~DECOMPOSED_IMPLICIT_BIT);
+
+ exact:
+    parts_sint_to_float(a, a_exp, 0, s);
+    if (r == 0) {
+        return;
+    }
+
+    memset(&f, 0, sizeof(f));
+    f.cls = float_class_normal;
+    f.frac_hi = r;
+    f.exp = f_exp - frac_normalize(&f);
+
+    if (a_exp < 0) {
+        parts_sub_normal(a, &f);
+    } else if (a_exp > 0) {
+        parts_add_normal(a, &f);
+    } else {
+        *a = f;
+    }
+    return;
+
+ d_nan:
+    float_raise(float_flag_invalid, s);
+    parts_default_nan(a, s);
+}
diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 1c3eee9955..9218bfd3b0 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -634,3 +634,14 @@ fpbench = executable(
   include_directories: [sfinc, include_directories(tfdir)],
   c_args: fpcflags,
 )
+
+fptestlog2 = executable(
+  'fp-test-log2',
+  ['fp-test-log2.c', '../../fpu/softfloat.c'],
+  link_with: [libsoftfloat],
+  dependencies: [qemuutil],
+  include_directories: [sfinc],
+  c_args: fpcflags,
+)
+test('fp-test-log2', fptestlog2,
+     suite: ['softfloat', 'softfloat-ops'])
-- 
2.25.1


