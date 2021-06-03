Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C43139AD13
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:44:46 +0200 (CEST)
Received: from localhost ([::1]:57908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lov8u-00027Z-VC
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5y-0002CJ-QE
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:42 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:46067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5v-00014G-He
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:42 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso1272994pjb.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=daxdDiwfd3WqyKzbUdPQYbEO4yA2SpqfeiJ6sgOBQMg=;
 b=fbNFpLS8iB0+BpgaAa3xSu/YDsI5SqSL1+abePnjyI6JpUXNuThMLdKYlnjK9QJIbE
 zgKlqW7oO9a8u0BBW0AEBfgMM3izEh95VEqjnGSsB518+MR1ec7BGvqEH1/fuw9NGW9A
 TzblLTUbgJW2SmGKMdZ0UwAvM6JlaoateR0pxxVJmsP4IpNTC7JejUExz8PPEKwvqpij
 NmIKPgGbhkfvWDKf3rKttQUlNz+4NyBySavT7Ebuz0POob8czuQrXeWoQe1GAAu294xK
 o4bQMATZTjRV7F+hdn9mx7u+enLghY2t7JVkJEBnlZmVH2CKcwzGLoC0pBRDegK5hmxF
 GTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=daxdDiwfd3WqyKzbUdPQYbEO4yA2SpqfeiJ6sgOBQMg=;
 b=eiFxP6PNFlxgm/kRRoESSCsj/dt5WBSsWGA0v+LtuECzzTQ+ZVZuM7gT93Ck7m5F6q
 qo6AtIUtHYfu5pbcGv4Iy8NOfKQhhf7W0/bS9sP74hXX0dP8YxuyA5Y5ZxinOS485ftr
 6dKOgcQ+QXs4NkV5xbnHm1GVNpRI4H+k4LOcP+cP4cKsm9HOz2EpJauE21yyCb0fl84F
 KUO1/lbjrmead1w/nqtrnAw6GrMnib48pr6IK27Yiosi7gZ3LvZwTU69cCv1MDqprxwS
 VUtrDFnJo0YTZrLFj3P65g+iCjGCZuruaN/iW8Ubdf9esDyY/IDTzUq/D9R4tzg52zdK
 LSmw==
X-Gm-Message-State: AOAM531nO3izDYVQW/RKZR6HA7U0tuE7OwwS/06RS6i1eMymcj6pxhbj
 /FzCSPl9w42czXYZji9lEvI+GTuCSjLnTA==
X-Google-Smtp-Source: ABdhPJzVjeY+A9/7Tfsn2EQ23+lPvkrjz3oG7V8OGneBFdSoABPxJ9lfQYHUYTfHqJ/PYl6FKauYnA==
X-Received: by 2002:a17:90a:e98f:: with SMTP id
 v15mr13320945pjy.235.1622756498028; 
 Thu, 03 Jun 2021 14:41:38 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/29] softfloat: Move sqrt_float to softfloat-parts.c.inc
Date: Thu,  3 Jun 2021 14:41:10 -0700
Message-Id: <20210603214131.629841-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to parts$N_sqrt.
Reimplement float128_sqrt with FloatParts128.

Reimplement with the inverse sqrt newton-raphson algorithm from musl.
This is significantly faster than even the berkeley sqrt n-r algorithm,
because it does not use division instructions, only multiplication.

Ordinarily, changing algorithms at the same time as migrating code is
a bad idea, but this is the only way I found that didn't break one of
the routines at the same time.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 207 ++++++++++----------------------------
 fpu/softfloat-parts.c.inc | 206 +++++++++++++++++++++++++++++++++++++
 2 files changed, 261 insertions(+), 152 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 666b5a25d6..0f2eed8d29 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -820,6 +820,12 @@ static FloatParts128 *parts128_div(FloatParts128 *a, FloatParts128 *b,
 #define parts_div(A, B, S) \
     PARTS_GENERIC_64_128(div, A)(A, B, S)
 
+static void parts64_sqrt(FloatParts64 *a, float_status *s, const FloatFmt *f);
+static void parts128_sqrt(FloatParts128 *a, float_status *s, const FloatFmt *f);
+
+#define parts_sqrt(A, S, F) \
+    PARTS_GENERIC_64_128(sqrt, A)(A, S, F)
+
 static bool parts64_round_to_int_normal(FloatParts64 *a, FloatRoundMode rm,
                                         int scale, int frac_size);
 static bool parts128_round_to_int_normal(FloatParts128 *a, FloatRoundMode r,
@@ -1386,6 +1392,30 @@ static void frac128_widen(FloatParts256 *r, FloatParts128 *a)
 
 #define frac_widen(A, B)  FRAC_GENERIC_64_128(widen, B)(A, B)
 
+/*
+ * Reciprocal sqrt table.  1 bit of exponent, 6-bits of mantessa.
+ * From https://git.musl-libc.org/cgit/musl/tree/src/math/sqrt_data.c
+ * and thus MIT licenced.
+ */
+static const uint16_t rsqrt_tab[128] = {
+    0xb451, 0xb2f0, 0xb196, 0xb044, 0xaef9, 0xadb6, 0xac79, 0xab43,
+    0xaa14, 0xa8eb, 0xa7c8, 0xa6aa, 0xa592, 0xa480, 0xa373, 0xa26b,
+    0xa168, 0xa06a, 0x9f70, 0x9e7b, 0x9d8a, 0x9c9d, 0x9bb5, 0x9ad1,
+    0x99f0, 0x9913, 0x983a, 0x9765, 0x9693, 0x95c4, 0x94f8, 0x9430,
+    0x936b, 0x92a9, 0x91ea, 0x912e, 0x9075, 0x8fbe, 0x8f0a, 0x8e59,
+    0x8daa, 0x8cfe, 0x8c54, 0x8bac, 0x8b07, 0x8a64, 0x89c4, 0x8925,
+    0x8889, 0x87ee, 0x8756, 0x86c0, 0x862b, 0x8599, 0x8508, 0x8479,
+    0x83ec, 0x8361, 0x82d8, 0x8250, 0x81c9, 0x8145, 0x80c2, 0x8040,
+    0xff02, 0xfd0e, 0xfb25, 0xf947, 0xf773, 0xf5aa, 0xf3ea, 0xf234,
+    0xf087, 0xeee3, 0xed47, 0xebb3, 0xea27, 0xe8a3, 0xe727, 0xe5b2,
+    0xe443, 0xe2dc, 0xe17a, 0xe020, 0xdecb, 0xdd7d, 0xdc34, 0xdaf1,
+    0xd9b3, 0xd87b, 0xd748, 0xd61a, 0xd4f1, 0xd3cd, 0xd2ad, 0xd192,
+    0xd07b, 0xcf69, 0xce5b, 0xcd51, 0xcc4a, 0xcb48, 0xca4a, 0xc94f,
+    0xc858, 0xc764, 0xc674, 0xc587, 0xc49d, 0xc3b7, 0xc2d4, 0xc1f4,
+    0xc116, 0xc03c, 0xbf65, 0xbe90, 0xbdbe, 0xbcef, 0xbc23, 0xbb59,
+    0xba91, 0xb9cc, 0xb90a, 0xb84a, 0xb78c, 0xb6d0, 0xb617, 0xb560,
+};
+
 #define partsN(NAME)   glue(glue(glue(parts,N),_),NAME)
 #define FloatPartsN    glue(FloatParts,N)
 #define FloatPartsW    glue(FloatParts,W)
@@ -3586,103 +3616,35 @@ float128 float128_scalbn(float128 a, int n, float_status *status)
 
 /*
  * Square Root
- *
- * The old softfloat code did an approximation step before zeroing in
- * on the final result. However for simpleness we just compute the
- * square root by iterating down from the implicit bit to enough extra
- * bits to ensure we get a correctly rounded result.
- *
- * This does mean however the calculation is slower than before,
- * especially for 64 bit floats.
  */
 
-static FloatParts64 sqrt_float(FloatParts64 a, float_status *s, const FloatFmt *p)
-{
-    uint64_t a_frac, r_frac, s_frac;
-    int bit, last_bit;
-
-    if (is_nan(a.cls)) {
-        parts_return_nan(&a, s);
-        return a;
-    }
-    if (a.cls == float_class_zero) {
-        return a;  /* sqrt(+-0) = +-0 */
-    }
-    if (a.sign) {
-        float_raise(float_flag_invalid, s);
-        parts_default_nan(&a, s);
-        return a;
-    }
-    if (a.cls == float_class_inf) {
-        return a;  /* sqrt(+inf) = +inf */
-    }
-
-    assert(a.cls == float_class_normal);
-
-    /* We need two overflow bits at the top. Adding room for that is a
-     * right shift. If the exponent is odd, we can discard the low bit
-     * by multiplying the fraction by 2; that's a left shift. Combine
-     * those and we shift right by 1 if the exponent is odd, otherwise 2.
-     */
-    a_frac = a.frac >> (2 - (a.exp & 1));
-    a.exp >>= 1;
-
-    /* Bit-by-bit computation of sqrt.  */
-    r_frac = 0;
-    s_frac = 0;
-
-    /* Iterate from implicit bit down to the 3 extra bits to compute a
-     * properly rounded result. Remember we've inserted two more bits
-     * at the top, so these positions are two less.
-     */
-    bit = DECOMPOSED_BINARY_POINT - 2;
-    last_bit = MAX(p->frac_shift - 4, 0);
-    do {
-        uint64_t q = 1ULL << bit;
-        uint64_t t_frac = s_frac + q;
-        if (t_frac <= a_frac) {
-            s_frac = t_frac + q;
-            a_frac -= t_frac;
-            r_frac += q;
-        }
-        a_frac <<= 1;
-    } while (--bit >= last_bit);
-
-    /* Undo the right shift done above. If there is any remaining
-     * fraction, the result is inexact. Set the sticky bit.
-     */
-    a.frac = (r_frac << 2) + (a_frac != 0);
-
-    return a;
-}
-
 float16 QEMU_FLATTEN float16_sqrt(float16 a, float_status *status)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float16_unpack_canonical(&pa, a, status);
-    pr = sqrt_float(pa, status, &float16_params);
-    return float16_round_pack_canonical(&pr, status);
+    float16_unpack_canonical(&p, a, status);
+    parts_sqrt(&p, status, &float16_params);
+    return float16_round_pack_canonical(&p, status);
 }
 
 static float32 QEMU_SOFTFLOAT_ATTR
 soft_f32_sqrt(float32 a, float_status *status)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float32_unpack_canonical(&pa, a, status);
-    pr = sqrt_float(pa, status, &float32_params);
-    return float32_round_pack_canonical(&pr, status);
+    float32_unpack_canonical(&p, a, status);
+    parts_sqrt(&p, status, &float32_params);
+    return float32_round_pack_canonical(&p, status);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_f64_sqrt(float64 a, float_status *status)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float64_unpack_canonical(&pa, a, status);
-    pr = sqrt_float(pa, status, &float64_params);
-    return float64_round_pack_canonical(&pr, status);
+    float64_unpack_canonical(&p, a, status);
+    parts_sqrt(&p, status, &float64_params);
+    return float64_round_pack_canonical(&p, status);
 }
 
 float32 QEMU_FLATTEN float32_sqrt(float32 xa, float_status *s)
@@ -3741,11 +3703,20 @@ float64 QEMU_FLATTEN float64_sqrt(float64 xa, float_status *s)
 
 bfloat16 QEMU_FLATTEN bfloat16_sqrt(bfloat16 a, float_status *status)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    bfloat16_unpack_canonical(&pa, a, status);
-    pr = sqrt_float(pa, status, &bfloat16_params);
-    return bfloat16_round_pack_canonical(&pr, status);
+    bfloat16_unpack_canonical(&p, a, status);
+    parts_sqrt(&p, status, &bfloat16_params);
+    return bfloat16_round_pack_canonical(&p, status);
+}
+
+float128 QEMU_FLATTEN float128_sqrt(float128 a, float_status *status)
+{
+    FloatParts128 p;
+
+    float128_unpack_canonical(&p, a, status);
+    parts_sqrt(&p, status, &float128_params);
+    return float128_round_pack_canonical(&p, status);
 }
 
 /*----------------------------------------------------------------------------
@@ -6473,74 +6444,6 @@ float128 float128_rem(float128 a, float128 b, float_status *status)
                                          status);
 }
 
-/*----------------------------------------------------------------------------
-| Returns the square root of the quadruple-precision floating-point value `a'.
-| The operation is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 float128_sqrt(float128 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp, zExp;
-    uint64_t aSig0, aSig1, zSig0, zSig1, zSig2, doubleZSig0;
-    uint64_t rem0, rem1, rem2, rem3, term0, term1, term2, term3;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    aSign = extractFloat128Sign( a );
-    if ( aExp == 0x7FFF ) {
-        if (aSig0 | aSig1) {
-            return propagateFloat128NaN(a, a, status);
-        }
-        if ( ! aSign ) return a;
-        goto invalid;
-    }
-    if ( aSign ) {
-        if ( ( aExp | aSig0 | aSig1 ) == 0 ) return a;
- invalid:
-        float_raise(float_flag_invalid, status);
-        return float128_default_nan(status);
-    }
-    if ( aExp == 0 ) {
-        if ( ( aSig0 | aSig1 ) == 0 ) return packFloat128( 0, 0, 0, 0 );
-        normalizeFloat128Subnormal( aSig0, aSig1, &aExp, &aSig0, &aSig1 );
-    }
-    zExp = ( ( aExp - 0x3FFF )>>1 ) + 0x3FFE;
-    aSig0 |= UINT64_C(0x0001000000000000);
-    zSig0 = estimateSqrt32( aExp, aSig0>>17 );
-    shortShift128Left( aSig0, aSig1, 13 - ( aExp & 1 ), &aSig0, &aSig1 );
-    zSig0 = estimateDiv128To64( aSig0, aSig1, zSig0<<32 ) + ( zSig0<<30 );
-    doubleZSig0 = zSig0<<1;
-    mul64To128( zSig0, zSig0, &term0, &term1 );
-    sub128( aSig0, aSig1, term0, term1, &rem0, &rem1 );
-    while ( (int64_t) rem0 < 0 ) {
-        --zSig0;
-        doubleZSig0 -= 2;
-        add128( rem0, rem1, zSig0>>63, doubleZSig0 | 1, &rem0, &rem1 );
-    }
-    zSig1 = estimateDiv128To64( rem1, 0, doubleZSig0 );
-    if ( ( zSig1 & 0x1FFF ) <= 5 ) {
-        if ( zSig1 == 0 ) zSig1 = 1;
-        mul64To128( doubleZSig0, zSig1, &term1, &term2 );
-        sub128( rem1, 0, term1, term2, &rem1, &rem2 );
-        mul64To128( zSig1, zSig1, &term2, &term3 );
-        sub192( rem1, rem2, 0, 0, term2, term3, &rem1, &rem2, &rem3 );
-        while ( (int64_t) rem1 < 0 ) {
-            --zSig1;
-            shortShift128Left( 0, zSig1, 1, &term2, &term3 );
-            term3 |= 1;
-            term2 |= doubleZSig0;
-            add192( rem1, rem2, rem3, 0, term2, term3, &rem1, &rem2, &rem3 );
-        }
-        zSig1 |= ( ( rem1 | rem2 | rem3 ) != 0 );
-    }
-    shift128ExtraRightJamming( zSig0, zSig1, 0, 14, &zSig0, &zSig1, &zSig2 );
-    return roundAndPackFloat128(0, zExp, zSig0, zSig1, zSig2, status);
-
-}
-
 static inline FloatRelation
 floatx80_compare_internal(floatx80 a, floatx80 b, bool is_quiet,
                           float_status *status)
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index bf935c4fc2..d69f357352 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -597,6 +597,212 @@ static FloatPartsN *partsN(div)(FloatPartsN *a, FloatPartsN *b,
     return a;
 }
 
+/*
+ * Square Root
+ *
+ * The base algorithm is lifted from
+ * https://git.musl-libc.org/cgit/musl/tree/src/math/sqrtf.c
+ * https://git.musl-libc.org/cgit/musl/tree/src/math/sqrt.c
+ * https://git.musl-libc.org/cgit/musl/tree/src/math/sqrtl.c
+ * and is thus MIT licenced.
+ */
+static void partsN(sqrt)(FloatPartsN *a, float_status *status,
+                         const FloatFmt *fmt)
+{
+    const uint32_t three32 = 3u << 30;
+    const uint64_t three64 = 3ull << 62;
+    uint32_t d32, m32, r32, s32, u32;            /* 32-bit computation */
+    uint64_t d64, m64, r64, s64, u64;            /* 64-bit computation */
+    uint64_t dh, dl, rh, rl, sh, sl, uh, ul;     /* 128-bit computation */
+    uint64_t d0h, d0l, d1h, d1l, d2h, d2l;
+    uint64_t discard;
+    bool exp_odd;
+    size_t index;
+
+    if (unlikely(a->cls != float_class_normal)) {
+        switch (a->cls) {
+        case float_class_snan:
+        case float_class_qnan:
+            parts_return_nan(a, status);
+            return;
+        case float_class_zero:
+            return;
+        case float_class_inf:
+            if (unlikely(a->sign)) {
+                goto d_nan;
+            }
+            return;
+        default:
+            g_assert_not_reached();
+        }
+    }
+
+    if (unlikely(a->sign)) {
+        goto d_nan;
+    }
+
+    /*
+     * Argument reduction.
+     * x = 4^e frac; with integer e, and frac in [1, 4)
+     * m = frac fixed point at bit 62, since we're in base 4.
+     * If base-2 exponent is odd, exchange that for multiply by 2,
+     * which results in no shift.
+     */
+    exp_odd = a->exp & 1;
+    index = extract64(a->frac_hi, 57, 6) | (!exp_odd << 6);
+    if (!exp_odd) {
+        frac_shr(a, 1);
+    }
+
+    /*
+     * Approximate r ~= 1/sqrt(m) and s ~= sqrt(m) when m in [1, 4).
+     *
+     * Initial estimate:
+     * 7-bit lookup table (1-bit exponent and 6-bit significand).
+     *
+     * The relative error (e = r0*sqrt(m)-1) of a linear estimate
+     * (r0 = a*m + b) is |e| < 0.085955 ~ 0x1.6p-4 at best;
+     * a table lookup is faster and needs one less iteration.
+     * The 7-bit table gives |e| < 0x1.fdp-9.
+     *
+     * A Newton-Raphson iteration for r is
+     *   s = m*r
+     *   d = s*r
+     *   u = 3 - d
+     *   r = r*u/2
+     *
+     * Fixed point representations:
+     *   m, s, d, u, three are all 2.30; r is 0.32
+     */
+    m64 = a->frac_hi;
+    m32 = m64 >> 32;
+
+    r32 = rsqrt_tab[index] << 16;
+    /* |r*sqrt(m) - 1| < 0x1.FDp-9 */
+
+    s32 = ((uint64_t)m32 * r32) >> 32;
+    d32 = ((uint64_t)s32 * r32) >> 32;
+    u32 = three32 - d32;
+
+    if (N == 64) {
+        /* float64 or smaller */
+
+        r32 = ((uint64_t)r32 * u32) >> 31;
+        /* |r*sqrt(m) - 1| < 0x1.7Bp-16 */
+
+        s32 = ((uint64_t)m32 * r32) >> 32;
+        d32 = ((uint64_t)s32 * r32) >> 32;
+        u32 = three32 - d32;
+
+        if (fmt->frac_size <= 23) {
+            /* float32 or smaller */
+
+            s32 = ((uint64_t)s32 * u32) >> 32;  /* 3.29 */
+            s32 = (s32 - 1) >> 6;               /* 9.23 */
+            /* s < sqrt(m) < s + 0x1.08p-23 */
+
+            /* compute nearest rounded result to 2.23 bits */
+            uint32_t d0 = (m32 << 16) - s32 * s32;
+            uint32_t d1 = s32 - d0;
+            uint32_t d2 = d1 + s32 + 1;
+            s32 += d1 >> 31;
+            a->frac_hi = (uint64_t)s32 << (64 - 25);
+
+            /* increment or decrement for inexact */
+            if (d2 != 0) {
+                a->frac_hi += ((int32_t)(d1 ^ d2) < 0 ? -1 : 1);
+            }
+            goto done;
+        }
+
+        /* float64 */
+
+        r64 = (uint64_t)r32 * u32 * 2;
+        /* |r*sqrt(m) - 1| < 0x1.37-p29; convert to 64-bit arithmetic */
+        mul64To128(m64, r64, &s64, &discard);
+        mul64To128(s64, r64, &d64, &discard);
+        u64 = three64 - d64;
+
+        mul64To128(s64, u64, &s64, &discard);  /* 3.61 */
+        s64 = (s64 - 2) >> 9;                  /* 12.52 */
+
+        /* Compute nearest rounded result */
+        uint64_t d0 = (m64 << 42) - s64 * s64;
+        uint64_t d1 = s64 - d0;
+        uint64_t d2 = d1 + s64 + 1;
+        s64 += d1 >> 63;
+        a->frac_hi = s64 << (64 - 54);
+
+        /* increment or decrement for inexact */
+        if (d2 != 0) {
+            a->frac_hi += ((int64_t)(d1 ^ d2) < 0 ? -1 : 1);
+        }
+        goto done;
+    }
+
+    r64 = (uint64_t)r32 * u32 * 2;
+    /* |r*sqrt(m) - 1| < 0x1.7Bp-16; convert to 64-bit arithmetic */
+
+    mul64To128(m64, r64, &s64, &discard);
+    mul64To128(s64, r64, &d64, &discard);
+    u64 = three64 - d64;
+    mul64To128(u64, r64, &r64, &discard);
+    r64 <<= 1;
+    /* |r*sqrt(m) - 1| < 0x1.a5p-31 */
+
+    mul64To128(m64, r64, &s64, &discard);
+    mul64To128(s64, r64, &d64, &discard);
+    u64 = three64 - d64;
+    mul64To128(u64, r64, &rh, &rl);
+    add128(rh, rl, rh, rl, &rh, &rl);
+    /* |r*sqrt(m) - 1| < 0x1.c001p-59; change to 128-bit arithmetic */
+
+    mul128To256(a->frac_hi, a->frac_lo, rh, rl, &sh, &sl, &discard, &discard);
+    mul128To256(sh, sl, rh, rl, &dh, &dl, &discard, &discard);
+    sub128(three64, 0, dh, dl, &uh, &ul);
+    mul128To256(uh, ul, sh, sl, &sh, &sl, &discard, &discard);  /* 3.125 */
+    /* -0x1p-116 < s - sqrt(m) < 0x3.8001p-125 */
+
+    sub128(sh, sl, 0, 4, &sh, &sl);
+    shift128Right(sh, sl, 13, &sh, &sl);  /* 16.112 */
+    /* s < sqrt(m) < s + 1ulp */
+
+    /* Compute nearest rounded result */
+    mul64To128(sl, sl, &d0h, &d0l);
+    d0h += 2 * sh * sl;
+    sub128(a->frac_lo << 34, 0, d0h, d0l, &d0h, &d0l);
+    sub128(sh, sl, d0h, d0l, &d1h, &d1l);
+    add128(sh, sl, 0, 1, &d2h, &d2l);
+    add128(d2h, d2l, d1h, d1l, &d2h, &d2l);
+    add128(sh, sl, 0, d1h >> 63, &sh, &sl);
+    shift128Left(sh, sl, 128 - 114, &sh, &sl);
+
+    /* increment or decrement for inexact */
+    if (d2h | d2l) {
+        if ((int64_t)(d1h ^ d2h) < 0) {
+            sub128(sh, sl, 0, 1, &sh, &sl);
+        } else {
+            add128(sh, sl, 0, 1, &sh, &sl);
+        }
+    }
+    a->frac_lo = sl;
+    a->frac_hi = sh;
+
+ done:
+    /* Convert back from base 4 to base 2. */
+    a->exp >>= 1;
+    if (!(a->frac_hi & DECOMPOSED_IMPLICIT_BIT)) {
+        frac_add(a, a, a);
+    } else {
+        a->exp += 1;
+    }
+    return;
+
+ d_nan:
+    float_raise(float_flag_invalid, status);
+    parts_default_nan(a, status);
+}
+
 /*
  * Rounds the floating-point value `a' to an integer, and returns the
  * result as a floating-point value. The operation is performed
-- 
2.25.1


