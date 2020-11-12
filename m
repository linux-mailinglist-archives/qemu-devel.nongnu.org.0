Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C512B126E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 00:05:38 +0100 (CET)
Received: from localhost ([::1]:60346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdLer-00064r-RR
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 18:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kdLbC-0002Ax-K4; Thu, 12 Nov 2020 18:01:50 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kdLbA-0004x2-73; Thu, 12 Nov 2020 18:01:50 -0500
Received: by mail-wr1-x444.google.com with SMTP id c17so7683752wrc.11;
 Thu, 12 Nov 2020 15:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTFm5JfSzDYnQKGitu1S7GuUWTQh3inoTWd2aXww1qg=;
 b=QzYNHWLv59omWfktbnPyGt1Pu6k/UVqNCqLZfAtTAzZ7bm65Y6jpx/dE/xOKXZT4KT
 y1fbHZV9YpZpo4HtV4tYC5F78MGVuoHZBkrzRF5jm+u5Wjz3bEdiSg5Vul8jbYmPIl+/
 eJjoePi3kKnm4XOwUttSx9hc1x3MycekUlA5WbWjdy16uu+vdl5mEefRKAQmh5O1bQaA
 XyXfU6FLjtiJx7xyA+jcKyOd8AYHcYh3FjpKO4iLfzrRdCjPbG9fb5jIkyaOUzK4SrtC
 fvtKO17DzXKF26kqqAtR4jGvhR/OeekqDKlPi08EYbin1hMbk3CD9wZ5Z/atwuRb2PSn
 kyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTFm5JfSzDYnQKGitu1S7GuUWTQh3inoTWd2aXww1qg=;
 b=NEx1cEjttERgalMpaZdMV89vrh/ajnwCK5koGvXJQ+Pw+4Qevr9f9JfZ9Fm6RGlMAD
 CB8eQBg/3eLsa/KhGXVgKAFn5kaC2lYwz/MvNH5s4wjV2AmUZFCplBnFpFNevhb5nqp7
 wziQDs/2LxhqK880di7ajDQJkzJ6rsTQ4FG8my2yt2DQZifwxFnCseYsLz8sfJokJ9DT
 o8Zggvgc/dgLuXlnGp5mrl/O8wVhCJ3sfBwLGChRv+TDnv7HYEe0n33TknbrXNcXK64r
 BydoHxa5j1C3YEmXAc2T/VQ2eKRAVQwbBkf4EY3mgwJNnMhauGvJ0F7SAWOisjLET3Ba
 vRXw==
X-Gm-Message-State: AOAM530CTKqp9Soxsib6B8Xm/8txbP/paiLEHTpFJjKLxRqDejbpqlzw
 TEreVQdEIGUR0OyfyGQKqrvSF3R76mLqwQ==
X-Google-Smtp-Source: ABdhPJwJRkh5I786ZyNJxeCwoIAgRuF+Rk4I7AT4dhK3hDv56EbnNm4x3EYmw2wSBxwTVq803t6AGg==
X-Received: by 2002:adf:ea50:: with SMTP id j16mr2099391wrn.283.1605222100566; 
 Thu, 12 Nov 2020 15:01:40 -0800 (PST)
Received: from localhost.localdomain ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id v16sm8326184wml.33.2020.11.12.15.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 15:01:40 -0800 (PST)
From: LemonBoy <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] ppc/translate: Delay NaN checking after comparison
Date: Fri, 13 Nov 2020 00:01:29 +0100
Message-Id: <20201112230130.65262-4-thatlemon@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201112230130.65262-1-thatlemon@gmail.com>
References: <20201112230130.65262-1-thatlemon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=thatlemon@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: LemonBoy <thatlemon@gmail.com>, richard.henderson@linaro.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we always perform a comparison between the two operands avoid
checking for NaN unless the result states they're unordered.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 80 +++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 6600520221..08fcaed723 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2475,25 +2475,6 @@ static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
 
     helper_reset_fpstatus(env);
 
-    if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||
-        float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {
-        vxsnan_flag = true;
-        if (fpscr_ve == 0 && ordered) {
-            vxvc_flag = true;
-        }
-    } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||
-               float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {
-        if (ordered) {
-            vxvc_flag = true;
-        }
-    }
-    if (vxsnan_flag) {
-        float_invalid_op_vxsnan(env, GETPC());
-    }
-    if (vxvc_flag) {
-        float_invalid_op_vxvc(env, 0, GETPC());
-    }
-
     switch (float64_compare(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {
     case float_relation_less:
         cc = CRF_LT;
@@ -2506,6 +2487,27 @@ static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
         break;
     case float_relation_unordered:
         cc = CRF_SO;
+
+        if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||
+            float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {
+            vxsnan_flag = true;
+            if (fpscr_ve == 0 && ordered) {
+                vxvc_flag = true;
+            }
+        } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||
+                   float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {
+            if (ordered) {
+                vxvc_flag = true;
+            }
+        }
+
+        if (vxsnan_flag) {
+            float_invalid_op_vxsnan(env, GETPC());
+        }
+        if (vxvc_flag) {
+            float_invalid_op_vxvc(env, 0, GETPC());
+        }
+
         break;
     default:
         g_assert_not_reached();
@@ -2538,25 +2540,6 @@ static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
 
     helper_reset_fpstatus(env);
 
-    if (float128_is_signaling_nan(xa->f128, &env->fp_status) ||
-        float128_is_signaling_nan(xb->f128, &env->fp_status)) {
-        vxsnan_flag = true;
-        if (fpscr_ve == 0 && ordered) {
-            vxvc_flag = true;
-        }
-    } else if (float128_is_quiet_nan(xa->f128, &env->fp_status) ||
-               float128_is_quiet_nan(xb->f128, &env->fp_status)) {
-        if (ordered) {
-            vxvc_flag = true;
-        }
-    }
-    if (vxsnan_flag) {
-        float_invalid_op_vxsnan(env, GETPC());
-    }
-    if (vxvc_flag) {
-        float_invalid_op_vxvc(env, 0, GETPC());
-    }
-
     switch (float128_compare(xa->f128, xb->f128, &env->fp_status)) {
     case float_relation_less:
         cc = CRF_LT;
@@ -2569,6 +2552,27 @@ static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
         break;
     case float_relation_unordered:
         cc = CRF_SO;
+
+        if (float128_is_signaling_nan(xa->f128, &env->fp_status) ||
+            float128_is_signaling_nan(xb->f128, &env->fp_status)) {
+            vxsnan_flag = true;
+            if (fpscr_ve == 0 && ordered) {
+                vxvc_flag = true;
+            }
+        } else if (float128_is_quiet_nan(xa->f128, &env->fp_status) ||
+                   float128_is_quiet_nan(xb->f128, &env->fp_status)) {
+            if (ordered) {
+                vxvc_flag = true;
+            }
+        }
+
+        if (vxsnan_flag) {
+            float_invalid_op_vxsnan(env, GETPC());
+        }
+        if (vxvc_flag) {
+            float_invalid_op_vxvc(env, 0, GETPC());
+        }
+
         break;
     default:
         g_assert_not_reached();
-- 
2.27.0


