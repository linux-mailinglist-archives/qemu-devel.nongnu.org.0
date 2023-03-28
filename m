Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611B06CB4AB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:13:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzff-0007Ej-HM; Mon, 27 Mar 2023 23:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzfb-0007DP-T2
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:47 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzfW-0000Oo-EE
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:47 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Bxedm9WSJkTtoSAA--.28809S3;
 Tue, 28 Mar 2023 11:06:37 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S12; 
 Tue, 28 Mar 2023 11:06:36 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 10/44] target/loongarch: Implement vaddw/vsubw
Date: Tue, 28 Mar 2023 11:05:57 +0800
Message-Id: <20230328030631.3117129-11-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S12
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoWfur13try7ZFWkWF1fWrWUCFg_yoWrJrW8Wo
 ZrGw45AryxKr4a9r1Uua97XF4xtrW0vayDAayqvr4aqF1rJFy7trn8Ka4DJayIyr4S9F9x
 JF9IyF4fA3Z0gryDn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqv1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
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
- VADDW{EV/OD}.{H.B/W.H/D.W/Q.D}[U];
- VSUBW{EV/OD}.{H.B/W.H/D.W/Q.D}[U];
- VADDW{EV/OD}.{H.BU.B/W.HU.H/D.WU.W/Q.DU.D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  43 +
 target/loongarch/helper.h                   |  45 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 832 ++++++++++++++++++++
 target/loongarch/insns.decode               |  43 +
 target/loongarch/lsx_helper.c               | 210 +++++
 5 files changed, 1173 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index adfd693938..8ee14916f3 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -865,3 +865,46 @@ INSN_LSX(vhsubw_hu_bu,     vvv)
 INSN_LSX(vhsubw_wu_hu,     vvv)
 INSN_LSX(vhsubw_du_wu,     vvv)
 INSN_LSX(vhsubw_qu_du,     vvv)
+
+INSN_LSX(vaddwev_h_b,      vvv)
+INSN_LSX(vaddwev_w_h,      vvv)
+INSN_LSX(vaddwev_d_w,      vvv)
+INSN_LSX(vaddwev_q_d,      vvv)
+INSN_LSX(vaddwod_h_b,      vvv)
+INSN_LSX(vaddwod_w_h,      vvv)
+INSN_LSX(vaddwod_d_w,      vvv)
+INSN_LSX(vaddwod_q_d,      vvv)
+INSN_LSX(vsubwev_h_b,      vvv)
+INSN_LSX(vsubwev_w_h,      vvv)
+INSN_LSX(vsubwev_d_w,      vvv)
+INSN_LSX(vsubwev_q_d,      vvv)
+INSN_LSX(vsubwod_h_b,      vvv)
+INSN_LSX(vsubwod_w_h,      vvv)
+INSN_LSX(vsubwod_d_w,      vvv)
+INSN_LSX(vsubwod_q_d,      vvv)
+
+INSN_LSX(vaddwev_h_bu,     vvv)
+INSN_LSX(vaddwev_w_hu,     vvv)
+INSN_LSX(vaddwev_d_wu,     vvv)
+INSN_LSX(vaddwev_q_du,     vvv)
+INSN_LSX(vaddwod_h_bu,     vvv)
+INSN_LSX(vaddwod_w_hu,     vvv)
+INSN_LSX(vaddwod_d_wu,     vvv)
+INSN_LSX(vaddwod_q_du,     vvv)
+INSN_LSX(vsubwev_h_bu,     vvv)
+INSN_LSX(vsubwev_w_hu,     vvv)
+INSN_LSX(vsubwev_d_wu,     vvv)
+INSN_LSX(vsubwev_q_du,     vvv)
+INSN_LSX(vsubwod_h_bu,     vvv)
+INSN_LSX(vsubwod_w_hu,     vvv)
+INSN_LSX(vsubwod_d_wu,     vvv)
+INSN_LSX(vsubwod_q_du,     vvv)
+
+INSN_LSX(vaddwev_h_bu_b,   vvv)
+INSN_LSX(vaddwev_w_hu_h,   vvv)
+INSN_LSX(vaddwev_d_wu_w,   vvv)
+INSN_LSX(vaddwev_q_du_d,   vvv)
+INSN_LSX(vaddwod_h_bu_b,   vvv)
+INSN_LSX(vaddwod_w_hu_h,   vvv)
+INSN_LSX(vaddwod_d_wu_w,   vvv)
+INSN_LSX(vaddwod_q_du_d,   vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 040f12c92c..566d9b6293 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -151,3 +151,48 @@ DEF_HELPER_4(vhsubw_hu_bu, void, env, i32, i32, i32)
 DEF_HELPER_4(vhsubw_wu_hu, void, env, i32, i32, i32)
 DEF_HELPER_4(vhsubw_du_wu, void, env, i32, i32, i32)
 DEF_HELPER_4(vhsubw_qu_du, void, env, i32, i32, i32)
+
+DEF_HELPER_FLAGS_4(vaddwev_h_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwev_w_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwev_d_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwev_q_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwod_h_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwod_w_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwod_d_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwod_q_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vsubwev_h_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsubwev_w_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsubwev_d_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsubwev_q_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsubwod_h_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsubwod_w_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsubwod_d_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsubwod_q_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vaddwev_h_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwev_w_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwev_d_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwev_q_du, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwod_h_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwod_w_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwod_d_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwod_q_du, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vsubwev_h_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsubwev_w_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsubwev_d_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsubwev_q_du, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsubwod_h_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsubwod_w_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsubwod_d_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vsubwod_q_du, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vaddwev_h_bu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwev_w_hu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwev_d_wu_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwev_q_du_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwod_h_bu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwod_w_hu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwod_d_wu_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vaddwod_q_du_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index d8b8c2a5ea..213a775490 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -145,3 +145,835 @@ TRANS(vhsubw_hu_bu, gen_vvv, gen_helper_vhsubw_hu_bu)
 TRANS(vhsubw_wu_hu, gen_vvv, gen_helper_vhsubw_wu_hu)
 TRANS(vhsubw_du_wu, gen_vvv, gen_helper_vhsubw_du_wu)
 TRANS(vhsubw_qu_du, gen_vvv, gen_helper_vhsubw_qu_du)
+
+static void gen_vaddwev_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+
+    /* Sign-extend the even elements from a */
+    tcg_gen_shli_vec(vece, t1, a, halfbits);
+    tcg_gen_sari_vec(vece, t1, t1, halfbits);
+
+    /* Sign-extend the even elements from b */
+    tcg_gen_shli_vec(vece, t2, b, halfbits);
+    tcg_gen_sari_vec(vece, t2, t2, halfbits);
+
+    tcg_gen_add_vec(vece, t, t1, t2);
+}
+
+static void gen_vaddwev_w_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_shli_i32(t1, a, 16);
+    tcg_gen_sari_i32(t1, t1, 16);
+    tcg_gen_shli_i32(t2, b, 16);
+    tcg_gen_sari_i32(t2, t2, 16);
+    tcg_gen_add_i32(t, t1, t2);
+}
+
+static void gen_vaddwev_d_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_shli_i64(t1, a, 32);
+    tcg_gen_sari_i64(t1, t1, 32);
+    tcg_gen_shli_i64(t2, b, 32);
+    tcg_gen_sari_i64(t2, t2, 32);
+    tcg_gen_add_i64(t, t1, t2);
+}
+
+static void do_vaddwev_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                         uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vaddwev_s,
+            .fno = gen_helper_vaddwev_h_b,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vaddwev_w_h,
+            .fniv = gen_vaddwev_s,
+            .fno = gen_helper_vaddwev_w_h,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vaddwev_d_w,
+            .fniv = gen_vaddwev_s,
+            .fno = gen_helper_vaddwev_d_w,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+        {
+            .fno = gen_helper_vaddwev_q_d,
+            .vece = MO_128
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vaddwev_h_b, gvec_vvv, MO_8, do_vaddwev_s)
+TRANS(vaddwev_w_h, gvec_vvv, MO_16, do_vaddwev_s)
+TRANS(vaddwev_d_w, gvec_vvv, MO_32, do_vaddwev_s)
+TRANS(vaddwev_q_d, gvec_vvv, MO_64, do_vaddwev_s)
+
+static void gen_vaddwod_w_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_sari_i32(t1, a, 16);
+    tcg_gen_sari_i32(t2, b, 16);
+    tcg_gen_add_i32(t, t1, t2);
+}
+
+static void gen_vaddwod_d_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_sari_i64(t1, a, 32);
+    tcg_gen_sari_i64(t2, b, 32);
+    tcg_gen_add_i64(t, t1, t2);
+}
+
+static void gen_vaddwod_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+
+    /* Sign-extend the odd elements for vector */
+    tcg_gen_sari_vec(vece, t1, a, halfbits);
+    tcg_gen_sari_vec(vece, t2, b, halfbits);
+
+    tcg_gen_add_vec(vece, t, t1, t2);
+}
+
+static void do_vaddwod_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                         uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_sari_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vaddwod_s,
+            .fno = gen_helper_vaddwod_h_b,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vaddwod_w_h,
+            .fniv = gen_vaddwod_s,
+            .fno = gen_helper_vaddwod_w_h,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vaddwod_d_w,
+            .fniv = gen_vaddwod_s,
+            .fno = gen_helper_vaddwod_d_w,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+        {
+            .fno = gen_helper_vaddwod_q_d,
+            .vece = MO_128
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vaddwod_h_b, gvec_vvv, MO_8, do_vaddwod_s)
+TRANS(vaddwod_w_h, gvec_vvv, MO_16, do_vaddwod_s)
+TRANS(vaddwod_d_w, gvec_vvv, MO_32, do_vaddwod_s)
+TRANS(vaddwod_q_d, gvec_vvv, MO_64, do_vaddwod_s)
+
+static void gen_vsubwev_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+
+    /* Sign-extend the even elements from a */
+    tcg_gen_shli_vec(vece, t1, a, halfbits);
+    tcg_gen_sari_vec(vece, t1, t1, halfbits);
+
+    /* Sign-extend the even elements from b */
+    tcg_gen_shli_vec(vece, t2, b, halfbits);
+    tcg_gen_sari_vec(vece, t2, t2, halfbits);
+
+    tcg_gen_sub_vec(vece, t, t1, t2);
+}
+
+static void gen_vsubwev_w_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_shli_i32(t1, a, 16);
+    tcg_gen_sari_i32(t1, t1, 16);
+    tcg_gen_shli_i32(t2, b, 16);
+    tcg_gen_sari_i32(t2, t2, 16);
+    tcg_gen_sub_i32(t, t1, t2);
+}
+
+static void gen_vsubwev_d_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_shli_i64(t1, a, 32);
+    tcg_gen_sari_i64(t1, t1, 32);
+    tcg_gen_shli_i64(t2, b, 32);
+    tcg_gen_sari_i64(t2, t2, 32);
+    tcg_gen_sub_i64(t, t1, t2);
+}
+
+static void do_vsubwev_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                         uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec, INDEX_op_sub_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vsubwev_s,
+            .fno = gen_helper_vsubwev_h_b,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vsubwev_w_h,
+            .fniv = gen_vsubwev_s,
+            .fno = gen_helper_vsubwev_w_h,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vsubwev_d_w,
+            .fniv = gen_vsubwev_s,
+            .fno = gen_helper_vsubwev_d_w,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+        {
+            .fno = gen_helper_vsubwev_q_d,
+            .vece = MO_128
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vsubwev_h_b, gvec_vvv, MO_8, do_vsubwev_s)
+TRANS(vsubwev_w_h, gvec_vvv, MO_16, do_vsubwev_s)
+TRANS(vsubwev_d_w, gvec_vvv, MO_32, do_vsubwev_s)
+TRANS(vsubwev_q_d, gvec_vvv, MO_64, do_vsubwev_s)
+
+static void gen_vsubwod_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+
+    /* Sign-extend the odd elements for vector */
+    tcg_gen_sari_vec(vece, t1, a, halfbits);
+    tcg_gen_sari_vec(vece, t2, b, halfbits);
+
+    tcg_gen_sub_vec(vece, t, t1, t2);
+}
+
+static void gen_vsubwod_w_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_sari_i32(t1, a, 16);
+    tcg_gen_sari_i32(t2, b, 16);
+    tcg_gen_sub_i32(t, t1, t2);
+}
+
+static void gen_vsubwod_d_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_sari_i64(t1, a, 32);
+    tcg_gen_sari_i64(t2, b, 32);
+    tcg_gen_sub_i64(t, t1, t2);
+}
+
+static void do_vsubwod_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                         uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_sari_vec, INDEX_op_sub_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vsubwod_s,
+            .fno = gen_helper_vsubwod_h_b,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vsubwod_w_h,
+            .fniv = gen_vsubwod_s,
+            .fno = gen_helper_vsubwod_w_h,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vsubwod_d_w,
+            .fniv = gen_vsubwod_s,
+            .fno = gen_helper_vsubwod_d_w,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+        {
+            .fno = gen_helper_vsubwod_q_d,
+            .vece = MO_128
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vsubwod_h_b, gvec_vvv, MO_8, do_vsubwod_s)
+TRANS(vsubwod_w_h, gvec_vvv, MO_16, do_vsubwod_s)
+TRANS(vsubwod_d_w, gvec_vvv, MO_32, do_vsubwod_s)
+TRANS(vsubwod_q_d, gvec_vvv, MO_64, do_vsubwod_s)
+
+static void gen_vaddwev_u(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+
+    /* Zero-extend the even elements from a */
+    tcg_gen_shli_vec(vece, t1, a, halfbits);
+    tcg_gen_shri_vec(vece, t1, t1, halfbits);
+
+    /* Zero-extend the even elements from b */
+    tcg_gen_shli_vec(vece, t2, b, halfbits);
+    tcg_gen_shri_vec(vece, t2, t2, halfbits);
+
+    tcg_gen_add_vec(vece, t, t1, t2);
+}
+
+static void gen_vaddwev_w_hu(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_shli_i32(t1, a, 16);
+    tcg_gen_shri_i32(t1, t1, 16);
+    tcg_gen_shli_i32(t2, b, 16);
+    tcg_gen_shri_i32(t2, t2, 16);
+    tcg_gen_add_i32(t, t1, t2);
+}
+
+static void gen_vaddwev_d_wu(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_shli_i64(t1, a, 32);
+    tcg_gen_shri_i64(t1, t1, 32);
+    tcg_gen_shli_i64(t2, b, 32);
+    tcg_gen_shri_i64(t2, t2, 32);
+    tcg_gen_add_i64(t, t1, t2);
+}
+
+static void do_vaddwev_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                         uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shli_vec, INDEX_op_shri_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vaddwev_u,
+            .fno = gen_helper_vaddwev_h_bu,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vaddwev_w_hu,
+            .fniv = gen_vaddwev_u,
+            .fno = gen_helper_vaddwev_w_hu,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vaddwev_d_wu,
+            .fniv = gen_vaddwev_u,
+            .fno = gen_helper_vaddwev_d_wu,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+        {
+            .fno = gen_helper_vaddwev_q_du,
+            .vece = MO_128
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vaddwev_h_bu, gvec_vvv, MO_8, do_vaddwev_u)
+TRANS(vaddwev_w_hu, gvec_vvv, MO_16, do_vaddwev_u)
+TRANS(vaddwev_d_wu, gvec_vvv, MO_32, do_vaddwev_u)
+TRANS(vaddwev_q_du, gvec_vvv, MO_64, do_vaddwev_u)
+
+static void gen_vaddwod_u(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+
+    /* Zero-extend the odd elements for vector */
+    tcg_gen_shri_vec(vece, t1, a, halfbits);
+    tcg_gen_shri_vec(vece, t2, b, halfbits);
+
+    tcg_gen_add_vec(vece, t, t1, t2);
+}
+
+static void gen_vaddwod_w_hu(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_shri_i32(t1, a, 16);
+    tcg_gen_shri_i32(t2, b, 16);
+    tcg_gen_add_i32(t, t1, t2);
+}
+
+static void gen_vaddwod_d_wu(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_shri_i64(t1, a, 32);
+    tcg_gen_shri_i64(t2, b, 32);
+    tcg_gen_add_i64(t, t1, t2);
+}
+
+static void do_vaddwod_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                         uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vaddwod_u,
+            .fno = gen_helper_vaddwod_h_bu,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vaddwod_w_hu,
+            .fniv = gen_vaddwod_u,
+            .fno = gen_helper_vaddwod_w_hu,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vaddwod_d_wu,
+            .fniv = gen_vaddwod_u,
+            .fno = gen_helper_vaddwod_d_wu,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+        {
+            .fno = gen_helper_vaddwod_q_du,
+            .vece = MO_128
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vaddwod_h_bu, gvec_vvv, MO_8, do_vaddwod_u)
+TRANS(vaddwod_w_hu, gvec_vvv, MO_16, do_vaddwod_u)
+TRANS(vaddwod_d_wu, gvec_vvv, MO_32, do_vaddwod_u)
+TRANS(vaddwod_q_du, gvec_vvv, MO_64, do_vaddwod_u)
+
+static void gen_vsubwev_u(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+
+    /* Zero-extend the even elements from a */
+    tcg_gen_shli_vec(vece, t1, a, halfbits);
+    tcg_gen_shri_vec(vece, t1, t1, halfbits);
+
+    /* Zero-extend the even elements from b */
+    tcg_gen_shli_vec(vece, t2, b, halfbits);
+    tcg_gen_shri_vec(vece, t2, t2, halfbits);
+
+    tcg_gen_sub_vec(vece, t, t1, t2);
+}
+
+static void gen_vsubwev_w_hu(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_shli_i32(t1, a, 16);
+    tcg_gen_shri_i32(t1, t1, 16);
+    tcg_gen_shli_i32(t2, b, 16);
+    tcg_gen_shri_i32(t2, t2, 16);
+    tcg_gen_sub_i32(t, t1, t2);
+}
+
+static void gen_vsubwev_d_wu(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_shli_i64(t1, a, 32);
+    tcg_gen_shri_i64(t1, t1, 32);
+    tcg_gen_shli_i64(t2, b, 32);
+    tcg_gen_shri_i64(t2, t2, 32);
+    tcg_gen_sub_i64(t, t1, t2);
+}
+
+static void do_vsubwev_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                         uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shli_vec, INDEX_op_shri_vec, INDEX_op_sub_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vsubwev_u,
+            .fno = gen_helper_vsubwev_h_bu,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vsubwev_w_hu,
+            .fniv = gen_vsubwev_u,
+            .fno = gen_helper_vsubwev_w_hu,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vsubwev_d_wu,
+            .fniv = gen_vsubwev_u,
+            .fno = gen_helper_vsubwev_d_wu,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+        {
+            .fno = gen_helper_vsubwev_q_du,
+            .vece = MO_128
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vsubwev_h_bu, gvec_vvv, MO_8, do_vsubwev_u)
+TRANS(vsubwev_w_hu, gvec_vvv, MO_16, do_vsubwev_u)
+TRANS(vsubwev_d_wu, gvec_vvv, MO_32, do_vsubwev_u)
+TRANS(vsubwev_q_du, gvec_vvv, MO_64, do_vsubwev_u)
+
+static void gen_vsubwod_u(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+
+    /* Zero-extend the odd elements for vector */
+    tcg_gen_shri_vec(vece, t1, a, halfbits);
+    tcg_gen_shri_vec(vece, t2, b, halfbits);
+
+    tcg_gen_sub_vec(vece, t, t1, t2);
+}
+
+static void gen_vsubwod_w_hu(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_shri_i32(t1, a, 16);
+    tcg_gen_shri_i32(t2, b, 16);
+    tcg_gen_sub_i32(t, t1, t2);
+}
+
+static void gen_vsubwod_d_wu(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_shri_i64(t1, a, 32);
+    tcg_gen_shri_i64(t2, b, 32);
+    tcg_gen_sub_i64(t, t1, t2);
+}
+
+static void do_vsubwod_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                         uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_sub_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vsubwod_u,
+            .fno = gen_helper_vsubwod_h_bu,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vsubwod_w_hu,
+            .fniv = gen_vsubwod_u,
+            .fno = gen_helper_vsubwod_w_hu,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vsubwod_d_wu,
+            .fniv = gen_vsubwod_u,
+            .fno = gen_helper_vsubwod_d_wu,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+        {
+            .fno = gen_helper_vsubwod_q_du,
+            .vece = MO_128
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vsubwod_h_bu, gvec_vvv, MO_8, do_vsubwod_u)
+TRANS(vsubwod_w_hu, gvec_vvv, MO_16, do_vsubwod_u)
+TRANS(vsubwod_d_wu, gvec_vvv, MO_32, do_vsubwod_u)
+TRANS(vsubwod_q_du, gvec_vvv, MO_64, do_vsubwod_u)
+
+static void gen_vaddwev_u_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+
+    /* Zero-extend the even elements from a */
+    tcg_gen_shli_vec(vece, t1, a, halfbits);
+    tcg_gen_shri_vec(vece, t1, t1, halfbits);
+
+    /* Sign-extend the even elements from b */
+    tcg_gen_shli_vec(vece, t2, b, halfbits);
+    tcg_gen_sari_vec(vece, t2, t2, halfbits);
+
+    tcg_gen_add_vec(vece, t, t1, t2);
+}
+
+static void gen_vaddwev_w_hu_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_shli_i32(t1, a, 16);
+    tcg_gen_shri_i32(t1, t1, 16);
+    tcg_gen_shli_i32(t2, b, 16);
+    tcg_gen_sari_i32(t2, t2, 16);
+    tcg_gen_add_i32(t, t1, t2);
+}
+
+static void gen_vaddwev_d_wu_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_shli_i64(t1, a, 32);
+    tcg_gen_shri_i64(t1, t1, 32);
+    tcg_gen_shli_i64(t2, b, 32);
+    tcg_gen_sari_i64(t2, t2, 32);
+    tcg_gen_add_i64(t, t1, t2);
+}
+
+static void do_vaddwev_u_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                           uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shli_vec, INDEX_op_shri_vec,
+        INDEX_op_sari_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vaddwev_u_s,
+            .fno = gen_helper_vaddwev_h_bu_b,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vaddwev_w_hu_h,
+            .fniv = gen_vaddwev_u_s,
+            .fno = gen_helper_vaddwev_w_hu_h,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vaddwev_d_wu_w,
+            .fniv = gen_vaddwev_u_s,
+            .fno = gen_helper_vaddwev_d_wu_w,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+        {
+            .fno = gen_helper_vaddwev_q_du_d,
+            .vece = MO_128
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vaddwev_h_bu_b, gvec_vvv, MO_8, do_vaddwev_u_s)
+TRANS(vaddwev_w_hu_h, gvec_vvv, MO_16, do_vaddwev_u_s)
+TRANS(vaddwev_d_wu_w, gvec_vvv, MO_32, do_vaddwev_u_s)
+TRANS(vaddwev_q_du_d, gvec_vvv, MO_64, do_vaddwev_u_s)
+
+static void gen_vaddwod_u_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+
+    /* Zero-extend the odd elements from a */
+    tcg_gen_shri_vec(vece, t1, a, halfbits);
+    /* Sign-extend the odd elements from b */
+    tcg_gen_sari_vec(vece, t2, b, halfbits);
+
+    tcg_gen_add_vec(vece, t, t1, t2);
+}
+
+static void gen_vaddwod_w_hu_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_shri_i32(t1, a, 16);
+    tcg_gen_sari_i32(t2, b, 16);
+    tcg_gen_add_i32(t, t1, t2);
+}
+
+static void gen_vaddwod_d_wu_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_shri_i64(t1, a, 32);
+    tcg_gen_sari_i64(t2, b, 32);
+    tcg_gen_add_i64(t, t1, t2);
+}
+
+static void do_vaddwod_u_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                           uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_sari_vec,  INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vaddwod_u_s,
+            .fno = gen_helper_vaddwod_h_bu_b,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vaddwod_w_hu_h,
+            .fniv = gen_vaddwod_u_s,
+            .fno = gen_helper_vaddwod_w_hu_h,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vaddwod_d_wu_w,
+            .fniv = gen_vaddwod_u_s,
+            .fno = gen_helper_vaddwod_d_wu_w,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+        {
+            .fno = gen_helper_vaddwod_q_du_d,
+            .vece = MO_128
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vaddwod_h_bu_b, gvec_vvv, MO_8, do_vaddwod_u_s)
+TRANS(vaddwod_w_hu_h, gvec_vvv, MO_16, do_vaddwod_u_s)
+TRANS(vaddwod_d_wu_w, gvec_vvv, MO_32, do_vaddwod_u_s)
+TRANS(vaddwod_q_du_d, gvec_vvv, MO_64, do_vaddwod_u_s)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 10a20858e5..ee16155b31 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -559,3 +559,46 @@ vhsubw_hu_bu     0111 00000101 10100 ..... ..... .....    @vvv
 vhsubw_wu_hu     0111 00000101 10101 ..... ..... .....    @vvv
 vhsubw_du_wu     0111 00000101 10110 ..... ..... .....    @vvv
 vhsubw_qu_du     0111 00000101 10111 ..... ..... .....    @vvv
+
+vaddwev_h_b      0111 00000001 11100 ..... ..... .....    @vvv
+vaddwev_w_h      0111 00000001 11101 ..... ..... .....    @vvv
+vaddwev_d_w      0111 00000001 11110 ..... ..... .....    @vvv
+vaddwev_q_d      0111 00000001 11111 ..... ..... .....    @vvv
+vaddwod_h_b      0111 00000010 00100 ..... ..... .....    @vvv
+vaddwod_w_h      0111 00000010 00101 ..... ..... .....    @vvv
+vaddwod_d_w      0111 00000010 00110 ..... ..... .....    @vvv
+vaddwod_q_d      0111 00000010 00111 ..... ..... .....    @vvv
+vsubwev_h_b      0111 00000010 00000 ..... ..... .....    @vvv
+vsubwev_w_h      0111 00000010 00001 ..... ..... .....    @vvv
+vsubwev_d_w      0111 00000010 00010 ..... ..... .....    @vvv
+vsubwev_q_d      0111 00000010 00011 ..... ..... .....    @vvv
+vsubwod_h_b      0111 00000010 01000 ..... ..... .....    @vvv
+vsubwod_w_h      0111 00000010 01001 ..... ..... .....    @vvv
+vsubwod_d_w      0111 00000010 01010 ..... ..... .....    @vvv
+vsubwod_q_d      0111 00000010 01011 ..... ..... .....    @vvv
+
+vaddwev_h_bu     0111 00000010 11100 ..... ..... .....    @vvv
+vaddwev_w_hu     0111 00000010 11101 ..... ..... .....    @vvv
+vaddwev_d_wu     0111 00000010 11110 ..... ..... .....    @vvv
+vaddwev_q_du     0111 00000010 11111 ..... ..... .....    @vvv
+vaddwod_h_bu     0111 00000011 00100 ..... ..... .....    @vvv
+vaddwod_w_hu     0111 00000011 00101 ..... ..... .....    @vvv
+vaddwod_d_wu     0111 00000011 00110 ..... ..... .....    @vvv
+vaddwod_q_du     0111 00000011 00111 ..... ..... .....    @vvv
+vsubwev_h_bu     0111 00000011 00000 ..... ..... .....    @vvv
+vsubwev_w_hu     0111 00000011 00001 ..... ..... .....    @vvv
+vsubwev_d_wu     0111 00000011 00010 ..... ..... .....    @vvv
+vsubwev_q_du     0111 00000011 00011 ..... ..... .....    @vvv
+vsubwod_h_bu     0111 00000011 01000 ..... ..... .....    @vvv
+vsubwod_w_hu     0111 00000011 01001 ..... ..... .....    @vvv
+vsubwod_d_wu     0111 00000011 01010 ..... ..... .....    @vvv
+vsubwod_q_du     0111 00000011 01011 ..... ..... .....    @vvv
+
+vaddwev_h_bu_b   0111 00000011 11100 ..... ..... .....    @vvv
+vaddwev_w_hu_h   0111 00000011 11101 ..... ..... .....    @vvv
+vaddwev_d_wu_w   0111 00000011 11110 ..... ..... .....    @vvv
+vaddwev_q_du_d   0111 00000011 11111 ..... ..... .....    @vvv
+vaddwod_h_bu_b   0111 00000100 00000 ..... ..... .....    @vvv
+vaddwod_w_hu_h   0111 00000100 00001 ..... ..... .....    @vvv
+vaddwod_d_wu_w   0111 00000100 00010 ..... ..... .....    @vvv
+vaddwod_q_du_d   0111 00000100 00011 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 0eb37dda7a..96b052c95a 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -118,3 +118,213 @@ void HELPER(vhsubw_qu_du)(CPULoongArchState *env,
     Vd->Q(0) = int128_sub(int128_make64((uint64_t)Vj->D(1)),
                           int128_make64((uint64_t)Vk->D(0)));
 }
+
+#define DO_EVEN_S(NAME, BIT, T, E1, E2, DO_OP)                 \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v)    \
+{                                                              \
+    int i;                                                     \
+    VReg *Vd = (VReg *)vd;                                     \
+    VReg *Vj = (VReg *)vj;                                     \
+    VReg *Vk = (VReg *)vk;                                     \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                        \
+        Vd->E1(i) = DO_OP((T)Vj->E2(2 * i) ,(T)Vk->E2(2 * i)); \
+    }                                                          \
+}
+
+#define DO_ODD_S(NAME, BIT, T, E1, E2, DO_OP)                          \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v)            \
+{                                                                      \
+    int i;                                                             \
+    VReg *Vd = (VReg *)vd;                                             \
+    VReg *Vj = (VReg *)vj;                                             \
+    VReg *Vk = (VReg *)vk;                                             \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                \
+        Vd->E1(i) = DO_OP((T)Vj->E2(2 * i + 1), (T)Vk->E2(2 * i + 1)); \
+    }                                                                  \
+}
+
+void HELPER(vaddwev_q_d)(void *vd, void *vj, void *vk, uint32_t v)
+{
+    VReg *Vd = (VReg *)vd;
+    VReg *Vj = (VReg *)vj;
+    VReg *Vk = (VReg *)vk;
+
+    Vd->Q(0) = int128_add(int128_makes64(Vj->D(0)), int128_makes64(Vk->D(0)));
+}
+
+DO_EVEN_S(vaddwev_h_b, 16, int16_t, H, B, DO_ADD)
+DO_EVEN_S(vaddwev_w_h, 32, int32_t, W, H, DO_ADD)
+DO_EVEN_S(vaddwev_d_w, 64, int64_t, D, W, DO_ADD)
+
+void HELPER(vaddwod_q_d)(void *vd, void *vj, void *vk, uint32_t v)
+{
+    VReg *Vd = (VReg *)vd;
+    VReg *Vj = (VReg *)vj;
+    VReg *Vk = (VReg *)vk;
+
+    Vd->Q(0) = int128_add(int128_makes64(Vj->D(1)), int128_makes64(Vk->D(1)));
+}
+
+DO_ODD_S(vaddwod_h_b, 16, int16_t, H, B, DO_ADD)
+DO_ODD_S(vaddwod_w_h, 32, int32_t, W, H, DO_ADD)
+DO_ODD_S(vaddwod_d_w, 64, int64_t, D, W, DO_ADD)
+
+void HELPER(vsubwev_q_d)(void *vd, void *vj, void *vk, uint32_t v)
+{
+    VReg *Vd = (VReg *)vd;
+    VReg *Vj = (VReg *)vj;
+    VReg *Vk = (VReg *)vk;
+
+    Vd->Q(0) = int128_sub(int128_makes64(Vj->D(0)), int128_makes64(Vk->D(0)));
+}
+
+DO_EVEN_S(vsubwev_h_b, 16, int16_t, H, B, DO_SUB)
+DO_EVEN_S(vsubwev_w_h, 32, int32_t, W, H, DO_SUB)
+DO_EVEN_S(vsubwev_d_w, 64, int64_t, D, W, DO_SUB)
+
+void HELPER(vsubwod_q_d)(void *vd, void *vj, void *vk, uint32_t v)
+{
+    VReg *Vd = (VReg *)vd;
+    VReg *Vj = (VReg *)vj;
+    VReg *Vk = (VReg *)vk;
+
+    Vd->Q(0) = int128_sub(int128_makes64(Vj->D(1)), int128_makes64(Vk->D(1)));
+}
+
+DO_ODD_S(vsubwod_h_b, 16, int16_t, H, B, DO_SUB)
+DO_ODD_S(vsubwod_w_h, 32, int32_t, W, H, DO_SUB)
+DO_ODD_S(vsubwod_d_w, 64, int64_t, D, W, DO_SUB)
+
+#define DO_EVEN_U(NAME, BIT, TD, TS, E1, E2, DO_OP)         \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v) \
+{                                                           \
+    int i;                                                  \
+    VReg *Vd = (VReg *)vd;                                  \
+    VReg *Vj = (VReg *)vj;                                  \
+    VReg *Vk = (VReg *)vk;                                  \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                     \
+        Vd->E1(i) = DO_OP((TD)(TS)Vj->E2(2 * i),            \
+                          (TD)(TS)Vk->E2(2 * i));           \
+    }                                                       \
+}
+
+#define DO_ODD_U(NAME, BIT, TD, TS, E1, E2, DO_OP)          \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v) \
+{                                                           \
+    int i;                                                  \
+    VReg *Vd = (VReg *)vd;                                  \
+    VReg *Vj = (VReg *)vj;                                  \
+    VReg *Vk = (VReg *)vk;                                  \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                     \
+        Vd->E1(i) = DO_OP((TD)(TS)Vj->E2(2 * i + 1),        \
+                          (TD)(TS)Vk->E2(2 * i + 1));       \
+    }                                                       \
+}
+
+void HELPER(vaddwev_q_du)(void *vd, void *vj, void *vk, uint32_t v)
+{
+    VReg *Vd = (VReg *)vd;
+    VReg *Vj = (VReg *)vj;
+    VReg *Vk = (VReg *)vk;
+
+    Vd->Q(0) = int128_add(int128_make64((uint64_t)Vj->D(0)),
+                          int128_make64((uint64_t)Vk->D(0)));
+}
+
+DO_EVEN_U(vaddwev_h_bu, 16, uint16_t, uint8_t, H, B, DO_ADD)
+DO_EVEN_U(vaddwev_w_hu, 32, uint32_t, uint16_t, W, H, DO_ADD)
+DO_EVEN_U(vaddwev_d_wu, 64, uint64_t, uint32_t, D, W, DO_ADD)
+
+void HELPER(vaddwod_q_du)(void *vd, void *vj, void *vk, uint32_t v)
+{
+    VReg *Vd = (VReg *)vd;
+    VReg *Vj = (VReg *)vj;
+    VReg *Vk = (VReg *)vk;
+
+    Vd->Q(0) = int128_add(int128_make64((uint64_t)Vj->D(1)),
+                          int128_make64((uint64_t)Vk->D(1)));
+}
+
+DO_ODD_U(vaddwod_h_bu, 16, uint16_t, uint8_t, H, B, DO_ADD)
+DO_ODD_U(vaddwod_w_hu, 32, uint32_t, uint16_t, W, H, DO_ADD)
+DO_ODD_U(vaddwod_d_wu, 64, uint64_t, uint32_t, D, W, DO_ADD)
+
+void HELPER(vsubwev_q_du)(void *vd, void *vj, void *vk, uint32_t v)
+{
+    VReg *Vd = (VReg *)vd;
+    VReg *Vj = (VReg *)vj;
+    VReg *Vk = (VReg *)vk;
+
+    Vd->Q(0) = int128_sub(int128_make64((uint64_t)Vj->D(0)),
+                          int128_make64((uint64_t)Vk->D(0)));
+}
+
+DO_EVEN_U(vsubwev_h_bu, 16, uint16_t, uint8_t, H, B, DO_SUB)
+DO_EVEN_U(vsubwev_w_hu, 32, uint32_t, uint16_t, W, H, DO_SUB)
+DO_EVEN_U(vsubwev_d_wu, 64, uint64_t, uint32_t, D, W, DO_SUB)
+
+void HELPER(vsubwod_q_du)(void *vd, void *vj, void *vk, uint32_t v)
+{
+    VReg *Vd = (VReg *)vd;
+    VReg *Vj = (VReg *)vj;
+    VReg *Vk = (VReg *)vk;
+
+    Vd->Q(0) = int128_sub(int128_make64((uint64_t)Vj->D(1)),
+                          int128_make64((uint64_t)Vk->D(1)));
+}
+
+DO_ODD_U(vsubwod_h_bu, 16, uint16_t, uint8_t, H, B, DO_SUB)
+DO_ODD_U(vsubwod_w_hu, 32, uint32_t, uint16_t, W, H, DO_SUB)
+DO_ODD_U(vsubwod_d_wu, 64, uint64_t, uint32_t, D, W, DO_SUB)
+
+#define DO_EVEN_U_S(NAME, BIT, T1, TD1, T2, E1, E2, DO_OP)            \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v)           \
+{                                                                     \
+    int i;                                                            \
+    VReg *Vd = (VReg *)vd;                                            \
+    VReg *Vj = (VReg *)vj;                                            \
+    VReg *Vk = (VReg *)vk;                                            \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                               \
+        Vd->E1(i) = DO_OP((TD1)(T1)Vj->E2(2 * i) ,(T2)Vk->E2(2 * i)); \
+    }                                                                 \
+}
+
+#define DO_ODD_U_S(NAME, BIT, T1, TD1, T2, E1, E2, DO_OP)                     \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v)                   \
+{                                                                             \
+    int i;                                                                    \
+    VReg *Vd = (VReg *)vd;                                                    \
+    VReg *Vj = (VReg *)vj;                                                    \
+    VReg *Vk = (VReg *)vk;                                                    \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                       \
+        Vd->E1(i) = DO_OP((TD1)(T1)Vj->E2(2 * i + 1), (T2)Vk->E2(2 * i + 1)); \
+    }                                                                         \
+}
+
+void HELPER(vaddwev_q_du_d)(void *vd, void *vj, void *vk, uint32_t v)
+{
+    VReg *Vd = (VReg *)vd;
+    VReg *Vj = (VReg *)vj;
+    VReg *Vk = (VReg *)vk;
+
+    Vd->Q(0) = int128_add(int128_make64((uint64_t)Vj->D(0)),
+                          int128_makes64(Vk->D(0)));
+}
+
+DO_EVEN_U_S(vaddwev_h_bu_b, 16, uint16_t, uint8_t, int16_t, H, B, DO_ADD)
+DO_EVEN_U_S(vaddwev_w_hu_h, 32, uint32_t, uint16_t, int32_t, W, H, DO_ADD)
+DO_EVEN_U_S(vaddwev_d_wu_w, 64, uint64_t, uint32_t, int64_t, D, W, DO_ADD)
+
+void HELPER(vaddwod_q_du_d)(void *vd, void *vj, void *vk, uint32_t v)
+{
+    VReg *Vd = (VReg *)vd;
+    VReg *Vj = (VReg *)vj;
+    VReg *Vk = (VReg *)vk;
+
+    Vd->Q(0) = int128_add(int128_make64((uint64_t)Vj->D(1)),
+                          int128_makes64(Vk->D(1)));
+}
+
+DO_ODD_U_S(vaddwod_h_bu_b, 16, uint16_t, uint8_t, int16_t, H, B, DO_ADD)
+DO_ODD_U_S(vaddwod_w_hu_h, 32, uint32_t, uint16_t, int32_t, W, H, DO_ADD)
+DO_ODD_U_S(vaddwod_d_wu_w, 64, uint64_t, uint32_t, int64_t, D, W, DO_ADD)
-- 
2.31.1


