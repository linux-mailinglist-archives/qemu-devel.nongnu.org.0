Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B7C6F715E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:44:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucom-0007KQ-SB; Thu, 04 May 2023 13:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puY95-00012a-8a
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:33:17 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puY92-0003u3-9c
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:33:15 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxGurupFNk0KAEAA--.7569S3;
 Thu, 04 May 2023 20:28:30 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77PapFNk1uxJAA--.5674S38; 
 Thu, 04 May 2023 20:28:29 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [PATCH v5 36/44] target/loongarch: Implement vfcmp
Date: Thu,  4 May 2023 20:28:02 +0800
Message-Id: <20230504122810.4094787-37-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230504122810.4094787-1-gaosong@loongson.cn>
References: <20230504122810.4094787-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77PapFNk1uxJAA--.5674S38
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3XryxKry5JF43ArW3Gw1UAwb_yoW3Ar1rpF
 y7GFyUKrW8X34rW3WSv3W5u3WUAF45Gw4q9a43tw4vgrW7ZFn7A34rtasI9FZ8C3WDJry8
 W3W7A34YgF9rJwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
- VFCMP.cond.{S/D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 94 +++++++++++++++++++++
 target/loongarch/helper.h                   |  5 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 32 +++++++
 target/loongarch/insns.decode               |  5 ++
 target/loongarch/lsx_helper.c               | 54 ++++++++++++
 5 files changed, 190 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index e589b23f4c..64db01d2f9 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1447,3 +1447,97 @@ INSN_LSX(vslti_bu,         vv_i)
 INSN_LSX(vslti_hu,         vv_i)
 INSN_LSX(vslti_wu,         vv_i)
 INSN_LSX(vslti_du,         vv_i)
+
+#define output_vfcmp(C, PREFIX, SUFFIX)                                     \
+{                                                                           \
+    (C)->info->fprintf_func((C)->info->stream, "%08x   %s%s\t%d, f%d, f%d", \
+                            (C)->insn, PREFIX, SUFFIX, a->vd,               \
+                            a->vj, a->vk);                                  \
+}
+
+static bool output_vvv_fcond(DisasContext *ctx, arg_vvv_fcond * a,
+                             const char *suffix)
+{
+    bool ret = true;
+    switch (a->fcond) {
+    case 0x0:
+        output_vfcmp(ctx, "vfcmp_caf_", suffix);
+        break;
+    case 0x1:
+        output_vfcmp(ctx, "vfcmp_saf_", suffix);
+        break;
+    case 0x2:
+        output_vfcmp(ctx, "vfcmp_clt_", suffix);
+        break;
+    case 0x3:
+        output_vfcmp(ctx, "vfcmp_slt_", suffix);
+        break;
+    case 0x4:
+        output_vfcmp(ctx, "vfcmp_ceq_", suffix);
+        break;
+    case 0x5:
+        output_vfcmp(ctx, "vfcmp_seq_", suffix);
+        break;
+    case 0x6:
+        output_vfcmp(ctx, "vfcmp_cle_", suffix);
+        break;
+    case 0x7:
+        output_vfcmp(ctx, "vfcmp_sle_", suffix);
+        break;
+    case 0x8:
+        output_vfcmp(ctx, "vfcmp_cun_", suffix);
+        break;
+    case 0x9:
+        output_vfcmp(ctx, "vfcmp_sun_", suffix);
+        break;
+    case 0xA:
+        output_vfcmp(ctx, "vfcmp_cult_", suffix);
+        break;
+    case 0xB:
+        output_vfcmp(ctx, "vfcmp_sult_", suffix);
+        break;
+    case 0xC:
+        output_vfcmp(ctx, "vfcmp_cueq_", suffix);
+        break;
+    case 0xD:
+        output_vfcmp(ctx, "vfcmp_sueq_", suffix);
+        break;
+    case 0xE:
+        output_vfcmp(ctx, "vfcmp_cule_", suffix);
+        break;
+    case 0xF:
+        output_vfcmp(ctx, "vfcmp_sule_", suffix);
+        break;
+    case 0x10:
+        output_vfcmp(ctx, "vfcmp_cne_", suffix);
+        break;
+    case 0x11:
+        output_vfcmp(ctx, "vfcmp_sne_", suffix);
+        break;
+    case 0x14:
+        output_vfcmp(ctx, "vfcmp_cor_", suffix);
+        break;
+    case 0x15:
+        output_vfcmp(ctx, "vfcmp_sor_", suffix);
+        break;
+    case 0x18:
+        output_vfcmp(ctx, "vfcmp_cune_", suffix);
+        break;
+    case 0x19:
+        output_vfcmp(ctx, "vfcmp_sune_", suffix);
+        break;
+    default:
+        ret = false;
+    }
+    return ret;
+}
+
+#define LSX_FCMP_INSN(suffix)                            \
+static bool trans_vfcmp_cond_##suffix(DisasContext *ctx, \
+                                     arg_vvv_fcond * a)  \
+{                                                        \
+    return output_vvv_fcond(ctx, a, #suffix);            \
+}
+
+LSX_FCMP_INSN(s)
+LSX_FCMP_INSN(d)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index e9e9fa7f87..867756fdb5 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -637,3 +637,8 @@ DEF_HELPER_FLAGS_4(vslti_bu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(vslti_hu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(vslti_wu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(vslti_du, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_5(vfcmp_c_s, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(vfcmp_s_s, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(vfcmp_c_d, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(vfcmp_s_d, void, env, i32, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 4d9f88bf4f..abb6efc09d 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -3717,3 +3717,35 @@ TRANS(vslti_bu, do_vslti_u, MO_8)
 TRANS(vslti_hu, do_vslti_u, MO_16)
 TRANS(vslti_wu, do_vslti_u, MO_32)
 TRANS(vslti_du, do_vslti_u, MO_64)
+
+static bool trans_vfcmp_cond_s(DisasContext *ctx, arg_vvv_fcond *a)
+{
+    uint32_t flags;
+    void (*fn)(TCGv_env, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
+    TCGv_i32 vd = tcg_constant_i32(a->vd);
+    TCGv_i32 vj = tcg_constant_i32(a->vj);
+    TCGv_i32 vk = tcg_constant_i32(a->vk);
+
+    CHECK_SXE;
+
+    fn = (a->fcond & 1 ? gen_helper_vfcmp_s_s : gen_helper_vfcmp_c_s);
+    flags = get_fcmp_flags(a->fcond >> 1);
+    fn(cpu_env, vd, vj, vk,  tcg_constant_i32(flags));
+
+    return true;
+}
+
+static bool trans_vfcmp_cond_d(DisasContext *ctx, arg_vvv_fcond *a)
+{
+    uint32_t flags;
+    void (*fn)(TCGv_env, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
+    TCGv_i32 vd = tcg_constant_i32(a->vd);
+    TCGv_i32 vj = tcg_constant_i32(a->vj);
+    TCGv_i32 vk = tcg_constant_i32(a->vk);
+
+    fn = (a->fcond & 1 ? gen_helper_vfcmp_s_d : gen_helper_vfcmp_c_d);
+    flags = get_fcmp_flags(a->fcond >> 1);
+    fn(cpu_env, vd, vj, vk, tcg_constant_i32(flags));
+
+    return true;
+}
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index a090a7d22b..d018b110cd 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -494,6 +494,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 &vvv          vd vj vk
 &vv_i         vd vj imm
 &vvvv         vd vj vk va
+&vvv_fcond    vd vj vk fcond
 
 #
 # LSX Formats
@@ -508,6 +509,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 @vv_ui8              .... ........ .. imm:8 vj:5 vd:5    &vv_i
 @vv_i5           .... ........ ..... imm:s5 vj:5 vd:5    &vv_i
 @vvvv               .... ........ va:5 vk:5 vj:5 vd:5    &vvvv
+@vvv_fcond      .... ........ fcond:5  vk:5 vj:5 vd:5    &vvv_fcond
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
 vadd_h           0111 00000000 10101 ..... ..... .....    @vvv
@@ -1145,3 +1147,6 @@ vslti_bu         0111 00101000 10000 ..... ..... .....    @vv_ui5
 vslti_hu         0111 00101000 10001 ..... ..... .....    @vv_ui5
 vslti_wu         0111 00101000 10010 ..... ..... .....    @vv_ui5
 vslti_du         0111 00101000 10011 ..... ..... .....    @vv_ui5
+
+vfcmp_cond_s     0000 11000101 ..... ..... ..... .....    @vvv_fcond
+vfcmp_cond_d     0000 11000110 ..... ..... ..... .....    @vvv_fcond
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index cb4f26ff89..9fecd58328 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -2660,3 +2660,57 @@ VCMPI(vslti_bu, 8, UB, VSLT)
 VCMPI(vslti_hu, 16, UH, VSLT)
 VCMPI(vslti_wu, 32, UW, VSLT)
 VCMPI(vslti_du, 64, UD, VSLT)
+
+static uint64_t vfcmp_common(CPULoongArchState *env,
+                             FloatRelation cmp, uint32_t flags)
+{
+    uint64_t ret = 0;
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
+
+    if (ret) {
+        ret = -1;
+    }
+
+    return ret;
+}
+
+#define VFCMP(NAME, BIT, E, FN)                                          \
+void HELPER(NAME)(CPULoongArchState *env,                                \
+                  uint32_t vd, uint32_t vj, uint32_t vk, uint32_t flags) \
+{                                                                        \
+    int i;                                                               \
+    VReg t;                                                              \
+    VReg *Vd = &(env->fpr[vd].vreg);                                     \
+    VReg *Vj = &(env->fpr[vj].vreg);                                     \
+    VReg *Vk = &(env->fpr[vk].vreg);                                     \
+                                                                         \
+    vec_clear_cause(env);                                                \
+    for (i = 0; i < LSX_LEN/BIT ; i++) {                                 \
+        FloatRelation cmp;                                               \
+        cmp = FN(Vj->E(i), Vk->E(i), &env->fp_status);                   \
+        t.E(i) = vfcmp_common(env, cmp, flags);                          \
+        vec_update_fcsr0(env, GETPC());                                  \
+    }                                                                    \
+    *Vd = t;                                                             \
+}
+
+VFCMP(vfcmp_c_s, 32, UW, float32_compare_quiet)
+VFCMP(vfcmp_s_s, 32, UW, float32_compare)
+VFCMP(vfcmp_c_d, 64, UD, float64_compare_quiet)
+VFCMP(vfcmp_s_d, 64, UD, float64_compare)
-- 
2.31.1


