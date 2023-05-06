Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030B96F8F73
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 08:44:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvBYN-0001Ul-AJ; Sat, 06 May 2023 02:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pvBYL-0001Ro-AY
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:37:57 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pvBYG-0004lD-M6
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:37:57 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxCepR9VVkFqUFAA--.9245S3;
 Sat, 06 May 2023 14:36:01 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxDbM89VVkhCNNAA--.9773S33; 
 Sat, 06 May 2023 14:36:00 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL v2 31/45] target/loongarch: Implement vbitclr vbitset vbitrev
Date: Sat,  6 May 2023 14:35:26 +0800
Message-Id: <20230506063540.178794-32-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230506063540.178794-1-gaosong@loongson.cn>
References: <20230506063540.178794-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxDbM89VVkhCNNAA--.9773S33
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3Zr4UGF4UZr48CrWDCw1xZrb_yoW8Xw43Jo
 ZFq3WrJrW8Jr1rGFyUC3WxX3Z7tF40va9xXayj9w4qva4rAF47tr1Fq3WrKa97trW29a43
 Jr9ruF45XFnYvrykn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUql1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
 CY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
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
- VBITCLR[I].{B/H/W/D};
- VBITSET[I].{B/H/W/D};
- VBITREV[I].{B/H/W/D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-32-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  25 ++
 target/loongarch/helper.h                   |  27 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 305 ++++++++++++++++++++
 target/loongarch/insns.decode               |  25 ++
 target/loongarch/lsx_helper.c               |  55 ++++
 5 files changed, 437 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 0ca51de9d8..48c7ea47a4 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1272,3 +1272,28 @@ INSN_LSX(vpcnt_b,          vv)
 INSN_LSX(vpcnt_h,          vv)
 INSN_LSX(vpcnt_w,          vv)
 INSN_LSX(vpcnt_d,          vv)
+
+INSN_LSX(vbitclr_b,        vvv)
+INSN_LSX(vbitclr_h,        vvv)
+INSN_LSX(vbitclr_w,        vvv)
+INSN_LSX(vbitclr_d,        vvv)
+INSN_LSX(vbitclri_b,       vv_i)
+INSN_LSX(vbitclri_h,       vv_i)
+INSN_LSX(vbitclri_w,       vv_i)
+INSN_LSX(vbitclri_d,       vv_i)
+INSN_LSX(vbitset_b,        vvv)
+INSN_LSX(vbitset_h,        vvv)
+INSN_LSX(vbitset_w,        vvv)
+INSN_LSX(vbitset_d,        vvv)
+INSN_LSX(vbitseti_b,       vv_i)
+INSN_LSX(vbitseti_h,       vv_i)
+INSN_LSX(vbitseti_w,       vv_i)
+INSN_LSX(vbitseti_d,       vv_i)
+INSN_LSX(vbitrev_b,        vvv)
+INSN_LSX(vbitrev_h,        vvv)
+INSN_LSX(vbitrev_w,        vvv)
+INSN_LSX(vbitrev_d,        vvv)
+INSN_LSX(vbitrevi_b,       vv_i)
+INSN_LSX(vbitrevi_h,       vv_i)
+INSN_LSX(vbitrevi_w,       vv_i)
+INSN_LSX(vbitrevi_d,       vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 96b9b16923..75120ca55e 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -485,3 +485,30 @@ DEF_HELPER_3(vpcnt_b, void, env, i32, i32)
 DEF_HELPER_3(vpcnt_h, void, env, i32, i32)
 DEF_HELPER_3(vpcnt_w, void, env, i32, i32)
 DEF_HELPER_3(vpcnt_d, void, env, i32, i32)
+
+DEF_HELPER_FLAGS_4(vbitclr_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vbitclr_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vbitclr_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vbitclr_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vbitclri_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vbitclri_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vbitclri_w, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vbitclri_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_FLAGS_4(vbitset_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vbitset_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vbitset_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vbitset_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vbitseti_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vbitseti_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vbitseti_w, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vbitseti_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_FLAGS_4(vbitrev_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vbitrev_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vbitrev_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vbitrev_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vbitrevi_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vbitrevi_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vbitrevi_w, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vbitrevi_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index f4ebdca63c..86243b54ba 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -3111,3 +3111,308 @@ TRANS(vpcnt_b, gen_vv, gen_helper_vpcnt_b)
 TRANS(vpcnt_h, gen_vv, gen_helper_vpcnt_h)
 TRANS(vpcnt_w, gen_vv, gen_helper_vpcnt_w)
 TRANS(vpcnt_d, gen_vv, gen_helper_vpcnt_d)
+
+static void do_vbit(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
+                    void (*func)(unsigned, TCGv_vec, TCGv_vec, TCGv_vec))
+{
+    TCGv_vec mask, lsh, t1, one;
+
+    lsh = tcg_temp_new_vec_matching(t);
+    t1 = tcg_temp_new_vec_matching(t);
+    mask = tcg_constant_vec_matching(t, vece, (8 << vece) - 1);
+    one = tcg_constant_vec_matching(t, vece, 1);
+
+    tcg_gen_and_vec(vece, lsh, b, mask);
+    tcg_gen_shlv_vec(vece, t1, one, lsh);
+    func(vece, t, a, t1);
+}
+
+static void gen_vbitclr(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    do_vbit(vece, t, a, b, tcg_gen_andc_vec);
+}
+
+static void gen_vbitset(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    do_vbit(vece, t, a, b, tcg_gen_or_vec);
+}
+
+static void gen_vbitrev(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    do_vbit(vece, t, a, b, tcg_gen_xor_vec);
+}
+
+static void do_vbitclr(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                      uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shlv_vec, INDEX_op_andc_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vbitclr,
+            .fno = gen_helper_vbitclr_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vbitclr,
+            .fno = gen_helper_vbitclr_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vbitclr,
+            .fno = gen_helper_vbitclr_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vbitclr,
+            .fno = gen_helper_vbitclr_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vbitclr_b, gvec_vvv, MO_8, do_vbitclr)
+TRANS(vbitclr_h, gvec_vvv, MO_16, do_vbitclr)
+TRANS(vbitclr_w, gvec_vvv, MO_32, do_vbitclr)
+TRANS(vbitclr_d, gvec_vvv, MO_64, do_vbitclr)
+
+static void do_vbiti(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm,
+                     void (*func)(unsigned, TCGv_vec, TCGv_vec, TCGv_vec))
+{
+    int lsh;
+    TCGv_vec t1, one;
+
+    lsh = imm & ((8 << vece) -1);
+    t1 = tcg_temp_new_vec_matching(t);
+    one = tcg_constant_vec_matching(t, vece, 1);
+
+    tcg_gen_shli_vec(vece, t1, one, lsh);
+    func(vece, t, a, t1);
+}
+
+static void gen_vbitclri(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    do_vbiti(vece, t, a, imm, tcg_gen_andc_vec);
+}
+
+static void gen_vbitseti(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    do_vbiti(vece, t, a, imm, tcg_gen_or_vec);
+}
+
+static void gen_vbitrevi(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    do_vbiti(vece, t, a, imm, tcg_gen_xor_vec);
+}
+
+static void do_vbitclri(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                        int64_t imm, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shli_vec, INDEX_op_andc_vec, 0
+        };
+    static const GVecGen2i op[4] = {
+        {
+            .fniv = gen_vbitclri,
+            .fnoi = gen_helper_vbitclri_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vbitclri,
+            .fnoi = gen_helper_vbitclri_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vbitclri,
+            .fnoi = gen_helper_vbitclri_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vbitclri,
+            .fnoi = gen_helper_vbitclri_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, imm, &op[vece]);
+}
+
+TRANS(vbitclri_b, gvec_vv_i, MO_8, do_vbitclri)
+TRANS(vbitclri_h, gvec_vv_i, MO_16, do_vbitclri)
+TRANS(vbitclri_w, gvec_vv_i, MO_32, do_vbitclri)
+TRANS(vbitclri_d, gvec_vv_i, MO_64, do_vbitclri)
+
+static void do_vbitset(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                       uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shlv_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vbitset,
+            .fno = gen_helper_vbitset_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vbitset,
+            .fno = gen_helper_vbitset_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vbitset,
+            .fno = gen_helper_vbitset_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vbitset,
+            .fno = gen_helper_vbitset_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vbitset_b, gvec_vvv, MO_8, do_vbitset)
+TRANS(vbitset_h, gvec_vvv, MO_16, do_vbitset)
+TRANS(vbitset_w, gvec_vvv, MO_32, do_vbitset)
+TRANS(vbitset_d, gvec_vvv, MO_64, do_vbitset)
+
+static void do_vbitseti(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                        int64_t imm, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shli_vec, 0
+        };
+    static const GVecGen2i op[4] = {
+        {
+            .fniv = gen_vbitseti,
+            .fnoi = gen_helper_vbitseti_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vbitseti,
+            .fnoi = gen_helper_vbitseti_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vbitseti,
+            .fnoi = gen_helper_vbitseti_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vbitseti,
+            .fnoi = gen_helper_vbitseti_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, imm, &op[vece]);
+}
+
+TRANS(vbitseti_b, gvec_vv_i, MO_8, do_vbitseti)
+TRANS(vbitseti_h, gvec_vv_i, MO_16, do_vbitseti)
+TRANS(vbitseti_w, gvec_vv_i, MO_32, do_vbitseti)
+TRANS(vbitseti_d, gvec_vv_i, MO_64, do_vbitseti)
+
+static void do_vbitrev(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                       uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shlv_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vbitrev,
+            .fno = gen_helper_vbitrev_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vbitrev,
+            .fno = gen_helper_vbitrev_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vbitrev,
+            .fno = gen_helper_vbitrev_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vbitrev,
+            .fno = gen_helper_vbitrev_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vbitrev_b, gvec_vvv, MO_8, do_vbitrev)
+TRANS(vbitrev_h, gvec_vvv, MO_16, do_vbitrev)
+TRANS(vbitrev_w, gvec_vvv, MO_32, do_vbitrev)
+TRANS(vbitrev_d, gvec_vvv, MO_64, do_vbitrev)
+
+static void do_vbitrevi(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                        int64_t imm, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shli_vec, 0
+        };
+    static const GVecGen2i op[4] = {
+        {
+            .fniv = gen_vbitrevi,
+            .fnoi = gen_helper_vbitrevi_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vbitrevi,
+            .fnoi = gen_helper_vbitrevi_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vbitrevi,
+            .fnoi = gen_helper_vbitrevi_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vbitrevi,
+            .fnoi = gen_helper_vbitrevi_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, imm, &op[vece]);
+}
+
+TRANS(vbitrevi_b, gvec_vv_i, MO_8, do_vbitrevi)
+TRANS(vbitrevi_h, gvec_vv_i, MO_16, do_vbitrevi)
+TRANS(vbitrevi_w, gvec_vv_i, MO_32, do_vbitrevi)
+TRANS(vbitrevi_d, gvec_vv_i, MO_64, do_vbitrevi)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index f865e83da5..801c97714e 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -973,3 +973,28 @@ vpcnt_b          0111 00101001 11000 01000 ..... .....    @vv
 vpcnt_h          0111 00101001 11000 01001 ..... .....    @vv
 vpcnt_w          0111 00101001 11000 01010 ..... .....    @vv
 vpcnt_d          0111 00101001 11000 01011 ..... .....    @vv
+
+vbitclr_b        0111 00010000 11000 ..... ..... .....    @vvv
+vbitclr_h        0111 00010000 11001 ..... ..... .....    @vvv
+vbitclr_w        0111 00010000 11010 ..... ..... .....    @vvv
+vbitclr_d        0111 00010000 11011 ..... ..... .....    @vvv
+vbitclri_b       0111 00110001 00000 01 ... ..... .....   @vv_ui3
+vbitclri_h       0111 00110001 00000 1 .... ..... .....   @vv_ui4
+vbitclri_w       0111 00110001 00001 ..... ..... .....    @vv_ui5
+vbitclri_d       0111 00110001 0001 ...... ..... .....    @vv_ui6
+vbitset_b        0111 00010000 11100 ..... ..... .....    @vvv
+vbitset_h        0111 00010000 11101 ..... ..... .....    @vvv
+vbitset_w        0111 00010000 11110 ..... ..... .....    @vvv
+vbitset_d        0111 00010000 11111 ..... ..... .....    @vvv
+vbitseti_b       0111 00110001 01000 01 ... ..... .....   @vv_ui3
+vbitseti_h       0111 00110001 01000 1 .... ..... .....   @vv_ui4
+vbitseti_w       0111 00110001 01001 ..... ..... .....    @vv_ui5
+vbitseti_d       0111 00110001 0101 ...... ..... .....    @vv_ui6
+vbitrev_b        0111 00010001 00000 ..... ..... .....    @vvv
+vbitrev_h        0111 00010001 00001 ..... ..... .....    @vvv
+vbitrev_w        0111 00010001 00010 ..... ..... .....    @vvv
+vbitrev_d        0111 00010001 00011 ..... ..... .....    @vvv
+vbitrevi_b       0111 00110001 10000 01 ... ..... .....   @vv_ui3
+vbitrevi_h       0111 00110001 10000 1 .... ..... .....   @vv_ui4
+vbitrevi_w       0111 00110001 10001 ..... ..... .....    @vv_ui5
+vbitrevi_d       0111 00110001 1001 ...... ..... .....    @vv_ui6
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 9f91a47e66..14e2df254d 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1964,3 +1964,58 @@ VPCNT(vpcnt_b, 8, UB, ctpop8)
 VPCNT(vpcnt_h, 16, UH, ctpop16)
 VPCNT(vpcnt_w, 32, UW, ctpop32)
 VPCNT(vpcnt_d, 64, UD, ctpop64)
+
+#define DO_BITCLR(a, bit) (a & ~(1ull << bit))
+#define DO_BITSET(a, bit) (a | 1ull << bit)
+#define DO_BITREV(a, bit) (a ^ (1ull << bit))
+
+#define DO_BIT(NAME, BIT, E, DO_OP)                         \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v) \
+{                                                           \
+    int i;                                                  \
+    VReg *Vd = (VReg *)vd;                                  \
+    VReg *Vj = (VReg *)vj;                                  \
+    VReg *Vk = (VReg *)vk;                                  \
+                                                            \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                     \
+        Vd->E(i) = DO_OP(Vj->E(i), Vk->E(i)%BIT);           \
+    }                                                       \
+}
+
+DO_BIT(vbitclr_b, 8, UB, DO_BITCLR)
+DO_BIT(vbitclr_h, 16, UH, DO_BITCLR)
+DO_BIT(vbitclr_w, 32, UW, DO_BITCLR)
+DO_BIT(vbitclr_d, 64, UD, DO_BITCLR)
+DO_BIT(vbitset_b, 8, UB, DO_BITSET)
+DO_BIT(vbitset_h, 16, UH, DO_BITSET)
+DO_BIT(vbitset_w, 32, UW, DO_BITSET)
+DO_BIT(vbitset_d, 64, UD, DO_BITSET)
+DO_BIT(vbitrev_b, 8, UB, DO_BITREV)
+DO_BIT(vbitrev_h, 16, UH, DO_BITREV)
+DO_BIT(vbitrev_w, 32, UW, DO_BITREV)
+DO_BIT(vbitrev_d, 64, UD, DO_BITREV)
+
+#define DO_BITI(NAME, BIT, E, DO_OP)                            \
+void HELPER(NAME)(void *vd, void *vj, uint64_t imm, uint32_t v) \
+{                                                               \
+    int i;                                                      \
+    VReg *Vd = (VReg *)vd;                                      \
+    VReg *Vj = (VReg *)vj;                                      \
+                                                                \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                         \
+        Vd->E(i) = DO_OP(Vj->E(i), imm);                        \
+    }                                                           \
+}
+
+DO_BITI(vbitclri_b, 8, UB, DO_BITCLR)
+DO_BITI(vbitclri_h, 16, UH, DO_BITCLR)
+DO_BITI(vbitclri_w, 32, UW, DO_BITCLR)
+DO_BITI(vbitclri_d, 64, UD, DO_BITCLR)
+DO_BITI(vbitseti_b, 8, UB, DO_BITSET)
+DO_BITI(vbitseti_h, 16, UH, DO_BITSET)
+DO_BITI(vbitseti_w, 32, UW, DO_BITSET)
+DO_BITI(vbitseti_d, 64, UD, DO_BITSET)
+DO_BITI(vbitrevi_b, 8, UB, DO_BITREV)
+DO_BITI(vbitrevi_h, 16, UH, DO_BITREV)
+DO_BITI(vbitrevi_w, 32, UW, DO_BITREV)
+DO_BITI(vbitrevi_d, 64, UD, DO_BITREV)
-- 
2.31.1


