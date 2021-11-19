Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F19C4572F9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:31:37 +0100 (CET)
Received: from localhost ([::1]:37048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6nX-0003ZT-BO
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:31:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Ot-0006TW-MZ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:08 -0500
Received: from [2a00:1450:4864:20::32e] (port=39670
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Or-0004SN-WA
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:07 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso10862937wmr.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GUACX1hgU27r+IyDqJ3MtbArNPJQam9ezsjXjhaSjU8=;
 b=ruoMOwgZ27VtPfNDOIkCjIuIu5zrh+rzVTvQJt/9yilYOB2ktKuHgnXg3PfQ4K5lW2
 az12bMIXlTVx5rys6qwSGsBpA5E07YcmcmEO4uUZx8zDAjGn2CtxYqhQI6GqNU2rzSP4
 +e6GC0Az9HIdPKTrPtJ9r5wXO9gEAsIObvtUdveDGDZl7uUktyTei5sSgIPQI3KqIJSS
 Wjomzz3yf7ry2AiWs6ona3qTJbxDB+wEUQy5xJS8x8DAWJj6Lna8ivAWSecRIrBKjCBG
 2aMLfFcHD10+Se5I4O8KHcpG5qydFpyR4AC20tplEEt6ZuINA644Fax82pcmDQ+emtcb
 qyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GUACX1hgU27r+IyDqJ3MtbArNPJQam9ezsjXjhaSjU8=;
 b=X+tA9ikVdTDlihIF/+VecxffQbuHu/DJYARPdl9oqLKX80vmpazFbXnKLpqEDmDtnb
 /gVNmBb7A6uM467tksuLje18VpvRAe247v0Gx3/30X3sSI5CxYkvqVleENnLcyhxKbm5
 aPxoWprOJz0O1PeW+xVnuU/utA4etquyvKraAJovO+RYVPh0ThaaSLjvWPlKLo0ey3u0
 mnGyCTwxVtFfXVDMdSrhq0PY3iOV+P84fCuXMc1mWQACxRJf5xrJo5n8RdmobFr50ITT
 Hw+jzvVE10QltwZm0is40+PW+CIw9mHUm61L0NTFXr6uK+aeE22BdfWE84vYxzlkl9zl
 oTag==
X-Gm-Message-State: AOAM531JTb0qb60eFjrUnMZ1YbqCW+c89k+uLmuEz4yjIa5AOYpdB4i+
 581i4HFsXXJi/Orv9hhXSV6CdjAuZVoD1Z9A3AA=
X-Google-Smtp-Source: ABdhPJyl8VMlHvp2G4Kk1bAWWzMPcZ5rued/ZVsF0CKaZ5Tnv24F40ER17AvbIUzyYIwr75nlxB1jg==
X-Received: by 2002:a1c:2047:: with SMTP id g68mr860463wmg.181.1637337964537; 
 Fri, 19 Nov 2021 08:06:04 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:06:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/35] target/ppc: Update sqrt for new flags
Date: Fri, 19 Nov 2021 17:04:51 +0100
Message-Id: <20211119160502.17432-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that vxsqrt and vxsnan are computed directly by softfloat,
we don't need to recompute it.  Split out float_invalid_op_sqrt
to be used in several places.  This fixes VSX_SQRT, which did
not order its tests correctly to eliminate NaN with sign set.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 72 ++++++++++++++---------------------------
 1 file changed, 25 insertions(+), 47 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 3a29a994d3..f17d5a1af1 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -689,22 +689,24 @@ uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
     return do_frsp(env, arg, GETPC());
 }
 
+static void float_invalid_op_sqrt(CPUPPCState *env, int flags,
+                                  bool set_fpcc, uintptr_t retaddr)
+{
+    if (unlikely(flags & float_flag_invalid_sqrt)) {
+        float_invalid_op_vxsqrt(env, set_fpcc, retaddr);
+    } else if (unlikely(flags & float_flag_invalid_snan)) {
+        float_invalid_op_vxsnan(env, retaddr);
+    }
+}
+
 /* fsqrt - fsqrt. */
 float64 helper_fsqrt(CPUPPCState *env, float64 arg)
 {
     float64 ret = float64_sqrt(arg, &env->fp_status);
-    int status = get_float_exception_flags(&env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
 
-    if (unlikely(status & float_flag_invalid)) {
-        if (unlikely(float64_is_any_nan(arg))) {
-            if (unlikely(float64_is_signaling_nan(arg, &env->fp_status))) {
-                /* sNaN square root */
-                float_invalid_op_vxsnan(env, GETPC());
-            }
-        } else {
-            /* Square root of a negative nonzero number */
-            float_invalid_op_vxsqrt(env, 1, GETPC());
-        }
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_sqrt(env, flags, 1, GETPC());
     }
 
     return ret;
@@ -759,22 +761,14 @@ float64 helper_frsqrte(CPUPPCState *env, float64 arg)
     /* "Estimate" the reciprocal with actual division.  */
     float64 rets = float64_sqrt(arg, &env->fp_status);
     float64 retd = float64_div(float64_one, rets, &env->fp_status);
-    int status = get_float_exception_flags(&env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
 
-    if (unlikely(status)) {
-        if (status & float_flag_invalid) {
-            if (float64_is_signaling_nan(arg, &env->fp_status)) {
-                /* sNaN reciprocal */
-                float_invalid_op_vxsnan(env, GETPC());
-            } else {
-                /* Square root of a negative nonzero number */
-                float_invalid_op_vxsqrt(env, 1, GETPC());
-            }
-        }
-        if (status & float_flag_divbyzero) {
-            /* Reciprocal of (square root of) zero.  */
-            float_zero_divide_excp(env, GETPC());
-        }
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_sqrt(env, flags, 1, GETPC());
+    }
+    if (unlikely(flags & float_flag_divbyzero)) {
+        /* Reciprocal of (square root of) zero.  */
+        float_zero_divide_excp(env, GETPC());
     }
 
     return retd;
@@ -1836,11 +1830,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
         env->fp_status.float_exception_flags |= tstat.float_exception_flags; \
                                                                              \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
-            if (tp##_is_neg(xb->fld) && !tp##_is_zero(xb->fld)) {            \
-                float_invalid_op_vxsqrt(env, sfprf, GETPC());                \
-            } else if (tp##_is_signaling_nan(xb->fld, &tstat)) {             \
-                float_invalid_op_vxsnan(env, GETPC());                       \
-            }                                                                \
+            float_invalid_op_sqrt(env, tstat.float_exception_flags,          \
+                                  sfprf, GETPC());                           \
         }                                                                    \
                                                                              \
         if (r2sp) {                                                          \
@@ -1883,15 +1874,10 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
         t.fld = tp##_sqrt(xb->fld, &tstat);                                  \
         t.fld = tp##_div(tp##_one, t.fld, &tstat);                           \
         env->fp_status.float_exception_flags |= tstat.float_exception_flags; \
-                                                                             \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
-            if (tp##_is_neg(xb->fld) && !tp##_is_zero(xb->fld)) {            \
-                float_invalid_op_vxsqrt(env, sfprf, GETPC());                \
-            } else if (tp##_is_signaling_nan(xb->fld, &tstat)) {             \
-                float_invalid_op_vxsnan(env, GETPC());                       \
-            }                                                                \
+            float_invalid_op_sqrt(env, tstat.float_exception_flags,          \
+                                  sfprf, GETPC());                           \
         }                                                                    \
-                                                                             \
         if (r2sp) {                                                          \
             t.fld = do_frsp(env, t.fld, GETPC());                            \
         }                                                                    \
@@ -3192,15 +3178,7 @@ void helper_xssqrtqp(CPUPPCState *env, uint32_t opcode,
     env->fp_status.float_exception_flags |= tstat.float_exception_flags;
 
     if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
-        if (float128_is_signaling_nan(xb->f128, &tstat)) {
-            float_invalid_op_vxsnan(env, GETPC());
-            t.f128 = float128_snan_to_qnan(xb->f128);
-        } else if (float128_is_quiet_nan(xb->f128, &tstat)) {
-            t.f128 = xb->f128;
-        } else if (float128_is_neg(xb->f128) && !float128_is_zero(xb->f128)) {
-            float_invalid_op_vxsqrt(env, 1, GETPC());
-            t.f128 = float128_default_nan(&env->fp_status);
-        }
+        float_invalid_op_sqrt(env, tstat.float_exception_flags, 1, GETPC());
     }
 
     helper_compute_fprf_float128(env, t.f128);
-- 
2.25.1


