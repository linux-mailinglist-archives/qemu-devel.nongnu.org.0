Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80142468398
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 10:33:20 +0100 (CET)
Received: from localhost ([::1]:40844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtRPz-0006ig-9w
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 04:33:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mtRMd-00040c-0V
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 04:29:51 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38106 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mtRMW-0003mq-DN
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 04:29:50 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx78r1NKthpt0CAA--.6875S7;
 Sat, 04 Dec 2021 17:29:34 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 05/26] target/loongarch: Add fixed point shift instruction
 translation
Date: Sat,  4 Dec 2021 17:29:04 +0800
Message-Id: <1638610165-15036-6-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
References: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9Dx78r1NKthpt0CAA--.6875S7
X-Coremail-Antispam: 1UD129KBjvJXoW3Wry3Cr4fXw15WF1DGF17ZFb_yoWxGw4xpr
 1UAryUGr48XrnxAr1avw45XFyDJrnrAa1jqrWftr15ur4UXF1DJr4q93yagrW7twn3XrW8
 ZFZ5urWjga4rJaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
- SLL.W, SRL.W, SRA.W, ROTR.W
- SLLI.W, SRLI.W, SRAI.W, ROTRI.W
- SLL.D, SRL.D, SRA.D, ROTR.D
- SLLI.D, SRLI.D, SRAI.D, ROTRI.D

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/insn_trans/trans_shift.c.inc | 106 ++++++++++++++++++++++++++
 target/loongarch/insns.decode                 |  22 ++++++
 target/loongarch/translate.c                  |   1 +
 3 files changed, 129 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_shift.c.inc

diff --git a/target/loongarch/insn_trans/trans_shift.c.inc b/target/loongarch/insn_trans/trans_shift.c.inc
new file mode 100644
index 0000000..5260af2
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_shift.c.inc
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static void gen_sll_w(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, src2, 0x1f);
+    tcg_gen_shl_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_srl_w(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, src2, 0x1f);
+    tcg_gen_shr_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_sra_w(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, src2, 0x1f);
+    tcg_gen_sar_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_sll_d(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, src2, 0x3f);
+    tcg_gen_shl_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_srl_d(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, src2, 0x3f);
+    tcg_gen_shr_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_sra_d(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, src2, 0x3f);
+    tcg_gen_sar_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_rotr_w(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_andi_tl(t0, src2, 0x1f);
+
+    tcg_gen_trunc_tl_i32(t1, src1);
+    tcg_gen_trunc_tl_i32(t2, t0);
+
+    tcg_gen_rotr_i32(t1, t1, t2);
+    tcg_gen_ext_i32_tl(dest, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free(t0);
+}
+
+static void gen_rotr_d(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, src2, 0x3f);
+    tcg_gen_rotr_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static bool trans_srai_w(DisasContext *ctx, arg_srai_w *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_ZERO);
+
+    tcg_gen_sextract_tl(dest, src1, a->imm, 32 - a->imm);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+
+    return true;
+}
+
+TRANS(sll_w, gen_rrr, EXT_ZERO, EXT_NONE, EXT_SIGN, gen_sll_w)
+TRANS(srl_w, gen_rrr, EXT_ZERO, EXT_NONE, EXT_SIGN, gen_srl_w)
+TRANS(sra_w, gen_rrr, EXT_SIGN, EXT_NONE, EXT_SIGN, gen_sra_w)
+TRANS(sll_d, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_sll_d)
+TRANS(srl_d, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_srl_d)
+TRANS(sra_d, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_sra_d)
+TRANS(rotr_w, gen_rrr, EXT_ZERO, EXT_NONE, EXT_SIGN, gen_rotr_w)
+TRANS(rotr_d, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_rotr_d)
+TRANS(slli_w, gen_rri_c, EXT_NONE, EXT_SIGN, tcg_gen_shli_tl)
+TRANS(slli_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_shli_tl)
+TRANS(srli_w, gen_rri_c, EXT_ZERO, EXT_SIGN, tcg_gen_shri_tl)
+TRANS(srli_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_shri_tl)
+TRANS(srai_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_sari_tl)
+TRANS(rotri_w, gen_rri_v, EXT_NONE, EXT_NONE, gen_rotr_w)
+TRANS(rotri_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_rotri_tl)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 8579c11..673aee4 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -23,6 +23,8 @@
 #
 @rrr               .... ........ ..... rk:5 rj:5 rd:5    &rrr
 @r_i20                          .... ... imm:s20 rd:5    &r_i
+@rr_ui5           .... ........ ..... imm:5 rj:5 rd:5    &rr_i
+@rr_ui6            .... ........ .... imm:6 rj:5 rd:5    &rr_i
 @rr_i12                 .... ...... imm:s12 rj:5 rd:5    &rr_i
 @rr_ui12                 .... ...... imm:12 rj:5 rd:5    &rr_i
 @rr_i16                     .... .. imm:s16 rj:5 rd:5    &rr_i
@@ -77,3 +79,23 @@ addu16i_d       0001 00 ................ ..... .....     @rr_i16
 andi            0000 001101 ............ ..... .....     @rr_ui12
 ori             0000 001110 ............ ..... .....     @rr_ui12
 xori            0000 001111 ............ ..... .....     @rr_ui12
+
+#
+# Fixed point shift operation instruction
+#
+sll_w           0000 00000001 01110 ..... ..... .....    @rrr
+srl_w           0000 00000001 01111 ..... ..... .....    @rrr
+sra_w           0000 00000001 10000 ..... ..... .....    @rrr
+sll_d           0000 00000001 10001 ..... ..... .....    @rrr
+srl_d           0000 00000001 10010 ..... ..... .....    @rrr
+sra_d           0000 00000001 10011 ..... ..... .....    @rrr
+rotr_w          0000 00000001 10110 ..... ..... .....    @rrr
+rotr_d          0000 00000001 10111 ..... ..... .....    @rrr
+slli_w          0000 00000100 00001 ..... ..... .....    @rr_ui5
+slli_d          0000 00000100 0001 ...... ..... .....    @rr_ui6
+srli_w          0000 00000100 01001 ..... ..... .....    @rr_ui5
+srli_d          0000 00000100 0101 ...... ..... .....    @rr_ui6
+srai_w          0000 00000100 10001 ..... ..... .....    @rr_ui5
+srai_d          0000 00000100 1001 ...... ..... .....    @rr_ui6
+rotri_w         0000 00000100 11001 ..... ..... .....    @rr_ui5
+rotri_d         0000 00000100 1101 ...... ..... .....    @rr_ui6
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 3de18ef..f90b63a 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -146,6 +146,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 
 #include "decode-insns.c.inc"
 #include "insn_trans/trans_arith.c.inc"
+#include "insn_trans/trans_shift.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1


