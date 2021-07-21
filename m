Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231BD3D0BAC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:03:46 +0200 (CEST)
Received: from localhost ([::1]:54914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m694q-0006jF-Ov
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m68vH-0003E5-6C
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49704 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m68vD-0002CR-1n
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:50 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0CO7vdg5VEiAA--.21107S15; 
 Wed, 21 Jul 2021 17:53:33 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/22] target/loongarch: Add floating point arithmetic
 instruction translation
Date: Wed, 21 Jul 2021 17:53:09 +0800
Message-Id: <1626861198-6133-14-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0CO7vdg5VEiAA--.21107S15
X-Coremail-Antispam: 1UD129KBjvAXoWftw1xAryfZFyfAF4ftr4xJFb_yoWrJr4Dto
 WUC3W5ArW8GrW3ur9Ikwn8Xa12qFyUtanrJrZYgw1xWF4xAF42gFyUWa1kJa4fKrW0gry5
 Xrnav3Wftw13WrZ7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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

This patch implement floating point arithmetic instruction translation.

This includes:
- F{ADD/SUB/MUL/DIV}.{S/D}
- F{MADD/MSUB/NMADD/NMSUB}.{S/D}
- F{MAX/MIN}.{S/D}
- F{MAXA/MINA}.{S/D}
- F{ABS/NEG}.{S/D}
- F{SQRT/RECIP/RSQRT}.{S/D}
- F{SCALEB/LOGB/COPYSIGN}.{S/D}
- FCLASS.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c        |   2 +
 target/loongarch/fpu_helper.c | 380 ++++++++++++++++++++
 target/loongarch/fpu_helper.h |  34 ++
 target/loongarch/helper.h     |  47 +++
 target/loongarch/insns.decode |  56 +++
 target/loongarch/trans.inc.c  | 806 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 1325 insertions(+)
 create mode 100644 target/loongarch/fpu_helper.c
 create mode 100644 target/loongarch/fpu_helper.h

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 6269dd9..e696fda 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -18,6 +18,7 @@
 #include "cpu.h"
 #include "cpu-csr.h"
 #include "cpu-qom.h"
+#include "fpu_helper.h"
 
 static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_INTE] = "Interrupt error",
@@ -199,6 +200,7 @@ static void loongarch_cpu_reset(DeviceState *dev)
     env->active_fpu.fcsr0 = 0x0;
 
     compute_hflags(env);
+    restore_fp_status(env);
     cs->exception_index = EXCP_NONE;
 }
 
diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
new file mode 100644
index 0000000..399a98b
--- /dev/null
+++ b/target/loongarch/fpu_helper.c
@@ -0,0 +1,380 @@
+/*
+ * LoongArch float point emulation helpers for qemu
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "fpu_helper.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "fpu/softfloat.h"
+
+#define FP_TO_INT32_OVERFLOW 0x7fffffff
+#define FP_TO_INT64_OVERFLOW 0x7fffffffffffffffULL
+
+#define FP_CLASS_SIGNALING_NAN      0x001
+#define FP_CLASS_QUIET_NAN          0x002
+#define FP_CLASS_NEGATIVE_INFINITY  0x004
+#define FP_CLASS_NEGATIVE_NORMAL    0x008
+#define FP_CLASS_NEGATIVE_SUBNORMAL 0x010
+#define FP_CLASS_NEGATIVE_ZERO      0x020
+#define FP_CLASS_POSITIVE_INFINITY  0x040
+#define FP_CLASS_POSITIVE_NORMAL    0x080
+#define FP_CLASS_POSITIVE_SUBNORMAL 0x100
+#define FP_CLASS_POSITIVE_ZERO      0x200
+
+/* convert loongarch rounding mode in fcsr0 to IEEE library */
+const FloatRoundMode ieee_rm[4] = {
+    float_round_nearest_even,
+    float_round_to_zero,
+    float_round_up,
+    float_round_down
+};
+
+int ieee_ex_to_loongarch(int xcpt)
+{
+    int ret = 0;
+    if (xcpt) {
+        if (xcpt & float_flag_invalid) {
+            ret |= FP_INVALID;
+        }
+        if (xcpt & float_flag_overflow) {
+            ret |= FP_OVERFLOW;
+        }
+        if (xcpt & float_flag_underflow) {
+            ret |= FP_UNDERFLOW;
+        }
+        if (xcpt & float_flag_divbyzero) {
+            ret |= FP_DIV0;
+        }
+        if (xcpt & float_flag_inexact) {
+            ret |= FP_INEXACT;
+        }
+    }
+    return ret;
+}
+
+static inline void update_fcsr0(CPULoongArchState *env, uintptr_t pc)
+{
+    int tmp = ieee_ex_to_loongarch(get_float_exception_flags(
+                                  &env->active_fpu.fp_status));
+
+    SET_FP_CAUSE(env->active_fpu.fcsr0, tmp);
+    if (tmp) {
+        set_float_exception_flags(0, &env->active_fpu.fp_status);
+
+        if (GET_FP_ENABLE(env->active_fpu.fcsr0) & tmp) {
+            do_raise_exception(env, EXCP_FPE, pc);
+        } else {
+            UPDATE_FP_FLAGS(env->active_fpu.fcsr0, tmp);
+        }
+    }
+}
+
+uint64_t helper_fp_sqrt_d(CPULoongArchState *env, uint64_t fp)
+{
+    fp = float64_sqrt(fp, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp;
+}
+
+uint32_t helper_fp_sqrt_s(CPULoongArchState *env, uint32_t fp)
+{
+    fp = float32_sqrt(fp, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp;
+}
+
+uint64_t helper_fp_abs_d(uint64_t fp)
+{
+    return float64_abs(fp);
+}
+uint32_t helper_fp_abs_s(uint32_t fp)
+{
+    return float32_abs(fp);
+}
+
+uint64_t helper_fp_neg_d(uint64_t fp)
+{
+    return float64_chs(fp);
+}
+uint32_t helper_fp_neg_s(uint32_t fp)
+{
+    return float32_chs(fp);
+}
+
+uint64_t helper_fp_recip_d(CPULoongArchState *env, uint64_t fp)
+{
+    uint64_t fp1;
+
+    fp1 = float64_div(float64_one, fp, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp1;
+}
+
+uint32_t helper_fp_recip_s(CPULoongArchState *env, uint32_t fp)
+{
+    uint32_t fp1;
+
+    fp1 = float32_div(float32_one, fp, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp1;
+}
+
+uint64_t helper_fp_rsqrt_d(CPULoongArchState *env, uint64_t fp)
+{
+    uint64_t fp1;
+
+    fp1 = float64_sqrt(fp, &env->active_fpu.fp_status);
+    fp1 = float64_div(float64_one, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp1;
+}
+
+uint32_t helper_fp_rsqrt_s(CPULoongArchState *env, uint32_t fp)
+{
+    uint32_t fp1;
+
+    fp1 = float32_sqrt(fp, &env->active_fpu.fp_status);
+    fp1 = float32_div(float32_one, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp1;
+}
+
+uint32_t fp_class_s(uint32_t arg, float_status *status)
+{
+    if (float32_is_signaling_nan(arg, status)) {
+        return FP_CLASS_SIGNALING_NAN;
+    } else if (float32_is_quiet_nan(arg, status)) {
+        return FP_CLASS_QUIET_NAN;
+    } else if (float32_is_neg(arg)) {
+        if (float32_is_infinity(arg)) {
+            return FP_CLASS_NEGATIVE_INFINITY;
+        } else if (float32_is_zero(arg)) {
+            return FP_CLASS_NEGATIVE_ZERO;
+        } else if (float32_is_zero_or_denormal(arg)) {
+            return FP_CLASS_NEGATIVE_SUBNORMAL;
+        } else {
+            return FP_CLASS_NEGATIVE_NORMAL;
+        }
+    } else {
+        if (float32_is_infinity(arg)) {
+            return FP_CLASS_POSITIVE_INFINITY;
+        } else if (float32_is_zero(arg)) {
+            return FP_CLASS_POSITIVE_ZERO;
+        } else if (float32_is_zero_or_denormal(arg)) {
+            return FP_CLASS_POSITIVE_SUBNORMAL;
+        } else {
+            return FP_CLASS_POSITIVE_NORMAL;
+        }
+    }
+}
+
+uint32_t helper_fp_class_s(CPULoongArchState *env, uint32_t arg)
+{
+    return fp_class_s(arg, &env->active_fpu.fp_status);
+}
+
+uint64_t fp_class_d(uint64_t arg, float_status *status)
+{
+    if (float64_is_signaling_nan(arg, status)) {
+        return FP_CLASS_SIGNALING_NAN;
+    } else if (float64_is_quiet_nan(arg, status)) {
+        return FP_CLASS_QUIET_NAN;
+    } else if (float64_is_neg(arg)) {
+        if (float64_is_infinity(arg)) {
+            return FP_CLASS_NEGATIVE_INFINITY;
+        } else if (float64_is_zero(arg)) {
+            return FP_CLASS_NEGATIVE_ZERO;
+        } else if (float64_is_zero_or_denormal(arg)) {
+            return FP_CLASS_NEGATIVE_SUBNORMAL;
+        } else {
+            return FP_CLASS_NEGATIVE_NORMAL;
+        }
+    } else {
+        if (float64_is_infinity(arg)) {
+            return FP_CLASS_POSITIVE_INFINITY;
+        } else if (float64_is_zero(arg)) {
+            return FP_CLASS_POSITIVE_ZERO;
+        } else if (float64_is_zero_or_denormal(arg)) {
+            return FP_CLASS_POSITIVE_SUBNORMAL;
+        } else {
+            return FP_CLASS_POSITIVE_NORMAL;
+        }
+    }
+}
+
+uint64_t helper_fp_class_d(CPULoongArchState *env, uint64_t arg)
+{
+    return fp_class_d(arg, &env->active_fpu.fp_status);
+}
+
+uint64_t helper_fp_add_d(CPULoongArchState *env, uint64_t fp, uint64_t fp1)
+{
+    uint64_t fp2;
+
+    fp2 = float64_add(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp2;
+}
+
+uint32_t helper_fp_add_s(CPULoongArchState *env, uint32_t fp, uint32_t fp1)
+{
+    uint32_t fp2;
+
+    fp2 = float32_add(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp2;
+}
+
+uint64_t helper_fp_sub_d(CPULoongArchState *env, uint64_t fp, uint64_t fp1)
+{
+    uint64_t fp2;
+
+    fp2 = float64_sub(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp2;
+}
+
+uint32_t helper_fp_sub_s(CPULoongArchState *env, uint32_t fp, uint32_t fp1)
+{
+    uint32_t fp2;
+
+    fp2 = float32_sub(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp2;
+}
+
+uint64_t helper_fp_mul_d(CPULoongArchState *env, uint64_t fp, uint64_t fp1)
+{
+    uint64_t fp2;
+
+    fp2 = float64_mul(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp2;
+}
+
+uint32_t helper_fp_mul_s(CPULoongArchState *env, uint32_t fp, uint32_t fp1)
+{
+    uint32_t fp2;
+
+    fp2 = float32_mul(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp2;
+}
+
+uint64_t helper_fp_div_d(CPULoongArchState *env, uint64_t fp, uint64_t fp1)
+{
+    uint64_t fp2;
+
+    fp2 = float64_div(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp2;
+}
+
+uint32_t helper_fp_div_s(CPULoongArchState *env, uint32_t fp, uint32_t fp1)
+{
+    uint32_t fp2;
+
+    fp2 = float32_div(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp2;
+}
+
+uint64_t helper_fp_exp2_d(CPULoongArchState *env,
+                          uint64_t fp, uint64_t fp1)
+{
+    uint64_t fp2;
+    int64_t n = (int64_t)fp1;
+
+    fp2 = float64_scalbn(fp,
+                         n >  0x1000 ?  0x1000 :
+                         n < -0x1000 ? -0x1000 : n,
+                         &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp2;
+}
+
+uint32_t helper_fp_exp2_s(CPULoongArchState *env,
+                          uint32_t fp, uint32_t fp1)
+{
+    uint32_t fp2;
+    int32_t n = (int32_t)fp1;
+
+    fp2 = float32_scalbn(fp,
+                         n >  0x200 ?  0x200 :
+                         n < -0x200 ? -0x200 : n,
+                         &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp2;
+}
+
+#define FP_MINMAX(name, bits, minmaxfunc)                                 \
+uint ## bits ## _t helper_fp_ ## name(CPULoongArchState *env,             \
+                                      uint ## bits ## _t fs,              \
+                                      uint ## bits ## _t ft)              \
+{                                                                         \
+    uint ## bits ## _t fdret;                                             \
+                                                                          \
+    fdret = float ## bits ## _ ## minmaxfunc(fs, ft,                      \
+                                             &env->active_fpu.fp_status); \
+    update_fcsr0(env, GETPC());                                           \
+    return fdret;                                                         \
+}
+
+FP_MINMAX(max_s, 32, maxnum)
+FP_MINMAX(max_d, 64, maxnum)
+FP_MINMAX(maxa_s, 32, maxnummag)
+FP_MINMAX(maxa_d, 64, maxnummag)
+FP_MINMAX(min_s, 32, minnum)
+FP_MINMAX(min_d, 64, minnum)
+FP_MINMAX(mina_s, 32, minnummag)
+FP_MINMAX(mina_d, 64, minnummag)
+#undef FP_MINMAX
+
+#define FP_FMADDSUB(name, bits, muladd_arg)                       \
+uint ## bits ## _t helper_fp_ ## name(CPULoongArchState *env,     \
+                                      uint ## bits ## _t fs,      \
+                                      uint ## bits ## _t ft,      \
+                                      uint ## bits ## _t fd)      \
+{                                                                 \
+    uint ## bits ## _t fdret;                                     \
+                                                                  \
+    fdret = float ## bits ## _muladd(fs, ft, fd, muladd_arg,      \
+                                     &env->active_fpu.fp_status); \
+    update_fcsr0(env, GETPC());                                   \
+    return fdret;                                                 \
+}
+
+FP_FMADDSUB(madd_s, 32, 0)
+FP_FMADDSUB(madd_d, 64, 0)
+FP_FMADDSUB(msub_s, 32, float_muladd_negate_c)
+FP_FMADDSUB(msub_d, 64, float_muladd_negate_c)
+FP_FMADDSUB(nmadd_s, 32, float_muladd_negate_result)
+FP_FMADDSUB(nmadd_d, 64, float_muladd_negate_result)
+FP_FMADDSUB(nmsub_s, 32, float_muladd_negate_result | float_muladd_negate_c)
+FP_FMADDSUB(nmsub_d, 64, float_muladd_negate_result | float_muladd_negate_c)
+#undef FP_FMADDSUB
+
+uint32_t helper_fp_logb_s(CPULoongArchState *env, uint32_t fp)
+{
+    uint32_t fp1;
+
+    fp1 = float32_log2(fp, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp1;
+}
+
+uint64_t helper_fp_logb_d(CPULoongArchState *env, uint64_t fp)
+{
+    uint64_t fp1;
+
+    fp1 = float64_log2(fp, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    return fp1;
+}
diff --git a/target/loongarch/fpu_helper.h b/target/loongarch/fpu_helper.h
new file mode 100644
index 0000000..2537a3d
--- /dev/null
+++ b/target/loongarch/fpu_helper.h
@@ -0,0 +1,34 @@
+/*
+ * QEMU LoongArch CPU
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#include "fpu/softfloat-helpers.h"
+#include "cpu.h"
+
+extern const FloatRoundMode ieee_rm[4];
+
+uint32_t fp_class_s(uint32_t arg, float_status *fst);
+uint64_t fp_class_d(uint64_t arg, float_status *fst);
+
+int ieee_ex_to_loongarch(int xcpt);
+
+static inline void restore_rounding_mode(CPULoongArchState *env)
+{
+    set_float_rounding_mode(ieee_rm[(env->active_fpu.fcsr0 >> FCSR0_RM) & 0x3],
+                            &env->active_fpu.fp_status);
+}
+
+static inline void restore_flush_mode(CPULoongArchState *env)
+{
+    set_flush_to_zero(0, &env->active_fpu.fp_status);
+}
+
+static inline void restore_fp_status(CPULoongArchState *env)
+{
+    restore_rounding_mode(env);
+    restore_flush_mode(env);
+}
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index a60f293..e945177 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -25,3 +25,50 @@ DEF_HELPER_3(asrtgt_d, void, env, tl, tl)
 DEF_HELPER_3(crc32, tl, tl, tl, i32)
 DEF_HELPER_3(crc32c, tl, tl, tl, i32)
 DEF_HELPER_2(cpucfg, tl, env, tl)
+
+/* Floating-point helper */
+DEF_HELPER_3(fp_add_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_add_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_sub_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_sub_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_mul_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_mul_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_div_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_div_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_max_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_max_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_maxa_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_maxa_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_min_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_min_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_mina_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_mina_d, i64, env, i64, i64)
+
+DEF_HELPER_4(fp_madd_s, i32, env, i32, i32, i32)
+DEF_HELPER_4(fp_madd_d, i64, env, i64, i64, i64)
+DEF_HELPER_4(fp_msub_s, i32, env, i32, i32, i32)
+DEF_HELPER_4(fp_msub_d, i64, env, i64, i64, i64)
+DEF_HELPER_4(fp_nmadd_s, i32, env, i32, i32, i32)
+DEF_HELPER_4(fp_nmadd_d, i64, env, i64, i64, i64)
+DEF_HELPER_4(fp_nmsub_s, i32, env, i32, i32, i32)
+DEF_HELPER_4(fp_nmsub_d, i64, env, i64, i64, i64)
+
+DEF_HELPER_3(fp_exp2_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_exp2_d, i64, env, i64, i64)
+DEF_HELPER_2(fp_logb_s, i32, env, i32)
+DEF_HELPER_2(fp_logb_d, i64, env, i64)
+
+DEF_HELPER_1(fp_abs_s, i32, i32)
+DEF_HELPER_1(fp_abs_d, i64, i64)
+DEF_HELPER_1(fp_neg_s, i32, i32)
+DEF_HELPER_1(fp_neg_d, i64, i64)
+
+DEF_HELPER_2(fp_sqrt_s, i32, env, i32)
+DEF_HELPER_2(fp_sqrt_d, i64, env, i64)
+DEF_HELPER_2(fp_rsqrt_s, i32, env, i32)
+DEF_HELPER_2(fp_rsqrt_d, i64, env, i64)
+DEF_HELPER_2(fp_recip_s, i32, env, i32)
+DEF_HELPER_2(fp_recip_d, i64, env, i64)
+
+DEF_HELPER_FLAGS_2(fp_class_s, TCG_CALL_NO_RWG_SE, i32, env, i32)
+DEF_HELPER_FLAGS_2(fp_class_d, TCG_CALL_NO_RWG_SE, i64, env, i64)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 66bc314..9e6a727 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -28,6 +28,10 @@
 %hint    0:5
 %whint   0:15
 %code    0:15
+%fd      0:5
+%fj      5:5
+%fk      10:5
+%fa      15:5
 
 #
 # Argument sets
@@ -49,6 +53,9 @@
 &fmt_whint          whint
 &fmt_rjrk           rj rk
 &fmt_code           code
+&fmt_fdfjfk         fd fj fk
+&fmt_fdfjfkfa       fd fj fk fa
+&fmt_fdfj           fd fj
 
 #
 # Formats
@@ -70,6 +77,9 @@
 @fmt_rdrjsi14        .... .... .............. ..... .....     &fmt_rdrjsi14       %rd %rj %si14
 @fmt_rjrk            .... ........ ..... ..... ..... .....    &fmt_rjrk           %rj %rk
 @fmt_code            .... ........ ..... ...............      &fmt_code           %code
+@fmt_fdfjfk          .... ........ ..... ..... ..... .....    &fmt_fdfjfk         %fd %fj %fk
+@fmt_fdfjfkfa        .... ........ ..... ..... ..... .....    &fmt_fdfjfkfa       %fd %fj %fk %fa
+@fmt_fdfj            .... ........ ..... ..... ..... .....    &fmt_fdfj           %fd %fj
 
 #
 # Fixed point arithmetic operation instruction
@@ -285,3 +295,49 @@ rdtimel_w        0000 00000000 00000 11000 ..... .....    @fmt_rdrj
 rdtimeh_w        0000 00000000 00000 11001 ..... .....    @fmt_rdrj
 rdtime_d         0000 00000000 00000 11010 ..... .....    @fmt_rdrj
 cpucfg           0000 00000000 00000 11011 ..... .....    @fmt_rdrj
+
+#
+# Floating point arithmetic operation instruction
+#
+fadd_s           0000 00010000 00001 ..... ..... .....    @fmt_fdfjfk
+fadd_d           0000 00010000 00010 ..... ..... .....    @fmt_fdfjfk
+fsub_s           0000 00010000 00101 ..... ..... .....    @fmt_fdfjfk
+fsub_d           0000 00010000 00110 ..... ..... .....    @fmt_fdfjfk
+fmul_s           0000 00010000 01001 ..... ..... .....    @fmt_fdfjfk
+fmul_d           0000 00010000 01010 ..... ..... .....    @fmt_fdfjfk
+fdiv_s           0000 00010000 01101 ..... ..... .....    @fmt_fdfjfk
+fdiv_d           0000 00010000 01110 ..... ..... .....    @fmt_fdfjfk
+fmadd_s          0000 10000001 ..... ..... ..... .....    @fmt_fdfjfkfa
+fmadd_d          0000 10000010 ..... ..... ..... .....    @fmt_fdfjfkfa
+fmsub_s          0000 10000101 ..... ..... ..... .....    @fmt_fdfjfkfa
+fmsub_d          0000 10000110 ..... ..... ..... .....    @fmt_fdfjfkfa
+fnmadd_s         0000 10001001 ..... ..... ..... .....    @fmt_fdfjfkfa
+fnmadd_d         0000 10001010 ..... ..... ..... .....    @fmt_fdfjfkfa
+fnmsub_s         0000 10001101 ..... ..... ..... .....    @fmt_fdfjfkfa
+fnmsub_d         0000 10001110 ..... ..... ..... .....    @fmt_fdfjfkfa
+fmax_s           0000 00010000 10001 ..... ..... .....    @fmt_fdfjfk
+fmax_d           0000 00010000 10010 ..... ..... .....    @fmt_fdfjfk
+fmin_s           0000 00010000 10101 ..... ..... .....    @fmt_fdfjfk
+fmin_d           0000 00010000 10110 ..... ..... .....    @fmt_fdfjfk
+fmaxa_s          0000 00010000 11001 ..... ..... .....    @fmt_fdfjfk
+fmaxa_d          0000 00010000 11010 ..... ..... .....    @fmt_fdfjfk
+fmina_s          0000 00010000 11101 ..... ..... .....    @fmt_fdfjfk
+fmina_d          0000 00010000 11110 ..... ..... .....    @fmt_fdfjfk
+fabs_s           0000 00010001 01000 00001 ..... .....    @fmt_fdfj
+fabs_d           0000 00010001 01000 00010 ..... .....    @fmt_fdfj
+fneg_s           0000 00010001 01000 00101 ..... .....    @fmt_fdfj
+fneg_d           0000 00010001 01000 00110 ..... .....    @fmt_fdfj
+fsqrt_s          0000 00010001 01000 10001 ..... .....    @fmt_fdfj
+fsqrt_d          0000 00010001 01000 10010 ..... .....    @fmt_fdfj
+frecip_s         0000 00010001 01000 10101 ..... .....    @fmt_fdfj
+frecip_d         0000 00010001 01000 10110 ..... .....    @fmt_fdfj
+frsqrt_s         0000 00010001 01000 11001 ..... .....    @fmt_fdfj
+frsqrt_d         0000 00010001 01000 11010 ..... .....    @fmt_fdfj
+fscaleb_s        0000 00010001 00001 ..... ..... .....    @fmt_fdfjfk
+fscaleb_d        0000 00010001 00010 ..... ..... .....    @fmt_fdfjfk
+flogb_s          0000 00010001 01000 01001 ..... .....    @fmt_fdfj
+flogb_d          0000 00010001 01000 01010 ..... .....    @fmt_fdfj
+fcopysign_s      0000 00010001 00101 ..... ..... .....    @fmt_fdfjfk
+fcopysign_d      0000 00010001 00110 ..... ..... .....    @fmt_fdfjfk
+fclass_s         0000 00010001 01000 01101 ..... .....    @fmt_fdfj
+fclass_d         0000 00010001 01000 01110 ..... .....    @fmt_fdfj
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index 366877e..786d2a6 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -3319,3 +3319,809 @@ static bool trans_cpucfg(DisasContext *ctx, arg_cpucfg *a)
 
     return true;
 }
+
+/* Floating point arithmetic operation instruction translation */
+static bool trans_fadd_s(DisasContext *ctx, arg_fadd_s * a)
+{
+    TCGv_i32 fp0, fp1;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+    gen_helper_fp_add_s(fp0, cpu_env, fp0, fp1);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+
+    return true;
+}
+
+static bool trans_fadd_d(DisasContext *ctx, arg_fadd_d *a)
+{
+    TCGv_i64 fp0, fp1;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+    gen_helper_fp_add_d(fp0, cpu_env, fp0, fp1);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+
+    return true;
+}
+
+static bool trans_fsub_s(DisasContext *ctx, arg_fsub_s *a)
+{
+    TCGv_i32 fp0, fp1;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+    gen_helper_fp_sub_s(fp0, cpu_env, fp0, fp1);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+
+    return true;
+}
+
+static bool trans_fsub_d(DisasContext *ctx, arg_fsub_d *a)
+{
+    TCGv_i64 fp0, fp1;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+    gen_helper_fp_sub_d(fp0, cpu_env, fp0, fp1);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+
+    return true;
+}
+
+static bool trans_fmul_s(DisasContext *ctx, arg_fmul_s *a)
+{
+    TCGv_i32 fp0, fp1;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+    gen_helper_fp_mul_s(fp0, cpu_env, fp0, fp1);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+
+    return true;
+}
+
+static bool trans_fmul_d(DisasContext *ctx, arg_fmul_d *a)
+{
+    TCGv_i64 fp0, fp1;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+    gen_helper_fp_mul_d(fp0, cpu_env, fp0, fp1);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+
+    return true;
+}
+
+static bool trans_fdiv_s(DisasContext *ctx, arg_fdiv_s *a)
+{
+    TCGv_i32 fp0, fp1;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+    gen_helper_fp_div_s(fp0, cpu_env, fp0, fp1);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+
+    return true;
+}
+
+static bool trans_fdiv_d(DisasContext *ctx, arg_fdiv_d *a)
+{
+    TCGv_i64 fp0, fp1;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+    gen_helper_fp_div_d(fp0, cpu_env, fp0, fp1);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+
+    return true;
+}
+
+static bool trans_fmadd_s(DisasContext *ctx, arg_fmadd_s *a)
+{
+    TCGv_i32 fp0, fp1, fp2, fp3;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+    fp2 = tcg_temp_new_i32();
+    fp3 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+    gen_load_fpr32(fp2, a->fa);
+    gen_helper_fp_madd_s(fp3, cpu_env, fp0, fp1, fp2);
+    gen_store_fpr32(fp3, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+    tcg_temp_free_i32(fp2);
+    tcg_temp_free_i32(fp3);
+
+    return true;
+}
+
+static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
+{
+    TCGv_i64 fp0, fp1, fp2, fp3;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+    fp2 = tcg_temp_new_i64();
+    fp3 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+    gen_load_fpr64(fp2, a->fa);
+    check_fpu_enabled(ctx);
+    gen_helper_fp_madd_d(fp3, cpu_env, fp0, fp1, fp2);
+    gen_store_fpr64(fp3, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+    tcg_temp_free_i64(fp2);
+    tcg_temp_free_i64(fp3);
+
+    return true;
+}
+
+static bool trans_fmsub_s(DisasContext *ctx, arg_fmsub_s *a)
+{
+    TCGv_i32 fp0, fp1, fp2, fp3;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+    fp2 = tcg_temp_new_i32();
+    fp3 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+    gen_load_fpr32(fp2, a->fa);
+    gen_helper_fp_msub_s(fp3, cpu_env, fp0, fp1, fp2);
+    gen_store_fpr32(fp3, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+    tcg_temp_free_i32(fp2);
+    tcg_temp_free_i32(fp3);
+
+    return true;
+}
+
+static bool trans_fmsub_d(DisasContext *ctx, arg_fmsub_d *a)
+{
+    TCGv_i64 fp0, fp1, fp2, fp3;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+    fp2 = tcg_temp_new_i64();
+    fp3 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+    gen_load_fpr64(fp2, a->fa);
+    gen_helper_fp_msub_d(fp3, cpu_env, fp0, fp1, fp2);
+    gen_store_fpr64(fp3, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+    tcg_temp_free_i64(fp2);
+    tcg_temp_free_i64(fp3);
+
+    return true;
+}
+
+static bool trans_fnmadd_s(DisasContext *ctx, arg_fnmadd_s *a)
+{
+    TCGv_i32 fp0, fp1, fp2, fp3;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+    fp2 = tcg_temp_new_i32();
+    fp3 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+    gen_load_fpr32(fp2, a->fa);
+    gen_helper_fp_nmadd_s(fp3, cpu_env, fp0, fp1, fp2);
+    gen_store_fpr32(fp3, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+    tcg_temp_free_i32(fp2);
+    tcg_temp_free_i32(fp3);
+
+    return true;
+}
+
+static bool trans_fnmadd_d(DisasContext *ctx, arg_fnmadd_d *a)
+{
+    TCGv_i64 fp0, fp1, fp2, fp3;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+    fp2 = tcg_temp_new_i64();
+    fp3 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+    gen_load_fpr64(fp2, a->fa);
+    gen_helper_fp_nmadd_d(fp3, cpu_env, fp0, fp1, fp2);
+    gen_store_fpr64(fp3, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+    tcg_temp_free_i64(fp2);
+    tcg_temp_free_i64(fp3);
+
+    return true;
+}
+
+static bool trans_fnmsub_s(DisasContext *ctx, arg_fnmsub_s *a)
+{
+    TCGv_i32 fp0, fp1, fp2, fp3;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+    fp2 = tcg_temp_new_i32();
+    fp3 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+    gen_load_fpr32(fp2, a->fa);
+    gen_helper_fp_nmsub_s(fp3, cpu_env, fp0, fp1, fp2);
+    gen_store_fpr32(fp3, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+    tcg_temp_free_i32(fp2);
+    tcg_temp_free_i32(fp3);
+
+    return true;
+}
+
+static bool trans_fnmsub_d(DisasContext *ctx, arg_fnmsub_d *a)
+{
+    TCGv_i64 fp0, fp1, fp2, fp3;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+    fp2 = tcg_temp_new_i64();
+    fp3 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+    gen_load_fpr64(fp2, a->fa);
+    gen_helper_fp_nmsub_d(fp3, cpu_env, fp0, fp1, fp2);
+    gen_store_fpr64(fp3, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+    tcg_temp_free_i64(fp2);
+    tcg_temp_free_i64(fp3);
+
+    return true;
+}
+
+static bool trans_fmax_s(DisasContext *ctx, arg_fmax_s *a)
+{
+    TCGv_i32 fp0, fp1;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+    gen_helper_fp_max_s(fp1, cpu_env, fp0, fp1);
+    gen_store_fpr32(fp1, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+
+    return true;
+}
+
+static bool trans_fmax_d(DisasContext *ctx, arg_fmax_d *a)
+{
+    TCGv_i64 fp0, fp1;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+    gen_helper_fp_max_d(fp1, cpu_env, fp0, fp1);
+    gen_store_fpr64(fp1, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+
+    return true;
+}
+
+static bool trans_fmin_s(DisasContext *ctx, arg_fmin_s *a)
+{
+    TCGv_i32 fp0, fp1;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+    gen_helper_fp_min_s(fp1, cpu_env, fp0, fp1);
+    gen_store_fpr32(fp1, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+
+    return true;
+}
+
+static bool trans_fmin_d(DisasContext *ctx, arg_fmin_d *a)
+{
+    TCGv_i64 fp0, fp1;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+    gen_helper_fp_min_d(fp1, cpu_env, fp0, fp1);
+    gen_store_fpr64(fp1, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+
+    return true;
+}
+
+static bool trans_fmaxa_s(DisasContext *ctx, arg_fmaxa_s *a)
+{
+    TCGv_i32 fp0, fp1;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+    gen_helper_fp_maxa_s(fp1, cpu_env, fp0, fp1);
+    gen_store_fpr32(fp1, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+
+    return true;
+}
+
+static bool trans_fmaxa_d(DisasContext *ctx, arg_fmaxa_d *a)
+{
+    TCGv_i64 fp0, fp1;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+    gen_helper_fp_maxa_d(fp1, cpu_env, fp0, fp1);
+    gen_store_fpr64(fp1, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+
+    return true;
+}
+
+static bool trans_fmina_s(DisasContext *ctx, arg_fmina_s *a)
+{
+    TCGv_i32 fp0, fp1;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+    gen_helper_fp_mina_s(fp1, cpu_env, fp0, fp1);
+    gen_store_fpr32(fp1, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+
+    return true;
+}
+
+static bool trans_fmina_d(DisasContext *ctx, arg_fmina_d *a)
+{
+    TCGv_i64 fp0, fp1;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+    gen_helper_fp_mina_d(fp1, cpu_env, fp0, fp1);
+    gen_store_fpr64(fp1, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+
+    return true;
+}
+
+static bool trans_fabs_s(DisasContext *ctx, arg_fabs_s *a)
+{
+    TCGv_i32 fp0;
+
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_helper_fp_abs_s(fp0, fp0);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_fabs_d(DisasContext *ctx, arg_fabs_d *a)
+{
+    TCGv_i64 fp0;
+
+    fp0 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_helper_fp_abs_d(fp0, fp0);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
+
+static bool trans_fneg_s(DisasContext *ctx, arg_fneg_s *a)
+{
+    TCGv_i32 fp0;
+
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_helper_fp_neg_s(fp0, fp0);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_fneg_d(DisasContext *ctx, arg_fneg_d *a)
+{
+    TCGv_i64 fp0;
+
+    fp0 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_helper_fp_neg_d(fp0, fp0);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
+
+static bool trans_fsqrt_s(DisasContext *ctx, arg_fsqrt_s *a)
+{
+    TCGv_i32 fp0;
+
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_helper_fp_sqrt_s(fp0, cpu_env, fp0);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_fsqrt_d(DisasContext *ctx, arg_fsqrt_d *a)
+{
+    TCGv_i64 fp0;
+
+    fp0 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_helper_fp_sqrt_d(fp0, cpu_env, fp0);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
+
+static bool trans_frecip_s(DisasContext *ctx, arg_frecip_s *a)
+{
+    TCGv_i32 fp0;
+
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_helper_fp_recip_s(fp0, cpu_env, fp0);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_frecip_d(DisasContext *ctx, arg_frecip_d *a)
+{
+    TCGv_i64 fp0;
+
+    fp0 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_helper_fp_recip_d(fp0, cpu_env, fp0);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
+
+static bool trans_frsqrt_s(DisasContext *ctx, arg_frsqrt_s *a)
+{
+    TCGv_i32 fp0;
+
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_helper_fp_rsqrt_s(fp0, cpu_env, fp0);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_frsqrt_d(DisasContext *ctx, arg_frsqrt_d *a)
+{
+    TCGv_i64 fp0;
+
+    fp0 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_helper_fp_rsqrt_d(fp0, cpu_env, fp0);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
+
+static bool trans_fscaleb_s(DisasContext *ctx, arg_fscaleb_s *a)
+{
+    TCGv_i32 fp0, fp1;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+    gen_helper_fp_exp2_s(fp0, cpu_env, fp0, fp1);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+
+    return true;
+}
+
+static bool trans_fscaleb_d(DisasContext *ctx, arg_fscaleb_d *a)
+{
+    TCGv_i64 fp0, fp1;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+    gen_helper_fp_exp2_d(fp0, cpu_env, fp0, fp1);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+
+    return true;
+}
+
+static bool trans_flogb_s(DisasContext *ctx, arg_flogb_s *a)
+{
+    TCGv_i32 fp0, fp1;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_helper_fp_logb_s(fp1, cpu_env, fp0);
+    gen_store_fpr32(fp1, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+
+    return true;
+}
+
+static bool trans_flogb_d(DisasContext *ctx, arg_flogb_d *a)
+{
+    TCGv_i64 fp0, fp1;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_helper_fp_logb_d(fp1, cpu_env, fp0);
+    gen_store_fpr64(fp1, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+
+    return true;
+}
+
+static bool trans_fcopysign_s(DisasContext *ctx, arg_fcopysign_s *a)
+{
+    TCGv_i32 fp0, fp1, fp2;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+    fp2 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+    tcg_gen_deposit_i32(fp2, fp1, fp0, 0, 31);
+    gen_store_fpr32(fp2, a->fd);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+    tcg_temp_free_i32(fp2);
+
+    return true;
+}
+
+static bool trans_fcopysign_d(DisasContext *ctx, arg_fcopysign_d *a)
+{
+    TCGv_i64 fp0, fp1, fp2;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+    fp2 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+    tcg_gen_deposit_i64(fp2, fp1, fp0, 0, 63);
+    gen_store_fpr64(fp2, a->fd);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+    tcg_temp_free_i64(fp2);
+
+    return true;
+}
+
+static bool trans_fclass_s(DisasContext *ctx, arg_fclass_s *a)
+{
+    TCGv_i32 fp0;
+
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_helper_fp_class_s(fp0, cpu_env, fp0);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
+{
+    TCGv_i64 fp0;
+
+    fp0 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(fp0, a->fj);
+    gen_helper_fp_class_d(fp0, cpu_env, fp0);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
-- 
1.8.3.1


