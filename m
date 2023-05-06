Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD426F8F3B
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 08:37:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvBWf-0005mV-SS; Sat, 06 May 2023 02:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pvBWa-0005is-Pz
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:08 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pvBWX-0004D9-8k
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:08 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxKupH9VVk5aQFAA--.9341S3;
 Sat, 06 May 2023 14:35:51 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxDbM89VVkhCNNAA--.9773S17; 
 Sat, 06 May 2023 14:35:51 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL v2 15/45] target/loongarch: Implement vmadd/vmsub/vmaddw{ev/od}
Date: Sat,  6 May 2023 14:35:10 +0800
Message-Id: <20230506063540.178794-16-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230506063540.178794-1-gaosong@loongson.cn>
References: <20230506063540.178794-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxDbM89VVkhCNNAA--.9773S17
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoWfCrykWrWxKr4Dtw48Cry5CFg_yoW5GFWfCo
 W3Gw4UArWxKr13Cr1UW39rXFWxtrW0va4DJ34jvrsFqFyrAFy7tas8K3ZxJaykArsI9F9x
 JFy7AF45J3Z0qrWDn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqv1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
 CY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
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
- VMADD.{B/H/W/D};
- VMSUB.{B/H/W/D};
- VMADDW{EV/OD}.{H.B/W.H/D.W/Q.D}[U];
- VMADDW{EV/OD}.{H.BU.B/W.HU.H/D.WU.W/Q.DU.D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-16-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  34 ++
 target/loongarch/helper.h                   |  30 +
 target/loongarch/insn_trans/trans_lsx.c.inc | 612 ++++++++++++++++++++
 target/loongarch/insns.decode               |  34 ++
 target/loongarch/lsx_helper.c               | 107 ++++
 5 files changed, 817 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 48e6ef5309..980e6e6375 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1010,3 +1010,37 @@ INSN_LSX(vmulwod_h_bu_b,   vvv)
 INSN_LSX(vmulwod_w_hu_h,   vvv)
 INSN_LSX(vmulwod_d_wu_w,   vvv)
 INSN_LSX(vmulwod_q_du_d,   vvv)
+
+INSN_LSX(vmadd_b,          vvv)
+INSN_LSX(vmadd_h,          vvv)
+INSN_LSX(vmadd_w,          vvv)
+INSN_LSX(vmadd_d,          vvv)
+INSN_LSX(vmsub_b,          vvv)
+INSN_LSX(vmsub_h,          vvv)
+INSN_LSX(vmsub_w,          vvv)
+INSN_LSX(vmsub_d,          vvv)
+
+INSN_LSX(vmaddwev_h_b,     vvv)
+INSN_LSX(vmaddwev_w_h,     vvv)
+INSN_LSX(vmaddwev_d_w,     vvv)
+INSN_LSX(vmaddwev_q_d,     vvv)
+INSN_LSX(vmaddwod_h_b,     vvv)
+INSN_LSX(vmaddwod_w_h,     vvv)
+INSN_LSX(vmaddwod_d_w,     vvv)
+INSN_LSX(vmaddwod_q_d,     vvv)
+INSN_LSX(vmaddwev_h_bu,    vvv)
+INSN_LSX(vmaddwev_w_hu,    vvv)
+INSN_LSX(vmaddwev_d_wu,    vvv)
+INSN_LSX(vmaddwev_q_du,    vvv)
+INSN_LSX(vmaddwod_h_bu,    vvv)
+INSN_LSX(vmaddwod_w_hu,    vvv)
+INSN_LSX(vmaddwod_d_wu,    vvv)
+INSN_LSX(vmaddwod_q_du,    vvv)
+INSN_LSX(vmaddwev_h_bu_b,  vvv)
+INSN_LSX(vmaddwev_w_hu_h,  vvv)
+INSN_LSX(vmaddwev_d_wu_w,  vvv)
+INSN_LSX(vmaddwev_q_du_d,  vvv)
+INSN_LSX(vmaddwod_h_bu_b,  vvv)
+INSN_LSX(vmaddwod_w_hu_h,  vvv)
+INSN_LSX(vmaddwod_d_wu_w,  vvv)
+INSN_LSX(vmaddwod_q_du_d,  vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 830d8cbe62..8cf9620702 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -273,3 +273,33 @@ DEF_HELPER_FLAGS_4(vmulwev_d_wu_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vmulwod_h_bu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vmulwod_w_hu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vmulwod_d_wu_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vmadd_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmadd_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmsub_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmsub_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmsub_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmsub_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vmaddwev_h_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwev_w_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwev_d_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwod_h_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwod_w_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwod_d_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vmaddwev_h_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwev_w_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwev_d_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwod_h_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwod_w_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwod_d_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vmaddwev_h_bu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwev_w_hu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwev_d_wu_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwod_h_bu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwod_w_hu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmaddwod_d_wu_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 9a36f942e2..400c3a0339 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2064,3 +2064,615 @@ static void do_vmulwod_u_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
 TRANS(vmulwod_h_bu_b, gvec_vvv, MO_8, do_vmulwod_u_s)
 TRANS(vmulwod_w_hu_h, gvec_vvv, MO_16, do_vmulwod_u_s)
 TRANS(vmulwod_d_wu_w, gvec_vvv, MO_32, do_vmulwod_u_s)
+
+static void gen_vmadd(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1;
+
+    t1 = tcg_temp_new_vec_matching(t);
+    tcg_gen_mul_vec(vece, t1, a, b);
+    tcg_gen_add_vec(vece, t, t, t1);
+}
+
+static void gen_vmadd_w(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1;
+
+    t1 = tcg_temp_new_i32();
+    tcg_gen_mul_i32(t1, a, b);
+    tcg_gen_add_i32(t, t, t1);
+}
+
+static void gen_vmadd_d(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1;
+
+    t1 = tcg_temp_new_i64();
+    tcg_gen_mul_i64(t1, a, b);
+    tcg_gen_add_i64(t, t, t1);
+}
+
+static void do_vmadd(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                     uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_mul_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vmadd,
+            .fno = gen_helper_vmadd_b,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vmadd,
+            .fno = gen_helper_vmadd_h,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmadd_w,
+            .fniv = gen_vmadd,
+            .fno = gen_helper_vmadd_w,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmadd_d,
+            .fniv = gen_vmadd,
+            .fno = gen_helper_vmadd_d,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmadd_b, gvec_vvv, MO_8, do_vmadd)
+TRANS(vmadd_h, gvec_vvv, MO_16, do_vmadd)
+TRANS(vmadd_w, gvec_vvv, MO_32, do_vmadd)
+TRANS(vmadd_d, gvec_vvv, MO_64, do_vmadd)
+
+static void gen_vmsub(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1;
+
+    t1 = tcg_temp_new_vec_matching(t);
+    tcg_gen_mul_vec(vece, t1, a, b);
+    tcg_gen_sub_vec(vece, t, t, t1);
+}
+
+static void gen_vmsub_w(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1;
+
+    t1 = tcg_temp_new_i32();
+    tcg_gen_mul_i32(t1, a, b);
+    tcg_gen_sub_i32(t, t, t1);
+}
+
+static void gen_vmsub_d(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1;
+
+    t1 = tcg_temp_new_i64();
+    tcg_gen_mul_i64(t1, a, b);
+    tcg_gen_sub_i64(t, t, t1);
+}
+
+static void do_vmsub(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                     uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_mul_vec, INDEX_op_sub_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vmsub,
+            .fno = gen_helper_vmsub_b,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vmsub,
+            .fno = gen_helper_vmsub_h,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmsub_w,
+            .fniv = gen_vmsub,
+            .fno = gen_helper_vmsub_w,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmsub_d,
+            .fniv = gen_vmsub,
+            .fno = gen_helper_vmsub_d,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmsub_b, gvec_vvv, MO_8, do_vmsub)
+TRANS(vmsub_h, gvec_vvv, MO_16, do_vmsub)
+TRANS(vmsub_w, gvec_vvv, MO_32, do_vmsub)
+TRANS(vmsub_d, gvec_vvv, MO_64, do_vmsub)
+
+static void gen_vmaddwev_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2, t3;
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+    t3 = tcg_temp_new_vec_matching(t);
+    tcg_gen_shli_vec(vece, t1, a, halfbits);
+    tcg_gen_sari_vec(vece, t1, t1, halfbits);
+    tcg_gen_shli_vec(vece, t2, b, halfbits);
+    tcg_gen_sari_vec(vece, t2, t2, halfbits);
+    tcg_gen_mul_vec(vece, t3, t1, t2);
+    tcg_gen_add_vec(vece, t, t, t3);
+}
+
+static void gen_vmaddwev_w_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1;
+
+    t1 = tcg_temp_new_i32();
+    gen_vmulwev_w_h(t1, a, b);
+    tcg_gen_add_i32(t, t, t1);
+}
+
+static void gen_vmaddwev_d_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1;
+
+    t1 = tcg_temp_new_i64();
+    gen_vmulwev_d_w(t1, a, b);
+    tcg_gen_add_i64(t, t, t1);
+}
+
+static void do_vmaddwev_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                          uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec,
+        INDEX_op_mul_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[3] = {
+        {
+            .fniv = gen_vmaddwev_s,
+            .fno = gen_helper_vmaddwev_h_b,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmaddwev_w_h,
+            .fniv = gen_vmaddwev_s,
+            .fno = gen_helper_vmaddwev_w_h,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmaddwev_d_w,
+            .fniv = gen_vmaddwev_s,
+            .fno = gen_helper_vmaddwev_d_w,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmaddwev_h_b, gvec_vvv, MO_8, do_vmaddwev_s)
+TRANS(vmaddwev_w_h, gvec_vvv, MO_16, do_vmaddwev_s)
+TRANS(vmaddwev_d_w, gvec_vvv, MO_32, do_vmaddwev_s)
+
+#define VMADD_Q(NAME, FN, idx1, idx2)                     \
+static bool trans_## NAME (DisasContext *ctx, arg_vvv *a) \
+{                                                         \
+    TCGv_i64 rh, rl, arg1, arg2, th, tl;                  \
+                                                          \
+    rh = tcg_temp_new_i64();                              \
+    rl = tcg_temp_new_i64();                              \
+    arg1 = tcg_temp_new_i64();                            \
+    arg2 = tcg_temp_new_i64();                            \
+    th = tcg_temp_new_i64();                              \
+    tl = tcg_temp_new_i64();                              \
+                                                          \
+    get_vreg64(arg1, a->vj, idx1);                        \
+    get_vreg64(arg2, a->vk, idx2);                        \
+    get_vreg64(rh, a->vd, 1);                             \
+    get_vreg64(rl, a->vd, 0);                             \
+                                                          \
+    tcg_gen_## FN ##_i64(tl, th, arg1, arg2);             \
+    tcg_gen_add2_i64(rl, rh, rl, rh, tl, th);             \
+                                                          \
+    set_vreg64(rh, a->vd, 1);                             \
+    set_vreg64(rl, a->vd, 0);                             \
+                                                          \
+    return true;                                          \
+}
+
+VMADD_Q(vmaddwev_q_d, muls2, 0, 0)
+VMADD_Q(vmaddwod_q_d, muls2, 1, 1)
+VMADD_Q(vmaddwev_q_du, mulu2, 0, 0)
+VMADD_Q(vmaddwod_q_du, mulu2, 1, 1)
+VMADD_Q(vmaddwev_q_du_d, mulus2, 0, 0)
+VMADD_Q(vmaddwod_q_du_d, mulus2, 1, 1)
+
+static void gen_vmaddwod_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2, t3;
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+    t3 = tcg_temp_new_vec_matching(t);
+    tcg_gen_sari_vec(vece, t1, a, halfbits);
+    tcg_gen_sari_vec(vece, t2, b, halfbits);
+    tcg_gen_mul_vec(vece, t3, t1, t2);
+    tcg_gen_add_vec(vece, t, t, t3);
+}
+
+static void gen_vmaddwod_w_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1;
+
+    t1 = tcg_temp_new_i32();
+    gen_vmulwod_w_h(t1, a, b);
+    tcg_gen_add_i32(t, t, t1);
+}
+
+static void gen_vmaddwod_d_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1;
+
+    t1 = tcg_temp_new_i64();
+    gen_vmulwod_d_w(t1, a, b);
+    tcg_gen_add_i64(t, t, t1);
+}
+
+static void do_vmaddwod_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                          uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_sari_vec, INDEX_op_mul_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[3] = {
+        {
+            .fniv = gen_vmaddwod_s,
+            .fno = gen_helper_vmaddwod_h_b,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmaddwod_w_h,
+            .fniv = gen_vmaddwod_s,
+            .fno = gen_helper_vmaddwod_w_h,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmaddwod_d_w,
+            .fniv = gen_vmaddwod_s,
+            .fno = gen_helper_vmaddwod_d_w,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmaddwod_h_b, gvec_vvv, MO_8, do_vmaddwod_s)
+TRANS(vmaddwod_w_h, gvec_vvv, MO_16, do_vmaddwod_s)
+TRANS(vmaddwod_d_w, gvec_vvv, MO_32, do_vmaddwod_s)
+
+static void gen_vmaddwev_u(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2, mask;
+
+    t1 = tcg_temp_new_vec_matching(t);
+    t2 = tcg_temp_new_vec_matching(b);
+    mask = tcg_constant_vec_matching(t, vece, MAKE_64BIT_MASK(0, 4 << vece));
+    tcg_gen_and_vec(vece, t1, a, mask);
+    tcg_gen_and_vec(vece, t2, b, mask);
+    tcg_gen_mul_vec(vece, t1, t1, t2);
+    tcg_gen_add_vec(vece, t, t, t1);
+}
+
+static void gen_vmaddwev_w_hu(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1;
+
+    t1 = tcg_temp_new_i32();
+    gen_vmulwev_w_hu(t1, a, b);
+    tcg_gen_add_i32(t, t, t1);
+}
+
+static void gen_vmaddwev_d_wu(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1;
+
+    t1 = tcg_temp_new_i64();
+    gen_vmulwev_d_wu(t1, a, b);
+    tcg_gen_add_i64(t, t, t1);
+}
+
+static void do_vmaddwev_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                          uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_mul_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[3] = {
+        {
+            .fniv = gen_vmaddwev_u,
+            .fno = gen_helper_vmaddwev_h_bu,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmaddwev_w_hu,
+            .fniv = gen_vmaddwev_u,
+            .fno = gen_helper_vmaddwev_w_hu,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmaddwev_d_wu,
+            .fniv = gen_vmaddwev_u,
+            .fno = gen_helper_vmaddwev_d_wu,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmaddwev_h_bu, gvec_vvv, MO_8, do_vmaddwev_u)
+TRANS(vmaddwev_w_hu, gvec_vvv, MO_16, do_vmaddwev_u)
+TRANS(vmaddwev_d_wu, gvec_vvv, MO_32, do_vmaddwev_u)
+
+static void gen_vmaddwod_u(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2, t3;
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+    t3 = tcg_temp_new_vec_matching(t);
+    tcg_gen_shri_vec(vece, t1, a, halfbits);
+    tcg_gen_shri_vec(vece, t2, b, halfbits);
+    tcg_gen_mul_vec(vece, t3, t1, t2);
+    tcg_gen_add_vec(vece, t, t, t3);
+}
+
+static void gen_vmaddwod_w_hu(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1;
+
+    t1 = tcg_temp_new_i32();
+    gen_vmulwod_w_hu(t1, a, b);
+    tcg_gen_add_i32(t, t, t1);
+}
+
+static void gen_vmaddwod_d_wu(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1;
+
+    t1 = tcg_temp_new_i64();
+    gen_vmulwod_d_wu(t1, a, b);
+    tcg_gen_add_i64(t, t, t1);
+}
+
+static void do_vmaddwod_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                          uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_mul_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[3] = {
+        {
+            .fniv = gen_vmaddwod_u,
+            .fno = gen_helper_vmaddwod_h_bu,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmaddwod_w_hu,
+            .fniv = gen_vmaddwod_u,
+            .fno = gen_helper_vmaddwod_w_hu,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmaddwod_d_wu,
+            .fniv = gen_vmaddwod_u,
+            .fno = gen_helper_vmaddwod_d_wu,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmaddwod_h_bu, gvec_vvv, MO_8, do_vmaddwod_u)
+TRANS(vmaddwod_w_hu, gvec_vvv, MO_16, do_vmaddwod_u)
+TRANS(vmaddwod_d_wu, gvec_vvv, MO_32, do_vmaddwod_u)
+
+static void gen_vmaddwev_u_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2, mask;
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+    mask = tcg_constant_vec_matching(t, vece, MAKE_64BIT_MASK(0, 4 << vece));
+    tcg_gen_and_vec(vece, t1, a, mask);
+    tcg_gen_shli_vec(vece, t2, b, halfbits);
+    tcg_gen_sari_vec(vece, t2, t2, halfbits);
+    tcg_gen_mul_vec(vece, t1, t1, t2);
+    tcg_gen_add_vec(vece, t, t, t1);
+}
+
+static void gen_vmaddwev_w_hu_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1;
+
+    t1 = tcg_temp_new_i32();
+    gen_vmulwev_w_hu_h(t1, a, b);
+    tcg_gen_add_i32(t, t, t1);
+}
+
+static void gen_vmaddwev_d_wu_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1;
+
+    t1 = tcg_temp_new_i64();
+    gen_vmulwev_d_wu_w(t1, a, b);
+    tcg_gen_add_i64(t, t, t1);
+}
+
+static void do_vmaddwev_u_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                            uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec,
+        INDEX_op_mul_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[3] = {
+        {
+            .fniv = gen_vmaddwev_u_s,
+            .fno = gen_helper_vmaddwev_h_bu_b,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmaddwev_w_hu_h,
+            .fniv = gen_vmaddwev_u_s,
+            .fno = gen_helper_vmaddwev_w_hu_h,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmaddwev_d_wu_w,
+            .fniv = gen_vmaddwev_u_s,
+            .fno = gen_helper_vmaddwev_d_wu_w,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmaddwev_h_bu_b, gvec_vvv, MO_8, do_vmaddwev_u_s)
+TRANS(vmaddwev_w_hu_h, gvec_vvv, MO_16, do_vmaddwev_u_s)
+TRANS(vmaddwev_d_wu_w, gvec_vvv, MO_32, do_vmaddwev_u_s)
+
+static void gen_vmaddwod_u_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2, t3;
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+    t3 = tcg_temp_new_vec_matching(t);
+    tcg_gen_shri_vec(vece, t1, a, halfbits);
+    tcg_gen_sari_vec(vece, t2, b, halfbits);
+    tcg_gen_mul_vec(vece, t3, t1, t2);
+    tcg_gen_add_vec(vece, t, t, t3);
+}
+
+static void gen_vmaddwod_w_hu_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1;
+
+    t1 = tcg_temp_new_i32();
+    gen_vmulwod_w_hu_h(t1, a, b);
+    tcg_gen_add_i32(t, t, t1);
+}
+
+static void gen_vmaddwod_d_wu_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1;
+
+    t1 = tcg_temp_new_i64();
+    gen_vmulwod_d_wu_w(t1, a, b);
+    tcg_gen_add_i64(t, t, t1);
+}
+
+static void do_vmaddwod_u_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                            uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_sari_vec,
+        INDEX_op_mul_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[3] = {
+        {
+            .fniv = gen_vmaddwod_u_s,
+            .fno = gen_helper_vmaddwod_h_bu_b,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmaddwod_w_hu_h,
+            .fniv = gen_vmaddwod_u_s,
+            .fno = gen_helper_vmaddwod_w_hu_h,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmaddwod_d_wu_w,
+            .fniv = gen_vmaddwod_u_s,
+            .fno = gen_helper_vmaddwod_d_wu_w,
+            .load_dest = true,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmaddwod_h_bu_b, gvec_vvv, MO_8, do_vmaddwod_u_s)
+TRANS(vmaddwod_w_hu_h, gvec_vvv, MO_16, do_vmaddwod_u_s)
+TRANS(vmaddwod_d_wu_w, gvec_vvv, MO_32, do_vmaddwod_u_s)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 64e8042c9c..df23d4ee1e 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -706,3 +706,37 @@ vmulwod_h_bu_b   0111 00001010 00100 ..... ..... .....    @vvv
 vmulwod_w_hu_h   0111 00001010 00101 ..... ..... .....    @vvv
 vmulwod_d_wu_w   0111 00001010 00110 ..... ..... .....    @vvv
 vmulwod_q_du_d   0111 00001010 00111 ..... ..... .....    @vvv
+
+vmadd_b          0111 00001010 10000 ..... ..... .....    @vvv
+vmadd_h          0111 00001010 10001 ..... ..... .....    @vvv
+vmadd_w          0111 00001010 10010 ..... ..... .....    @vvv
+vmadd_d          0111 00001010 10011 ..... ..... .....    @vvv
+vmsub_b          0111 00001010 10100 ..... ..... .....    @vvv
+vmsub_h          0111 00001010 10101 ..... ..... .....    @vvv
+vmsub_w          0111 00001010 10110 ..... ..... .....    @vvv
+vmsub_d          0111 00001010 10111 ..... ..... .....    @vvv
+
+vmaddwev_h_b     0111 00001010 11000 ..... ..... .....    @vvv
+vmaddwev_w_h     0111 00001010 11001 ..... ..... .....    @vvv
+vmaddwev_d_w     0111 00001010 11010 ..... ..... .....    @vvv
+vmaddwev_q_d     0111 00001010 11011 ..... ..... .....    @vvv
+vmaddwod_h_b     0111 00001010 11100 ..... ..... .....    @vvv
+vmaddwod_w_h     0111 00001010 11101 ..... ..... .....    @vvv
+vmaddwod_d_w     0111 00001010 11110 ..... ..... .....    @vvv
+vmaddwod_q_d     0111 00001010 11111 ..... ..... .....    @vvv
+vmaddwev_h_bu    0111 00001011 01000 ..... ..... .....    @vvv
+vmaddwev_w_hu    0111 00001011 01001 ..... ..... .....    @vvv
+vmaddwev_d_wu    0111 00001011 01010 ..... ..... .....    @vvv
+vmaddwev_q_du    0111 00001011 01011 ..... ..... .....    @vvv
+vmaddwod_h_bu    0111 00001011 01100 ..... ..... .....    @vvv
+vmaddwod_w_hu    0111 00001011 01101 ..... ..... .....    @vvv
+vmaddwod_d_wu    0111 00001011 01110 ..... ..... .....    @vvv
+vmaddwod_q_du    0111 00001011 01111 ..... ..... .....    @vvv
+vmaddwev_h_bu_b  0111 00001011 11000 ..... ..... .....    @vvv
+vmaddwev_w_hu_h  0111 00001011 11001 ..... ..... .....    @vvv
+vmaddwev_d_wu_w  0111 00001011 11010 ..... ..... .....    @vvv
+vmaddwev_q_du_d  0111 00001011 11011 ..... ..... .....    @vvv
+vmaddwod_h_bu_b  0111 00001011 11100 ..... ..... .....    @vvv
+vmaddwod_w_hu_h  0111 00001011 11101 ..... ..... .....    @vvv
+vmaddwod_d_wu_w  0111 00001011 11110 ..... ..... .....    @vvv
+vmaddwod_q_du_d  0111 00001011 11111 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 3b565277fd..8f82091302 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -446,3 +446,110 @@ DO_EVEN_U_S(vmulwev_d_wu_w, 64, D, UD, W, UW, DO_MUL)
 DO_ODD_U_S(vmulwod_h_bu_b, 16, H, UH, B, UB, DO_MUL)
 DO_ODD_U_S(vmulwod_w_hu_h, 32, W, UW, H, UH, DO_MUL)
 DO_ODD_U_S(vmulwod_d_wu_w, 64, D, UD, W, UW, DO_MUL)
+
+#define DO_MADD(a, b, c)  (a + b * c)
+#define DO_MSUB(a, b, c)  (a - b * c)
+
+#define VMADDSUB(NAME, BIT, E, DO_OP)                       \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v) \
+{                                                           \
+    int i;                                                  \
+    VReg *Vd = (VReg *)vd;                                  \
+    VReg *Vj = (VReg *)vj;                                  \
+    VReg *Vk = (VReg *)vk;                                  \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                     \
+        Vd->E(i) = DO_OP(Vd->E(i), Vj->E(i) ,Vk->E(i));     \
+    }                                                       \
+}
+
+VMADDSUB(vmadd_b, 8, B, DO_MADD)
+VMADDSUB(vmadd_h, 16, H, DO_MADD)
+VMADDSUB(vmadd_w, 32, W, DO_MADD)
+VMADDSUB(vmadd_d, 64, D, DO_MADD)
+VMADDSUB(vmsub_b, 8, B, DO_MSUB)
+VMADDSUB(vmsub_h, 16, H, DO_MSUB)
+VMADDSUB(vmsub_w, 32, W, DO_MSUB)
+VMADDSUB(vmsub_d, 64, D, DO_MSUB)
+
+#define VMADDWEV(NAME, BIT, E1, E2, DO_OP)                        \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v)       \
+{                                                                 \
+    int i;                                                        \
+    VReg *Vd = (VReg *)vd;                                        \
+    VReg *Vj = (VReg *)vj;                                        \
+    VReg *Vk = (VReg *)vk;                                        \
+    typedef __typeof(Vd->E1(0)) TD;                               \
+                                                                  \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                           \
+        Vd->E1(i) += DO_OP((TD)Vj->E2(2 * i), (TD)Vk->E2(2 * i)); \
+    }                                                             \
+}
+
+VMADDWEV(vmaddwev_h_b, 16, H, B, DO_MUL)
+VMADDWEV(vmaddwev_w_h, 32, W, H, DO_MUL)
+VMADDWEV(vmaddwev_d_w, 64, D, W, DO_MUL)
+VMADDWEV(vmaddwev_h_bu, 16, UH, UB, DO_MUL)
+VMADDWEV(vmaddwev_w_hu, 32, UW, UH, DO_MUL)
+VMADDWEV(vmaddwev_d_wu, 64, UD, UW, DO_MUL)
+
+#define VMADDWOD(NAME, BIT, E1, E2, DO_OP)                  \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v) \
+{                                                           \
+    int i;                                                  \
+    VReg *Vd = (VReg *)vd;                                  \
+    VReg *Vj = (VReg *)vj;                                  \
+    VReg *Vk = (VReg *)vk;                                  \
+    typedef __typeof(Vd->E1(0)) TD;                         \
+                                                            \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                     \
+        Vd->E1(i) += DO_OP((TD)Vj->E2(2 * i + 1),           \
+                           (TD)Vk->E2(2 * i + 1));          \
+    }                                                       \
+}
+
+VMADDWOD(vmaddwod_h_b, 16, H, B, DO_MUL)
+VMADDWOD(vmaddwod_w_h, 32, W, H, DO_MUL)
+VMADDWOD(vmaddwod_d_w, 64, D, W, DO_MUL)
+VMADDWOD(vmaddwod_h_bu, 16,  UH, UB, DO_MUL)
+VMADDWOD(vmaddwod_w_hu, 32,  UW, UH, DO_MUL)
+VMADDWOD(vmaddwod_d_wu, 64,  UD, UW, DO_MUL)
+
+#define VMADDWEV_U_S(NAME, BIT, ES1, EU1, ES2, EU2, DO_OP)  \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v) \
+{                                                           \
+    int i;                                                  \
+    VReg *Vd = (VReg *)vd;                                  \
+    VReg *Vj = (VReg *)vj;                                  \
+    VReg *Vk = (VReg *)vk;                                  \
+    typedef __typeof(Vd->ES1(0)) TS1;                       \
+    typedef __typeof(Vd->EU1(0)) TU1;                       \
+                                                            \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                     \
+        Vd->ES1(i) += DO_OP((TU1)Vj->EU2(2 * i),            \
+                            (TS1)Vk->ES2(2 * i));           \
+    }                                                       \
+}
+
+VMADDWEV_U_S(vmaddwev_h_bu_b, 16, H, UH, B, UB, DO_MUL)
+VMADDWEV_U_S(vmaddwev_w_hu_h, 32, W, UW, H, UH, DO_MUL)
+VMADDWEV_U_S(vmaddwev_d_wu_w, 64, D, UD, W, UW, DO_MUL)
+
+#define VMADDWOD_U_S(NAME, BIT, ES1, EU1, ES2, EU2, DO_OP)  \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v) \
+{                                                           \
+    int i;                                                  \
+    VReg *Vd = (VReg *)vd;                                  \
+    VReg *Vj = (VReg *)vj;                                  \
+    VReg *Vk = (VReg *)vk;                                  \
+    typedef __typeof(Vd->ES1(0)) TS1;                       \
+    typedef __typeof(Vd->EU1(0)) TU1;                       \
+                                                            \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                     \
+        Vd->ES1(i) += DO_OP((TU1)Vj->EU2(2 * i + 1),         \
+                            (TS1)Vk->ES2(2 * i + 1));        \
+    }                                                       \
+}
+
+VMADDWOD_U_S(vmaddwod_h_bu_b, 16, H, UH, B, UB, DO_MUL)
+VMADDWOD_U_S(vmaddwod_w_hu_h, 32, W, UW, H, UH, DO_MUL)
+VMADDWOD_U_S(vmaddwod_d_wu_w, 64, D, UD, W, UW, DO_MUL)
-- 
2.31.1


