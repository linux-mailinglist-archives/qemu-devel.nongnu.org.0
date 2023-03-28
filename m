Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF366CB4A0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:12:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzgw-0001vC-SB; Mon, 27 Mar 2023 23:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzgt-0001fK-RO
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:08:07 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzgq-0001tX-5y
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:08:07 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Axu5e+WSJkW9oSAA--.28886S3;
 Tue, 28 Mar 2023 11:06:38 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S14; 
 Tue, 28 Mar 2023 11:06:38 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 12/44] target/loongarch: Implement vabsd
Date: Tue, 28 Mar 2023 11:05:59 +0800
Message-Id: <20230328030631.3117129-13-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S14
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3WF48JFy5Kr43tryfXw45GFg_yoWxKryDpF
 9YgrW7GrWkJFZrXrnYqa15JF4qqrsIgw4S9anag34kZFWUJF95XFZ5t3s29r47G3Z5ZFy7
 Z3W2kry5Jr93W37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
- VABSD.{B/H/W/D}[U].

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  9 ++
 target/loongarch/helper.h                   |  9 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 95 +++++++++++++++++++++
 target/loongarch/insns.decode               |  9 ++
 target/loongarch/lsx_helper.c               | 36 ++++++++
 5 files changed, 158 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index e7592e7a34..e98ea37793 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -925,3 +925,12 @@ INSN_LSX(vavgr_bu,         vvv)
 INSN_LSX(vavgr_hu,         vvv)
 INSN_LSX(vavgr_wu,         vvv)
 INSN_LSX(vavgr_du,         vvv)
+
+INSN_LSX(vabsd_b,          vvv)
+INSN_LSX(vabsd_h,          vvv)
+INSN_LSX(vabsd_w,          vvv)
+INSN_LSX(vabsd_d,          vvv)
+INSN_LSX(vabsd_bu,         vvv)
+INSN_LSX(vabsd_hu,         vvv)
+INSN_LSX(vabsd_wu,         vvv)
+INSN_LSX(vabsd_du,         vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 021fe3cd60..a2f1999997 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -214,3 +214,12 @@ DEF_HELPER_FLAGS_4(vavgr_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vavgr_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vavgr_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vavgr_du, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vabsd_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vabsd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vabsd_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vabsd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vabsd_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vabsd_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vabsd_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vabsd_du, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 512fe947f6..3a75347db1 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -1174,3 +1174,98 @@ TRANS(vavgr_bu, gvec_vvv, MO_8, do_vavgr_u)
 TRANS(vavgr_hu, gvec_vvv, MO_16, do_vavgr_u)
 TRANS(vavgr_wu, gvec_vvv, MO_32, do_vavgr_u)
 TRANS(vavgr_du, gvec_vvv, MO_64, do_vavgr_u)
+
+static void gen_vabsd_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    tcg_gen_smax_vec(vece, t, a, b);
+    tcg_gen_smin_vec(vece, a, a, b);
+    tcg_gen_sub_vec(vece, t, t, a);
+}
+
+static void do_vabsd_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                       uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_smax_vec, INDEX_op_smin_vec, INDEX_op_sub_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vabsd_s,
+            .fno = gen_helper_vabsd_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vabsd_s,
+            .fno = gen_helper_vabsd_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vabsd_s,
+            .fno = gen_helper_vabsd_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vabsd_s,
+            .fno = gen_helper_vabsd_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+static void gen_vabsd_u(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    tcg_gen_umax_vec(vece, t, a, b);
+    tcg_gen_umin_vec(vece, a, a, b);
+    tcg_gen_sub_vec(vece, t, t, a);
+}
+
+static void do_vabsd_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                       uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_umax_vec, INDEX_op_umin_vec, INDEX_op_sub_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vabsd_u,
+            .fno = gen_helper_vabsd_bu,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vabsd_u,
+            .fno = gen_helper_vabsd_hu,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vabsd_u,
+            .fno = gen_helper_vabsd_wu,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vabsd_u,
+            .fno = gen_helper_vabsd_du,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vabsd_b, gvec_vvv, MO_8, do_vabsd_s)
+TRANS(vabsd_h, gvec_vvv, MO_16, do_vabsd_s)
+TRANS(vabsd_w, gvec_vvv, MO_32, do_vabsd_s)
+TRANS(vabsd_d, gvec_vvv, MO_64, do_vabsd_s)
+TRANS(vabsd_bu, gvec_vvv, MO_8, do_vabsd_u)
+TRANS(vabsd_hu, gvec_vvv, MO_16, do_vabsd_u)
+TRANS(vabsd_wu, gvec_vvv, MO_32, do_vabsd_u)
+TRANS(vabsd_du, gvec_vvv, MO_64, do_vabsd_u)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 4a44380259..825ddedf4d 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -619,3 +619,12 @@ vavgr_bu         0111 00000110 10100 ..... ..... .....    @vvv
 vavgr_hu         0111 00000110 10101 ..... ..... .....    @vvv
 vavgr_wu         0111 00000110 10110 ..... ..... .....    @vvv
 vavgr_du         0111 00000110 10111 ..... ..... .....    @vvv
+
+vabsd_b          0111 00000110 00000 ..... ..... .....    @vvv
+vabsd_h          0111 00000110 00001 ..... ..... .....    @vvv
+vabsd_w          0111 00000110 00010 ..... ..... .....    @vvv
+vabsd_d          0111 00000110 00011 ..... ..... .....    @vvv
+vabsd_bu         0111 00000110 00100 ..... ..... .....    @vvv
+vabsd_hu         0111 00000110 00101 ..... ..... .....    @vvv
+vabsd_wu         0111 00000110 00110 ..... ..... .....    @vvv
+vabsd_du         0111 00000110 00111 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index b539eea6ad..18d566feaa 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -373,3 +373,39 @@ DO_VAVG_U(vavgr_bu, 8, uint8_t, B, DO_VAVGR)
 DO_VAVG_U(vavgr_hu, 16, uint16_t, H, DO_VAVGR)
 DO_VAVG_U(vavgr_wu, 32, uint32_t, W, DO_VAVGR)
 DO_VAVG_U(vavgr_du, 64, uint64_t, D, DO_VAVGR)
+
+#define DO_VABSD(a, b)  ((a > b) ? (a -b) : (b-a))
+
+#define DO_VABSD_S(NAME, BIT, E, DO_OP)                     \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v) \
+{                                                           \
+    int i;                                                  \
+    VReg *Vd = (VReg *)vd;                                  \
+    VReg *Vj = (VReg *)vj;                                  \
+    VReg *Vk = (VReg *)vk;                                  \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                     \
+        Vd->E(i) = DO_OP(Vj->E(i), Vk->E(i));               \
+    }                                                       \
+}
+
+DO_VABSD_S(vabsd_b, 8, B, DO_VABSD)
+DO_VABSD_S(vabsd_h, 16, H, DO_VABSD)
+DO_VABSD_S(vabsd_w, 32, W, DO_VABSD)
+DO_VABSD_S(vabsd_d, 64, D, DO_VABSD)
+
+#define DO_VABSD_U(NAME, BIT, T, E, DO_OP)                  \
+void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v) \
+{                                                           \
+    int i;                                                  \
+    VReg *Vd = (VReg *)vd;                                  \
+    VReg *Vj = (VReg *)vj;                                  \
+    VReg *Vk = (VReg *)vk;                                  \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                     \
+        Vd->E(i) = DO_OP((T)Vj->E(i), (T)Vk->E(i));         \
+    }                                                       \
+}
+
+DO_VABSD_U(vabsd_bu, 8, uint8_t, B, DO_VABSD)
+DO_VABSD_U(vabsd_hu, 16, uint16_t, H, DO_VABSD)
+DO_VABSD_U(vabsd_wu, 32, uint32_t, W, DO_VABSD)
+DO_VABSD_U(vabsd_du, 64, uint64_t, D, DO_VABSD)
-- 
2.31.1


