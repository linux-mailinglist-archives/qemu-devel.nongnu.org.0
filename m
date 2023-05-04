Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0A06F6C14
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:36:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puY4V-0001Sx-EN; Thu, 04 May 2023 08:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puY4O-0001RP-03
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:24 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puY4K-0002yU-85
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:23 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxNPDfpFNkiKAEAA--.7532S3;
 Thu, 04 May 2023 20:28:15 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77PapFNk1uxJAA--.5674S8; 
 Thu, 04 May 2023 20:28:14 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [PATCH v5 06/44] target/loongarch: Implement vneg
Date: Thu,  4 May 2023 20:27:32 +0800
Message-Id: <20230504122810.4094787-7-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230504122810.4094787-1-gaosong@loongson.cn>
References: <20230504122810.4094787-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77PapFNk1uxJAA--.5674S8
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCw4fGrW7JFWxuFW7JF48tFb_yoW5uFW5pr
 1jyryakr48JFyxJrna9w15Xr1Ygrn2kw4ag34ftw4rXFZ8XF1DJw1kt3yq9FW8X3WkZa40
 gF13A34UWrWfXw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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

This patch includes;
- VNEG.{B/H/W/D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 10 ++++++++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 20 ++++++++++++++++++++
 target/loongarch/insns.decode               |  7 +++++++
 3 files changed, 37 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index c1960610c2..5eabb8c47a 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -802,6 +802,11 @@ static void output_vv_i(DisasContext *ctx, arg_vv_i *a, const char *mnemonic)
     output(ctx, mnemonic, "v%d, v%d, 0x%x", a->vd, a->vj, a->imm);
 }
 
+static void output_vv(DisasContext *ctx, arg_vv *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "v%d, v%d", a->vd, a->vj);
+}
+
 INSN_LSX(vadd_b,           vvv)
 INSN_LSX(vadd_h,           vvv)
 INSN_LSX(vadd_w,           vvv)
@@ -821,3 +826,8 @@ INSN_LSX(vsubi_bu,         vv_i)
 INSN_LSX(vsubi_hu,         vv_i)
 INSN_LSX(vsubi_wu,         vv_i)
 INSN_LSX(vsubi_du,         vv_i)
+
+INSN_LSX(vneg_b,           vv)
+INSN_LSX(vneg_h,           vv)
+INSN_LSX(vneg_w,           vv)
+INSN_LSX(vneg_d,           vv)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index e6c1d0d2cc..d02db6285f 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -44,6 +44,21 @@ static bool gvec_vvv(DisasContext *ctx, arg_vvv *a, MemOp mop,
     return true;
 }
 
+static bool gvec_vv(DisasContext *ctx, arg_vv *a, MemOp mop,
+                    void (*func)(unsigned, uint32_t, uint32_t,
+                                 uint32_t, uint32_t))
+{
+    uint32_t vd_ofs, vj_ofs;
+
+    CHECK_SXE;
+
+    vd_ofs = vec_full_offset(a->vd);
+    vj_ofs = vec_full_offset(a->vj);
+
+    func(mop, vd_ofs, vj_ofs, 16, ctx->vl/8);
+    return true;
+}
+
 static bool gvec_vv_i(DisasContext *ctx, arg_vv_i *a, MemOp mop,
                       void (*func)(unsigned, uint32_t, uint32_t,
                                    int64_t, uint32_t, uint32_t))
@@ -120,3 +135,8 @@ TRANS(vsubi_bu, gvec_subi, MO_8)
 TRANS(vsubi_hu, gvec_subi, MO_16)
 TRANS(vsubi_wu, gvec_subi, MO_32)
 TRANS(vsubi_du, gvec_subi, MO_64)
+
+TRANS(vneg_b, gvec_vv, MO_8, tcg_gen_gvec_neg)
+TRANS(vneg_h, gvec_vv, MO_16, tcg_gen_gvec_neg)
+TRANS(vneg_w, gvec_vv, MO_32, tcg_gen_gvec_neg)
+TRANS(vneg_d, gvec_vv, MO_64, tcg_gen_gvec_neg)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 2a98c14518..d90798be11 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -490,12 +490,14 @@ dbcl             0000 00000010 10101 ...............      @i15
 # LSX Argument sets
 #
 
+&vv           vd vj
 &vvv          vd vj vk
 &vv_i         vd vj imm
 
 #
 # LSX Formats
 #
+@vv               .... ........ ..... ..... vj:5 vd:5    &vv
 @vvv               .... ........ ..... vk:5 vj:5 vd:5    &vvv
 @vv_ui5           .... ........ ..... imm:5 vj:5 vd:5    &vv_i
 
@@ -518,3 +520,8 @@ vsubi_bu         0111 00101000 11000 ..... ..... .....    @vv_ui5
 vsubi_hu         0111 00101000 11001 ..... ..... .....    @vv_ui5
 vsubi_wu         0111 00101000 11010 ..... ..... .....    @vv_ui5
 vsubi_du         0111 00101000 11011 ..... ..... .....    @vv_ui5
+
+vneg_b           0111 00101001 11000 01100 ..... .....    @vv
+vneg_h           0111 00101001 11000 01101 ..... .....    @vv
+vneg_w           0111 00101001 11000 01110 ..... .....    @vv
+vneg_d           0111 00101001 11000 01111 ..... .....    @vv
-- 
2.31.1


