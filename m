Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A517053F281
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:24:02 +0200 (CEST)
Received: from localhost ([::1]:36130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyM4n-0008Uz-P2
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwG-0001ex-IA
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:13 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwB-0003xA-Qj
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:10 -0400
Received: by mail-pf1-x42a.google.com with SMTP id u2so13942608pfc.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PO1WRMSl7lnyYxPVP62YCRomjqPAk9F3I+CbXo1FHRU=;
 b=EvUz9HqGFs0b+/Jp1A/MWNV0KITUgSI0Vho7ubUGbKvFoahkFeJTjkBnrHFInOfkzf
 /DRsqH4DVGBgCbsIHOD3BHZ5fXz+t6H0tKEvd5ldRj7AzPP9IyhZd4odBQPex+9QI1zJ
 7KCXF8iUsvl4AIYynjco3LMCJ9jHDvRKQnDNHzifajTx4lSycWiLB5QCahWMFQSq3DcU
 641IJE7ERJGp7IKLobrOLxIP4zns16kYb9eusnQXN9B4AweWtXqRIjsScgiVzAzxvcwO
 2/a7xqBeEpTqelal13mDEs/+F+TP1zRuP2leUBEr7wEXLm9dVvX4xespgzg7iJKUsvw+
 8P4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PO1WRMSl7lnyYxPVP62YCRomjqPAk9F3I+CbXo1FHRU=;
 b=oj6llWZy5LVZWOtJ9L/EyZWHt9J5gjQ+wxA3qDsje6yDt1yAQvt894VwWzhnZjulYW
 pRECEKO4S0BmOCJ7T6//Ua+7wXFbfEmsWz+q9iDQP5Y0bL/FHdOpQ+oiaP2g0V7BHAq4
 BtcaptzYPVIe9vh+s+hw4CS35RUhj+Lb05ZeAyxfXq3/Dn8y8Sj8ybni2TdKQBvDu9VK
 PD9C6p66Q4eg9IuJY7O7s/y3xS4iN8e9hlHLv5mNgyeKulaQNkFqmIZA1x+lFqsI3G6Y
 olF2DTl+hcydFn7PMVmMVz3yftg+MEWmhY4RzBNL3sCz6MJKU1HoTdakTP6mv3AVWX/S
 Agwg==
X-Gm-Message-State: AOAM533edHzXRh6xhSVYqd5y3OfhA7paj7IO1a1F+J2lpp7V1ZiUIpcS
 2KqcLJDiRBAhLa3f+QjTkHqBINiACQUKvg==
X-Google-Smtp-Source: ABdhPJwd6BrFCZDnATC/MHsBE1y65YT7v3qxXxRp3XEL0VQfJtldlgIIgr7fOHBTivO5EkSJnJ0qLg==
X-Received: by 2002:a62:868c:0:b0:51b:bd62:4c87 with SMTP id
 x134-20020a62868c000000b0051bbd624c87mr26287027pfd.83.1654557306492; 
 Mon, 06 Jun 2022 16:15:06 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 15/43] target/loongarch: Add branch instruction translation
Date: Mon,  6 Jun 2022 16:14:22 -0700
Message-Id: <20220606231450.448443-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

This includes:
- BEQ, BNE, BLT[U], BGE[U]
- BEQZ, BNEZ
- B
- BL
- JIRL
- BCEQZ, BCNEZ

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-16-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/insns.decode                 | 28 +++++++
 target/loongarch/translate.c                  |  1 +
 .../loongarch/insn_trans/trans_branch.c.inc   | 83 +++++++++++++++++++
 3 files changed, 112 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_branch.c.inc

diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 8f286e7233..9b293dfdf9 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -10,6 +10,9 @@
 #
 %i14s2     10:s14       !function=shl_2
 %sa2p1     15:2         !function=plus_1
+%offs21    0:s5 10:16   !function=shl_2
+%offs16    10:s16       !function=shl_2
+%offs26    0:s10 10:16  !function=shl_2
 
 #
 # Argument sets
@@ -38,6 +41,10 @@
 &rc           rd cj
 &frr          fd rj rk
 &fr_i         fd rj imm
+&r_offs       rj offs
+&c_offs       cj offs
+&offs         offs
+&rr_offs      rj rd offs
 
 #
 # Formats
@@ -74,6 +81,10 @@
 @rc            .... ........ ..... ..... .. cj:3 rd:5    &rc
 @frr               .... ........ ..... rk:5 rj:5 fd:5    &frr
 @fr_i12                 .... ...... imm:s12 rj:5 fd:5    &fr_i
+@r_offs21         .... .. ................ rj:5 .....    &r_offs      offs=%offs21
+@c_offs21      .... .. ................ .. cj:3 .....    &c_offs      offs=%offs21
+@offs26            .... .. ..........................    &offs        offs=%offs26
+@rr_offs16         .... .. ................ rj:5 rd:5    &rr_offs     offs=%offs16
 
 #
 # Fixed point arithmetic operation instruction
@@ -409,3 +420,20 @@ fstgt_s         0011 10000111 01100 ..... ..... .....    @frr
 fstgt_d         0011 10000111 01101 ..... ..... .....    @frr
 fstle_s         0011 10000111 01110 ..... ..... .....    @frr
 fstle_d         0011 10000111 01111 ..... ..... .....    @frr
+
+#
+# Branch instructions
+#
+beqz            0100 00 ................ ..... .....     @r_offs21
+bnez            0100 01 ................ ..... .....     @r_offs21
+bceqz           0100 10 ................ 00 ... .....    @c_offs21
+bcnez           0100 10 ................ 01 ... .....    @c_offs21
+jirl            0100 11 ................ ..... .....     @rr_offs16
+b               0101 00 ..........................       @offs26
+bl              0101 01 ..........................       @offs26
+beq             0101 10 ................ ..... .....     @rr_offs16
+bne             0101 11 ................ ..... .....     @rr_offs16
+blt             0110 00 ................ ..... .....     @rr_offs16
+bge             0110 01 ................ ..... .....     @rr_offs16
+bltu            0110 10 ................ ..... .....     @rr_offs16
+bgeu            0110 11 ................ ..... .....     @rr_offs16
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index daa77ade33..0ad6b7b2ee 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -171,6 +171,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_fcnv.c.inc"
 #include "insn_trans/trans_fmov.c.inc"
 #include "insn_trans/trans_fmemory.c.inc"
+#include "insn_trans/trans_branch.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
diff --git a/target/loongarch/insn_trans/trans_branch.c.inc b/target/loongarch/insn_trans/trans_branch.c.inc
new file mode 100644
index 0000000000..65dbdff41e
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_branch.c.inc
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static bool trans_b(DisasContext *ctx, arg_b *a)
+{
+    gen_goto_tb(ctx, 0, ctx->base.pc_next + a->offs);
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
+
+static bool trans_bl(DisasContext *ctx, arg_bl *a)
+{
+    tcg_gen_movi_tl(cpu_gpr[1], ctx->base.pc_next + 4);
+    gen_goto_tb(ctx, 0, ctx->base.pc_next + a->offs);
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
+
+static bool trans_jirl(DisasContext *ctx, arg_jirl *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    tcg_gen_addi_tl(cpu_pc, src1, a->offs);
+    tcg_gen_movi_tl(dest, ctx->base.pc_next + 4);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+    tcg_gen_lookup_and_goto_ptr();
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
+
+static void gen_bc(DisasContext *ctx, TCGv src1, TCGv src2,
+                   target_long offs, TCGCond cond)
+{
+    TCGLabel *l = gen_new_label();
+    tcg_gen_brcond_tl(cond, src1, src2, l);
+    gen_goto_tb(ctx, 1, ctx->base.pc_next + 4);
+    gen_set_label(l);
+    gen_goto_tb(ctx, 0, ctx->base.pc_next + offs);
+    ctx->base.is_jmp = DISAS_NORETURN;
+}
+
+static bool gen_rr_bc(DisasContext *ctx, arg_rr_offs *a, TCGCond cond)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rd, EXT_NONE);
+
+    gen_bc(ctx, src1, src2, a->offs, cond);
+    return true;
+}
+
+static bool gen_rz_bc(DisasContext *ctx, arg_r_offs *a, TCGCond cond)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = tcg_constant_tl(0);
+
+    gen_bc(ctx, src1, src2, a->offs, cond);
+    return true;
+}
+
+static bool gen_cz_bc(DisasContext *ctx, arg_c_offs *a, TCGCond cond)
+{
+    TCGv src1 = tcg_temp_new();
+    TCGv src2 = tcg_constant_tl(0);
+
+    tcg_gen_ld8u_tl(src1, cpu_env,
+                    offsetof(CPULoongArchState, cf[a->cj]));
+    gen_bc(ctx, src1, src2, a->offs, cond);
+    return true;
+}
+
+TRANS(beq, gen_rr_bc, TCG_COND_EQ)
+TRANS(bne, gen_rr_bc, TCG_COND_NE)
+TRANS(blt, gen_rr_bc, TCG_COND_LT)
+TRANS(bge, gen_rr_bc, TCG_COND_GE)
+TRANS(bltu, gen_rr_bc, TCG_COND_LTU)
+TRANS(bgeu, gen_rr_bc, TCG_COND_GEU)
+TRANS(beqz, gen_rz_bc, TCG_COND_EQ)
+TRANS(bnez, gen_rz_bc, TCG_COND_NE)
+TRANS(bceqz, gen_cz_bc, TCG_COND_EQ)
+TRANS(bcnez, gen_cz_bc, TCG_COND_NE)
-- 
2.34.1


