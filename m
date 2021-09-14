Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D2940AEB1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:14:06 +0200 (CEST)
Received: from localhost ([::1]:54688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8GD-0004Gf-Ba
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mQ843-0005tp-BS
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:31 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57846 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mQ840-00082H-JT
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:30 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxheXvnEBhNJ0GAA--.21668S16; 
 Tue, 14 Sep 2021 21:01:13 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/21] target/loongarch: Add floating point load/store
 instruction translation
Date: Tue, 14 Sep 2021 21:00:24 +0800
Message-Id: <1631624431-30658-15-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxheXvnEBhNJ0GAA--.21668S16
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw4xur17Aw18JFWUtr47urg_yoW3tF4Upr
 4Ikry8Gr40qF13Ar93Kw45WFn8ZFnxC3yjg3yayr1IyF1rJF1UJFs7J3y2krWUXw1kXFWU
 JFZ0yFyUtFyrX3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, bmeng.cn@gmail.com,
 alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement floating point load/store instruction translation.

This includes:
- FLD.{S/D}, FST.{S/D}
- FLDX.{S/D}, FSTX.{S/D}
- FLD{GT/LE}.{S/D}, FST{GT/LE}.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/insn_trans/trans_fmemory.c | 187 ++++++++++++++++++++++++++++
 target/loongarch/insns.decode               |  24 ++++
 target/loongarch/translate.c                |   1 +
 3 files changed, 212 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_fmemory.c

diff --git a/target/loongarch/insn_trans/trans_fmemory.c b/target/loongarch/insn_trans/trans_fmemory.c
new file mode 100644
index 0000000..eca2b8b
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_fmemory.c
@@ -0,0 +1,187 @@
+/*
+ * LoongArch translate functions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+static bool gen_fload_imm(DisasContext *ctx, arg_fmt_fdrjsi12 *a,
+                          MemOp mop, bool nanbox)
+{
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->si12) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->si12);
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
+static bool gen_fstore_imm(DisasContext *ctx, arg_fmt_fdrjsi12 *a,
+                           MemOp mop, bool nanbox)
+{
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->si12) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->si12);
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
+static bool gen_fload_tl(DisasContext *ctx, arg_fmt_fdrjrk *a,
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
+static bool gen_fstore_tl(DisasContext *ctx, arg_fmt_fdrjrk *a,
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
+static bool gen_fload_gt(DisasContext *ctx, arg_fmt_fdrjrk *a,
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
+static bool gen_fstore_gt(DisasContext *ctx, arg_fmt_fdrjrk *a,
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
+static bool gen_fload_le(DisasContext *ctx, arg_fmt_fdrjrk *a,
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
+static bool gen_fstore_le(DisasContext *ctx, arg_fmt_fdrjrk *a,
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
index febf89a..ea776c2 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -72,6 +72,8 @@
 &fmt_fdcj           fd cj
 &fmt_cdrj           cd rj
 &fmt_rdcj           rd cj
+&fmt_fdrjrk         fd rj rk
+&fmt_fdrjsi12       fd rj si12
 
 #
 # Formats
@@ -106,6 +108,8 @@
 @fmt_fdcj            .... ........ ..... ..... .. ... .....   &fmt_fdcj           %fd %cj
 @fmt_cdrj            .... ........ ..... ..... ..... .. ...   &fmt_cdrj           %cd %rj
 @fmt_rdcj            .... ........ ..... ..... .. ... .....   &fmt_rdcj           %rd %cj
+@fmt_fdrjrk          .... ........ ..... ..... ..... .....    &fmt_fdrjrk         %fd %rj %rk
+@fmt_fdrjsi12        .... ...... ............ ..... .....     &fmt_fdrjsi12       %fd %rj %si12
 
 #
 # Fixed point arithmetic operation instruction
@@ -424,3 +428,23 @@ movfr2cf         0000 00010001 01001 10100 ..... 00 ...   @fmt_cdfj
 movcf2fr         0000 00010001 01001 10101 00 ... .....   @fmt_fdcj
 movgr2cf         0000 00010001 01001 10110 ..... 00 ...   @fmt_cdrj
 movcf2gr         0000 00010001 01001 10111 00 ... .....   @fmt_rdcj
+
+#
+# Floating point load/store instruction
+#
+fld_s            0010 101100 ............ ..... .....     @fmt_fdrjsi12
+fst_s            0010 101101 ............ ..... .....     @fmt_fdrjsi12
+fld_d            0010 101110 ............ ..... .....     @fmt_fdrjsi12
+fst_d            0010 101111 ............ ..... .....     @fmt_fdrjsi12
+fldx_s           0011 10000011 00000 ..... ..... .....    @fmt_fdrjrk
+fldx_d           0011 10000011 01000 ..... ..... .....    @fmt_fdrjrk
+fstx_s           0011 10000011 10000 ..... ..... .....    @fmt_fdrjrk
+fstx_d           0011 10000011 11000 ..... ..... .....    @fmt_fdrjrk
+fldgt_s          0011 10000111 01000 ..... ..... .....    @fmt_fdrjrk
+fldgt_d          0011 10000111 01001 ..... ..... .....    @fmt_fdrjrk
+fldle_s          0011 10000111 01010 ..... ..... .....    @fmt_fdrjrk
+fldle_d          0011 10000111 01011 ..... ..... .....    @fmt_fdrjrk
+fstgt_s          0011 10000111 01100 ..... ..... .....    @fmt_fdrjrk
+fstgt_d          0011 10000111 01101 ..... ..... .....    @fmt_fdrjrk
+fstle_s          0011 10000111 01110 ..... ..... .....    @fmt_fdrjrk
+fstle_d          0011 10000111 01111 ..... ..... .....    @fmt_fdrjrk
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index c57c8ee..5c2e9ee 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -190,6 +190,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_fcmp.c"
 #include "insn_trans/trans_fcnv.c"
 #include "insn_trans/trans_fmov.c"
+#include "insn_trans/trans_fmemory.c"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1


