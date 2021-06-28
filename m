Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715313B5D97
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:08:01 +0200 (CEST)
Received: from localhost ([::1]:33478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxq3U-0005jY-F6
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq0w-0002ku-JQ
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:22 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45596 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq0p-0001DT-O4
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:22 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S17; 
 Mon, 28 Jun 2021 20:05:02 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/20] target/loongarch: Add floating point conversion
 instruction translation
Date: Mon, 28 Jun 2021 20:04:40 +0800
Message-Id: <1624881885-31692-16-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S17
X-Coremail-Antispam: 1UD129KBjvAXoWfKr4rZFW7Aw1kWrWfJFy5Arb_yoW5CF1kCo
 WUuF15Aw4rGw47urZYkws8Xw4IqryDCF4fGr9Iv34kWFn7Cr4UKFyfWrn5AayftrWFvrW5
 XF9ayFn3Aw13Ar93n29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement floating point conversion instruction translation.

This includes:
- FCVT.S.D, FCVT.D.S
- FFINT.{S/D}.{W/L}, FTINT.{W/L}.{S/D}
- FTINT{RM/RP/RZ/RNE}.{W/L}.{S/D}
- FRINT.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/fpu_helper.c | 362 ++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/helper.h     |  29 ++++
 target/loongarch/insns.decode |  32 ++++
 target/loongarch/instmap.h    |  29 ++++
 target/loongarch/trans.inc.c  | 169 ++++++++++++++++++++
 target/loongarch/translate.c  | 318 +++++++++++++++++++++++++++++++++++++
 6 files changed, 939 insertions(+)

diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index 2c85113..e72fbc4 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -992,3 +992,365 @@ uint64_t helper_fp_cmp_sune_d(CPULoongArchState *env, uint64_t fp,
         return 0;
     }
 }
+
+/* floating point conversion */
+uint64_t helper_fp_cvt_d_s(CPULoongArchState *env, uint32_t src)
+{
+    uint64_t dest;
+
+    dest = float32_to_float64(src, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint64_t helper_fp_fint_d_w(CPULoongArchState *env, uint32_t src)
+{
+    uint64_t dest;
+
+    dest = int32_to_float64(src, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint64_t helper_fp_fint_d_l(CPULoongArchState *env, uint64_t src)
+{
+    uint64_t dest;
+
+    dest = int64_to_float64(src, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint32_t helper_fp_cvt_s_d(CPULoongArchState *env, uint64_t src)
+{
+    uint32_t dest;
+
+    dest = float64_to_float32(src, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint32_t helper_fp_fint_s_w(CPULoongArchState *env, uint32_t src)
+{
+    uint32_t dest;
+
+    dest = int32_to_float32(src, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint32_t helper_fp_fint_s_l(CPULoongArchState *env, uint64_t src)
+{
+    uint32_t dest;
+
+    dest = int64_to_float32(src, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint64_t helper_fp_tintrm_l_d(CPULoongArchState *env, uint64_t src)
+{
+    uint64_t dest;
+
+    set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status);
+    dest = float64_to_int64(src, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint64_t helper_fp_tintrm_l_s(CPULoongArchState *env, uint32_t src)
+{
+    uint64_t dest;
+
+    set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status);
+    dest = float32_to_int64(src, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint32_t helper_fp_tintrm_w_d(CPULoongArchState *env, uint64_t src)
+{
+    uint32_t dest;
+
+    set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status);
+    dest = float64_to_int32(src, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint32_t helper_fp_tintrm_w_s(CPULoongArchState *env, uint32_t src)
+{
+    uint32_t dest;
+
+    set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status);
+    dest = float32_to_int32(src, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint64_t helper_fp_tintrp_l_d(CPULoongArchState *env, uint64_t src)
+{
+    uint64_t dest;
+
+    set_float_rounding_mode(float_round_up, &env->active_fpu.fp_status);
+    dest = float64_to_int64(src, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint64_t helper_fp_tintrp_l_s(CPULoongArchState *env, uint32_t src)
+{
+    uint64_t dest;
+
+    set_float_rounding_mode(float_round_up, &env->active_fpu.fp_status);
+    dest = float32_to_int64(src, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint32_t helper_fp_tintrp_w_d(CPULoongArchState *env, uint64_t src)
+{
+    uint32_t dest;
+
+    set_float_rounding_mode(float_round_up, &env->active_fpu.fp_status);
+    dest = float64_to_int32(src, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint32_t helper_fp_tintrp_w_s(CPULoongArchState *env, uint32_t src)
+{
+    uint32_t dest;
+
+    set_float_rounding_mode(float_round_up, &env->active_fpu.fp_status);
+    dest = float32_to_int32(src, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint64_t helper_fp_tintrz_l_d(CPULoongArchState *env, uint64_t src)
+{
+    uint64_t dest;
+
+    dest = float64_to_int64_round_to_zero(src,
+                                         &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint64_t helper_fp_tintrz_l_s(CPULoongArchState *env, uint32_t src)
+{
+    uint64_t dest;
+
+    dest = float32_to_int64_round_to_zero(src, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint32_t helper_fp_tintrz_w_d(CPULoongArchState *env, uint64_t src)
+{
+    uint32_t dest;
+
+    dest = float64_to_int32_round_to_zero(src, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint32_t helper_fp_tintrz_w_s(CPULoongArchState *env, uint32_t src)
+{
+    uint32_t dest;
+
+    dest = float32_to_int32_round_to_zero(src, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint64_t helper_fp_tintrne_l_d(CPULoongArchState *env, uint64_t src)
+{
+    uint64_t dest;
+
+    set_float_rounding_mode(float_round_nearest_even,
+                            &env->active_fpu.fp_status);
+    dest = float64_to_int64(src, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint64_t helper_fp_tintrne_l_s(CPULoongArchState *env, uint32_t src)
+{
+    uint64_t dest;
+
+    set_float_rounding_mode(float_round_nearest_even,
+                            &env->active_fpu.fp_status);
+    dest = float32_to_int64(src, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint32_t helper_fp_tintrne_w_d(CPULoongArchState *env, uint64_t src)
+{
+    uint32_t dest;
+
+    set_float_rounding_mode(float_round_nearest_even,
+                            &env->active_fpu.fp_status);
+    dest = float64_to_int32(src, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint32_t helper_fp_tintrne_w_s(CPULoongArchState *env, uint32_t src)
+{
+    uint32_t dest;
+
+    set_float_rounding_mode(float_round_nearest_even,
+                            &env->active_fpu.fp_status);
+    dest = float32_to_int32(src, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint64_t helper_fp_tint_l_d(CPULoongArchState *env, uint64_t src)
+{
+    uint64_t dest;
+
+    dest = float64_to_int64(src, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint64_t helper_fp_tint_l_s(CPULoongArchState *env, uint32_t src)
+{
+    uint64_t dest;
+
+    dest = float32_to_int64(src, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint32_t helper_fp_tint_w_s(CPULoongArchState *env, uint32_t src)
+{
+    uint32_t dest;
+
+    dest = float32_to_int32(src, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint32_t helper_fp_tint_w_d(CPULoongArchState *env, uint64_t src)
+{
+    uint32_t dest;
+
+    dest = float64_to_int32(src, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dest = FP_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint32_t helper_fp_rint_s(CPULoongArchState *env, uint32_t src)
+{
+    uint32_t dest;
+
+    dest = float32_round_to_int(src, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return dest;
+}
+
+uint64_t helper_fp_rint_d(CPULoongArchState *env, uint64_t src)
+{
+    uint64_t dest;
+
+    dest = float64_round_to_int(src, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return dest;
+}
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index b1a81c5..9ec2b53 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -69,6 +69,8 @@ DEF_HELPER_2(fp_rsqrt_s, i32, env, i32)
 DEF_HELPER_2(fp_rsqrt_d, i64, env, i64)
 DEF_HELPER_2(fp_recip_s, i32, env, i32)
 DEF_HELPER_2(fp_recip_d, i64, env, i64)
+DEF_HELPER_2(fp_rint_s, i32, env, i32)
+DEF_HELPER_2(fp_rint_d, i64, env, i64)
 
 DEF_HELPER_FLAGS_2(fp_class_s, TCG_CALL_NO_RWG_SE, i32, env, i32)
 DEF_HELPER_FLAGS_2(fp_class_d, TCG_CALL_NO_RWG_SE, i64, env, i64)
@@ -121,3 +123,30 @@ DEF_HELPER_3(fp_cmp_sune_s, i32, env, i32, i32)
 
 DEF_HELPER_3(movreg2cf_i32, void, env, i32, i32)
 DEF_HELPER_3(movreg2cf_i64, void, env, i32, i64)
+
+DEF_HELPER_2(fp_cvt_d_s, i64, env, i32)
+DEF_HELPER_2(fp_cvt_s_d, i32, env, i64)
+DEF_HELPER_2(fp_fint_d_w, i64, env, i32)
+DEF_HELPER_2(fp_fint_d_l, i64, env, i64)
+DEF_HELPER_2(fp_fint_s_w, i32, env, i32)
+DEF_HELPER_2(fp_fint_s_l, i32, env, i64)
+DEF_HELPER_2(fp_tintrm_l_s, i64, env, i32)
+DEF_HELPER_2(fp_tintrm_l_d, i64, env, i64)
+DEF_HELPER_2(fp_tintrm_w_s, i32, env, i32)
+DEF_HELPER_2(fp_tintrm_w_d, i32, env, i64)
+DEF_HELPER_2(fp_tintrp_l_s, i64, env, i32)
+DEF_HELPER_2(fp_tintrp_l_d, i64, env, i64)
+DEF_HELPER_2(fp_tintrp_w_s, i32, env, i32)
+DEF_HELPER_2(fp_tintrp_w_d, i32, env, i64)
+DEF_HELPER_2(fp_tintrz_l_s, i64, env, i32)
+DEF_HELPER_2(fp_tintrz_l_d, i64, env, i64)
+DEF_HELPER_2(fp_tintrz_w_s, i32, env, i32)
+DEF_HELPER_2(fp_tintrz_w_d, i32, env, i64)
+DEF_HELPER_2(fp_tintrne_l_s, i64, env, i32)
+DEF_HELPER_2(fp_tintrne_l_d, i64, env, i64)
+DEF_HELPER_2(fp_tintrne_w_s, i32, env, i32)
+DEF_HELPER_2(fp_tintrne_w_d, i32, env, i64)
+DEF_HELPER_2(fp_tint_l_s, i64, env, i32)
+DEF_HELPER_2(fp_tint_l_d, i64, env, i64)
+DEF_HELPER_2(fp_tint_w_s, i32, env, i32)
+DEF_HELPER_2(fp_tint_w_d, i32, env, i64)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 7bf4f0f..86ba7ea 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -354,3 +354,35 @@ fclass_d         0000 00010001 01000 01110 ..... .....    @fmt_fdfj
 #
 fcmp_cond_s      0000 11000001 ..... ..... ..... 00 ...   @fmt_cdfjfkfcond
 fcmp_cond_d      0000 11000010 ..... ..... ..... 00 ...   @fmt_cdfjfkfcond
+
+#
+# Floating point conversion instruction
+#
+fcvt_s_d         0000 00010001 10010 00110 ..... .....    @fmt_fdfj
+fcvt_d_s         0000 00010001 10010 01001 ..... .....    @fmt_fdfj
+ftintrm_w_s      0000 00010001 10100 00001 ..... .....    @fmt_fdfj
+ftintrm_w_d      0000 00010001 10100 00010 ..... .....    @fmt_fdfj
+ftintrm_l_s      0000 00010001 10100 01001 ..... .....    @fmt_fdfj
+ftintrm_l_d      0000 00010001 10100 01010 ..... .....    @fmt_fdfj
+ftintrp_w_s      0000 00010001 10100 10001 ..... .....    @fmt_fdfj
+ftintrp_w_d      0000 00010001 10100 10010 ..... .....    @fmt_fdfj
+ftintrp_l_s      0000 00010001 10100 11001 ..... .....    @fmt_fdfj
+ftintrp_l_d      0000 00010001 10100 11010 ..... .....    @fmt_fdfj
+ftintrz_w_s      0000 00010001 10101 00001 ..... .....    @fmt_fdfj
+ftintrz_w_d      0000 00010001 10101 00010 ..... .....    @fmt_fdfj
+ftintrz_l_s      0000 00010001 10101 01001 ..... .....    @fmt_fdfj
+ftintrz_l_d      0000 00010001 10101 01010 ..... .....    @fmt_fdfj
+ftintrne_w_s     0000 00010001 10101 10001 ..... .....    @fmt_fdfj
+ftintrne_w_d     0000 00010001 10101 10010 ..... .....    @fmt_fdfj
+ftintrne_l_s     0000 00010001 10101 11001 ..... .....    @fmt_fdfj
+ftintrne_l_d     0000 00010001 10101 11010 ..... .....    @fmt_fdfj
+ftint_w_s        0000 00010001 10110 00001 ..... .....    @fmt_fdfj
+ftint_w_d        0000 00010001 10110 00010 ..... .....    @fmt_fdfj
+ftint_l_s        0000 00010001 10110 01001 ..... .....    @fmt_fdfj
+ftint_l_d        0000 00010001 10110 01010 ..... .....    @fmt_fdfj
+ffint_s_w        0000 00010001 11010 00100 ..... .....    @fmt_fdfj
+ffint_s_l        0000 00010001 11010 00110 ..... .....    @fmt_fdfj
+ffint_d_w        0000 00010001 11010 01000 ..... .....    @fmt_fdfj
+ffint_d_l        0000 00010001 11010 01010 ..... .....    @fmt_fdfj
+frint_s          0000 00010001 11100 10001 ..... .....    @fmt_fdfj
+frint_d          0000 00010001 11100 10010 ..... .....    @fmt_fdfj
diff --git a/target/loongarch/instmap.h b/target/loongarch/instmap.h
index f562e32..2f231c2 100644
--- a/target/loongarch/instmap.h
+++ b/target/loongarch/instmap.h
@@ -81,6 +81,35 @@ enum {
     LA_OPC_FRECIP_D  = (0x004516 << 10),
     LA_OPC_FRSQRT_S  = (0x004519 << 10),
     LA_OPC_FRSQRT_D  = (0x00451A << 10),
+    LA_OPC_FCVT_S_D      = (0x004646 << 10),
+    LA_OPC_FCVT_D_S      = (0x004649 << 10),
+    LA_OPC_FTINTRM_W_S   = (0x004681 << 10),
+    LA_OPC_FTINTRM_W_D   = (0x004682 << 10),
+    LA_OPC_FTINTRM_L_S   = (0x004689 << 10),
+    LA_OPC_FTINTRM_L_D   = (0x00468A << 10),
+    LA_OPC_FTINTRP_W_S   = (0x004691 << 10),
+    LA_OPC_FTINTRP_W_D   = (0x004692 << 10),
+    LA_OPC_FTINTRP_L_S   = (0x004699 << 10),
+    LA_OPC_FTINTRP_L_D   = (0x00469A << 10),
+    LA_OPC_FTINTRZ_W_S   = (0x0046A1 << 10),
+    LA_OPC_FTINTRZ_W_D   = (0x0046A2 << 10),
+    LA_OPC_FTINTRZ_L_S   = (0x0046A9 << 10),
+    LA_OPC_FTINTRZ_L_D   = (0x0046AA << 10),
+    LA_OPC_FTINTRNE_W_S  = (0x0046B1 << 10),
+    LA_OPC_FTINTRNE_W_D  = (0x0046B2 << 10),
+    LA_OPC_FTINTRNE_L_S  = (0x0046B9 << 10),
+    LA_OPC_FTINTRNE_L_D  = (0x0046BA << 10),
+    LA_OPC_FTINT_W_S     = (0x0046C1 << 10),
+    LA_OPC_FTINT_W_D     = (0x0046C2 << 10),
+    LA_OPC_FTINT_L_S     = (0x0046C9 << 10),
+    LA_OPC_FTINT_L_D     = (0x0046CA << 10),
+    LA_OPC_FFINT_S_W     = (0x004744 << 10),
+    LA_OPC_FFINT_S_L     = (0x004746 << 10),
+    LA_OPC_FFINT_D_W     = (0x004748 << 10),
+    LA_OPC_FFINT_D_L     = (0x00474A << 10),
+    LA_OPC_FRINT_S       = (0x004791 << 10),
+    LA_OPC_FRINT_D       = (0x004792 << 10),
+
     LA_OPC_FADD_S    = (0x00201 << 15),
     LA_OPC_FADD_D    = (0x00202 << 15),
     LA_OPC_FSUB_S    = (0x00205 << 15),
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index fab2805..095e9d2 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -1886,3 +1886,172 @@ static bool trans_fcmp_cond_d(DisasContext *ctx, arg_fcmp_cond_d *a)
     gen_loongarch_fp_cmp_d(ctx, a->fcond, a->fk, a->fj, a->cd);
     return true;
 }
+
+/* Floating point conversion instruction */
+static bool trans_fcvt_s_d(DisasContext *ctx, arg_fcvt_s_d *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FCVT_S_D, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_fcvt_d_s(DisasContext *ctx, arg_fcvt_d_s *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FCVT_D_S, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrm_w_s(DisasContext *ctx, arg_ftintrm_l_s *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRM_W_S, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrm_w_d(DisasContext *ctx, arg_ftintrm_l_d *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRM_W_D, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrm_l_s(DisasContext *ctx, arg_ftintrm_l_s *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRM_L_S, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrm_l_d(DisasContext *ctx, arg_ftintrm_l_d *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRM_L_D, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrp_w_s(DisasContext *ctx, arg_ftintrp_w_s *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRP_W_S, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrp_w_d(DisasContext *ctx, arg_ftintrp_w_d *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRP_W_D, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrp_l_s(DisasContext *ctx, arg_ftintrp_l_s *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRP_L_S, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrp_l_d(DisasContext *ctx, arg_ftintrp_l_d *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRP_L_D, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrz_w_s(DisasContext *ctx, arg_ftintrz_w_s *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRZ_W_S, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrz_w_d(DisasContext *ctx, arg_ftintrz_w_d *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRZ_W_D, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrz_l_s(DisasContext *ctx, arg_ftintrz_l_s *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRZ_L_S, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrz_l_d(DisasContext *ctx, arg_ftintrz_l_d *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRZ_L_D, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrne_w_s(DisasContext *ctx, arg_ftintrne_w_s *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRNE_W_S, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrne_w_d(DisasContext *ctx, arg_ftintrne_w_d *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRNE_W_D, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrne_l_s(DisasContext *ctx, arg_ftintrne_l_s *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRNE_L_S, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftintrne_l_d(DisasContext *ctx, arg_ftintrne_l_d *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINTRNE_L_D, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftint_w_s(DisasContext *ctx, arg_ftint_w_s *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINT_W_S, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftint_w_d(DisasContext *ctx, arg_ftint_w_d *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINT_W_D, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftint_l_s(DisasContext *ctx, arg_ftint_l_s *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINT_L_S, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ftint_l_d(DisasContext *ctx, arg_ftint_l_d *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FTINT_L_D, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ffint_s_w(DisasContext *ctx, arg_ffint_s_w *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FFINT_S_W, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ffint_s_l(DisasContext *ctx, arg_ffint_s_l *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FFINT_S_L, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ffint_d_w(DisasContext *ctx, arg_ffint_d_w *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FFINT_D_W, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_ffint_d_l(DisasContext *ctx, arg_ffint_d_l *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FFINT_D_L, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_frint_s(DisasContext *ctx, arg_frint_s *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FRINT_S, a->fj, a->fd);
+    return true;
+}
+
+static bool trans_frint_d(DisasContext *ctx, arg_frint_d *a)
+{
+    gen_loongarch_fp_conv(ctx, LA_OPC_FRINT_D, a->fj, a->fd);
+    return true;
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 4e7b687..52faf73 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -1769,6 +1769,324 @@ FP_CMP(d, 64, gen_helper_movreg2cf_i64(cpu_env, fcc, fp0))
 FP_CMP(s, 32, gen_helper_movreg2cf_i32(cpu_env, fcc, fp0))
 #undef FP_CMP
 
+/* loongarch floating-point conversion */
+static void gen_loongarch_fp_conv(DisasContext *ctx, uint32_t opc,
+                                  int fj, int fd)
+{
+    check_fpu_enabled(ctx);
+    switch (opc) {
+    case LA_OPC_FCVT_S_D:
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp64, fj);
+            gen_helper_fp_cvt_s_d(fp32, cpu_env, fp64);
+            tcg_temp_free_i64(fp64);
+            gen_store_fpr32(ctx, fp32, fd);
+            tcg_temp_free_i32(fp32);
+        }
+        break;
+    case LA_OPC_FCVT_D_S:
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr32(ctx, fp32, fj);
+            gen_helper_fp_cvt_d_s(fp64, cpu_env, fp32);
+            tcg_temp_free_i32(fp32);
+            gen_store_fpr64(ctx, fp64, fd);
+            tcg_temp_free_i64(fp64);
+        }
+        break;
+    case LA_OPC_FTINTRM_W_S:
+        {
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+
+            gen_load_fpr32(ctx, fp0, fj);
+            gen_helper_fp_tintrm_w_s(fp0, cpu_env, fp0);
+            gen_store_fpr32(ctx, fp0, fd);
+            tcg_temp_free_i32(fp0);
+        }
+        break;
+    case LA_OPC_FTINTRM_W_D:
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp64, fj);
+            gen_helper_fp_tintrm_w_d(fp32, cpu_env, fp64);
+            tcg_temp_free_i64(fp64);
+            gen_store_fpr32(ctx, fp32, fd);
+            tcg_temp_free_i32(fp32);
+        }
+        break;
+    case LA_OPC_FTINTRM_L_S:
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr32(ctx, fp32, fj);
+            gen_helper_fp_tintrm_l_s(fp64, cpu_env, fp32);
+            tcg_temp_free_i32(fp32);
+            gen_store_fpr64(ctx, fp64, fd);
+            tcg_temp_free_i64(fp64);
+        }
+        break;
+    case LA_OPC_FTINTRM_L_D:
+        {
+            TCGv_i64 fp0 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp0, fj);
+            gen_helper_fp_tintrm_l_d(fp0, cpu_env, fp0);
+            gen_store_fpr64(ctx, fp0, fd);
+            tcg_temp_free_i64(fp0);
+        }
+        break;
+    case LA_OPC_FTINTRP_W_S:
+        {
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+
+            gen_load_fpr32(ctx, fp0, fj);
+            gen_helper_fp_tintrp_w_s(fp0, cpu_env, fp0);
+            gen_store_fpr32(ctx, fp0, fd);
+            tcg_temp_free_i32(fp0);
+        }
+        break;
+    case LA_OPC_FTINTRP_W_D:
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp64, fj);
+            gen_helper_fp_tintrp_w_d(fp32, cpu_env, fp64);
+            tcg_temp_free_i64(fp64);
+            gen_store_fpr32(ctx, fp32, fd);
+            tcg_temp_free_i32(fp32);
+        }
+        break;
+    case LA_OPC_FTINTRP_L_S:
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr32(ctx, fp32, fj);
+            gen_helper_fp_tintrp_l_s(fp64, cpu_env, fp32);
+            tcg_temp_free_i32(fp32);
+            gen_store_fpr64(ctx, fp64, fd);
+            tcg_temp_free_i64(fp64);
+        }
+        break;
+    case LA_OPC_FTINTRP_L_D:
+        {
+            TCGv_i64 fp0 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp0, fj);
+            gen_helper_fp_tintrp_l_d(fp0, cpu_env, fp0);
+            gen_store_fpr64(ctx, fp0, fd);
+            tcg_temp_free_i64(fp0);
+        }
+        break;
+    case LA_OPC_FTINTRZ_W_S:
+        {
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+
+            gen_load_fpr32(ctx, fp0, fj);
+            gen_helper_fp_tintrz_w_s(fp0, cpu_env, fp0);
+            gen_store_fpr32(ctx, fp0, fd);
+            tcg_temp_free_i32(fp0);
+        }
+        break;
+    case LA_OPC_FTINTRZ_W_D:
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp64, fj);
+            gen_helper_fp_tintrz_w_d(fp32, cpu_env, fp64);
+            tcg_temp_free_i64(fp64);
+            gen_store_fpr32(ctx, fp32, fd);
+            tcg_temp_free_i32(fp32);
+        }
+        break;
+    case LA_OPC_FTINTRZ_L_S:
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr32(ctx, fp32, fj);
+            gen_helper_fp_tintrz_l_s(fp64, cpu_env, fp32);
+            tcg_temp_free_i32(fp32);
+            gen_store_fpr64(ctx, fp64, fd);
+            tcg_temp_free_i64(fp64);
+        }
+        break;
+    case LA_OPC_FTINTRZ_L_D:
+        {
+            TCGv_i64 fp0 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp0, fj);
+            gen_helper_fp_tintrz_l_d(fp0, cpu_env, fp0);
+            gen_store_fpr64(ctx, fp0, fd);
+            tcg_temp_free_i64(fp0);
+        }
+        break;
+    case LA_OPC_FTINTRNE_W_S:
+        {
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+
+            gen_load_fpr32(ctx, fp0, fj);
+            gen_helper_fp_tintrne_w_s(fp0, cpu_env, fp0);
+            gen_store_fpr32(ctx, fp0, fd);
+            tcg_temp_free_i32(fp0);
+        }
+        break;
+    case LA_OPC_FTINTRNE_W_D:
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp64, fj);
+            gen_helper_fp_tintrne_w_d(fp32, cpu_env, fp64);
+            tcg_temp_free_i64(fp64);
+            gen_store_fpr32(ctx, fp32, fd);
+            tcg_temp_free_i32(fp32);
+        }
+        break;
+    case LA_OPC_FTINTRNE_L_S:
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr32(ctx, fp32, fj);
+            gen_helper_fp_tintrne_l_s(fp64, cpu_env, fp32);
+            tcg_temp_free_i32(fp32);
+            gen_store_fpr64(ctx, fp64, fd);
+            tcg_temp_free_i64(fp64);
+        }
+        break;
+    case LA_OPC_FTINTRNE_L_D:
+        {
+            TCGv_i64 fp0 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp0, fj);
+            gen_helper_fp_tintrne_l_d(fp0, cpu_env, fp0);
+            gen_store_fpr64(ctx, fp0, fd);
+            tcg_temp_free_i64(fp0);
+        }
+        break;
+    case LA_OPC_FTINT_W_S:
+        {
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+
+            gen_load_fpr32(ctx, fp0, fj);
+            gen_helper_fp_tint_w_s(fp0, cpu_env, fp0);
+            gen_store_fpr32(ctx, fp0, fd);
+            tcg_temp_free_i32(fp0);
+        }
+        break;
+    case LA_OPC_FTINT_W_D:
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp64, fj);
+            gen_helper_fp_tint_w_d(fp32, cpu_env, fp64);
+            tcg_temp_free_i64(fp64);
+            gen_store_fpr32(ctx, fp32, fd);
+            tcg_temp_free_i32(fp32);
+        }
+        break;
+    case LA_OPC_FTINT_L_S:
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr32(ctx, fp32, fj);
+            gen_helper_fp_tint_l_s(fp64, cpu_env, fp32);
+            tcg_temp_free_i32(fp32);
+            gen_store_fpr64(ctx, fp64, fd);
+            tcg_temp_free_i64(fp64);
+        }
+        break;
+    case LA_OPC_FTINT_L_D:
+        {
+            TCGv_i64 fp0 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp0, fj);
+            gen_helper_fp_tint_l_d(fp0, cpu_env, fp0);
+            gen_store_fpr64(ctx, fp0, fd);
+            tcg_temp_free_i64(fp0);
+        }
+        break;
+    case LA_OPC_FFINT_S_W:
+        {
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+
+            gen_load_fpr32(ctx, fp0, fj);
+            gen_helper_fp_fint_s_w(fp0, cpu_env, fp0);
+            gen_store_fpr32(ctx, fp0, fd);
+            tcg_temp_free_i32(fp0);
+        }
+        break;
+    case LA_OPC_FFINT_S_L:
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp64, fj);
+            gen_helper_fp_fint_s_l(fp32, cpu_env, fp64);
+            tcg_temp_free_i64(fp64);
+            gen_store_fpr32(ctx, fp32, fd);
+            tcg_temp_free_i32(fp32);
+        }
+        break;
+    case LA_OPC_FFINT_D_W:
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr32(ctx, fp32, fj);
+            gen_helper_fp_fint_d_w(fp64, cpu_env, fp32);
+            tcg_temp_free_i32(fp32);
+            gen_store_fpr64(ctx, fp64, fd);
+            tcg_temp_free_i64(fp64);
+        }
+        break;
+    case LA_OPC_FFINT_D_L:
+        {
+            TCGv_i64 fp0 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp0, fj);
+            gen_helper_fp_fint_d_l(fp0, cpu_env, fp0);
+            gen_store_fpr64(ctx, fp0, fd);
+            tcg_temp_free_i64(fp0);
+        }
+        break;
+    case LA_OPC_FRINT_S:
+        {
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+            gen_load_fpr32(ctx, fp0, fj);
+            gen_helper_fp_rint_s(fp0, cpu_env, fp0);
+            gen_store_fpr32(ctx, fp0, fd);
+            tcg_temp_free_i32(fp0);
+        }
+        break;
+    case LA_OPC_FRINT_D:
+        {
+            TCGv_i64 fp0 = tcg_temp_new_i64();
+            gen_load_fpr64(ctx, fp0, fj);
+            gen_helper_fp_rint_d(fp0, cpu_env, fp0);
+            gen_store_fpr64(ctx, fp0, fd);
+            tcg_temp_free_i64(fp0);
+        }
+        break;
+    default:
+        generate_exception_end(ctx, EXCP_INE);
+        return;
+    }
+}
+
 static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
 {
 }
-- 
1.8.3.1


