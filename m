Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7285146B9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 12:24:22 +0200 (CEST)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkNnR-0005pA-Ds
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 06:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nkNXc-0007ti-06
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:08:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46032 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nkNXY-0002zm-JJ
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:07:59 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9vhuGtiZicDAA--.14518S12; 
 Fri, 29 Apr 2022 18:07:41 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/43] target/loongarch: Add floating point arithmetic
 instruction translation
Date: Fri, 29 Apr 2022 18:06:56 +0800
Message-Id: <20220429100729.1572481-11-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9vhuGtiZicDAA--.14518S12
X-Coremail-Antispam: 1UD129KBjvAXoWfXw4ftr1fXry7ZrW5Ar45GFg_yoW8Kry5Ko
 WxWFy5Ar4rG3yxuF98Kwn0qr42qFyjv3ZxAr4rZr15Ka4xGry7K3W5GwnYya1fKr1UtrW5
 Xrn2yw15JwnIvr93n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

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
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c                        |   1 +
 target/loongarch/fpu_helper.c                 | 403 ++++++++++++++++++
 target/loongarch/helper.h                     |  37 ++
 .../loongarch/insn_trans/trans_farith.c.inc   | 105 +++++
 target/loongarch/insns.decode                 |  52 +++
 target/loongarch/internals.h                  |   2 +
 target/loongarch/translate.c                  |  11 +
 7 files changed, 611 insertions(+)
 create mode 100644 target/loongarch/fpu_helper.c
 create mode 100644 target/loongarch/insn_trans/trans_farith.c.inc

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 2d5b28b822..d2fc26cff9 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -196,6 +196,7 @@ static void loongarch_cpu_reset(DeviceState *dev)
     env->fcsr0_mask = FCSR0_M1 | FCSR0_M2 | FCSR0_M3;
     env->fcsr0 = 0x0;
 
+    restore_fp_status(env);
     cs->exception_index = -1;
 }
 
diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
new file mode 100644
index 0000000000..e875638e1d
--- /dev/null
+++ b/target/loongarch/fpu_helper.c
@@ -0,0 +1,403 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch float point emulation helpers for QEMU
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "fpu/softfloat.h"
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
+/* Convert loongarch rounding mode in fcsr0 to IEEE library */
+static const FloatRoundMode ieee_rm[4] = {
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
+static int ieee_ex_to_loongarch(int xcpt)
+{
+    int ret = 0;
+    if (xcpt & float_flag_invalid) {
+        ret |= FP_INVALID;
+    }
+    if (xcpt & float_flag_overflow) {
+        ret |= FP_OVERFLOW;
+    }
+    if (xcpt & float_flag_underflow) {
+        ret |= FP_UNDERFLOW;
+    }
+    if (xcpt & float_flag_divbyzero) {
+        ret |= FP_DIV0;
+    }
+    if (xcpt & float_flag_inexact) {
+        ret |= FP_INEXACT;
+    }
+    return ret;
+}
+
+static void update_fcsr0_mask(CPULoongArchState *env, uintptr_t pc, int mask)
+{
+    int flags = get_float_exception_flags(&env->fp_status);
+
+    set_float_exception_flags(0, &env->fp_status);
+
+    flags &= ~mask;
+
+    if (!flags) {
+        SET_FP_CAUSE(env->fcsr0, flags);
+        return;
+    } else {
+        flags = ieee_ex_to_loongarch(flags);
+        SET_FP_CAUSE(env->fcsr0, flags);
+    }
+
+    if (GET_FP_ENABLES(env->fcsr0) & flags) {
+        do_raise_exception(env, EXCCODE_FPE, pc);
+    } else {
+        UPDATE_FP_FLAGS(env->fcsr0, flags);
+    }
+}
+
+static void update_fcsr0(CPULoongArchState *env, uintptr_t pc)
+{
+    update_fcsr0_mask(env, pc, 0);
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
+    set_float_rounding_mode(float_round_down, status);
+    fp = float32_log2((uint32_t)fj, status);
+    fd = nanbox_s(float32_round_to_int(fp, status));
+    set_float_rounding_mode(old_mode, status);
+    update_fcsr0_mask(env, GETPC(), float_flag_inexact);
+    return fd;
+}
+
+uint64_t helper_flogb_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    float_status *status = &env->fp_status;
+    FloatRoundMode old_mode = get_float_rounding_mode(status);
+
+    set_float_rounding_mode(float_round_down, status);
+    fd = float64_log2(fj, status);
+    fd = float64_round_to_int(fd, status);
+    set_float_rounding_mode(old_mode, status);
+    update_fcsr0_mask(env, GETPC(), float_flag_inexact);
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
index 638c2efc51..840bad9b2f 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -15,3 +15,40 @@ DEF_HELPER_FLAGS_3(asrtgt_d, TCG_CALL_NO_WG, void, env, tl, tl)
 DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_2(cpucfg, TCG_CALL_NO_RWG_SE, tl, env, tl)
+
+/* Floating-point helper */
+DEF_HELPER_FLAGS_3(fadd_s, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fadd_d, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fsub_s, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fsub_d, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmul_s, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmul_d, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fdiv_s, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fdiv_d, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmax_s, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmax_d, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmin_s, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmin_d, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmaxa_s, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmaxa_d, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmina_s, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmina_d, TCG_CALL_NO_WG, i64, env, i64, i64)
+
+DEF_HELPER_FLAGS_5(fmuladd_s, TCG_CALL_NO_WG, i64, env, i64, i64, i64, i32)
+DEF_HELPER_FLAGS_5(fmuladd_d, TCG_CALL_NO_WG, i64, env, i64, i64, i64, i32)
+
+DEF_HELPER_FLAGS_3(fscaleb_s, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fscaleb_d, TCG_CALL_NO_WG, i64, env, i64, i64)
+
+DEF_HELPER_FLAGS_2(flogb_s, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_2(flogb_d, TCG_CALL_NO_WG, i64, env, i64)
+
+DEF_HELPER_FLAGS_2(fsqrt_s, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fsqrt_d, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_2(frsqrt_s, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_2(frsqrt_d, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_2(frecip_s, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_2(frecip_d, TCG_CALL_NO_WG, i64, env, i64)
+
+DEF_HELPER_FLAGS_2(fclass_s, TCG_CALL_NO_RWG_SE, i64, env, i64)
+DEF_HELPER_FLAGS_2(fclass_d, TCG_CALL_NO_RWG_SE, i64, env, i64)
diff --git a/target/loongarch/insn_trans/trans_farith.c.inc b/target/loongarch/insn_trans/trans_farith.c.inc
new file mode 100644
index 0000000000..65ad2ffab8
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_farith.c.inc
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static bool gen_fff(DisasContext *ctx, arg_fff *a,
+                    void (*func)(TCGv, TCGv_env, TCGv, TCGv))
+{
+    func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk]);
+    return true;
+}
+
+static bool gen_ff(DisasContext *ctx, arg_ff *a,
+                   void (*func)(TCGv, TCGv_env, TCGv))
+{
+    func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj]);
+    return true;
+}
+
+static bool gen_muladd(DisasContext *ctx, arg_ffff *a,
+                       void (*func)(TCGv, TCGv_env, TCGv, TCGv, TCGv, TCGv_i32),
+                       int flag)
+{
+    TCGv_i32 tflag = tcg_constant_i32(flag);
+    func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj],
+         cpu_fpr[a->fk], cpu_fpr[a->fa], tflag);
+    return true;
+}
+
+static bool trans_fcopysign_s(DisasContext *ctx, arg_fcopysign_s *a)
+{
+    tcg_gen_deposit_i64(cpu_fpr[a->fd], cpu_fpr[a->fk], cpu_fpr[a->fj], 0, 31);
+    return true;
+}
+
+static bool trans_fcopysign_d(DisasContext *ctx, arg_fcopysign_d *a)
+{
+    tcg_gen_deposit_i64(cpu_fpr[a->fd], cpu_fpr[a->fk], cpu_fpr[a->fj], 0, 63);
+    return true;
+}
+
+static bool trans_fabs_s(DisasContext *ctx, arg_fabs_s *a)
+{
+    tcg_gen_andi_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], MAKE_64BIT_MASK(0, 31));
+    gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
+    return true;
+}
+
+static bool trans_fabs_d(DisasContext *ctx, arg_fabs_d *a)
+{
+    tcg_gen_andi_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], MAKE_64BIT_MASK(0, 63));
+    return true;
+}
+
+static bool trans_fneg_s(DisasContext *ctx, arg_fneg_s *a)
+{
+    tcg_gen_xori_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], 0x80000000);
+    gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
+    return true;
+}
+
+static bool trans_fneg_d(DisasContext *ctx, arg_fneg_d *a)
+{
+    tcg_gen_xori_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], 0x8000000000000000LL);
+    return true;
+}
+
+TRANS(fadd_s, gen_fff, gen_helper_fadd_s)
+TRANS(fadd_d, gen_fff, gen_helper_fadd_d)
+TRANS(fsub_s, gen_fff, gen_helper_fsub_s)
+TRANS(fsub_d, gen_fff, gen_helper_fsub_d)
+TRANS(fmul_s, gen_fff, gen_helper_fmul_s)
+TRANS(fmul_d, gen_fff, gen_helper_fmul_d)
+TRANS(fdiv_s, gen_fff, gen_helper_fdiv_s)
+TRANS(fdiv_d, gen_fff, gen_helper_fdiv_d)
+TRANS(fmax_s, gen_fff, gen_helper_fmax_s)
+TRANS(fmax_d, gen_fff, gen_helper_fmax_d)
+TRANS(fmin_s, gen_fff, gen_helper_fmin_s)
+TRANS(fmin_d, gen_fff, gen_helper_fmin_d)
+TRANS(fmaxa_s, gen_fff, gen_helper_fmaxa_s)
+TRANS(fmaxa_d, gen_fff, gen_helper_fmaxa_d)
+TRANS(fmina_s, gen_fff, gen_helper_fmina_s)
+TRANS(fmina_d, gen_fff, gen_helper_fmina_d)
+TRANS(fscaleb_s, gen_fff, gen_helper_fscaleb_s)
+TRANS(fscaleb_d, gen_fff, gen_helper_fscaleb_d)
+TRANS(fsqrt_s, gen_ff, gen_helper_fsqrt_s)
+TRANS(fsqrt_d, gen_ff, gen_helper_fsqrt_d)
+TRANS(frecip_s, gen_ff, gen_helper_frecip_s)
+TRANS(frecip_d, gen_ff, gen_helper_frecip_d)
+TRANS(frsqrt_s, gen_ff, gen_helper_frsqrt_s)
+TRANS(frsqrt_d, gen_ff, gen_helper_frsqrt_d)
+TRANS(flogb_s, gen_ff, gen_helper_flogb_s)
+TRANS(flogb_d, gen_ff, gen_helper_flogb_d)
+TRANS(fclass_s, gen_ff, gen_helper_fclass_s)
+TRANS(fclass_d, gen_ff, gen_helper_fclass_d)
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
index 98774dbddb..6455e09ebe 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -23,6 +23,9 @@
 &hint_r_i     hint rj imm
 &rrr_sa       rd rj rk sa
 &rr_ms_ls     rd rj ms ls
+&ff           fd fj
+&fff          fd fj fk
+&ffff         fd fj fk fa
 
 #
 # Formats
@@ -44,6 +47,9 @@
 @rrr_sa3         .... ........ .. sa:3 rk:5 rj:5 rd:5    &rrr_sa
 @rr_2bw            .... ....... ms:5 . ls:5 rj:5 rd:5    &rr_ms_ls
 @rr_2bd               .... ...... ms:6 ls:6 rj:5 rd:5    &rr_ms_ls
+@ff               .... ........ ..... ..... fj:5 fd:5    &ff
+@fff               .... ........ ..... fk:5 fj:5 fd:5    &fff
+@ffff               .... ........ fa:5 fk:5 fj:5 fd:5    &ffff
 
 #
 # Fixed point arithmetic operation instruction
@@ -256,3 +262,49 @@ syscall         0000 00000010 10110 ...............      @i15
 asrtle_d        0000 00000000 00010 ..... ..... 00000    @rr_jk
 asrtgt_d        0000 00000000 00011 ..... ..... 00000    @rr_jk
 cpucfg          0000 00000000 00000 11011 ..... .....    @rr
+
+#
+# Floating point arithmetic operation instruction
+#
+fadd_s          0000 00010000 00001 ..... ..... .....    @fff
+fadd_d          0000 00010000 00010 ..... ..... .....    @fff
+fsub_s          0000 00010000 00101 ..... ..... .....    @fff
+fsub_d          0000 00010000 00110 ..... ..... .....    @fff
+fmul_s          0000 00010000 01001 ..... ..... .....    @fff
+fmul_d          0000 00010000 01010 ..... ..... .....    @fff
+fdiv_s          0000 00010000 01101 ..... ..... .....    @fff
+fdiv_d          0000 00010000 01110 ..... ..... .....    @fff
+fmadd_s         0000 10000001 ..... ..... ..... .....    @ffff
+fmadd_d         0000 10000010 ..... ..... ..... .....    @ffff
+fmsub_s         0000 10000101 ..... ..... ..... .....    @ffff
+fmsub_d         0000 10000110 ..... ..... ..... .....    @ffff
+fnmadd_s        0000 10001001 ..... ..... ..... .....    @ffff
+fnmadd_d        0000 10001010 ..... ..... ..... .....    @ffff
+fnmsub_s        0000 10001101 ..... ..... ..... .....    @ffff
+fnmsub_d        0000 10001110 ..... ..... ..... .....    @ffff
+fmax_s          0000 00010000 10001 ..... ..... .....    @fff
+fmax_d          0000 00010000 10010 ..... ..... .....    @fff
+fmin_s          0000 00010000 10101 ..... ..... .....    @fff
+fmin_d          0000 00010000 10110 ..... ..... .....    @fff
+fmaxa_s         0000 00010000 11001 ..... ..... .....    @fff
+fmaxa_d         0000 00010000 11010 ..... ..... .....    @fff
+fmina_s         0000 00010000 11101 ..... ..... .....    @fff
+fmina_d         0000 00010000 11110 ..... ..... .....    @fff
+fabs_s          0000 00010001 01000 00001 ..... .....    @ff
+fabs_d          0000 00010001 01000 00010 ..... .....    @ff
+fneg_s          0000 00010001 01000 00101 ..... .....    @ff
+fneg_d          0000 00010001 01000 00110 ..... .....    @ff
+fsqrt_s         0000 00010001 01000 10001 ..... .....    @ff
+fsqrt_d         0000 00010001 01000 10010 ..... .....    @ff
+frecip_s        0000 00010001 01000 10101 ..... .....    @ff
+frecip_d        0000 00010001 01000 10110 ..... .....    @ff
+frsqrt_s        0000 00010001 01000 11001 ..... .....    @ff
+frsqrt_d        0000 00010001 01000 11010 ..... .....    @ff
+fscaleb_s       0000 00010001 00001 ..... ..... .....    @fff
+fscaleb_d       0000 00010001 00010 ..... ..... .....    @fff
+flogb_s         0000 00010001 01000 01001 ..... .....    @ff
+flogb_d         0000 00010001 01000 01010 ..... .....    @ff
+fcopysign_s     0000 00010001 00101 ..... ..... .....    @fff
+fcopysign_d     0000 00010001 00110 ..... ..... .....    @fff
+fclass_s        0000 00010001 01000 01101 ..... .....    @ff
+fclass_d        0000 00010001 01000 01110 ..... .....    @ff
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 9f02287a90..43b865ec21 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -18,4 +18,6 @@ void G_NORETURN do_raise_exception(CPULoongArchState *env,
 
 const char *loongarch_exception_name(int32_t exception);
 
+void restore_fp_status(CPULoongArchState *env);
+
 #endif
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 5baeb74afa..ecbaed29bf 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -15,6 +15,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
+#include "fpu/softfloat.h"
 #include "translate.h"
 #include "internals.h"
 
@@ -36,6 +37,15 @@ static inline int shl_2(DisasContext *ctx, int x)
     return x << 2;
 }
 
+/*
+ * LoongArch the upper 32 bits are undefined ("can be any value").
+ * QEMU chooses to nanbox, because it is most likely to show guest bugs early.
+ */
+static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
+{
+    tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
+}
+
 void generate_exception(DisasContext *ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
@@ -156,6 +166,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_memory.c.inc"
 #include "insn_trans/trans_atomic.c.inc"
 #include "insn_trans/trans_extra.c.inc"
+#include "insn_trans/trans_farith.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
2.31.1


