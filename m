Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B651450DC79
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:25:44 +0200 (CEST)
Received: from localhost ([::1]:41472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuyU-0005Ng-2d
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1niuk6-0007la-JJ
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:10:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39246 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1niuk4-0001HA-Bj
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:10:50 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn8+DZWZi+7gwAA--.18850S16; 
 Mon, 25 Apr 2022 17:10:43 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/43] target/loongarch: Add floating point load/store
 instruction translation
Date: Mon, 25 Apr 2022 17:09:58 +0800
Message-Id: <20220425091027.2877892-15-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn8+DZWZi+7gwAA--.18850S16
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw4xur1DKFy8Jw13KFyrXrb_yoW3JFW5pr
 4jyr1UWr48Xr1fAr97K3y5uF1DWrn3Cay2g34Syr1IvF4rXF1DXr1kG3ya9rWUXr4kXFWr
 tF4UAFyjyFW5J3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

This includes:
- FLD.{S/D}, FST.{S/D}
- FLDX.{S/D}, FSTX.{S/D}
- FLD{GT/LE}.{S/D}, FST{GT/LE}.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 .../loongarch/insn_trans/trans_fmemory.c.inc  | 153 ++++++++++++++++++
 target/loongarch/insns.decode                 |  24 +++
 target/loongarch/translate.c                  |   1 +
 3 files changed, 178 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_fmemory.c.inc

diff --git a/target/loongarch/insn_trans/trans_fmemory.c.inc b/target/loongarch/insn_trans/trans_fmemory.c.inc
new file mode 100644
index 0000000000..74ee98f63a
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_fmemory.c.inc
@@ -0,0 +1,153 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static void maybe_nanbox_load(TCGv freg, MemOp mop)
+{
+    if ((mop & MO_SIZE) == MO_32) {
+        gen_nanbox_s(freg, freg);
+    }
+}
+
+static bool gen_fload_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
+{
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+    maybe_nanbox_load(cpu_fpr[a->fd], mop);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+
+    return true;
+}
+
+static bool gen_fstore_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
+{
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+    return true;
+}
+
+static bool gen_floadx(DisasContext *ctx, arg_frr *a, MemOp mop)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+    maybe_nanbox_load(cpu_fpr[a->fd], mop);
+    tcg_temp_free(addr);
+
+    return true;
+}
+
+static bool gen_fstorex(DisasContext *ctx, arg_frr *a, MemOp mop)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+    tcg_temp_free(addr);
+
+    return true;
+}
+
+static bool gen_fload_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtgt_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+    maybe_nanbox_load(cpu_fpr[a->fd], mop);
+    tcg_temp_free(addr);
+
+    return true;
+}
+
+static bool gen_fstore_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtgt_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+    tcg_temp_free(addr);
+
+    return true;
+}
+
+static bool gen_fload_le(DisasContext *ctx, arg_frr *a, MemOp mop)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtle_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+    maybe_nanbox_load(cpu_fpr[a->fd], mop);
+    tcg_temp_free(addr);
+
+    return true;
+}
+
+static bool gen_fstore_le(DisasContext *ctx, arg_frr *a, MemOp mop)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtle_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+    tcg_temp_free(addr);
+
+    return true;
+}
+
+TRANS(fld_s, gen_fload_i, MO_TEUL)
+TRANS(fst_s, gen_fstore_i, MO_TEUL)
+TRANS(fld_d, gen_fload_i, MO_TEUQ)
+TRANS(fst_d, gen_fstore_i, MO_TEUQ)
+TRANS(fldx_s, gen_floadx, MO_TEUL)
+TRANS(fldx_d, gen_floadx, MO_TEUQ)
+TRANS(fstx_s, gen_fstorex, MO_TEUL)
+TRANS(fstx_d, gen_fstorex, MO_TEUQ)
+TRANS(fldgt_s, gen_fload_gt, MO_TEUL)
+TRANS(fldgt_d, gen_fload_gt, MO_TEUQ)
+TRANS(fldle_s, gen_fload_le, MO_TEUL)
+TRANS(fldle_d, gen_fload_le, MO_TEUQ)
+TRANS(fstgt_s, gen_fstore_gt, MO_TEUL)
+TRANS(fstgt_d, gen_fstore_gt, MO_TEUQ)
+TRANS(fstle_s, gen_fstore_le, MO_TEUL)
+TRANS(fstle_d, gen_fstore_le, MO_TEUQ)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index c62a4f6dcd..8f286e7233 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -36,6 +36,8 @@
 &fc           fd cj
 &cr           cd rj
 &rc           rd cj
+&frr          fd rj rk
+&fr_i         fd rj imm
 
 #
 # Formats
@@ -70,6 +72,8 @@
 @fc            .... ........ ..... ..... .. cj:3 fd:5    &fc
 @cr            .... ........ ..... ..... rj:5 .. cd:3    &cr
 @rc            .... ........ ..... ..... .. cj:3 rd:5    &rc
+@frr               .... ........ ..... rk:5 rj:5 fd:5    &frr
+@fr_i12                 .... ...... imm:s12 rj:5 fd:5    &fr_i
 
 #
 # Fixed point arithmetic operation instruction
@@ -385,3 +389,23 @@ movfr2cf        0000 00010001 01001 10100 ..... 00 ...   @cf
 movcf2fr        0000 00010001 01001 10101 00 ... .....   @fc
 movgr2cf        0000 00010001 01001 10110 ..... 00 ...   @cr
 movcf2gr        0000 00010001 01001 10111 00 ... .....   @rc
+
+#
+# Floating point load/store instruction
+#
+fld_s           0010 101100 ............ ..... .....     @fr_i12
+fst_s           0010 101101 ............ ..... .....     @fr_i12
+fld_d           0010 101110 ............ ..... .....     @fr_i12
+fst_d           0010 101111 ............ ..... .....     @fr_i12
+fldx_s          0011 10000011 00000 ..... ..... .....    @frr
+fldx_d          0011 10000011 01000 ..... ..... .....    @frr
+fstx_s          0011 10000011 10000 ..... ..... .....    @frr
+fstx_d          0011 10000011 11000 ..... ..... .....    @frr
+fldgt_s         0011 10000111 01000 ..... ..... .....    @frr
+fldgt_d         0011 10000111 01001 ..... ..... .....    @frr
+fldle_s         0011 10000111 01010 ..... ..... .....    @frr
+fldle_d         0011 10000111 01011 ..... ..... .....    @frr
+fstgt_s         0011 10000111 01100 ..... ..... .....    @frr
+fstgt_d         0011 10000111 01101 ..... ..... .....    @frr
+fstle_s         0011 10000111 01110 ..... ..... .....    @frr
+fstle_d         0011 10000111 01111 ..... ..... .....    @frr
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 09754fb14d..6a3fffdbe0 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -170,6 +170,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_fcmp.c.inc"
 #include "insn_trans/trans_fcnv.c.inc"
 #include "insn_trans/trans_fmov.c.inc"
+#include "insn_trans/trans_fmemory.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
2.31.1


