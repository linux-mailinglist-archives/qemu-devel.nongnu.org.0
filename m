Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2C1D9D37
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 18:53:42 +0200 (CEST)
Received: from localhost ([::1]:34950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb5Ur-0001v7-E4
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 12:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jb5RL-0004c9-QG
 for qemu-devel@nongnu.org; Tue, 19 May 2020 12:50:03 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jb5RK-0006Bn-P9
 for qemu-devel@nongnu.org; Tue, 19 May 2020 12:50:03 -0400
Received: by mail-pg1-x52a.google.com with SMTP id n11so94468pgl.9
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 09:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ustNJ29x0eVa3NqVBfK2PA0JtLsq5Epn8newEzxSLk4=;
 b=rLQZwYGVSByQvcftQbnzE81a6Sy6F7MoyJnzGHkkg9cBDjjtK3pzf1nO4NzzlBerMy
 +bXidOyC9+n2RB/x0UljPkcnqHzGhAOjRCx8YHNJTA9M8eoSO/Vy1pEFS2MpviAKllco
 c8JFAY8RZ0he9kOYLWRdsCx4hCSWW0gGbwwuY7hEgAmT/jzX30PCrDYqvxk7eZ67jgkL
 23718TKmvcov3QGUCQV0wUD85oDzkOQ2lsegH5ip9EEvyziLwN1e8ZtWqLP+zj1aTrzB
 OvZdOprof1p50Y6PQTG0kxXJeHyiwC0U+fOwZWJ6uKhileNJuaIifnV0U0d7ur1pGvjy
 T8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ustNJ29x0eVa3NqVBfK2PA0JtLsq5Epn8newEzxSLk4=;
 b=IIC//hBKKFoM5uMihxmj6ccbnC4vVq0ufiZRpkYtfT+B/G/xfXzpoPVPm895ZeFf19
 RbvDBsaCPS5/wIxScU4jGAGraq73xYKOXHwojqzoht+Wr/IRFYNwbGwXYbUYzCrUxaUg
 Ht8tPECd9oeL0iJrEQoFpCSdL7MP3mY0YTDxf611ndcxNwbvDzTpr1VV44Z22e/xLUlx
 EsB4GsuR9f6y4GogGNtahz8r/PQD+v2B3McbBZbUt4SkgTYfiNgWXUUY+rfvftfWTIGD
 3VPuDPbvQ016LQSMynOU5L58Nb0tWFrhtVLEAUOZaY1xY9FUjyqsu228CDySHe+t8OdM
 /wEg==
X-Gm-Message-State: AOAM532hmw2nVdFaQ2ehwzlV1wshkPefJ12f1SZAG1utqirZv+MtpFVn
 DDL8aZiC9PRz4f3V50BT8VDuXhA/w8k=
X-Google-Smtp-Source: ABdhPJy8jd3lelBClNRaPdiR7urbREBakaQJNJJXmz+v1k8vx3ekeMUcVXYrNi2ikHNZ4ScMrseb+w==
X-Received: by 2002:a63:792:: with SMTP id 140mr104685pgh.65.1589907000372;
 Tue, 19 May 2020 09:50:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id gx21sm96685pjb.47.2020.05.19.09.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 09:49:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/10] softfloat: Use post test for floatN_mul
Date: Tue, 19 May 2020 09:49:48 -0700
Message-Id: <20200519164957.26920-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519164957.26920-1-richard.henderson@linaro.org>
References: <20200519164957.26920-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing f{32,64}_addsub_post test, which checks for zero
inputs, is identical to f{32,64}_mul_fast_test.  Which means
we can eliminate the fast_test/fast_op hooks in favor of
reusing the same post hook.

This means we have one fewer test along the fast path for multiply.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 65 +++++++++++--------------------------------------
 1 file changed, 14 insertions(+), 51 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index a362bf89ca..5fb4ef75bb 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -339,12 +339,10 @@ static inline bool f64_is_inf(union_float64 a)
     return float64_is_infinity(a.s);
 }
 
-/* Note: @fast_test and @post can be NULL */
 static inline float32
 float32_gen2(float32 xa, float32 xb, float_status *s,
              hard_f32_op2_fn hard, soft_f32_op2_fn soft,
-             f32_check_fn pre, f32_check_fn post,
-             f32_check_fn fast_test, soft_f32_op2_fn fast_op)
+             f32_check_fn pre, f32_check_fn post)
 {
     union_float32 ua, ub, ur;
 
@@ -359,17 +357,12 @@ float32_gen2(float32 xa, float32 xb, float_status *s,
     if (unlikely(!pre(ua, ub))) {
         goto soft;
     }
-    if (fast_test && fast_test(ua, ub)) {
-        return fast_op(ua.s, ub.s, s);
-    }
 
     ur.h = hard(ua.h, ub.h);
     if (unlikely(f32_is_inf(ur))) {
         s->float_exception_flags |= float_flag_overflow;
-    } else if (unlikely(fabsf(ur.h) <= FLT_MIN)) {
-        if (post == NULL || post(ua, ub)) {
-            goto soft;
-        }
+    } else if (unlikely(fabsf(ur.h) <= FLT_MIN) && post(ua, ub)) {
+        goto soft;
     }
     return ur.s;
 
@@ -380,8 +373,7 @@ float32_gen2(float32 xa, float32 xb, float_status *s,
 static inline float64
 float64_gen2(float64 xa, float64 xb, float_status *s,
              hard_f64_op2_fn hard, soft_f64_op2_fn soft,
-             f64_check_fn pre, f64_check_fn post,
-             f64_check_fn fast_test, soft_f64_op2_fn fast_op)
+             f64_check_fn pre, f64_check_fn post)
 {
     union_float64 ua, ub, ur;
 
@@ -396,17 +388,12 @@ float64_gen2(float64 xa, float64 xb, float_status *s,
     if (unlikely(!pre(ua, ub))) {
         goto soft;
     }
-    if (fast_test && fast_test(ua, ub)) {
-        return fast_op(ua.s, ub.s, s);
-    }
 
     ur.h = hard(ua.h, ub.h);
     if (unlikely(f64_is_inf(ur))) {
         s->float_exception_flags |= float_flag_overflow;
-    } else if (unlikely(fabs(ur.h) <= DBL_MIN)) {
-        if (post == NULL || post(ua, ub)) {
-            goto soft;
-        }
+    } else if (unlikely(fabs(ur.h) <= DBL_MIN) && post(ua, ub)) {
+        goto soft;
     }
     return ur.s;
 
@@ -1115,7 +1102,7 @@ static double hard_f64_sub(double a, double b)
     return a - b;
 }
 
-static bool f32_addsub_post(union_float32 a, union_float32 b)
+static bool f32_addsubmul_post(union_float32 a, union_float32 b)
 {
     if (QEMU_HARDFLOAT_2F32_USE_FP) {
         return !(fpclassify(a.h) == FP_ZERO && fpclassify(b.h) == FP_ZERO);
@@ -1123,7 +1110,7 @@ static bool f32_addsub_post(union_float32 a, union_float32 b)
     return !(float32_is_zero(a.s) && float32_is_zero(b.s));
 }
 
-static bool f64_addsub_post(union_float64 a, union_float64 b)
+static bool f64_addsubmul_post(union_float64 a, union_float64 b)
 {
     if (QEMU_HARDFLOAT_2F64_USE_FP) {
         return !(fpclassify(a.h) == FP_ZERO && fpclassify(b.h) == FP_ZERO);
@@ -1136,14 +1123,14 @@ static float32 float32_addsub(float32 a, float32 b, float_status *s,
                               hard_f32_op2_fn hard, soft_f32_op2_fn soft)
 {
     return float32_gen2(a, b, s, hard, soft,
-                        f32_is_zon2, f32_addsub_post, NULL, NULL);
+                        f32_is_zon2, f32_addsubmul_post);
 }
 
 static float64 float64_addsub(float64 a, float64 b, float_status *s,
                               hard_f64_op2_fn hard, soft_f64_op2_fn soft)
 {
     return float64_gen2(a, b, s, hard, soft,
-                        f64_is_zon2, f64_addsub_post, NULL, NULL);
+                        f64_is_zon2, f64_addsubmul_post);
 }
 
 float32 QEMU_FLATTEN
@@ -1258,42 +1245,18 @@ static double hard_f64_mul(double a, double b)
     return a * b;
 }
 
-static bool f32_mul_fast_test(union_float32 a, union_float32 b)
-{
-    return float32_is_zero(a.s) || float32_is_zero(b.s);
-}
-
-static bool f64_mul_fast_test(union_float64 a, union_float64 b)
-{
-    return float64_is_zero(a.s) || float64_is_zero(b.s);
-}
-
-static float32 f32_mul_fast_op(float32 a, float32 b, float_status *s)
-{
-    bool signbit = float32_is_neg(a) ^ float32_is_neg(b);
-
-    return float32_set_sign(float32_zero, signbit);
-}
-
-static float64 f64_mul_fast_op(float64 a, float64 b, float_status *s)
-{
-    bool signbit = float64_is_neg(a) ^ float64_is_neg(b);
-
-    return float64_set_sign(float64_zero, signbit);
-}
-
 float32 QEMU_FLATTEN
 float32_mul(float32 a, float32 b, float_status *s)
 {
     return float32_gen2(a, b, s, hard_f32_mul, soft_f32_mul,
-                        f32_is_zon2, NULL, f32_mul_fast_test, f32_mul_fast_op);
+                        f32_is_zon2, f32_addsubmul_post);
 }
 
 float64 QEMU_FLATTEN
 float64_mul(float64 a, float64 b, float_status *s)
 {
     return float64_gen2(a, b, s, hard_f64_mul, soft_f64_mul,
-                        f64_is_zon2, NULL, f64_mul_fast_test, f64_mul_fast_op);
+                        f64_is_zon2, f64_addsubmul_post);
 }
 
 /*
@@ -1834,14 +1797,14 @@ float32 QEMU_FLATTEN
 float32_div(float32 a, float32 b, float_status *s)
 {
     return float32_gen2(a, b, s, hard_f32_div, soft_f32_div,
-                        f32_div_pre, f32_div_post, NULL, NULL);
+                        f32_div_pre, f32_div_post);
 }
 
 float64 QEMU_FLATTEN
 float64_div(float64 a, float64 b, float_status *s)
 {
     return float64_gen2(a, b, s, hard_f64_div, soft_f64_div,
-                        f64_div_pre, f64_div_post, NULL, NULL);
+                        f64_div_pre, f64_div_post);
 }
 
 /*
-- 
2.20.1


