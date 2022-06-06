Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C212F53F28D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:31:09 +0200 (CEST)
Received: from localhost ([::1]:52690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMBg-0002nX-Rl
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwG-0001ew-CT
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:13 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwA-0003wu-VB
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:09 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 15so13944751pfy.3
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xdegqGTkXjZ90zP10Pl3Exu6+FSJqGvk04CPFrwI5JU=;
 b=VBK6tESEWmS0xG4CCqQKDbb3Ae2VRk9KCGaxcIVzgA/C8RFQI5tpa6ArSSBRAp6Mdc
 SBRZno/97LmX5kqHDWecWfg+4xF+cDsxy+OjRz+CI3XRR4AmIYgu85NgEx5au8zdOsSC
 lNEx9UYExgJdjnckn1sstaU6plLYzMtLq/qwFZjxShBXu1xeyhlomevDm++OSKmpN3ZQ
 SkUp1hY4SJvF14N4npQ2FFXAM6+dDHCZGtTw87ZG/2aiR3QXkfEmS60Jn1bBCWoyhDOj
 GJcByJIN/fz9TwsCiBhwe1LGLh2XoUia8THHbX+/a41g2TLokJtRV6mNNiFmbH2PWj+y
 gnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xdegqGTkXjZ90zP10Pl3Exu6+FSJqGvk04CPFrwI5JU=;
 b=HWlZ0A3bXNpQQ5RD/G57dreMdHC991bRvySsywaAwKu2dp2RLVOkWe7kqyeSW/2rBA
 yL+cpAT72+/05301WYudnANf5v2k5N2BvtF2uiq6c8BhWiLbTZrH5MLckpmI8LTSLHqy
 ijct4xuc6af+14Yaet/FkAYAvxbejsMxnRgsk2DcvGYscMQI07rD7WsK19UjnfySw+az
 UCdGBruXgI9nTGS07USNnkwEH2KuvsqNAW6cWsukgjIECHo7KMfOb2tIe+YuJUzEHl+K
 GRD0MMgfkoDsgG1KtR7yqY3FcY7lPKZ3Q7GX48I3yFz47Nlw93dLdXv1ZmIHL6ALKazw
 G7OA==
X-Gm-Message-State: AOAM533rijyDedCmKE0bCxH+1gHtT1B7EAB5cQ3s+Cuw/kD90KOVRKmO
 12iVWwzX5aXDARUuc9GMt2a+Q1+Ss/fWpw==
X-Google-Smtp-Source: ABdhPJx4NOI7Ie+T9O7D6qqBRQGQ/OTvwhIIoTLkj8inZN+ed+QDa1hJL3tULmvdlnL8x3wKy1cdPg==
X-Received: by 2002:a05:6a00:170b:b0:51b:d1fd:5335 with SMTP id
 h11-20020a056a00170b00b0051bd1fd5335mr22933364pfc.28.1654557305592; 
 Mon, 06 Jun 2022 16:15:05 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 14/43] target/loongarch: Add floating point load/store
 instruction translation
Date: Mon,  6 Jun 2022 16:14:21 -0700
Message-Id: <20220606231450.448443-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
- FLD.{S/D}, FST.{S/D}
- FLDX.{S/D}, FSTX.{S/D}
- FLD{GT/LE}.{S/D}, FST{GT/LE}.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-15-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/insns.decode                 |  24 +++
 target/loongarch/translate.c                  |   1 +
 .../loongarch/insn_trans/trans_fmemory.c.inc  | 153 ++++++++++++++++++
 3 files changed, 178 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_fmemory.c.inc

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
index 26d60b50fd..daa77ade33 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -170,6 +170,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_fcmp.c.inc"
 #include "insn_trans/trans_fcnv.c.inc"
 #include "insn_trans/trans_fmov.c.inc"
+#include "insn_trans/trans_fmemory.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
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
-- 
2.34.1


