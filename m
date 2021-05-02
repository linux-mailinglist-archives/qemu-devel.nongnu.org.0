Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FDC370D73
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:49:47 +0200 (CEST)
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDPm-0006kb-A6
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKk-0001T4-UF
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:34 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKh-0005DU-Ld
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:34 -0400
Received: by mail-pg1-x52e.google.com with SMTP id t22so1939088pgu.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aStbYbKUiD4TllqxrNl7dSzCGKZHpmJE5GcojLzrLOI=;
 b=vU9yPba4ULLo89e501hXyXIy/Fad9OpVKSJVXYe2x9rLRSyNhCobF++g6lWRZwY7pP
 +73b1wgWeyyD8bTPGWC7VEz5hXAcDcF4Pi04SQJ1LB4jWJoqvrL94VvOETLfnqDyupTs
 lVm/ULnXMt46rtmzAdxkocXEMR4NOUDC9toSdh6tNpX/WPTaUjV8YL/XY7jk18pSTs0j
 bZeliEm5sQw9YDtT/9/gJBEXydKz4YpWQHqGoLtbr8gp7UrFAWTSec0DxMNsNpOBiHPD
 PX3TI84q96VPwK2A31timBveNNIHlDB99R7+53lEiRUAiw1CWkiTDg3laEJi8VElZGKN
 fuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aStbYbKUiD4TllqxrNl7dSzCGKZHpmJE5GcojLzrLOI=;
 b=JP1yo1N1zWq6RUeXhk5zFMiC2vaA6RIRBcxAFv8fMaEpDb9CShNmwxYoGD1QyA/EPQ
 cRs7masIji6Gf/VTLhFZIXIyKQBVMZIAzqmLfY8BIfcecpFzuxeLO/lCnvnDJx9x7cZ6
 LNqfYhCejhSFLkZkD8KqtsLvUizBXMjq9T9FffMLEfDN4ZcYQ0C4+RrIQNEHlHYcfOff
 9ehRVc+byq1t9SQlgwI9nF5GeIPi17/Ry1PTy4zq44IxikS7fuJbi/Kcn/YWUDYn6a7x
 uXx2qYGY/N8rgC/Eu6fVHUQvvzMnC3yr5AkuR2J4TCgQ3GLb5FcR4GTzLEPv5DJUvQlw
 Z5pQ==
X-Gm-Message-State: AOAM5334z/q8BE3NOaK2VSwEnr5Lnjtj+1Md9RHvmUkRTxwzOJdOc2N+
 L2cvBhp7uB7oE5YkpDHvULpIMpw2LCje3w==
X-Google-Smtp-Source: ABdhPJxQ81Y46VTED1itomi4Tqn+MPkk8vgjbfMAuAJ7EC9+U7dVZdyQ3f95DTP8KAYOX6LtVWvYRw==
X-Received: by 2002:a65:4485:: with SMTP id l5mr13847699pgq.209.1619966670331; 
 Sun, 02 May 2021 07:44:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 15/31] Hexagon (target/hexagon) use softfloat default NaN
 and tininess
Date: Sun,  2 May 2021 07:44:03 -0700
Message-Id: <20210502144419.1659844-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-11-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu.c           |  5 ++++
 target/hexagon/op_helper.c     | 47 ----------------------------------
 fpu/softfloat-specialize.c.inc |  3 +++
 3 files changed, 8 insertions(+), 47 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index f044506d0f..ff44fd6637 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -23,6 +23,7 @@
 #include "exec/exec-all.h"
 #include "qapi/error.h"
 #include "hw/qdev-properties.h"
+#include "fpu/softfloat-helpers.h"
 
 static void hexagon_v67_cpu_init(Object *obj)
 {
@@ -205,8 +206,12 @@ static void hexagon_cpu_reset(DeviceState *dev)
     CPUState *cs = CPU(dev);
     HexagonCPU *cpu = HEXAGON_CPU(cs);
     HexagonCPUClass *mcc = HEXAGON_CPU_GET_CLASS(cpu);
+    CPUHexagonState *env = &cpu->env;
 
     mcc->parent_reset(dev);
+
+    set_default_nan_mode(1, &env->fp_status);
+    set_float_detect_tininess(float_tininess_before_rounding, &env->fp_status);
 }
 
 static void hexagon_cpu_disas_set_info(CPUState *s, disassemble_info *info)
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 1d91fa2743..478421d147 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -296,26 +296,6 @@ int32_t HELPER(fcircadd)(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
     return new_ptr;
 }
 
-/*
- * Hexagon FP operations return ~0 instead of NaN
- * The hex_check_sfnan/hex_check_dfnan functions perform this check
- */
-static float32 hex_check_sfnan(float32 x)
-{
-    if (float32_is_any_nan(x)) {
-        return make_float32(0xFFFFFFFFU);
-    }
-    return x;
-}
-
-static float64 hex_check_dfnan(float64 x)
-{
-    if (float64_is_any_nan(x)) {
-        return make_float64(0xFFFFFFFFFFFFFFFFULL);
-    }
-    return x;
-}
-
 /*
  * mem_noshuf
  * Section 5.5 of the Hexagon V67 Programmer's Reference Manual
@@ -373,7 +353,6 @@ float64 HELPER(conv_sf2df)(CPUHexagonState *env, float32 RsV)
     float64 out_f64;
     arch_fpop_start(env);
     out_f64 = float32_to_float64(RsV, &env->fp_status);
-    out_f64 = hex_check_dfnan(out_f64);
     arch_fpop_end(env);
     return out_f64;
 }
@@ -383,7 +362,6 @@ float32 HELPER(conv_df2sf)(CPUHexagonState *env, float64 RssV)
     float32 out_f32;
     arch_fpop_start(env);
     out_f32 = float64_to_float32(RssV, &env->fp_status);
-    out_f32 = hex_check_sfnan(out_f32);
     arch_fpop_end(env);
     return out_f32;
 }
@@ -393,7 +371,6 @@ float32 HELPER(conv_uw2sf)(CPUHexagonState *env, int32_t RsV)
     float32 RdV;
     arch_fpop_start(env);
     RdV = uint32_to_float32(RsV, &env->fp_status);
-    RdV = hex_check_sfnan(RdV);
     arch_fpop_end(env);
     return RdV;
 }
@@ -403,7 +380,6 @@ float64 HELPER(conv_uw2df)(CPUHexagonState *env, int32_t RsV)
     float64 RddV;
     arch_fpop_start(env);
     RddV = uint32_to_float64(RsV, &env->fp_status);
-    RddV = hex_check_dfnan(RddV);
     arch_fpop_end(env);
     return RddV;
 }
@@ -413,7 +389,6 @@ float32 HELPER(conv_w2sf)(CPUHexagonState *env, int32_t RsV)
     float32 RdV;
     arch_fpop_start(env);
     RdV = int32_to_float32(RsV, &env->fp_status);
-    RdV = hex_check_sfnan(RdV);
     arch_fpop_end(env);
     return RdV;
 }
@@ -423,7 +398,6 @@ float64 HELPER(conv_w2df)(CPUHexagonState *env, int32_t RsV)
     float64 RddV;
     arch_fpop_start(env);
     RddV = int32_to_float64(RsV, &env->fp_status);
-    RddV = hex_check_dfnan(RddV);
     arch_fpop_end(env);
     return RddV;
 }
@@ -433,7 +407,6 @@ float32 HELPER(conv_ud2sf)(CPUHexagonState *env, int64_t RssV)
     float32 RdV;
     arch_fpop_start(env);
     RdV = uint64_to_float32(RssV, &env->fp_status);
-    RdV = hex_check_sfnan(RdV);
     arch_fpop_end(env);
     return RdV;
 }
@@ -443,7 +416,6 @@ float64 HELPER(conv_ud2df)(CPUHexagonState *env, int64_t RssV)
     float64 RddV;
     arch_fpop_start(env);
     RddV = uint64_to_float64(RssV, &env->fp_status);
-    RddV = hex_check_dfnan(RddV);
     arch_fpop_end(env);
     return RddV;
 }
@@ -453,7 +425,6 @@ float32 HELPER(conv_d2sf)(CPUHexagonState *env, int64_t RssV)
     float32 RdV;
     arch_fpop_start(env);
     RdV = int64_to_float32(RssV, &env->fp_status);
-    RdV = hex_check_sfnan(RdV);
     arch_fpop_end(env);
     return RdV;
 }
@@ -463,7 +434,6 @@ float64 HELPER(conv_d2df)(CPUHexagonState *env, int64_t RssV)
     float64 RddV;
     arch_fpop_start(env);
     RddV = int64_to_float64(RssV, &env->fp_status);
-    RddV = hex_check_dfnan(RddV);
     arch_fpop_end(env);
     return RddV;
 }
@@ -625,7 +595,6 @@ float32 HELPER(sfadd)(CPUHexagonState *env, float32 RsV, float32 RtV)
     float32 RdV;
     arch_fpop_start(env);
     RdV = float32_add(RsV, RtV, &env->fp_status);
-    RdV = hex_check_sfnan(RdV);
     arch_fpop_end(env);
     return RdV;
 }
@@ -635,7 +604,6 @@ float32 HELPER(sfsub)(CPUHexagonState *env, float32 RsV, float32 RtV)
     float32 RdV;
     arch_fpop_start(env);
     RdV = float32_sub(RsV, RtV, &env->fp_status);
-    RdV = hex_check_sfnan(RdV);
     arch_fpop_end(env);
     return RdV;
 }
@@ -687,7 +655,6 @@ float32 HELPER(sfmax)(CPUHexagonState *env, float32 RsV, float32 RtV)
     float32 RdV;
     arch_fpop_start(env);
     RdV = float32_maxnum(RsV, RtV, &env->fp_status);
-    RdV = hex_check_sfnan(RdV);
     arch_fpop_end(env);
     return RdV;
 }
@@ -697,7 +664,6 @@ float32 HELPER(sfmin)(CPUHexagonState *env, float32 RsV, float32 RtV)
     float32 RdV;
     arch_fpop_start(env);
     RdV = float32_minnum(RsV, RtV, &env->fp_status);
-    RdV = hex_check_sfnan(RdV);
     arch_fpop_end(env);
     return RdV;
 }
@@ -764,7 +730,6 @@ float64 HELPER(dfadd)(CPUHexagonState *env, float64 RssV, float64 RttV)
     float64 RddV;
     arch_fpop_start(env);
     RddV = float64_add(RssV, RttV, &env->fp_status);
-    RddV = hex_check_dfnan(RddV);
     arch_fpop_end(env);
     return RddV;
 }
@@ -774,7 +739,6 @@ float64 HELPER(dfsub)(CPUHexagonState *env, float64 RssV, float64 RttV)
     float64 RddV;
     arch_fpop_start(env);
     RddV = float64_sub(RssV, RttV, &env->fp_status);
-    RddV = hex_check_dfnan(RddV);
     arch_fpop_end(env);
     return RddV;
 }
@@ -787,7 +751,6 @@ float64 HELPER(dfmax)(CPUHexagonState *env, float64 RssV, float64 RttV)
     if (float64_is_any_nan(RssV) || float64_is_any_nan(RttV)) {
         float_raise(float_flag_invalid, &env->fp_status);
     }
-    RddV = hex_check_dfnan(RddV);
     arch_fpop_end(env);
     return RddV;
 }
@@ -800,7 +763,6 @@ float64 HELPER(dfmin)(CPUHexagonState *env, float64 RssV, float64 RttV)
     if (float64_is_any_nan(RssV) || float64_is_any_nan(RttV)) {
         float_raise(float_flag_invalid, &env->fp_status);
     }
-    RddV = hex_check_dfnan(RddV);
     arch_fpop_end(env);
     return RddV;
 }
@@ -876,7 +838,6 @@ float32 HELPER(sfmpy)(CPUHexagonState *env, float32 RsV, float32 RtV)
     float32 RdV;
     arch_fpop_start(env);
     RdV = internal_mpyf(RsV, RtV, &env->fp_status);
-    RdV = hex_check_sfnan(RdV);
     arch_fpop_end(env);
     return RdV;
 }
@@ -886,7 +847,6 @@ float32 HELPER(sffma)(CPUHexagonState *env, float32 RxV,
 {
     arch_fpop_start(env);
     RxV = internal_fmafx(RsV, RtV, RxV, 0, &env->fp_status);
-    RxV = hex_check_sfnan(RxV);
     arch_fpop_end(env);
     return RxV;
 }
@@ -918,7 +878,6 @@ float32 HELPER(sffma_sc)(CPUHexagonState *env, float32 RxV,
     RxV = check_nan(RxV, RsV, &env->fp_status);
     RxV = check_nan(RxV, RtV, &env->fp_status);
     tmp = internal_fmafx(RsV, RtV, RxV, fSXTN(8, 64, PuV), &env->fp_status);
-    tmp = hex_check_sfnan(tmp);
     if (!(float32_is_zero(RxV) && is_zero_prod(RsV, RtV))) {
         RxV = tmp;
     }
@@ -933,7 +892,6 @@ float32 HELPER(sffms)(CPUHexagonState *env, float32 RxV,
     arch_fpop_start(env);
     neg_RsV = float32_sub(float32_zero, RsV, &env->fp_status);
     RxV = internal_fmafx(neg_RsV, RtV, RxV, 0, &env->fp_status);
-    RxV = hex_check_sfnan(RxV);
     arch_fpop_end(env);
     return RxV;
 }
@@ -964,7 +922,6 @@ float32 HELPER(sffma_lib)(CPUHexagonState *env, float32 RxV,
     RxV = check_nan(RxV, RsV, &env->fp_status);
     RxV = check_nan(RxV, RtV, &env->fp_status);
     tmp = internal_fmafx(RsV, RtV, RxV, 0, &env->fp_status);
-    tmp = hex_check_sfnan(tmp);
     if (!(float32_is_zero(RxV) && is_zero_prod(RsV, RtV))) {
         RxV = tmp;
     }
@@ -999,7 +956,6 @@ float32 HELPER(sffms_lib)(CPUHexagonState *env, float32 RxV,
     RxV = check_nan(RxV, RtV, &env->fp_status);
     float32 minus_RsV = float32_sub(float32_zero, RsV, &env->fp_status);
     tmp = internal_fmafx(minus_RsV, RtV, RxV, 0, &env->fp_status);
-    tmp = hex_check_sfnan(tmp);
     if (!(float32_is_zero(RxV) && is_zero_prod(RsV, RtV))) {
         RxV = tmp;
     }
@@ -1023,13 +979,11 @@ float64 HELPER(dfmpyfix)(CPUHexagonState *env, float64 RssV, float64 RttV)
         float64_is_normal(RttV)) {
         RddV = float64_mul(RssV, make_float64(0x4330000000000000),
                            &env->fp_status);
-        RddV = hex_check_dfnan(RddV);
     } else if (float64_is_denormal(RttV) &&
                (float64_getexp(RssV) >= 512) &&
                float64_is_normal(RssV)) {
         RddV = float64_mul(RssV, make_float64(0x3cb0000000000000),
                            &env->fp_status);
-        RddV = hex_check_dfnan(RddV);
     } else {
         RddV = RssV;
     }
@@ -1042,7 +996,6 @@ float64 HELPER(dfmpyhh)(CPUHexagonState *env, float64 RxxV,
 {
     arch_fpop_start(env);
     RxxV = internal_mpyhh(RssV, RttV, RxxV, &env->fp_status);
-    RxxV = hex_check_dfnan(RxxV);
     arch_fpop_end(env);
     return RxxV;
 }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index c2f87addb2..9ea318f3e2 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -145,6 +145,9 @@ static FloatParts parts_default_nan(float_status *status)
 #elif defined(TARGET_HPPA)
     /* snan_bit_is_one, set msb-1.  */
     frac = 1ULL << (DECOMPOSED_BINARY_POINT - 2);
+#elif defined(TARGET_HEXAGON)
+    sign = 1;
+    frac = ~0ULL;
 #else
     /* This case is true for Alpha, ARM, MIPS, OpenRISC, PPC, RISC-V,
      * S390, SH4, TriCore, and Xtensa.  I cannot find documentation
-- 
2.25.1


