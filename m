Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17226E8C3F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:09:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPKS-00040w-2v; Thu, 20 Apr 2023 04:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1ppPKN-0003xV-9G
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:07:40 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1ppPKI-00082q-7T
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:07:37 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Axz_+58kBkW2UfAA--.48951S3;
 Thu, 20 Apr 2023 16:07:21 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxur2u8kBkdNUwAA--.59556S16; 
 Thu, 20 Apr 2023 16:07:20 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [RFC PATCH v3 14/44] target/loongarch: Implement
 vmul/vmuh/vmulw{ev/od}
Date: Thu, 20 Apr 2023 16:06:39 +0800
Message-Id: <20230420080709.3352575-15-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230420080709.3352575-1-gaosong@loongson.cn>
References: <20230420080709.3352575-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxur2u8kBkdNUwAA--.59556S16
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoWfur18XF47AF1DWF1DCrW3Wrg_yoW5Wr45uo
 W3Gw45Aa4xKr1agr17Wa40qF4xtrWjyFWDXayjv39YqrWrJF9rtrnxtan8tay8trsakF93
 JFnavF43J3ZYgrZrn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqI1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
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
- VMUL.{B/H/W/D};
- VMUH.{B/H/W/D}[U];
- VMULW{EV/OD}.{H.B/W.H/D.W/Q.D}[U];
- VMULW{EV/OD}.{H.BU.B/W.HU.H/D.WU.W/Q.DU.D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 include/tcg/tcg-op.h                        |   4 +
 target/loongarch/disas.c                    |  38 ++
 target/loongarch/helper.h                   |  30 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 544 ++++++++++++++++++++
 target/loongarch/insns.decode               |  38 ++
 target/loongarch/lsx_helper.c               |  76 +++
 tcg/tcg-op.c                                |  43 ++
 7 files changed, 773 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index dff17c7072..d90af683b5 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -321,6 +321,7 @@ void tcg_gen_sub2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 al,
 void tcg_gen_mulu2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_muls2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_mulsu2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2);
+void tcg_gen_mulus2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_ext8s_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_ext16s_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_ext8u_i32(TCGv_i32 ret, TCGv_i32 arg);
@@ -517,6 +518,7 @@ void tcg_gen_sub2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 al,
 void tcg_gen_mulu2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_muls2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_mulsu2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2);
+void tcg_gen_mulus2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_not_i64(TCGv_i64 ret, TCGv_i64 arg);
 void tcg_gen_ext8s_i64(TCGv_i64 ret, TCGv_i64 arg);
 void tcg_gen_ext16s_i64(TCGv_i64 ret, TCGv_i64 arg);
@@ -1096,6 +1098,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_mulu2_tl tcg_gen_mulu2_i64
 #define tcg_gen_muls2_tl tcg_gen_muls2_i64
 #define tcg_gen_mulsu2_tl tcg_gen_mulsu2_i64
+#define tcg_gen_mulus2_tl tcg_gen_mulus2_i64
 #define tcg_gen_smin_tl tcg_gen_smin_i64
 #define tcg_gen_umin_tl tcg_gen_umin_i64
 #define tcg_gen_smax_tl tcg_gen_smax_i64
@@ -1210,6 +1213,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_mulu2_tl tcg_gen_mulu2_i32
 #define tcg_gen_muls2_tl tcg_gen_muls2_i32
 #define tcg_gen_mulsu2_tl tcg_gen_mulsu2_i32
+#define tcg-gen_mulus2_tl tcg_gen_mulus2_i32
 #define tcg_gen_smin_tl tcg_gen_smin_i32
 #define tcg_gen_umin_tl tcg_gen_umin_i32
 #define tcg_gen_smax_tl tcg_gen_smax_i32
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
index 15bb7888d3..81c1cd6291 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -1514,3 +1514,547 @@ TRANS(vmaxi_bu, gvec_vv_i, MO_8, do_vmaxi_u)
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
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 3136cef81a..97abe6e99a 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -972,6 +972,33 @@ void tcg_gen_mulsu2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2)
     }
 }
 
+void tcg_gen_mulus2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2)
+{
+    if (TCG_TARGET_REG_BITS == 32) {
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+        TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+        TCGv_i32 t2 = tcg_temp_ebb_new_i32();
+        tcg_gen_mulu2_i32(t0, t1, arg1, arg2);
+        /* Adjust for negative input for the signed arg2.  */
+        tcg_gen_sari_i32(t2, arg2, 31);
+        tcg_gen_and_i32(t2, t2, arg1);
+        tcg_gen_sub_i32(rh, t1, t2);
+        tcg_gen_mov_i32(rl, t0);
+        tcg_temp_free_i32(t0);
+        tcg_temp_free_i32(t1);
+        tcg_temp_free_i32(t2);
+    } else {
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+        tcg_gen_extu_i32_i64(t0, arg1);
+        tcg_gen_ext_i32_i64(t1, arg2);
+        tcg_gen_mul_i64(t0, t0, t1);
+        tcg_gen_extr_i64_i32(rl, rh, t0);
+        tcg_temp_free_i64(t0);
+        tcg_temp_free_i64(t1);
+    }
+}
+
 void tcg_gen_ext8s_i32(TCGv_i32 ret, TCGv_i32 arg)
 {
     if (TCG_TARGET_HAS_ext8s_i32) {
@@ -2634,6 +2661,22 @@ void tcg_gen_mulsu2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2)
     tcg_temp_free_i64(t2);
 }
 
+void tcg_gen_mulus2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2)
+{
+    TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
+    tcg_gen_mulu2_i64(t0, t1, arg1, arg2);
+    /* Adjust for negative input for the signed arg2.  */
+    tcg_gen_sari_i64(t2, arg2, 63);
+    tcg_gen_and_i64(t2, t2, arg1);
+    tcg_gen_sub_i64(rh, t1, t2);
+    tcg_gen_mov_i64(rl, t0);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+}
+
 void tcg_gen_smin_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b)
 {
     tcg_gen_movcond_i64(TCG_COND_LT, ret, a, b, a, b);
-- 
2.31.1


