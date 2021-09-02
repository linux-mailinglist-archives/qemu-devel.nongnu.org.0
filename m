Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AF13FEDFB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:47:35 +0200 (CEST)
Received: from localhost ([::1]:36380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLm7y-0005w3-FU
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mLm2Z-0005pm-PD
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:42:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36180 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mLm2T-00062i-Tl
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:41:58 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxYctjxjBha2YCAA--.7003S12; 
 Thu, 02 Sep 2021 20:41:26 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/21] target/loongarch: Add floating point arithmetic
 instruction translation
Date: Thu,  2 Sep 2021 20:40:56 +0800
Message-Id: <1630586467-22463-11-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9AxYctjxjBha2YCAA--.7003S12
X-Coremail-Antispam: 1UD129KBjvAXoWfXw4DJry7CF1kKFWfCw1kuFg_yoW8KrW8to
 W3uF15Ar48G3yfuF98KwnYvr47XryUZ3ZxJrWrZr13Ka4xGry7KF15G3sYya1fKrs5trW5
 Jrn3A3W5JwnIvr93n29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, groug@kaod.org, maobibo@loongson.cn,
 mrolnik@gmail.com, shorne@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au, kbastian@mail.uni-paderborn.de, crwulff@gmail.com,
 laurent@vivier.eu, palmer@dabbelt.com, pbonzini@redhat.com,
 aurelien@aurel32.net
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
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/cpu.c                     |   1 +
 target/loongarch/fpu_helper.c              | 438 +++++++++++++++++++++++++++++
 target/loongarch/helper.h                  |  42 +++
 target/loongarch/insn_trans/trans_farith.c |  79 ++++++
 target/loongarch/insns.decode              |  56 ++++
 target/loongarch/internals.h               |   2 +
 target/loongarch/translate.c               |  10 +
 target/loongarch/translate.h               |   2 +
 8 files changed, 630 insertions(+)
 create mode 100644 target/loongarch/fpu_helper.c
 create mode 100644 target/loongarch/insn_trans/trans_farith.c

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index b89bf51..487df05 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -143,6 +143,7 @@ static void loongarch_cpu_reset(DeviceState *dev)
     env->fcsr0_mask = 0x1f1f031f;
     env->fcsr0 = 0x0;
 
+    restore_fp_status(env);
     cs->exception_index = EXCP_NONE;
 }
 
diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
new file mode 100644
index 0000000..c3bee57
--- /dev/null
+++ b/target/loongarch/fpu_helper.c
@@ -0,0 +1,438 @@
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
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "fpu/softfloat.h"
+#include "translate.h"
+#include "internals.h"
+
+#define FLOAT_TO_INT32_OVERFLOW 0x7fffffff
+#define FLOAT_TO_INT64_OVERFLOW 0x7fffffffffffffffULL
+
+static inline uint64_t nanbox_s(float32 fp)
+{
+    return fp | MAKE_64BIT_MASK(32, 32);
+}
+
+/* convert loongarch rounding mode in fcsr0 to IEEE library */
+const FloatRoundMode ieee_rm[4] = {
+    float_round_nearest_even,
+    float_round_to_zero,
+    float_round_up,
+    float_round_down
+};
+
+void restore_fp_status(CPULoongArchState *env)
+{
+    set_float_rounding_mode(ieee_rm[(env->fcsr0 >> FCSR0_RM) & 0x3],
+                            &env->fp_status);
+    set_flush_to_zero(0, &env->fp_status);
+}
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
+    int flags = ieee_ex_to_loongarch(get_float_exception_flags(
+                                  &env->fp_status));
+
+    SET_FP_CAUSE(env->fcsr0, flags);
+    if (flags) {
+        set_float_exception_flags(0, &env->fp_status);
+
+        if (GET_FP_ENABLE(env->fcsr0) & flags) {
+            do_raise_exception(env, EXCP_FPE, pc);
+        } else {
+            UPDATE_FP_FLAGS(env->fcsr0, flags);
+        }
+    }
+}
+
+uint64_t helper_fadd_s(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(float32_add((uint32_t)fj, (uint32_t)fk, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fadd_d(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = float64_add(fj, fk, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fsub_s(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(float32_sub((uint32_t)fj, (uint32_t)fk, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fsub_d(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = float64_sub(fj, fk, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fmul_s(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(float32_mul((uint32_t)fj, (uint32_t)fk, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fmul_d(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = float64_mul(fj, fk, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fdiv_s(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(float32_div((uint32_t)fj, (uint32_t)fk, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fdiv_d(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = float64_div(fj, fk, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fmax_s(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(float32_maxnum((uint32_t)fj, (uint32_t)fk, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fmax_d(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = float64_maxnum(fj, fk, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fmin_s(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(float32_minnum((uint32_t)fj, (uint32_t)fk, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fmin_d(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = float64_minnum(fj, fk, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fmaxa_s(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(float32_maxnummag((uint32_t)fj,
+                                    (uint32_t)fk, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fmaxa_d(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = float64_maxnummag(fj, fk, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fmina_s(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(float32_minnummag((uint32_t)fj,
+                                    (uint32_t)fk, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fmina_d(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+
+    fd = float64_minnummag(fj, fk, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fscaleb_s(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+    int32_t n = (int32_t)fk;
+
+    fd = nanbox_s(float32_scalbn((uint32_t)fj,
+                                 n >  0x200 ?  0x200 :
+                                 n < -0x200 ? -0x200 : n,
+                                 &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fscaleb_d(CPULoongArchState *env, uint64_t fj, uint64_t fk)
+{
+    uint64_t fd;
+    int64_t n = (int64_t)fk;
+
+    fd = float64_scalbn(fj,
+                        n >  0x1000 ?  0x1000 :
+                        n < -0x1000 ? -0x1000 : n,
+                        &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fabs_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(float32_abs((uint32_t)fj));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fabs_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = float64_abs(fj);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fneg_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(float32_chs((uint32_t)fj));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fneg_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = float64_chs(fj);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fsqrt_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(float32_sqrt((uint32_t)fj, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fsqrt_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = float64_sqrt(fj, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_frecip_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(float32_div(float32_one, (uint32_t)fj, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_frecip_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = float64_div(float64_one, fj, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_frsqrt_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    uint32_t fp;
+
+    fp = float32_sqrt((uint32_t)fj, &env->fp_status);
+    fd = nanbox_s(float32_div(float32_one, fp, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_frsqrt_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fp, fd;
+
+    fp = float64_sqrt(fj, &env->fp_status);
+    fd = float64_div(float64_one, fp, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_flogb_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    uint32_t fp;
+    float_status *status = &env->fp_status;
+    FloatRoundMode old_mode = get_float_rounding_mode(status);
+
+    set_float_exception_flags(0, status);
+    set_float_rounding_mode(float_round_down, status);
+    fp = float32_log2((uint32_t)fj, status);
+    fd = nanbox_s(float32_round_to_int(fp, status));
+    set_float_rounding_mode(old_mode, status);
+    set_float_exception_flags(get_float_exception_flags(status) &
+                              (~float_flag_inexact), status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_flogb_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    float_status *status = &env->fp_status;
+    FloatRoundMode old_mode = get_float_rounding_mode(status);
+
+    set_float_exception_flags(0, status);
+    set_float_rounding_mode(float_round_down, status);
+    fd = float64_log2(fj, status);
+    fd = float64_round_to_int(fd, status);
+    set_float_rounding_mode(old_mode, status);
+    set_float_exception_flags(get_float_exception_flags(status) &
+                              (~float_flag_inexact), status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fclass_s(CPULoongArchState *env, uint64_t fj)
+{
+    float32 f = fj;
+    bool sign = float32_is_neg(f);
+
+    if (float32_is_infinity(f)) {
+        return sign ? 1 << 0 : 1 << 7;
+    } else if (float32_is_zero(f)) {
+        return sign ? 1 << 3 : 1 << 4;
+    } else if (float32_is_zero_or_denormal(f)) {
+        return sign ? 1 << 2 : 1 << 5;
+    } else if (float32_is_any_nan(f)) {
+        float_status s = { }; /* for snan_bit_is_one */
+        return float32_is_quiet_nan(f, &s) ? 1 << 9 : 1 << 8;
+    } else {
+        return sign ? 1 << 1 : 1 << 6;
+    }
+}
+
+uint64_t helper_fclass_d(CPULoongArchState *env, uint64_t fj)
+{
+    float64 f = fj;
+    bool sign = float64_is_neg(f);
+
+    if (float64_is_infinity(f)) {
+        return sign ? 1 << 0 : 1 << 7;
+    } else if (float64_is_zero(f)) {
+        return sign ? 1 << 3 : 1 << 4;
+    } else if (float64_is_zero_or_denormal(f)) {
+        return sign ? 1 << 2 : 1 << 5;
+    } else if (float64_is_any_nan(f)) {
+        float_status s = { }; /* for snan_bit_is_one */
+        return float64_is_quiet_nan(f, &s) ? 1 << 9 : 1 << 8;
+    } else {
+        return sign ? 1 << 1 : 1 << 6;
+    }
+}
+
+uint64_t helper_fmuladd_s(CPULoongArchState *env, uint64_t fj,
+                          uint64_t fk, uint64_t fa, uint32_t flag)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(float32_muladd((uint32_t)fj, (uint32_t)fk,
+                                 (uint32_t)fa, flag, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fmuladd_d(CPULoongArchState *env, uint64_t fj,
+                          uint64_t fk, uint64_t fa, uint32_t flag)
+{
+    uint64_t fd;
+
+    fd = float64_muladd(fj, fk, fa, flag, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index e4b4595..62c262e 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -18,3 +18,45 @@ DEF_HELPER_3(asrtgt_d, void, env, tl, tl)
 DEF_HELPER_3(crc32, tl, tl, tl, tl)
 DEF_HELPER_3(crc32c, tl, tl, tl, tl)
 DEF_HELPER_2(cpucfg, tl, env, tl)
+
+/* Floating-point helper */
+DEF_HELPER_3(fadd_s, i64, env, i64, i64)
+DEF_HELPER_3(fadd_d, i64, env, i64, i64)
+DEF_HELPER_3(fsub_s, i64, env, i64, i64)
+DEF_HELPER_3(fsub_d, i64, env, i64, i64)
+DEF_HELPER_3(fmul_s, i64, env, i64, i64)
+DEF_HELPER_3(fmul_d, i64, env, i64, i64)
+DEF_HELPER_3(fdiv_s, i64, env, i64, i64)
+DEF_HELPER_3(fdiv_d, i64, env, i64, i64)
+DEF_HELPER_3(fmax_s, i64, env, i64, i64)
+DEF_HELPER_3(fmax_d, i64, env, i64, i64)
+DEF_HELPER_3(fmaxa_s, i64, env, i64, i64)
+DEF_HELPER_3(fmaxa_d, i64, env, i64, i64)
+DEF_HELPER_3(fmin_s, i64, env, i64, i64)
+DEF_HELPER_3(fmin_d, i64, env, i64, i64)
+DEF_HELPER_3(fmina_s, i64, env, i64, i64)
+DEF_HELPER_3(fmina_d, i64, env, i64, i64)
+
+DEF_HELPER_5(fmuladd_s, i64, env, i64, i64, i64, i32)
+DEF_HELPER_5(fmuladd_d, i64, env, i64, i64, i64, i32)
+
+DEF_HELPER_3(fscaleb_s, i64, env, i64, i64)
+DEF_HELPER_3(fscaleb_d, i64, env, i64, i64)
+
+DEF_HELPER_2(flogb_s, i64, env, i64)
+DEF_HELPER_2(flogb_d, i64, env, i64)
+
+DEF_HELPER_2(fabs_s, i64, env, i64)
+DEF_HELPER_2(fabs_d, i64, env, i64)
+DEF_HELPER_2(fneg_s, i64, env, i64)
+DEF_HELPER_2(fneg_d, i64, env, i64)
+
+DEF_HELPER_2(fsqrt_s, i64, env, i64)
+DEF_HELPER_2(fsqrt_d, i64, env, i64)
+DEF_HELPER_2(frsqrt_s, i64, env, i64)
+DEF_HELPER_2(frsqrt_d, i64, env, i64)
+DEF_HELPER_2(frecip_s, i64, env, i64)
+DEF_HELPER_2(frecip_d, i64, env, i64)
+
+DEF_HELPER_FLAGS_2(fclass_s, TCG_CALL_NO_RWG_SE, i64, env, i64)
+DEF_HELPER_FLAGS_2(fclass_d, TCG_CALL_NO_RWG_SE, i64, env, i64)
diff --git a/target/loongarch/insn_trans/trans_farith.c b/target/loongarch/insn_trans/trans_farith.c
new file mode 100644
index 0000000..8015d3b
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_farith.c
@@ -0,0 +1,79 @@
+/*
+ * LoongArch translate functions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+static bool gen_f3(DisasContext *ctx, arg_fmt_fdfjfk *a,
+                   void (*func)(TCGv, TCGv_env, TCGv, TCGv))
+{
+    func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk]);
+    return true;
+}
+
+static bool gen_muladd(DisasContext *ctx, arg_fmt_fdfjfkfa *a,
+                       void (*func)(TCGv, TCGv_env, TCGv, TCGv, TCGv, TCGv_i32),
+                       int flag)
+{
+    TCGv_i32 tflag = tcg_constant_i32(flag);
+    func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj],
+         cpu_fpr[a->fk], cpu_fpr[a->fa], tflag);
+    return true;
+}
+
+static bool trans_fcopysign_s(DisasContext *ctx, arg_fmt_fdfjfk *a)
+{
+    tcg_gen_deposit_i64(cpu_fpr[a->fd], cpu_fpr[a->fk], cpu_fpr[a->fj], 0, 31);
+    return true;
+}
+
+static bool trans_fcopysign_d(DisasContext *ctx, arg_fmt_fdfjfk *a)
+{
+    tcg_gen_deposit_i64(cpu_fpr[a->fd], cpu_fpr[a->fk], cpu_fpr[a->fj], 0, 63);
+    return true;
+}
+
+TRANS(fadd_s, gen_f3, gen_helper_fadd_s)
+TRANS(fadd_d, gen_f3, gen_helper_fadd_d)
+TRANS(fsub_s, gen_f3, gen_helper_fsub_s)
+TRANS(fsub_d, gen_f3, gen_helper_fsub_d)
+TRANS(fmul_s, gen_f3, gen_helper_fmul_s)
+TRANS(fmul_d, gen_f3, gen_helper_fmul_d)
+TRANS(fdiv_s, gen_f3, gen_helper_fdiv_s)
+TRANS(fdiv_d, gen_f3, gen_helper_fdiv_d)
+TRANS(fmax_s, gen_f3, gen_helper_fmax_s)
+TRANS(fmax_d, gen_f3, gen_helper_fmax_d)
+TRANS(fmin_s, gen_f3, gen_helper_fmin_s)
+TRANS(fmin_d, gen_f3, gen_helper_fmin_d)
+TRANS(fmaxa_s, gen_f3, gen_helper_fmaxa_s)
+TRANS(fmaxa_d, gen_f3, gen_helper_fmaxa_d)
+TRANS(fmina_s, gen_f3, gen_helper_fmina_s)
+TRANS(fmina_d, gen_f3, gen_helper_fmina_d)
+TRANS(fscaleb_s, gen_f3, gen_helper_fscaleb_s)
+TRANS(fscaleb_d, gen_f3, gen_helper_fscaleb_d)
+TRANS(fabs_s, gen_f2, gen_helper_fabs_s)
+TRANS(fabs_d, gen_f2, gen_helper_fabs_d)
+TRANS(fneg_s, gen_f2, gen_helper_fneg_s)
+TRANS(fneg_d, gen_f2, gen_helper_fneg_d)
+TRANS(fsqrt_s, gen_f2, gen_helper_fsqrt_s)
+TRANS(fsqrt_d, gen_f2, gen_helper_fsqrt_d)
+TRANS(frecip_s, gen_f2, gen_helper_frecip_s)
+TRANS(frecip_d, gen_f2, gen_helper_frecip_d)
+TRANS(frsqrt_s, gen_f2, gen_helper_frsqrt_s)
+TRANS(frsqrt_d, gen_f2, gen_helper_frsqrt_d)
+TRANS(flogb_s, gen_f2, gen_helper_flogb_s)
+TRANS(flogb_d, gen_f2, gen_helper_flogb_d)
+TRANS(fclass_s, gen_f2, gen_helper_fclass_s)
+TRANS(fclass_d, gen_f2, gen_helper_fclass_d)
+TRANS(fmadd_s, gen_muladd, gen_helper_fmuladd_s, 0)
+TRANS(fmadd_d, gen_muladd, gen_helper_fmuladd_d, 0)
+TRANS(fmsub_s, gen_muladd, gen_helper_fmuladd_s, float_muladd_negate_c)
+TRANS(fmsub_d, gen_muladd, gen_helper_fmuladd_d, float_muladd_negate_c)
+TRANS(fnmadd_s, gen_muladd, gen_helper_fmuladd_s,
+      float_muladd_negate_product | float_muladd_negate_c)
+TRANS(fnmadd_d, gen_muladd, gen_helper_fmuladd_d,
+      float_muladd_negate_product | float_muladd_negate_c)
+TRANS(fnmsub_s, gen_muladd, gen_helper_fmuladd_s, float_muladd_negate_product)
+TRANS(fnmsub_d, gen_muladd, gen_helper_fmuladd_d, float_muladd_negate_product)
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
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 1052cb6..096a4a7 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -19,4 +19,6 @@ void QEMU_NORETURN do_raise_exception(CPULoongArchState *env,
 
 const char *loongarch_exception_name(int32_t exception);
 
+void restore_fp_status(CPULoongArchState *env);
+
 #endif
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index ea2af7e..d3e6f8a 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -16,6 +16,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
+#include "fpu/softfloat.h"
 #include "translate.h"
 #include "internals.h"
 
@@ -190,12 +191,21 @@ static bool gen_r3(DisasContext *ctx, arg_fmt_rdrjrk *a,
     return true;
 }
 
+/* fmt fd fj */
+static bool gen_f2(DisasContext *ctx, arg_fmt_fdfj *a,
+                   void (*func)(TCGv, TCGv_env, TCGv))
+{
+    func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj]);
+    return true;
+}
+
 #include "insn_trans/trans_arith.c"
 #include "insn_trans/trans_shift.c"
 #include "insn_trans/trans_bit.c"
 #include "insn_trans/trans_memory.c"
 #include "insn_trans/trans_atomic.c"
 #include "insn_trans/trans_extra.c"
+#include "insn_trans/trans_farith.c"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
index f064fdd..99ab329 100644
--- a/target/loongarch/translate.h
+++ b/target/loongarch/translate.h
@@ -44,4 +44,6 @@ extern TCGv cpu_gpr[32], cpu_pc;
 extern TCGv_i32 cpu_fscr0;
 extern TCGv_i64 cpu_fpr[32];
 
+int ieee_ex_to_loongarch(int xcpt);
+
 #endif
-- 
1.8.3.1


