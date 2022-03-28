Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5229A4EA161
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:21:51 +0200 (CEST)
Received: from localhost ([::1]:47982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYvs6-0007R6-BV
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:21:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nYvlY-0003PW-NT; Mon, 28 Mar 2022 16:15:04 -0400
Received: from [187.72.171.209] (port=39734 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nYvlW-00030r-SZ; Mon, 28 Mar 2022 16:15:04 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 28 Mar 2022 17:14:52 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2F8D6800094;
 Mon, 28 Mar 2022 17:14:52 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 2/6] softfloat: add int128_to_float* conversion methods
Date: Mon, 28 Mar 2022 17:14:38 -0300
Message-Id: <20220328201442.175206-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
References: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 Mar 2022 20:14:52.0622 (UTC)
 FILETIME=[7BE62EE0:01D842E0]
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

Based on parts_sint_to_float, implements parts_sint_to_float2 that
receives a 128-bit signed integer via int64_t and uint64_t arguments.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 fpu/softfloat-parts.c.inc | 37 +++++++++++++++++++++++++++++++++++++
 fpu/softfloat.c           | 30 ++++++++++++++++++++++++++++++
 include/fpu/softfloat.h   |  3 +++
 3 files changed, 70 insertions(+)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 0bbecf835f..5f7f107a0d 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1196,6 +1196,43 @@ static void partsN(sint_to_float)(FloatPartsN *p, int64_t a,
     p->frac_hi = f << shift;
 }
 
+static void partsN(sint_to_float2)(FloatPartsN *p, int64_t hi, uint64_t lo,
+                                   int scale, float_status *status)
+{
+    uint64_t f = hi;
+    int shift;
+
+    if (hi == 0) {
+        parts_uint_to_float(p, lo, scale, status);
+    } else {
+        memset(p, 0, sizeof(*p));
+        p->cls = float_class_normal;
+        if (hi < 0) {
+            lo = -lo;
+            f = ~f + !lo;
+            p->sign = true;
+        }
+        if (f != 0) {
+            shift = clz64(f);
+        } else {
+            shift = 64 + clz64(lo);
+        }
+        scale = MIN(MAX(scale, -0x10000), 0x10000);
+
+        p->exp = 127 - shift + scale;
+
+        if (shift >= 64) {
+            f = lo;
+            lo = 0;
+            shift -= 64;
+        }
+        p->frac_hi = shl_double(f, lo, shift);
+        if (N > 64) {
+            p->frac_lo = shl_double(lo, 0, shift);
+        }
+    }
+}
+
 /*
  * Unsigned Integer to float conversions
  *
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 980ddfe5a1..ac3d6f5ab0 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -858,6 +858,14 @@ static void parts128_sint_to_float(FloatParts128 *p, int64_t a,
 #define parts_sint_to_float(P, I, Z, S) \
     PARTS_GENERIC_64_128(sint_to_float, P)(P, I, Z, S)
 
+static void parts64_sint_to_float2(FloatParts64 *p, int64_t hi, uint64_t lo,
+                                   int scale, float_status *s);
+static void parts128_sint_to_float2(FloatParts128 *p, int64_t hi, uint64_t lo,
+                                    int scale, float_status *s);
+
+#define parts_sint_to_float2(P, H, L, Z, S) \
+    PARTS_GENERIC_64_128(sint_to_float2, P)(P, H, L, Z, S)
+
 static void parts64_uint_to_float(FloatParts64 *p, uint64_t a,
                                   int scale, float_status *s);
 static void parts128_uint_to_float(FloatParts128 *p, uint64_t a,
@@ -3715,6 +3723,15 @@ float32 int16_to_float32(int16_t a, float_status *status)
     return int64_to_float32_scalbn(a, 0, status);
 }
 
+float64 int128_to_float64_scalbn(int64_t hi, uint64_t lo, int scale,
+                                 float_status *status)
+{
+    FloatParts64 p;
+
+    parts_sint_to_float2(&p, hi, lo, scale, status);
+    return float64_round_pack_canonical(&p, status);
+}
+
 float64 int64_to_float64_scalbn(int64_t a, int scale, float_status *status)
 {
     FloatParts64 p;
@@ -3740,6 +3757,11 @@ float64 int16_to_float64_scalbn(int16_t a, int scale, float_status *status)
     return int64_to_float64_scalbn(a, scale, status);
 }
 
+float64 int128_to_float64(int64_t hi, uint64_t lo, float_status *status)
+{
+    return int128_to_float64_scalbn(hi, lo, 0, status);
+}
+
 float64 int64_to_float64(int64_t a, float_status *status)
 {
     return int64_to_float64_scalbn(a, 0, status);
@@ -3788,6 +3810,14 @@ bfloat16 int16_to_bfloat16(int16_t a, float_status *status)
     return int64_to_bfloat16_scalbn(a, 0, status);
 }
 
+float128 int128_to_float128(int64_t hi, uint64_t lo, float_status *status)
+{
+    FloatParts128 p;
+
+    parts_sint_to_float2(&p, hi, lo, 0, status);
+    return float128_round_pack_canonical(&p, status);
+}
+
 float128 int64_to_float128(int64_t a, float_status *status)
 {
     FloatParts128 p;
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 2ef4fec3d0..5a2165a187 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -166,6 +166,7 @@ float32 uint64_to_float32(uint64_t, float_status *status);
 float64 int16_to_float64_scalbn(int16_t, int, float_status *status);
 float64 int32_to_float64_scalbn(int32_t, int, float_status *status);
 float64 int64_to_float64_scalbn(int64_t, int, float_status *status);
+float64 int128_to_float64_scalbn(int64_t, uint64_t, int, float_status *status);
 float64 uint16_to_float64_scalbn(uint16_t, int, float_status *status);
 float64 uint32_to_float64_scalbn(uint32_t, int, float_status *status);
 float64 uint64_to_float64_scalbn(uint64_t, int, float_status *status);
@@ -175,6 +176,7 @@ float64 uint128_to_float64_scalbn(uint64_t, uint64_t, int,
 float64 int16_to_float64(int16_t, float_status *status);
 float64 int32_to_float64(int32_t, float_status *status);
 float64 int64_to_float64(int64_t, float_status *status);
+float64 int128_to_float64(int64_t, uint64_t, float_status *status);
 float64 uint16_to_float64(uint16_t, float_status *status);
 float64 uint32_to_float64(uint32_t, float_status *status);
 float64 uint64_to_float64(uint64_t, float_status *status);
@@ -185,6 +187,7 @@ floatx80 int64_to_floatx80(int64_t, float_status *status);
 
 float128 int32_to_float128(int32_t, float_status *status);
 float128 int64_to_float128(int64_t, float_status *status);
+float128 int128_to_float128(int64_t, uint64_t, float_status *status);
 float128 uint64_to_float128(uint64_t, float_status *status);
 float128 uint128_to_float128(uint64_t, uint64_t, float_status *status);
 
-- 
2.25.1


