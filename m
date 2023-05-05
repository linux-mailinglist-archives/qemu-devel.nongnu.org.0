Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406276F7AF7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 04:31:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pulBQ-0004Ml-W5; Thu, 04 May 2023 22:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pulBM-0004Lw-Og
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:28:28 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pulBI-00077t-Mu
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:28:28 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxHuvCaVRkqfcEAA--.8127S3;
 Fri, 05 May 2023 10:28:18 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a+2aVRkNw9LAA--.7251S6; 
 Fri, 05 May 2023 10:28:16 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 04/45] target/loongarch: Implement vadd/vsub
Date: Fri,  5 May 2023 10:27:25 +0800
Message-Id: <20230505022806.6082-5-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
References: <20230505022806.6082-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a+2aVRkNw9LAA--.7251S6
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3AFyfCr4DJrWDCF47ZF45GFg_yoWxCr1DpF
 1jyry7Gr4kJryxJrna9w45Zr15ur1DCF1a934ftws5Zr45XF1DJrW8trZF9FW7Xan5uFyj
 qFyUA34UKFW8Xw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch includes:
- VADD.{B/H/W/D/Q};
- VSUB.{B/H/W/D/Q}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-5-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 23 +++++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 69 +++++++++++++++++++++
 target/loongarch/insns.decode               | 22 +++++++
 target/loongarch/translate.c                | 24 +++++++
 target/loongarch/translate.h                |  1 +
 5 files changed, 139 insertions(+)

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
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 5dedb044d7..ddeb9fde28 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -14,3 +14,72 @@
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
+    vd_ofs = vec_full_offset(a->vd);
+    vj_ofs = vec_full_offset(a->vj);
+    vk_ofs = vec_full_offset(a->vk);
+
+    func(mop, vd_ofs, vj_ofs, vk_ofs, 16, ctx->vl/8);
+    return true;
+}
+
+TRANS(vadd_b, gvec_vvv, MO_8, tcg_gen_gvec_add)
+TRANS(vadd_h, gvec_vvv, MO_16, tcg_gen_gvec_add)
+TRANS(vadd_w, gvec_vvv, MO_32, tcg_gen_gvec_add)
+TRANS(vadd_d, gvec_vvv, MO_64, tcg_gen_gvec_add)
+
+#define VADDSUB_Q(NAME)                                        \
+static bool trans_v## NAME ##_q(DisasContext *ctx, arg_vvv *a) \
+{                                                              \
+    TCGv_i64 rh, rl, ah, al, bh, bl;                           \
+                                                               \
+    CHECK_SXE;                                                 \
+                                                               \
+    rh = tcg_temp_new_i64();                                   \
+    rl = tcg_temp_new_i64();                                   \
+    ah = tcg_temp_new_i64();                                   \
+    al = tcg_temp_new_i64();                                   \
+    bh = tcg_temp_new_i64();                                   \
+    bl = tcg_temp_new_i64();                                   \
+                                                               \
+    get_vreg64(ah, a->vj, 1);                                  \
+    get_vreg64(al, a->vj, 0);                                  \
+    get_vreg64(bh, a->vk, 1);                                  \
+    get_vreg64(bl, a->vk, 0);                                  \
+                                                               \
+    tcg_gen_## NAME ##2_i64(rl, rh, al, ah, bl, bh);           \
+                                                               \
+    set_vreg64(rh, a->vd, 1);                                  \
+    set_vreg64(rl, a->vd, 0);                                  \
+                                                               \
+    return true;                                               \
+}
+
+VADDSUB_Q(add)
+VADDSUB_Q(sub)
+
+TRANS(vsub_b, gvec_vvv, MO_8, tcg_gen_gvec_sub)
+TRANS(vsub_h, gvec_vvv, MO_16, tcg_gen_gvec_sub)
+TRANS(vsub_w, gvec_vvv, MO_32, tcg_gen_gvec_sub)
+TRANS(vsub_d, gvec_vvv, MO_64, tcg_gen_gvec_sub)
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
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 97e019aeb4..862847afb3 100644
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
@@ -29,6 +31,23 @@ TCGv_i64 cpu_fpr[32];
 #define DISAS_EXIT        DISAS_TARGET_1
 #define DISAS_EXIT_UPDATE DISAS_TARGET_2
 
+static inline int vec_full_offset(int regno)
+{
+    return  offsetof(CPULoongArchState, fpr[regno]);
+}
+
+static inline void get_vreg64(TCGv_i64 dest, int regno, int index)
+{
+    tcg_gen_ld_i64(dest, cpu_env,
+                   offsetof(CPULoongArchState, fpr[regno].vreg.D(index)));
+}
+
+static inline void set_vreg64(TCGv_i64 src, int regno, int index)
+{
+    tcg_gen_st_i64(src, cpu_env,
+                   offsetof(CPULoongArchState, fpr[regno].vreg.D(index)));
+}
+
 static inline int plus_1(DisasContext *ctx, int x)
 {
     return x + 1;
@@ -71,6 +90,7 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
                                             CPUState *cs)
 {
     int64_t bound;
+    CPULoongArchState *env = cs->env_ptr;
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
@@ -85,6 +105,10 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
     bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
     ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
 
+    if (FIELD_EX64(env->cpucfg[2], CPUCFG2, LSX)) {
+        ctx->vl = LSX_LEN;
+    }
+
     ctx->zero = tcg_constant_tl(0);
 }
 
diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
index 67bc74c05b..7f60090580 100644
--- a/target/loongarch/translate.h
+++ b/target/loongarch/translate.h
@@ -31,6 +31,7 @@ typedef struct DisasContext {
     uint32_t opcode;
     uint16_t mem_idx;
     uint16_t plv;
+    int vl;   /* Vector length */
     TCGv zero;
 } DisasContext;
 
-- 
2.31.1


