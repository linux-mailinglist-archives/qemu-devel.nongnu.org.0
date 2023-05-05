Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE9A6F7B16
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 04:37:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pulCA-0004i8-BJ; Thu, 04 May 2023 22:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pulC8-0004hN-5x
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:16 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pulC4-0000Ep-M5
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:15 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxSurraVRk5_cEAA--.8203S3;
 Fri, 05 May 2023 10:28:59 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a+2aVRkNw9LAA--.7251S23; 
 Fri, 05 May 2023 10:28:57 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 21/45] target/loongarch: Implement LSX logic instructions
Date: Fri,  5 May 2023 10:27:42 +0800
Message-Id: <20230505022806.6082-22-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
References: <20230505022806.6082-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a+2aVRkNw9LAA--.7251S23
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKw17Jw17uFyfXFWrKw17Jrb_yoW7ZF1xpr
 1jkry3Kr48JFyxXFna9w45Aw15XrsrKw129w1ftwn5XFWUXF1DXFykJ39F9FWUX3Z5ZFyj
 qF13CryjkF95XwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bo8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVW8ZVWrXwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_
 JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
 6r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0z
 RVWlkUUUUU=
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


