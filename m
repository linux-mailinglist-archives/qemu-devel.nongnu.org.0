Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749E134875A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 04:11:07 +0100 (CET)
Received: from localhost ([::1]:48868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPGOo-00085t-Fp
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 23:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG54-0003Wr-A3
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:42 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:22854)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG4z-0002jd-90
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616640637; x=1648176637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zv0c/bMh9A2p6l98XySvwf3wixFcSgRYJANVVKa4XaE=;
 b=mu6gRxJDd6BGDeFhPF8u2y7UHEXQ3B6D75/JvuHe7P2X0GZ4VfNorG/p
 fTWwnfAoclEUWevfr6A4TerAyoV9/v8f2EOcLPaOfi2/d8KvyokY3ly0r
 qpmGJINWZtLDPv3CETG+xeB0w6kjV/U0EnIzEt50q6Syoa42MVmATcfOt 8=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Mar 2021 19:50:16 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 24 Mar 2021 19:50:13 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 06ADF169A; Wed, 24 Mar 2021 21:50:12 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/15] Hexagon (target/hexagon) use softfloat default NaN and
 tininess
Date: Wed, 24 Mar 2021 21:50:02 -0500
Message-Id: <1616640610-17319-8-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Address feedback from Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 fpu/softfloat-specialize.c.inc |  5 +++++
 target/hexagon/cpu.c           |  5 +++++
 target/hexagon/op_helper.c     | 47 ------------------------------------------
 3 files changed, 10 insertions(+), 47 deletions(-)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index c2f87ad..c7ab148 100644
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
@@ -180,6 +183,8 @@ static FloatParts parts_silence_nan(FloatParts a, float_status *status)
 #if defined(TARGET_HPPA)
     a.frac &= ~(1ULL << (DECOMPOSED_BINARY_POINT - 1));
     a.frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 2);
+#elif defined(TARGET_HEXAGON)
+    return parts_default_nan(status);
 #else
     if (snan_bit_is_one(status)) {
         return parts_default_nan(status);
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 002275a..ed829ce 100644
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
index 6a364ea..2ceca39 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -297,26 +297,6 @@ int32_t HELPER(fcircadd)(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
 }
 
 /*
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
-/*
  * mem_noshuf
  * Section 5.5 of the Hexagon V67 Programmer's Reference Manual
  *
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
-- 
2.7.4


