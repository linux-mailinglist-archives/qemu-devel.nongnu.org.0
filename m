Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222084EA18B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:31:33 +0200 (CEST)
Received: from localhost ([::1]:34138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYw1U-0000ec-5q
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:31:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nYvle-0003Yn-QA; Mon, 28 Mar 2022 16:15:10 -0400
Received: from [187.72.171.209] (port=39734 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nYvlc-00030r-SV; Mon, 28 Mar 2022 16:15:10 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 28 Mar 2022 17:14:53 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id DD901800094;
 Mon, 28 Mar 2022 17:14:52 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 4/6] softfloat: add float*_to_int128 conversion methods
Date: Mon, 28 Mar 2022 17:14:40 -0300
Message-Id: <20220328201442.175206-5-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
References: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 Mar 2022 20:14:53.0343 (UTC)
 FILETIME=[7C5432F0:01D842E0]
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

Implements parts_float_to_int2 based on parts_float_to_int logic. The
new methods return the lower part of the result through the "lo"
pointer.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 fpu/softfloat-parts.c.inc | 75 +++++++++++++++++++++++++++++++++++++++
 fpu/softfloat.c           | 50 ++++++++++++++++++++++++++
 include/fpu/softfloat.h   |  8 +++++
 3 files changed, 133 insertions(+)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 2767aeac03..344df52e5f 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1096,6 +1096,81 @@ static int64_t partsN(float_to_sint)(FloatPartsN *p, FloatRoundMode rmode,
     return r;
 }
 
+static int64_t partsN(float_to_sint2)(FloatPartsN *p, FloatRoundMode rmode,
+                                      int scale, float_status *s, uint64_t *lo)
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
+            hi = INT64_MIN;
+            *lo = 0;
+        } else {
+            hi = INT64_MAX;
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
+        }
+
+        if (p->exp <= DECOMPOSED_BINARY_POINT) {
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
+            hi = UINT64_MAX;
+            *lo = UINT64_MAX;
+        }
+        if (p->sign) {
+            if (hi < INT64_MIN || (hi == INT64_MIN && *lo == 0)) {
+                *lo = -*lo;
+                hi = ~hi + !*lo;
+            } else {
+                flags = float_flag_invalid | float_flag_invalid_cvti;
+                hi = INT64_MIN;
+                *lo = 0;
+            }
+        } else if (hi > INT64_MAX) {
+            flags = float_flag_invalid | float_flag_invalid_cvti;
+            hi = INT64_MAX;
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
  *  Returns the result of converting the floating-point value `a' to
  *  the unsigned integer format. The conversion is performed according
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index fe4320060c..41a18f86df 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -840,6 +840,15 @@ static int64_t parts128_float_to_sint(FloatParts128 *p, FloatRoundMode rmode,
 #define parts_float_to_sint(P, R, Z, MN, MX, S) \
     PARTS_GENERIC_64_128(float_to_sint, P)(P, R, Z, MN, MX, S)
 
+static int64_t parts64_float_to_sint2(FloatParts64 *p, FloatRoundMode rmode,
+                                      int scale, float_status *s, uint64_t *lo);
+static int64_t parts128_float_to_sint2(FloatParts128 *p, FloatRoundMode rmode,
+                                       int scale, float_status *s,
+                                       uint64_t *lo);
+
+#define parts_float_to_sint2(P, R, Z, S, H) \
+    PARTS_GENERIC_64_128(float_to_sint2, P)(P, R, Z, S, H)
+
 static uint64_t parts64_float_to_uint(FloatParts64 *p, FloatRoundMode rmode,
                                       int scale, uint64_t max,
                                       float_status *s);
@@ -3135,6 +3144,15 @@ int64_t float64_to_int64_scalbn(float64 a, FloatRoundMode rmode, int scale,
     return parts_float_to_sint(&p, rmode, scale, INT64_MIN, INT64_MAX, s);
 }
 
+int64_t float64_to_int128_scalbn(float64 a, FloatRoundMode rmode, int scale,
+                                 float_status *s, uint64_t *lo)
+{
+    FloatParts64 p;
+
+    float64_unpack_canonical(&p, a, s);
+    return parts_float_to_sint2(&p, rmode, scale, s, lo);
+}
+
 int16_t bfloat16_to_int16_scalbn(bfloat16 a, FloatRoundMode rmode, int scale,
                                  float_status *s)
 {
@@ -3180,6 +3198,16 @@ static int64_t float128_to_int64_scalbn(float128 a, FloatRoundMode rmode,
     return parts_float_to_sint(&p, rmode, scale, INT64_MIN, INT64_MAX, s);
 }
 
+static int64_t float128_to_int128_scalbn(float128 a, FloatRoundMode rmode,
+                                         int scale, float_status *s,
+                                         uint64_t *lo)
+{
+    FloatParts128 p;
+
+    float128_unpack_canonical(&p, a, s);
+    return parts_float_to_sint2(&p, rmode, scale, s, lo);
+}
+
 static int32_t floatx80_to_int32_scalbn(floatx80 a, FloatRoundMode rmode,
                                         int scale, float_status *s)
 {
@@ -3252,6 +3280,11 @@ int64_t float64_to_int64(float64 a, float_status *s)
     return float64_to_int64_scalbn(a, s->float_rounding_mode, 0, s);
 }
 
+int64_t float64_to_int128(float64 a, float_status *s, uint64_t *lo)
+{
+    return float64_to_int128_scalbn(a, s->float_rounding_mode, 0, s, lo);
+}
+
 int32_t float128_to_int32(float128 a, float_status *s)
 {
     return float128_to_int32_scalbn(a, s->float_rounding_mode, 0, s);
@@ -3262,6 +3295,11 @@ int64_t float128_to_int64(float128 a, float_status *s)
     return float128_to_int64_scalbn(a, s->float_rounding_mode, 0, s);
 }
 
+int64_t float128_to_int128(float128 a, float_status *s, uint64_t *lo)
+{
+    return float128_to_int128_scalbn(a, s->float_rounding_mode, 0, s, lo);
+}
+
 int32_t floatx80_to_int32(floatx80 a, float_status *s)
 {
     return floatx80_to_int32_scalbn(a, s->float_rounding_mode, 0, s);
@@ -3317,6 +3355,12 @@ int64_t float64_to_int64_round_to_zero(float64 a, float_status *s)
     return float64_to_int64_scalbn(a, float_round_to_zero, 0, s);
 }
 
+int64_t float64_to_int128_round_to_zero(float64 a, float_status *s,
+                                        uint64_t *lo)
+{
+    return float64_to_int128_scalbn(a, float_round_to_zero, 0, s, lo);
+}
+
 int32_t float128_to_int32_round_to_zero(float128 a, float_status *s)
 {
     return float128_to_int32_scalbn(a, float_round_to_zero, 0, s);
@@ -3327,6 +3371,12 @@ int64_t float128_to_int64_round_to_zero(float128 a, float_status *s)
     return float128_to_int64_scalbn(a, float_round_to_zero, 0, s);
 }
 
+int64_t float128_to_int128_round_to_zero(float128 a, float_status *s,
+                                         uint64_t *lo)
+{
+    return float128_to_int128_scalbn(a, float_round_to_zero, 0, s, lo);
+}
+
 int32_t floatx80_to_int32_round_to_zero(floatx80 a, float_status *s)
 {
     return floatx80_to_int32_scalbn(a, float_round_to_zero, 0, s);
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 01d8edbc73..8d6d2ee62b 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -746,14 +746,19 @@ float32 float32_default_nan(float_status *status);
 int16_t float64_to_int16_scalbn(float64, FloatRoundMode, int, float_status *);
 int32_t float64_to_int32_scalbn(float64, FloatRoundMode, int, float_status *);
 int64_t float64_to_int64_scalbn(float64, FloatRoundMode, int, float_status *);
+int64_t float64_to_int128_scalbn(float64, FloatRoundMode, int, float_status *,
+                                 uint64_t *);
 
 int16_t float64_to_int16(float64, float_status *status);
 int32_t float64_to_int32(float64, float_status *status);
 int64_t float64_to_int64(float64, float_status *status);
+int64_t float64_to_int128(float64, float_status *status, uint64_t *lo);
 
 int16_t float64_to_int16_round_to_zero(float64, float_status *status);
 int32_t float64_to_int32_round_to_zero(float64, float_status *status);
 int64_t float64_to_int64_round_to_zero(float64, float_status *status);
+int64_t float64_to_int128_round_to_zero(float64, float_status *status,
+                                        uint64_t *lo);
 
 uint16_t float64_to_uint16_scalbn(float64, FloatRoundMode, int, float_status *);
 uint32_t float64_to_uint32_scalbn(float64, FloatRoundMode, int, float_status *);
@@ -1213,7 +1218,10 @@ floatx80 floatx80_default_nan(float_status *status);
 int32_t float128_to_int32(float128, float_status *status);
 int32_t float128_to_int32_round_to_zero(float128, float_status *status);
 int64_t float128_to_int64(float128, float_status *status);
+int64_t float128_to_int128(float128, float_status *status, uint64_t *lo);
 int64_t float128_to_int64_round_to_zero(float128, float_status *status);
+int64_t float128_to_int128_round_to_zero(float128, float_status *status,
+                                         uint64_t *lo);
 uint64_t float128_to_uint64(float128, float_status *status);
 uint64_t float128_to_uint128(float128, float_status *status, uint64_t *lo);
 uint64_t float128_to_uint64_round_to_zero(float128, float_status *status);
-- 
2.25.1


