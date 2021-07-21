Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA063D0BB1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:05:57 +0200 (CEST)
Received: from localhost ([::1]:35116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m696y-0003qp-4l
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m68vI-0003I0-5b
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49716 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m68vD-0002CW-F3
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:51 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0CO7vdg5VEiAA--.21107S16; 
 Wed, 21 Jul 2021 17:53:34 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/22] target/loongarch: Add floating point comparison
 instruction translation
Date: Wed, 21 Jul 2021 17:53:10 +0800
Message-Id: <1626861198-6133-15-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0CO7vdg5VEiAA--.21107S16
X-Coremail-Antispam: 1UD129KBjvAXoWfuw47JFyfJFyUCw45Cr47CFg_yoW8Kr1UGo
 W3CFy5Zr18G3yxur9Y93Z0vwsFqFykXw1fCr9Y9rZ0g3WxGr1jgFW5J34DZayfGr1FqrWU
 urn7Aas3twsIvr9rn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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

This patch implement floating point comparison instruction translation.

This includes:
- FCMP.cond.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/fpu_helper.c | 613 ++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/helper.h     |  49 ++++
 target/loongarch/insns.decode |  10 +
 target/loongarch/trans.inc.c  | 184 +++++++++++++
 4 files changed, 856 insertions(+)

diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index 399a98b..0b6a07e 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -378,3 +378,616 @@ uint64_t helper_fp_logb_d(CPULoongArchState *env, uint64_t fp)
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
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index 786d2a6..a4efc05 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -4125,3 +4125,187 @@ static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
 
     return true;
 }
+
+/* Floating point compare instruction translation */
+static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
+{
+    TCGv_i32 fp0, fp1, fcc;
+
+    fp0 = tcg_temp_new_i32();
+    fp1 = tcg_temp_new_i32();
+    fcc = tcg_const_i32(a->cd);
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr32(fp0, a->fj);
+    gen_load_fpr32(fp1, a->fk);
+
+    switch (a->fcond) {
+    case  0:
+        gen_helper_fp_cmp_caf_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case  1:
+        gen_helper_fp_cmp_saf_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case  2:
+        gen_helper_fp_cmp_clt_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case  3:
+        gen_helper_fp_cmp_slt_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case  4:
+        gen_helper_fp_cmp_ceq_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case  5:
+        gen_helper_fp_cmp_seq_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case  6:
+        gen_helper_fp_cmp_cle_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case  7:
+        gen_helper_fp_cmp_sle_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case  8:
+        gen_helper_fp_cmp_cun_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case  9:
+        gen_helper_fp_cmp_sun_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case 10:
+        gen_helper_fp_cmp_cult_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case 11:
+        gen_helper_fp_cmp_sult_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case 12:
+        gen_helper_fp_cmp_cueq_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case 13:
+        gen_helper_fp_cmp_sueq_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case 14:
+        gen_helper_fp_cmp_cule_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case 15:
+        gen_helper_fp_cmp_sule_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case 16:
+        gen_helper_fp_cmp_cne_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case 17:
+        gen_helper_fp_cmp_sne_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case 20:
+        gen_helper_fp_cmp_cor_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case 21:
+        gen_helper_fp_cmp_sor_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case 24:
+        gen_helper_fp_cmp_cune_s(fp0, cpu_env, fp0, fp1);
+        break;
+    case 25:
+        gen_helper_fp_cmp_sune_s(fp0, cpu_env, fp0, fp1);
+        break;
+    default:
+        abort();
+    }
+    gen_helper_movreg2cf_i32(cpu_env, fcc, fp0);
+
+    tcg_temp_free_i32(fp0);
+    tcg_temp_free_i32(fp1);
+    tcg_temp_free_i32(fcc);
+
+    return true;
+}
+
+static bool trans_fcmp_cond_d(DisasContext *ctx, arg_fcmp_cond_d *a)
+{
+    TCGv_i64 fp0, fp1;
+    TCGv_i32 fcc;
+
+    fp0 = tcg_temp_new_i64();
+    fp1 = tcg_temp_new_i64();
+    fcc = tcg_const_i32(a->cd);
+
+    gen_load_fpr64(fp0, a->fj);
+    gen_load_fpr64(fp1, a->fk);
+
+    check_fpu_enabled(ctx);
+    switch (a->fcond) {
+    case  0:
+        gen_helper_fp_cmp_caf_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case  1:
+        gen_helper_fp_cmp_saf_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case  2:
+        gen_helper_fp_cmp_clt_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case  3:
+        gen_helper_fp_cmp_slt_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case  4:
+        gen_helper_fp_cmp_ceq_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case  5:
+        gen_helper_fp_cmp_seq_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case  6:
+        gen_helper_fp_cmp_cle_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case  7:
+        gen_helper_fp_cmp_sle_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case  8:
+        gen_helper_fp_cmp_cun_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case  9:
+        gen_helper_fp_cmp_sun_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case 10:
+        gen_helper_fp_cmp_cult_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case 11:
+        gen_helper_fp_cmp_sult_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case 12:
+        gen_helper_fp_cmp_cueq_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case 13:
+        gen_helper_fp_cmp_sueq_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case 14:
+        gen_helper_fp_cmp_cule_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case 15:
+        gen_helper_fp_cmp_sule_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case 16:
+        gen_helper_fp_cmp_cne_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case 17:
+        gen_helper_fp_cmp_sne_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case 20:
+        gen_helper_fp_cmp_cor_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case 21:
+        gen_helper_fp_cmp_sor_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case 24:
+        gen_helper_fp_cmp_cune_d(fp0, cpu_env, fp0, fp1);
+        break;
+    case 25:
+        gen_helper_fp_cmp_sune_d(fp0, cpu_env, fp0, fp1);
+        break;
+    default:
+        abort();
+    }
+    gen_helper_movreg2cf_i64(cpu_env, fcc, fp0);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i64(fp1);
+    tcg_temp_free_i32(fcc);
+
+    return true;
+}
-- 
1.8.3.1


