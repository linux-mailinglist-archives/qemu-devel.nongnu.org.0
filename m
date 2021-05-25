Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AA1390695
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:24:40 +0200 (CEST)
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZrD-0006pi-3H
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeO-0001Uw-4d
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:20 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeE-0006d1-CZ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:19 -0400
Received: by mail-pj1-x102c.google.com with SMTP id q6so17013435pjj.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rGDd4IrgxvYUwN/P21Hl5FXEtH+AR/o/zuzvqPcST80=;
 b=I8yzv1wq757NIPDwnMio/+AxYdSBxOvyRi1A8SdCyrBIRMzofpJIH4jJznULi6Vsbo
 JSCpuFSpOVbkXQRD9XKOTAdEJua12Em2CBdESEVs9eQZfa5Z6k7ddAwl1mcenODuApIm
 njL+AdBgLEI45MeW1HRKOGbX1XVAivEpf4WqUhTnHLVs23yCVt039Rf/2LLWJTGX3Gwc
 TRbqYLo7p1FexSRvzhHUEW+9DhrpiN9mFGp87dC6BEaY0ZtyWxeqfDRYonl75wz44srm
 Ea9JVgWOrTpIqQlEABpCKHFb649z1JsPZBvj2PgVSBd+DGd3eXvR3IlPnwLP02ON9/SJ
 41eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rGDd4IrgxvYUwN/P21Hl5FXEtH+AR/o/zuzvqPcST80=;
 b=iSbX3XBdVmfuG+jR5X1M5BhEfcLc+ZFKzZ+j/Z+LOAAFA7YbrNhrio+/ECJ8r3ZWf1
 KWXQwmTdwzCotpnmm3c0XOKRf152xYYFUTNdTGkymLDhCndExvgBuRQZE7XjVaFjD0nt
 LvGzQbfVpgBG/2DDK8Lly4I1KjKg4CTl3i8hpaOhoiDV8ulfqm1rRO+FGLkkSbLedvYn
 giuIBmTXuIS+NLLluDFvY7GPy+UQJPyzF3VjvpMRNsk/0y7e960rIfNMZaHp1lyC3ZOR
 XTSfE0nXNoc4wtKsqNRlbTAX9h9R36pUCEnvIAXduV1ID85uM99XPOJlCaMsCd+rzEzb
 qCQw==
X-Gm-Message-State: AOAM531Im/MJBazkfN9MVf53nEy0Lj6CvdNvH6I31gV8XdbCW9hUieDq
 6zxDaUbmSELi2sQVVA0rYhSWB7vb1CUHvQ==
X-Google-Smtp-Source: ABdhPJwZsJm8PfLKm3VQweFDVtoO1h3Cwr6pWMJ9/ghKaAr2kjR+aCviR0M/cwwqChDRqciONilXWA==
X-Received: by 2002:a17:90a:9d88:: with SMTP id
 k8mr5235831pjp.64.1621955229060; 
 Tue, 25 May 2021 08:07:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/28] softfloat: Move int_to_float to softfloat-parts.c.inc
Date: Tue, 25 May 2021 08:06:40 -0700
Message-Id: <20210525150706.294968-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Rename to parts$N_sint_to_float.
Reimplement int{32,64}_to_float128 with FloatParts128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 136 +++++++++++---------------------------
 fpu/softfloat-parts.c.inc |  32 +++++++++
 2 files changed, 70 insertions(+), 98 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 3181678ea9..6404a2997f 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -849,6 +849,14 @@ static uint64_t parts128_float_to_uint(FloatParts128 *p, FloatRoundMode rmode,
 #define parts_float_to_uint(P, R, Z, M, S) \
     PARTS_GENERIC_64_128(float_to_uint, P)(P, R, Z, M, S)
 
+static void parts64_sint_to_float(FloatParts64 *p, int64_t a,
+                                  int scale, float_status *s);
+static void parts128_sint_to_float(FloatParts128 *p, int64_t a,
+                                   int scale, float_status *s);
+
+#define parts_sint_to_float(P, I, Z, S) \
+    PARTS_GENERIC_64_128(sint_to_float, P)(P, I, Z, S)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -2940,42 +2948,15 @@ uint64_t bfloat16_to_uint64_round_to_zero(bfloat16 a, float_status *s)
 }
 
 /*
- * Integer to float conversions
- *
- * Returns the result of converting the two's complement integer `a'
- * to the floating-point format. The conversion is performed according
- * to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
+ * Signed integer to floating-point conversions
  */
 
-static FloatParts64 int_to_float(int64_t a, int scale, float_status *status)
-{
-    FloatParts64 r = { .sign = false };
-
-    if (a == 0) {
-        r.cls = float_class_zero;
-    } else {
-        uint64_t f = a;
-        int shift;
-
-        r.cls = float_class_normal;
-        if (a < 0) {
-            f = -f;
-            r.sign = true;
-        }
-        shift = clz64(f);
-        scale = MIN(MAX(scale, -0x10000), 0x10000);
-
-        r.exp = DECOMPOSED_BINARY_POINT - shift + scale;
-        r.frac = f << shift;
-    }
-
-    return r;
-}
-
 float16 int64_to_float16_scalbn(int64_t a, int scale, float_status *status)
 {
-    FloatParts64 pa = int_to_float(a, scale, status);
-    return float16_round_pack_canonical(&pa, status);
+    FloatParts64 p;
+
+    parts_sint_to_float(&p, a, scale, status);
+    return float16_round_pack_canonical(&p, status);
 }
 
 float16 int32_to_float16_scalbn(int32_t a, int scale, float_status *status)
@@ -3010,8 +2991,10 @@ float16 int8_to_float16(int8_t a, float_status *status)
 
 float32 int64_to_float32_scalbn(int64_t a, int scale, float_status *status)
 {
-    FloatParts64 pa = int_to_float(a, scale, status);
-    return float32_round_pack_canonical(&pa, status);
+    FloatParts64 p;
+
+    parts64_sint_to_float(&p, a, scale, status);
+    return float32_round_pack_canonical(&p, status);
 }
 
 float32 int32_to_float32_scalbn(int32_t a, int scale, float_status *status)
@@ -3041,8 +3024,10 @@ float32 int16_to_float32(int16_t a, float_status *status)
 
 float64 int64_to_float64_scalbn(int64_t a, int scale, float_status *status)
 {
-    FloatParts64 pa = int_to_float(a, scale, status);
-    return float64_round_pack_canonical(&pa, status);
+    FloatParts64 p;
+
+    parts_sint_to_float(&p, a, scale, status);
+    return float64_round_pack_canonical(&p, status);
 }
 
 float64 int32_to_float64_scalbn(int32_t a, int scale, float_status *status)
@@ -3070,15 +3055,12 @@ float64 int16_to_float64(int16_t a, float_status *status)
     return int64_to_float64_scalbn(a, 0, status);
 }
 
-/*
- * Returns the result of converting the two's complement integer `a'
- * to the bfloat16 format.
- */
-
 bfloat16 int64_to_bfloat16_scalbn(int64_t a, int scale, float_status *status)
 {
-    FloatParts64 pa = int_to_float(a, scale, status);
-    return bfloat16_round_pack_canonical(&pa, status);
+    FloatParts64 p;
+
+    parts_sint_to_float(&p, a, scale, status);
+    return bfloat16_round_pack_canonical(&p, status);
 }
 
 bfloat16 int32_to_bfloat16_scalbn(int32_t a, int scale, float_status *status)
@@ -3106,6 +3088,19 @@ bfloat16 int16_to_bfloat16(int16_t a, float_status *status)
     return int64_to_bfloat16_scalbn(a, 0, status);
 }
 
+float128 int64_to_float128(int64_t a, float_status *status)
+{
+    FloatParts128 p;
+
+    parts_sint_to_float(&p, a, 0, status);
+    return float128_round_pack_canonical(&p, status);
+}
+
+float128 int32_to_float128(int32_t a, float_status *status)
+{
+    return int64_to_float128(a, status);
+}
+
 /*
  * Unsigned Integer to float conversions
  *
@@ -4956,28 +4951,6 @@ floatx80 int32_to_floatx80(int32_t a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the 32-bit two's complement integer `a' to
-| the quadruple-precision floating-point format.  The conversion is performed
-| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 int32_to_float128(int32_t a, float_status *status)
-{
-    bool zSign;
-    uint32_t absA;
-    int8_t shiftCount;
-    uint64_t zSig0;
-
-    if ( a == 0 ) return packFloat128( 0, 0, 0, 0 );
-    zSign = ( a < 0 );
-    absA = zSign ? - a : a;
-    shiftCount = clz32(absA) + 17;
-    zSig0 = absA;
-    return packFloat128( zSign, 0x402E - shiftCount, zSig0<<shiftCount, 0 );
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of converting the 64-bit two's complement integer `a'
 | to the extended double-precision floating-point format.  The conversion
@@ -4999,39 +4972,6 @@ floatx80 int64_to_floatx80(int64_t a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the 64-bit two's complement integer `a' to
-| the quadruple-precision floating-point format.  The conversion is performed
-| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 int64_to_float128(int64_t a, float_status *status)
-{
-    bool zSign;
-    uint64_t absA;
-    int8_t shiftCount;
-    int32_t zExp;
-    uint64_t zSig0, zSig1;
-
-    if ( a == 0 ) return packFloat128( 0, 0, 0, 0 );
-    zSign = ( a < 0 );
-    absA = zSign ? - a : a;
-    shiftCount = clz64(absA) + 49;
-    zExp = 0x406E - shiftCount;
-    if ( 64 <= shiftCount ) {
-        zSig1 = 0;
-        zSig0 = absA;
-        shiftCount -= 64;
-    }
-    else {
-        zSig1 = absA;
-        zSig0 = 0;
-    }
-    shortShift128Left( zSig0, zSig1, shiftCount, &zSig0, &zSig1 );
-    return packFloat128( zSign, zExp, zSig0, zSig1 );
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of converting the 64-bit unsigned integer `a'
 | to the quadruple-precision floating-point format.  The conversion is performed
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index c6e327547f..8102de1307 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -881,3 +881,35 @@ static uint64_t partsN(float_to_uint)(FloatPartsN *p, FloatRoundMode rmode,
     float_raise(flags, s);
     return r;
 }
+
+/*
+ * Integer to float conversions
+ *
+ * Returns the result of converting the two's complement integer `a'
+ * to the floating-point format. The conversion is performed according
+ * to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
+ */
+static void partsN(sint_to_float)(FloatPartsN *p, int64_t a,
+                                  int scale, float_status *s)
+{
+    uint64_t f = a;
+    int shift;
+
+    memset(p, 0, sizeof(*p));
+
+    if (a == 0) {
+        p->cls = float_class_zero;
+        return;
+    }
+
+    p->cls = float_class_normal;
+    if (a < 0) {
+        f = -f;
+        p->sign = true;
+    }
+    shift = clz64(f);
+    scale = MIN(MAX(scale, -0x10000), 0x10000);
+
+    p->exp = DECOMPOSED_BINARY_POINT - shift + scale;
+    p->frac_hi = f << shift;
+}
-- 
2.25.1


