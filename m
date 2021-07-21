Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDDA3D0BB7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:07:52 +0200 (CEST)
Received: from localhost ([::1]:41546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m698p-0008Q6-RE
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m68vH-0003GP-Of
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49730 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m68vE-0002DX-0H
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:51 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0CO7vdg5VEiAA--.21107S17; 
 Wed, 21 Jul 2021 17:53:35 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/22] target/loongarch: Add floating point conversion
 instruction translation
Date: Wed, 21 Jul 2021 17:53:11 +0800
Message-Id: <1626861198-6133-16-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0CO7vdg5VEiAA--.21107S17
X-Coremail-Antispam: 1UD129KBjvAXoWfKr4rZFW7Aw1kWrWfJFy5Arb_yoW5GFyrto
 WDu3W5Zw4rGw43ur9Ykwn0qa12qFyUGa1fJr9Yv3s7WFn7C3WUKFWagFn5Ja4fKrWFgry5
 Xrnav3Z3Jw13Zr93n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 maobibo@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
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
 target/loongarch/fpu_helper.c | 362 ++++++++++++++++++++++++++++++++++
 target/loongarch/helper.h     |  29 +++
 target/loongarch/insns.decode |  32 +++
 target/loongarch/trans.inc.c  | 449 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 872 insertions(+)

diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index 0b6a07e..162085a 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -991,3 +991,365 @@ uint64_t helper_fp_cmp_sune_d(CPULoongArchState *env, uint64_t fp,
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
index 8aadcfd..c6fd762 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -351,3 +351,35 @@ fclass_d         0000 00010001 01000 01110 ..... .....    @fmt_fdfj
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
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index a4efc05..aa9920e 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -4309,3 +4309,452 @@ static bool trans_fcmp_cond_d(DisasContext *ctx, arg_fcmp_cond_d *a)
 
     return true;
 }
+
+/* Floating point conversion instruction */
+static bool trans_fcvt_s_d(DisasContext *ctx, arg_fcvt_s_d *a)
+{
+    TCGv_i32 fp32 = tcg_temp_new_i32();
+    TCGv_i64 fp64 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp64, a->fj);
+    gen_helper_fp_cvt_s_d(fp32, cpu_env, fp64);
+    gen_store_fpr32(fp32, a->fd);
+
+    tcg_temp_free_i32(fp32);
+    tcg_temp_free_i64(fp64);
+
+    return true;
+}
+
+static bool trans_fcvt_d_s(DisasContext *ctx, arg_fcvt_d_s *a)
+{
+    TCGv_i32 fp32 = tcg_temp_new_i32();
+    TCGv_i64 fp64 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp32, a->fj);
+    gen_helper_fp_cvt_d_s(fp64, cpu_env, fp32);
+    gen_store_fpr64(fp64, a->fd);
+
+    tcg_temp_free_i32(fp32);
+    tcg_temp_free_i64(fp64);
+
+    return true;
+}
+
+static bool trans_ftintrm_w_s(DisasContext *ctx, arg_ftintrm_l_s *a)
+{
+    TCGv_i32 fp0;
+
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_helper_fp_tintrm_w_s(fp0, cpu_env, fp0);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_ftintrm_w_d(DisasContext *ctx, arg_ftintrm_l_d *a)
+{
+    TCGv_i32 fp32 = tcg_temp_new_i32();
+    TCGv_i64 fp64 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp64, a->fj);
+    gen_helper_fp_tintrm_w_d(fp32, cpu_env, fp64);
+    gen_store_fpr32(fp32, a->fd);
+
+    tcg_temp_free_i32(fp32);
+    tcg_temp_free_i64(fp64);
+
+    return true;
+}
+
+static bool trans_ftintrm_l_s(DisasContext *ctx, arg_ftintrm_l_s *a)
+{
+    TCGv_i32 fp32 = tcg_temp_new_i32();
+    TCGv_i64 fp64 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp32, a->fj);
+    gen_helper_fp_tintrm_l_s(fp64, cpu_env, fp32);
+    gen_store_fpr64(fp64, a->fd);
+
+    tcg_temp_free_i32(fp32);
+    tcg_temp_free_i64(fp64);
+
+    return true;
+}
+
+static bool trans_ftintrm_l_d(DisasContext *ctx, arg_ftintrm_l_d *a)
+{
+    TCGv_i64 fp0;
+
+    fp0 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_helper_fp_tintrm_l_d(fp0, cpu_env, fp0);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
+
+static bool trans_ftintrp_w_s(DisasContext *ctx, arg_ftintrp_w_s *a)
+{
+    TCGv_i32 fp0;
+
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_helper_fp_tintrp_w_s(fp0, cpu_env, fp0);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_ftintrp_w_d(DisasContext *ctx, arg_ftintrp_w_d *a)
+{
+    TCGv_i32 fp32 = tcg_temp_new_i32();
+    TCGv_i64 fp64 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp64, a->fj);
+    gen_helper_fp_tintrp_w_d(fp32, cpu_env, fp64);
+    gen_store_fpr32(fp32, a->fd);
+
+    tcg_temp_free_i32(fp32);
+    tcg_temp_free_i64(fp64);
+
+    return true;
+}
+
+static bool trans_ftintrp_l_s(DisasContext *ctx, arg_ftintrp_l_s *a)
+{
+    TCGv_i32 fp32 = tcg_temp_new_i32();
+    TCGv_i64 fp64 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp32, a->fj);
+    gen_helper_fp_tintrp_l_s(fp64, cpu_env, fp32);
+    gen_store_fpr64(fp64, a->fd);
+
+    tcg_temp_free_i32(fp32);
+    tcg_temp_free_i64(fp64);
+
+    return true;
+}
+
+static bool trans_ftintrp_l_d(DisasContext *ctx, arg_ftintrp_l_d *a)
+{
+    TCGv_i64 fp0;
+
+    fp0  = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_helper_fp_tintrp_l_d(fp0, cpu_env, fp0);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
+
+static bool trans_ftintrz_w_s(DisasContext *ctx, arg_ftintrz_w_s *a)
+{
+    TCGv_i32 fp0;
+
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_helper_fp_tintrz_w_s(fp0, cpu_env, fp0);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_ftintrz_w_d(DisasContext *ctx, arg_ftintrz_w_d *a)
+{
+    TCGv_i32 fp32 = tcg_temp_new_i32();
+    TCGv_i64 fp64 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp64, a->fj);
+    gen_helper_fp_tintrz_w_d(fp32, cpu_env, fp64);
+    gen_store_fpr32(fp32, a->fd);
+
+    tcg_temp_free_i32(fp32);
+    tcg_temp_free_i64(fp64);
+
+    return true;
+}
+
+static bool trans_ftintrz_l_s(DisasContext *ctx, arg_ftintrz_l_s *a)
+{
+    TCGv_i32 fp32 = tcg_temp_new_i32();
+    TCGv_i64 fp64 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp32, a->fj);
+    gen_helper_fp_tintrz_l_s(fp64, cpu_env, fp32);
+    gen_store_fpr64(fp64, a->fd);
+
+    tcg_temp_free_i32(fp32);
+    tcg_temp_free_i64(fp64);
+
+    return true;
+}
+
+static bool trans_ftintrz_l_d(DisasContext *ctx, arg_ftintrz_l_d *a)
+{
+    TCGv_i64 fp0;
+
+    fp0 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_helper_fp_tintrz_l_d(fp0, cpu_env, fp0);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
+
+static bool trans_ftintrne_w_s(DisasContext *ctx, arg_ftintrne_w_s *a)
+{
+    TCGv_i32 fp0;
+
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_helper_fp_tintrne_w_s(fp0, cpu_env, fp0);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_ftintrne_w_d(DisasContext *ctx, arg_ftintrne_w_d *a)
+{
+    TCGv_i32 fp32 = tcg_temp_new_i32();
+    TCGv_i64 fp64 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp64, a->fj);
+    gen_helper_fp_tintrne_w_d(fp32, cpu_env, fp64);
+    gen_store_fpr32(fp32, a->fd);
+
+    tcg_temp_free_i32(fp32);
+    tcg_temp_free_i64(fp64);
+
+    return true;
+}
+
+static bool trans_ftintrne_l_s(DisasContext *ctx, arg_ftintrne_l_s *a)
+{
+    TCGv_i32 fp32 = tcg_temp_new_i32();
+    TCGv_i64 fp64 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp32, a->fj);
+    gen_helper_fp_tintrne_l_s(fp64, cpu_env, fp32);
+    gen_store_fpr64(fp64, a->fd);
+
+    tcg_temp_free_i32(fp32);
+    tcg_temp_free_i64(fp64);
+
+    return true;
+}
+
+static bool trans_ftintrne_l_d(DisasContext *ctx, arg_ftintrne_l_d *a)
+{
+    TCGv_i64 fp0;
+
+    fp0 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_helper_fp_tintrne_l_d(fp0, cpu_env, fp0);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
+
+static bool trans_ftint_w_s(DisasContext *ctx, arg_ftint_w_s *a)
+{
+    TCGv_i32 fp0;
+
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_helper_fp_tint_w_s(fp0, cpu_env, fp0);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_ftint_w_d(DisasContext *ctx, arg_ftint_w_d *a)
+{
+    TCGv_i32 fp32 = tcg_temp_new_i32();
+    TCGv_i64 fp64 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp64, a->fj);
+    gen_helper_fp_tint_w_d(fp32, cpu_env, fp64);
+    gen_store_fpr32(fp32, a->fd);
+
+    tcg_temp_free_i32(fp32);
+    tcg_temp_free_i64(fp64);
+
+    return true;
+}
+
+static bool trans_ftint_l_s(DisasContext *ctx, arg_ftint_l_s *a)
+{
+    TCGv_i32 fp32 = tcg_temp_new_i32();
+    TCGv_i64 fp64 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp32, a->fj);
+    gen_helper_fp_tint_l_s(fp64, cpu_env, fp32);
+    gen_store_fpr64(fp64, a->fd);
+
+    tcg_temp_free_i32(fp32);
+    tcg_temp_free_i64(fp64);
+
+    return true;
+}
+
+static bool trans_ftint_l_d(DisasContext *ctx, arg_ftint_l_d *a)
+{
+    TCGv_i64 fp0;
+
+    fp0 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_helper_fp_tint_l_d(fp0, cpu_env, fp0);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
+
+static bool trans_ffint_s_w(DisasContext *ctx, arg_ffint_s_w *a)
+{
+    TCGv_i32 fp0;
+
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_helper_fp_fint_s_w(fp0, cpu_env, fp0);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_ffint_s_l(DisasContext *ctx, arg_ffint_s_l *a)
+{
+    TCGv_i32 fp32 = tcg_temp_new_i32();
+    TCGv_i64 fp64 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp64, a->fj);
+    gen_helper_fp_fint_s_l(fp32, cpu_env, fp64);
+    gen_store_fpr32(fp32, a->fd);
+
+    tcg_temp_free_i32(fp32);
+    tcg_temp_free_i64(fp64);
+
+    return true;
+}
+
+static bool trans_ffint_d_w(DisasContext *ctx, arg_ffint_d_w *a)
+{
+    TCGv_i32 fp32 = tcg_temp_new_i32();
+    TCGv_i64 fp64 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp32, a->fj);
+    gen_helper_fp_fint_d_w(fp64, cpu_env, fp32);
+    gen_store_fpr64(fp64, a->fd);
+
+    tcg_temp_free_i32(fp32);
+    tcg_temp_free_i64(fp64);
+
+    return true;
+}
+
+static bool trans_ffint_d_l(DisasContext *ctx, arg_ffint_d_l *a)
+{
+    TCGv_i64 fp0;
+
+    fp0 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_helper_fp_fint_d_l(fp0, cpu_env, fp0);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
+
+static bool trans_frint_s(DisasContext *ctx, arg_frint_s *a)
+{
+    TCGv_i32 fp0;
+
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_helper_fp_rint_s(fp0, cpu_env, fp0);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_frint_d(DisasContext *ctx, arg_frint_d *a)
+{
+    TCGv_i64 fp0;
+
+    fp0 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_helper_fp_rint_d(fp0, cpu_env, fp0);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
-- 
1.8.3.1


