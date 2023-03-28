Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB25D6CB4B8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:15:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzfx-0007HO-Ae; Mon, 27 Mar 2023 23:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzfm-0007Fq-4v
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:59 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzfi-0000VM-Sf
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:57 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Dx3trBWSJkadoSAA--.17514S3;
 Tue, 28 Mar 2023 11:06:41 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S20; 
 Tue, 28 Mar 2023 11:06:40 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 18/44] target/loongarch: Implement vsat
Date: Tue, 28 Mar 2023 11:06:05 +0800
Message-Id: <20230328030631.3117129-19-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S20
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKF4xZr1xJw4kuF4kCr43GFg_yoW3Zry7pF
 y0gryxKr48GFyxXFnYv3W5Aa1DXrsrKwn09anxJws5urW7ZFnxXFykt3y29F4UZF1vva4U
 X3WrCryjyrWfXwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
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
- VSAT.{B/H/W/D}[U].

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |   9 ++
 target/loongarch/helper.h                   |   9 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 105 ++++++++++++++++++++
 target/loongarch/insns.decode               |  12 +++
 target/loongarch/lsx_helper.c               |  73 ++++++++++++++
 5 files changed, 208 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 6e4f676a42..b04aefe3ed 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1061,3 +1061,12 @@ INSN_LSX(vmod_bu,          vvv)
 INSN_LSX(vmod_hu,          vvv)
 INSN_LSX(vmod_wu,          vvv)
 INSN_LSX(vmod_du,          vvv)
+
+INSN_LSX(vsat_b,           vv_i)
+INSN_LSX(vsat_h,           vv_i)
+INSN_LSX(vsat_w,           vv_i)
+INSN_LSX(vsat_d,           vv_i)
+INSN_LSX(vsat_bu,          vv_i)
+INSN_LSX(vsat_hu,          vv_i)
+INSN_LSX(vsat_wu,          vv_i)
+INSN_LSX(vsat_du,          vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index e46f12cb65..6345b7ef9c 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -335,3 +335,12 @@ DEF_HELPER_4(vmod_bu, void, env, i32, i32, i32)
 DEF_HELPER_4(vmod_hu, void, env, i32, i32, i32)
 DEF_HELPER_4(vmod_wu, void, env, i32, i32, i32)
 DEF_HELPER_4(vmod_du, void, env, i32, i32, i32)
+
+DEF_HELPER_FLAGS_4(vsat_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vsat_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vsat_w, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vsat_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vsat_bu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vsat_hu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vsat_wu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vsat_du, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 46a18da6dd..7dfb3b33f6 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2382,3 +2382,108 @@ TRANS(vmod_bu, gen_vvv, gen_helper_vmod_bu)
 TRANS(vmod_hu, gen_vvv, gen_helper_vmod_hu)
 TRANS(vmod_wu, gen_vvv, gen_helper_vmod_wu)
 TRANS(vmod_du, gen_vvv, gen_helper_vmod_du)
+
+static void gen_vsat_s(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    TCGv_vec t1;
+    int64_t max  = (1l << imm) - 1;
+    int64_t min =  ~max;
+
+    t1 = tcg_temp_new_vec_matching(t);
+    tcg_gen_dupi_vec(vece, t, min);
+    tcg_gen_smax_vec(vece, t, a, t);
+    tcg_gen_dupi_vec(vece, t1, max);
+    tcg_gen_smin_vec(vece, t, t, t1);
+}
+
+static void do_vsat_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                      int64_t imm, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_smax_vec, INDEX_op_smin_vec, 0
+        };
+    static const GVecGen2i op[4] = {
+        {
+            .fniv = gen_vsat_s,
+            .fnoi = gen_helper_vsat_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vsat_s,
+            .fnoi = gen_helper_vsat_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vsat_s,
+            .fnoi = gen_helper_vsat_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vsat_s,
+            .fnoi = gen_helper_vsat_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, imm, &op[vece]);
+}
+
+TRANS(vsat_b, gvec_vv_i, MO_8, do_vsat_s)
+TRANS(vsat_h, gvec_vv_i, MO_16, do_vsat_s)
+TRANS(vsat_w, gvec_vv_i, MO_32, do_vsat_s)
+TRANS(vsat_d, gvec_vv_i, MO_64, do_vsat_s)
+
+static void gen_vsat_u(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    uint64_t max;
+
+    max = (imm == 0x3f) ? UINT64_MAX : (1ul << (imm + 1)) - 1;
+
+    tcg_gen_dupi_vec(vece, t, max);
+    tcg_gen_umin_vec(vece, t, a, t);
+}
+
+static void do_vsat_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                       int64_t imm, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_umin_vec, 0
+        };
+    static const GVecGen2i op[4] = {
+        {
+            .fniv = gen_vsat_u,
+            .fnoi = gen_helper_vsat_bu,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vsat_u,
+            .fnoi = gen_helper_vsat_hu,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vsat_u,
+            .fnoi = gen_helper_vsat_wu,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vsat_u,
+            .fnoi = gen_helper_vsat_du,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, imm, &op[vece]);
+}
+
+TRANS(vsat_bu, gvec_vv_i, MO_8, do_vsat_u)
+TRANS(vsat_hu, gvec_vv_i, MO_16, do_vsat_u)
+TRANS(vsat_wu, gvec_vv_i, MO_32, do_vsat_u)
+TRANS(vsat_du, gvec_vv_i, MO_64, do_vsat_u)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 67d016edb7..3ed61b3d68 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -499,7 +499,10 @@ dbcl             0000 00000010 10101 ...............      @i15
 #
 @vv               .... ........ ..... ..... vj:5 vd:5    &vv
 @vvv               .... ........ ..... vk:5 vj:5 vd:5    &vvv
+@vv_ui3        .... ........ ..... .. imm:3 vj:5 vd:5    &vv_i
+@vv_ui4         .... ........ ..... . imm:4 vj:5 vd:5    &vv_i
 @vv_ui5           .... ........ ..... imm:5 vj:5 vd:5    &vv_i
+@vv_ui6            .... ........ .... imm:6 vj:5 vd:5    &vv_i
 @vv_i5           .... ........ ..... imm:s5 vj:5 vd:5    &vv_i
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
@@ -757,3 +760,12 @@ vmod_bu          0111 00001110 01100 ..... ..... .....    @vvv
 vmod_hu          0111 00001110 01101 ..... ..... .....    @vvv
 vmod_wu          0111 00001110 01110 ..... ..... .....    @vvv
 vmod_du          0111 00001110 01111 ..... ..... .....    @vvv
+
+vsat_b           0111 00110010 01000 01 ... ..... .....   @vv_ui3
+vsat_h           0111 00110010 01000 1 .... ..... .....   @vv_ui4
+vsat_w           0111 00110010 01001 ..... ..... .....    @vv_ui5
+vsat_d           0111 00110010 0101 ...... ..... .....    @vv_ui6
+vsat_bu          0111 00110010 10000 01 ... ..... .....   @vv_ui3
+vsat_hu          0111 00110010 10000 1 .... ..... .....   @vv_ui4
+vsat_wu          0111 00110010 10001 ..... ..... .....    @vv_ui5
+vsat_du          0111 00110010 1001 ...... ..... .....    @vv_ui6
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 03a837fa74..15efc64e4e 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -763,3 +763,76 @@ DO_3OP(vmod_bu, 8, uint8_t, B, DO_REMU)
 DO_3OP(vmod_hu, 16, uint16_t, H, DO_REMU)
 DO_3OP(vmod_wu, 32, uint32_t, W, DO_REMU)
 DO_3OP(vmod_du, 64, uint64_t, D, DO_REMU)
+
+#define do_vsats(E, T)                      \
+static T do_vsats_ ## E(T s1, uint64_t imm) \
+{                                           \
+    T mask,top;                             \
+                                            \
+    mask = (1l << imm) - 1;                 \
+    top = s1 >> imm;                        \
+    if (top > 0) {                          \
+        return mask;                        \
+    } else if (top < -1) {                  \
+        return ~mask;                       \
+    } else {                                \
+        return s1;                          \
+    }                                       \
+}
+
+do_vsats(B, int8_t)
+do_vsats(H, int16_t)
+do_vsats(W, int32_t)
+do_vsats(D, int64_t)
+
+#define VSAT_S(NAME, BIT, E)                                    \
+void HELPER(NAME)(void *vd, void *vj, uint64_t imm, uint32_t v) \
+{                                                               \
+    int i;                                                      \
+    VReg *Vd = (VReg *)vd;                                      \
+    VReg *Vj = (VReg *)vj;                                      \
+                                                                \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                         \
+        Vd->E(i) = do_vsats_ ## E(Vj->E(i), imm);               \
+    }                                                           \
+}
+
+VSAT_S(vsat_b, 8, B)
+VSAT_S(vsat_h, 16, H)
+VSAT_S(vsat_w, 32, W)
+VSAT_S(vsat_d, 64, D)
+
+#define do_vsatu(E, T)                                         \
+static T do_vsatu_ ## E(T s1, uint64_t imm)                    \
+{                                                              \
+    uint64_t max;                                              \
+                                                               \
+    max = (imm == 0x3f) ? UINT64_MAX : (1ul << (imm + 1)) - 1; \
+    if (s1 >(T)max) {                                          \
+        return (T)max;                                         \
+    } else {                                                   \
+        return s1;                                             \
+    }                                                          \
+}
+
+do_vsatu(B, uint8_t)
+do_vsatu(H, uint16_t)
+do_vsatu(W, uint32_t)
+do_vsatu(D, uint64_t)
+
+#define VSAT_U(NAME, BIT, T, E)                                 \
+void HELPER(NAME)(void *vd, void *vj, uint64_t imm, uint32_t v) \
+{                                                               \
+    int i;                                                      \
+    VReg *Vd = (VReg *)vd;                                      \
+    VReg *Vj = (VReg *)vj;                                      \
+                                                                \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                         \
+        Vd->E(i) = do_vsatu_ ## E((T)Vj->E(i), imm);            \
+    }                                                           \
+}
+
+VSAT_U(vsat_bu, 8, uint8_t, B)
+VSAT_U(vsat_hu, 16, uint16_t, H)
+VSAT_U(vsat_wu, 32, uint32_t, W)
+VSAT_U(vsat_du, 64, uint64_t, D)
-- 
2.31.1


