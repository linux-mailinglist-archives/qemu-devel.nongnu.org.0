Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261F06CB4BB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:16:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzgv-0001id-Fa; Mon, 27 Mar 2023 23:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzgs-0001Uj-EW
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:08:06 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzgq-0001tZ-0R
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:08:06 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxJMS9WSJkTNoSAA--.17543S3;
 Tue, 28 Mar 2023 11:06:37 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S11; 
 Tue, 28 Mar 2023 11:06:35 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 09/44] target/loongarch: Implement vhaddw/vhsubw
Date: Tue, 28 Mar 2023 11:05:56 +0800
Message-Id: <20230328030631.3117129-10-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S11
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JrWDtFykKr1DAF15CFWfKrg_yoWfGF1rpa
 12kr1UKF48JFZ7JF1S9w43KanFgrsrK3W7uw4rt3WUXFW7XF1DXryvqw4F9anrWan3WFy0
 g3ZxA342vFyrJa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
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
- VHADDW.{H.B/W.H/D.W/Q.D/HU.BU/WU.HU/DU.WU/QU.DU};
- VHSUBW.{H.B/W.H/D.W/Q.D/HU.BU/WU.HU/DU.WU/QU.DU}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 17 ++++
 target/loongarch/helper.h                   | 17 ++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 17 ++++
 target/loongarch/insns.decode               | 17 ++++
 target/loongarch/lsx_helper.c               | 89 +++++++++++++++++++++
 5 files changed, 157 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index b7f9320ba0..adfd693938 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -848,3 +848,20 @@ INSN_LSX(vssub_bu,         vvv)
 INSN_LSX(vssub_hu,         vvv)
 INSN_LSX(vssub_wu,         vvv)
 INSN_LSX(vssub_du,         vvv)
+
+INSN_LSX(vhaddw_h_b,       vvv)
+INSN_LSX(vhaddw_w_h,       vvv)
+INSN_LSX(vhaddw_d_w,       vvv)
+INSN_LSX(vhaddw_q_d,       vvv)
+INSN_LSX(vhaddw_hu_bu,     vvv)
+INSN_LSX(vhaddw_wu_hu,     vvv)
+INSN_LSX(vhaddw_du_wu,     vvv)
+INSN_LSX(vhaddw_qu_du,     vvv)
+INSN_LSX(vhsubw_h_b,       vvv)
+INSN_LSX(vhsubw_w_h,       vvv)
+INSN_LSX(vhsubw_d_w,       vvv)
+INSN_LSX(vhsubw_q_d,       vvv)
+INSN_LSX(vhsubw_hu_bu,     vvv)
+INSN_LSX(vhsubw_wu_hu,     vvv)
+INSN_LSX(vhsubw_du_wu,     vvv)
+INSN_LSX(vhsubw_qu_du,     vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 13390c07d6..040f12c92c 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -134,3 +134,20 @@ DEF_HELPER_1(idle, void, env)
 /* LoongArch LSX  */
 DEF_HELPER_4(vadd_q, void, env, i32, i32, i32)
 DEF_HELPER_4(vsub_q, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vhaddw_h_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vhaddw_w_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vhaddw_d_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vhaddw_q_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vhaddw_hu_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vhaddw_wu_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vhaddw_du_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vhaddw_qu_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_h_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_w_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_d_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_q_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_hu_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_wu_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_du_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_qu_du, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 0bf4759a0f..d8b8c2a5ea 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -128,3 +128,20 @@ TRANS(vssub_bu, gvec_vvv, MO_8, tcg_gen_gvec_ussub)
 TRANS(vssub_hu, gvec_vvv, MO_16, tcg_gen_gvec_ussub)
 TRANS(vssub_wu, gvec_vvv, MO_32, tcg_gen_gvec_ussub)
 TRANS(vssub_du, gvec_vvv, MO_64, tcg_gen_gvec_ussub)
+
+TRANS(vhaddw_h_b, gen_vvv, gen_helper_vhaddw_h_b)
+TRANS(vhaddw_w_h, gen_vvv, gen_helper_vhaddw_w_h)
+TRANS(vhaddw_d_w, gen_vvv, gen_helper_vhaddw_d_w)
+TRANS(vhaddw_q_d, gen_vvv, gen_helper_vhaddw_q_d)
+TRANS(vhaddw_hu_bu, gen_vvv, gen_helper_vhaddw_hu_bu)
+TRANS(vhaddw_wu_hu, gen_vvv, gen_helper_vhaddw_wu_hu)
+TRANS(vhaddw_du_wu, gen_vvv, gen_helper_vhaddw_du_wu)
+TRANS(vhaddw_qu_du, gen_vvv, gen_helper_vhaddw_qu_du)
+TRANS(vhsubw_h_b, gen_vvv, gen_helper_vhsubw_h_b)
+TRANS(vhsubw_w_h, gen_vvv, gen_helper_vhsubw_w_h)
+TRANS(vhsubw_d_w, gen_vvv, gen_helper_vhsubw_d_w)
+TRANS(vhsubw_q_d, gen_vvv, gen_helper_vhsubw_q_d)
+TRANS(vhsubw_hu_bu, gen_vvv, gen_helper_vhsubw_hu_bu)
+TRANS(vhsubw_wu_hu, gen_vvv, gen_helper_vhsubw_wu_hu)
+TRANS(vhsubw_du_wu, gen_vvv, gen_helper_vhsubw_du_wu)
+TRANS(vhsubw_qu_du, gen_vvv, gen_helper_vhsubw_qu_du)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 3a29f0a9ab..10a20858e5 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -542,3 +542,20 @@ vssub_bu         0111 00000100 11000 ..... ..... .....    @vvv
 vssub_hu         0111 00000100 11001 ..... ..... .....    @vvv
 vssub_wu         0111 00000100 11010 ..... ..... .....    @vvv
 vssub_du         0111 00000100 11011 ..... ..... .....    @vvv
+
+vhaddw_h_b       0111 00000101 01000 ..... ..... .....    @vvv
+vhaddw_w_h       0111 00000101 01001 ..... ..... .....    @vvv
+vhaddw_d_w       0111 00000101 01010 ..... ..... .....    @vvv
+vhaddw_q_d       0111 00000101 01011 ..... ..... .....    @vvv
+vhaddw_hu_bu     0111 00000101 10000 ..... ..... .....    @vvv
+vhaddw_wu_hu     0111 00000101 10001 ..... ..... .....    @vvv
+vhaddw_du_wu     0111 00000101 10010 ..... ..... .....    @vvv
+vhaddw_qu_du     0111 00000101 10011 ..... ..... .....    @vvv
+vhsubw_h_b       0111 00000101 01100 ..... ..... .....    @vvv
+vhsubw_w_h       0111 00000101 01101 ..... ..... .....    @vvv
+vhsubw_d_w       0111 00000101 01110 ..... ..... .....    @vvv
+vhsubw_q_d       0111 00000101 01111 ..... ..... .....    @vvv
+vhsubw_hu_bu     0111 00000101 10100 ..... ..... .....    @vvv
+vhsubw_wu_hu     0111 00000101 10101 ..... ..... .....    @vvv
+vhsubw_du_wu     0111 00000101 10110 ..... ..... .....    @vvv
+vhsubw_qu_du     0111 00000101 10111 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index edd6e99b23..0eb37dda7a 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -29,3 +29,92 @@ void helper_vsub_q(CPULoongArchState *env,
 
     Vd->Q(0) = int128_sub(Vj->Q(0), Vk->Q(0));
 }
+
+#define DO_ADD(a, b)  (a + b)
+#define DO_SUB(a, b)  (a - b)
+
+#define DO_ODD_EVEN_S(NAME, BIT, T, E1, E2, DO_OP)                 \
+void HELPER(NAME)(CPULoongArchState *env,                          \
+                  uint32_t vd, uint32_t vj, uint32_t vk)           \
+{                                                                  \
+    int i;                                                         \
+    VReg *Vd = &(env->fpr[vd].vreg);                               \
+    VReg *Vj = &(env->fpr[vj].vreg);                               \
+    VReg *Vk = &(env->fpr[vk].vreg);                               \
+                                                                   \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                            \
+        Vd->E1(i) = DO_OP((T)Vj->E2(2 * i + 1), (T)Vk->E2(2 * i)); \
+    }                                                              \
+}
+
+DO_ODD_EVEN_S(vhaddw_h_b, 16, int16_t, H, B, DO_ADD)
+DO_ODD_EVEN_S(vhaddw_w_h, 32, int32_t, W, H, DO_ADD)
+DO_ODD_EVEN_S(vhaddw_d_w, 64, int64_t, D, W, DO_ADD)
+
+void HELPER(vhaddw_q_d)(CPULoongArchState *env,
+                        uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    VReg *Vk = &(env->fpr[vk].vreg);
+
+    Vd->Q(0) = int128_add(int128_makes64(Vj->D(1)), int128_makes64(Vk->D(0)));
+}
+
+DO_ODD_EVEN_S(vhsubw_h_b, 16, int16_t, H, B, DO_SUB)
+DO_ODD_EVEN_S(vhsubw_w_h, 32, int32_t, W, H, DO_SUB)
+DO_ODD_EVEN_S(vhsubw_d_w, 64, int64_t, D, W, DO_SUB)
+
+void HELPER(vhsubw_q_d)(CPULoongArchState *env,
+                        uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    VReg *Vk = &(env->fpr[vk].vreg);
+
+    Vd->Q(0) = int128_sub(int128_makes64(Vj->D(1)), int128_makes64(Vk->D(0)));
+}
+
+#define DO_ODD_EVEN_U(NAME, BIT, TD, TS,  E1, E2, DO_OP)                     \
+void HELPER(NAME)(CPULoongArchState *env,                                    \
+                  uint32_t vd, uint32_t vj, uint32_t vk)                     \
+{                                                                            \
+    int i;                                                                   \
+    VReg *Vd = &(env->fpr[vd].vreg);                                         \
+    VReg *Vj = &(env->fpr[vj].vreg);                                         \
+    VReg *Vk = &(env->fpr[vk].vreg);                                         \
+                                                                             \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                      \
+        Vd->E1(i) = DO_OP((TD)(TS)Vj->E2(2 * i + 1), (TD)(TS)Vk->E2(2 * i)); \
+    }                                                                        \
+}
+
+DO_ODD_EVEN_U(vhaddw_hu_bu, 16, uint16_t, uint8_t, H, B, DO_ADD)
+DO_ODD_EVEN_U(vhaddw_wu_hu, 32, uint32_t, uint16_t, W, H, DO_ADD)
+DO_ODD_EVEN_U(vhaddw_du_wu, 64, uint64_t, uint32_t, D, W, DO_ADD)
+
+void HELPER(vhaddw_qu_du)(CPULoongArchState *env,
+                          uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    VReg *Vk = &(env->fpr[vk].vreg);
+
+    Vd->Q(0) = int128_add(int128_make64((uint64_t)Vj->D(1)),
+                          int128_make64((uint64_t)Vk->D(0)));
+}
+
+DO_ODD_EVEN_U(vhsubw_hu_bu, 16, uint16_t, uint8_t, H, B, DO_SUB)
+DO_ODD_EVEN_U(vhsubw_wu_hu, 32, uint32_t, uint16_t, W, H, DO_SUB)
+DO_ODD_EVEN_U(vhsubw_du_wu, 64, uint64_t, uint32_t, D, W, DO_SUB)
+
+void HELPER(vhsubw_qu_du)(CPULoongArchState *env,
+                          uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    VReg *Vk = &(env->fpr[vk].vreg);
+
+    Vd->Q(0) = int128_sub(int128_make64((uint64_t)Vj->D(1)),
+                          int128_make64((uint64_t)Vk->D(0)));
+}
-- 
2.31.1


