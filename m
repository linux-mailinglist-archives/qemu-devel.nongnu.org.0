Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5C2456A6F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 07:51:13 +0100 (CET)
Received: from localhost ([::1]:58336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnxjs-0001S4-Ka
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 01:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mnx9x-0004Gn-EM
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 01:14:07 -0500
Received: from mail.loongson.cn ([114.242.206.163]:46820 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mnx9u-0004ZA-PI
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 01:14:05 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj8+KQJdhSG0AAA--.1952S16; 
 Fri, 19 Nov 2021 14:13:48 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 14/26] target/loongarch: Add floating point load/store
 instruction translation
Date: Fri, 19 Nov 2021 14:13:18 +0800
Message-Id: <1637302410-24632-15-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9Dxj8+KQJdhSG0AAA--.1952S16
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw4xur17Aw1kXF18uFW3ZFb_yoW3AF4rpr
 4jyr1UGr48XF1fAr97Kw45WF1DZFnxCayjga4Svr1Iyr18XFyDJr4kJ39FkrWUXF4kXFW5
 tF4DAFyUtFyrX3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
- FLD.{S/D}, FST.{S/D}
- FLDX.{S/D}, FSTX.{S/D}
- FLD{GT/LE}.{S/D}, FST{GT/LE}.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/insn_trans/trans_fmemory.c.inc | 184 ++++++++++++++++++++++++
 target/loongarch/insns.decode                   |  24 ++++
 target/loongarch/translate.c                    |   1 +
 3 files changed, 209 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_fmemory.c.inc

diff --git a/target/loongarch/insn_trans/trans_fmemory.c.inc b/target/loongarch/insn_trans/trans_fmemory.c.inc
new file mode 100644
index 0000000..a9c66b2
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_fmemory.c.inc
@@ -0,0 +1,184 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static bool gen_fload_imm(DisasContext *ctx, arg_fr_i *a,
+                          MemOp mop, bool nanbox)
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
+
+    if (nanbox) {
+        gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
+    }
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+    return true;
+}
+
+static bool gen_fstore_imm(DisasContext *ctx, arg_fr_i *a,
+                           MemOp mop, bool nanbox)
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
+    if (nanbox) {
+        gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
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
+static bool gen_fload_tl(DisasContext *ctx, arg_frr *a,
+                         MemOp mop, bool nanbox)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    if (nanbox) {
+        gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
+    }
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_fstore_tl(DisasContext *ctx, arg_frr *a,
+                          MemOp mop, bool nanbox)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    tcg_gen_add_tl(addr, src1, src2);
+
+    if (nanbox) {
+        gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
+    }
+
+    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_fload_gt(DisasContext *ctx, arg_frr *a,
+                         MemOp mop, bool nanbox)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtgt_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    if (nanbox) {
+        gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
+    }
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_fstore_gt(DisasContext *ctx, arg_frr *a,
+                          MemOp mop, bool nanbox)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtgt_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+
+    if (nanbox) {
+        gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
+    }
+
+    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_fload_le(DisasContext *ctx, arg_frr *a,
+                         MemOp mop, bool nanbox)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtle_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    if (nanbox) {
+        gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
+    }
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_fstore_le(DisasContext *ctx, arg_frr *a,
+                          MemOp mop, bool nanbox)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtle_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+
+    if (nanbox) {
+        gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
+    }
+
+    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+TRANS(fld_s, gen_fload_imm, MO_TESL, true)
+TRANS(fst_s, gen_fstore_imm, MO_TEUL, true)
+TRANS(fld_d, gen_fload_imm, MO_TEQ, false)
+TRANS(fst_d, gen_fstore_imm, MO_TEQ, false)
+TRANS(fldx_s, gen_fload_tl, MO_TESL, true)
+TRANS(fldx_d, gen_fload_tl, MO_TEQ, false)
+TRANS(fstx_s, gen_fstore_tl, MO_TEUL, true)
+TRANS(fstx_d, gen_fstore_tl, MO_TEQ, false)
+TRANS(fldgt_s, gen_fload_gt, MO_TESL, true)
+TRANS(fldgt_d, gen_fload_gt, MO_TEQ, false)
+TRANS(fldle_s, gen_fload_le, MO_TESL, true)
+TRANS(fldle_d, gen_fload_le, MO_TEQ, false)
+TRANS(fstgt_s, gen_fstore_gt, MO_TEUL, true)
+TRANS(fstgt_d, gen_fstore_gt, MO_TEQ, false)
+TRANS(fstle_s, gen_fstore_le, MO_TEUL, true)
+TRANS(fstle_d, gen_fstore_le, MO_TEQ, false)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 86f7284..2560c24 100644
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
@@ -388,3 +392,23 @@ movfr2cf        0000 00010001 01001 10100 ..... 00 ...   @cf
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
index f3e590c..5be5e26 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -194,6 +194,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_fcmp.c.inc"
 #include "insn_trans/trans_fcnv.c.inc"
 #include "insn_trans/trans_fmov.c.inc"
+#include "insn_trans/trans_fmemory.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1


