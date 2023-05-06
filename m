Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B836F8F4B
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 08:39:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvBWg-0005mh-Mx; Sat, 06 May 2023 02:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pvBWa-0005it-Qy
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:08 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pvBWW-0004D5-MU
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:08 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxdfBH9VVk4qQFAA--.9423S3;
 Sat, 06 May 2023 14:35:51 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxDbM89VVkhCNNAA--.9773S16; 
 Sat, 06 May 2023 14:35:51 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL v2 14/45] target/loongarch: Implement vmul/vmuh/vmulw{ev/od}
Date: Sat,  6 May 2023 14:35:09 +0800
Message-Id: <20230506063540.178794-15-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230506063540.178794-1-gaosong@loongson.cn>
References: <20230506063540.178794-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxDbM89VVkhCNNAA--.9773S16
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoWfXrW8GryxWr1rWr4UWrWUtwb_yoW8Kw15to
 W3Gw45Aa4xKr1agr1UWa92qF4IyrWjya4DXayjv390qrWrJFnrtrn3t3Z8tay0yr4SkF93
 JF92vr43J3ZYgrWDn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqv1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY
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
- VMUL.{B/H/W/D};
- VMUH.{B/H/W/D}[U];
- VMULW{EV/OD}.{H.B/W.H/D.W/Q.D}[U];
- VMULW{EV/OD}.{H.BU.B/W.HU.H/D.WU.W/Q.DU.D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-15-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  38 ++
 target/loongarch/helper.h                   |  30 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 550 ++++++++++++++++++++
 target/loongarch/insns.decode               |  38 ++
 target/loongarch/lsx_helper.c               |  76 +++
 5 files changed, 732 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 6b0e518bfa..48e6ef5309 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -972,3 +972,41 @@ INSN_LSX(vmini_bu,         vv_i)
 INSN_LSX(vmini_hu,         vv_i)
 INSN_LSX(vmini_wu,         vv_i)
 INSN_LSX(vmini_du,         vv_i)
+
+INSN_LSX(vmul_b,           vvv)
+INSN_LSX(vmul_h,           vvv)
+INSN_LSX(vmul_w,           vvv)
+INSN_LSX(vmul_d,           vvv)
+INSN_LSX(vmuh_b,           vvv)
+INSN_LSX(vmuh_h,           vvv)
+INSN_LSX(vmuh_w,           vvv)
+INSN_LSX(vmuh_d,           vvv)
+INSN_LSX(vmuh_bu,          vvv)
+INSN_LSX(vmuh_hu,          vvv)
+INSN_LSX(vmuh_wu,          vvv)
+INSN_LSX(vmuh_du,          vvv)
+
+INSN_LSX(vmulwev_h_b,      vvv)
+INSN_LSX(vmulwev_w_h,      vvv)
+INSN_LSX(vmulwev_d_w,      vvv)
+INSN_LSX(vmulwev_q_d,      vvv)
+INSN_LSX(vmulwod_h_b,      vvv)
+INSN_LSX(vmulwod_w_h,      vvv)
+INSN_LSX(vmulwod_d_w,      vvv)
+INSN_LSX(vmulwod_q_d,      vvv)
+INSN_LSX(vmulwev_h_bu,     vvv)
+INSN_LSX(vmulwev_w_hu,     vvv)
+INSN_LSX(vmulwev_d_wu,     vvv)
+INSN_LSX(vmulwev_q_du,     vvv)
+INSN_LSX(vmulwod_h_bu,     vvv)
+INSN_LSX(vmulwod_w_hu,     vvv)
+INSN_LSX(vmulwod_d_wu,     vvv)
+INSN_LSX(vmulwod_q_du,     vvv)
+INSN_LSX(vmulwev_h_bu_b,   vvv)
+INSN_LSX(vmulwev_w_hu_h,   vvv)
+INSN_LSX(vmulwev_d_wu_w,   vvv)
+INSN_LSX(vmulwev_q_du_d,   vvv)
+INSN_LSX(vmulwod_h_bu_b,   vvv)
+INSN_LSX(vmulwod_w_hu_h,   vvv)
+INSN_LSX(vmulwod_d_wu_w,   vvv)
+INSN_LSX(vmulwod_q_du_d,   vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 379f961d1e..830d8cbe62 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -243,3 +243,33 @@ DEF_HELPER_FLAGS_4(vmaxi_bu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(vmaxi_hu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(vmaxi_wu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(vmaxi_du, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_FLAGS_4(vmuh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmuh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmuh_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmuh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmuh_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmuh_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmuh_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmuh_du, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vmulwev_h_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwev_w_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwev_d_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwod_h_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwod_w_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwod_d_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vmulwev_h_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwev_w_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwev_d_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwod_h_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwod_w_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwod_d_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vmulwev_h_bu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwev_w_hu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwev_d_wu_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwod_h_bu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwod_w_hu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vmulwod_d_wu_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 15bb7888d3..9a36f942e2 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -1514,3 +1514,553 @@ TRANS(vmaxi_bu, gvec_vv_i, MO_8, do_vmaxi_u)
 TRANS(vmaxi_hu, gvec_vv_i, MO_16, do_vmaxi_u)
 TRANS(vmaxi_wu, gvec_vv_i, MO_32, do_vmaxi_u)
 TRANS(vmaxi_du, gvec_vv_i, MO_64, do_vmaxi_u)
+
+TRANS(vmul_b, gvec_vvv, MO_8, tcg_gen_gvec_mul)
+TRANS(vmul_h, gvec_vvv, MO_16, tcg_gen_gvec_mul)
+TRANS(vmul_w, gvec_vvv, MO_32, tcg_gen_gvec_mul)
+TRANS(vmul_d, gvec_vvv, MO_64, tcg_gen_gvec_mul)
+
+static void gen_vmuh_w(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 discard = tcg_temp_new_i32();
+    tcg_gen_muls2_i32(discard, t, a, b);
+}
+
+static void gen_vmuh_d(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 discard = tcg_temp_new_i64();
+    tcg_gen_muls2_i64(discard, t, a, b);
+}
+
+static void do_vmuh_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                      uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen3 op[4] = {
+        {
+            .fno = gen_helper_vmuh_b,
+            .vece = MO_8
+        },
+        {
+            .fno = gen_helper_vmuh_h,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmuh_w,
+            .fno = gen_helper_vmuh_w,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmuh_d,
+            .fno = gen_helper_vmuh_d,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmuh_b, gvec_vvv, MO_8, do_vmuh_s)
+TRANS(vmuh_h, gvec_vvv, MO_16, do_vmuh_s)
+TRANS(vmuh_w, gvec_vvv, MO_32, do_vmuh_s)
+TRANS(vmuh_d, gvec_vvv, MO_64, do_vmuh_s)
+
+static void gen_vmuh_wu(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 discard = tcg_temp_new_i32();
+    tcg_gen_mulu2_i32(discard, t, a, b);
+}
+
+static void gen_vmuh_du(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 discard = tcg_temp_new_i64();
+    tcg_gen_mulu2_i64(discard, t, a, b);
+}
+
+static void do_vmuh_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                      uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen3 op[4] = {
+        {
+            .fno = gen_helper_vmuh_bu,
+            .vece = MO_8
+        },
+        {
+            .fno = gen_helper_vmuh_hu,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmuh_wu,
+            .fno = gen_helper_vmuh_wu,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmuh_du,
+            .fno = gen_helper_vmuh_du,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmuh_bu, gvec_vvv, MO_8,  do_vmuh_u)
+TRANS(vmuh_hu, gvec_vvv, MO_16, do_vmuh_u)
+TRANS(vmuh_wu, gvec_vvv, MO_32, do_vmuh_u)
+TRANS(vmuh_du, gvec_vvv, MO_64, do_vmuh_u)
+
+static void gen_vmulwev_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+    tcg_gen_shli_vec(vece, t1, a, halfbits);
+    tcg_gen_sari_vec(vece, t1, t1, halfbits);
+    tcg_gen_shli_vec(vece, t2, b, halfbits);
+    tcg_gen_sari_vec(vece, t2, t2, halfbits);
+    tcg_gen_mul_vec(vece, t, t1, t2);
+}
+
+static void gen_vmulwev_w_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_ext16s_i32(t1, a);
+    tcg_gen_ext16s_i32(t2, b);
+    tcg_gen_mul_i32(t, t1, t2);
+}
+
+static void gen_vmulwev_d_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_ext32s_i64(t1, a);
+    tcg_gen_ext32s_i64(t2, b);
+    tcg_gen_mul_i64(t, t1, t2);
+}
+
+static void do_vmulwev_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                         uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec, INDEX_op_mul_vec, 0
+        };
+    static const GVecGen3 op[3] = {
+        {
+            .fniv = gen_vmulwev_s,
+            .fno = gen_helper_vmulwev_h_b,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmulwev_w_h,
+            .fniv = gen_vmulwev_s,
+            .fno = gen_helper_vmulwev_w_h,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmulwev_d_w,
+            .fniv = gen_vmulwev_s,
+            .fno = gen_helper_vmulwev_d_w,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmulwev_h_b, gvec_vvv, MO_8, do_vmulwev_s)
+TRANS(vmulwev_w_h, gvec_vvv, MO_16, do_vmulwev_s)
+TRANS(vmulwev_d_w, gvec_vvv, MO_32, do_vmulwev_s)
+
+static void tcg_gen_mulus2_i64(TCGv_i64 rl, TCGv_i64 rh,
+                               TCGv_i64 arg1, TCGv_i64 arg2)
+{
+    tcg_gen_mulsu2_i64(rl, rh, arg2, arg1);
+}
+
+#define VMUL_Q(NAME, FN, idx1, idx2)                      \
+static bool trans_## NAME (DisasContext *ctx, arg_vvv *a) \
+{                                                         \
+    TCGv_i64 rh, rl, arg1, arg2;                          \
+                                                          \
+    rh = tcg_temp_new_i64();                              \
+    rl = tcg_temp_new_i64();                              \
+    arg1 = tcg_temp_new_i64();                            \
+    arg2 = tcg_temp_new_i64();                            \
+                                                          \
+    get_vreg64(arg1, a->vj, idx1);                        \
+    get_vreg64(arg2, a->vk, idx2);                        \
+                                                          \
+    tcg_gen_## FN ##_i64(rl, rh, arg1, arg2);             \
+                                                          \
+    set_vreg64(rh, a->vd, 1);                             \
+    set_vreg64(rl, a->vd, 0);                             \
+                                                          \
+    return true;                                          \
+}
+
+VMUL_Q(vmulwev_q_d, muls2, 0, 0)
+VMUL_Q(vmulwod_q_d, muls2, 1, 1)
+VMUL_Q(vmulwev_q_du, mulu2, 0, 0)
+VMUL_Q(vmulwod_q_du, mulu2, 1, 1)
+VMUL_Q(vmulwev_q_du_d, mulus2, 0, 0)
+VMUL_Q(vmulwod_q_du_d, mulus2, 1, 1)
+
+static void gen_vmulwod_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+    tcg_gen_sari_vec(vece, t1, a, halfbits);
+    tcg_gen_sari_vec(vece, t2, b, halfbits);
+    tcg_gen_mul_vec(vece, t, t1, t2);
+}
+
+static void gen_vmulwod_w_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_sari_i32(t1, a, 16);
+    tcg_gen_sari_i32(t2, b, 16);
+    tcg_gen_mul_i32(t, t1, t2);
+}
+
+static void gen_vmulwod_d_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_sari_i64(t1, a, 32);
+    tcg_gen_sari_i64(t2, b, 32);
+    tcg_gen_mul_i64(t, t1, t2);
+}
+
+static void do_vmulwod_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                         uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_sari_vec, INDEX_op_mul_vec, 0
+        };
+    static const GVecGen3 op[3] = {
+        {
+            .fniv = gen_vmulwod_s,
+            .fno = gen_helper_vmulwod_h_b,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmulwod_w_h,
+            .fniv = gen_vmulwod_s,
+            .fno = gen_helper_vmulwod_w_h,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmulwod_d_w,
+            .fniv = gen_vmulwod_s,
+            .fno = gen_helper_vmulwod_d_w,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmulwod_h_b, gvec_vvv, MO_8, do_vmulwod_s)
+TRANS(vmulwod_w_h, gvec_vvv, MO_16, do_vmulwod_s)
+TRANS(vmulwod_d_w, gvec_vvv, MO_32, do_vmulwod_s)
+
+static void gen_vmulwev_u(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2, mask;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+    mask = tcg_constant_vec_matching(t, vece, MAKE_64BIT_MASK(0, 4 << vece));
+    tcg_gen_and_vec(vece, t1, a, mask);
+    tcg_gen_and_vec(vece, t2, b, mask);
+    tcg_gen_mul_vec(vece, t, t1, t2);
+}
+
+static void gen_vmulwev_w_hu(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_ext16u_i32(t1, a);
+    tcg_gen_ext16u_i32(t2, b);
+    tcg_gen_mul_i32(t, t1, t2);
+}
+
+static void gen_vmulwev_d_wu(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_ext32u_i64(t1, a);
+    tcg_gen_ext32u_i64(t2, b);
+    tcg_gen_mul_i64(t, t1, t2);
+}
+
+static void do_vmulwev_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                         uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_mul_vec, 0
+        };
+    static const GVecGen3 op[3] = {
+        {
+            .fniv = gen_vmulwev_u,
+            .fno = gen_helper_vmulwev_h_bu,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmulwev_w_hu,
+            .fniv = gen_vmulwev_u,
+            .fno = gen_helper_vmulwev_w_hu,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmulwev_d_wu,
+            .fniv = gen_vmulwev_u,
+            .fno = gen_helper_vmulwev_d_wu,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmulwev_h_bu, gvec_vvv, MO_8, do_vmulwev_u)
+TRANS(vmulwev_w_hu, gvec_vvv, MO_16, do_vmulwev_u)
+TRANS(vmulwev_d_wu, gvec_vvv, MO_32, do_vmulwev_u)
+
+static void gen_vmulwod_u(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+    tcg_gen_shri_vec(vece, t1, a, halfbits);
+    tcg_gen_shri_vec(vece, t2, b, halfbits);
+    tcg_gen_mul_vec(vece, t, t1, t2);
+}
+
+static void gen_vmulwod_w_hu(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_shri_i32(t1, a, 16);
+    tcg_gen_shri_i32(t2, b, 16);
+    tcg_gen_mul_i32(t, t1, t2);
+}
+
+static void gen_vmulwod_d_wu(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_shri_i64(t1, a, 32);
+    tcg_gen_shri_i64(t2, b, 32);
+    tcg_gen_mul_i64(t, t1, t2);
+}
+
+static void do_vmulwod_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                         uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_mul_vec, 0
+        };
+    static const GVecGen3 op[3] = {
+        {
+            .fniv = gen_vmulwod_u,
+            .fno = gen_helper_vmulwod_h_bu,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmulwod_w_hu,
+            .fniv = gen_vmulwod_u,
+            .fno = gen_helper_vmulwod_w_hu,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmulwod_d_wu,
+            .fniv = gen_vmulwod_u,
+            .fno = gen_helper_vmulwod_d_wu,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmulwod_h_bu, gvec_vvv, MO_8, do_vmulwod_u)
+TRANS(vmulwod_w_hu, gvec_vvv, MO_16, do_vmulwod_u)
+TRANS(vmulwod_d_wu, gvec_vvv, MO_32, do_vmulwod_u)
+
+static void gen_vmulwev_u_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
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
+    tcg_gen_mul_vec(vece, t, t1, t2);
+}
+
+static void gen_vmulwev_w_hu_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_ext16u_i32(t1, a);
+    tcg_gen_ext16s_i32(t2, b);
+    tcg_gen_mul_i32(t, t1, t2);
+}
+
+static void gen_vmulwev_d_wu_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_ext32u_i64(t1, a);
+    tcg_gen_ext32s_i64(t2, b);
+    tcg_gen_mul_i64(t, t1, t2);
+}
+
+static void do_vmulwev_u_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                           uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec, INDEX_op_mul_vec, 0
+        };
+    static const GVecGen3 op[3] = {
+        {
+            .fniv = gen_vmulwev_u_s,
+            .fno = gen_helper_vmulwev_h_bu_b,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmulwev_w_hu_h,
+            .fniv = gen_vmulwev_u_s,
+            .fno = gen_helper_vmulwev_w_hu_h,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmulwev_d_wu_w,
+            .fniv = gen_vmulwev_u_s,
+            .fno = gen_helper_vmulwev_d_wu_w,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmulwev_h_bu_b, gvec_vvv, MO_8, do_vmulwev_u_s)
+TRANS(vmulwev_w_hu_h, gvec_vvv, MO_16, do_vmulwev_u_s)
+TRANS(vmulwev_d_wu_w, gvec_vvv, MO_32, do_vmulwev_u_s)
+
+static void gen_vmulwod_u_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t1, t2;
+    int halfbits = 4 << vece;
+
+    t1 = tcg_temp_new_vec_matching(a);
+    t2 = tcg_temp_new_vec_matching(b);
+    tcg_gen_shri_vec(vece, t1, a, halfbits);
+    tcg_gen_sari_vec(vece, t2, b, halfbits);
+    tcg_gen_mul_vec(vece, t, t1, t2);
+}
+
+static void gen_vmulwod_w_hu_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+    tcg_gen_shri_i32(t1, a, 16);
+    tcg_gen_sari_i32(t2, b, 16);
+    tcg_gen_mul_i32(t, t1, t2);
+}
+static void gen_vmulwod_d_wu_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1, t2;
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    tcg_gen_shri_i64(t1, a, 32);
+    tcg_gen_sari_i64(t2, b, 32);
+    tcg_gen_mul_i64(t, t1, t2);
+}
+
+static void do_vmulwod_u_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                           uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_sari_vec, INDEX_op_mul_vec, 0
+        };
+    static const GVecGen3 op[3] = {
+        {
+            .fniv = gen_vmulwod_u_s,
+            .fno = gen_helper_vmulwod_h_bu_b,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fni4 = gen_vmulwod_w_hu_h,
+            .fniv = gen_vmulwod_u_s,
+            .fno = gen_helper_vmulwod_w_hu_h,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vmulwod_d_wu_w,
+            .fniv = gen_vmulwod_u_s,
+            .fno = gen_helper_vmulwod_d_wu_w,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vmulwod_h_bu_b, gvec_vvv, MO_8, do_vmulwod_u_s)
+TRANS(vmulwod_w_hu_h, gvec_vvv, MO_16, do_vmulwod_u_s)
+TRANS(vmulwod_d_wu_w, gvec_vvv, MO_32, do_vmulwod_u_s)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index dd1bc031e8..64e8042c9c 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -668,3 +668,41 @@ vmini_bu         0111 00101001 01100 ..... ..... .....    @vv_ui5
 vmini_hu         0111 00101001 01101 ..... ..... .....    @vv_ui5
 vmini_wu         0111 00101001 01110 ..... ..... .....    @vv_ui5
 vmini_du         0111 00101001 01111 ..... ..... .....    @vv_ui5
+
+vmul_b           0111 00001000 01000 ..... ..... .....    @vvv
+vmul_h           0111 00001000 01001 ..... ..... .....    @vvv
+vmul_w           0111 00001000 01010 ..... ..... .....    @vvv
+vmul_d           0111 00001000 01011 ..... ..... .....    @vvv
+vmuh_b           0111 00001000 01100 ..... ..... .....    @vvv
+vmuh_h           0111 00001000 01101 ..... ..... .....    @vvv
+vmuh_w           0111 00001000 01110 ..... ..... .....    @vvv
+vmuh_d           0111 00001000 01111 ..... ..... .....    @vvv
+vmuh_bu          0111 00001000 10000 ..... ..... .....    @vvv
+vmuh_hu          0111 00001000 10001 ..... ..... .....    @vvv
+vmuh_wu          0111 00001000 10010 ..... ..... .....    @vvv
+vmuh_du          0111 00001000 10011 ..... ..... .....    @vvv
+
+vmulwev_h_b      0111 00001001 00000 ..... ..... .....    @vvv
+vmulwev_w_h      0111 00001001 00001 ..... ..... .....    @vvv
+vmulwev_d_w      0111 00001001 00010 ..... ..... .....    @vvv
+vmulwev_q_d      0111 00001001 00011 ..... ..... .....    @vvv
+vmulwod_h_b      0111 00001001 00100 ..... ..... .....    @vvv
+vmulwod_w_h      0111 00001001 00101 ..... ..... .....    @vvv
+vmulwod_d_w      0111 00001001 00110 ..... ..... .....    @vvv
+vmulwod_q_d      0111 00001001 00111 ..... ..... .....    @vvv
+vmulwev_h_bu     0111 00001001 10000 ..... ..... .....    @vvv
+vmulwev_w_hu     0111 00001001 10001 ..... ..... .....    @vvv
+vmulwev_d_wu     0111 00001001 10010 ..... ..... .....    @vvv
+vmulwev_q_du     0111 00001001 10011 ..... ..... .....    @vvv
+vmulwod_h_bu     0111 00001001 10100 ..... ..... .....    @vvv
+vmulwod_w_hu     0111 00001001 10101 ..... ..... .....    @vvv
+vmulwod_d_wu     0111 00001001 10110 ..... ..... .....    @vvv
+vmulwod_q_du     0111 00001001 10111 ..... ..... .....    @vvv
+vmulwev_h_bu_b   0111 00001010 00000 ..... ..... .....    @vvv
+vmulwev_w_hu_h   0111 00001010 00001 ..... ..... .....    @vvv
+vmulwev_d_wu_w   0111 00001010 00010 ..... ..... .....    @vvv
+vmulwev_q_du_d   0111 00001010 00011 ..... ..... .....    @vvv
+vmulwod_h_bu_b   0111 00001010 00100 ..... ..... .....    @vvv
+vmulwod_w_hu_h   0111 00001010 00101 ..... ..... .....    @vvv
+vmulwod_d_wu_w   0111 00001010 00110 ..... ..... .....    @vvv
+vmulwod_q_du_d   0111 00001010 00111 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 40f52bf07d..3b565277fd 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -370,3 +370,79 @@ VMINMAXI(vmaxi_bu, 8, UB, DO_MAX)
 VMINMAXI(vmaxi_hu, 16, UH, DO_MAX)
 VMINMAXI(vmaxi_wu, 32, UW, DO_MAX)
 VMINMAXI(vmaxi_du, 64, UD, DO_MAX)
+
+#define DO_VMUH(NAME, BIT, E1, E2, DO_OP)                   \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v) \
+{                                                           \
+    int i;                                                  \
+    VReg *Vd = (VReg *)vd;                                  \
+    VReg *Vj = (VReg *)vj;                                  \
+    VReg *Vk = (VReg *)vk;                                  \
+    typedef __typeof(Vd->E1(0)) T;                          \
+                                                            \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                     \
+        Vd->E2(i) = ((T)Vj->E2(i)) * ((T)Vk->E2(i)) >> BIT; \
+    }                                                       \
+}
+
+void HELPER(vmuh_d)(void *vd, void *vj, void *vk, uint32_t v)
+{
+    uint64_t l, h1, h2;
+    VReg *Vd = (VReg *)vd;
+    VReg *Vj = (VReg *)vj;
+    VReg *Vk = (VReg *)vk;
+
+    muls64(&l, &h1, Vj->D(0), Vk->D(0));
+    muls64(&l, &h2, Vj->D(1), Vk->D(1));
+
+    Vd->D(0) = h1;
+    Vd->D(1) = h2;
+}
+
+DO_VMUH(vmuh_b, 8, H, B, DO_MUH)
+DO_VMUH(vmuh_h, 16, W, H, DO_MUH)
+DO_VMUH(vmuh_w, 32, D, W, DO_MUH)
+
+void HELPER(vmuh_du)(void *vd, void *vj, void *vk, uint32_t v)
+{
+    uint64_t l, h1, h2;
+    VReg *Vd = (VReg *)vd;
+    VReg *Vj = (VReg *)vj;
+    VReg *Vk = (VReg *)vk;
+
+    mulu64(&l, &h1, Vj->D(0), Vk->D(0));
+    mulu64(&l, &h2, Vj->D(1), Vk->D(1));
+
+    Vd->D(0) = h1;
+    Vd->D(1) = h2;
+}
+
+DO_VMUH(vmuh_bu, 8, UH, UB, DO_MUH)
+DO_VMUH(vmuh_hu, 16, UW, UH, DO_MUH)
+DO_VMUH(vmuh_wu, 32, UD, UW, DO_MUH)
+
+#define DO_MUL(a, b) (a * b)
+
+DO_EVEN(vmulwev_h_b, 16, H, B, DO_MUL)
+DO_EVEN(vmulwev_w_h, 32, W, H, DO_MUL)
+DO_EVEN(vmulwev_d_w, 64, D, W, DO_MUL)
+
+DO_ODD(vmulwod_h_b, 16, H, B, DO_MUL)
+DO_ODD(vmulwod_w_h, 32, W, H, DO_MUL)
+DO_ODD(vmulwod_d_w, 64, D, W, DO_MUL)
+
+DO_EVEN(vmulwev_h_bu, 16, UH, UB, DO_MUL)
+DO_EVEN(vmulwev_w_hu, 32, UW, UH, DO_MUL)
+DO_EVEN(vmulwev_d_wu, 64, UD, UW, DO_MUL)
+
+DO_ODD(vmulwod_h_bu, 16, UH, UB, DO_MUL)
+DO_ODD(vmulwod_w_hu, 32, UW, UH, DO_MUL)
+DO_ODD(vmulwod_d_wu, 64, UD, UW, DO_MUL)
+
+DO_EVEN_U_S(vmulwev_h_bu_b, 16, H, UH, B, UB, DO_MUL)
+DO_EVEN_U_S(vmulwev_w_hu_h, 32, W, UW, H, UH, DO_MUL)
+DO_EVEN_U_S(vmulwev_d_wu_w, 64, D, UD, W, UW, DO_MUL)
+
+DO_ODD_U_S(vmulwod_h_bu_b, 16, H, UH, B, UB, DO_MUL)
+DO_ODD_U_S(vmulwod_w_hu_h, 32, W, UW, H, UH, DO_MUL)
+DO_ODD_U_S(vmulwod_d_wu_w, 64, D, UD, W, UW, DO_MUL)
-- 
2.31.1


