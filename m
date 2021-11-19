Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F014572FB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:32:00 +0100 (CET)
Received: from localhost ([::1]:38936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6nv-0004vl-VK
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:31:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6P5-000743-Gc
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:26 -0500
Received: from [2a00:1450:4864:20::429] (port=37443
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6P3-0004Xf-8v
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:18 -0500
Received: by mail-wr1-x429.google.com with SMTP id b12so18966524wrh.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G4QJExPSah+FSTua5AAR2tAdrkplI0Jzq3IEAwxMM1s=;
 b=raDbrnyrRhEadiehxwvdz79Waw2nYiUmvSJrz95XqvaBnYVt7LUP1cQXhlD8pb6Spm
 IzPirRiJ8IwfA7QN21NE8uoMY3f570kmyDBKKMScLJ+/5wUVmBwF4RG6m6nbAx5gWfR7
 fhHZi6YIgV6phnXOQKtk3hPFJz9nrMfbMe4j5eUaCquzW7BXBnqFvnmtEUTvkm8VeGkG
 aqSK4w/t6qF2zlJBq0mCAriMPWIYuY7ow6l7cRl49DjarLOjhzaA4GRrOpmU1EQ7UG+7
 M1tOZpGOZG//MkS0I5STSk6iNGr63BVIP2wK62tRt2OTJULYdkrs3f3QLQWTnfFoe2bU
 c0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G4QJExPSah+FSTua5AAR2tAdrkplI0Jzq3IEAwxMM1s=;
 b=AlRrmZfqiobWz6Dq33R4sefDI6f8Rp2SCqujHhVokNwAoZaVsdcKImawcaKF8zs8X0
 pLTPB99TFUxVkWKEcjuhd79DUN/AO7rRivRj/ZO3oKGCRglEDpy3vzzqLvOCck7/tkgx
 axq29oh44fuUiNgWKN6aNS/DX0h4VY1mSm1uwT3hxBa+M0rzWoFkGTS8AjoJFfzEa7rH
 hqUM81anmrRSSsp8qMdHAqTBZaTH0gcLQj2mk3zP5Q6VlqZQFduIbsAiy++rpcBY4Y1w
 zwMgamr86KzmShiklQVkkyb+TQTD6z+Xt8+FiMPweevARcQwySy51Dt5NzGrq3n1bUnW
 /WmA==
X-Gm-Message-State: AOAM533ECsCpqvwhdZ+QRMv4mpVcX7iAKtoxMR8Q/32/kOhpBhHZx78P
 vUWyqWb7HARetyCZiL7sVjC5jbLtjwout7n4BxY=
X-Google-Smtp-Source: ABdhPJzAklPm5o3fHKexHL3Qf224dyhLsDvzLSbI/a8BfRS2flbQCTn9JY1g+t/1S+/CXiCFWv62HA==
X-Received: by 2002:adf:e882:: with SMTP id d2mr8749583wrm.389.1637337975736; 
 Fri, 19 Nov 2021 08:06:15 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:06:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/35] target/ppc: Add helper for fmuls
Date: Fri, 19 Nov 2021 17:04:58 +0100
Message-Id: <20211119160502.17432-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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

Use float64r32_mul.  Fixes a double-rounding issue with performing
the compuation in float64 and then rounding afterward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h                |  1 +
 target/ppc/fpu_helper.c            | 12 ++++++++++++
 target/ppc/translate/fp-impl.c.inc | 11 ++++-------
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f72b547603..9810d416cf 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -97,6 +97,7 @@ DEF_HELPER_3(fadds, f64, env, f64, f64)
 DEF_HELPER_3(fsub, f64, env, f64, f64)
 DEF_HELPER_3(fsubs, f64, env, f64, f64)
 DEF_HELPER_3(fmul, f64, env, f64, f64)
+DEF_HELPER_3(fmuls, f64, env, f64, f64)
 DEF_HELPER_3(fdiv, f64, env, f64, f64)
 DEF_HELPER_3(fdivs, f64, env, f64, f64)
 DEF_HELPER_4(fmadd, i64, env, i64, i64, i64)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 4048c830e7..6278d61d36 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -533,6 +533,18 @@ float64 helper_fmul(CPUPPCState *env, float64 arg1, float64 arg2)
     return ret;
 }
 
+/* fmuls - fmuls. */
+float64 helper_fmuls(CPUPPCState *env, float64 arg1, float64 arg2)
+{
+    float64 ret = float64r32_mul(arg1, arg2, &env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
+
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_mul(env, flags, 1, GETPC());
+    }
+    return ret;
+}
+
 static void float_invalid_op_div(CPUPPCState *env, int flags,
                                  bool set_fprc, uintptr_t retaddr)
 {
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 6ae556e5de..17b4d46040 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -100,7 +100,7 @@ static void gen_f##name(DisasContext *ctx)                                    \
 _GEN_FLOAT_AB(name, 0x3F, op2, inval, set_fprf, type);                        \
 _GEN_FLOAT_AB(name##s, 0x3B, op2, inval, set_fprf, type);
 
-#define _GEN_FLOAT_AC(name, op, op1, op2, inval, isfloat, set_fprf, type)     \
+#define _GEN_FLOAT_AC(name, op1, op2, inval, set_fprf, type)                  \
 static void gen_f##name(DisasContext *ctx)                                    \
 {                                                                             \
     TCGv_i64 t0;                                                              \
@@ -116,10 +116,7 @@ static void gen_f##name(DisasContext *ctx)                                    \
     gen_reset_fpstatus();                                                     \
     get_fpr(t0, rA(ctx->opcode));                                             \
     get_fpr(t1, rC(ctx->opcode));                                             \
-    gen_helper_f##op(t2, cpu_env, t0, t1);                                    \
-    if (isfloat) {                                                            \
-        gen_helper_frsp(t2, cpu_env, t2);                                     \
-    }                                                                         \
+    gen_helper_f##name(t2, cpu_env, t0, t1);                                  \
     set_fpr(rD(ctx->opcode), t2);                                             \
     if (set_fprf) {                                                           \
         gen_compute_fprf_float64(t2);                                         \
@@ -132,8 +129,8 @@ static void gen_f##name(DisasContext *ctx)                                    \
     tcg_temp_free_i64(t2);                                                    \
 }
 #define GEN_FLOAT_AC(name, op2, inval, set_fprf, type)                        \
-_GEN_FLOAT_AC(name, name, 0x3F, op2, inval, 0, set_fprf, type);               \
-_GEN_FLOAT_AC(name##s, name, 0x3B, op2, inval, 1, set_fprf, type);
+_GEN_FLOAT_AC(name, 0x3F, op2, inval, set_fprf, type);                        \
+_GEN_FLOAT_AC(name##s, 0x3B, op2, inval, set_fprf, type);
 
 #define GEN_FLOAT_B(name, op2, op3, set_fprf, type)                           \
 static void gen_f##name(DisasContext *ctx)                                    \
-- 
2.25.1


