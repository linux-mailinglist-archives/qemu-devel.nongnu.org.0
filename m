Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF13E65594F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:33:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zj8-0006Pq-LC; Sat, 24 Dec 2022 03:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zi5-00068F-O5
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:03 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zhy-0000Jh-KQ
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:16:49 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Axz+tktaZjEEkIAA--.18545S3;
 Sat, 24 Dec 2022 16:16:36 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S7; 
 Sat, 24 Dec 2022 16:16:35 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 05/43] target/loongarch: Implement vadd/vsub
Date: Sat, 24 Dec 2022 16:15:55 +0800
Message-Id: <20221224081633.4185445-6-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S7
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKrWUZr17CryUAF13AFy7Jrb_yoWxArWfpw
 17trW7Kr48GFZ7X3Zavw13Zw1YqrsFkw17uw1fJw18Z3y7JF9rXr1Fq3y29FW7C3ykuFy0
 9a43C34UKFZ8Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch includes:
- VADD.{B/H/W/D/Q};
- VSUB.{B/H/W/D/Q}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 23 ++++++
 target/loongarch/helper.h                   | 12 +++
 target/loongarch/insn_trans/trans_lsx.c.inc | 23 ++++++
 target/loongarch/insns.decode               | 22 ++++++
 target/loongarch/lsx_helper.c               | 81 +++++++++++++++++++++
 5 files changed, 161 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 858dfcc53a..51c597603e 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -755,3 +755,26 @@ static bool trans_fcmp_cond_##suffix(DisasContext *ctx, \
 
 FCMP_INSN(s)
 FCMP_INSN(d)
+
+#define INSN_LSX(insn, type)                                \
+static bool trans_##insn(DisasContext *ctx, arg_##type * a) \
+{                                                           \
+    output_##type(ctx, a, #insn);                           \
+    return true;                                            \
+}
+
+static void output_vvv(DisasContext *ctx, arg_vvv *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "v%d, v%d, v%d", a->vd, a->vj, a->vk);
+}
+
+INSN_LSX(vadd_b,           vvv)
+INSN_LSX(vadd_h,           vvv)
+INSN_LSX(vadd_w,           vvv)
+INSN_LSX(vadd_d,           vvv)
+INSN_LSX(vadd_q,           vvv)
+INSN_LSX(vsub_b,           vvv)
+INSN_LSX(vsub_h,           vvv)
+INSN_LSX(vsub_w,           vvv)
+INSN_LSX(vsub_d,           vvv)
+INSN_LSX(vsub_q,           vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 9c01823a26..465bc36cb8 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -130,3 +130,15 @@ DEF_HELPER_4(ldpte, void, env, tl, tl, i32)
 DEF_HELPER_1(ertn, void, env)
 DEF_HELPER_1(idle, void, env)
 #endif
+
+/* LoongArch LSX  */
+DEF_HELPER_4(vadd_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vadd_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vadd_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vadd_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vadd_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vsub_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsub_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsub_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsub_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsub_q, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index d0bc9f561e..b2276ae688 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -14,3 +14,26 @@
 #else
 #define CHECK_SXE
 #endif
+
+static bool gen_vvv(DisasContext *ctx, arg_vvv *a,
+                    void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 vd = tcg_constant_i32(a->vd);
+    TCGv_i32 vj = tcg_constant_i32(a->vj);
+    TCGv_i32 vk = tcg_constant_i32(a->vk);
+
+    CHECK_SXE;
+    func(cpu_env, vd, vj, vk);
+    return true;
+}
+
+TRANS(vadd_b, gen_vvv, gen_helper_vadd_b)
+TRANS(vadd_h, gen_vvv, gen_helper_vadd_h)
+TRANS(vadd_w, gen_vvv, gen_helper_vadd_w)
+TRANS(vadd_d, gen_vvv, gen_helper_vadd_d)
+TRANS(vadd_q, gen_vvv, gen_helper_vadd_q)
+TRANS(vsub_b, gen_vvv, gen_helper_vsub_b)
+TRANS(vsub_h, gen_vvv, gen_helper_vsub_h)
+TRANS(vsub_w, gen_vvv, gen_helper_vsub_w)
+TRANS(vsub_d, gen_vvv, gen_helper_vsub_d)
+TRANS(vsub_q, gen_vvv, gen_helper_vsub_q)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 3fdc6e148c..0dd6ab20a2 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -484,3 +484,25 @@ ldpte            0000 01100100 01 ........ ..... 00000    @j_i
 ertn             0000 01100100 10000 01110 00000 00000    @empty
 idle             0000 01100100 10001 ...............      @i15
 dbcl             0000 00000010 10101 ...............      @i15
+
+#
+# LSX Argument sets
+#
+
+&vvv          vd vj vk
+
+#
+# LSX Formats
+#
+@vvv               .... ........ ..... vk:5 vj:5 vd:5    &vvv
+
+vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
+vadd_h           0111 00000000 10101 ..... ..... .....    @vvv
+vadd_w           0111 00000000 10110 ..... ..... .....    @vvv
+vadd_d           0111 00000000 10111 ..... ..... .....    @vvv
+vadd_q           0111 00010010 11010 ..... ..... .....    @vvv
+vsub_b           0111 00000000 11000 ..... ..... .....    @vvv
+vsub_h           0111 00000000 11001 ..... ..... .....    @vvv
+vsub_w           0111 00000000 11010 ..... ..... .....    @vvv
+vsub_d           0111 00000000 11011 ..... ..... .....    @vvv
+vsub_q           0111 00010010 11011 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 325574a026..195b2ffa8d 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -4,3 +4,84 @@
  *
  * Copyright (c) 2022 Loongson Technology Corporation Limited
  */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+
+#define DO_HELPER_VVV(NAME, BIT, FUNC, ...)                   \
+    void helper_##NAME(CPULoongArchState *env,                \
+                       uint32_t vd, uint32_t vj, uint32_t vk) \
+    { FUNC(env, vd, vj, vk, BIT, __VA_ARGS__); }
+
+static void helper_vvv(CPULoongArchState *env,
+                       uint32_t vd, uint32_t vj, uint32_t vk, int bit,
+                       void (*func)(vec_t*, vec_t*, vec_t*, int, int))
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+    vec_t *Vk = &(env->fpr[vk].vec);
+
+    for (i = 0; i < LSX_LEN/bit; i++) {
+        func(Vd, Vj, Vk, bit, i);
+    }
+}
+
+static void do_vadd(vec_t *Vd, vec_t *Vj, vec_t *Vk,  int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = Vj->B[n] + Vk->B[n];
+        break;
+    case 16:
+        Vd->H[n] = Vj->H[n] + Vk->H[n];
+        break;
+    case 32:
+        Vd->W[n] = Vj->W[n] + Vk->W[n];
+        break;
+    case 64:
+        Vd->D[n] = Vj->D[n] + Vk->D[n];
+        break;
+    case 128:
+        Vd->Q[n] = Vj->Q[n] + Vk->Q[n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vsub(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = Vj->B[n] - Vk->B[n];
+        break;
+    case 16:
+        Vd->H[n] = Vj->H[n] - Vk->H[n];
+        break;
+    case 32:
+        Vd->W[n] = Vj->W[n] - Vk->W[n];
+        break;
+    case 64:
+        Vd->D[n] = Vj->D[n] - Vk->D[n];
+        break;
+    case 128:
+        Vd->Q[n] = Vj->Q[n] - Vk->Q[n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vadd_b, 8, helper_vvv, do_vadd)
+DO_HELPER_VVV(vadd_h, 16, helper_vvv, do_vadd)
+DO_HELPER_VVV(vadd_w, 32, helper_vvv, do_vadd)
+DO_HELPER_VVV(vadd_d, 64, helper_vvv, do_vadd)
+DO_HELPER_VVV(vadd_q, 128, helper_vvv, do_vadd)
+DO_HELPER_VVV(vsub_b, 8, helper_vvv, do_vsub)
+DO_HELPER_VVV(vsub_h, 16, helper_vvv, do_vsub)
+DO_HELPER_VVV(vsub_w, 32, helper_vvv, do_vsub)
+DO_HELPER_VVV(vsub_d, 64, helper_vvv, do_vsub)
+DO_HELPER_VVV(vsub_q, 128, helper_vvv, do_vsub)
-- 
2.31.1


