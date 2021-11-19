Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C434572DB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:27:17 +0100 (CET)
Received: from localhost ([::1]:54372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6jM-0004En-Nu
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:27:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6P3-00070V-IL
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:17 -0500
Received: from [2a00:1450:4864:20::333] (port=39676
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6P1-0004Wk-Iq
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:17 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso10863261wmr.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IB5mK/irYaSsIUdttTFPE+PU+yRarLmo18yOEc7raNQ=;
 b=Uw+h46gfJkz88JG522PbxVJSHgBR2Y+8ezrMbQ6mxdZqvAqajp6B55FP7sRW4I77N5
 /33EVKM9M8MI7mRDuXkc3rX+kkIi7E+yK1t/p0Op9ZiNHlK1i1S97oefI+eukEAQdd0W
 Vc9vXU3caV/iQWetXt/70V0sQ7blRHyc00pFyD7X7N0R2mqzp5c9qNyVgmIr7C9KN9B9
 hcVIWzG/45iB+DUJdGznWlrubJEGsQu1BCiZyZIlP+EjC0Bde1lXrl4DfYAiRyDqt8fl
 q0iXbnVRJaqEHaaPY0ylb3vBNMDNxE16s4Y3t5Gdt+kSKp9nARtGdce6E1m2CFf6NQVe
 V7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IB5mK/irYaSsIUdttTFPE+PU+yRarLmo18yOEc7raNQ=;
 b=5eM3ioxG+lEQfk96ATjBP2V0buQK6VnyP6AwfdfCiK1hLLOgR3w16z3RH8mIjiwYVO
 O/eoyMbCXfqkjngUIQKklvh7xOBpuHtHJGlE2zJJcw4WDrk5Im98AdYNCO6P3wDIhMtZ
 wNdNHMpElhYMeO2VodJYk990lMn1CKusM8OIAdMlpVKTA1YPl8/sKhynbVCIf8qIzUtG
 N9Af2edo10ADfn3Gjt/FKqgmsEd3Yh98wnfxbp7bq3WHAmOLdjBD8LdOP84KqBkti8mN
 iMqy/AwFjqw9n2bJpLR1HguzV5InWB76sUTyc4aieEfynMjRMEP5lG5GuRj3QiDgmxvf
 YYZw==
X-Gm-Message-State: AOAM533pZbo+SN1xLBwTKkYC/nFE9rPReeV8KG/zIAfQx709JFP1dWSf
 ubtVB3x3tNLH6unKe8w0cAqzYaJEYVknjcUJPZo=
X-Google-Smtp-Source: ABdhPJw470LsE6M+3ghKN89NPGuj7KkXvDR1ydUKsQgYHVn0bdD5kVvaxF2MLmHLf7ydLnKXNe7Y7g==
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr832653wmq.109.1637337974186; 
 Fri, 19 Nov 2021 08:06:14 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:06:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/35] target/ppc: Add helpers for fadds, fsubs, fdivs
Date: Fri, 19 Nov 2021 17:04:57 +0100
Message-Id: <20211119160502.17432-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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

Use float64r32_{add,sub,div}.  Fixes a double-rounding issue with
performing the compuation in float64 and then rounding afterward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h                |  3 +++
 target/ppc/fpu_helper.c            | 40 ++++++++++++++++++++++++++++++
 target/ppc/translate/fp-impl.c.inc | 11 +++-----
 3 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index a6683dceec..f72b547603 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -93,9 +93,12 @@ DEF_HELPER_2(frip, i64, env, i64)
 DEF_HELPER_2(frim, i64, env, i64)
 
 DEF_HELPER_3(fadd, f64, env, f64, f64)
+DEF_HELPER_3(fadds, f64, env, f64, f64)
 DEF_HELPER_3(fsub, f64, env, f64, f64)
+DEF_HELPER_3(fsubs, f64, env, f64, f64)
 DEF_HELPER_3(fmul, f64, env, f64, f64)
 DEF_HELPER_3(fdiv, f64, env, f64, f64)
+DEF_HELPER_3(fdivs, f64, env, f64, f64)
 DEF_HELPER_4(fmadd, i64, env, i64, i64, i64)
 DEF_HELPER_4(fmsub, i64, env, i64, i64, i64)
 DEF_HELPER_4(fnmadd, i64, env, i64, i64, i64)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 7e275ea134..4048c830e7 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -473,6 +473,18 @@ float64 helper_fadd(CPUPPCState *env, float64 arg1, float64 arg2)
     return ret;
 }
 
+/* fadds - fadds. */
+float64 helper_fadds(CPUPPCState *env, float64 arg1, float64 arg2)
+{
+    float64 ret = float64r32_add(arg1, arg2, &env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
+
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_addsub(env, flags, 1, GETPC());
+    }
+    return ret;
+}
+
 /* fsub - fsub. */
 float64 helper_fsub(CPUPPCState *env, float64 arg1, float64 arg2)
 {
@@ -486,6 +498,18 @@ float64 helper_fsub(CPUPPCState *env, float64 arg1, float64 arg2)
     return ret;
 }
 
+/* fsubs - fsubs. */
+float64 helper_fsubs(CPUPPCState *env, float64 arg1, float64 arg2)
+{
+    float64 ret = float64r32_sub(arg1, arg2, &env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
+
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_addsub(env, flags, 1, GETPC());
+    }
+    return ret;
+}
+
 static void float_invalid_op_mul(CPUPPCState *env, int flags,
                                  bool set_fprc, uintptr_t retaddr)
 {
@@ -537,6 +561,22 @@ float64 helper_fdiv(CPUPPCState *env, float64 arg1, float64 arg2)
     return ret;
 }
 
+/* fdivs - fdivs. */
+float64 helper_fdivs(CPUPPCState *env, float64 arg1, float64 arg2)
+{
+    float64 ret = float64r32_div(arg1, arg2, &env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
+
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_div(env, flags, 1, GETPC());
+    }
+    if (unlikely(flags & float_flag_divbyzero)) {
+        float_zero_divide_excp(env, GETPC());
+    }
+
+    return ret;
+}
+
 static uint64_t float_invalid_cvt(CPUPPCState *env, int flags,
                                   uint64_t ret, uint64_t ret_nan,
                                   bool set_fprc, uintptr_t retaddr)
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 898de9fe53..6ae556e5de 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -68,7 +68,7 @@ static void gen_f##name(DisasContext *ctx)                                    \
 _GEN_FLOAT_ACB(name, 0x3F, op2, set_fprf, type);                              \
 _GEN_FLOAT_ACB(name##s, 0x3B, op2, set_fprf, type);
 
-#define _GEN_FLOAT_AB(name, op, op1, op2, inval, isfloat, set_fprf, type)     \
+#define _GEN_FLOAT_AB(name, op1, op2, inval, set_fprf, type)                  \
 static void gen_f##name(DisasContext *ctx)                                    \
 {                                                                             \
     TCGv_i64 t0;                                                              \
@@ -84,10 +84,7 @@ static void gen_f##name(DisasContext *ctx)                                    \
     gen_reset_fpstatus();                                                     \
     get_fpr(t0, rA(ctx->opcode));                                             \
     get_fpr(t1, rB(ctx->opcode));                                             \
-    gen_helper_f##op(t2, cpu_env, t0, t1);                                    \
-    if (isfloat) {                                                            \
-        gen_helper_frsp(t2, cpu_env, t2);                                     \
-    }                                                                         \
+    gen_helper_f##name(t2, cpu_env, t0, t1);                                  \
     set_fpr(rD(ctx->opcode), t2);                                             \
     if (set_fprf) {                                                           \
         gen_compute_fprf_float64(t2);                                         \
@@ -100,8 +97,8 @@ static void gen_f##name(DisasContext *ctx)                                    \
     tcg_temp_free_i64(t2);                                                    \
 }
 #define GEN_FLOAT_AB(name, op2, inval, set_fprf, type)                        \
-_GEN_FLOAT_AB(name, name, 0x3F, op2, inval, 0, set_fprf, type);               \
-_GEN_FLOAT_AB(name##s, name, 0x3B, op2, inval, 1, set_fprf, type);
+_GEN_FLOAT_AB(name, 0x3F, op2, inval, set_fprf, type);                        \
+_GEN_FLOAT_AB(name##s, 0x3B, op2, inval, set_fprf, type);
 
 #define _GEN_FLOAT_AC(name, op, op1, op2, inval, isfloat, set_fprf, type)     \
 static void gen_f##name(DisasContext *ctx)                                    \
-- 
2.25.1


