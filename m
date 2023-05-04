Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402966F6B91
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:32:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puY4e-0001XM-1u; Thu, 04 May 2023 08:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puY4Y-0001V9-RP
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:34 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puY4W-0002yi-1W
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:34 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxHuvepFNkhqAEAA--.7519S3;
 Thu, 04 May 2023 20:28:14 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77PapFNk1uxJAA--.5674S7; 
 Thu, 04 May 2023 20:28:14 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [PATCH v5 05/44] target/loongarch: Implement vaddi/vsubi
Date: Thu,  4 May 2023 20:27:31 +0800
Message-Id: <20230504122810.4094787-6-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230504122810.4094787-1-gaosong@loongson.cn>
References: <20230504122810.4094787-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77PapFNk1uxJAA--.5674S7
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGF13CFyrJFyrAw4xWF4fAFb_yoWrCw45pw
 1UtrWUCF48Gr97Jrna9w15Wr1YqrnFkw1a9w1ftw1rZrWUXF1DJry8JrZF9FW8X3WkAFy0
 gF1rCrWjgr95Xw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0xFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xAC
 xx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx2
 6rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
 14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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


