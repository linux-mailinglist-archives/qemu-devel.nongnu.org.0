Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F7E53F27F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:23:45 +0200 (CEST)
Received: from localhost ([::1]:35118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyM4W-0007p5-OQ
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLw3-0001OR-V7
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:00 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLw2-0003jU-1X
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:14:59 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so19216767pjo.0
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vpYicFtfBL5e7pdK0TzYLao+oHha5oV7ZTJVT1384ts=;
 b=Ds//7HZ0uwYoqY6Tf3pouALQ+7623hkr6ruROcLgRVBonTPWzNzlyRkFmNCP1GGdie
 3gr8xdJXkVi+YK94ie9geERqzq++fpDg09eFrlaILTsNhQyNoRB8GrbZWUtxipgH015E
 w+Yq22n7evE7xUSb+YTMFsp4zI/RIKRcwYL2yM/sR+yO1zP6NfjQ9oJeTMIuvSCHmbeo
 J148CemisweXYdvmLg25bk1cAqYe4WCKFOFBUFgvP1u3AcPeGObMbDucskBjSLE2zzu5
 4ysXo76ewdYRLpy1SmX2eFLX3O6OACsUN4fyuVVHEiPmvDEKVJBot3ZTm6Io/fwVtT5M
 uPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vpYicFtfBL5e7pdK0TzYLao+oHha5oV7ZTJVT1384ts=;
 b=QYUXwDFjg0XEnARP3y1coLNEVen2WOQ2EpTYwqiFkrPc+eQQ8taxsibbmZ5FQKjbsc
 KgvBOe8XPrWHMx82uhuaCDY3wWvkJg+qjwfxGviWxA8zNjbH7/LQVYZW1QP/29Jj+iaU
 CELY7NKhlEsQgt7t8TNRJbLmo510iPn4Grui+vEC3Cv6OqDyHke6/XjCEA9DkpizR1TN
 3D9KmoYo8hZ9aoFT+5Hgwm+zqL1hQ2xM4ezS5sxe6I18aGxdp60XzNm7pDZRxFsFGdTN
 xqJsHHOHdhSO94LeY/aQTZbOEKQESmlIC/woit4i/EbZhraiTpXf9ipRDPN7mW9psWax
 jI/Q==
X-Gm-Message-State: AOAM533foPr0QCBUydynDzrB2N1TgTQtWX8lvzYSV6tp4eCTNw+XDt7J
 kiN8pbuZiNrcypkX2ikEnXw0bVPL4cCPuw==
X-Google-Smtp-Source: ABdhPJwT9k4YJ1QFbRPdpjl4XXAtO6ep0IM2B+OgcQSyEIKmqksaOa8DolgEnqJbXuGgvOXkeszrjA==
X-Received: by 2002:a17:90b:4f88:b0:1e8:4013:e5f5 with SMTP id
 qe8-20020a17090b4f8800b001e84013e5f5mr19613681pjb.220.1654557296711; 
 Mon, 06 Jun 2022 16:14:56 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:14:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 05/43] target/loongarch: Add fixed point shift instruction
 translation
Date: Mon,  6 Jun 2022 16:14:12 -0700
Message-Id: <20220606231450.448443-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
- SLL.W, SRL.W, SRA.W, ROTR.W
- SLLI.W, SRLI.W, SRAI.W, ROTRI.W
- SLL.D, SRL.D, SRA.D, ROTR.D
- SLLI.D, SRLI.D, SRAI.D, ROTRI.D

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-6-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/insns.decode                 |  22 ++++
 target/loongarch/translate.c                  |   1 +
 target/loongarch/insn_trans/trans_shift.c.inc | 106 ++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_shift.c.inc

diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 8579c11984..673aee4be5 100644
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
index 65c7dfd3da..d5640d5d79 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -146,6 +146,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 
 #include "decode-insns.c.inc"
 #include "insn_trans/trans_arith.c.inc"
+#include "insn_trans/trans_shift.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
diff --git a/target/loongarch/insn_trans/trans_shift.c.inc b/target/loongarch/insn_trans/trans_shift.c.inc
new file mode 100644
index 0000000000..5260af2337
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
-- 
2.34.1


