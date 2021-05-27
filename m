Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E043925F9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:16:16 +0200 (CEST)
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7RP-0004HZ-MP
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PP-0001Yb-Ep
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:12 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PM-0007A3-Hv
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:11 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 ne24-20020a17090b3758b029015f2dafecb0so1593640pjb.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 21:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l7C6tS9XhSbsAFvRiiUPAt7TYUWb/CAkxQde5RCfZGI=;
 b=kTO33F8H6UUuBkXWa9om7KdmjxscNDLHmOIWTtxx2D6kf44Ii9V3yfLkKUSRfJCgJz
 eC0DMIrWwdDXogFfGO4zJFw4jEHODsRWUMybyjhlDDIQ5DYUujoZhNKb6dB/YM5QAFDY
 x6/vmcdvzdpbUrag5BLvc1gLyg1dgkj09aaNBECMqJnxL2+xy9FMVYWKhdeuiwxMFio8
 CV342hYxKrNHbZ/R1vTwmAJXuusDQtH33bXgUW8H4ge9iqQ7rqRaxSlvulUtjehDEuKy
 YDBZwN3IY9/fAhLjLAM+Dh/Nv/f9xvsW/Ozwcr5Dhg1OUo9gYjjsWlv488vUiwecfk5a
 Tjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l7C6tS9XhSbsAFvRiiUPAt7TYUWb/CAkxQde5RCfZGI=;
 b=hryQLn+T9ZxLPpqu1z/UDvvPDeLt7ux1VOOvJRppke1pI8hwXg+MH63tqHp+LRqHt9
 3xAsPT1LG86EB/p+5SK2NOqLpf93jhtKFvawRMny4PSwbzlEcu84ZPXR9Rq6qAUcaGIc
 qEM5P+/aKLk50bQEvF30+PftvElLc8veja5nznygOQdrPXcmnc2CS6uXT+6rKk7yITsr
 90Pewb83pXvRuvP7NJoWRM6DAtEReztSA1c2WE8wbYs5+9ps0fU6s1Dc0CbciBwOhs4n
 1m8lh/Zi7qX767HBSlDNV39k82RcqosNCHj3RtsNMR1+5Q/PaTTF4EdgYJie2/jcbDX1
 Lkig==
X-Gm-Message-State: AOAM532LwBMOKAegZAIBxLABdfB8TD9bLapQ8QlrtVG+smCJeJY6968k
 rv7jf+isrgR3XKjel4T+WJF8VyKkDnoZ6g==
X-Google-Smtp-Source: ABdhPJyN2I5sesFHEdg7YLA0LEPyWYTCAzdZ1MUl9gGgzGqxReRZrKlm5pZTu3VRLHZfqVy3YpNkiA==
X-Received: by 2002:a17:90a:8d82:: with SMTP id
 d2mr1674317pjo.200.1622088847082; 
 Wed, 26 May 2021 21:14:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id s1sm605959pfc.6.2021.05.26.21.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 21:14:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] softfloat: Rename float_flag_input_denormal to
 float_flag_iflush_denormal
Date: Wed, 26 May 2021 21:13:55 -0700
Message-Id: <20210527041405.391567-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527041405.391567-1-richard.henderson@linaro.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: alex.bennee@linaro.org, mmorrell@tachyum.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new name emphasizes that the input denormal has been flushed to zero.

Patch created mechanically using:
  sed -i s,float_flag_input_denormal,float_flag_iflush_denormal,g \
    $(git grep -l float_flag_input_denormal)

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h |  2 +-
 fpu/softfloat.c               |  4 ++--
 target/arm/sve_helper.c       |  6 +++---
 target/arm/vfp_helper.c       | 10 +++++-----
 target/i386/tcg/fpu_helper.c  |  6 +++---
 target/mips/tcg/msa_helper.c  |  2 +-
 target/rx/op_helper.c         |  2 +-
 fpu/softfloat-parts.c.inc     |  2 +-
 8 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 1f83378c20..719b4d2531 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -148,7 +148,7 @@ enum {
     float_flag_overflow  =  8,
     float_flag_underflow = 16,
     float_flag_inexact   = 32,
-    float_flag_input_denormal = 64,
+    float_flag_iflush_denormal = 64,
     float_flag_output_denormal = 128
 };
 
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 79b2205070..fa3a691a5a 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -132,7 +132,7 @@ this code that are retained.
         if (unlikely(soft_t ## _is_denormal(*a))) {                     \
             *a = soft_t ## _set_sign(soft_t ## _zero,                   \
                                      soft_t ## _is_neg(*a));            \
-            float_raise(float_flag_input_denormal, s);                  \
+            float_raise(float_flag_iflush_denormal, s);                  \
         }                                                               \
     }
 
@@ -4441,7 +4441,7 @@ float128 float128_silence_nan(float128 a, float_status *status)
 static bool parts_squash_denormal(FloatParts64 p, float_status *status)
 {
     if (p.exp == 0 && p.frac != 0) {
-        float_raise(float_flag_input_denormal, status);
+        float_raise(float_flag_iflush_denormal, status);
         return true;
     }
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 40af3024df..16b055a34f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4774,7 +4774,7 @@ static int16_t do_float16_logb_as_int(float16 a, float_status *s)
                 return -15 - clz32(frac);
             }
             /* flush to zero */
-            float_raise(float_flag_input_denormal, s);
+            float_raise(float_flag_iflush_denormal, s);
         }
     } else if (unlikely(exp == 0x1f)) {
         if (frac == 0) {
@@ -4802,7 +4802,7 @@ static int32_t do_float32_logb_as_int(float32 a, float_status *s)
                 return -127 - clz32(frac);
             }
             /* flush to zero */
-            float_raise(float_flag_input_denormal, s);
+            float_raise(float_flag_iflush_denormal, s);
         }
     } else if (unlikely(exp == 0xff)) {
         if (frac == 0) {
@@ -4830,7 +4830,7 @@ static int64_t do_float64_logb_as_int(float64 a, float_status *s)
                 return -1023 - clz64(frac);
             }
             /* flush to zero */
-            float_raise(float_flag_input_denormal, s);
+            float_raise(float_flag_iflush_denormal, s);
         }
     } else if (unlikely(exp == 0x7ff)) {
         if (frac == 0) {
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 01b9d8557f..0a43ccc6fa 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -52,7 +52,7 @@ static inline int vfp_exceptbits_from_host(int host_bits)
     if (host_bits & float_flag_inexact) {
         target_bits |= 0x10;
     }
-    if (host_bits & float_flag_input_denormal) {
+    if (host_bits & float_flag_iflush_denormal) {
         target_bits |= 0x80;
     }
     return target_bits;
@@ -79,7 +79,7 @@ static inline int vfp_exceptbits_to_host(int target_bits)
         host_bits |= float_flag_inexact;
     }
     if (target_bits & 0x80) {
-        host_bits |= float_flag_input_denormal;
+        host_bits |= float_flag_iflush_denormal;
     }
     return host_bits;
 }
@@ -92,9 +92,9 @@ static uint32_t vfp_get_fpscr_from_host(CPUARMState *env)
     i |= get_float_exception_flags(&env->vfp.standard_fp_status);
     /* FZ16 does not generate an input denormal exception.  */
     i |= (get_float_exception_flags(&env->vfp.fp_status_f16)
-          & ~float_flag_input_denormal);
+          & ~float_flag_iflush_denormal);
     i |= (get_float_exception_flags(&env->vfp.standard_fp_status_f16)
-          & ~float_flag_input_denormal);
+          & ~float_flag_iflush_denormal);
     return vfp_exceptbits_from_host(i);
 }
 
@@ -1124,7 +1124,7 @@ uint64_t HELPER(fjcvtzs)(float64 value, void *vstatus)
         inexact = sign;
         if (frac != 0) {
             if (status->flush_inputs_to_zero) {
-                float_raise(float_flag_input_denormal, status);
+                float_raise(float_flag_iflush_denormal, status);
             } else {
                 float_raise(float_flag_inexact, status);
                 inexact = 1;
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 4e11965067..c402daf659 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -148,7 +148,7 @@ static void merge_exception_flags(CPUX86State *env, uint8_t old_flags)
                        (new_flags & float_flag_overflow ? FPUS_OE : 0) |
                        (new_flags & float_flag_underflow ? FPUS_UE : 0) |
                        (new_flags & float_flag_inexact ? FPUS_PE : 0) |
-                       (new_flags & float_flag_input_denormal ? FPUS_DE : 0)));
+                       (new_flags & float_flag_iflush_denormal ? FPUS_DE : 0)));
 }
 
 static inline floatx80 helper_fdiv(CPUX86State *env, floatx80 a, floatx80 b)
@@ -1742,7 +1742,7 @@ void helper_fxtract(CPUX86State *env)
             int shift = clz64(temp.l.lower);
             temp.l.lower <<= shift;
             expdif = 1 - EXPBIAS - shift;
-            float_raise(float_flag_input_denormal, &env->fp_status);
+            float_raise(float_flag_iflush_denormal, &env->fp_status);
         } else {
             expdif = EXPD(temp) - EXPBIAS;
         }
@@ -2991,7 +2991,7 @@ void update_mxcsr_from_sse_status(CPUX86State *env)
     uint8_t flags = get_float_exception_flags(&env->sse_status);
     /*
      * The MXCSR denormal flag has opposite semantics to
-     * float_flag_input_denormal (the softfloat code sets that flag
+     * float_flag_iflush_denormal (the softfloat code sets that flag
      * only when flushing input denormals to zero, but SSE sets it
      * only when not flushing them to zero), so is not converted
      * here.
diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 04af54f66d..992d348aa3 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -6230,7 +6230,7 @@ static inline int update_msacsr(CPUMIPSState *env, int action, int denormal)
     enable = GET_FP_ENABLE(env->active_tc.msacsr) | FP_UNIMPLEMENTED;
 
     /* Set Inexact (I) when flushing inputs to zero */
-    if ((ieee_exception_flags & float_flag_input_denormal) &&
+    if ((ieee_exception_flags & float_flag_iflush_denormal) &&
             (env->active_tc.msacsr & MSACSR_FS_MASK) != 0) {
         if (action & CLEAR_IS_INEXACT) {
             mips_exception_flags &= ~FP_INEXACT;
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 4d315b4449..eb2c4a41fb 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -97,7 +97,7 @@ static void update_fpsw(CPURXState *env, float32 ret, uintptr_t retaddr)
         if (xcpt & float_flag_inexact) {
             SET_FPSW(X);
         }
-        if ((xcpt & (float_flag_input_denormal
+        if ((xcpt & (float_flag_iflush_denormal
                      | float_flag_output_denormal))
             && !FIELD_EX32(env->fpsw, FPSW, DN)) {
             env->fpsw = FIELD_DP32(env->fpsw, FPSW, CE, 1);
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 801aa86ff9..be29ba0aa3 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -112,7 +112,7 @@ static void partsN(canonicalize)(FloatPartsN *p, float_status *status,
         if (likely(frac_eqz(p))) {
             p->cls = float_class_zero;
         } else if (status->flush_inputs_to_zero) {
-            float_raise(float_flag_input_denormal, status);
+            float_raise(float_flag_iflush_denormal, status);
             p->cls = float_class_zero;
             frac_clear(p);
         } else {
-- 
2.25.1


