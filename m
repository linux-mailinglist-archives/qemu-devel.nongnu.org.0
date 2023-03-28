Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D786CB47F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:08:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzfz-0007I5-IT; Mon, 27 Mar 2023 23:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzfm-0007Fr-4x
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:59 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzfj-0000Vg-6v
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:57 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxYeXCWSJkbdoSAA--.29050S3;
 Tue, 28 Mar 2023 11:06:42 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S22; 
 Tue, 28 Mar 2023 11:06:42 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 20/44] target/loongarch: Implement vsigncov
Date: Tue, 28 Mar 2023 11:06:07 +0800
Message-Id: <20230328030631.3117129-21-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S22
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKFWxZFWrurW5tF1rJr15twb_yoW7Gw1kpr
 42yr17Gay8JFWfXr9Yva15ua1DXrs3Cw42vwsxK3Z8urZrXFyDZr1kta9FkFW8Xa1kZa40
 g3ZIyryYya95XwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
 CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
- VSIGNCOV.{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  5 ++
 target/loongarch/helper.h                   |  5 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 54 +++++++++++++++++++++
 target/loongarch/insns.decode               |  5 ++
 target/loongarch/lsx_helper.c               | 19 ++++++++
 5 files changed, 88 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 412c1cedcb..46e808c321 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1079,3 +1079,8 @@ INSN_LSX(vexth_hu_bu,      vv)
 INSN_LSX(vexth_wu_hu,      vv)
 INSN_LSX(vexth_du_wu,      vv)
 INSN_LSX(vexth_qu_du,      vv)
+
+INSN_LSX(vsigncov_b,       vvv)
+INSN_LSX(vsigncov_h,       vvv)
+INSN_LSX(vsigncov_w,       vvv)
+INSN_LSX(vsigncov_d,       vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 0876aa3331..a7394b2eb7 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -353,3 +353,8 @@ DEF_HELPER_3(vexth_hu_bu, void, env, i32, i32)
 DEF_HELPER_3(vexth_wu_hu, void, env, i32, i32)
 DEF_HELPER_3(vexth_du_wu, void, env, i32, i32)
 DEF_HELPER_3(vexth_qu_du, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_4(vsigncov_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsigncov_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsigncov_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsigncov_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index f6058c1360..865485ea10 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2507,3 +2507,57 @@ TRANS(vexth_hu_bu, gen_vv, gen_helper_vexth_hu_bu)
 TRANS(vexth_wu_hu, gen_vv, gen_helper_vexth_wu_hu)
 TRANS(vexth_du_wu, gen_vv, gen_helper_vexth_du_wu)
 TRANS(vexth_qu_du, gen_vv, gen_helper_vexth_qu_du)
+
+static void gen_vsigncov(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+
+    t1 = tcg_temp_new_vec_matching(t);
+    t2 = tcg_temp_new_vec_matching(t);
+
+    tcg_gen_neg_vec(vece, t1, b);
+    tcg_gen_dupi_vec(vece, t2, 0);
+    tcg_gen_cmpsel_vec(TCG_COND_LT, vece, t, a, t2, t1, b);
+    tcg_gen_cmpsel_vec(TCG_COND_EQ, vece, t, a, t2, t2, t);
+}
+
+static void do_vsigncov(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                        uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_neg_vec, INDEX_op_cmpsel_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vsigncov,
+            .fno = gen_helper_vsigncov_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vsigncov,
+            .fno = gen_helper_vsigncov_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vsigncov,
+            .fno = gen_helper_vsigncov_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vsigncov,
+            .fno = gen_helper_vsigncov_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vsigncov_b, gvec_vvv, MO_8, do_vsigncov)
+TRANS(vsigncov_h, gvec_vvv, MO_16, do_vsigncov)
+TRANS(vsigncov_w, gvec_vvv, MO_32, do_vsigncov)
+TRANS(vsigncov_d, gvec_vvv, MO_64, do_vsigncov)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 39c582d098..4233dd7404 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -778,3 +778,8 @@ vexth_hu_bu      0111 00101001 11101 11100 ..... .....    @vv
 vexth_wu_hu      0111 00101001 11101 11101 ..... .....    @vv
 vexth_du_wu      0111 00101001 11101 11110 ..... .....    @vv
 vexth_qu_du      0111 00101001 11101 11111 ..... .....    @vv
+
+vsigncov_b       0111 00010010 11100 ..... ..... .....    @vvv
+vsigncov_h       0111 00010010 11101 ..... ..... .....    @vvv
+vsigncov_w       0111 00010010 11110 ..... ..... .....    @vvv
+vsigncov_d       0111 00010010 11111 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 9a0b358576..b3a9b8cb66 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -871,3 +871,22 @@ VEXTH(vexth_d_w, 64, int64_t, int32_t, D, W)
 VEXTH(vexth_hu_bu, 16, uint16_t, uint8_t, H, B)
 VEXTH(vexth_wu_hu, 32, uint32_t, uint16_t, W, H)
 VEXTH(vexth_du_wu, 64, uint64_t, uint32_t, D, W)
+
+#define DO_SIGNCOV(a, b)  (a == 0 ? 0 : a < 0 ? -b : b)
+
+#define VSIGNCOV(NAME, BIT, E, DO_OP)                       \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v) \
+{                                                           \
+    int i;                                                  \
+    VReg *Vd = (VReg *)vd;                                  \
+    VReg *Vj = (VReg *)vj;                                  \
+    VReg *Vk = (VReg *)vk;                                  \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                     \
+        Vd->E(i) = DO_OP(Vj->E(i),  Vk->E(i));              \
+    }                                                       \
+}
+
+VSIGNCOV(vsigncov_b, 8, B, DO_SIGNCOV)
+VSIGNCOV(vsigncov_h, 16, H, DO_SIGNCOV)
+VSIGNCOV(vsigncov_w, 32, W, DO_SIGNCOV)
+VSIGNCOV(vsigncov_d, 64, D, DO_SIGNCOV)
-- 
2.31.1


