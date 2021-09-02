Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE24A3FEE1D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:53:13 +0200 (CEST)
Received: from localhost ([::1]:56594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmDR-0002bX-0W
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mLm2a-0005qB-V5
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:42:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36288 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mLm2U-00063F-LL
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:42:00 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxYctjxjBha2YCAA--.7003S13; 
 Thu, 02 Sep 2021 20:41:26 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/21] target/loongarch: Add floating point comparison
 instruction translation
Date: Thu,  2 Sep 2021 20:40:57 +0800
Message-Id: <1630586467-22463-12-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9AxYctjxjBha2YCAA--.7003S13
X-Coremail-Antispam: 1UD129KBjvAXoW3Kr4xuryUKFW3Cry5CFyUJrb_yoW8Gw4UCo
 W5Gr15Cr4ft3sxWr90yas0qrsrJ3WxJwsrta90gas0ka4fGr12ka1aq34fAayfWr4I9Fy5
 A39rXa43twsrAr97n29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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

This patch implement floating point comparison instruction translation.

This includes:
- FCMP.cond.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/fpu_helper.c            | 110 ++++++++++++
 target/loongarch/helper.h                |   9 +
 target/loongarch/insn_trans/trans_fcmp.c | 279 +++++++++++++++++++++++++++++++
 target/loongarch/insns.decode            |  10 ++
 target/loongarch/translate.c             |   1 +
 target/loongarch/translate.h             |   5 +
 6 files changed, 414 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_fcmp.c

diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index c3bee57..bad7238 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -436,3 +436,113 @@ uint64_t helper_fmuladd_d(CPULoongArchState *env, uint64_t fj,
     update_fcsr0(env, GETPC());
     return fd;
 }
+
+/* fcmp_cXXX_s */
+uint64_t helper_fcmp_c_s(CPULoongArchState *env, uint64_t fj,
+                         uint64_t fk, uint32_t flags)
+{
+    uint32_t t0, t1;
+    uint64_t cmp = 0;
+    t0 = (uint32_t)fj;
+    t1 = (uint32_t)fk;
+
+    if (flags) {
+        if (flags & FCMP_LT) {
+            cmp |= float32_lt_quiet(t0, t1, &env->fp_status);
+        }
+        if (flags & FCMP_EQ) {
+            cmp |= float32_eq_quiet(t0, t1, &env->fp_status);
+        }
+        if (flags & FCMP_GT) {
+            cmp |= float32_lt_quiet(t1, t0, &env->fp_status);
+        }
+        if (flags & FCMP_UN) {
+            cmp |= float32_unordered_quiet(t1, t0, &env->fp_status);
+        }
+    } else {
+        cmp = (float32_unordered_quiet(t1, t0, &env->fp_status), 0);
+    }
+    update_fcsr0(env, GETPC());
+    return cmp;
+}
+
+/* fcmp_sXXX_s */
+uint64_t helper_fcmp_s_s(CPULoongArchState *env, uint64_t fj,
+                         uint64_t fk, uint32_t flags)
+{
+    uint32_t t0, t1;
+    uint64_t cmp = 0;
+    t0 = (uint32_t)fj;
+    t1 = (uint32_t)fk;
+
+    if (flags) {
+        if (flags & FCMP_LT) {
+            cmp |= float32_lt(t0, t1, &env->fp_status);
+        }
+        if (flags & FCMP_EQ) {
+            cmp |= float32_eq(t0, t1, &env->fp_status);
+        }
+        if (flags & FCMP_GT) {
+            cmp |= float32_lt(t1, t0, &env->fp_status);
+        }
+        if (flags & FCMP_UN) {
+            cmp |= float32_unordered(t1, t0, &env->fp_status);
+        }
+    } else {
+        cmp = (float32_unordered(t1, t0, &env->fp_status), 0);
+    }
+    update_fcsr0(env, GETPC());
+    return cmp;
+}
+
+/* fcmp_cXXX_d */
+uint64_t helper_fcmp_c_d(CPULoongArchState *env, uint64_t fj,
+                         uint64_t fk, uint32_t flags)
+{
+    uint64_t cmp = 0;
+
+    if (flags) {
+        if (flags & FCMP_LT) {
+            cmp |= float64_lt_quiet(fj, fk, &env->fp_status);
+        }
+        if (flags & FCMP_EQ) {
+            cmp |= float64_eq_quiet(fj, fk, &env->fp_status);
+        }
+        if (flags & FCMP_GT) {
+            cmp |= float64_lt_quiet(fk, fj, &env->fp_status);
+        }
+        if (flags & FCMP_UN) {
+            cmp |= float64_unordered_quiet(fk, fj, &env->fp_status);
+        }
+    } else {
+        cmp = (float64_unordered_quiet(fk, fj, &env->fp_status), 0);
+    }
+    update_fcsr0(env, GETPC());
+    return cmp;
+}
+
+/* fcmp_sXXX_d */
+uint64_t helper_fcmp_s_d(CPULoongArchState *env, uint64_t fj,
+                         uint64_t fk, uint32_t flags)
+{
+    uint64_t cmp = 0;
+
+    if (flags) {
+        if (flags & FCMP_LT) {
+            cmp |= float64_lt(fj, fk, &env->fp_status);
+        }
+        if (flags & FCMP_EQ) {
+            cmp |= float64_eq(fj, fk, &env->fp_status);
+        }
+        if (flags & FCMP_GT) {
+            cmp |= float64_lt(fk, fj, &env->fp_status);
+        }
+        if (flags & FCMP_UN) {
+            cmp |= float64_unordered(fk, fj, &env->fp_status);
+        }
+    } else {
+        cmp = (float64_unordered(fk, fj, &env->fp_status), 0);
+    }
+    update_fcsr0(env, GETPC());
+    return cmp;
+}
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 62c262e..5f6e60d 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -60,3 +60,12 @@ DEF_HELPER_2(frecip_d, i64, env, i64)
 
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
index 0000000..e9d7c3b
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_fcmp.c
@@ -0,0 +1,279 @@
+/*
+ * LoongArch translate functions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
+{
+    TCGv var = tcg_temp_new();
+    TCGv_i32 flags = NULL;
+
+    switch (a->fcond) {
+    /* caf */
+    case  0:
+        flags = tcg_constant_i32(0);
+        gen_helper_fcmp_c_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* saf */
+    case 1:
+        flags = tcg_constant_i32(0);
+        gen_helper_fcmp_s_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* clt */
+    case 2:
+        flags = tcg_constant_i32(FCMP_LT);
+        gen_helper_fcmp_c_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* slt */
+    case 3:
+        flags = tcg_constant_i32(FCMP_LT);
+        gen_helper_fcmp_s_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* ceq */
+    case 4:
+        flags = tcg_constant_i32(FCMP_EQ);
+        gen_helper_fcmp_c_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* seq */
+    case 5:
+        flags = tcg_constant_i32(FCMP_EQ);
+        gen_helper_fcmp_s_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* cle */
+    case 6:
+        flags = tcg_constant_i32(FCMP_LT | FCMP_EQ);
+        gen_helper_fcmp_c_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* sle */
+    case 7:
+        flags = tcg_constant_i32(FCMP_LT | FCMP_EQ);
+        gen_helper_fcmp_s_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* cun */
+    case 8:
+        flags = tcg_constant_i32(FCMP_UN);
+        gen_helper_fcmp_c_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* sun */
+    case 9:
+        flags = tcg_constant_i32(FCMP_UN);
+        gen_helper_fcmp_s_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* cult */
+    case 10:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_LT);
+        gen_helper_fcmp_c_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* sult */
+    case 11:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_LT);
+        gen_helper_fcmp_s_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* cueq */
+    case 12:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_EQ);
+        gen_helper_fcmp_c_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* sueq */
+    case 13:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_EQ);
+        gen_helper_fcmp_s_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* cule */
+    case 14:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_LT | FCMP_EQ);
+        gen_helper_fcmp_c_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* sule */
+    case 15:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_LT | FCMP_EQ);
+        gen_helper_fcmp_s_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* cne */
+    case 16:
+        flags = tcg_constant_i32(FCMP_GT | FCMP_LT);
+        gen_helper_fcmp_c_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* sne */
+    case 17:
+        flags = tcg_constant_i32(FCMP_GT | FCMP_LT);
+        gen_helper_fcmp_s_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* cor */
+    case 20:
+        flags = tcg_constant_i32(FCMP_GT | FCMP_LT | FCMP_EQ);
+        gen_helper_fcmp_c_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* sor */
+    case 21:
+        flags = tcg_constant_i32(FCMP_GT | FCMP_LT | FCMP_EQ);
+        gen_helper_fcmp_s_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* cune */
+    case 24:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_GT | FCMP_LT);
+        gen_helper_fcmp_c_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    /* sune */
+    case 25:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_GT | FCMP_LT);
+        gen_helper_fcmp_s_s(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    default:
+        abort();
+    }
+
+    tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
+    tcg_temp_free(var);
+    return true;
+}
+
+static bool trans_fcmp_cond_d(DisasContext *ctx, arg_fcmp_cond_d *a)
+{
+    TCGv var = tcg_temp_new();
+    TCGv_i32 flags = NULL;
+
+    switch (a->fcond) {
+    case 0:
+        flags = tcg_constant_i32(0);
+        gen_helper_fcmp_c_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 1:
+        flags = tcg_constant_i32(0);
+        gen_helper_fcmp_s_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 2:
+        flags = tcg_constant_i32(FCMP_LT);
+        gen_helper_fcmp_c_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 3:
+        flags = tcg_constant_i32(FCMP_LT);
+        gen_helper_fcmp_s_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 4:
+        flags = tcg_constant_i32(FCMP_EQ);
+        gen_helper_fcmp_c_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 5:
+        flags = tcg_constant_i32(FCMP_EQ);
+        gen_helper_fcmp_s_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 6:
+        flags = tcg_constant_i32(FCMP_LT | FCMP_EQ);
+        gen_helper_fcmp_c_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 7:
+        flags = tcg_constant_i32(FCMP_LT | FCMP_EQ);
+        gen_helper_fcmp_s_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 8:
+        flags = tcg_constant_i32(FCMP_UN);
+        gen_helper_fcmp_c_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 9:
+        flags = tcg_constant_i32(FCMP_UN);
+        gen_helper_fcmp_s_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 10:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_LT);
+        gen_helper_fcmp_c_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 11:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_LT);
+        gen_helper_fcmp_s_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 12:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_EQ);
+        gen_helper_fcmp_c_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 13:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_EQ);
+        gen_helper_fcmp_s_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 14:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_LT | FCMP_EQ);
+        gen_helper_fcmp_c_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 15:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_LT | FCMP_EQ);
+        gen_helper_fcmp_s_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 16:
+        flags = tcg_constant_i32(FCMP_GT | FCMP_LT);
+        gen_helper_fcmp_c_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 17:
+        flags = tcg_constant_i32(FCMP_GT | FCMP_LT);
+        gen_helper_fcmp_s_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 20:
+        flags = tcg_constant_i32(FCMP_GT | FCMP_LT | FCMP_EQ);
+        gen_helper_fcmp_c_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 21:
+        flags = tcg_constant_i32(FCMP_GT | FCMP_LT | FCMP_EQ);
+        gen_helper_fcmp_s_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 24:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_GT | FCMP_LT);
+        gen_helper_fcmp_c_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    case 25:
+        flags = tcg_constant_i32(FCMP_UN | FCMP_GT | FCMP_LT);
+        gen_helper_fcmp_s_d(var, cpu_env, cpu_fpr[a->fj],
+                            cpu_fpr[a->fk], flags);
+        break;
+    default:
+        abort();
+    }
+
+    tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
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
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index d3e6f8a..be99fb7 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -206,6 +206,7 @@ static bool gen_f2(DisasContext *ctx, arg_fmt_fdfj *a,
 #include "insn_trans/trans_atomic.c"
 #include "insn_trans/trans_extra.c"
 #include "insn_trans/trans_farith.c"
+#include "insn_trans/trans_fcmp.c"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
index 99ab329..16e570c 100644
--- a/target/loongarch/translate.h
+++ b/target/loongarch/translate.h
@@ -11,6 +11,11 @@
 
 #include "exec/translator.h"
 
+#define FCMP_LT   0x0001  /* fp0 < fp1 */
+#define FCMP_EQ   0x0010  /* fp0 = fp1 */
+#define FCMP_GT   0x0100  /* fp1 < fp0 */
+#define FCMP_UN   0x1000  /* unordered */
+
 #define TRANS(NAME, FUNC, ...) \
     static bool trans_##NAME(DisasContext *ctx, arg_##NAME * a) \
     { return FUNC(ctx, a, __VA_ARGS__); }
-- 
1.8.3.1


