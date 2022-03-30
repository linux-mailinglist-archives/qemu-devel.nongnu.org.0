Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957024ECB5E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:08:06 +0200 (CEST)
Received: from localhost ([::1]:48898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcjl-0001F1-D7
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:08:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbo-0000kb-PH; Wed, 30 Mar 2022 13:59:52 -0400
Received: from [187.72.171.209] (port=21948 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbn-0004ik-5V; Wed, 30 Mar 2022 13:59:52 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 30 Mar 2022 14:59:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id AFDC280060F;
 Wed, 30 Mar 2022 14:59:35 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 6/8] softfloat: add float128_to_int128
Date: Wed, 30 Mar 2022 14:59:30 -0300
Message-Id: <20220330175932.6995-7-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Mar 2022 17:59:36.0184 (UTC)
 FILETIME=[EAF38780:01D8445F]
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

Implements float128_to_int128 based on parts_float_to_int logic.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 fpu/softfloat.c         | 64 +++++++++++++++++++++++++++++++++++++++++
 include/fpu/softfloat.h |  2 ++
 include/qemu/int128.h   |  2 ++
 3 files changed, 68 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index ce21b64e4f..5e2cf20448 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3154,6 +3154,60 @@ static int64_t float128_to_int64_scalbn(float128 a, FloatRoundMode rmode,
     return parts_float_to_sint(&p, rmode, scale, INT64_MIN, INT64_MAX, s);
 }
 
+static Int128 float128_to_int128_scalbn(float128 a, FloatRoundMode rmode,
+                                        int scale, float_status *s)
+{
+    int flags = 0;
+    Int128 r;
+    FloatParts128 p;
+
+    float128_unpack_canonical(&p, a, s);
+
+    switch (p.cls) {
+    case float_class_snan:
+        flags |= float_flag_invalid_snan;
+        /* fall through */
+    case float_class_qnan:
+        flags |= float_flag_invalid;
+        r = UINT128_MAX;
+        break;
+
+    case float_class_inf:
+        flags = float_flag_invalid | float_flag_invalid_cvti;
+        r = p.sign ? INT128_MIN : INT128_MAX;
+        break;
+
+    case float_class_zero:
+        return int128_zero();
+
+    case float_class_normal:
+        if (parts_round_to_int_normal(&p, rmode, scale, 128 - 2)) {
+            flags = float_flag_inexact;
+        }
+
+        if (p.exp < 127) {
+            int shift = 127 - p.exp;
+            r = int128_urshift(int128_make128(p.frac_lo, p.frac_hi), shift);
+            if (p.sign) {
+                r = int128_neg(r);
+            }
+        } else if (p.exp == 127 && p.sign && p.frac_lo == 0 &&
+                   p.frac_hi == DECOMPOSED_IMPLICIT_BIT) {
+            r = INT128_MIN;
+        } else {
+            flags = float_flag_invalid | float_flag_invalid_cvti;
+            r = p.sign ? INT128_MIN : INT128_MAX;
+        }
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+
+    float_raise(flags, s);
+    return r;
+}
+
 static int32_t floatx80_to_int32_scalbn(floatx80 a, FloatRoundMode rmode,
                                         int scale, float_status *s)
 {
@@ -3236,6 +3290,11 @@ int64_t float128_to_int64(float128 a, float_status *s)
     return float128_to_int64_scalbn(a, s->float_rounding_mode, 0, s);
 }
 
+Int128 float128_to_int128(float128 a, float_status *s)
+{
+    return float128_to_int128_scalbn(a, s->float_rounding_mode, 0, s);
+}
+
 int32_t floatx80_to_int32(floatx80 a, float_status *s)
 {
     return floatx80_to_int32_scalbn(a, s->float_rounding_mode, 0, s);
@@ -3301,6 +3360,11 @@ int64_t float128_to_int64_round_to_zero(float128 a, float_status *s)
     return float128_to_int64_scalbn(a, float_round_to_zero, 0, s);
 }
 
+Int128 float128_to_int128_round_to_zero(float128 a, float_status *s)
+{
+    return float128_to_int128_scalbn(a, float_round_to_zero, 0, s);
+}
+
 int32_t floatx80_to_int32_round_to_zero(floatx80 a, float_status *s)
 {
     return floatx80_to_int32_scalbn(a, float_round_to_zero, 0, s);
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 6cfe9ee474..3dcf20e3a2 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -1204,7 +1204,9 @@ floatx80 floatx80_default_nan(float_status *status);
 int32_t float128_to_int32(float128, float_status *status);
 int32_t float128_to_int32_round_to_zero(float128, float_status *status);
 int64_t float128_to_int64(float128, float_status *status);
+Int128 float128_to_int128(float128, float_status *status);
 int64_t float128_to_int64_round_to_zero(float128, float_status *status);
+Int128 float128_to_int128_round_to_zero(float128, float_status *status);
 uint64_t float128_to_uint64(float128, float_status *status);
 Int128 float128_to_uint128(float128, float_status *status);
 uint64_t float128_to_uint64_round_to_zero(float128, float_status *status);
diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index ca32b0b276..17ea5f1372 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -431,5 +431,7 @@ static inline void bswap128s(Int128 *s)
 }
 
 #define UINT128_MAX int128_make128(~0LL, ~0LL)
+#define INT128_MAX int128_make128(UINT64_MAX, INT64_MAX)
+#define INT128_MIN int128_make128(0, INT64_MIN)
 
 #endif /* INT128_H */
-- 
2.25.1


