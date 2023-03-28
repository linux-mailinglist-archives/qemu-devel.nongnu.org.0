Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4996CB4A2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:12:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzfc-0007Do-Ps; Mon, 27 Mar 2023 23:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzfY-0007BT-Ig
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:44 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzfU-0000MR-B6
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:44 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Bxok67WSJkSNoSAA--.17328S3;
 Tue, 28 Mar 2023 11:06:35 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S9; 
 Tue, 28 Mar 2023 11:06:34 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 07/44] target/loongarch: Implement vneg
Date: Tue, 28 Mar 2023 11:05:54 +0800
Message-Id: <20230328030631.3117129-8-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S9
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCw4fGrW7JFWxuFW7JF48tFb_yoW5Zw43pr
 1jyry3Kr48JF97Jrna9w15Xr1Yqrn2kw4a934ftw1rXFZ8XF1DJw1kt3yq9FW8X3WkZFy0
 gF1xA34UWrWfXwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
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

This patch includes;
- VNEG.{B/H/W/D}.

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
index 99a5c2474d..dc66e44a75 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -44,6 +44,21 @@ static bool gvec_vvv(DisasContext *ctx, arg_vvv *a, MemOp mop,
     return true;
 }
 
+static bool gvec_vv(DisasContext *ctx, arg_vv *a, MemOp mop,
+                    void (*func)(unsigned, uint32_t, uint32_t,
+                                 uint32_t, uint32_t))
+{
+    uint32_t dofs, jofs;
+
+    CHECK_SXE;
+
+    dofs = vreg_full_offset(a->vd);
+    jofs = vreg_full_offset(a->vj);
+
+    func(mop, dofs, jofs, 16, 16);
+    return true;
+}
+
 static bool gvec_vv_i(DisasContext *ctx, arg_vv_i *a, MemOp mop,
                       void (*func)(unsigned, uint32_t, uint32_t,
                                    int64_t, uint32_t, uint32_t))
@@ -91,3 +106,8 @@ TRANS(vsubi_bu, gvec_subi, MO_8)
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


