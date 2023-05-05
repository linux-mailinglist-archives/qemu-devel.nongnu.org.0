Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79096F7AE6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 04:29:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pulBh-0004S0-21; Thu, 04 May 2023 22:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pulBf-0004RA-42
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:28:47 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pulBZ-000803-S5
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:28:44 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxI_DTaVRkyPcEAA--.8128S3;
 Fri, 05 May 2023 10:28:35 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a+2aVRkNw9LAA--.7251S12; 
 Fri, 05 May 2023 10:28:29 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 10/45] target/loongarch: Implement vavg/vavgr
Date: Fri,  5 May 2023 10:27:31 +0800
Message-Id: <20230505022806.6082-11-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
References: <20230505022806.6082-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a+2aVRkNw9LAA--.7251S12
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3tr15WF17KrWftw1UWr17ZFb_yoWkWr15p3
 WFqr17GF4UGFZrXF1Fva1rAFsrKrsIgw1a9rsIgFnavFWUAFn5A397tFyj9r4UGFn7Za4U
 Z3W2kryYqrZxWw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bOAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I
 8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWU
 AwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x
 0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
 Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE
 6wZ7UUUUU==
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
- VAVG.{B/H/W/D}[U];
- VAVGR.{B/H/W/D}[U].

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-11-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  17 ++
 target/loongarch/helper.h                   |  18 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 197 ++++++++++++++++++++
 target/loongarch/insns.decode               |  17 ++
 target/loongarch/lsx_helper.c               |  32 ++++
 5 files changed, 281 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 8ee14916f3..e7592e7a34 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -908,3 +908,20 @@ INSN_LSX(vaddwod_h_bu_b,   vvv)
 INSN_LSX(vaddwod_w_hu_h,   vvv)
 INSN_LSX(vaddwod_d_wu_w,   vvv)
 INSN_LSX(vaddwod_q_du_d,   vvv)
+
+INSN_LSX(vavg_b,           vvv)
+INSN_LSX(vavg_h,           vvv)
+INSN_LSX(vavg_w,           vvv)
+INSN_LSX(vavg_d,           vvv)
+INSN_LSX(vavg_bu,          vvv)
+INSN_LSX(vavg_hu,          vvv)
+INSN_LSX(vavg_wu,          vvv)
+INSN_LSX(vavg_du,          vvv)
+INSN_LSX(vavgr_b,          vvv)
+INSN_LSX(vavgr_h,          vvv)
+INSN_LSX(vavgr_w,          vvv)
+INSN_LSX(vavgr_d,          vvv)
+INSN_LSX(vavgr_bu,         vvv)
+INSN_LSX(vavgr_hu,         vvv)
+INSN_LSX(vavgr_wu,         vvv)
+INSN_LSX(vavgr_du,         vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 505c336ff3..af0f9f9b0d 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -193,3 +193,21 @@ DEF_HELPER_FLAGS_4(vaddwod_h_bu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vaddwod_w_hu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vaddwod_d_wu_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vaddwod_q_du_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vavg_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vavg_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vavg_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vavg_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vavg_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vavg_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vavg_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vavg_du, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(vavgr_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vavgr_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vavgr_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vavgr_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vavgr_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vavgr_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vavgr_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(vavgr_du, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 8edff83157..5fa4792305 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -969,3 +969,200 @@ TRANS(vaddwod_h_bu_b, gvec_vvv, MO_8, do_vaddwod_u_s)
 TRANS(vaddwod_w_hu_h, gvec_vvv, MO_16, do_vaddwod_u_s)
 TRANS(vaddwod_d_wu_w, gvec_vvv, MO_32, do_vaddwod_u_s)
 TRANS(vaddwod_q_du_d, gvec_vvv, MO_64, do_vaddwod_u_s)
+
+static void do_vavg(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
+                    void (*gen_shr_vec)(unsigned, TCGv_vec,
+                                        TCGv_vec, int64_t),
+                    void (*gen_round_vec)(unsigned, TCGv_vec,
+                                          TCGv_vec, TCGv_vec))
+{
+    TCGv_vec tmp = tcg_temp_new_vec_matching(t);
+    gen_round_vec(vece, tmp, a, b);
+    tcg_gen_and_vec(vece, tmp, tmp, tcg_constant_vec_matching(t, vece, 1));
+    gen_shr_vec(vece, a, a, 1);
+    gen_shr_vec(vece, b, b, 1);
+    tcg_gen_add_vec(vece, t, a, b);
+    tcg_gen_add_vec(vece, t, t, tmp);
+}
+
+static void gen_vavg_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    do_vavg(vece, t, a, b, tcg_gen_sari_vec, tcg_gen_and_vec);
+}
+
+static void gen_vavg_u(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    do_vavg(vece, t, a, b, tcg_gen_shri_vec, tcg_gen_and_vec);
+}
+
+static void gen_vavgr_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    do_vavg(vece, t, a, b, tcg_gen_sari_vec, tcg_gen_or_vec);
+}
+
+static void gen_vavgr_u(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    do_vavg(vece, t, a, b, tcg_gen_shri_vec, tcg_gen_or_vec);
+}
+
+static void do_vavg_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                      uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_sari_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vavg_s,
+            .fno = gen_helper_vavg_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vavg_s,
+            .fno = gen_helper_vavg_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vavg_s,
+            .fno = gen_helper_vavg_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vavg_s,
+            .fno = gen_helper_vavg_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+static void do_vavg_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                      uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vavg_u,
+            .fno = gen_helper_vavg_bu,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vavg_u,
+            .fno = gen_helper_vavg_hu,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vavg_u,
+            .fno = gen_helper_vavg_wu,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vavg_u,
+            .fno = gen_helper_vavg_du,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vavg_b, gvec_vvv, MO_8, do_vavg_s)
+TRANS(vavg_h, gvec_vvv, MO_16, do_vavg_s)
+TRANS(vavg_w, gvec_vvv, MO_32, do_vavg_s)
+TRANS(vavg_d, gvec_vvv, MO_64, do_vavg_s)
+TRANS(vavg_bu, gvec_vvv, MO_8, do_vavg_u)
+TRANS(vavg_hu, gvec_vvv, MO_16, do_vavg_u)
+TRANS(vavg_wu, gvec_vvv, MO_32, do_vavg_u)
+TRANS(vavg_du, gvec_vvv, MO_64, do_vavg_u)
+
+static void do_vavgr_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                       uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_sari_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vavgr_s,
+            .fno = gen_helper_vavgr_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vavgr_s,
+            .fno = gen_helper_vavgr_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vavgr_s,
+            .fno = gen_helper_vavgr_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vavgr_s,
+            .fno = gen_helper_vavgr_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+static void do_vavgr_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                       uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_add_vec, 0
+        };
+    static const GVecGen3 op[4] = {
+        {
+            .fniv = gen_vavgr_u,
+            .fno = gen_helper_vavgr_bu,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vavgr_u,
+            .fno = gen_helper_vavgr_hu,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vavgr_u,
+            .fno = gen_helper_vavgr_wu,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vavgr_u,
+            .fno = gen_helper_vavgr_du,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
+}
+
+TRANS(vavgr_b, gvec_vvv, MO_8, do_vavgr_s)
+TRANS(vavgr_h, gvec_vvv, MO_16, do_vavgr_s)
+TRANS(vavgr_w, gvec_vvv, MO_32, do_vavgr_s)
+TRANS(vavgr_d, gvec_vvv, MO_64, do_vavgr_s)
+TRANS(vavgr_bu, gvec_vvv, MO_8, do_vavgr_u)
+TRANS(vavgr_hu, gvec_vvv, MO_16, do_vavgr_u)
+TRANS(vavgr_wu, gvec_vvv, MO_32, do_vavgr_u)
+TRANS(vavgr_du, gvec_vvv, MO_64, do_vavgr_u)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index ee16155b31..4a44380259 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -602,3 +602,20 @@ vaddwod_h_bu_b   0111 00000100 00000 ..... ..... .....    @vvv
 vaddwod_w_hu_h   0111 00000100 00001 ..... ..... .....    @vvv
 vaddwod_d_wu_w   0111 00000100 00010 ..... ..... .....    @vvv
 vaddwod_q_du_d   0111 00000100 00011 ..... ..... .....    @vvv
+
+vavg_b           0111 00000110 01000 ..... ..... .....    @vvv
+vavg_h           0111 00000110 01001 ..... ..... .....    @vvv
+vavg_w           0111 00000110 01010 ..... ..... .....    @vvv
+vavg_d           0111 00000110 01011 ..... ..... .....    @vvv
+vavg_bu          0111 00000110 01100 ..... ..... .....    @vvv
+vavg_hu          0111 00000110 01101 ..... ..... .....    @vvv
+vavg_wu          0111 00000110 01110 ..... ..... .....    @vvv
+vavg_du          0111 00000110 01111 ..... ..... .....    @vvv
+vavgr_b          0111 00000110 10000 ..... ..... .....    @vvv
+vavgr_h          0111 00000110 10001 ..... ..... .....    @vvv
+vavgr_w          0111 00000110 10010 ..... ..... .....    @vvv
+vavgr_d          0111 00000110 10011 ..... ..... .....    @vvv
+vavgr_bu         0111 00000110 10100 ..... ..... .....    @vvv
+vavgr_hu         0111 00000110 10101 ..... ..... .....    @vvv
+vavgr_wu         0111 00000110 10110 ..... ..... .....    @vvv
+vavgr_du         0111 00000110 10111 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 6d391f711b..b683a1cd0a 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -275,3 +275,35 @@ void HELPER(vaddwod_q_du_d)(void *vd, void *vj, void *vk, uint32_t v)
 DO_ODD_U_S(vaddwod_h_bu_b, 16, H, UH, B, UB, DO_ADD)
 DO_ODD_U_S(vaddwod_w_hu_h, 32, W, UW, H, UH, DO_ADD)
 DO_ODD_U_S(vaddwod_d_wu_w, 64, D, UD, W, UW, DO_ADD)
+
+#define DO_VAVG(a, b)  ((a >> 1) + (b >> 1) + (a & b & 1))
+#define DO_VAVGR(a, b) ((a >> 1) + (b >> 1) + ((a | b) & 1))
+
+#define DO_3OP(NAME, BIT, E, DO_OP)                         \
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
+DO_3OP(vavg_b, 8, B, DO_VAVG)
+DO_3OP(vavg_h, 16, H, DO_VAVG)
+DO_3OP(vavg_w, 32, W, DO_VAVG)
+DO_3OP(vavg_d, 64, D, DO_VAVG)
+DO_3OP(vavgr_b, 8, B, DO_VAVGR)
+DO_3OP(vavgr_h, 16, H, DO_VAVGR)
+DO_3OP(vavgr_w, 32, W, DO_VAVGR)
+DO_3OP(vavgr_d, 64, D, DO_VAVGR)
+DO_3OP(vavg_bu, 8, UB, DO_VAVG)
+DO_3OP(vavg_hu, 16, UH, DO_VAVG)
+DO_3OP(vavg_wu, 32, UW, DO_VAVG)
+DO_3OP(vavg_du, 64, UD, DO_VAVG)
+DO_3OP(vavgr_bu, 8, UB, DO_VAVGR)
+DO_3OP(vavgr_hu, 16, UH, DO_VAVGR)
+DO_3OP(vavgr_wu, 32, UW, DO_VAVGR)
+DO_3OP(vavgr_du, 64, UD, DO_VAVGR)
-- 
2.31.1


