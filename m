Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0710A39AD38
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:51:31 +0200 (CEST)
Received: from localhost ([::1]:55616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovFR-0002ck-Q7
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov62-0002NA-JS
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:47 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:50904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5x-00015I-JF
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:46 -0400
Received: by mail-pj1-x102e.google.com with SMTP id i22so4471032pju.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N/g7nU1jXwHYS7i47w36mxpzZE/kQjQsIkKUyVBW8ZU=;
 b=azS349mxBIsPXBB+njOgoREebbu5/nizgvZYSoxLjt9nQ8ClunTWdLYnvAJ23ylFlL
 CUO5Xr8aYmWuN1A+RgvDZWotGk9JIZR3mTK6DkR7bB8L/b3E+nKQhwTddzg1xN74Am/O
 JWUNk9EC48ecE1ZEjC+sbE4UYjR5NwD75ELBdNRR6H0I7ZTREPZz4JriR4VYi9D9z95w
 vM6zmhAFnDwwvl3gil9WENOUPCshEevR9vj8SnWvEkXVQwMqPPCw0Olg3s/HsBgrpPYm
 qdNvnfvNJiXyXKnjoGF2TG6c6AUHrCblKjGsezHZelDDWCSTgSD6sRYY+Lgz6FxfNxGT
 ceQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N/g7nU1jXwHYS7i47w36mxpzZE/kQjQsIkKUyVBW8ZU=;
 b=YVPjnGVfyOfoYZO1Bv7NLqYd8/B0Di3gt5A4+Podfe6H9e0fbP+TXibpoFhxVyloYf
 752rf4JFeOfqHJaaAUsDdNUkayqwdBdPFWAC77/z19BB4x1B+GwDkXp+a2tzxDVsEsRR
 O4afFtdn2FNxVekgNQqbM1rB7Fn5Me6NdOhpBkbY6EEtzxBXw/KdkPhqjMcpApXDC5hR
 GQUoRWWzDbB39S6HsuRLb+sj+5Cp0k+xLCfP/qAg8uPOf8OMxdn0VoHYl5yhZP47jvOJ
 m8qZv5+A166neE+6OkMad2UIa9b+cMjfcr3JVLwvCb3CVDU+epbkOHj+r4+Re9IdA/Qx
 DQZQ==
X-Gm-Message-State: AOAM530AluHh6UOjeuLVnQc8jQf/aO+XCbQTkc9nC568g1g4SYENWdk5
 ZDGx2YsfTMHjwqVM9eTcm5nxT1kCGDUS9g==
X-Google-Smtp-Source: ABdhPJz6Bg5FQhKAsC0+jqn6rfdlyrWpuuGw763ZnsP8B0QinlaSEiZr9lsX6yEeQzblFWnPCQTBKA==
X-Received: by 2002:a17:90a:4817:: with SMTP id
 a23mr13703935pjh.192.1622756499982; 
 Thu, 03 Jun 2021 14:41:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/29] softfloat: Introduce Floatx80RoundPrec
Date: Thu,  3 Jun 2021 14:41:13 -0700
Message-Id: <20210603214131.629841-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Use an enumeration instead of raw 32/64/80 values.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-helpers.h |  5 +-
 include/fpu/softfloat-types.h   | 10 +++-
 include/fpu/softfloat.h         |  4 +-
 fpu/softfloat.c                 | 32 ++++++------
 linux-user/arm/nwfpe/fpa11.c    | 41 +++++++--------
 target/i386/tcg/fpu_helper.c    | 79 +++++++++++++++++------------
 target/m68k/fpu_helper.c        | 50 +++++++++---------
 target/m68k/softfloat.c         | 90 ++++++++++++++++++++-------------
 tests/fp/fp-test.c              |  5 +-
 9 files changed, 182 insertions(+), 134 deletions(-)

diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
index 2f0674fbdd..34f4cf92ae 100644
--- a/include/fpu/softfloat-helpers.h
+++ b/include/fpu/softfloat-helpers.h
@@ -69,7 +69,7 @@ static inline void set_float_exception_flags(int val, float_status *status)
     status->float_exception_flags = val;
 }
 
-static inline void set_floatx80_rounding_precision(int val,
+static inline void set_floatx80_rounding_precision(FloatX80RoundPrec val,
                                                    float_status *status)
 {
     status->floatx80_rounding_precision = val;
@@ -120,7 +120,8 @@ static inline int get_float_exception_flags(float_status *status)
     return status->float_exception_flags;
 }
 
-static inline int get_floatx80_rounding_precision(float_status *status)
+static inline FloatX80RoundPrec
+get_floatx80_rounding_precision(float_status *status)
 {
     return status->floatx80_rounding_precision;
 }
diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 3b757c3d6a..5bcbd041f7 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -154,6 +154,14 @@ enum {
     float_flag_output_denormal = 128
 };
 
+/*
+ * Rounding precision for floatx80.
+ */
+typedef enum __attribute__((__packed__)) {
+    floatx80_precision_x,
+    floatx80_precision_d,
+    floatx80_precision_s,
+} FloatX80RoundPrec;
 
 /*
  * Floating Point Status. Individual architectures may maintain
@@ -165,7 +173,7 @@ enum {
 typedef struct float_status {
     FloatRoundMode float_rounding_mode;
     uint8_t     float_exception_flags;
-    signed char floatx80_rounding_precision;
+    FloatX80RoundPrec floatx80_rounding_precision;
     bool tininess_before_rounding;
     /* should denormalised results go to zero and set the inexact flag? */
     bool flush_to_zero;
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index ed32040aa9..ec7dca0960 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -1152,7 +1152,7 @@ floatx80 propagateFloatx80NaN(floatx80 a, floatx80 b, float_status *status);
 | Floating-Point Arithmetic.
 *----------------------------------------------------------------------------*/
 
-floatx80 roundAndPackFloatx80(int8_t roundingPrecision, bool zSign,
+floatx80 roundAndPackFloatx80(FloatX80RoundPrec roundingPrecision, bool zSign,
                               int32_t zExp, uint64_t zSig0, uint64_t zSig1,
                               float_status *status);
 
@@ -1165,7 +1165,7 @@ floatx80 roundAndPackFloatx80(int8_t roundingPrecision, bool zSign,
 | normalized.
 *----------------------------------------------------------------------------*/
 
-floatx80 normalizeRoundAndPackFloatx80(int8_t roundingPrecision,
+floatx80 normalizeRoundAndPackFloatx80(FloatX80RoundPrec roundingPrecision,
                                        bool zSign, int32_t zExp,
                                        uint64_t zSig0, uint64_t zSig1,
                                        float_status *status);
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 741480c568..b6a50e5e95 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -4342,10 +4342,10 @@ void normalizeFloatx80Subnormal(uint64_t aSig, int32_t *zExpPtr,
 | a subnormal number, and the underflow and inexact exceptions are raised if
 | the abstract input cannot be represented exactly as a subnormal extended
 | double-precision floating-point number.
-|     If `roundingPrecision' is 32 or 64, the result is rounded to the same
-| number of bits as single or double precision, respectively.  Otherwise, the
-| result is rounded to the full precision of the extended double-precision
-| format.
+|     If `roundingPrecision' is floatx80_precision_s or floatx80_precision_d,
+| the result is rounded to the same number of bits as single or double
+| precision, respectively.  Otherwise, the result is rounded to the full
+| precision of the extended double-precision format.
 |     The input significand must be normalized or smaller.  If the input
 | significand is not normalized, `zExp' must be 0; in that case, the result
 | returned is a subnormal number, and it must not require rounding.  The
@@ -4353,27 +4353,29 @@ void normalizeFloatx80Subnormal(uint64_t aSig, int32_t *zExpPtr,
 | Floating-Point Arithmetic.
 *----------------------------------------------------------------------------*/
 
-floatx80 roundAndPackFloatx80(int8_t roundingPrecision, bool zSign,
+floatx80 roundAndPackFloatx80(FloatX80RoundPrec roundingPrecision, bool zSign,
                               int32_t zExp, uint64_t zSig0, uint64_t zSig1,
                               float_status *status)
 {
-    int8_t roundingMode;
+    FloatRoundMode roundingMode;
     bool roundNearestEven, increment, isTiny;
     int64_t roundIncrement, roundMask, roundBits;
 
     roundingMode = status->float_rounding_mode;
     roundNearestEven = ( roundingMode == float_round_nearest_even );
-    if ( roundingPrecision == 80 ) goto precision80;
-    if ( roundingPrecision == 64 ) {
+    switch (roundingPrecision) {
+    case floatx80_precision_x:
+        goto precision80;
+    case floatx80_precision_d:
         roundIncrement = UINT64_C(0x0000000000000400);
         roundMask = UINT64_C(0x00000000000007FF);
-    }
-    else if ( roundingPrecision == 32 ) {
+        break;
+    case floatx80_precision_s:
         roundIncrement = UINT64_C(0x0000008000000000);
         roundMask = UINT64_C(0x000000FFFFFFFFFF);
-    }
-    else {
-        goto precision80;
+        break;
+    default:
+        g_assert_not_reached();
     }
     zSig0 |= ( zSig1 != 0 );
     switch (roundingMode) {
@@ -4550,7 +4552,7 @@ floatx80 roundAndPackFloatx80(int8_t roundingPrecision, bool zSign,
 | normalized.
 *----------------------------------------------------------------------------*/
 
-floatx80 normalizeRoundAndPackFloatx80(int8_t roundingPrecision,
+floatx80 normalizeRoundAndPackFloatx80(FloatX80RoundPrec roundingPrecision,
                                        bool zSign, int32_t zExp,
                                        uint64_t zSig0, uint64_t zSig1,
                                        float_status *status)
@@ -6203,7 +6205,7 @@ floatx80 floatx80_modrem(floatx80 a, floatx80 b, bool mod, uint64_t *quotient,
     }
     return
         normalizeRoundAndPackFloatx80(
-            80, zSign, bExp + expDiff, aSig0, aSig1, status);
+            floatx80_precision_x, zSign, bExp + expDiff, aSig0, aSig1, status);
 
 }
 
diff --git a/linux-user/arm/nwfpe/fpa11.c b/linux-user/arm/nwfpe/fpa11.c
index f6f8163eab..9a93610d24 100644
--- a/linux-user/arm/nwfpe/fpa11.c
+++ b/linux-user/arm/nwfpe/fpa11.c
@@ -97,37 +97,38 @@ void SetRoundingMode(const unsigned int opcode)
 
 void SetRoundingPrecision(const unsigned int opcode)
 {
-    int rounding_precision;
-   FPA11 *fpa11 = GET_FPA11();
+    FloatX80RoundPrec rounding_precision;
+    FPA11 *fpa11 = GET_FPA11();
 #ifdef MAINTAIN_FPCR
-   fpa11->fpcr &= ~MASK_ROUNDING_PRECISION;
+    fpa11->fpcr &= ~MASK_ROUNDING_PRECISION;
 #endif
-   switch (opcode & MASK_ROUNDING_PRECISION)
-   {
-      case ROUND_SINGLE:
-         rounding_precision = 32;
+    switch (opcode & MASK_ROUNDING_PRECISION) {
+    case ROUND_SINGLE:
+        rounding_precision = floatx80_precision_s;
 #ifdef MAINTAIN_FPCR
-         fpa11->fpcr |= ROUND_SINGLE;
+        fpa11->fpcr |= ROUND_SINGLE;
 #endif
-      break;
+        break;
 
-      case ROUND_DOUBLE:
-         rounding_precision = 64;
+    case ROUND_DOUBLE:
+        rounding_precision = floatx80_precision_d;
 #ifdef MAINTAIN_FPCR
-         fpa11->fpcr |= ROUND_DOUBLE;
+        fpa11->fpcr |= ROUND_DOUBLE;
 #endif
-      break;
+        break;
 
-      case ROUND_EXTENDED:
-         rounding_precision = 80;
+    case ROUND_EXTENDED:
+        rounding_precision = floatx80_precision_x;
 #ifdef MAINTAIN_FPCR
-         fpa11->fpcr |= ROUND_EXTENDED;
+        fpa11->fpcr |= ROUND_EXTENDED;
 #endif
-      break;
+        break;
 
-      default: rounding_precision = 80;
-  }
-   set_floatx80_rounding_precision(rounding_precision, &fpa11->fp_status);
+    default:
+        rounding_precision = floatx80_precision_x;
+        break;
+    }
+    set_floatx80_rounding_precision(rounding_precision, &fpa11->fp_status);
 }
 
 /* Emulate the instruction in the opcode. */
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 1b30f1bb73..4e11965067 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -673,38 +673,40 @@ uint32_t helper_fnstcw(CPUX86State *env)
 
 void update_fp_status(CPUX86State *env)
 {
-    int rnd_type;
+    FloatRoundMode rnd_mode;
+    FloatX80RoundPrec rnd_prec;
 
     /* set rounding mode */
     switch (env->fpuc & FPU_RC_MASK) {
     default:
     case FPU_RC_NEAR:
-        rnd_type = float_round_nearest_even;
+        rnd_mode = float_round_nearest_even;
         break;
     case FPU_RC_DOWN:
-        rnd_type = float_round_down;
+        rnd_mode = float_round_down;
         break;
     case FPU_RC_UP:
-        rnd_type = float_round_up;
+        rnd_mode = float_round_up;
         break;
     case FPU_RC_CHOP:
-        rnd_type = float_round_to_zero;
+        rnd_mode = float_round_to_zero;
         break;
     }
-    set_float_rounding_mode(rnd_type, &env->fp_status);
+    set_float_rounding_mode(rnd_mode, &env->fp_status);
+
     switch ((env->fpuc >> 8) & 3) {
     case 0:
-        rnd_type = 32;
+        rnd_prec = floatx80_precision_s;
         break;
     case 2:
-        rnd_type = 64;
+        rnd_prec = floatx80_precision_d;
         break;
     case 3:
     default:
-        rnd_type = 80;
+        rnd_prec = floatx80_precision_x;
         break;
     }
-    set_floatx80_rounding_precision(rnd_type, &env->fp_status);
+    set_floatx80_rounding_precision(rnd_prec, &env->fp_status);
 }
 
 void helper_fldcw(CPUX86State *env, uint32_t val)
@@ -1074,7 +1076,8 @@ void helper_f2xm1(CPUX86State *env)
                             &sig2);
             /* This result is inexact.  */
             sig1 |= 1;
-            ST0 = normalizeRoundAndPackFloatx80(80, sign, exp, sig0, sig1,
+            ST0 = normalizeRoundAndPackFloatx80(floatx80_precision_x,
+                                                sign, exp, sig0, sig1,
                                                 &env->fp_status);
         }
     } else {
@@ -1083,9 +1086,10 @@ void helper_f2xm1(CPUX86State *env)
         int32_t n, aexp, bexp;
         uint64_t asig0, asig1, asig2, bsig0, bsig1;
         FloatRoundMode save_mode = env->fp_status.float_rounding_mode;
-        signed char save_prec = env->fp_status.floatx80_rounding_precision;
+        FloatX80RoundPrec save_prec =
+            env->fp_status.floatx80_rounding_precision;
         env->fp_status.float_rounding_mode = float_round_nearest_even;
-        env->fp_status.floatx80_rounding_precision = 80;
+        env->fp_status.floatx80_rounding_precision = floatx80_precision_x;
 
         /* Find the nearest multiple of 1/32 to the argument.  */
         tmp = floatx80_scalbn(ST0, 5, &env->fp_status);
@@ -1183,7 +1187,8 @@ void helper_f2xm1(CPUX86State *env)
             env->fp_status.float_rounding_mode = save_mode;
             /* This result is inexact.  */
             asig1 |= 1;
-            ST0 = normalizeRoundAndPackFloatx80(80, asign, aexp, asig0, asig1,
+            ST0 = normalizeRoundAndPackFloatx80(floatx80_precision_x,
+                                                asign, aexp, asig0, asig1,
                                                 &env->fp_status);
         }
 
@@ -1301,8 +1306,9 @@ void helper_fpatan(CPUX86State *env)
          * division is exact, the result of fpatan is still inexact
          * (and underflowing where appropriate).
          */
-        signed char save_prec = env->fp_status.floatx80_rounding_precision;
-        env->fp_status.floatx80_rounding_precision = 80;
+        FloatX80RoundPrec save_prec =
+            env->fp_status.floatx80_rounding_precision;
+        env->fp_status.floatx80_rounding_precision = floatx80_precision_x;
         ST1 = floatx80_div(ST1, ST0, &env->fp_status);
         env->fp_status.floatx80_rounding_precision = save_prec;
         if (!floatx80_is_zero(ST1) &&
@@ -1321,7 +1327,8 @@ void helper_fpatan(CPUX86State *env)
             if (exp == 0) {
                 normalizeFloatx80Subnormal(sig, &exp, &sig);
             }
-            ST1 = normalizeRoundAndPackFloatx80(80, sign, exp, sig - 1,
+            ST1 = normalizeRoundAndPackFloatx80(floatx80_precision_x,
+                                                sign, exp, sig - 1,
                                                 -1, &env->fp_status);
         }
     } else {
@@ -1377,9 +1384,10 @@ void helper_fpatan(CPUX86State *env)
             uint64_t azsig2, azsig3, axsig0, axsig1;
             floatx80 x8;
             FloatRoundMode save_mode = env->fp_status.float_rounding_mode;
-            signed char save_prec = env->fp_status.floatx80_rounding_precision;
+            FloatX80RoundPrec save_prec =
+                env->fp_status.floatx80_rounding_precision;
             env->fp_status.float_rounding_mode = float_round_nearest_even;
-            env->fp_status.floatx80_rounding_precision = 80;
+            env->fp_status.floatx80_rounding_precision = floatx80_precision_x;
 
             if (arg0_exp == 0) {
                 normalizeFloatx80Subnormal(arg0_sig, &arg0_exp, &arg0_sig);
@@ -1448,7 +1456,8 @@ void helper_fpatan(CPUX86State *env)
              * Split x as x = t + y, where t = n/8 is the nearest
              * multiple of 1/8 to x.
              */
-            x8 = normalizeRoundAndPackFloatx80(80, false, xexp + 3, xsig0,
+            x8 = normalizeRoundAndPackFloatx80(floatx80_precision_x,
+                                               false, xexp + 3, xsig0,
                                                xsig1, &env->fp_status);
             n = floatx80_to_int32(x8, &env->fp_status);
             if (n == 0) {
@@ -1569,7 +1578,7 @@ void helper_fpatan(CPUX86State *env)
                 /* Compute z^2.  */
                 mul128To256(zsig0, zsig1, zsig0, zsig1,
                             &z2sig0, &z2sig1, &z2sig2, &z2sig3);
-                z2 = normalizeRoundAndPackFloatx80(80, false,
+                z2 = normalizeRoundAndPackFloatx80(floatx80_precision_x, false,
                                                    zexp + zexp - 0x3ffe,
                                                    z2sig0, z2sig1,
                                                    &env->fp_status);
@@ -1689,7 +1698,7 @@ void helper_fpatan(CPUX86State *env)
         }
         /* This result is inexact.  */
         rsig1 |= 1;
-        ST1 = normalizeRoundAndPackFloatx80(80, rsign, rexp,
+        ST1 = normalizeRoundAndPackFloatx80(floatx80_precision_x, rsign, rexp,
                                             rsig0, rsig1, &env->fp_status);
     }
 
@@ -1890,7 +1899,8 @@ static void helper_fyl2x_common(CPUX86State *env, floatx80 arg, int32_t *exp,
      */
     mul128To256(tsig0, tsig1, tsig0, tsig1,
                 &t2sig0, &t2sig1, &t2sig2, &t2sig3);
-    t2 = normalizeRoundAndPackFloatx80(80, false, texp + texp - 0x3ffe,
+    t2 = normalizeRoundAndPackFloatx80(floatx80_precision_x, false,
+                                       texp + texp - 0x3ffe,
                                        t2sig0, t2sig1, &env->fp_status);
 
     /* Compute the lower parts of the polynomial expansion.  */
@@ -2004,15 +2014,17 @@ void helper_fyl2xp1(CPUX86State *env)
         exp += arg1_exp - 0x3ffe;
         /* This result is inexact.  */
         sig1 |= 1;
-        ST1 = normalizeRoundAndPackFloatx80(80, arg0_sign ^ arg1_sign, exp,
+        ST1 = normalizeRoundAndPackFloatx80(floatx80_precision_x,
+                                            arg0_sign ^ arg1_sign, exp,
                                             sig0, sig1, &env->fp_status);
     } else {
         int32_t aexp;
         uint64_t asig0, asig1, asig2;
         FloatRoundMode save_mode = env->fp_status.float_rounding_mode;
-        signed char save_prec = env->fp_status.floatx80_rounding_precision;
+        FloatX80RoundPrec save_prec =
+            env->fp_status.floatx80_rounding_precision;
         env->fp_status.float_rounding_mode = float_round_nearest_even;
-        env->fp_status.floatx80_rounding_precision = 80;
+        env->fp_status.floatx80_rounding_precision = floatx80_precision_x;
 
         helper_fyl2x_common(env, ST0, &aexp, &asig0, &asig1);
         /*
@@ -2027,7 +2039,8 @@ void helper_fyl2xp1(CPUX86State *env)
         /* This result is inexact.  */
         asig1 |= 1;
         env->fp_status.float_rounding_mode = save_mode;
-        ST1 = normalizeRoundAndPackFloatx80(80, arg0_sign ^ arg1_sign, aexp,
+        ST1 = normalizeRoundAndPackFloatx80(floatx80_precision_x,
+                                            arg0_sign ^ arg1_sign, aexp,
                                             asig0, asig1, &env->fp_status);
         env->fp_status.floatx80_rounding_precision = save_prec;
     }
@@ -2111,9 +2124,10 @@ void helper_fyl2x(CPUX86State *env)
         int32_t int_exp;
         floatx80 arg0_m1;
         FloatRoundMode save_mode = env->fp_status.float_rounding_mode;
-        signed char save_prec = env->fp_status.floatx80_rounding_precision;
+        FloatX80RoundPrec save_prec =
+            env->fp_status.floatx80_rounding_precision;
         env->fp_status.float_rounding_mode = float_round_nearest_even;
-        env->fp_status.floatx80_rounding_precision = 80;
+        env->fp_status.floatx80_rounding_precision = floatx80_precision_x;
 
         if (arg0_exp == 0) {
             normalizeFloatx80Subnormal(arg0_sig, &arg0_exp, &arg0_sig);
@@ -2170,7 +2184,8 @@ void helper_fyl2x(CPUX86State *env)
             /* This result is inexact.  */
             asig1 |= 1;
             env->fp_status.float_rounding_mode = save_mode;
-            ST1 = normalizeRoundAndPackFloatx80(80, asign ^ arg1_sign, aexp,
+            ST1 = normalizeRoundAndPackFloatx80(floatx80_precision_x,
+                                                asign ^ arg1_sign, aexp,
                                                 asig0, asig1, &env->fp_status);
         }
 
@@ -2252,12 +2267,12 @@ void helper_fscale(CPUX86State *env)
         }
     } else {
         int n;
-        signed char save = env->fp_status.floatx80_rounding_precision;
+        FloatX80RoundPrec save = env->fp_status.floatx80_rounding_precision;
         uint8_t save_flags = get_float_exception_flags(&env->fp_status);
         set_float_exception_flags(0, &env->fp_status);
         n = floatx80_to_int32_round_to_zero(ST1, &env->fp_status);
         set_float_exception_flags(save_flags, &env->fp_status);
-        env->fp_status.floatx80_rounding_precision = 80;
+        env->fp_status.floatx80_rounding_precision = floatx80_precision_x;
         ST0 = floatx80_scalbn(ST0, n, &env->fp_status);
         env->fp_status.floatx80_rounding_precision = save;
     }
diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index 797000e748..fdc4937e29 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -94,13 +94,13 @@ static void m68k_restore_precision_mode(CPUM68KState *env)
 {
     switch (env->fpcr & FPCR_PREC_MASK) {
     case FPCR_PREC_X: /* extended */
-        set_floatx80_rounding_precision(80, &env->fp_status);
+        set_floatx80_rounding_precision(floatx80_precision_x, &env->fp_status);
         break;
     case FPCR_PREC_S: /* single */
-        set_floatx80_rounding_precision(32, &env->fp_status);
+        set_floatx80_rounding_precision(floatx80_precision_s, &env->fp_status);
         break;
     case FPCR_PREC_D: /* double */
-        set_floatx80_rounding_precision(64, &env->fp_status);
+        set_floatx80_rounding_precision(floatx80_precision_d, &env->fp_status);
         break;
     case FPCR_PREC_U: /* undefined */
     default:
@@ -111,9 +111,9 @@ static void m68k_restore_precision_mode(CPUM68KState *env)
 static void cf_restore_precision_mode(CPUM68KState *env)
 {
     if (env->fpcr & FPCR_PREC_S) { /* single */
-        set_floatx80_rounding_precision(32, &env->fp_status);
+        set_floatx80_rounding_precision(floatx80_precision_s, &env->fp_status);
     } else { /* double */
-        set_floatx80_rounding_precision(64, &env->fp_status);
+        set_floatx80_rounding_precision(floatx80_precision_d, &env->fp_status);
     }
 }
 
@@ -166,8 +166,8 @@ void HELPER(set_fpcr)(CPUM68KState *env, uint32_t val)
 
 #define PREC_BEGIN(prec)                                        \
     do {                                                        \
-        int old;                                                \
-        old = get_floatx80_rounding_precision(&env->fp_status); \
+        FloatX80RoundPrec old =                                 \
+            get_floatx80_rounding_precision(&env->fp_status);   \
         set_floatx80_rounding_precision(prec, &env->fp_status)  \
 
 #define PREC_END()                                              \
@@ -176,14 +176,14 @@ void HELPER(set_fpcr)(CPUM68KState *env, uint32_t val)
 
 void HELPER(fsround)(CPUM68KState *env, FPReg *res, FPReg *val)
 {
-    PREC_BEGIN(32);
+    PREC_BEGIN(floatx80_precision_s);
     res->d = floatx80_round(val->d, &env->fp_status);
     PREC_END();
 }
 
 void HELPER(fdround)(CPUM68KState *env, FPReg *res, FPReg *val)
 {
-    PREC_BEGIN(64);
+    PREC_BEGIN(floatx80_precision_d);
     res->d = floatx80_round(val->d, &env->fp_status);
     PREC_END();
 }
@@ -195,14 +195,14 @@ void HELPER(fsqrt)(CPUM68KState *env, FPReg *res, FPReg *val)
 
 void HELPER(fssqrt)(CPUM68KState *env, FPReg *res, FPReg *val)
 {
-    PREC_BEGIN(32);
+    PREC_BEGIN(floatx80_precision_s);
     res->d = floatx80_sqrt(val->d, &env->fp_status);
     PREC_END();
 }
 
 void HELPER(fdsqrt)(CPUM68KState *env, FPReg *res, FPReg *val)
 {
-    PREC_BEGIN(64);
+    PREC_BEGIN(floatx80_precision_d);
     res->d = floatx80_sqrt(val->d, &env->fp_status);
     PREC_END();
 }
@@ -214,14 +214,14 @@ void HELPER(fabs)(CPUM68KState *env, FPReg *res, FPReg *val)
 
 void HELPER(fsabs)(CPUM68KState *env, FPReg *res, FPReg *val)
 {
-    PREC_BEGIN(32);
+    PREC_BEGIN(floatx80_precision_s);
     res->d = floatx80_round(floatx80_abs(val->d), &env->fp_status);
     PREC_END();
 }
 
 void HELPER(fdabs)(CPUM68KState *env, FPReg *res, FPReg *val)
 {
-    PREC_BEGIN(64);
+    PREC_BEGIN(floatx80_precision_d);
     res->d = floatx80_round(floatx80_abs(val->d), &env->fp_status);
     PREC_END();
 }
@@ -233,14 +233,14 @@ void HELPER(fneg)(CPUM68KState *env, FPReg *res, FPReg *val)
 
 void HELPER(fsneg)(CPUM68KState *env, FPReg *res, FPReg *val)
 {
-    PREC_BEGIN(32);
+    PREC_BEGIN(floatx80_precision_s);
     res->d = floatx80_round(floatx80_chs(val->d), &env->fp_status);
     PREC_END();
 }
 
 void HELPER(fdneg)(CPUM68KState *env, FPReg *res, FPReg *val)
 {
-    PREC_BEGIN(64);
+    PREC_BEGIN(floatx80_precision_d);
     res->d = floatx80_round(floatx80_chs(val->d), &env->fp_status);
     PREC_END();
 }
@@ -252,14 +252,14 @@ void HELPER(fadd)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 
 void HELPER(fsadd)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
-    PREC_BEGIN(32);
+    PREC_BEGIN(floatx80_precision_s);
     res->d = floatx80_add(val0->d, val1->d, &env->fp_status);
     PREC_END();
 }
 
 void HELPER(fdadd)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
-    PREC_BEGIN(64);
+    PREC_BEGIN(floatx80_precision_d);
     res->d = floatx80_add(val0->d, val1->d, &env->fp_status);
     PREC_END();
 }
@@ -271,14 +271,14 @@ void HELPER(fsub)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 
 void HELPER(fssub)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
-    PREC_BEGIN(32);
+    PREC_BEGIN(floatx80_precision_s);
     res->d = floatx80_sub(val1->d, val0->d, &env->fp_status);
     PREC_END();
 }
 
 void HELPER(fdsub)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
-    PREC_BEGIN(64);
+    PREC_BEGIN(floatx80_precision_d);
     res->d = floatx80_sub(val1->d, val0->d, &env->fp_status);
     PREC_END();
 }
@@ -290,14 +290,14 @@ void HELPER(fmul)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 
 void HELPER(fsmul)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
-    PREC_BEGIN(32);
+    PREC_BEGIN(floatx80_precision_s);
     res->d = floatx80_mul(val0->d, val1->d, &env->fp_status);
     PREC_END();
 }
 
 void HELPER(fdmul)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
-    PREC_BEGIN(64);
+    PREC_BEGIN(floatx80_precision_d);
     res->d = floatx80_mul(val0->d, val1->d, &env->fp_status);
     PREC_END();
 }
@@ -307,7 +307,7 @@ void HELPER(fsglmul)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
     FloatRoundMode rounding_mode = get_float_rounding_mode(&env->fp_status);
     floatx80 a, b;
 
-    PREC_BEGIN(32);
+    PREC_BEGIN(floatx80_precision_s);
     set_float_rounding_mode(float_round_to_zero, &env->fp_status);
     a = floatx80_round(val0->d, &env->fp_status);
     b = floatx80_round(val1->d, &env->fp_status);
@@ -323,14 +323,14 @@ void HELPER(fdiv)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 
 void HELPER(fsdiv)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
-    PREC_BEGIN(32);
+    PREC_BEGIN(floatx80_precision_s);
     res->d = floatx80_div(val1->d, val0->d, &env->fp_status);
     PREC_END();
 }
 
 void HELPER(fddiv)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
-    PREC_BEGIN(64);
+    PREC_BEGIN(floatx80_precision_d);
     res->d = floatx80_div(val1->d, val0->d, &env->fp_status);
     PREC_END();
 }
@@ -340,7 +340,7 @@ void HELPER(fsgldiv)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
     FloatRoundMode rounding_mode = get_float_rounding_mode(&env->fp_status);
     floatx80 a, b;
 
-    PREC_BEGIN(32);
+    PREC_BEGIN(floatx80_precision_s);
     set_float_rounding_mode(float_round_to_zero, &env->fp_status);
     a = floatx80_round(val1->d, &env->fp_status);
     b = floatx80_round(val0->d, &env->fp_status);
diff --git a/target/m68k/softfloat.c b/target/m68k/softfloat.c
index b6d0ed7acf..02dcc03d15 100644
--- a/target/m68k/softfloat.c
+++ b/target/m68k/softfloat.c
@@ -227,7 +227,8 @@ floatx80 floatx80_lognp1(floatx80 a, float_status *status)
     int32_t aExp;
     uint64_t aSig, fSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact, j, k;
     floatx80 fp0, fp1, fp2, fp3, f, logof2, klog2, saveu;
@@ -270,7 +271,7 @@ floatx80 floatx80_lognp1(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     compact = floatx80_make_compact(aExp, aSig);
 
@@ -426,7 +427,8 @@ floatx80 floatx80_logn(floatx80 a, float_status *status)
     int32_t aExp;
     uint64_t aSig, fSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact, j, k, adjk;
     floatx80 fp0, fp1, fp2, fp3, f, logof2, klog2, saveu;
@@ -469,7 +471,7 @@ floatx80 floatx80_logn(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     compact = floatx80_make_compact(aExp, aSig);
 
@@ -594,7 +596,8 @@ floatx80 floatx80_log10(floatx80 a, float_status *status)
     int32_t aExp;
     uint64_t aSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     floatx80 fp0, fp1;
 
@@ -626,7 +629,7 @@ floatx80 floatx80_log10(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     fp0 = floatx80_logn(a, status);
     fp1 = packFloatx80(0, 0x3FFD, UINT64_C(0xDE5BD8A937287195)); /* INV_L10 */
@@ -651,7 +654,8 @@ floatx80 floatx80_log2(floatx80 a, float_status *status)
     int32_t aExp;
     uint64_t aSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     floatx80 fp0, fp1;
 
@@ -686,7 +690,7 @@ floatx80 floatx80_log2(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     if (aSig == one_sig) { /* X is 2^k */
         status->float_rounding_mode = user_rnd_mode;
@@ -718,7 +722,8 @@ floatx80 floatx80_etox(floatx80 a, float_status *status)
     int32_t aExp;
     uint64_t aSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact, n, j, k, m, m1;
     floatx80 fp0, fp1, fp2, fp3, l2, scale, adjscale;
@@ -746,7 +751,7 @@ floatx80 floatx80_etox(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     adjflag = 0;
 
@@ -902,7 +907,8 @@ floatx80 floatx80_twotox(floatx80 a, float_status *status)
     int32_t aExp;
     uint64_t aSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact, n, j, l, m, m1;
     floatx80 fp0, fp1, fp2, fp3, adjfact, fact1, fact2;
@@ -929,7 +935,7 @@ floatx80 floatx80_twotox(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     fp0 = a;
 
@@ -1052,7 +1058,8 @@ floatx80 floatx80_tentox(floatx80 a, float_status *status)
     int32_t aExp;
     uint64_t aSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact, n, j, l, m, m1;
     floatx80 fp0, fp1, fp2, fp3, adjfact, fact1, fact2;
@@ -1079,7 +1086,7 @@ floatx80 floatx80_tentox(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     fp0 = a;
 
@@ -1207,7 +1214,8 @@ floatx80 floatx80_tan(floatx80 a, float_status *status)
     int32_t aExp, xExp;
     uint64_t aSig, xSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact, l, n, j;
     floatx80 fp0, fp1, fp2, fp3, fp4, fp5, invtwopi, twopi1, twopi2;
@@ -1233,7 +1241,7 @@ floatx80 floatx80_tan(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     compact = floatx80_make_compact(aExp, aSig);
 
@@ -1417,7 +1425,8 @@ floatx80 floatx80_sin(floatx80 a, float_status *status)
     int32_t aExp, xExp;
     uint64_t aSig, xSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact, l, n, j;
     floatx80 fp0, fp1, fp2, fp3, fp4, fp5, x, invtwopi, twopi1, twopi2;
@@ -1443,7 +1452,7 @@ floatx80 floatx80_sin(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     compact = floatx80_make_compact(aExp, aSig);
 
@@ -1656,7 +1665,8 @@ floatx80 floatx80_cos(floatx80 a, float_status *status)
     int32_t aExp, xExp;
     uint64_t aSig, xSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact, l, n, j;
     floatx80 fp0, fp1, fp2, fp3, fp4, fp5, x, invtwopi, twopi1, twopi2;
@@ -1682,7 +1692,7 @@ floatx80 floatx80_cos(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     compact = floatx80_make_compact(aExp, aSig);
 
@@ -1893,7 +1903,8 @@ floatx80 floatx80_atan(floatx80 a, float_status *status)
     int32_t aExp;
     uint64_t aSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact, tbl_index;
     floatx80 fp0, fp1, fp2, fp3, xsave;
@@ -1920,7 +1931,7 @@ floatx80 floatx80_atan(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     if (compact < 0x3FFB8000 || compact > 0x4002FFFF) {
         /* |X| >= 16 or |X| < 1/16 */
@@ -2090,7 +2101,8 @@ floatx80 floatx80_asin(floatx80 a, float_status *status)
     int32_t aExp;
     uint64_t aSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact;
     floatx80 fp0, fp1, fp2, one;
@@ -2124,7 +2136,7 @@ floatx80 floatx80_asin(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     one = packFloatx80(0, one_exp, one_sig);
     fp0 = a;
@@ -2155,7 +2167,8 @@ floatx80 floatx80_acos(floatx80 a, float_status *status)
     int32_t aExp;
     uint64_t aSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact;
     floatx80 fp0, fp1, one;
@@ -2193,7 +2206,7 @@ floatx80 floatx80_acos(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     one = packFloatx80(0, one_exp, one_sig);
     fp0 = a;
@@ -2224,7 +2237,8 @@ floatx80 floatx80_atanh(floatx80 a, float_status *status)
     int32_t aExp;
     uint64_t aSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact;
     floatx80 fp0, fp1, fp2, one;
@@ -2257,7 +2271,7 @@ floatx80 floatx80_atanh(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     one = packFloatx80(0, one_exp, one_sig);
     fp2 = packFloatx80(aSign, 0x3FFE, one_sig); /* SIGN(X) * (1/2) */
@@ -2289,7 +2303,8 @@ floatx80 floatx80_etoxm1(floatx80 a, float_status *status)
     int32_t aExp;
     uint64_t aSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact, n, j, m, m1;
     floatx80 fp0, fp1, fp2, fp3, l2, sc, onebysc;
@@ -2316,7 +2331,7 @@ floatx80 floatx80_etoxm1(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     if (aExp >= 0x3FFD) { /* |X| >= 1/4 */
         compact = floatx80_make_compact(aExp, aSig);
@@ -2541,7 +2556,8 @@ floatx80 floatx80_tanh(floatx80 a, float_status *status)
     int32_t aExp, vExp;
     uint64_t aSig, vSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact;
     floatx80 fp0, fp1;
@@ -2565,7 +2581,7 @@ floatx80 floatx80_tanh(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     compact = floatx80_make_compact(aExp, aSig);
 
@@ -2656,7 +2672,8 @@ floatx80 floatx80_sinh(floatx80 a, float_status *status)
     int32_t aExp;
     uint64_t aSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact;
     floatx80 fp0, fp1, fp2;
@@ -2681,7 +2698,7 @@ floatx80 floatx80_sinh(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     compact = floatx80_make_compact(aExp, aSig);
 
@@ -2744,7 +2761,8 @@ floatx80 floatx80_cosh(floatx80 a, float_status *status)
     int32_t aExp;
     uint64_t aSig;
 
-    int8_t user_rnd_mode, user_rnd_prec;
+    FloatRoundMode user_rnd_mode;
+    FloatX80RoundPrec user_rnd_prec;
 
     int32_t compact;
     floatx80 fp0, fp1;
@@ -2767,7 +2785,7 @@ floatx80 floatx80_cosh(floatx80 a, float_status *status)
     user_rnd_mode = status->float_rounding_mode;
     user_rnd_prec = status->floatx80_rounding_precision;
     status->float_rounding_mode = float_round_nearest_even;
-    status->floatx80_rounding_precision = 80;
+    status->floatx80_rounding_precision = floatx80_precision_x;
 
     compact = floatx80_make_compact(aExp, aSig);
 
diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index ff131afbde..1be3a9788a 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -963,18 +963,21 @@ static void QEMU_NORETURN run_test(void)
             verCases_usesExact = !!(attrs & FUNC_ARG_EXACT);
 
             for (k = 0; k < 3; k++) {
+                FloatX80RoundPrec qsf_prec80 = floatx80_precision_s;
                 int prec80 = 32;
                 int l;
 
                 if (k == 1) {
                     prec80 = 64;
+                    qsf_prec80 = floatx80_precision_d;
                 } else if (k == 2) {
                     prec80 = 80;
+                    qsf_prec80 = floatx80_precision_x;
                 }
 
                 verCases_roundingPrecision = 0;
                 slow_extF80_roundingPrecision = prec80;
-                qsf.floatx80_rounding_precision = prec80;
+                qsf.floatx80_rounding_precision = qsf_prec80;
 
                 if (attrs & FUNC_EFF_ROUNDINGPRECISION) {
                     verCases_roundingPrecision = prec80;
-- 
2.25.1


