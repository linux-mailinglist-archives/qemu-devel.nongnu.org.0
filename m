Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850273925FD
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:18:45 +0200 (CEST)
Received: from localhost ([::1]:48966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7To-0001Rt-I4
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PP-0001Yd-S8
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:12 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PN-0007AL-JQ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:11 -0400
Received: by mail-pf1-x429.google.com with SMTP id x18so2640519pfi.9
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 21:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u4kpsKTdjq/zX6a8j112MCdu1Vy0D0wqzYtCbnaww7Q=;
 b=aC5L/ZYqCS5HefgxX0l/HV4IqbfBrDB5Io10H1OKw0HccdKWMv/R5n2etKcRh41xuC
 Jq76wCKYfGRWfbNYlDuxAx977LquvacbEgHI615MBUqH7AXGQtV/cxDEzW6eFCbOTv4V
 AN8DK/s66AnwpGRESmmilBZxZ/BDxvTuYace48rwHPLNJr9/4wkMI5L9+imp+Ll3mt/2
 zuDelYZTOBLwk22wLsZ6Wi6qpkIyxuAhiWAq+azVjA4PEScD9hodYaltdonY6xcOSjNb
 Dmorkd9UBqkZNahV0hkJeAFoesG7nLVc7ld2cd7aEMlRkLInrH4nM7OaF282jDfIH/lA
 whKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u4kpsKTdjq/zX6a8j112MCdu1Vy0D0wqzYtCbnaww7Q=;
 b=seN7o0d/JbhL8x5H1ZJuCUjsXPyGtvgD18WpsLS/GTuOjU5wUenNQycvAQBO38jKl/
 dirgOlO4n5oFKplHo3Nlmv8x5YYAs+9ewsgK762l2vCXGzUIegTTVq+uvuRKplYIpfbM
 D8K9VAObgSw3UHKPmp3I6kQ71wAz90pT+J5l0GFo7eaToCRv9o1K4Aii/sPDPqu4Vyh+
 PkPgUQnrsBldzgbqk0XCqXXaOTeIlpNoYbk8QdHQofj8z7lGgqYkw4TFjN48BAf/Qw9X
 iYFuRu7s0lgFPZgI32plhRvmBbcSaRZuz0moVXPoDH2JAl4I3SUkzfnbjcPh7Yiw+ppl
 0bFw==
X-Gm-Message-State: AOAM532pjFstsLrCZkHHtue3/DB2OnHj5tYmfQK15PZ3uSlZYfFzLdBK
 Jiec5mCYjtWDdfUD3ucECyDCROm+6z6kKg==
X-Google-Smtp-Source: ABdhPJxGqtsd84nHNfr0MfqgucRVbL538gKhvqzGjzGPXAK9P6BCvxtuPeNaIyinJ9P2ZyoARaIdMw==
X-Received: by 2002:aa7:8506:0:b029:2e4:dae2:9d89 with SMTP id
 v6-20020aa785060000b02902e4dae29d89mr1797802pfn.78.1622088848315; 
 Wed, 26 May 2021 21:14:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id s1sm605959pfc.6.2021.05.26.21.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 21:14:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
Date: Wed, 26 May 2021 21:13:57 -0700
Message-Id: <20210527041405.391567-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527041405.391567-1-richard.henderson@linaro.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Create a new exception flag for reporting input denormals that are not
flushed to zero, they are normalized and treated as normal numbers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h | 15 ++++---
 fpu/softfloat.c               | 84 +++++++++++------------------------
 fpu/softfloat-parts.c.inc     |  1 +
 3 files changed, 36 insertions(+), 64 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index e2d70ff556..174100e50e 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -143,13 +143,14 @@ typedef enum __attribute__((__packed__)) {
  */
 
 enum {
-    float_flag_invalid   =  1,
-    float_flag_divbyzero =  4,
-    float_flag_overflow  =  8,
-    float_flag_underflow = 16,
-    float_flag_inexact   = 32,
-    float_flag_iflush_denormal = 64,
-    float_flag_oflush_denormal = 128
+    float_flag_invalid         = 0x0001,
+    float_flag_divbyzero       = 0x0002,
+    float_flag_overflow        = 0x0004,
+    float_flag_underflow       = 0x0008,
+    float_flag_inexact         = 0x0010,
+    float_flag_inorm_denormal  = 0x0020,  /* denormal input, normalized */
+    float_flag_iflush_denormal = 0x0040,  /* denormal input, flushed to zero */
+    float_flag_oflush_denormal = 0x0080,  /* denormal result, flushed to zero */
 };
 
 /*
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index cb077cf111..e54cdb274d 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -126,61 +126,23 @@ this code that are retained.
  * denormal/inf/NaN; (2) when operands are not guaranteed to lead to a 0 result
  * and the result is < the minimum normal.
  */
-#define GEN_INPUT_FLUSH__NOCHECK(name, soft_t)                          \
+
+#define GEN_INPUT_FLUSH(name, soft_t)                                   \
     static inline void name(soft_t *a, float_status *s)                 \
     {                                                                   \
         if (unlikely(soft_t ## _is_denormal(*a))) {                     \
-            *a = soft_t ## _set_sign(soft_t ## _zero,                   \
-                                     soft_t ## _is_neg(*a));            \
-            float_raise(float_flag_iflush_denormal, s);                  \
+            if (s->flush_inputs_to_zero) {                              \
+                *a = soft_t ## _set_sign(0, soft_t ## _is_neg(*a));     \
+                float_raise(float_flag_iflush_denormal, s);             \
+            } else {                                                    \
+                float_raise(float_flag_inorm_denormal, s);              \
+            }                                                           \
         }                                                               \
     }
 
-GEN_INPUT_FLUSH__NOCHECK(float32_input_flush__nocheck, float32)
-GEN_INPUT_FLUSH__NOCHECK(float64_input_flush__nocheck, float64)
-#undef GEN_INPUT_FLUSH__NOCHECK
-
-#define GEN_INPUT_FLUSH1(name, soft_t)                  \
-    static inline void name(soft_t *a, float_status *s) \
-    {                                                   \
-        if (likely(!s->flush_inputs_to_zero)) {         \
-            return;                                     \
-        }                                               \
-        soft_t ## _input_flush__nocheck(a, s);          \
-    }
-
-GEN_INPUT_FLUSH1(float32_input_flush1, float32)
-GEN_INPUT_FLUSH1(float64_input_flush1, float64)
-#undef GEN_INPUT_FLUSH1
-
-#define GEN_INPUT_FLUSH2(name, soft_t)                                  \
-    static inline void name(soft_t *a, soft_t *b, float_status *s)      \
-    {                                                                   \
-        if (likely(!s->flush_inputs_to_zero)) {                         \
-            return;                                                     \
-        }                                                               \
-        soft_t ## _input_flush__nocheck(a, s);                          \
-        soft_t ## _input_flush__nocheck(b, s);                          \
-    }
-
-GEN_INPUT_FLUSH2(float32_input_flush2, float32)
-GEN_INPUT_FLUSH2(float64_input_flush2, float64)
-#undef GEN_INPUT_FLUSH2
-
-#define GEN_INPUT_FLUSH3(name, soft_t)                                  \
-    static inline void name(soft_t *a, soft_t *b, soft_t *c, float_status *s) \
-    {                                                                   \
-        if (likely(!s->flush_inputs_to_zero)) {                         \
-            return;                                                     \
-        }                                                               \
-        soft_t ## _input_flush__nocheck(a, s);                          \
-        soft_t ## _input_flush__nocheck(b, s);                          \
-        soft_t ## _input_flush__nocheck(c, s);                          \
-    }
-
-GEN_INPUT_FLUSH3(float32_input_flush3, float32)
-GEN_INPUT_FLUSH3(float64_input_flush3, float64)
-#undef GEN_INPUT_FLUSH3
+GEN_INPUT_FLUSH(float32_input_flush, float32)
+GEN_INPUT_FLUSH(float64_input_flush, float64)
+#undef GEN_INPUT_FLUSH
 
 /*
  * Choose whether to use fpclassify or float32/64_* primitives in the generated
@@ -353,7 +315,8 @@ float32_gen2(float32 xa, float32 xb, float_status *s,
         goto soft;
     }
 
-    float32_input_flush2(&ua.s, &ub.s, s);
+    float32_input_flush(&ua.s, s);
+    float32_input_flush(&ub.s, s);
     if (unlikely(!pre(ua, ub))) {
         goto soft;
     }
@@ -384,7 +347,8 @@ float64_gen2(float64 xa, float64 xb, float_status *s,
         goto soft;
     }
 
-    float64_input_flush2(&ua.s, &ub.s, s);
+    float64_input_flush(&ua.s, s);
+    float64_input_flush(&ub.s, s);
     if (unlikely(!pre(ua, ub))) {
         goto soft;
     }
@@ -2161,7 +2125,9 @@ float32_muladd(float32 xa, float32 xb, float32 xc, int flags, float_status *s)
         goto soft;
     }
 
-    float32_input_flush3(&ua.s, &ub.s, &uc.s, s);
+    float32_input_flush(&ua.s, s);
+    float32_input_flush(&ub.s, s);
+    float32_input_flush(&uc.s, s);
     if (unlikely(!f32_is_zon3(ua, ub, uc))) {
         goto soft;
     }
@@ -2232,7 +2198,9 @@ float64_muladd(float64 xa, float64 xb, float64 xc, int flags, float_status *s)
         goto soft;
     }
 
-    float64_input_flush3(&ua.s, &ub.s, &uc.s, s);
+    float64_input_flush(&ua.s, s);
+    float64_input_flush(&ub.s, s);
+    float64_input_flush(&uc.s, s);
     if (unlikely(!f64_is_zon3(ua, ub, uc))) {
         goto soft;
     }
@@ -3988,7 +3956,8 @@ float32_hs_compare(float32 xa, float32 xb, float_status *s, bool is_quiet)
         goto soft;
     }
 
-    float32_input_flush2(&ua.s, &ub.s, s);
+    float32_input_flush(&ua.s, s);
+    float32_input_flush(&ub.s, s);
     if (isgreaterequal(ua.h, ub.h)) {
         if (isgreater(ua.h, ub.h)) {
             return float_relation_greater;
@@ -4038,7 +4007,8 @@ float64_hs_compare(float64 xa, float64 xb, float_status *s, bool is_quiet)
         goto soft;
     }
 
-    float64_input_flush2(&ua.s, &ub.s, s);
+    float64_input_flush(&ua.s, s);
+    float64_input_flush(&ub.s, s);
     if (isgreaterequal(ua.h, ub.h)) {
         if (isgreater(ua.h, ub.h)) {
             return float_relation_greater;
@@ -4230,7 +4200,7 @@ float32 QEMU_FLATTEN float32_sqrt(float32 xa, float_status *s)
         goto soft;
     }
 
-    float32_input_flush1(&ua.s, s);
+    float32_input_flush(&ua.s, s);
     if (QEMU_HARDFLOAT_1F32_USE_FP) {
         if (unlikely(!(fpclassify(ua.h) == FP_NORMAL ||
                        fpclassify(ua.h) == FP_ZERO) ||
@@ -4257,7 +4227,7 @@ float64 QEMU_FLATTEN float64_sqrt(float64 xa, float_status *s)
         goto soft;
     }
 
-    float64_input_flush1(&ua.s, s);
+    float64_input_flush(&ua.s, s);
     if (QEMU_HARDFLOAT_1F64_USE_FP) {
         if (unlikely(!(fpclassify(ua.h) == FP_NORMAL ||
                        fpclassify(ua.h) == FP_ZERO) ||
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 72e2b24539..16d4425419 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -119,6 +119,7 @@ static void partsN(canonicalize)(FloatPartsN *p, float_status *status,
             int shift = frac_normalize(p);
             p->cls = float_class_normal;
             p->exp = fmt->frac_shift - fmt->exp_bias - shift + 1;
+            float_raise(float_flag_inorm_denormal, status);
         }
     } else if (likely(p->exp < fmt->exp_max) || fmt->arm_althp) {
         p->cls = float_class_normal;
-- 
2.25.1


