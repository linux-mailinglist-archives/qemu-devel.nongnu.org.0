Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BF83F95A2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:57:53 +0200 (CEST)
Received: from localhost ([::1]:35618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWkF-0006LO-ET
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mJW5Z-00015d-Ky
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 03:15:46 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59748 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mJW5V-0003Pp-LY
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 03:15:45 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxtOTvkChhno4AAA--.2304S16; 
 Fri, 27 Aug 2021 15:15:23 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/19] target/loongarch: Add floating point load/store
 instruction translation
Date: Fri, 27 Aug 2021 15:14:49 +0800
Message-Id: <1630048494-2143-15-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630048494-2143-1-git-send-email-gaosong@loongson.cn>
References: <1630048494-2143-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9AxtOTvkChhno4AAA--.2304S16
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw47Gw4fGry5Cr45tF4fZrb_yoW3JFy7pF
 4Iyry8Gr40qr1fAr93Kw45WrnxJFnak3y2g34ayw1xAF1rXF18JF4kJ3ya9rWUXwn5XFW5
 JFW5AryUtFy5J3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 richard.henderson@linaro.org, f4bug@amsat.org, maobibo@loongson.cn,
 laurent@vivier.eu, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement floating point load/store instruction translation.

This includes:
- FLD.{S/D}, FST.{S/D}
- FLDX.{S/D}, FSTX.{S/D}
- FLD{GT/LE}.{S/D}, FST{GT/LE}.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/insn_trans/trans_fmemory.c | 143 ++++++++++++++++++++++++++++
 target/loongarch/insns.decode               |  24 +++++
 target/loongarch/translate.c                |   1 +
 3 files changed, 168 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_fmemory.c

diff --git a/target/loongarch/insn_trans/trans_fmemory.c b/target/loongarch/insn_trans/trans_fmemory.c
new file mode 100644
index 0000000..88727c3
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_fmemory.c
@@ -0,0 +1,143 @@
+/*
+ * LoongArch translate functions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+static bool gen_fload_imm(DisasContext *ctx, arg_fmt_fdrjsi12 *a, MemOp mop)
+{
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->si12) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->si12);
+        addr = temp;
+    }
+    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+    return true;
+}
+
+static bool gen_fstore_imm(DisasContext *ctx, arg_fmt_fdrjsi12 *a, MemOp mop)
+{
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->si12) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->si12);
+        addr = temp;
+    }
+    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+    return true;
+}
+
+static bool gen_fload_tl(DisasContext *ctx, arg_fmt_fdrjrk *a, MemOp mop)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_fstore_tl(DisasContext *ctx, arg_fmt_fdrjrk *a, MemOp mop)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_fload_gt(DisasContext *ctx, arg_fmt_fdrjrk *a, MemOp mop)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtgt_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+
+    return true;
+}
+
+static bool gen_fstore_gt(DisasContext *ctx, arg_fmt_fdrjrk *a, MemOp mop)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtgt_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_fload_le(DisasContext *ctx, arg_fmt_fdrjrk *a, MemOp mop)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtle_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_fstore_le(DisasContext *ctx, arg_fmt_fdrjrk *a, MemOp mop)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtle_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+TRANS(fld_s, gen_fload_imm, MO_TESL)
+TRANS(fst_s, gen_fstore_imm, MO_TEUL)
+TRANS(fld_d, gen_fload_imm, MO_TEQ)
+TRANS(fst_d, gen_fstore_imm, MO_TEQ)
+TRANS(fldx_s, gen_fload_tl, MO_TESL)
+TRANS(fldx_d, gen_fload_tl, MO_TEQ)
+TRANS(fstx_s, gen_fstore_tl, MO_TEUL)
+TRANS(fstx_d, gen_fstore_tl, MO_TEQ)
+TRANS(fldgt_s, gen_fload_gt, MO_TESL)
+TRANS(fldgt_d, gen_fload_gt, MO_TEQ)
+TRANS(fldle_s, gen_fload_le, MO_TESL)
+TRANS(fldle_d, gen_fload_le, MO_TEQ)
+TRANS(fstgt_s, gen_fstore_gt, MO_TEUL)
+TRANS(fstgt_d, gen_fstore_gt, MO_TEQ)
+TRANS(fstle_s, gen_fstore_le, MO_TEUL)
+TRANS(fstle_d, gen_fstore_le, MO_TEQ)
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
index 55185ae..d4a622f 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -205,6 +205,7 @@ static bool gen_f2(DisasContext *ctx, arg_fmt_fdfj *a,
 #include "insn_trans/trans_fcmp.c"
 #include "insn_trans/trans_fcnv.c"
 #include "insn_trans/trans_fmov.c"
+#include "insn_trans/trans_fmemory.c"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1


