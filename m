Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDA46E8C73
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:14:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPKZ-00046d-KI; Thu, 20 Apr 2023 04:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1ppPKI-0003x0-Hc
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:07:34 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1ppPKG-000827-Fr
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:07:34 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxUOW38kBkVmUfAA--.49134S3;
 Thu, 20 Apr 2023 16:07:19 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxur2u8kBkdNUwAA--.59556S14; 
 Thu, 20 Apr 2023 16:07:19 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [RFC PATCH v3 12/44] target/loongarch: Implement vadda
Date: Thu, 20 Apr 2023 16:06:37 +0800
Message-Id: <20230420080709.3352575-13-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230420080709.3352575-1-gaosong@loongson.cn>
References: <20230420080709.3352575-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxur2u8kBkdNUwAA--.59556S14
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxuF1rArWxKF4kGw15tw18Xwb_yoW7JF4kpF
 yakry7GF48GrZrXrnaqa15WF4UXrs3Gw1S9anaqa93uF4UXF1kZFWkt34v9F4UXan7ZFyj
 vF10k34YgrZ3WwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0xFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xAC
 xx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx2
 6rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
 14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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
- VADDA.{B/H/W/D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  5 ++
 target/loongarch/helper.h                   |  5 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 53 +++++++++++++++++++++
 target/loongarch/insns.decode               |  5 ++
 target/loongarch/lsx_helper.c               | 19 ++++++++
 5 files changed, 87 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index e98ea37793..1f61e67d1f 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -934,3 +934,8 @@ INSN_LSX(vabsd_bu,         vvv)
 INSN_LSX(vabsd_hu,         vvv)
 INSN_LSX(vabsd_wu,         vvv)
 INSN_LSX(vabsd_du,         vvv)
+
+INSN_LSX(vadda_b,          vvv)
+INSN_LSX(vadda_h,          vvv)
+INSN_LSX(vadda_w,          vvv)
+INSN_LSX(vadda_d,          vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index c3a5d2566e..85fb8f60d2 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -220,3 +220,8 @@ DEF_HELPER_FLAGS_4(vabsd_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vabsd_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vabsd_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vabsd_du, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vadda_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vadda_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vadda_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vadda_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 0e9301bf93..8ad81c8517 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -1261,3 +1261,56 @@ TRANS(vabsd_bu, gvec_vvv, MO_8, do_vabsd_u)
 TRANS(vabsd_hu, gvec_vvv, MO_16, do_vabsd_u)
 TRANS(vabsd_wu, gvec_vvv, MO_32, do_vabsd_u)
 TRANS(vabsd_du, gvec_vvv, MO_64, do_vabsd_u)
+
+static void gen_vadda(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+
+    tcg_gen_abs_vec(vece, t1, a);
+    tcg_gen_abs_vec(vece, t2, b);
+    tcg_gen_add_vec(vece, t, t1, t2);
+}
+
+static void do_vadda(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                     uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_abs_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vadda,
+            .fno = gen_helper_vadda_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vadda,
+            .fno = gen_helper_vadda_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vadda,
+            .fno = gen_helper_vadda_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vadda,
+            .fno = gen_helper_vadda_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vadda_b, gvec_vvv, MO_8, do_vadda)
+TRANS(vadda_h, gvec_vvv, MO_16, do_vadda)
+TRANS(vadda_w, gvec_vvv, MO_32, do_vadda)
+TRANS(vadda_d, gvec_vvv, MO_64, do_vadda)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 825ddedf4d..6cb22f9297 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -628,3 +628,8 @@ vabsd_bu         0111 00000110 00100 ..... ..... .....    @vvv
 vabsd_hu         0111 00000110 00101 ..... ..... .....    @vvv
 vabsd_wu         0111 00000110 00110 ..... ..... .....    @vvv
 vabsd_du         0111 00000110 00111 ..... ..... .....    @vvv
+
+vadda_b          0111 00000101 11000 ..... ..... .....    @vvv
+vadda_h          0111 00000101 11001 ..... ..... .....    @vvv
+vadda_w          0111 00000101 11010 ..... ..... .....    @vvv
+vadda_d          0111 00000101 11011 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index f0baffa9e3..8230fe2ed5 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -318,3 +318,22 @@ DO_3OP(vabsd_bu, 8, UB, DO_VABSD)
 DO_3OP(vabsd_hu, 16, UH, DO_VABSD)
 DO_3OP(vabsd_wu, 32, UW, DO_VABSD)
 DO_3OP(vabsd_du, 64, UD, DO_VABSD)
+
+#define DO_VABS(a)  ((a < 0) ? (-a) : (a))
+
+#define DO_VADDA(NAME, BIT, E, DO_OP)                       \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v) \
+{                                                           \
+    int i;                                                  \
+    VReg *Vd = (VReg *)vd;                                  \
+    VReg *Vj = (VReg *)vj;                                  \
+    VReg *Vk = (VReg *)vk;                                  \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                     \
+        Vd->E(i) = DO_OP(Vj->E(i)) + DO_OP(Vk->E(i));       \
+    }                                                       \
+}
+
+DO_VADDA(vadda_b, 8, B, DO_VABS)
+DO_VADDA(vadda_h, 16, H, DO_VABS)
+DO_VADDA(vadda_w, 32, W, DO_VABS)
+DO_VADDA(vadda_d, 64, D, DO_VABS)
-- 
2.31.1


