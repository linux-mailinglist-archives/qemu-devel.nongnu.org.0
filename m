Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E3B40AF01
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:35:48 +0200 (CEST)
Received: from localhost ([::1]:58098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8bD-0003OG-JO
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mQ8AB-0000mb-LP
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:07:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59620 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mQ8A8-0003IQ-Jl
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:07:51 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxheXvnEBhNJ0GAA--.21668S13; 
 Tue, 14 Sep 2021 21:01:07 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/21] target/loongarch: Add floating point comparison
 instruction translation
Date: Tue, 14 Sep 2021 21:00:21 +0800
Message-Id: <1631624431-30658-12-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxheXvnEBhNJ0GAA--.21668S13
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4DJF17KFyfurW8XryrJFb_yoW3Jr43pF
 W7Zry3GF48WFWfJas2qay5GF15Jr48Ka17uFy3t34vyF45XFn7ZFy8ta429FWUG3s5ury8
 X3WSyryUWFy7XaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, bmeng.cn@gmail.com,
 alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement floating point comparison instruction translation.

This includes:
- FCMP.cond.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/fpu_helper.c            | 60 ++++++++++++++++++++++++++++++++
 target/loongarch/helper.h                |  9 +++++
 target/loongarch/insn_trans/trans_fcmp.c | 59 +++++++++++++++++++++++++++++++
 target/loongarch/insns.decode            | 10 ++++++
 target/loongarch/internals.h             |  5 +++
 target/loongarch/translate.c             |  1 +
 6 files changed, 144 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_fcmp.c

diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index e7d3454..390bf5c 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -363,3 +363,63 @@ uint64_t helper_fmuladd_d(CPULoongArchState *env, uint64_t fj,
     update_fcsr0(env, GETPC());
     return fd;
 }
+
+static uint64_t fcmp_common(CPULoongArchState *env, FloatRelation cmp,
+                            uint32_t flags)
+{
+    bool ret;
+
+    switch (cmp) {
+    case float_relation_less:
+        ret = (flags & FCMP_LT);
+        break;
+    case float_relation_equal:
+        ret = (flags & FCMP_EQ);
+        break;
+    case float_relation_greater:
+        ret = (flags & FCMP_GT);
+        break;
+    case float_relation_unordered:
+        ret = (flags & FCMP_UN);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    update_fcsr0(env, GETPC());
+
+    return ret;
+}
+
+/* fcmp_cXXX_s */
+uint64_t helper_fcmp_c_s(CPULoongArchState *env, uint64_t fj,
+                         uint64_t fk, uint32_t flags)
+{
+    FloatRelation cmp = float32_compare_quiet((uint32_t)fj,
+                                              (uint32_t)fk, &env->fp_status);
+    return fcmp_common(env, cmp, flags);
+}
+
+/* fcmp_sXXX_s */
+uint64_t helper_fcmp_s_s(CPULoongArchState *env, uint64_t fj,
+                         uint64_t fk, uint32_t flags)
+{
+    FloatRelation cmp = float32_compare((uint32_t)fj,
+                                        (uint32_t)fk, &env->fp_status);
+    return fcmp_common(env, cmp, flags);
+}
+
+/* fcmp_cXXX_d */
+uint64_t helper_fcmp_c_d(CPULoongArchState *env, uint64_t fj,
+                         uint64_t fk, uint32_t flags)
+{
+    FloatRelation cmp = float64_compare_quiet(fj, fk, &env->fp_status);
+    return fcmp_common(env, cmp, flags);
+}
+
+/* fcmp_sXXX_d */
+uint64_t helper_fcmp_s_d(CPULoongArchState *env, uint64_t fj,
+                         uint64_t fk, uint32_t flags)
+{
+    FloatRelation cmp = float64_compare(fj, fk, &env->fp_status);
+    return fcmp_common(env, cmp, flags);
+}
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 25a67fd..91140aa 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -51,3 +51,12 @@ DEF_HELPER_2(frecip_d, i64, env, i64)
 
 DEF_HELPER_FLAGS_2(fclass_s, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(fclass_d, TCG_CALL_NO_RWG_SE, i64, env, i64)
+
+/* fcmp.cXXX.s */
+DEF_HELPER_4(fcmp_c_s, i64, env, i64, i64, i32)
+/* fcmp.sXXX.s */
+DEF_HELPER_4(fcmp_s_s, i64, env, i64, i64, i32)
+/* fcmp.cXXX.d */
+DEF_HELPER_4(fcmp_c_d, i64, env, i64, i64, i32)
+/* fcmp.sXXX.d */
+DEF_HELPER_4(fcmp_s_d, i64, env, i64, i64, i32)
diff --git a/target/loongarch/insn_trans/trans_fcmp.c b/target/loongarch/insn_trans/trans_fcmp.c
new file mode 100644
index 0000000..1c5945b
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_fcmp.c
@@ -0,0 +1,59 @@
+/*
+ * LoongArch translate functions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+/* bit0(signaling/quiet) bit1(lt) bit2(eq) bit3(un) bit4(neq) */
+static uint32_t get_fcmp_flags(int cond)
+{
+    uint32_t flags = 0;
+
+    if (cond & 0x1) {
+        flags |= FCMP_LT;
+    }
+    if (cond & 0x2) {
+        flags |= FCMP_EQ;
+    }
+    if (cond & 0x4) {
+        flags |= FCMP_UN;
+    }
+    if (cond & 0x8) {
+        flags |= FCMP_GT | FCMP_LT;
+    }
+    return flags;
+}
+
+static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
+{
+    TCGv var = tcg_temp_new();
+    uint32_t flags;
+    void (*fn)(TCGv, TCGv_env, TCGv, TCGv, TCGv_i32);
+
+    fn = (a->fcond & 1 ? gen_helper_fcmp_s_s : gen_helper_fcmp_c_s);
+    flags = get_fcmp_flags(a->fcond >> 1);
+
+    fn(var, cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk], tcg_constant_i32(flags));
+
+    tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
+    tcg_temp_free(var);
+    return true;
+}
+
+static bool trans_fcmp_cond_d(DisasContext *ctx, arg_fcmp_cond_d *a)
+{
+    TCGv var = tcg_temp_new();
+    uint32_t flags;
+    void (*fn)(TCGv, TCGv_env, TCGv, TCGv, TCGv_i32);
+    fn = (a->fcond & 1 ? gen_helper_fcmp_s_d : gen_helper_fcmp_c_d);
+    flags = get_fcmp_flags(a->fcond >> 1);
+
+    fn(var, cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk], tcg_constant_i32(flags));
+
+    tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
+
+    tcg_temp_free(var);
+    return true;
+}
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 9e6a727..8aadcfd 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -32,6 +32,8 @@
 %fj      5:5
 %fk      10:5
 %fa      15:5
+%cd      0:3
+%fcond   15:5
 
 #
 # Argument sets
@@ -56,6 +58,7 @@
 &fmt_fdfjfk         fd fj fk
 &fmt_fdfjfkfa       fd fj fk fa
 &fmt_fdfj           fd fj
+&fmt_cdfjfkfcond    cd fj fk fcond
 
 #
 # Formats
@@ -80,6 +83,7 @@
 @fmt_fdfjfk          .... ........ ..... ..... ..... .....    &fmt_fdfjfk         %fd %fj %fk
 @fmt_fdfjfkfa        .... ........ ..... ..... ..... .....    &fmt_fdfjfkfa       %fd %fj %fk %fa
 @fmt_fdfj            .... ........ ..... ..... ..... .....    &fmt_fdfj           %fd %fj
+@fmt_cdfjfkfcond     .... ........ ..... ..... ..... .. ...   &fmt_cdfjfkfcond    %cd %fj %fk %fcond
 
 #
 # Fixed point arithmetic operation instruction
@@ -341,3 +345,9 @@ fcopysign_s      0000 00010001 00101 ..... ..... .....    @fmt_fdfjfk
 fcopysign_d      0000 00010001 00110 ..... ..... .....    @fmt_fdfjfk
 fclass_s         0000 00010001 01000 01101 ..... .....    @fmt_fdfj
 fclass_d         0000 00010001 01000 01110 ..... .....    @fmt_fdfj
+
+#
+# Floating point compare instruction
+#
+fcmp_cond_s      0000 11000001 ..... ..... ..... 00 ...   @fmt_cdfjfkfcond
+fcmp_cond_d      0000 11000010 ..... ..... ..... 00 ...   @fmt_cdfjfkfcond
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 096a4a7..b408aed 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -9,6 +9,11 @@
 #ifndef LOONGARCH_INTERNALS_H
 #define LOONGARCH_INTERNALS_H
 
+#define FCMP_LT   0x0001  /* fp0 < fp1 */
+#define FCMP_EQ   0x0010  /* fp0 = fp1 */
+#define FCMP_UN   0x0100  /* unordered */
+#define FCMP_GT   0x1000  /* fp0 > fp1 */
+
 void loongarch_translate_init(void);
 
 void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 9befe8e..e7abc53 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -187,6 +187,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_atomic.c"
 #include "insn_trans/trans_extra.c"
 #include "insn_trans/trans_farith.c"
+#include "insn_trans/trans_fcmp.c"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1


