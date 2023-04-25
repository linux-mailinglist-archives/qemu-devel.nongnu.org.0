Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2466EDC43
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:11:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prChd-0001HT-LY; Tue, 25 Apr 2023 03:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1prCha-0001G5-0X
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:03:02 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1prChX-0007zE-7C
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:03:01 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxZPAge0dkcV8AAA--.732S3;
 Tue, 25 Apr 2023 15:02:56 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S8; 
 Tue, 25 Apr 2023 15:02:56 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [RFC PATCH v4 06/44] target/loongarch: Implement vneg
Date: Tue, 25 Apr 2023 15:02:10 +0800
Message-Id: <20230425070248.2550028-7-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230425070248.2550028-1-gaosong@loongson.cn>
References: <20230425070248.2550028-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S8
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCw4fGrW7JFWxuFW7JF48tFb_yoW5uFW5pr
 1jyryakr48JFyxJrna9w15Xr1Ygrn2kw4ag34ftw4rXFZ8XF1DJw1kt3yq9FW8X3WkZa40
 gF13A34UWrWfXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
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


