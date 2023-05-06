Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9CF6F8F7A
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 08:46:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvBWj-0005pA-2X; Sat, 06 May 2023 02:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pvBWd-0005l9-VL
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:12 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pvBWb-0004FE-9W
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:11 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cx9ehL9VVk_KQFAA--.9323S3;
 Sat, 06 May 2023 14:35:55 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxDbM89VVkhCNNAA--.9773S23; 
 Sat, 06 May 2023 14:35:55 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL v2 21/45] target/loongarch: Implement LSX logic instructions
Date: Sat,  6 May 2023 14:35:16 +0800
Message-Id: <20230506063540.178794-22-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230506063540.178794-1-gaosong@loongson.cn>
References: <20230506063540.178794-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxDbM89VVkhCNNAA--.9773S23
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKw17Jw17uFyfXFWrKw17Jrb_yoW7ZF1xpr
 1jkry3Kr48JFyxXFna9w45Aw15XrsrKw129w1ftwn5XFWUXF1DXFykJ39F9FWUX3Z5ZFyj
 qF13CryjkF95XwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
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
- V{AND/OR/XOR/NOR/ANDN/ORN}.V;
- V{AND/OR/XOR/NOR}I.B.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-22-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 12 +++++
 target/loongarch/helper.h                   |  2 +
 target/loongarch/insn_trans/trans_lsx.c.inc | 56 +++++++++++++++++++++
 target/loongarch/insns.decode               | 13 +++++
 target/loongarch/lsx_helper.c               | 11 ++++
 5 files changed, 94 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 2725b827ee..eca0a4bb7b 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1091,3 +1091,15 @@ INSN_LSX(vmskltz_w,        vv)
 INSN_LSX(vmskltz_d,        vv)
 INSN_LSX(vmskgez_b,        vv)
 INSN_LSX(vmsknz_b,         vv)
+
+INSN_LSX(vand_v,           vvv)
+INSN_LSX(vor_v,            vvv)
+INSN_LSX(vxor_v,           vvv)
+INSN_LSX(vnor_v,           vvv)
+INSN_LSX(vandn_v,          vvv)
+INSN_LSX(vorn_v,           vvv)
+
+INSN_LSX(vandi_b,          vv_i)
+INSN_LSX(vori_b,           vv_i)
+INSN_LSX(vxori_b,          vv_i)
+INSN_LSX(vnori_b,          vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 34b7b2f576..617c579592 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -350,3 +350,5 @@ DEF_HELPER_3(vmskltz_w, void, env, i32, i32)
 DEF_HELPER_3(vmskltz_d, void, env, i32, i32)
 DEF_HELPER_3(vmskgez_b, void, env, i32, i32)
 DEF_HELPER_3(vmsknz_b, void, env, i32,i32)
+
+DEF_HELPER_FLAGS_4(vnori_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 64387f2666..e5e194106b 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2874,3 +2874,59 @@ TRANS(vmskltz_w, gen_vv, gen_helper_vmskltz_w)
 TRANS(vmskltz_d, gen_vv, gen_helper_vmskltz_d)
 TRANS(vmskgez_b, gen_vv, gen_helper_vmskgez_b)
 TRANS(vmsknz_b, gen_vv, gen_helper_vmsknz_b)
+
+TRANS(vand_v, gvec_vvv, MO_64, tcg_gen_gvec_and)
+TRANS(vor_v, gvec_vvv, MO_64, tcg_gen_gvec_or)
+TRANS(vxor_v, gvec_vvv, MO_64, tcg_gen_gvec_xor)
+TRANS(vnor_v, gvec_vvv, MO_64, tcg_gen_gvec_nor)
+
+static bool trans_vandn_v(DisasContext *ctx, arg_vvv *a)
+{
+    uint32_t vd_ofs, vj_ofs, vk_ofs;
+
+    CHECK_SXE;
+
+    vd_ofs = vec_full_offset(a->vd);
+    vj_ofs = vec_full_offset(a->vj);
+    vk_ofs = vec_full_offset(a->vk);
+
+    tcg_gen_gvec_andc(MO_64, vd_ofs, vk_ofs, vj_ofs, 16, ctx->vl/8);
+    return true;
+}
+TRANS(vorn_v, gvec_vvv, MO_64, tcg_gen_gvec_orc)
+TRANS(vandi_b, gvec_vv_i, MO_8, tcg_gen_gvec_andi)
+TRANS(vori_b, gvec_vv_i, MO_8, tcg_gen_gvec_ori)
+TRANS(vxori_b, gvec_vv_i, MO_8, tcg_gen_gvec_xori)
+
+static void gen_vnori(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
+{
+    TCGv_vec t1;
+
+    t1 = tcg_constant_vec_matching(t, vece, imm);
+    tcg_gen_nor_vec(vece, t, a, t1);
+}
+
+static void gen_vnori_b(TCGv_i64 t, TCGv_i64 a, int64_t imm)
+{
+    tcg_gen_movi_i64(t, dup_const(MO_8, imm));
+    tcg_gen_nor_i64(t, a, t);
+}
+
+static void do_vnori_b(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                       int64_t imm, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_nor_vec, 0
+        };
+    static const GVecGen2i op = {
+       .fni8 = gen_vnori_b,
+       .fniv = gen_vnori,
+       .fnoi = gen_helper_vnori_b,
+       .opt_opc = vecop_list,
+       .vece = MO_8
+    };
+
+    tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, imm, &op);
+}
+
+TRANS(vnori_b, gvec_vv_i, MO_8, do_vnori_b)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 47c1ef78a7..6309683be9 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -503,6 +503,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 @vv_ui4         .... ........ ..... . imm:4 vj:5 vd:5    &vv_i
 @vv_ui5           .... ........ ..... imm:5 vj:5 vd:5    &vv_i
 @vv_ui6            .... ........ .... imm:6 vj:5 vd:5    &vv_i
+@vv_ui8              .... ........ .. imm:8 vj:5 vd:5    &vv_i
 @vv_i5           .... ........ ..... imm:s5 vj:5 vd:5    &vv_i
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
@@ -790,3 +791,15 @@ vmskltz_w        0111 00101001 11000 10010 ..... .....    @vv
 vmskltz_d        0111 00101001 11000 10011 ..... .....    @vv
 vmskgez_b        0111 00101001 11000 10100 ..... .....    @vv
 vmsknz_b         0111 00101001 11000 11000 ..... .....    @vv
+
+vand_v           0111 00010010 01100 ..... ..... .....    @vvv
+vor_v            0111 00010010 01101 ..... ..... .....    @vvv
+vxor_v           0111 00010010 01110 ..... ..... .....    @vvv
+vnor_v           0111 00010010 01111 ..... ..... .....    @vvv
+vandn_v          0111 00010010 10000 ..... ..... .....    @vvv
+vorn_v           0111 00010010 10001 ..... ..... .....    @vvv
+
+vandi_b          0111 00111101 00 ........ ..... .....    @vv_ui8
+vori_b           0111 00111101 01 ........ ..... .....    @vv_ui8
+vxori_b          0111 00111101 10 ........ ..... .....    @vv_ui8
+vnori_b          0111 00111101 11 ........ ..... .....    @vv_ui8
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 2359c63fdf..ff00d60ab8 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -782,3 +782,14 @@ void HELPER(vmsknz_b)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
     Vd->D(0) = (uint16_t)(~temp);
     Vd->D(1) = 0;
 }
+
+void HELPER(vnori_b)(void *vd, void *vj, uint64_t imm, uint32_t v)
+{
+    int i;
+    VReg *Vd = (VReg *)vd;
+    VReg *Vj = (VReg *)vj;
+
+    for (i = 0; i < LSX_LEN/8; i++) {
+        Vd->B(i) = ~(Vj->B(i) | (uint8_t)imm);
+    }
+}
-- 
2.31.1


