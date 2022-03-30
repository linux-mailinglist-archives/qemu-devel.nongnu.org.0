Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A214ECB40
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:04:02 +0200 (CEST)
Received: from localhost ([::1]:40300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcfo-0003Zb-RU
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:04:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbm-0000dj-6a; Wed, 30 Mar 2022 13:59:50 -0400
Received: from [187.72.171.209] (port=21948 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbk-0004ik-Ik; Wed, 30 Mar 2022 13:59:49 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 30 Mar 2022 14:59:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 47C408002AF;
 Wed, 30 Mar 2022 14:59:35 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 5/8] softfloat: add float128_to_uint128
Date: Wed, 30 Mar 2022 14:59:29 -0300
Message-Id: <20220330175932.6995-6-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Mar 2022 17:59:35.0763 (UTC)
 FILETIME=[EAB34A30:01D8445F]
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

Implements float128_to_uint128 based on parts_float_to_uint logic.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 fpu/softfloat.c         | 65 +++++++++++++++++++++++++++++++++++++++++
 include/fpu/softfloat.h |  2 ++
 2 files changed, 67 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 60b4702945..ce21b64e4f 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3480,6 +3480,61 @@ static uint64_t float128_to_uint64_scalbn(float128 a, FloatRoundMode rmode,
     return parts_float_to_uint(&p, rmode, scale, UINT64_MAX, s);
 }
 
+static Int128 float128_to_uint128_scalbn(float128 a, FloatRoundMode rmode,
+                                         int scale, float_status *s)
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
+        r = p.sign ? int128_zero() : UINT128_MAX;
+        break;
+
+    case float_class_zero:
+        return int128_zero();
+
+    case float_class_normal:
+        if (parts_round_to_int_normal(&p, rmode, scale, 128 - 2)) {
+            flags = float_flag_inexact;
+            if (p.cls == float_class_zero) {
+                r = int128_zero();
+                break;
+            }
+        }
+
+        if (p.sign) {
+            flags = float_flag_invalid | float_flag_invalid_cvti;
+            r = int128_zero();
+        } else if (p.exp <= 127) {
+            int shift = 127 - p.exp;
+            r = int128_urshift(int128_make128(p.frac_lo, p.frac_hi), shift);
+        } else {
+            flags = float_flag_invalid | float_flag_invalid_cvti;
+            r = UINT128_MAX;
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
 uint8_t float16_to_uint8(float16 a, float_status *s)
 {
     return float16_to_uint8_scalbn(a, s->float_rounding_mode, 0, s);
@@ -3540,6 +3595,11 @@ uint64_t float128_to_uint64(float128 a, float_status *s)
     return float128_to_uint64_scalbn(a, s->float_rounding_mode, 0, s);
 }
 
+Int128 float128_to_uint128(float128 a, float_status *s)
+{
+    return float128_to_uint128_scalbn(a, s->float_rounding_mode, 0, s);
+}
+
 uint16_t float16_to_uint16_round_to_zero(float16 a, float_status *s)
 {
     return float16_to_uint16_scalbn(a, float_round_to_zero, 0, s);
@@ -3595,6 +3655,11 @@ uint64_t float128_to_uint64_round_to_zero(float128 a, float_status *s)
     return float128_to_uint64_scalbn(a, float_round_to_zero, 0, s);
 }
 
+Int128 float128_to_uint128_round_to_zero(float128 a, float_status *s)
+{
+    return float128_to_uint128_scalbn(a, float_round_to_zero, 0, s);
+}
+
 uint16_t bfloat16_to_uint16(bfloat16 a, float_status *s)
 {
     return bfloat16_to_uint16_scalbn(a, s->float_rounding_mode, 0, s);
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 3994b7235d..6cfe9ee474 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -1206,7 +1206,9 @@ int32_t float128_to_int32_round_to_zero(float128, float_status *status);
 int64_t float128_to_int64(float128, float_status *status);
 int64_t float128_to_int64_round_to_zero(float128, float_status *status);
 uint64_t float128_to_uint64(float128, float_status *status);
+Int128 float128_to_uint128(float128, float_status *status);
 uint64_t float128_to_uint64_round_to_zero(float128, float_status *status);
+Int128 float128_to_uint128_round_to_zero(float128, float_status *status);
 uint32_t float128_to_uint32(float128, float_status *status);
 uint32_t float128_to_uint32_round_to_zero(float128, float_status *status);
 float32 float128_to_float32(float128, float_status *status);
-- 
2.25.1


