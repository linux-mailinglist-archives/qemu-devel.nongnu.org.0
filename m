Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCFA376E6A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:12:59 +0200 (CEST)
Received: from localhost ([::1]:50660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCSg-0005EE-Je
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC54-0004Gc-Jc
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:35 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:37544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4s-0003dL-7o
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:34 -0400
Received: by mail-pf1-x433.google.com with SMTP id b15so9152611pfl.4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jjUuhoqBIOcy9NWdDiV7IAwahvxH3LtTBG8RuCBSSl8=;
 b=zJ6g6v9l74HpKtuZ0jOEAvfB0mEaZFJJCf/UABeaS33RUwCOe8rkXpObeQI5mJWgsY
 yLO97h3fMc56bG2vWWVeA0WJSVlKOqC55acsPhz8Z9aYnqBlrNjzjXfL8rlMlwuJwOpO
 tMjmyGzCfGXXewWBsP4uI0JTMZYyacMUyiHJ2GRXkY37lVHEGN3ToXi/hZh6Yv9PQs7q
 oAEECOmGfuRjsr26f7ydFJrfXULx9Dw5gGDKH1o+HC/PKwE6pKthn9gWj9GT6jFfbSav
 pI7LP0d82/tbsFcOFWiX9YtbLI2Ueqa/kJZtemepq2QBQiY3pC0sHsGmu7JOjsbzAiMo
 8ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jjUuhoqBIOcy9NWdDiV7IAwahvxH3LtTBG8RuCBSSl8=;
 b=JT5OvM4OMfBDA69LJZMFJyrQj8exVVVn+jmTrOWA5CXWgK2+5XdfOzqDfstO8Lcnwx
 VqIc4EI85JuLNye1UpFxf8DAdWQUsz3N5nYphUSf/bxRz0naMcdvqLORoMUluHngHH6X
 32oChQeZ81teX+etnWsM9CZlOWDR2EKQhEMPt2zdNhepwtdZiEYrlbu8ptU4cEfOscPN
 MYey2C/6Ixp5uulZdi7JUNuRDBpV9DTnemEDjgl5yXmHDHFnsmtD5LHKoscRX2fCpYCH
 gRM52hCtrVXT2feC17qH/QE8yJ/+3W7n/i9I9z9T5a/IZu8ekBLkOO8aQlriJuWn8cK7
 z8pA==
X-Gm-Message-State: AOAM5316rWWx6He5l+fWdtd/ONyGWJKWSvbt4Dfwkt2BTou73zlvCfgC
 CPMtKpYaHaquwJz+vhVy2vazPp66LeeRBw==
X-Google-Smtp-Source: ABdhPJxd3yNHrzsqtpien5uXio5evpIefzbCeyIeqH/MC3A3svWlYtqJ13903cnbcIf46CeDDFN/qw==
X-Received: by 2002:aa7:8d84:0:b029:1f8:3449:1bc6 with SMTP id
 i4-20020aa78d840000b02901f834491bc6mr12894062pfr.76.1620438500759; 
 Fri, 07 May 2021 18:48:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/72] softfloat: Convert float128_silence_nan to parts
Date: Fri,  7 May 2021 18:47:16 -0700
Message-Id: <20210508014802.892561-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

This is the minimal change that also introduces float128_params,
float128_unpack_raw, and float128_pack_raw without running into
unused symbol Werrors.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c                | 96 +++++++++++++++++++++++++++++-----
 fpu/softfloat-specialize.c.inc | 25 +++------
 2 files changed, 89 insertions(+), 32 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 2d6f61ee7a..073b80d502 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -500,14 +500,12 @@ static inline __attribute__((unused)) bool is_qnan(FloatClass c)
 }
 
 /*
- * Structure holding all of the decomposed parts of a float. The
- * exponent is unbiased and the fraction is normalized. All
- * calculations are done with a 64 bit fraction and then rounded as
- * appropriate for the final format.
+ * Structure holding all of the decomposed parts of a float.
+ * The exponent is unbiased and the fraction is normalized.
  *
- * Thanks to the packed FloatClass a decent compiler should be able to
- * fit the whole structure into registers and avoid using the stack
- * for parameter passing.
+ * The fraction words are stored in big-endian word ordering,
+ * so that truncation from a larger format to a smaller format
+ * can be done simply by ignoring subsequent elements.
  */
 
 typedef struct {
@@ -526,6 +524,15 @@ typedef struct {
     };
 } FloatParts64;
 
+typedef struct {
+    FloatClass cls;
+    bool sign;
+    int32_t exp;
+    uint64_t frac_hi;
+    uint64_t frac_lo;
+} FloatParts128;
+
+/* These apply to the most significant word of each FloatPartsN. */
 #define DECOMPOSED_BINARY_POINT    63
 #define DECOMPOSED_IMPLICIT_BIT    (1ull << DECOMPOSED_BINARY_POINT)
 
@@ -561,11 +568,11 @@ typedef struct {
     .exp_bias       = ((1 << E) - 1) >> 1,                           \
     .exp_max        = (1 << E) - 1,                                  \
     .frac_size      = F,                                             \
-    .frac_shift     = DECOMPOSED_BINARY_POINT - F,                   \
-    .frac_lsb       = 1ull << (DECOMPOSED_BINARY_POINT - F),         \
-    .frac_lsbm1     = 1ull << ((DECOMPOSED_BINARY_POINT - F) - 1),   \
-    .round_mask     = (1ull << (DECOMPOSED_BINARY_POINT - F)) - 1,   \
-    .roundeven_mask = (2ull << (DECOMPOSED_BINARY_POINT - F)) - 1
+    .frac_shift     = (-F - 1) & 63,                                 \
+    .frac_lsb       = 1ull << ((-F - 1) & 63),                       \
+    .frac_lsbm1     = 1ull << ((-F - 2) & 63),                       \
+    .round_mask     = (1ull << ((-F - 1) & 63)) - 1,                 \
+    .roundeven_mask = (2ull << ((-F - 1) & 63)) - 1
 
 static const FloatFmt float16_params = {
     FLOAT_PARAMS(5, 10)
@@ -588,6 +595,10 @@ static const FloatFmt float64_params = {
     FLOAT_PARAMS(11, 52)
 };
 
+static const FloatFmt float128_params = {
+    FLOAT_PARAMS(15, 112)
+};
+
 /* Unpack a float to parts, but do not canonicalize.  */
 static void unpack_raw64(FloatParts64 *r, const FloatFmt *fmt, uint64_t raw)
 {
@@ -622,6 +633,20 @@ static inline void float64_unpack_raw(FloatParts64 *p, float64 f)
     unpack_raw64(p, &float64_params, f);
 }
 
+static void float128_unpack_raw(FloatParts128 *p, float128 f)
+{
+    const int f_size = float128_params.frac_size - 64;
+    const int e_size = float128_params.exp_size;
+
+    *p = (FloatParts128) {
+        .cls = float_class_unclassified,
+        .sign = extract64(f.high, f_size + e_size, 1),
+        .exp = extract64(f.high, f_size, e_size),
+        .frac_hi = extract64(f.high, 0, f_size),
+        .frac_lo = f.low,
+    };
+}
+
 /* Pack a float from parts, but do not canonicalize.  */
 static uint64_t pack_raw64(const FloatParts64 *p, const FloatFmt *fmt)
 {
@@ -655,6 +680,18 @@ static inline float64 float64_pack_raw(const FloatParts64 *p)
     return make_float64(pack_raw64(p, &float64_params));
 }
 
+static float128 float128_pack_raw(const FloatParts128 *p)
+{
+    const int f_size = float128_params.frac_size - 64;
+    const int e_size = float128_params.exp_size;
+    uint64_t hi;
+
+    hi = (uint64_t)p->sign << (f_size + e_size);
+    hi = deposit64(hi, f_size, e_size, p->exp);
+    hi = deposit64(hi, 0, f_size, p->frac_hi);
+    return make_float128(hi, p->frac_lo);
+}
+
 /*----------------------------------------------------------------------------
 | Functions and definitions to determine:  (1) whether tininess for underflow
 | is detected before or after rounding by default, (2) what (if anything)
@@ -665,8 +702,30 @@ static inline float64 float64_pack_raw(const FloatParts64 *p)
 *----------------------------------------------------------------------------*/
 #include "softfloat-specialize.c.inc"
 
+#define PARTS_GENERIC_64_128(NAME, P) \
+    QEMU_GENERIC(P, (FloatParts128 *, parts128_##NAME), parts64_##NAME)
+
 #define parts_default_nan  parts64_default_nan
-#define parts_silence_nan  parts64_silence_nan
+#define parts_silence_nan(P, S)    PARTS_GENERIC_64_128(silence_nan, P)(P, S)
+
+
+/*
+ * Helper functions for softfloat-parts.c.inc, per-size operations.
+ */
+
+static void frac128_shl(FloatParts128 *a, int c)
+{
+    shift128Left(a->frac_hi, a->frac_lo, c, &a->frac_hi, &a->frac_lo);
+}
+
+#define frac_shl(A, C)             frac128_shl(A, C)
+
+static void frac128_shr(FloatParts128 *a, int c)
+{
+    shift128Right(a->frac_hi, a->frac_lo, c, &a->frac_hi, &a->frac_lo);
+}
+
+#define frac_shr(A, C)             frac128_shr(A, C)
 
 /* Canonicalize EXP and FRAC, setting CLS.  */
 static FloatParts64 sf_canonicalize(FloatParts64 part, const FloatFmt *parm,
@@ -3850,6 +3909,17 @@ bfloat16 bfloat16_silence_nan(bfloat16 a, float_status *status)
     return bfloat16_pack_raw(&p);
 }
 
+float128 float128_silence_nan(float128 a, float_status *status)
+{
+    FloatParts128 p;
+
+    float128_unpack_raw(&p, a);
+    frac_shl(&p, float128_params.frac_shift);
+    parts_silence_nan(&p, status);
+    frac_shr(&p, float128_params.frac_shift);
+    return float128_pack_raw(&p);
+}
+
 /*----------------------------------------------------------------------------
 | If `a' is denormal and we are in flush-to-zero mode then set the
 | input-denormal exception and return zero. Otherwise just return the value.
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 2a1bc66633..d892016f0f 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -198,6 +198,12 @@ static void parts64_silence_nan(FloatParts64 *p, float_status *status)
     p->cls = float_class_qnan;
 }
 
+static void parts128_silence_nan(FloatParts128 *p, float_status *status)
+{
+    p->frac_hi = parts_silence_nan_frac(p->frac_hi, status);
+    p->cls = float_class_qnan;
+}
+
 /*----------------------------------------------------------------------------
 | The pattern for a default generated extended double-precision NaN.
 *----------------------------------------------------------------------------*/
@@ -1057,25 +1063,6 @@ bool float128_is_signaling_nan(float128 a, float_status *status)
     }
 }
 
-/*----------------------------------------------------------------------------
-| Returns a quiet NaN from a signalling NaN for the quadruple-precision
-| floating point value `a'.
-*----------------------------------------------------------------------------*/
-
-float128 float128_silence_nan(float128 a, float_status *status)
-{
-    if (no_signaling_nans(status)) {
-        g_assert_not_reached();
-    } else {
-        if (snan_bit_is_one(status)) {
-            return float128_default_nan(status);
-        } else {
-            a.high |= UINT64_C(0x0000800000000000);
-            return a;
-        }
-    }
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of converting the quadruple-precision floating-point NaN
 | `a' to the canonical NaN format.  If `a' is a signaling NaN, the invalid
-- 
2.25.1


