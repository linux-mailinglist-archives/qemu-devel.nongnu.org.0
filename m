Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EB46CB4AA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:13:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzg4-0007My-Kb; Mon, 27 Mar 2023 23:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzfz-0007Ip-NC
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:07:12 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzfx-0000pW-47
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:07:11 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Dx_5fPWSJkl9oSAA--.29215S3;
 Tue, 28 Mar 2023 11:06:55 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S40; 
 Tue, 28 Mar 2023 11:06:54 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 38/44] target/loongarch: Implement vbitsel vset
Date: Tue, 28 Mar 2023 11:06:25 +0800
Message-Id: <20230328030631.3117129-39-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S40
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3AF18Xr13uFy5CFykXF1kXwb_yoW3tFW3pw
 4Iyry3Cr48tFyxJwnYvw1Yv3Z8Xrs3Kw129a13K3ykuF47XF1DAr4vq39F9FWUXrWvvFyj
 g3WDA34q9395Xa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 be8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0x
 vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280
 aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
- VBITSEL.V;
- VBITSELI.B;
- VSET{EQZ/NEZ}.V;
- VSETANYEQZ.{B/H/W/D};
- VSETALLNEZ.{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 20 +++++++
 target/loongarch/helper.h                   | 13 +++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 58 +++++++++++++++++++++
 target/loongarch/insns.decode               | 17 ++++++
 target/loongarch/lsx_helper.c               | 57 ++++++++++++++++++++
 5 files changed, 165 insertions(+)

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
index ef0b67349d..cdc007a072 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -655,3 +655,16 @@ DEF_HELPER_5(vfcmp_c_s, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(vfcmp_s_s, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(vfcmp_c_d, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(vfcmp_s_d, void, env, i32, i32, i32, i32)
+
+DEF_HELPER_FLAGS_4(vbitseli_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_3(vseteqz_v, void, env, i32, i32)
+DEF_HELPER_3(vsetnez_v, void, env, i32, i32)
+DEF_HELPER_3(vsetanyeqz_b, void, env, i32, i32)
+DEF_HELPER_3(vsetanyeqz_h, void, env, i32, i32)
+DEF_HELPER_3(vsetanyeqz_w, void, env, i32, i32)
+DEF_HELPER_3(vsetanyeqz_d, void, env, i32, i32)
+DEF_HELPER_3(vsetallnez_b, void, env, i32, i32)
+DEF_HELPER_3(vsetallnez_h, void, env, i32, i32)
+DEF_HELPER_3(vsetallnez_w, void, env, i32, i32)
+DEF_HELPER_3(vsetallnez_d, void, env, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 593b8b481d..7fc5c6c1d6 100644
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
@@ -3163,3 +3174,50 @@ static bool trans_vfcmp_cond_d(DisasContext *ctx, arg_vvv_fcond *a)
 
     return true;
 }
+
+static bool trans_vbitsel_v(DisasContext *ctx, arg_vvvv *a)
+{
+    CHECK_SXE;
+
+    tcg_gen_gvec_bitsel(MO_64, vreg_full_offset(a->vd), vreg_full_offset(a->va),
+                        vreg_full_offset(a->vk), vreg_full_offset(a->vj),
+                        16, 16);
+    return true;
+}
+
+static void gen_vbitseli(unsigned vece, TCGv_vec a, TCGv_vec b, int64_t imm)
+{
+    TCGv_vec t;
+
+    t = tcg_temp_new_vec_matching(a);
+    tcg_gen_dupi_vec(vece, t, imm);
+    tcg_gen_bitsel_vec(vece, a, a, t, b);
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
+    tcg_gen_gvec_2i(vreg_full_offset(a->vd), vreg_full_offset(a->vj),
+                    16, 16, a->imm, &op);
+    return true;
+}
+
+
+TRANS(vseteqz_v, gen_cv, gen_helper_vseteqz_v)
+TRANS(vsetnez_v, gen_cv, gen_helper_vsetnez_v)
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
index 51b784e885..996312d9b2 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -2972,3 +2972,60 @@ VFCMP(vfcmp_c_s, 32, uint32_t, W, float32_compare_quiet)
 VFCMP(vfcmp_s_s, 32, uint32_t, W, float32_compare)
 VFCMP(vfcmp_c_d, 64, uint64_t, D, float64_compare_quiet)
 VFCMP(vfcmp_s_d, 64, uint64_t, D, float64_compare)
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
+void HELPER(vseteqz_v)(CPULoongArchState *env, uint32_t cd, uint32_t vj)
+{
+    VReg *Vj = &(env->fpr[vj].vreg);
+    env->cf[cd & 0x7] = (Vj->Q(0) == 0);
+}
+
+void HELPER(vsetnez_v)(CPULoongArchState *env, uint32_t cd, uint32_t vj)
+{
+    VReg *Vj = &(env->fpr[vj].vreg);
+    env->cf[cd & 0x7] = (Vj->Q(0) != 0);
+}
+
+#define SETANYEQZ(NAME, BIT, E)                                     \
+void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
+{                                                                   \
+    int i;                                                          \
+    bool ret = false;                                               \
+    VReg *Vj = &(env->fpr[vj].vreg);                                \
+                                                                    \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
+        ret |= (Vj->E(i) == 0);                                     \
+    }                                                               \
+    env->cf[cd & 0x7] = ret;                                        \
+}
+SETANYEQZ(vsetanyeqz_b, 8, B)
+SETANYEQZ(vsetanyeqz_h, 16, H)
+SETANYEQZ(vsetanyeqz_w, 32, W)
+SETANYEQZ(vsetanyeqz_d, 64, D)
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


