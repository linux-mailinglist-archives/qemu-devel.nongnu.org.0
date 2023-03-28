Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606B06CB48B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:09:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzg1-0007J5-Gp; Mon, 27 Mar 2023 23:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzfi-0007FN-NF
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:55 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzff-0000Qp-Io
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:54 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxJFy_WSJkXtoSAA--.28892S3;
 Tue, 28 Mar 2023 11:06:39 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S16; 
 Tue, 28 Mar 2023 11:06:39 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 14/44] target/loongarch: Implement vmax/vmin
Date: Tue, 28 Mar 2023 11:06:01 +0800
Message-Id: <20230328030631.3117129-15-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S16
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoWfJF4UXw1kXFy8Aw1ftr1xAFb_yoW8GrWUuo
 W3G3yrGw4xKr1fGry5W3W2qF97tr4jyF97ZFWUu3yYgFyfJF17tr13KwnYyayxJrW2gFy3
 J3s7Aw45Xw1Fg34Dn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
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
- VMAX[I].{B/H/W/D}[U];
- VMIN[I].{B/H/W/D}[U].

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  33 +++
 target/loongarch/helper.h                   |  18 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 211 ++++++++++++++++++++
 target/loongarch/insns.decode               |  35 ++++
 target/loongarch/lsx_helper.c               |  43 ++++
 5 files changed, 340 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 1f61e67d1f..6b0e518bfa 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -939,3 +939,36 @@ INSN_LSX(vadda_b,          vvv)
 INSN_LSX(vadda_h,          vvv)
 INSN_LSX(vadda_w,          vvv)
 INSN_LSX(vadda_d,          vvv)
+
+INSN_LSX(vmax_b,           vvv)
+INSN_LSX(vmax_h,           vvv)
+INSN_LSX(vmax_w,           vvv)
+INSN_LSX(vmax_d,           vvv)
+INSN_LSX(vmin_b,           vvv)
+INSN_LSX(vmin_h,           vvv)
+INSN_LSX(vmin_w,           vvv)
+INSN_LSX(vmin_d,           vvv)
+INSN_LSX(vmax_bu,          vvv)
+INSN_LSX(vmax_hu,          vvv)
+INSN_LSX(vmax_wu,          vvv)
+INSN_LSX(vmax_du,          vvv)
+INSN_LSX(vmin_bu,          vvv)
+INSN_LSX(vmin_hu,          vvv)
+INSN_LSX(vmin_wu,          vvv)
+INSN_LSX(vmin_du,          vvv)
+INSN_LSX(vmaxi_b,          vv_i)
+INSN_LSX(vmaxi_h,          vv_i)
+INSN_LSX(vmaxi_w,          vv_i)
+INSN_LSX(vmaxi_d,          vv_i)
+INSN_LSX(vmini_b,          vv_i)
+INSN_LSX(vmini_h,          vv_i)
+INSN_LSX(vmini_w,          vv_i)
+INSN_LSX(vmini_d,          vv_i)
+INSN_LSX(vmaxi_bu,         vv_i)
+INSN_LSX(vmaxi_hu,         vv_i)
+INSN_LSX(vmaxi_wu,         vv_i)
+INSN_LSX(vmaxi_du,         vv_i)
+INSN_LSX(vmini_bu,         vv_i)
+INSN_LSX(vmini_hu,         vv_i)
+INSN_LSX(vmini_wu,         vv_i)
+INSN_LSX(vmini_du,         vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 37685ded2c..f0fc7760bd 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -228,3 +228,21 @@ DEF_HELPER_FLAGS_4(vadda_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vadda_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vadda_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vadda_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vmini_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vmini_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vmini_w, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vmini_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vmini_bu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vmini_hu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vmini_wu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vmini_du, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_FLAGS_4(vmaxi_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vmaxi_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vmaxi_w, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vmaxi_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vmaxi_bu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vmaxi_hu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vmaxi_wu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vmaxi_du, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index a3fcb47c4f..4e2f1ff097 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -1322,3 +1322,214 @@ TRANS(vadda_b, gvec_vvv, MO_8, do_vadda)
 TRANS(vadda_h, gvec_vvv, MO_16, do_vadda)
 TRANS(vadda_w, gvec_vvv, MO_32, do_vadda)
 TRANS(vadda_d, gvec_vvv, MO_64, do_vadda)
+
+TRANS(vmax_b, gvec_vvv, MO_8, tcg_gen_gvec_smax)
+TRANS(vmax_h, gvec_vvv, MO_16, tcg_gen_gvec_smax)
+TRANS(vmax_w, gvec_vvv, MO_32, tcg_gen_gvec_smax)
+TRANS(vmax_d, gvec_vvv, MO_64, tcg_gen_gvec_smax)
+TRANS(vmax_bu, gvec_vvv, MO_8, tcg_gen_gvec_umax)
+TRANS(vmax_hu, gvec_vvv, MO_16, tcg_gen_gvec_umax)
+TRANS(vmax_wu, gvec_vvv, MO_32, tcg_gen_gvec_umax)
+TRANS(vmax_du, gvec_vvv, MO_64, tcg_gen_gvec_umax)
+
+TRANS(vmin_b, gvec_vvv, MO_8, tcg_gen_gvec_smin)
+TRANS(vmin_h, gvec_vvv, MO_16, tcg_gen_gvec_smin)
+TRANS(vmin_w, gvec_vvv, MO_32, tcg_gen_gvec_smin)
+TRANS(vmin_d, gvec_vvv, MO_64, tcg_gen_gvec_smin)
+TRANS(vmin_bu, gvec_vvv, MO_8, tcg_gen_gvec_umin)
+TRANS(vmin_hu, gvec_vvv, MO_16, tcg_gen_gvec_umin)
+TRANS(vmin_wu, gvec_vvv, MO_32, tcg_gen_gvec_umin)
+TRANS(vmin_du, gvec_vvv, MO_64, tcg_gen_gvec_umin)
+
+static void do_vminmax(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm,
+                       void(*gen_vminmax_vec)(unsigned,
+                                              TCGv_vec, TCGv_vec, TCGv_vec))
+{
+    TCGv_vec t1;
+
+    t1 = tcg_temp_new_vec_matching(t);
+    tcg_gen_dupi_vec(vece, t1, imm);
+    gen_vminmax_vec(vece, t, a, t1);
+}
+
+static void gen_vmini_s(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    do_vminmax(vece, t, a, imm, tcg_gen_smin_vec);
+}
+
+static void gen_vmini_u(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    do_vminmax(vece, t, a, imm, tcg_gen_umin_vec);
+}
+
+static void gen_vmaxi_s(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    do_vminmax(vece, t, a, imm, tcg_gen_smax_vec);
+}
+
+static void gen_vmaxi_u(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    do_vminmax(vece, t, a, imm, tcg_gen_umax_vec);
+}
+
+static void do_vmini_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                       int64_t imm, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_smin_vec, 0
+        };
+    static const GVecGen2i op[4] = {
+        {
+            .fniv = gen_vmini_s,
+            .fnoi = gen_helper_vmini_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vmini_s,
+            .fnoi = gen_helper_vmini_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vmini_s,
+            .fnoi = gen_helper_vmini_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vmini_s,
+            .fnoi = gen_helper_vmini_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, imm, &op[vece]);
+}
+
+static void do_vmini_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                       int64_t imm, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_umin_vec, 0
+        };
+    static const GVecGen2i op[4] = {
+        {
+            .fniv = gen_vmini_u,
+            .fnoi = gen_helper_vmini_bu,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vmini_u,
+            .fnoi = gen_helper_vmini_hu,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vmini_u,
+            .fnoi = gen_helper_vmini_wu,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vmini_u,
+            .fnoi = gen_helper_vmini_du,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, imm, &op[vece]);
+}
+
+TRANS(vmini_b, gvec_vv_i, MO_8, do_vmini_s)
+TRANS(vmini_h, gvec_vv_i, MO_16, do_vmini_s)
+TRANS(vmini_w, gvec_vv_i, MO_32, do_vmini_s)
+TRANS(vmini_d, gvec_vv_i, MO_64, do_vmini_s)
+TRANS(vmini_bu, gvec_vv_i, MO_8, do_vmini_u)
+TRANS(vmini_hu, gvec_vv_i, MO_16, do_vmini_u)
+TRANS(vmini_wu, gvec_vv_i, MO_32, do_vmini_u)
+TRANS(vmini_du, gvec_vv_i, MO_64, do_vmini_u)
+
+static void do_vmaxi_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                       int64_t imm, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_smax_vec, 0
+        };
+    static const GVecGen2i op[4] = {
+        {
+            .fniv = gen_vmaxi_s,
+            .fnoi = gen_helper_vmaxi_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vmaxi_s,
+            .fnoi = gen_helper_vmaxi_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vmaxi_s,
+            .fnoi = gen_helper_vmaxi_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vmaxi_s,
+            .fnoi = gen_helper_vmaxi_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, imm, &op[vece]);
+}
+
+static void do_vmaxi_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                       int64_t imm, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_umax_vec, 0
+        };
+    static const GVecGen2i op[4] = {
+        {
+            .fniv = gen_vmaxi_u,
+            .fnoi = gen_helper_vmaxi_bu,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vmaxi_u,
+            .fnoi = gen_helper_vmaxi_hu,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vmaxi_u,
+            .fnoi = gen_helper_vmaxi_wu,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vmaxi_u,
+            .fnoi = gen_helper_vmaxi_du,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, imm, &op[vece]);
+}
+
+TRANS(vmaxi_b, gvec_vv_i, MO_8, do_vmaxi_s)
+TRANS(vmaxi_h, gvec_vv_i, MO_16, do_vmaxi_s)
+TRANS(vmaxi_w, gvec_vv_i, MO_32, do_vmaxi_s)
+TRANS(vmaxi_d, gvec_vv_i, MO_64, do_vmaxi_s)
+TRANS(vmaxi_bu, gvec_vv_i, MO_8, do_vmaxi_u)
+TRANS(vmaxi_hu, gvec_vv_i, MO_16, do_vmaxi_u)
+TRANS(vmaxi_wu, gvec_vv_i, MO_32, do_vmaxi_u)
+TRANS(vmaxi_du, gvec_vv_i, MO_64, do_vmaxi_u)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 6cb22f9297..dd1bc031e8 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -500,6 +500,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 @vv               .... ........ ..... ..... vj:5 vd:5    &vv
 @vvv               .... ........ ..... vk:5 vj:5 vd:5    &vvv
 @vv_ui5           .... ........ ..... imm:5 vj:5 vd:5    &vv_i
+@vv_i5           .... ........ ..... imm:s5 vj:5 vd:5    &vv_i
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
 vadd_h           0111 00000000 10101 ..... ..... .....    @vvv
@@ -633,3 +634,37 @@ vadda_b          0111 00000101 11000 ..... ..... .....    @vvv
 vadda_h          0111 00000101 11001 ..... ..... .....    @vvv
 vadda_w          0111 00000101 11010 ..... ..... .....    @vvv
 vadda_d          0111 00000101 11011 ..... ..... .....    @vvv
+
+vmax_b           0111 00000111 00000 ..... ..... .....    @vvv
+vmax_h           0111 00000111 00001 ..... ..... .....    @vvv
+vmax_w           0111 00000111 00010 ..... ..... .....    @vvv
+vmax_d           0111 00000111 00011 ..... ..... .....    @vvv
+vmaxi_b          0111 00101001 00000 ..... ..... .....    @vv_i5
+vmaxi_h          0111 00101001 00001 ..... ..... .....    @vv_i5
+vmaxi_w          0111 00101001 00010 ..... ..... .....    @vv_i5
+vmaxi_d          0111 00101001 00011 ..... ..... .....    @vv_i5
+vmax_bu          0111 00000111 01000 ..... ..... .....    @vvv
+vmax_hu          0111 00000111 01001 ..... ..... .....    @vvv
+vmax_wu          0111 00000111 01010 ..... ..... .....    @vvv
+vmax_du          0111 00000111 01011 ..... ..... .....    @vvv
+vmaxi_bu         0111 00101001 01000 ..... ..... .....    @vv_ui5
+vmaxi_hu         0111 00101001 01001 ..... ..... .....    @vv_ui5
+vmaxi_wu         0111 00101001 01010 ..... ..... .....    @vv_ui5
+vmaxi_du         0111 00101001 01011 ..... ..... .....    @vv_ui5
+
+vmin_b           0111 00000111 00100 ..... ..... .....    @vvv
+vmin_h           0111 00000111 00101 ..... ..... .....    @vvv
+vmin_w           0111 00000111 00110 ..... ..... .....    @vvv
+vmin_d           0111 00000111 00111 ..... ..... .....    @vvv
+vmini_b          0111 00101001 00100 ..... ..... .....    @vv_i5
+vmini_h          0111 00101001 00101 ..... ..... .....    @vv_i5
+vmini_w          0111 00101001 00110 ..... ..... .....    @vv_i5
+vmini_d          0111 00101001 00111 ..... ..... .....    @vv_i5
+vmin_bu          0111 00000111 01100 ..... ..... .....    @vvv
+vmin_hu          0111 00000111 01101 ..... ..... .....    @vvv
+vmin_wu          0111 00000111 01110 ..... ..... .....    @vvv
+vmin_du          0111 00000111 01111 ..... ..... .....    @vvv
+vmini_bu         0111 00101001 01100 ..... ..... .....    @vv_ui5
+vmini_hu         0111 00101001 01101 ..... ..... .....    @vv_ui5
+vmini_wu         0111 00101001 01110 ..... ..... .....    @vv_ui5
+vmini_du         0111 00101001 01111 ..... ..... .....    @vv_ui5
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index c28eb62cff..e2ee419e0a 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -428,3 +428,46 @@ DO_VADDA(vadda_b, 8, B, DO_VABS)
 DO_VADDA(vadda_h, 16, H, DO_VABS)
 DO_VADDA(vadda_w, 32, W, DO_VABS)
 DO_VADDA(vadda_d, 64, D, DO_VABS)
+
+#define DO_MIN(a, b) (a < b ? a : b)
+#define DO_MAX(a, b) (a > b ? a : b)
+
+#define DO_VMINMAXI_S(NAME, BIT, T, E, DO_OP)                   \
+void HELPER(NAME)(void *vd, void *vj, uint64_t imm, uint32_t v) \
+{                                                               \
+    int i;                                                      \
+    VReg *Vd = (VReg *)vd;                                      \
+    VReg *Vj = (VReg *)vj;                                      \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                         \
+        Vd->E(i) = DO_OP(Vj->E(i), (T)imm);                     \
+    }                                                           \
+}
+
+DO_VMINMAXI_S(vmini_b, 8, int8_t, B, DO_MIN)
+DO_VMINMAXI_S(vmini_h, 16, int16_t, H, DO_MIN)
+DO_VMINMAXI_S(vmini_w, 32, int32_t, W, DO_MIN)
+DO_VMINMAXI_S(vmini_d, 64, int64_t, D, DO_MIN)
+DO_VMINMAXI_S(vmaxi_b, 8, int8_t, B, DO_MAX)
+DO_VMINMAXI_S(vmaxi_h, 16, int16_t, H, DO_MAX)
+DO_VMINMAXI_S(vmaxi_w, 32, int32_t, W, DO_MAX)
+DO_VMINMAXI_S(vmaxi_d, 64, int64_t, D, DO_MAX)
+
+#define DO_VMINMAXI_U(NAME, BIT, T, E, DO_OP)                   \
+void HELPER(NAME)(void *vd, void *vj, uint64_t imm, uint32_t v) \
+{                                                               \
+    int i;                                                      \
+    VReg *Vd = (VReg *)vd;                                      \
+    VReg *Vj = (VReg *)vj;                                      \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                         \
+        Vd->E(i) = DO_OP((T)Vj->E(i), (T)imm);                  \
+    }                                                           \
+}
+
+DO_VMINMAXI_U(vmini_bu, 8, uint8_t, B, DO_MIN)
+DO_VMINMAXI_U(vmini_hu, 16, uint16_t, H, DO_MIN)
+DO_VMINMAXI_U(vmini_wu, 32, uint32_t, W, DO_MIN)
+DO_VMINMAXI_U(vmini_du, 64, uint64_t, D, DO_MIN)
+DO_VMINMAXI_U(vmaxi_bu, 8, uint8_t, B, DO_MAX)
+DO_VMINMAXI_U(vmaxi_hu, 16, uint16_t, H, DO_MAX)
+DO_VMINMAXI_U(vmaxi_wu, 32, uint32_t, W, DO_MAX)
+DO_VMINMAXI_U(vmaxi_du, 64, uint64_t, D, DO_MAX)
-- 
2.31.1


