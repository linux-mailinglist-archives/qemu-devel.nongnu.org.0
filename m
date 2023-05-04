Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D446F6BFF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:34:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puY7y-0006PO-7J; Thu, 04 May 2023 08:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puY6K-0005CM-3W
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:30:25 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puY6C-0003UY-HX
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:30:22 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxqOnlpFNkqKAEAA--.7629S3;
 Thu, 04 May 2023 20:28:21 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77PapFNk1uxJAA--.5674S21; 
 Thu, 04 May 2023 20:28:20 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [PATCH v5 19/44] target/loongarch: Implement vsigncov
Date: Thu,  4 May 2023 20:27:45 +0800
Message-Id: <20230504122810.4094787-20-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230504122810.4094787-1-gaosong@loongson.cn>
References: <20230504122810.4094787-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77PapFNk1uxJAA--.5674S21
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWr1rtr45Zry5ZrW8Xw4rAFb_yoWrKrykpr
 12yr17Gay8tFZ3XrnYva15ua1qqrs3Gw42van3K3Z8urZrXFyDZr1kta9FgFW8Xa1kZa40
 g3WayryYva9YqwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
 0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCF
 FI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv
 8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
 67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
- VSIGNCOV.{B/H/W/D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  5 ++
 target/loongarch/helper.h                   |  5 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 53 +++++++++++++++++++++
 target/loongarch/insns.decode               |  5 ++
 target/loongarch/lsx_helper.c               |  7 +++
 5 files changed, 75 insertions(+)

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
index 005988be25..e1e5d58697 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -338,3 +338,8 @@ DEF_HELPER_3(vexth_hu_bu, void, env, i32, i32)
 DEF_HELPER_3(vexth_wu_hu, void, env, i32, i32)
 DEF_HELPER_3(vexth_du_wu, void, env, i32, i32)
 DEF_HELPER_3(vexth_qu_du, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_4(vsigncov_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsigncov_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsigncov_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsigncov_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 93ae76bc4c..644917a695 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2814,3 +2814,56 @@ TRANS(vexth_hu_bu, gen_vv, gen_helper_vexth_hu_bu)
 TRANS(vexth_wu_hu, gen_vv, gen_helper_vexth_wu_hu)
 TRANS(vexth_du_wu, gen_vv, gen_helper_vexth_du_wu)
 TRANS(vexth_qu_du, gen_vv, gen_helper_vexth_qu_du)
+
+static void gen_vsigncov(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, zero;
+
+    t1 = tcg_temp_new_vec_matching(t);
+    zero = tcg_constant_vec_matching(t, vece, 0);
+
+    tcg_gen_neg_vec(vece, t1, b);
+    tcg_gen_cmpsel_vec(TCG_COND_LT, vece, t, a, zero, t1, b);
+    tcg_gen_cmpsel_vec(TCG_COND_EQ, vece, t, a, zero, zero, t);
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
index b4582a49d9..408815ea45 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -662,3 +662,10 @@ VEXTH(vexth_d_w, 64, D, W)
 VEXTH(vexth_hu_bu, 16, UH, UB)
 VEXTH(vexth_wu_hu, 32, UW, UH)
 VEXTH(vexth_du_wu, 64, UD, UW)
+
+#define DO_SIGNCOV(a, b)  (a == 0 ? 0 : a < 0 ? -b : b)
+
+DO_3OP(vsigncov_b, 8, B, DO_SIGNCOV)
+DO_3OP(vsigncov_h, 16, H, DO_SIGNCOV)
+DO_3OP(vsigncov_w, 32, W, DO_SIGNCOV)
+DO_3OP(vsigncov_d, 64, D, DO_SIGNCOV)
-- 
2.31.1


