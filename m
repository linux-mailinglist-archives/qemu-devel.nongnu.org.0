Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6086F7AEC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 04:30:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pulBS-0004NT-3Q; Thu, 04 May 2023 22:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pulBN-0004ML-Km
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:28:29 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pulBJ-0007Kn-Vy
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:28:29 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxCerEaVRkr_cEAA--.8139S3;
 Fri, 05 May 2023 10:28:20 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a+2aVRkNw9LAA--.7251S7; 
 Fri, 05 May 2023 10:28:18 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 05/45] target/loongarch: Implement vaddi/vsubi
Date: Fri,  5 May 2023 10:27:26 +0800
Message-Id: <20230505022806.6082-6-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
References: <20230505022806.6082-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a+2aVRkNw9LAA--.7251S7
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGF13CFyrJFyrAw4xWF4fAFb_yoWrZF1kpw
 1UtrWUCF48Gr97Jrna9w15Wr1YqrnFk34agw1ftw1rZrWUXF1DJry8JrZF9FWxX3WkAFy0
 gF1fCrWjgr95Xw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
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
- VADDI.{B/H/W/D}U;
- VSUBI.{B/H/W/D}U.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-6-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 14 ++++++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 37 +++++++++++++++++++++
 target/loongarch/insns.decode               | 11 ++++++
 3 files changed, 62 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index a5948d7847..c1960610c2 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -797,6 +797,11 @@ static void output_vvv(DisasContext *ctx, arg_vvv *a, const char *mnemonic)
     output(ctx, mnemonic, "v%d, v%d, v%d", a->vd, a->vj, a->vk);
 }
 
+static void output_vv_i(DisasContext *ctx, arg_vv_i *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "v%d, v%d, 0x%x", a->vd, a->vj, a->imm);
+}
+
 INSN_LSX(vadd_b,           vvv)
 INSN_LSX(vadd_h,           vvv)
 INSN_LSX(vadd_w,           vvv)
@@ -807,3 +812,12 @@ INSN_LSX(vsub_h,           vvv)
 INSN_LSX(vsub_w,           vvv)
 INSN_LSX(vsub_d,           vvv)
 INSN_LSX(vsub_q,           vvv)
+
+INSN_LSX(vaddi_bu,         vv_i)
+INSN_LSX(vaddi_hu,         vv_i)
+INSN_LSX(vaddi_wu,         vv_i)
+INSN_LSX(vaddi_du,         vv_i)
+INSN_LSX(vsubi_bu,         vv_i)
+INSN_LSX(vsubi_hu,         vv_i)
+INSN_LSX(vsubi_wu,         vv_i)
+INSN_LSX(vsubi_du,         vv_i)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index ddeb9fde28..e6c1d0d2cc 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -44,6 +44,34 @@ static bool gvec_vvv(DisasContext *ctx, arg_vvv *a, MemOp mop,
     return true;
 }
 
+static bool gvec_vv_i(DisasContext *ctx, arg_vv_i *a, MemOp mop,
+                      void (*func)(unsigned, uint32_t, uint32_t,
+                                   int64_t, uint32_t, uint32_t))
+{
+    uint32_t vd_ofs, vj_ofs;
+
+    CHECK_SXE;
+
+    vd_ofs = vec_full_offset(a->vd);
+    vj_ofs = vec_full_offset(a->vj);
+
+    func(mop, vd_ofs, vj_ofs, a->imm , 16, ctx->vl/8);
+    return true;
+}
+
+static bool gvec_subi(DisasContext *ctx, arg_vv_i *a, MemOp mop)
+{
+    uint32_t vd_ofs, vj_ofs;
+
+    CHECK_SXE;
+
+    vd_ofs = vec_full_offset(a->vd);
+    vj_ofs = vec_full_offset(a->vj);
+
+    tcg_gen_gvec_addi(mop, vd_ofs, vj_ofs, -a->imm, 16, ctx->vl/8);
+    return true;
+}
+
 TRANS(vadd_b, gvec_vvv, MO_8, tcg_gen_gvec_add)
 TRANS(vadd_h, gvec_vvv, MO_16, tcg_gen_gvec_add)
 TRANS(vadd_w, gvec_vvv, MO_32, tcg_gen_gvec_add)
@@ -83,3 +111,12 @@ TRANS(vsub_b, gvec_vvv, MO_8, tcg_gen_gvec_sub)
 TRANS(vsub_h, gvec_vvv, MO_16, tcg_gen_gvec_sub)
 TRANS(vsub_w, gvec_vvv, MO_32, tcg_gen_gvec_sub)
 TRANS(vsub_d, gvec_vvv, MO_64, tcg_gen_gvec_sub)
+
+TRANS(vaddi_bu, gvec_vv_i, MO_8, tcg_gen_gvec_addi)
+TRANS(vaddi_hu, gvec_vv_i, MO_16, tcg_gen_gvec_addi)
+TRANS(vaddi_wu, gvec_vv_i, MO_32, tcg_gen_gvec_addi)
+TRANS(vaddi_du, gvec_vv_i, MO_64, tcg_gen_gvec_addi)
+TRANS(vsubi_bu, gvec_subi, MO_8)
+TRANS(vsubi_hu, gvec_subi, MO_16)
+TRANS(vsubi_wu, gvec_subi, MO_32)
+TRANS(vsubi_du, gvec_subi, MO_64)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index d18db68d51..2a98c14518 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -491,11 +491,13 @@ dbcl             0000 00000010 10101 ...............      @i15
 #
 
 &vvv          vd vj vk
+&vv_i         vd vj imm
 
 #
 # LSX Formats
 #
 @vvv               .... ........ ..... vk:5 vj:5 vd:5    &vvv
+@vv_ui5           .... ........ ..... imm:5 vj:5 vd:5    &vv_i
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
 vadd_h           0111 00000000 10101 ..... ..... .....    @vvv
@@ -507,3 +509,12 @@ vsub_h           0111 00000000 11001 ..... ..... .....    @vvv
 vsub_w           0111 00000000 11010 ..... ..... .....    @vvv
 vsub_d           0111 00000000 11011 ..... ..... .....    @vvv
 vsub_q           0111 00010010 11011 ..... ..... .....    @vvv
+
+vaddi_bu         0111 00101000 10100 ..... ..... .....    @vv_ui5
+vaddi_hu         0111 00101000 10101 ..... ..... .....    @vv_ui5
+vaddi_wu         0111 00101000 10110 ..... ..... .....    @vv_ui5
+vaddi_du         0111 00101000 10111 ..... ..... .....    @vv_ui5
+vsubi_bu         0111 00101000 11000 ..... ..... .....    @vv_ui5
+vsubi_hu         0111 00101000 11001 ..... ..... .....    @vv_ui5
+vsubi_wu         0111 00101000 11010 ..... ..... .....    @vv_ui5
+vsubi_du         0111 00101000 11011 ..... ..... .....    @vv_ui5
-- 
2.31.1


