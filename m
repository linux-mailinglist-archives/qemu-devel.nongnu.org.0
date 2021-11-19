Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772634572A8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:17:51 +0100 (CET)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6aE-0001fS-K2
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:17:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OM-0005Gm-U4
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:35 -0500
Received: from [2a00:1450:4864:20::335] (port=33379
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OL-0004CK-8Z
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:34 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso8028487wmh.0
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aJwIe/CDClWkHFSq1yC+4dkDSmRHAsqZ+6zM4fUJyj0=;
 b=Ek5YK9Fyyo9TCmRMaw+29eCTloA0mOPaTH9TOxXYYKhFj2Ejyw7+p5M/shBtonOrj9
 NmheEgzKalrYjl0JdblpPy/YCPF+z/Nocv0KtpOzP9YYoPKeK55B6q0KelGgL8nKV7YO
 v81oGUS1+QgI5KdEmm11vTkiyW9XsEJxYbLvysCbU6gfHsFQ8VB6eJNtYiaA21BzeR3h
 iI3Z9Hjc1LwDuifGGxqK00fzh46FuBtyRp++UdYbrTWgbmglKUKpFBXiZXgDCxF67Lsg
 43A7/mtVTEBxZ46bsXZH3jSSH7kP4tmv7wQc9/qTO0sJogrA7P+uKHFsYaisztLJjqnh
 qpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aJwIe/CDClWkHFSq1yC+4dkDSmRHAsqZ+6zM4fUJyj0=;
 b=eZXItuwXWD6xVS4w6ieG2Ef0ztlrFawNozhKrsgkM6LeDmqKq1ES8M9Po7jEVoFee4
 +J/Pg4WW4wc6jlh5mBoENQOeLVcbeBGOxmXDbA+pOoIQOi8L52wQMGIiPf+uanu6FXq1
 S0Ftzig4GqIAQgmf6ksI3/V4P4fVlBuQ3xcuDHk7S77wCZY0CmY3cym8HOwnPxWBXPqA
 wzAJWWFyAj/RxsAxGK5n/qbbL/EdRnPa/YSm6d1lpApsfkOwiX4PvyDzMV/IFpVyzxuz
 XEtpJ89ncTZQw7PeKn60JTvyie2R92M4lKADWj6u03M12CVOl2lvvcfJgHyeqPhYRz9O
 n50Q==
X-Gm-Message-State: AOAM531lLiC9zTYYk3Y1/8DuSQLsNAot/Y7iJXr7S7XSKQGC+sF9mwSs
 SeieownAgQu2ujImR+5fAsxC/gs2h8pHsbnTDR4=
X-Google-Smtp-Source: ABdhPJyp5zVIKtCB23bH1cdmD3Ebd17KFxn3fcq2f1iB2+PhO27Hn9dneyhu2vT0nfc5f/7FiyG7uw==
X-Received: by 2002:a05:600c:34d6:: with SMTP id
 d22mr870057wmq.111.1637337931679; 
 Fri, 19 Nov 2021 08:05:31 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/35] target/ppc: Update float_invalid_op_div for new flags
Date: Fri, 19 Nov 2021 17:04:37 +0100
Message-Id: <20211119160502.17432-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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

Now that vxidi, vxzdz, and vxsnan are computed directly by
softfloat, we don't need to recompute it via classes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 23264e6528..2ab34236a3 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -509,17 +509,14 @@ float64 helper_fmul(CPUPPCState *env, float64 arg1, float64 arg2)
     return ret;
 }
 
-static void float_invalid_op_div(CPUPPCState *env, bool set_fprc,
-                                 uintptr_t retaddr, int classes)
+static void float_invalid_op_div(CPUPPCState *env, int flags,
+                                 bool set_fprc, uintptr_t retaddr)
 {
-    classes &= ~is_neg;
-    if (classes == is_inf) {
-        /* Division of infinity by infinity */
+    if (flags & float_flag_invalid_idi) {
         float_invalid_op_vxidi(env, set_fprc, retaddr);
-    } else if (classes == is_zero) {
-        /* Division of zero by zero */
+    } else if (flags & float_flag_invalid_zdz) {
         float_invalid_op_vxzdz(env, set_fprc, retaddr);
-    } else if (classes & is_snan) {
+    } else if (flags & float_flag_invalid_snan) {
         float_invalid_op_vxsnan(env, retaddr);
     }
 }
@@ -528,17 +525,13 @@ static void float_invalid_op_div(CPUPPCState *env, bool set_fprc,
 float64 helper_fdiv(CPUPPCState *env, float64 arg1, float64 arg2)
 {
     float64 ret = float64_div(arg1, arg2, &env->fp_status);
-    int status = get_float_exception_flags(&env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
 
-    if (unlikely(status)) {
-        if (status & float_flag_invalid) {
-            float_invalid_op_div(env, 1, GETPC(),
-                                 float64_classify(arg1) |
-                                 float64_classify(arg2));
-        }
-        if (status & float_flag_divbyzero) {
-            float_zero_divide_excp(env, GETPC());
-        }
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_div(env, flags, 1, GETPC());
+    }
+    if (unlikely(flags & float_flag_divbyzero)) {
+        float_zero_divide_excp(env, GETPC());
     }
 
     return ret;
@@ -1755,9 +1748,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
         env->fp_status.float_exception_flags |= tstat.float_exception_flags;  \
                                                                               \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {     \
-            float_invalid_op_div(env, sfprf, GETPC(),                         \
-                                 tp##_classify(xa->fld) |                     \
-                                 tp##_classify(xb->fld));                     \
+            float_invalid_op_div(env, tstat.float_exception_flags,            \
+                                 sfprf, GETPC());                             \
         }                                                                     \
         if (unlikely(tstat.float_exception_flags & float_flag_divbyzero)) {   \
             float_zero_divide_excp(env, GETPC());                             \
@@ -1798,9 +1790,7 @@ void helper_xsdivqp(CPUPPCState *env, uint32_t opcode,
     env->fp_status.float_exception_flags |= tstat.float_exception_flags;
 
     if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
-        float_invalid_op_div(env, 1, GETPC(),
-                             float128_classify(xa->f128) |
-                             float128_classify(xb->f128));
+        float_invalid_op_div(env, tstat.float_exception_flags, 1, GETPC());
     }
     if (unlikely(tstat.float_exception_flags & float_flag_divbyzero)) {
         float_zero_divide_excp(env, GETPC());
-- 
2.25.1


