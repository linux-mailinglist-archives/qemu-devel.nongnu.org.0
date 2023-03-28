Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8E36CB49F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:12:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzfc-0007D8-72; Mon, 27 Mar 2023 23:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzfY-0007BJ-E2
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:44 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzfU-0000M8-EP
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:44 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Axrtq6WSJkRNoSAA--.17192S3;
 Tue, 28 Mar 2023 11:06:34 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S7; 
 Tue, 28 Mar 2023 11:06:33 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 05/44] target/loongarch: Implement vadd/vsub
Date: Tue, 28 Mar 2023 11:05:52 +0800
Message-Id: <20230328030631.3117129-6-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S7
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKryDWr4rCrWkuF1Utr4UXFb_yoWxJry3pF
 12kry3Gr48GFZrJrna9w15Zr15Xr1DCa129w4ft3s5Ar47XFnrXryvq39F9FW7Xw4kuFy0
 qFy3A34UKFZ3Xw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
 target/loongarch/disas.c                    | 23 ++++++++++++
 target/loongarch/helper.h                   |  4 +++
 target/loongarch/insn_trans/trans_lsx.c.inc | 40 +++++++++++++++++++++
 target/loongarch/insns.decode               | 22 ++++++++++++
 target/loongarch/lsx_helper.c               | 25 +++++++++++++
 target/loongarch/translate.c                |  7 ++++
 6 files changed, 121 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 2e93e77e0d..a5948d7847 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -784,3 +784,26 @@ PCADD_INSN(pcaddi)
 PCADD_INSN(pcalau12i)
 PCADD_INSN(pcaddu12i)
 PCADD_INSN(pcaddu18i)
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
index 9c01823a26..13390c07d6 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -130,3 +130,7 @@ DEF_HELPER_4(ldpte, void, env, tl, tl, i32)
 DEF_HELPER_1(ertn, void, env)
 DEF_HELPER_1(idle, void, env)
 #endif
+
+/* LoongArch LSX  */
+DEF_HELPER_4(vadd_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vsub_q, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 5dedb044d7..2fe0e4ace5 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -14,3 +14,43 @@
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
+
+    func(cpu_env, vd, vj, vk);
+    return true;
+}
+
+static bool gvec_vvv(DisasContext *ctx, arg_vvv *a, MemOp mop,
+                     void (*func)(unsigned, uint32_t, uint32_t,
+                                  uint32_t, uint32_t, uint32_t))
+{
+    uint32_t vd_ofs, vj_ofs, vk_ofs;
+
+    CHECK_SXE;
+
+    vd_ofs = vreg_full_offset(a->vd);
+    vj_ofs = vreg_full_offset(a->vj);
+    vk_ofs = vreg_full_offset(a->vk);
+
+    func(mop, vd_ofs, vj_ofs, vk_ofs, 16, 16);
+    return true;
+}
+
+TRANS(vadd_b, gvec_vvv, MO_8, tcg_gen_gvec_add)
+TRANS(vadd_h, gvec_vvv, MO_16, tcg_gen_gvec_add)
+TRANS(vadd_w, gvec_vvv, MO_32, tcg_gen_gvec_add)
+TRANS(vadd_d, gvec_vvv, MO_64, tcg_gen_gvec_add)
+TRANS(vadd_q, gen_vvv, gen_helper_vadd_q)
+TRANS(vsub_b, gvec_vvv, MO_8, tcg_gen_gvec_sub)
+TRANS(vsub_h, gvec_vvv, MO_16, tcg_gen_gvec_sub)
+TRANS(vsub_w, gvec_vvv, MO_32, tcg_gen_gvec_sub)
+TRANS(vsub_d, gvec_vvv, MO_64, tcg_gen_gvec_sub)
+TRANS(vsub_q, gen_vvv, gen_helper_vsub_q)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index de7b8f0f3c..d18db68d51 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -485,3 +485,25 @@ ldpte            0000 01100100 01 ........ ..... 00000    @j_i
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
index 9332163aff..edd6e99b23 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -4,3 +4,28 @@
  *
  * Copyright (c) 2022-2023 Loongson Technology Corporation Limited
  */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+
+void helper_vadd_q(CPULoongArchState *env,
+                   uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    VReg *Vk = &(env->fpr[vk].vreg);
+
+    Vd->Q(0) = int128_add(Vj->Q(0), Vk->Q(0));
+}
+
+void helper_vsub_q(CPULoongArchState *env,
+                   uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    VReg *Vk = &(env->fpr[vk].vreg);
+
+    Vd->Q(0) = int128_sub(Vj->Q(0), Vk->Q(0));
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 104d4f2fbd..f50d14cc65 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -8,6 +8,8 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
+
 #include "exec/translator.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
@@ -29,6 +31,11 @@ TCGv_i64 cpu_fpr[32];
 #define DISAS_EXIT        DISAS_TARGET_1
 #define DISAS_EXIT_UPDATE DISAS_TARGET_2
 
+static inline int vreg_full_offset(int regno)
+{
+    return  offsetof(CPULoongArchState, fpr[regno].vreg);
+}
+
 static inline int plus_1(DisasContext *ctx, int x)
 {
     return x + 1;
-- 
2.31.1


