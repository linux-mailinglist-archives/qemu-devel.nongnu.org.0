Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B95146C9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 12:30:50 +0200 (CEST)
Received: from localhost ([::1]:51622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkNth-0003Y6-LD
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 06:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nkNXd-0007yb-Ka
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:08:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46046 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nkNXZ-0002zt-QW
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:08:01 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9vhuGtiZicDAA--.14518S13; 
 Fri, 29 Apr 2022 18:07:42 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/43] target/loongarch: Add floating point comparison
 instruction translation
Date: Fri, 29 Apr 2022 18:06:57 +0800
Message-Id: <20220429100729.1572481-12-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9vhuGtiZicDAA--.14518S13
X-Coremail-Antispam: 1UD129KBjvJXoW3XryUCr4kKF1DXr17JF17trb_yoWxtrWfpF
 W7Ary3KF48WFWfA3Z2va98GF1DWr48Ka129a4ft34kAF45XFn7ZryktasF9FWUG34kZryx
 X3Waya4UWa47XaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
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
- FCMP.cond.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/fpu_helper.c                | 60 ++++++++++++++++++++
 target/loongarch/helper.h                    |  9 +++
 target/loongarch/insn_trans/trans_fcmp.c.inc | 56 ++++++++++++++++++
 target/loongarch/insns.decode                |  8 +++
 target/loongarch/internals.h                 |  5 ++
 target/loongarch/translate.c                 |  1 +
 6 files changed, 139 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_fcmp.c.inc

diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index e875638e1d..2ad707007a 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -401,3 +401,63 @@ uint64_t helper_fmuladd_d(CPULoongArchState *env, uint64_t fj,
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
index 840bad9b2f..25a891bf8b 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -52,3 +52,12 @@ DEF_HELPER_FLAGS_2(frecip_d, TCG_CALL_NO_WG, i64, env, i64)
 
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
diff --git a/target/loongarch/insn_trans/trans_fcmp.c.inc b/target/loongarch/insn_trans/trans_fcmp.c.inc
new file mode 100644
index 0000000000..93a6a2230f
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_fcmp.c.inc
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
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
+    tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd]));
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
+    tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd]));
+
+    tcg_temp_free(var);
+    return true;
+}
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 6455e09ebe..d7ed80b0b9 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -26,6 +26,7 @@
 &ff           fd fj
 &fff          fd fj fk
 &ffff         fd fj fk fa
+&cff_fcond    cd fj fk fcond
 
 #
 # Formats
@@ -50,6 +51,7 @@
 @ff               .... ........ ..... ..... fj:5 fd:5    &ff
 @fff               .... ........ ..... fk:5 fj:5 fd:5    &fff
 @ffff               .... ........ fa:5 fk:5 fj:5 fd:5    &ffff
+@cff_fcond    .... ........ fcond:5 fk:5 fj:5 .. cd:3    &cff_fcond
 
 #
 # Fixed point arithmetic operation instruction
@@ -308,3 +310,9 @@ fcopysign_s     0000 00010001 00101 ..... ..... .....    @fff
 fcopysign_d     0000 00010001 00110 ..... ..... .....    @fff
 fclass_s        0000 00010001 01000 01101 ..... .....    @ff
 fclass_d        0000 00010001 01000 01110 ..... .....    @ff
+
+#
+# Floating point compare instruction
+#
+fcmp_cond_s     0000 11000001 ..... ..... ..... 00 ...   @cff_fcond
+fcmp_cond_d     0000 11000010 ..... ..... ..... 00 ...   @cff_fcond
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 43b865ec21..1a3b39e0be 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -8,6 +8,11 @@
 #ifndef LOONGARCH_INTERNALS_H
 #define LOONGARCH_INTERNALS_H
 
+#define FCMP_LT   0b0001  /* fp0 < fp1 */
+#define FCMP_EQ   0b0010  /* fp0 = fp1 */
+#define FCMP_UN   0b0100  /* unordered */
+#define FCMP_GT   0b1000  /* fp0 > fp1 */
+
 void loongarch_translate_init(void);
 
 void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index ecbaed29bf..59357bb369 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -167,6 +167,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_atomic.c.inc"
 #include "insn_trans/trans_extra.c.inc"
 #include "insn_trans/trans_farith.c.inc"
+#include "insn_trans/trans_fcmp.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
2.31.1


