Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C978F4EA15E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:21:13 +0200 (CEST)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYvrU-0006j4-MS
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:21:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nYvlb-0003Se-NI; Mon, 28 Mar 2022 16:15:07 -0400
Received: from [187.72.171.209] (port=39734 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nYvlZ-00030r-L2; Mon, 28 Mar 2022 16:15:07 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 28 Mar 2022 17:14:52 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 8928380060F;
 Mon, 28 Mar 2022 17:14:52 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 3/6] softfloat: add float*_to_uint128 conversion methods
Date: Mon, 28 Mar 2022 17:14:39 -0300
Message-Id: <20220328201442.175206-4-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
References: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 Mar 2022 20:14:52.0967 (UTC)
 FILETIME=[7C1AD370:01D842E0]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implements parts_float_to_uint2 based on parts_float_to_uint logic. The
new methods return the lower part of the result through the "lo"
pointer.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 fpu/softfloat-parts.c.inc | 71 +++++++++++++++++++++++++++++++++++++++
 fpu/softfloat.c           | 51 ++++++++++++++++++++++++++++
 include/fpu/softfloat.h   |  8 +++++
 3 files changed, 130 insertions(+)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 5f7f107a0d..2767aeac03 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1164,6 +1164,77 @@ static uint64_t partsN(float_to_uint)(FloatPartsN *p, FloatRoundMode rmode,
     return r;
 }
 
+static uint64_t partsN(float_to_uint2)(FloatPartsN *p, FloatRoundMode rmode,
+                                       int scale, float_status *s, uint64_t *lo)
+{
+    int flags = 0;
+    uint64_t hi;
+
+    switch (p->cls) {
+    case float_class_snan:
+        flags |= float_flag_invalid_snan;
+        /* fall through */
+    case float_class_qnan:
+        flags |= float_flag_invalid;
+        hi = UINT64_MAX;
+        *lo = UINT64_MAX;
+        break;
+
+    case float_class_inf:
+        flags = float_flag_invalid | float_flag_invalid_cvti;
+        if (p->sign) {
+            hi = 0;
+            *lo = 0;
+        } else {
+            hi = UINT64_MAX;
+            *lo = UINT64_MAX;
+        }
+        break;
+
+    case float_class_zero:
+        *lo = 0;
+        return 0;
+
+    case float_class_normal:
+        if (parts_round_to_int_normal(p, rmode, scale, N - 2)) {
+            flags = float_flag_inexact;
+            if (p->cls == float_class_zero) {
+                hi = 0;
+                *lo = 0;
+                break;
+            }
+        }
+
+        if (p->sign) {
+            flags = float_flag_invalid | float_flag_invalid_cvti;
+            hi = 0;
+            *lo = 0;
+        } else if (p->exp <= DECOMPOSED_BINARY_POINT) {
+            hi = 0;
+            *lo = p->frac_hi >> (DECOMPOSED_BINARY_POINT - p->exp);
+        } else if (p->exp <= 127) {
+            int shift = 127 - p->exp;
+            hi = shr_double(0, p->frac_hi, shift);
+            if (N > 64) {
+                *lo = shr_double(p->frac_hi, p->frac_lo, shift);
+            } else {
+                *lo = shr_double(p->frac_hi, 0, shift);
+            }
+        } else {
+            flags = float_flag_invalid | float_flag_invalid_cvti;
+            hi = UINT64_MAX;
+            *lo = UINT64_MAX;
+        }
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+
+    float_raise(flags, s);
+    return hi;
+}
+
 /*
  * Integer to float conversions
  *
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index ac3d6f5ab0..fe4320060c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -850,6 +850,16 @@ static uint64_t parts128_float_to_uint(FloatParts128 *p, FloatRoundMode rmode,
 #define parts_float_to_uint(P, R, Z, M, S) \
     PARTS_GENERIC_64_128(float_to_uint, P)(P, R, Z, M, S)
 
+static uint64_t parts64_float_to_uint2(FloatParts64 *p, FloatRoundMode rmode,
+                                       int scale, float_status *s,
+                                       uint64_t *lo);
+static uint64_t parts128_float_to_uint2(FloatParts128 *p, FloatRoundMode rmode,
+                                        int scale, float_status *s,
+                                        uint64_t *lo);
+
+#define parts_float_to_uint2(P, R, Z, S, H) \
+    PARTS_GENERIC_64_128(float_to_uint2, P)(P, R, Z, S, H)
+
 static void parts64_sint_to_float(FloatParts64 *p, int64_t a,
                                   int scale, float_status *s);
 static void parts128_sint_to_float(FloatParts128 *p, int64_t a,
@@ -3451,6 +3461,15 @@ uint64_t float64_to_uint64_scalbn(float64 a, FloatRoundMode rmode, int scale,
     return parts_float_to_uint(&p, rmode, scale, UINT64_MAX, s);
 }
 
+uint64_t float64_to_uint128_scalbn(float64 a, FloatRoundMode rmode, int scale,
+                                   float_status *s, uint64_t *lo)
+{
+    FloatParts64 p;
+
+    float64_unpack_canonical(&p, a, s);
+    return parts_float_to_uint2(&p, rmode, scale, s, lo);
+}
+
 uint16_t bfloat16_to_uint16_scalbn(bfloat16 a, FloatRoundMode rmode,
                                    int scale, float_status *s)
 {
@@ -3496,6 +3515,16 @@ static uint64_t float128_to_uint64_scalbn(float128 a, FloatRoundMode rmode,
     return parts_float_to_uint(&p, rmode, scale, UINT64_MAX, s);
 }
 
+static uint64_t float128_to_uint128_scalbn(float128 a, FloatRoundMode rmode,
+                                           int scale, float_status *s,
+                                           uint64_t *lo)
+{
+    FloatParts128 p;
+
+    float128_unpack_canonical(&p, a, s);
+    return parts_float_to_uint2(&p, rmode, scale, s, lo);
+}
+
 uint8_t float16_to_uint8(float16 a, float_status *s)
 {
     return float16_to_uint8_scalbn(a, s->float_rounding_mode, 0, s);
@@ -3546,6 +3575,11 @@ uint64_t float64_to_uint64(float64 a, float_status *s)
     return float64_to_uint64_scalbn(a, s->float_rounding_mode, 0, s);
 }
 
+uint64_t float64_to_uint128(float64 a, float_status *s, uint64_t *lo)
+{
+    return float64_to_uint128_scalbn(a, s->float_rounding_mode, 0, s, lo);
+}
+
 uint32_t float128_to_uint32(float128 a, float_status *s)
 {
     return float128_to_uint32_scalbn(a, s->float_rounding_mode, 0, s);
@@ -3556,6 +3590,11 @@ uint64_t float128_to_uint64(float128 a, float_status *s)
     return float128_to_uint64_scalbn(a, s->float_rounding_mode, 0, s);
 }
 
+uint64_t float128_to_uint128(float128 a, float_status *s, uint64_t *lo)
+{
+    return float128_to_uint128_scalbn(a, s->float_rounding_mode, 0, s, lo);
+}
+
 uint16_t float16_to_uint16_round_to_zero(float16 a, float_status *s)
 {
     return float16_to_uint16_scalbn(a, float_round_to_zero, 0, s);
@@ -3601,6 +3640,12 @@ uint64_t float64_to_uint64_round_to_zero(float64 a, float_status *s)
     return float64_to_uint64_scalbn(a, float_round_to_zero, 0, s);
 }
 
+uint64_t float64_to_uint128_round_to_zero(float64 a, float_status *s,
+                                          uint64_t *lo)
+{
+    return float64_to_uint128_scalbn(a, float_round_to_zero, 0, s, lo);
+}
+
 uint32_t float128_to_uint32_round_to_zero(float128 a, float_status *s)
 {
     return float128_to_uint32_scalbn(a, float_round_to_zero, 0, s);
@@ -3611,6 +3656,12 @@ uint64_t float128_to_uint64_round_to_zero(float128 a, float_status *s)
     return float128_to_uint64_scalbn(a, float_round_to_zero, 0, s);
 }
 
+uint64_t float128_to_uint128_round_to_zero(float128 a, float_status *s,
+                                           uint64_t *lo)
+{
+    return float128_to_uint128_scalbn(a, float_round_to_zero, 0, s, lo);
+}
+
 uint16_t bfloat16_to_uint16(bfloat16 a, float_status *s)
 {
     return bfloat16_to_uint16_scalbn(a, s->float_rounding_mode, 0, s);
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 5a2165a187..01d8edbc73 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -758,14 +758,19 @@ int64_t float64_to_int64_round_to_zero(float64, float_status *status);
 uint16_t float64_to_uint16_scalbn(float64, FloatRoundMode, int, float_status *);
 uint32_t float64_to_uint32_scalbn(float64, FloatRoundMode, int, float_status *);
 uint64_t float64_to_uint64_scalbn(float64, FloatRoundMode, int, float_status *);
+uint64_t float64_to_uint128_scalbn(float64, FloatRoundMode, int, float_status *,
+                                   uint64_t *);
 
 uint16_t float64_to_uint16(float64, float_status *status);
 uint32_t float64_to_uint32(float64, float_status *status);
 uint64_t float64_to_uint64(float64, float_status *status);
+uint64_t float64_to_uint128(float64, float_status *status, uint64_t *lo);
 
 uint16_t float64_to_uint16_round_to_zero(float64, float_status *status);
 uint32_t float64_to_uint32_round_to_zero(float64, float_status *status);
 uint64_t float64_to_uint64_round_to_zero(float64, float_status *status);
+uint64_t float64_to_uint128_round_to_zero(float64, float_status *status,
+                                          uint64_t *lo);
 
 float32 float64_to_float32(float64, float_status *status);
 floatx80 float64_to_floatx80(float64, float_status *status);
@@ -1210,7 +1215,10 @@ int32_t float128_to_int32_round_to_zero(float128, float_status *status);
 int64_t float128_to_int64(float128, float_status *status);
 int64_t float128_to_int64_round_to_zero(float128, float_status *status);
 uint64_t float128_to_uint64(float128, float_status *status);
+uint64_t float128_to_uint128(float128, float_status *status, uint64_t *lo);
 uint64_t float128_to_uint64_round_to_zero(float128, float_status *status);
+uint64_t float128_to_uint128_round_to_zero(float128, float_status *status,
+                                           uint64_t *lo);
 uint32_t float128_to_uint32(float128, float_status *status);
 uint32_t float128_to_uint32_round_to_zero(float128, float_status *status);
 float32 float128_to_float32(float128, float_status *status);
-- 
2.25.1


