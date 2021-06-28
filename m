Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605F53B5DB8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:11:42 +0200 (CEST)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxq72-0003Af-Re
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq10-0002pS-CB
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45580 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq0p-0001DN-Nv
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:26 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S16; 
 Mon, 28 Jun 2021 20:05:01 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/20] target/loongarch: Add floating point comparison
 instruction translation
Date: Mon, 28 Jun 2021 20:04:39 +0800
Message-Id: <1624881885-31692-15-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S16
X-Coremail-Antispam: 1UD129KBjvdXoW5tr4fXF1xWryfZF15Zry7p5X_Gw15twc_ZF
 43XFyUGrs5CFWYga9Fqa4vy343KryDuF4YgFyFq39rCr4UG3yIqr1ktas3uw4UX34rJrWj
 kF1a9w1vv3WYvjkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
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

This patch implement floating point comparison instruction translation.

This includes:
- FCMP.cond.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/fpu_helper.c | 613 ++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/helper.h     |  49 ++++
 target/loongarch/insns.decode |  10 +
 target/loongarch/trans.inc.c  |  15 ++
 target/loongarch/translate.c  |  90 +++++++
 5 files changed, 777 insertions(+)

diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index d085bb0..2c85113 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -379,3 +379,616 @@ uint64_t helper_fp_logb_d(CPULoongArchState *env, uint64_t fp)
     update_fcsr0(env, GETPC());
     return fp1;
 }
+
+void helper_movreg2cf_i32(CPULoongArchState *env, uint32_t cd, uint32_t src)
+{
+    env->active_fpu.cf[cd & 0x7] = src & 0x1;
+}
+
+void helper_movreg2cf_i64(CPULoongArchState *env, uint32_t cd, uint64_t src)
+{
+    env->active_fpu.cf[cd & 0x7] = src & 0x1;
+}
+
+/* fcmp.cond.s */
+uint32_t helper_fp_cmp_caf_s(CPULoongArchState *env, uint32_t fp,
+                             uint32_t fp1)
+{
+    uint64_t ret;
+    ret = (float32_unordered_quiet(fp1, fp, &env->active_fpu.fp_status), 0);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_cun_s(CPULoongArchState *env, uint32_t fp,
+                             uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_unordered_quiet(fp1, fp, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_ceq_s(CPULoongArchState *env, uint32_t fp,
+                             uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_eq_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_cueq_s(CPULoongArchState *env, uint32_t fp,
+                              uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_unordered_quiet(fp1, fp, &env->active_fpu.fp_status) ||
+          float32_eq_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_clt_s(CPULoongArchState *env, uint32_t fp,
+                             uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_lt_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_cult_s(CPULoongArchState *env, uint32_t fp,
+                              uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_unordered_quiet(fp1, fp, &env->active_fpu.fp_status) ||
+          float32_lt_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_cle_s(CPULoongArchState *env, uint32_t fp,
+                             uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_le_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_cule_s(CPULoongArchState *env, uint32_t fp,
+                              uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_unordered_quiet(fp1, fp, &env->active_fpu.fp_status) ||
+          float32_le_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_cne_s(CPULoongArchState *env, uint32_t fp,
+                             uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_lt_quiet(fp1, fp, &env->active_fpu.fp_status) ||
+          float32_lt_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_cor_s(CPULoongArchState *env, uint32_t fp,
+                             uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_le_quiet(fp1, fp, &env->active_fpu.fp_status) ||
+          float32_le_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_cune_s(CPULoongArchState *env, uint32_t fp,
+                              uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_unordered_quiet(fp1, fp, &env->active_fpu.fp_status) ||
+          float32_lt_quiet(fp1, fp, &env->active_fpu.fp_status) ||
+          float32_lt_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+
+uint32_t helper_fp_cmp_saf_s(CPULoongArchState *env, uint32_t fp,
+                             uint32_t fp1)
+{
+    uint64_t ret;
+    ret = (float32_unordered(fp1, fp, &env->active_fpu.fp_status), 0);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_sun_s(CPULoongArchState *env, uint32_t fp,
+                             uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_unordered(fp1, fp, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_seq_s(CPULoongArchState *env, uint32_t fp,
+                             uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_eq(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_sueq_s(CPULoongArchState *env, uint32_t fp,
+                              uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_unordered(fp1, fp, &env->active_fpu.fp_status) ||
+          float32_eq(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_slt_s(CPULoongArchState *env, uint32_t fp,
+                             uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_lt(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_sult_s(CPULoongArchState *env, uint32_t fp,
+                              uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_unordered(fp1, fp, &env->active_fpu.fp_status) ||
+          float32_lt(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_sle_s(CPULoongArchState *env, uint32_t fp,
+                             uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_le(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_sule_s(CPULoongArchState *env, uint32_t fp,
+                              uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_unordered(fp1, fp, &env->active_fpu.fp_status) ||
+          float32_le(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_sne_s(CPULoongArchState *env, uint32_t fp,
+                             uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_lt(fp1, fp, &env->active_fpu.fp_status) ||
+          float32_lt(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_sor_s(CPULoongArchState *env, uint32_t fp,
+                             uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_le(fp1, fp, &env->active_fpu.fp_status) ||
+          float32_le(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint32_t helper_fp_cmp_sune_s(CPULoongArchState *env, uint32_t fp,
+                              uint32_t fp1)
+{
+    uint64_t ret;
+    ret = float32_unordered(fp1, fp, &env->active_fpu.fp_status) ||
+          float32_lt(fp1, fp, &env->active_fpu.fp_status) ||
+          float32_lt(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+/* fcmp.cond.d */
+uint64_t helper_fp_cmp_caf_d(CPULoongArchState *env, uint64_t fp,
+                             uint64_t fp1)
+{
+    uint64_t ret;
+    ret = (float64_unordered_quiet(fp1, fp, &env->active_fpu.fp_status), 0);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_cun_d(CPULoongArchState *env, uint64_t fp,
+                             uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_unordered_quiet(fp1, fp, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_ceq_d(CPULoongArchState *env, uint64_t fp,
+                             uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_eq_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_cueq_d(CPULoongArchState *env, uint64_t fp,
+                              uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_unordered_quiet(fp1, fp, &env->active_fpu.fp_status) ||
+          float64_eq_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_clt_d(CPULoongArchState *env, uint64_t fp,
+                              uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_lt_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_cult_d(CPULoongArchState *env, uint64_t fp,
+                              uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_unordered_quiet(fp1, fp, &env->active_fpu.fp_status) ||
+          float64_lt_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_cle_d(CPULoongArchState *env, uint64_t fp,
+                             uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_le_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_cule_d(CPULoongArchState *env, uint64_t fp,
+                              uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_unordered_quiet(fp1, fp, &env->active_fpu.fp_status) ||
+          float64_le_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_cne_d(CPULoongArchState *env, uint64_t fp,
+                             uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_lt_quiet(fp1, fp, &env->active_fpu.fp_status) ||
+          float64_lt_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_cor_d(CPULoongArchState *env, uint64_t fp,
+                             uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_le_quiet(fp1, fp, &env->active_fpu.fp_status) ||
+          float64_le_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_cune_d(CPULoongArchState *env, uint64_t fp,
+                              uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_unordered_quiet(fp1, fp, &env->active_fpu.fp_status) ||
+          float64_lt_quiet(fp1, fp, &env->active_fpu.fp_status) ||
+          float64_lt_quiet(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_saf_d(CPULoongArchState *env, uint64_t fp,
+                             uint64_t fp1)
+{
+    uint64_t ret;
+    ret = (float64_unordered(fp1, fp, &env->active_fpu.fp_status), 0);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_sun_d(CPULoongArchState *env, uint64_t fp,
+                             uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_unordered(fp1, fp, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_seq_d(CPULoongArchState *env, uint64_t fp,
+                             uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_eq(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_sueq_d(CPULoongArchState *env, uint64_t fp,
+                              uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_unordered(fp1, fp, &env->active_fpu.fp_status) ||
+          float64_eq(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_slt_d(CPULoongArchState *env, uint64_t fp,
+                             uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_lt(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_sult_d(CPULoongArchState *env, uint64_t fp,
+                              uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_unordered(fp1, fp, &env->active_fpu.fp_status) ||
+          float64_lt(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_sle_d(CPULoongArchState *env, uint64_t fp,
+                             uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_le(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_sule_d(CPULoongArchState *env, uint64_t fp,
+                              uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_unordered(fp1, fp, &env->active_fpu.fp_status) ||
+          float64_le(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_sne_d(CPULoongArchState *env, uint64_t fp,
+                             uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_lt(fp1, fp, &env->active_fpu.fp_status) ||
+          float64_lt(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_sor_d(CPULoongArchState *env, uint64_t fp,
+                             uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_le(fp1, fp, &env->active_fpu.fp_status) ||
+          float64_le(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+uint64_t helper_fp_cmp_sune_d(CPULoongArchState *env, uint64_t fp,
+                              uint64_t fp1)
+{
+    uint64_t ret;
+    ret = float64_unordered(fp1, fp, &env->active_fpu.fp_status) ||
+          float64_lt(fp1, fp, &env->active_fpu.fp_status) ||
+          float64_lt(fp, fp1, &env->active_fpu.fp_status);
+    update_fcsr0(env, GETPC());
+    if (ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index e945177..b1a81c5 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -72,3 +72,52 @@ DEF_HELPER_2(fp_recip_d, i64, env, i64)
 
 DEF_HELPER_FLAGS_2(fp_class_s, TCG_CALL_NO_RWG_SE, i32, env, i32)
 DEF_HELPER_FLAGS_2(fp_class_d, TCG_CALL_NO_RWG_SE, i64, env, i64)
+
+/* fcmp.cond.s/d */
+DEF_HELPER_3(fp_cmp_caf_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_caf_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_cun_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_cun_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_ceq_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_ceq_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_cueq_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_cueq_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_clt_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_clt_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_cult_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_cult_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_cle_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_cle_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_cule_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_cule_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_cne_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_cne_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_cor_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_cor_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_cune_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_cune_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_saf_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_saf_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_sun_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_sun_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_seq_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_seq_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_sueq_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_sueq_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_slt_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_slt_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_sult_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_sult_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_sle_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_sle_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_sule_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_sule_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_sne_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_sne_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_sor_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_sor_s, i32, env, i32, i32)
+DEF_HELPER_3(fp_cmp_sune_d, i64, env, i64, i64)
+DEF_HELPER_3(fp_cmp_sune_s, i32, env, i32, i32)
+
+DEF_HELPER_3(movreg2cf_i32, void, env, i32, i32)
+DEF_HELPER_3(movreg2cf_i64, void, env, i32, i64)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 8730725..7bf4f0f 100644
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
@@ -57,6 +59,7 @@
 &fmt_fdfjfk         fd fj fk
 &fmt_fdfjfkfa       fd fj fk fa
 &fmt_fdfj           fd fj
+&fmt_cdfjfkfcond    cd fj fk fcond
 
 #
 # Formats
@@ -82,6 +85,7 @@
 @fmt_fdfjfk          .... ........ ..... ..... ..... .....    &fmt_fdfjfk         %fd %fj %fk
 @fmt_fdfjfkfa        .... ........ ..... ..... ..... .....    &fmt_fdfjfkfa       %fd %fj %fk %fa
 @fmt_fdfj            .... ........ ..... ..... ..... .....    &fmt_fdfj           %fd %fj
+@fmt_cdfjfkfcond     .... ........ ..... ..... ..... .. ...   &fmt_cdfjfkfcond    %cd %fj %fk %fcond
 
 #
 # Fixed point arithmetic operation instruction
@@ -344,3 +348,9 @@ fcopysign_s      0000 00010001 00101 ..... ..... .....    @fmt_fdfjfk
 fcopysign_d      0000 00010001 00110 ..... ..... .....    @fmt_fdfjfk
 fclass_s         0000 00010001 01000 01101 ..... .....    @fmt_fdfj
 fclass_d         0000 00010001 01000 01110 ..... .....    @fmt_fdfj
+
+#
+# Floating point compare instruction
+#
+fcmp_cond_s      0000 11000001 ..... ..... ..... 00 ...   @fmt_cdfjfkfcond
+fcmp_cond_d      0000 11000010 ..... ..... ..... 00 ...   @fmt_cdfjfkfcond
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index cd82155..fab2805 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -1871,3 +1871,18 @@ static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
     gen_loongarch_fp_arith(ctx, LA_OPC_FCLASS_D, 0, a->fj, a->fd);
     return true;
 }
+
+/* Floating point compare instruction translation */
+static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
+{
+    check_fpu_enabled(ctx);
+    gen_loongarch_fp_cmp_s(ctx, a->fcond, a->fk, a->fj, a->cd);
+    return true;
+}
+
+static bool trans_fcmp_cond_d(DisasContext *ctx, arg_fcmp_cond_d *a)
+{
+    check_fpu_enabled(ctx);
+    gen_loongarch_fp_cmp_d(ctx, a->fcond, a->fk, a->fj, a->cd);
+    return true;
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 82b255e..4e7b687 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -1679,6 +1679,96 @@ static void gen_loongarch_fp_arith(DisasContext *ctx, uint32_t opc,
     }
 }
 
+#define FP_CMP(fmt, bits, STORE)                                              \
+static inline void gen_loongarch_fp_cmp_ ## fmt(DisasContext *ctx, int fcond, \
+                                                int fk, int fj, int cd)       \
+{                                                                             \
+    TCGv_i ## bits fp0 = tcg_temp_new_i ## bits();                            \
+    TCGv_i ## bits fp1 = tcg_temp_new_i ## bits();                            \
+    TCGv_i32 fcc = tcg_const_i32(cd);                                         \
+    check_fpu_enabled(ctx);                                                   \
+    gen_load_fpr ## bits(ctx, fp0, fj);                                       \
+    gen_load_fpr ## bits(ctx, fp1, fk);                                       \
+    switch (fcond) {                                                          \
+    case  0:                                                                  \
+        gen_helper_fp_cmp_caf_ ## fmt(fp0, cpu_env, fp0, fp1);                \
+        break;                                                                \
+    case  1:                                                                  \
+        gen_helper_fp_cmp_saf_ ## fmt(fp0, cpu_env, fp0, fp1);                \
+        break;                                                                \
+    case  2:                                                                  \
+        gen_helper_fp_cmp_clt_ ## fmt(fp0, cpu_env, fp0, fp1);                \
+        break;                                                                \
+    case  3:                                                                  \
+        gen_helper_fp_cmp_slt_ ## fmt(fp0, cpu_env, fp0, fp1);                \
+        break;                                                                \
+    case  4:                                                                  \
+        gen_helper_fp_cmp_ceq_ ## fmt(fp0, cpu_env, fp0, fp1);                \
+        break;                                                                \
+    case  5:                                                                  \
+        gen_helper_fp_cmp_seq_ ## fmt(fp0, cpu_env, fp0, fp1);                \
+        break;                                                                \
+    case  6:                                                                  \
+        gen_helper_fp_cmp_cle_ ## fmt(fp0, cpu_env, fp0, fp1);                \
+        break;                                                                \
+    case  7:                                                                  \
+        gen_helper_fp_cmp_sle_ ## fmt(fp0, cpu_env, fp0, fp1);                \
+        break;                                                                \
+    case  8:                                                                  \
+        gen_helper_fp_cmp_cun_ ## fmt(fp0, cpu_env, fp0, fp1);                \
+        break;                                                                \
+    case  9:                                                                  \
+        gen_helper_fp_cmp_sun_ ## fmt(fp0, cpu_env, fp0, fp1);                \
+        break;                                                                \
+    case 10:                                                                  \
+        gen_helper_fp_cmp_cult_ ## fmt(fp0, cpu_env, fp0, fp1);               \
+        break;                                                                \
+    case 11:                                                                  \
+        gen_helper_fp_cmp_sult_ ## fmt(fp0, cpu_env, fp0, fp1);               \
+        break;                                                                \
+    case 12:                                                                  \
+        gen_helper_fp_cmp_cueq_ ## fmt(fp0, cpu_env, fp0, fp1);               \
+        break;                                                                \
+    case 13:                                                                  \
+        gen_helper_fp_cmp_sueq_ ## fmt(fp0, cpu_env, fp0, fp1);               \
+        break;                                                                \
+    case 14:                                                                  \
+        gen_helper_fp_cmp_cule_ ## fmt(fp0, cpu_env, fp0, fp1);               \
+        break;                                                                \
+    case 15:                                                                  \
+        gen_helper_fp_cmp_sule_ ## fmt(fp0, cpu_env, fp0, fp1);               \
+        break;                                                                \
+    case 16:                                                                  \
+        gen_helper_fp_cmp_cne_ ## fmt(fp0, cpu_env, fp0, fp1);                \
+        break;                                                                \
+    case 17:                                                                  \
+        gen_helper_fp_cmp_sne_ ## fmt(fp0, cpu_env, fp0, fp1);                \
+        break;                                                                \
+    case 20:                                                                  \
+        gen_helper_fp_cmp_cor_ ## fmt(fp0, cpu_env, fp0, fp1);                \
+        break;                                                                \
+    case 21:                                                                  \
+        gen_helper_fp_cmp_sor_ ## fmt(fp0, cpu_env, fp0, fp1);                \
+        break;                                                                \
+    case 24:                                                                  \
+        gen_helper_fp_cmp_cune_ ## fmt(fp0, cpu_env, fp0, fp1);               \
+        break;                                                                \
+    case 25:                                                                  \
+        gen_helper_fp_cmp_sune_ ## fmt(fp0, cpu_env, fp0, fp1);               \
+        break;                                                                \
+    default:                                                                  \
+        abort();                                                              \
+    }                                                                         \
+    STORE;                                                                    \
+    tcg_temp_free_i ## bits(fp0);                                             \
+    tcg_temp_free_i ## bits(fp1);                                             \
+    tcg_temp_free_i32(fcc);                                                   \
+}
+
+FP_CMP(d, 64, gen_helper_movreg2cf_i64(cpu_env, fcc, fp0))
+FP_CMP(s, 32, gen_helper_movreg2cf_i32(cpu_env, fcc, fp0))
+#undef FP_CMP
+
 static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
 {
 }
-- 
1.8.3.1


