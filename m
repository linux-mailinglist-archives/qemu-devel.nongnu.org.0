Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5B66E8C62
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:13:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPLz-0008O6-O0; Thu, 20 Apr 2023 04:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1ppPLx-0008Bk-4O
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:09:17 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1ppPLZ-0008Q2-OC
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:09:14 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxztrI8kBki2UfAA--.37366S3;
 Thu, 20 Apr 2023 16:07:36 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxur2u8kBkdNUwAA--.59556S39; 
 Thu, 20 Apr 2023 16:07:35 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [RFC PATCH v3 37/44] target/loongarch: Implement vbitsel vset
Date: Thu, 20 Apr 2023 16:07:02 +0800
Message-Id: <20230420080709.3352575-38-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230420080709.3352575-1-gaosong@loongson.cn>
References: <20230420080709.3352575-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxur2u8kBkdNUwAA--.59556S39
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Xw1UGFyftF47Wr4fuF1kuFg_yoWfXw1kpr
 yIyry7Gr47tFyfJ3ZYvw1Yv3Z8Zrs7Kw1j9w4fK3yvvF47XF1DAr40q39F9F4UXFWvvFyj
 g3WDA34q9395X3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
 0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCF
 FI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv
 8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF
 7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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
- VBITSEL.V;
- VBITSELI.B;
- VSET{EQZ/NEZ}.V;
- VSETANYEQZ.{B/H/W/D};
- VSETALLNEZ.{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 20 ++++++
 target/loongarch/helper.h                   | 11 +++
 target/loongarch/insn_trans/trans_lsx.c.inc | 74 +++++++++++++++++++++
 target/loongarch/insns.decode               | 17 +++++
 target/loongarch/lsx_helper.c               | 59 ++++++++++++++++
 5 files changed, 181 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 64db01d2f9..ecf0c7b577 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -792,6 +792,12 @@ static bool trans_##insn(DisasContext *ctx, arg_##type * a) \
     return true;                                            \
 }
 
+static void output_cv(DisasContext *ctx, arg_cv *a,
+                        const char *mnemonic)
+{
+    output(ctx, mnemonic, "fcc%d, v%d", a->cd, a->vj);
+}
+
 static void output_vvv(DisasContext *ctx, arg_vvv *a, const char *mnemonic)
 {
     output(ctx, mnemonic, "v%d, v%d, v%d", a->vd, a->vj, a->vk);
@@ -1541,3 +1547,17 @@ static bool trans_vfcmp_cond_##suffix(DisasContext *ctx, \
 
 LSX_FCMP_INSN(s)
 LSX_FCMP_INSN(d)
+
+INSN_LSX(vbitsel_v,        vvvv)
+INSN_LSX(vbitseli_b,       vv_i)
+
+INSN_LSX(vseteqz_v,        cv)
+INSN_LSX(vsetnez_v,        cv)
+INSN_LSX(vsetanyeqz_b,     cv)
+INSN_LSX(vsetanyeqz_h,     cv)
+INSN_LSX(vsetanyeqz_w,     cv)
+INSN_LSX(vsetanyeqz_d,     cv)
+INSN_LSX(vsetallnez_b,     cv)
+INSN_LSX(vsetallnez_h,     cv)
+INSN_LSX(vsetallnez_w,     cv)
+INSN_LSX(vsetallnez_d,     cv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 867756fdb5..8eb2738cd0 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -642,3 +642,14 @@ DEF_HELPER_5(vfcmp_c_s, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(vfcmp_s_s, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(vfcmp_c_d, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(vfcmp_s_d, void, env, i32, i32, i32, i32)
+
+DEF_HELPER_FLAGS_4(vbitseli_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_3(vsetanyeqz_b, void, env, i32, i32)
+DEF_HELPER_3(vsetanyeqz_h, void, env, i32, i32)
+DEF_HELPER_3(vsetanyeqz_w, void, env, i32, i32)
+DEF_HELPER_3(vsetanyeqz_d, void, env, i32, i32)
+DEF_HELPER_3(vsetallnez_b, void, env, i32, i32)
+DEF_HELPER_3(vsetallnez_h, void, env, i32, i32)
+DEF_HELPER_3(vsetallnez_w, void, env, i32, i32)
+DEF_HELPER_3(vsetallnez_d, void, env, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index d8774c5d02..e724d95358 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -65,6 +65,17 @@ static bool gen_vv_i(DisasContext *ctx, arg_vv_i *a,
     return true;
 }
 
+static bool gen_cv(DisasContext *ctx, arg_cv *a,
+                    void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 vj = tcg_constant_i32(a->vj);
+    TCGv_i32 cd = tcg_constant_i32(a->cd);
+
+    CHECK_SXE;
+    func(cpu_env, cd, vj);
+    return true;
+}
+
 static bool gvec_vvv(DisasContext *ctx, arg_vvv *a, MemOp mop,
                      void (*func)(unsigned, uint32_t, uint32_t,
                                   uint32_t, uint32_t, uint32_t))
@@ -3743,3 +3754,66 @@ static bool trans_vfcmp_cond_d(DisasContext *ctx, arg_vvv_fcond *a)
 
     return true;
 }
+
+static bool trans_vbitsel_v(DisasContext *ctx, arg_vvvv *a)
+{
+    CHECK_SXE;
+
+    tcg_gen_gvec_bitsel(MO_64, vec_full_offset(a->vd), vec_full_offset(a->va),
+                        vec_full_offset(a->vk), vec_full_offset(a->vj),
+                        16, ctx->vl/8);
+    return true;
+}
+
+static void gen_vbitseli(unsigned vece, TCGv_vec a, TCGv_vec b, int64_t imm)
+{
+    tcg_gen_bitsel_vec(vece, a, a, tcg_constant_vec_matching(a, vece, imm), b);
+}
+
+static bool trans_vbitseli_b(DisasContext *ctx, arg_vv_i *a)
+{
+    static const GVecGen2i op = {
+       .fniv = gen_vbitseli,
+       .fnoi = gen_helper_vbitseli_b,
+       .vece = MO_8,
+       .load_dest = true
+    };
+
+    CHECK_SXE;
+
+    tcg_gen_gvec_2i(vec_full_offset(a->vd), vec_full_offset(a->vj),
+                    16, ctx->vl/8, a->imm, &op);
+    return true;
+}
+
+#define VSET(NAME, COND)                                                       \
+static bool trans_## NAME (DisasContext *ctx, arg_cv *a)                       \
+{                                                                              \
+    TCGv_i64 t1, al, ah;                                                       \
+                                                                               \
+    al = tcg_temp_new_i64();                                                   \
+    ah = tcg_temp_new_i64();                                                   \
+    t1 = tcg_temp_new_i64();                                                   \
+                                                                               \
+    get_vreg64(ah, a->vj, 1);                                                  \
+    get_vreg64(al, a->vj, 0);                                                  \
+                                                                               \
+    CHECK_SXE;                                                                 \
+    tcg_gen_or_i64(t1, al, ah);                                                \
+    tcg_gen_setcondi_i64(COND, t1, t1, 0);                                     \
+    tcg_gen_st8_tl(t1, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7])); \
+                                                                               \
+    return true;                                                               \
+}
+
+VSET(vseteqz_v, TCG_COND_EQ)
+VSET(vsetnez_v, TCG_COND_NE)
+
+TRANS(vsetanyeqz_b, gen_cv, gen_helper_vsetanyeqz_b)
+TRANS(vsetanyeqz_h, gen_cv, gen_helper_vsetanyeqz_h)
+TRANS(vsetanyeqz_w, gen_cv, gen_helper_vsetanyeqz_w)
+TRANS(vsetanyeqz_d, gen_cv, gen_helper_vsetanyeqz_d)
+TRANS(vsetallnez_b, gen_cv, gen_helper_vsetallnez_b)
+TRANS(vsetallnez_h, gen_cv, gen_helper_vsetallnez_h)
+TRANS(vsetallnez_w, gen_cv, gen_helper_vsetallnez_w)
+TRANS(vsetallnez_d, gen_cv, gen_helper_vsetallnez_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index d018b110cd..d8feeadc41 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -491,6 +491,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 #
 
 &vv           vd vj
+&cv           cd vj
 &vvv          vd vj vk
 &vv_i         vd vj imm
 &vvvv         vd vj vk va
@@ -500,6 +501,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 # LSX Formats
 #
 @vv               .... ........ ..... ..... vj:5 vd:5    &vv
+@cv            .... ........ ..... ..... vj:5 .. cd:3    &cv
 @vvv               .... ........ ..... vk:5 vj:5 vd:5    &vvv
 @vv_ui3        .... ........ ..... .. imm:3 vj:5 vd:5    &vv_i
 @vv_ui4         .... ........ ..... . imm:4 vj:5 vd:5    &vv_i
@@ -1150,3 +1152,18 @@ vslti_du         0111 00101000 10011 ..... ..... .....    @vv_ui5
 
 vfcmp_cond_s     0000 11000101 ..... ..... ..... .....    @vvv_fcond
 vfcmp_cond_d     0000 11000110 ..... ..... ..... .....    @vvv_fcond
+
+vbitsel_v        0000 11010001 ..... ..... ..... .....    @vvvv
+
+vbitseli_b       0111 00111100 01 ........ ..... .....    @vv_ui8
+
+vseteqz_v        0111 00101001 11001 00110 ..... 00 ...   @cv
+vsetnez_v        0111 00101001 11001 00111 ..... 00 ...   @cv
+vsetanyeqz_b     0111 00101001 11001 01000 ..... 00 ...   @cv
+vsetanyeqz_h     0111 00101001 11001 01001 ..... 00 ...   @cv
+vsetanyeqz_w     0111 00101001 11001 01010 ..... 00 ...   @cv
+vsetanyeqz_d     0111 00101001 11001 01011 ..... 00 ...   @cv
+vsetallnez_b     0111 00101001 11001 01100 ..... 00 ...   @cv
+vsetallnez_h     0111 00101001 11001 01101 ..... 00 ...   @cv
+vsetallnez_w     0111 00101001 11001 01110 ..... 00 ...   @cv
+vsetallnez_d     0111 00101001 11001 01111 ..... 00 ...   @cv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 9fecd58328..12dc8ad72e 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -11,6 +11,7 @@
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 #include "internals.h"
+#include "tcg/tcg.h"
 
 #define DO_ADD(a, b)  (a + b)
 #define DO_SUB(a, b)  (a - b)
@@ -2714,3 +2715,61 @@ VFCMP(vfcmp_c_s, 32, UW, float32_compare_quiet)
 VFCMP(vfcmp_s_s, 32, UW, float32_compare)
 VFCMP(vfcmp_c_d, 64, UD, float64_compare_quiet)
 VFCMP(vfcmp_s_d, 64, UD, float64_compare)
+
+void HELPER(vbitseli_b)(void *vd, void *vj,  uint64_t imm, uint32_t v)
+{
+    int i;
+    VReg *Vd = (VReg *)vd;
+    VReg *Vj = (VReg *)vj;
+
+    for (i = 0; i < 16; i++) {
+        Vd->B(i) = (~Vd->B(i) & Vj->B(i)) | (Vd->B(i) & imm);
+    }
+}
+
+/* Copied from target/arm/tcg/sve_helper.c */
+static inline bool do_match2(uint64_t n, uint64_t m0, uint64_t m1, int esz)
+{
+    uint64_t bits = 8 << esz;
+    uint64_t ones = dup_const(esz, 1);
+    uint64_t signs = ones << (bits - 1);
+    uint64_t cmp0, cmp1;
+
+    cmp1 = dup_const(esz, n);
+    cmp0 = cmp1 ^ m0;
+    cmp1 = cmp1 ^ m1;
+    cmp0 = (cmp0 - ones) & ~cmp0;
+    cmp1 = (cmp1 - ones) & ~cmp1;
+    return (cmp0 | cmp1) & signs;
+}
+
+#define SETANYEQZ(NAME, MO)                                         \
+void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
+{                                                                   \
+    bool ret = false;                                               \
+    VReg *Vj = &(env->fpr[vj].vreg);                                \
+                                                                    \
+    ret = do_match2(0, Vj->D(0), Vj->D(1), MO);                     \
+    env->cf[cd & 0x7] = ret;                                        \
+}
+SETANYEQZ(vsetanyeqz_b, MO_8)
+SETANYEQZ(vsetanyeqz_h, MO_16)
+SETANYEQZ(vsetanyeqz_w, MO_32)
+SETANYEQZ(vsetanyeqz_d, MO_64)
+
+#define SETALLNEZ(NAME, BIT, E)                                     \
+void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
+{                                                                   \
+    int i;                                                          \
+    bool ret = true;                                                \
+    VReg *Vj = &(env->fpr[vj].vreg);                                \
+                                                                    \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
+        ret &= (Vj->E(i) != 0);                                     \
+    }                                                               \
+    env->cf[cd & 0x7] = ret;                                        \
+}
+SETALLNEZ(vsetallnez_b, 8, B)
+SETALLNEZ(vsetallnez_h, 16, H)
+SETALLNEZ(vsetallnez_w, 32, W)
+SETALLNEZ(vsetallnez_d, 64, D)
-- 
2.31.1


