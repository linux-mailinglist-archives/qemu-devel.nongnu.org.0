Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD14845730E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:32:44 +0100 (CET)
Received: from localhost ([::1]:40802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6od-0006Fl-VP
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:32:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6P0-0006pI-Ci
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:14 -0500
Received: from [2a00:1450:4864:20::32a] (port=54871
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Oy-0004VT-D2
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:14 -0500
Received: by mail-wm1-x32a.google.com with SMTP id i12so8962923wmq.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5FSYrrr1a7ZftVvc2Pz+uGJWEMEubZTsphTz8FBcu/Y=;
 b=CRRkD1JIC7/boKQYfK/xYK+dtLsKoXx7mRzLz0Kk14DLb33tYVTzMM0uy85I3dwV5M
 1aqXnt6tQT4v1bSDZG1ll3II5n7Gv42PspBh+pdp5XJs+nmWoL9HvIgR6qypYtFHB7Jo
 WGzVdHtvJp1TEjEEi61P9bLY6sdQhB5LQGKQtItUxF9ypCZVx8gQ6Wxl91FMAcko+65p
 AEwVUlZPmpXQ3mk6gfrjDj1UdSyvEiE/pn3727iRNR3bpVX7MY/A3SSD6aSMtF9p6Uly
 Tt868eVIeX8ZXj71RXRVwA7x6Bo8AbablgwO5L3OGr728ka+SubpP/GTMXoopjIXS4QF
 qgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5FSYrrr1a7ZftVvc2Pz+uGJWEMEubZTsphTz8FBcu/Y=;
 b=gv2rH/XhwJe+7ZvH7A/eXzULOvnBNc/0bMyMyxsu+FF4+6vqo5/plYmgLXfQLZF57x
 pOghAABczT+v2jSX0Tt6DcJUfIfEgm7uQRtOUKNIj9t59y/GeFQxQcI11vZQznvHMRTz
 4kxM1LDIXvhIkDaek9geInLEH54n+2UBq0jSmL1jV39QfeiQ2CkqEjXNgkDnVlh1nEHw
 NDtNmO0fDSW2uxyFgMxNX/ZQs4KIkbcYLiFIACyvKDhwX8DxZiienAvJpLhwNqvlSuvy
 lMcNhy9ECu0Q8pc01njTfDso+0Qzib9Ka9iQf+QssG2HmA/0HAJ4QGQ6tD8wJaAZE+Zz
 uJjw==
X-Gm-Message-State: AOAM533NPc1gqTfzwGUxQ8hP3nQ3RHEq2ScyGCzfuzmr+bhEMnH/lka2
 pfYJRfAWh2dVZgFdFpgmbUYJhwbDN18X1ulBUvs=
X-Google-Smtp-Source: ABdhPJx7MZo28+XLPSqr0mqdFR3T/fgxUIYL/hUsprmykie0AdbpantInBXVaomiBzc5Wn70FMX0xA==
X-Received: by 2002:a1c:448b:: with SMTP id r133mr880408wma.85.1637337970951; 
 Fri, 19 Nov 2021 08:06:10 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:06:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/35] target/ppc: Add helpers for fmadds et al
Date: Fri, 19 Nov 2021 17:04:55 +0100
Message-Id: <20211119160502.17432-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
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

Use float64r32_muladd.  Fixes a double-rounding issue with performing
the compuation in float64 and then rounding afterward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h                |  4 ++++
 target/ppc/fpu_helper.c            | 17 ++++++++++++++++-
 target/ppc/translate/fp-impl.c.inc | 13 +++++--------
 3 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 627811cefc..ca893e1232 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -100,6 +100,10 @@ DEF_HELPER_4(fmadd, i64, env, i64, i64, i64)
 DEF_HELPER_4(fmsub, i64, env, i64, i64, i64)
 DEF_HELPER_4(fnmadd, i64, env, i64, i64, i64)
 DEF_HELPER_4(fnmsub, i64, env, i64, i64, i64)
+DEF_HELPER_4(fmadds, i64, env, i64, i64, i64)
+DEF_HELPER_4(fmsubs, i64, env, i64, i64, i64)
+DEF_HELPER_4(fnmadds, i64, env, i64, i64, i64)
+DEF_HELPER_4(fnmsubs, i64, env, i64, i64, i64)
 DEF_HELPER_2(fsqrt, f64, env, f64)
 DEF_HELPER_2(fre, i64, env, i64)
 DEF_HELPER_2(fres, i64, env, i64)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 7b4407e189..5caeed2c45 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -657,10 +657,25 @@ static float64 do_fmadd(CPUPPCState *env, float64 a, float64 b,
     return ret;
 }
 
+static uint64_t do_fmadds(CPUPPCState *env, float64 a, float64 b,
+                          float64 c, int madd_flags, uintptr_t retaddr)
+{
+    float64 ret = float64r32_muladd(a, b, c, madd_flags, &env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
+
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_madd(env, flags, 1, retaddr);
+    }
+    return ret;
+}
+
 #define FPU_FMADD(op, madd_flags)                                    \
     uint64_t helper_##op(CPUPPCState *env, uint64_t arg1,            \
                          uint64_t arg2, uint64_t arg3)               \
-    { return do_fmadd(env, arg1, arg2, arg3, madd_flags, GETPC()); }
+    { return do_fmadd(env, arg1, arg2, arg3, madd_flags, GETPC()); } \
+    uint64_t helper_##op##s(CPUPPCState *env, uint64_t arg1,         \
+                         uint64_t arg2, uint64_t arg3)               \
+    { return do_fmadds(env, arg1, arg2, arg3, madd_flags, GETPC()); }
 
 #define MADD_FLGS 0
 #define MSUB_FLGS float_muladd_negate_c
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index aad97a12e8..b1af4bef61 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -31,7 +31,7 @@ static void gen_set_cr1_from_fpscr(DisasContext *ctx)
 #endif
 
 /***                       Floating-Point arithmetic                       ***/
-#define _GEN_FLOAT_ACB(name, op, op1, op2, isfloat, set_fprf, type)           \
+#define _GEN_FLOAT_ACB(name, op1, op2, set_fprf, type)                        \
 static void gen_f##name(DisasContext *ctx)                                    \
 {                                                                             \
     TCGv_i64 t0;                                                              \
@@ -50,10 +50,7 @@ static void gen_f##name(DisasContext *ctx)                                    \
     get_fpr(t0, rA(ctx->opcode));                                             \
     get_fpr(t1, rC(ctx->opcode));                                             \
     get_fpr(t2, rB(ctx->opcode));                                             \
-    gen_helper_f##op(t3, cpu_env, t0, t1, t2);                                \
-    if (isfloat) {                                                            \
-        gen_helper_frsp(t3, cpu_env, t3);                                     \
-    }                                                                         \
+    gen_helper_f##name(t3, cpu_env, t0, t1, t2);                              \
     set_fpr(rD(ctx->opcode), t3);                                             \
     if (set_fprf) {                                                           \
         gen_compute_fprf_float64(t3);                                         \
@@ -68,8 +65,8 @@ static void gen_f##name(DisasContext *ctx)                                    \
 }
 
 #define GEN_FLOAT_ACB(name, op2, set_fprf, type)                              \
-_GEN_FLOAT_ACB(name, name, 0x3F, op2, 0, set_fprf, type);                     \
-_GEN_FLOAT_ACB(name##s, name, 0x3B, op2, 1, set_fprf, type);
+_GEN_FLOAT_ACB(name, 0x3F, op2, set_fprf, type);                              \
+_GEN_FLOAT_ACB(name##s, 0x3B, op2, set_fprf, type);
 
 #define _GEN_FLOAT_AB(name, op, op1, op2, inval, isfloat, set_fprf, type)     \
 static void gen_f##name(DisasContext *ctx)                                    \
@@ -233,7 +230,7 @@ static void gen_frsqrtes(DisasContext *ctx)
 }
 
 /* fsel */
-_GEN_FLOAT_ACB(sel, sel, 0x3F, 0x17, 0, 0, PPC_FLOAT_FSEL);
+_GEN_FLOAT_ACB(sel, 0x3F, 0x17, 0, PPC_FLOAT_FSEL);
 /* fsub - fsubs */
 GEN_FLOAT_AB(sub, 0x14, 0x000007C0, 1, PPC_FLOAT);
 /* Optional: */
-- 
2.25.1


