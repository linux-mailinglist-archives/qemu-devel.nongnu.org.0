Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B4C457295
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:15:48 +0100 (CET)
Received: from localhost ([::1]:47572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6YF-0004yB-HF
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:15:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OI-00053z-Pa
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:30 -0500
Received: from [2a00:1450:4864:20::42e] (port=39532
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OH-0004BQ-54
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:30 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d27so18982450wrb.6
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QV5hpUeiTealtmj3T5CcbWO9/ljUZ/blDZsGJjF8k60=;
 b=aSIEyBIL0F4jJ+HTNxRdbzokuqGhdtg+fr+2dx092mf+mRlKhkhx0TKtCFMhHqTtWQ
 zM0udRZJsDbEXgZvFRs+SrQvown7j21mEu58sUFV7sGrSKb/13eTW6onmmu9/tblVpg2
 fW+8XPTgjCmO/M76A4o6+RTvqJYuxYXUWsxlE6JtvXj0wRpGH/DLGOhOu0BheDyCng7B
 KitJFCmSjPo6yl2oPr9v8wGtes3+euf490CwKX+3qYA6Oo3zCyC1N5WMKAiErO1j8Hib
 L01Kvrt59Tezvr4M56EuzphPlTlvWWxPuoyE/qSPdmLSvuKMSl4DF5nEoZqOo9KuqKfa
 ofEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QV5hpUeiTealtmj3T5CcbWO9/ljUZ/blDZsGJjF8k60=;
 b=ET1SxkQnoGo4WilkaT6bVWPqBiH7Yw2bf3+DrD31s0S2QHfotH2QuZpVDUp/P+/3Jy
 XCMWUbaW5h52l3IWrESZG3DROiej4CfkhhP7qYnFD3VxenKoTJrycUMQ+mkxAY654IA8
 rA+f7itXZOosn4qaJrkCFV5m97YEZC6AknrF0ZdH90t9Ti+9lbfrYnYg5E3bKUPjCj7M
 jm4BAeLXyPvvmWokQ3sy2gfc5hjojGgRlHpFrLSp7Fcv46l0y4aWSDB1HuOe2iMlSZum
 3gqvHKX13Wqdgyswdt8T8umKfsnuOgw/RJ+Wh4Ju3D84Ki3XjWyLhAZCzxt6JmPwbcWH
 H+5g==
X-Gm-Message-State: AOAM533THr5M9LoqO1sPrZGwLGF7iJtWHdQ1/XExZTMlTOBKUoVvy5vF
 VYF5dlZ/ChaLDsX/NkfGD9lyCVuxoRTbs7H2cFc=
X-Google-Smtp-Source: ABdhPJzSBodsYb00a297HBFozlXffVgbmE4C/uDrQhuYv+FoLM7XjPR176xcYnTVmMHReZMCyk6V1w==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr8655615wrr.152.1637337926647; 
 Fri, 19 Nov 2021 08:05:26 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/35] target/ppc: Update float_invalid_op_addsub for new flags
Date: Fri, 19 Nov 2021 17:04:35 +0100
Message-Id: <20211119160502.17432-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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

Now that vxisi and vxsnan are computed directly by
softfloat, we don't need to recompute it via classes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index c4896cecc8..f0deada84b 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -450,13 +450,12 @@ void helper_reset_fpstatus(CPUPPCState *env)
     set_float_exception_flags(0, &env->fp_status);
 }
 
-static void float_invalid_op_addsub(CPUPPCState *env, bool set_fpcc,
-                                    uintptr_t retaddr, int classes)
+static void float_invalid_op_addsub(CPUPPCState *env, int flags,
+                                    bool set_fpcc, uintptr_t retaddr)
 {
-    if ((classes & ~is_neg) == is_inf) {
-        /* Magnitude subtraction of infinities */
+    if (flags & float_flag_invalid_isi) {
         float_invalid_op_vxisi(env, set_fpcc, retaddr);
-    } else if (classes & is_snan) {
+    } else if (flags & float_flag_invalid_snan) {
         float_invalid_op_vxsnan(env, retaddr);
     }
 }
@@ -465,12 +464,10 @@ static void float_invalid_op_addsub(CPUPPCState *env, bool set_fpcc,
 float64 helper_fadd(CPUPPCState *env, float64 arg1, float64 arg2)
 {
     float64 ret = float64_add(arg1, arg2, &env->fp_status);
-    int status = get_float_exception_flags(&env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
 
-    if (unlikely(status & float_flag_invalid)) {
-        float_invalid_op_addsub(env, 1, GETPC(),
-                                float64_classify(arg1) |
-                                float64_classify(arg2));
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_addsub(env, flags, 1, GETPC());
     }
 
     return ret;
@@ -480,12 +477,10 @@ float64 helper_fadd(CPUPPCState *env, float64 arg1, float64 arg2)
 float64 helper_fsub(CPUPPCState *env, float64 arg1, float64 arg2)
 {
     float64 ret = float64_sub(arg1, arg2, &env->fp_status);
-    int status = get_float_exception_flags(&env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
 
-    if (unlikely(status & float_flag_invalid)) {
-        float_invalid_op_addsub(env, 1, GETPC(),
-                                float64_classify(arg1) |
-                                float64_classify(arg2));
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_addsub(env, flags, 1, GETPC());
     }
 
     return ret;
@@ -1616,9 +1611,8 @@ void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                          \
         env->fp_status.float_exception_flags |= tstat.float_exception_flags; \
                                                                              \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
-            float_invalid_op_addsub(env, sfprf, GETPC(),                     \
-                                    tp##_classify(xa->fld) |                 \
-                                    tp##_classify(xb->fld));                 \
+            float_invalid_op_addsub(env, tstat.float_exception_flags,        \
+                                    sfprf, GETPC());                         \
         }                                                                    \
                                                                              \
         if (r2sp) {                                                          \
@@ -1660,9 +1654,7 @@ void helper_xsaddqp(CPUPPCState *env, uint32_t opcode,
     env->fp_status.float_exception_flags |= tstat.float_exception_flags;
 
     if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
-        float_invalid_op_addsub(env, 1, GETPC(),
-                                float128_classify(xa->f128) |
-                                float128_classify(xb->f128));
+        float_invalid_op_addsub(env, tstat.float_exception_flags, 1, GETPC());
     }
 
     helper_compute_fprf_float128(env, t.f128);
@@ -3278,9 +3270,7 @@ void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
     env->fp_status.float_exception_flags |= tstat.float_exception_flags;
 
     if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
-        float_invalid_op_addsub(env, 1, GETPC(),
-                                float128_classify(xa->f128) |
-                                float128_classify(xb->f128));
+        float_invalid_op_addsub(env, tstat.float_exception_flags, 1, GETPC());
     }
 
     helper_compute_fprf_float128(env, t.f128);
-- 
2.25.1


