Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35046F8F45
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 08:39:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvBWp-0005tN-7R; Sat, 06 May 2023 02:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pvBWl-0005rQ-AI
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:19 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pvBWh-0004Kt-S6
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:19 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxOupS9VVkIKUFAA--.9214S3;
 Sat, 06 May 2023 14:36:02 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxDbM89VVkhCNNAA--.9773S37; 
 Sat, 06 May 2023 14:36:02 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL v2 35/45] target/loongarch: Implement vseq vsle vslt
Date: Sat,  6 May 2023 14:35:30 +0800
Message-Id: <20230506063540.178794-36-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230506063540.178794-1-gaosong@loongson.cn>
References: <20230506063540.178794-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxDbM89VVkhCNNAA--.9773S37
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3KrWkCrW8JrWkKFW8Zw48Crg_yoW8Gr1DXo
 W7G345JF48Gr15Cr1UCas7XryqyryIyFn7Xayqvw4vqFW5try7KrnxKryrAw4ftrWag343
 GrWjyr45Xw4Fvrykn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUql1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY
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
- VSEQ[I].{B/H/W/D};
- VSLE[I].{B/H/W/D}[U];
- VSLT[I].{B/H/W/D/}[U].

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-36-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  43 +++++
 target/loongarch/helper.h                   |  23 +++
 target/loongarch/insn_trans/trans_lsx.c.inc | 185 ++++++++++++++++++++
 target/loongarch/insns.decode               |  43 +++++
 target/loongarch/lsx_helper.c               |  38 ++++
 5 files changed, 332 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index c04271081f..e589b23f4c 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1404,3 +1404,46 @@ INSN_LSX(vffint_d_lu,      vv)
 INSN_LSX(vffintl_d_w,      vv)
 INSN_LSX(vffinth_d_w,      vv)
 INSN_LSX(vffint_s_l,       vvv)
+
+INSN_LSX(vseq_b,           vvv)
+INSN_LSX(vseq_h,           vvv)
+INSN_LSX(vseq_w,           vvv)
+INSN_LSX(vseq_d,           vvv)
+INSN_LSX(vseqi_b,          vv_i)
+INSN_LSX(vseqi_h,          vv_i)
+INSN_LSX(vseqi_w,          vv_i)
+INSN_LSX(vseqi_d,          vv_i)
+
+INSN_LSX(vsle_b,           vvv)
+INSN_LSX(vsle_h,           vvv)
+INSN_LSX(vsle_w,           vvv)
+INSN_LSX(vsle_d,           vvv)
+INSN_LSX(vslei_b,          vv_i)
+INSN_LSX(vslei_h,          vv_i)
+INSN_LSX(vslei_w,          vv_i)
+INSN_LSX(vslei_d,          vv_i)
+INSN_LSX(vsle_bu,          vvv)
+INSN_LSX(vsle_hu,          vvv)
+INSN_LSX(vsle_wu,          vvv)
+INSN_LSX(vsle_du,          vvv)
+INSN_LSX(vslei_bu,         vv_i)
+INSN_LSX(vslei_hu,         vv_i)
+INSN_LSX(vslei_wu,         vv_i)
+INSN_LSX(vslei_du,         vv_i)
+
+INSN_LSX(vslt_b,           vvv)
+INSN_LSX(vslt_h,           vvv)
+INSN_LSX(vslt_w,           vvv)
+INSN_LSX(vslt_d,           vvv)
+INSN_LSX(vslti_b,          vv_i)
+INSN_LSX(vslti_h,          vv_i)
+INSN_LSX(vslti_w,          vv_i)
+INSN_LSX(vslti_d,          vv_i)
+INSN_LSX(vslt_bu,          vvv)
+INSN_LSX(vslt_hu,          vvv)
+INSN_LSX(vslt_wu,          vvv)
+INSN_LSX(vslt_du,          vvv)
+INSN_LSX(vslti_bu,         vv_i)
+INSN_LSX(vslti_hu,         vv_i)
+INSN_LSX(vslti_wu,         vv_i)
+INSN_LSX(vslti_du,         vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index f32235aa97..e9e9fa7f87 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -614,3 +614,26 @@ DEF_HELPER_3(vffint_d_lu, void, env, i32, i32)
 DEF_HELPER_3(vffintl_d_w, void, env, i32, i32)
 DEF_HELPER_3(vffinth_d_w, void, env, i32, i32)
 DEF_HELPER_4(vffint_s_l, void, env, i32, i32, i32)
+
+DEF_HELPER_FLAGS_4(vseqi_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vseqi_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vseqi_w, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vseqi_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_FLAGS_4(vslei_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vslei_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vslei_w, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vslei_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vslei_bu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vslei_hu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vslei_wu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vslei_du, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_FLAGS_4(vslti_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vslti_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vslti_w, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vslti_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vslti_bu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vslti_hu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vslti_wu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vslti_du, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index e0c72c6bff..4d9f88bf4f 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -3532,3 +3532,188 @@ TRANS(vffint_d_lu, gen_vv, gen_helper_vffint_d_lu)
 TRANS(vffintl_d_w, gen_vv, gen_helper_vffintl_d_w)
 TRANS(vffinth_d_w, gen_vv, gen_helper_vffinth_d_w)
 TRANS(vffint_s_l, gen_vvv, gen_helper_vffint_s_l)
+
+static bool do_cmp(DisasContext *ctx, arg_vvv *a, MemOp mop, TCGCond cond)
+{
+    uint32_t vd_ofs, vj_ofs, vk_ofs;
+
+    CHECK_SXE;
+
+    vd_ofs = vec_full_offset(a->vd);
+    vj_ofs = vec_full_offset(a->vj);
+    vk_ofs = vec_full_offset(a->vk);
+
+    tcg_gen_gvec_cmp(cond, mop, vd_ofs, vj_ofs, vk_ofs, 16, ctx->vl/8);
+    return true;
+}
+
+static void do_cmpi_vec(TCGCond cond,
+                        unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    tcg_gen_cmp_vec(cond, vece, t, a, tcg_constant_vec_matching(t, vece, imm));
+}
+
+static void gen_vseqi_s_vec(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    do_cmpi_vec(TCG_COND_EQ, vece, t, a, imm);
+}
+
+static void gen_vslei_s_vec(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    do_cmpi_vec(TCG_COND_LE, vece, t, a, imm);
+}
+
+static void gen_vslti_s_vec(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    do_cmpi_vec(TCG_COND_LT, vece, t, a, imm);
+}
+
+static void gen_vslei_u_vec(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    do_cmpi_vec(TCG_COND_LEU, vece, t, a, imm);
+}
+
+static void gen_vslti_u_vec(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    do_cmpi_vec(TCG_COND_LTU, vece, t, a, imm);
+}
+
+#define DO_CMPI_S(NAME)                                                \
+static bool do_## NAME ##_s(DisasContext *ctx, arg_vv_i *a, MemOp mop) \
+{                                                                      \
+    uint32_t vd_ofs, vj_ofs;                                           \
+                                                                       \
+    CHECK_SXE;                                                         \
+                                                                       \
+    static const TCGOpcode vecop_list[] = {                            \
+        INDEX_op_cmp_vec, 0                                            \
+    };                                                                 \
+    static const GVecGen2i op[4] = {                                   \
+        {                                                              \
+            .fniv = gen_## NAME ##_s_vec,                              \
+            .fnoi = gen_helper_## NAME ##_b,                           \
+            .opt_opc = vecop_list,                                     \
+            .vece = MO_8                                               \
+        },                                                             \
+        {                                                              \
+            .fniv = gen_## NAME ##_s_vec,                              \
+            .fnoi = gen_helper_## NAME ##_h,                           \
+            .opt_opc = vecop_list,                                     \
+            .vece = MO_16                                              \
+        },                                                             \
+        {                                                              \
+            .fniv = gen_## NAME ##_s_vec,                              \
+            .fnoi = gen_helper_## NAME ##_w,                           \
+            .opt_opc = vecop_list,                                     \
+            .vece = MO_32                                              \
+        },                                                             \
+        {                                                              \
+            .fniv = gen_## NAME ##_s_vec,                              \
+            .fnoi = gen_helper_## NAME ##_d,                           \
+            .opt_opc = vecop_list,                                     \
+            .vece = MO_64                                              \
+        }                                                              \
+    };                                                                 \
+                                                                       \
+    vd_ofs = vec_full_offset(a->vd);                                   \
+    vj_ofs = vec_full_offset(a->vj);                                   \
+                                                                       \
+    tcg_gen_gvec_2i(vd_ofs, vj_ofs, 16, ctx->vl/8, a->imm, &op[mop]);  \
+                                                                       \
+    return true;                                                       \
+}
+
+DO_CMPI_S(vseqi)
+DO_CMPI_S(vslei)
+DO_CMPI_S(vslti)
+
+#define DO_CMPI_U(NAME)                                                \
+static bool do_## NAME ##_u(DisasContext *ctx, arg_vv_i *a, MemOp mop) \
+{                                                                      \
+    uint32_t vd_ofs, vj_ofs;                                           \
+                                                                       \
+    CHECK_SXE;                                                         \
+                                                                       \
+    static const TCGOpcode vecop_list[] = {                            \
+        INDEX_op_cmp_vec, 0                                            \
+    };                                                                 \
+    static const GVecGen2i op[4] = {                                   \
+        {                                                              \
+            .fniv = gen_## NAME ##_u_vec,                              \
+            .fnoi = gen_helper_## NAME ##_bu,                          \
+            .opt_opc = vecop_list,                                     \
+            .vece = MO_8                                               \
+        },                                                             \
+        {                                                              \
+            .fniv = gen_## NAME ##_u_vec,                              \
+            .fnoi = gen_helper_## NAME ##_hu,                          \
+            .opt_opc = vecop_list,                                     \
+            .vece = MO_16                                              \
+        },                                                             \
+        {                                                              \
+            .fniv = gen_## NAME ##_u_vec,                              \
+            .fnoi = gen_helper_## NAME ##_wu,                          \
+            .opt_opc = vecop_list,                                     \
+            .vece = MO_32                                              \
+        },                                                             \
+        {                                                              \
+            .fniv = gen_## NAME ##_u_vec,                              \
+            .fnoi = gen_helper_## NAME ##_du,                          \
+            .opt_opc = vecop_list,                                     \
+            .vece = MO_64                                              \
+        }                                                              \
+    };                                                                 \
+                                                                       \
+    vd_ofs = vec_full_offset(a->vd);                                   \
+    vj_ofs = vec_full_offset(a->vj);                                   \
+                                                                       \
+    tcg_gen_gvec_2i(vd_ofs, vj_ofs, 16, ctx->vl/8, a->imm, &op[mop]);  \
+                                                                       \
+    return true;                                                       \
+}
+
+DO_CMPI_U(vslei)
+DO_CMPI_U(vslti)
+
+TRANS(vseq_b, do_cmp, MO_8, TCG_COND_EQ)
+TRANS(vseq_h, do_cmp, MO_16, TCG_COND_EQ)
+TRANS(vseq_w, do_cmp, MO_32, TCG_COND_EQ)
+TRANS(vseq_d, do_cmp, MO_64, TCG_COND_EQ)
+TRANS(vseqi_b, do_vseqi_s, MO_8)
+TRANS(vseqi_h, do_vseqi_s, MO_16)
+TRANS(vseqi_w, do_vseqi_s, MO_32)
+TRANS(vseqi_d, do_vseqi_s, MO_64)
+
+TRANS(vsle_b, do_cmp, MO_8, TCG_COND_LE)
+TRANS(vsle_h, do_cmp, MO_16, TCG_COND_LE)
+TRANS(vsle_w, do_cmp, MO_32, TCG_COND_LE)
+TRANS(vsle_d, do_cmp, MO_64, TCG_COND_LE)
+TRANS(vslei_b, do_vslei_s, MO_8)
+TRANS(vslei_h, do_vslei_s, MO_16)
+TRANS(vslei_w, do_vslei_s, MO_32)
+TRANS(vslei_d, do_vslei_s, MO_64)
+TRANS(vsle_bu, do_cmp, MO_8, TCG_COND_LEU)
+TRANS(vsle_hu, do_cmp, MO_16, TCG_COND_LEU)
+TRANS(vsle_wu, do_cmp, MO_32, TCG_COND_LEU)
+TRANS(vsle_du, do_cmp, MO_64, TCG_COND_LEU)
+TRANS(vslei_bu, do_vslei_u, MO_8)
+TRANS(vslei_hu, do_vslei_u, MO_16)
+TRANS(vslei_wu, do_vslei_u, MO_32)
+TRANS(vslei_du, do_vslei_u, MO_64)
+
+TRANS(vslt_b, do_cmp, MO_8, TCG_COND_LT)
+TRANS(vslt_h, do_cmp, MO_16, TCG_COND_LT)
+TRANS(vslt_w, do_cmp, MO_32, TCG_COND_LT)
+TRANS(vslt_d, do_cmp, MO_64, TCG_COND_LT)
+TRANS(vslti_b, do_vslti_s, MO_8)
+TRANS(vslti_h, do_vslti_s, MO_16)
+TRANS(vslti_w, do_vslti_s, MO_32)
+TRANS(vslti_d, do_vslti_s, MO_64)
+TRANS(vslt_bu, do_cmp, MO_8, TCG_COND_LTU)
+TRANS(vslt_hu, do_cmp, MO_16, TCG_COND_LTU)
+TRANS(vslt_wu, do_cmp, MO_32, TCG_COND_LTU)
+TRANS(vslt_du, do_cmp, MO_64, TCG_COND_LTU)
+TRANS(vslti_bu, do_vslti_u, MO_8)
+TRANS(vslti_hu, do_vslti_u, MO_16)
+TRANS(vslti_wu, do_vslti_u, MO_32)
+TRANS(vslti_du, do_vslti_u, MO_64)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 2ef0f73018..a090a7d22b 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -1102,3 +1102,46 @@ vffint_d_lu      0111 00101001 11100 00011 ..... .....    @vv
 vffintl_d_w      0111 00101001 11100 00100 ..... .....    @vv
 vffinth_d_w      0111 00101001 11100 00101 ..... .....    @vv
 vffint_s_l       0111 00010100 10000 ..... ..... .....    @vvv
+
+vseq_b           0111 00000000 00000 ..... ..... .....    @vvv
+vseq_h           0111 00000000 00001 ..... ..... .....    @vvv
+vseq_w           0111 00000000 00010 ..... ..... .....    @vvv
+vseq_d           0111 00000000 00011 ..... ..... .....    @vvv
+vseqi_b          0111 00101000 00000 ..... ..... .....    @vv_i5
+vseqi_h          0111 00101000 00001 ..... ..... .....    @vv_i5
+vseqi_w          0111 00101000 00010 ..... ..... .....    @vv_i5
+vseqi_d          0111 00101000 00011 ..... ..... .....    @vv_i5
+
+vsle_b           0111 00000000 00100 ..... ..... .....    @vvv
+vsle_h           0111 00000000 00101 ..... ..... .....    @vvv
+vsle_w           0111 00000000 00110 ..... ..... .....    @vvv
+vsle_d           0111 00000000 00111 ..... ..... .....    @vvv
+vslei_b          0111 00101000 00100 ..... ..... .....    @vv_i5
+vslei_h          0111 00101000 00101 ..... ..... .....    @vv_i5
+vslei_w          0111 00101000 00110 ..... ..... .....    @vv_i5
+vslei_d          0111 00101000 00111 ..... ..... .....    @vv_i5
+vsle_bu          0111 00000000 01000 ..... ..... .....    @vvv
+vsle_hu          0111 00000000 01001 ..... ..... .....    @vvv
+vsle_wu          0111 00000000 01010 ..... ..... .....    @vvv
+vsle_du          0111 00000000 01011 ..... ..... .....    @vvv
+vslei_bu         0111 00101000 01000 ..... ..... .....    @vv_ui5
+vslei_hu         0111 00101000 01001 ..... ..... .....    @vv_ui5
+vslei_wu         0111 00101000 01010 ..... ..... .....    @vv_ui5
+vslei_du         0111 00101000 01011 ..... ..... .....    @vv_ui5
+
+vslt_b           0111 00000000 01100 ..... ..... .....    @vvv
+vslt_h           0111 00000000 01101 ..... ..... .....    @vvv
+vslt_w           0111 00000000 01110 ..... ..... .....    @vvv
+vslt_d           0111 00000000 01111 ..... ..... .....    @vvv
+vslti_b          0111 00101000 01100 ..... ..... .....    @vv_i5
+vslti_h          0111 00101000 01101 ..... ..... .....    @vv_i5
+vslti_w          0111 00101000 01110 ..... ..... .....    @vv_i5
+vslti_d          0111 00101000 01111 ..... ..... .....    @vv_i5
+vslt_bu          0111 00000000 10000 ..... ..... .....    @vvv
+vslt_hu          0111 00000000 10001 ..... ..... .....    @vvv
+vslt_wu          0111 00000000 10010 ..... ..... .....    @vvv
+vslt_du          0111 00000000 10011 ..... ..... .....    @vvv
+vslti_bu         0111 00101000 10000 ..... ..... .....    @vv_ui5
+vslti_hu         0111 00101000 10001 ..... ..... .....    @vv_ui5
+vslti_wu         0111 00101000 10010 ..... ..... .....    @vv_ui5
+vslti_du         0111 00101000 10011 ..... ..... .....    @vv_ui5
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 82e484c878..21d9714d5f 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -2622,3 +2622,41 @@ void HELPER(vffint_s_l)(CPULoongArchState *env,
     }
     *Vd = temp;
 }
+
+#define VSEQ(a, b) (a == b ? -1 : 0)
+#define VSLE(a, b) (a <= b ? -1 : 0)
+#define VSLT(a, b) (a < b ? -1 : 0)
+
+#define VCMPI(NAME, BIT, E, DO_OP)                              \
+void HELPER(NAME)(void *vd, void *vj, uint64_t imm, uint32_t v) \
+{                                                               \
+    int i;                                                      \
+    VReg *Vd = (VReg *)vd;                                      \
+    VReg *Vj = (VReg *)vj;                                      \
+    typedef __typeof(Vd->E(0)) TD;                              \
+                                                                \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                         \
+        Vd->E(i) = DO_OP(Vj->E(i), (TD)imm);                    \
+    }                                                           \
+}
+
+VCMPI(vseqi_b, 8, B, VSEQ)
+VCMPI(vseqi_h, 16, H, VSEQ)
+VCMPI(vseqi_w, 32, W, VSEQ)
+VCMPI(vseqi_d, 64, D, VSEQ)
+VCMPI(vslei_b, 8, B, VSLE)
+VCMPI(vslei_h, 16, H, VSLE)
+VCMPI(vslei_w, 32, W, VSLE)
+VCMPI(vslei_d, 64, D, VSLE)
+VCMPI(vslei_bu, 8, UB, VSLE)
+VCMPI(vslei_hu, 16, UH, VSLE)
+VCMPI(vslei_wu, 32, UW, VSLE)
+VCMPI(vslei_du, 64, UD, VSLE)
+VCMPI(vslti_b, 8, B, VSLT)
+VCMPI(vslti_h, 16, H, VSLT)
+VCMPI(vslti_w, 32, W, VSLT)
+VCMPI(vslti_d, 64, D, VSLT)
+VCMPI(vslti_bu, 8, UB, VSLT)
+VCMPI(vslti_hu, 16, UH, VSLT)
+VCMPI(vslti_wu, 32, UW, VSLT)
+VCMPI(vslti_du, 64, UD, VSLT)
-- 
2.31.1


