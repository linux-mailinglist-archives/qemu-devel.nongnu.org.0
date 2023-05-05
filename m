Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B366F7AE5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 04:29:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pulBg-0004Rz-V1; Thu, 04 May 2023 22:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pulBf-0004Qu-3X
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:28:47 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pulBZ-0007yZ-L3
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:28:44 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxV+nTaVRkw_cEAA--.8137S3;
 Fri, 05 May 2023 10:28:35 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a+2aVRkNw9LAA--.7251S13; 
 Fri, 05 May 2023 10:28:32 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 11/45] target/loongarch: Implement vabsd
Date: Fri,  5 May 2023 10:27:32 +0800
Message-Id: <20230505022806.6082-12-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
References: <20230505022806.6082-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a+2aVRkNw9LAA--.7251S13
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3WF48JF4DJF4UJry3KryUKFg_yoWxAFy5pF
 yFgr4UGrW8GrZrZrnYqa15JF4DtrsIgw4a9anagws5ZFWDJFykXFZ3tr929r4UJ3Z7ZFy7
 X3Wakry5Xr93W37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
- VABSD.{B/H/W/D}[U].

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-12-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  9 ++
 target/loongarch/helper.h                   |  9 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 95 +++++++++++++++++++++
 target/loongarch/insns.decode               |  9 ++
 target/loongarch/lsx_helper.c               | 11 +++
 5 files changed, 133 insertions(+)

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
index af0f9f9b0d..c3a5d2566e 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -211,3 +211,12 @@ DEF_HELPER_FLAGS_4(vavgr_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
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
index 5fa4792305..0e9301bf93 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -1166,3 +1166,98 @@ TRANS(vavgr_bu, gvec_vvv, MO_8, do_vavgr_u)
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
index b683a1cd0a..f0baffa9e3 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -307,3 +307,14 @@ DO_3OP(vavgr_bu, 8, UB, DO_VAVGR)
 DO_3OP(vavgr_hu, 16, UH, DO_VAVGR)
 DO_3OP(vavgr_wu, 32, UW, DO_VAVGR)
 DO_3OP(vavgr_du, 64, UD, DO_VAVGR)
+
+#define DO_VABSD(a, b)  ((a > b) ? (a -b) : (b-a))
+
+DO_3OP(vabsd_b, 8, B, DO_VABSD)
+DO_3OP(vabsd_h, 16, H, DO_VABSD)
+DO_3OP(vabsd_w, 32, W, DO_VABSD)
+DO_3OP(vabsd_d, 64, D, DO_VABSD)
+DO_3OP(vabsd_bu, 8, UB, DO_VABSD)
+DO_3OP(vabsd_hu, 16, UH, DO_VABSD)
+DO_3OP(vabsd_wu, 32, UW, DO_VABSD)
+DO_3OP(vabsd_du, 64, UD, DO_VABSD)
-- 
2.31.1


