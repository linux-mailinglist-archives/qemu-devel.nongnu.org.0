Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE273EF4F1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 23:28:25 +0200 (CEST)
Received: from localhost ([::1]:47844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG6dE-0008Ky-NL
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 17:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6Tf-0001dw-4X
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 17:18:31 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6Td-0001DL-KP
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 17:18:30 -0400
Received: by mail-pf1-x42f.google.com with SMTP id 7so5967pfl.10
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 14:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uXz1p1569OZLUX0VzAchBtPsRwQuQavRQcjQZ2ZJXHM=;
 b=QA4+CpWlaYS6RHsmL5XncSSx+elotGyNr/OyrW6tH3BPdhgueM/t7lODs58xA5+x5Z
 AdoMwoZZypfwKRSd7+lUQ8KZmTmKh/r0d45MNbOUGTBCifpmfvOrYgR6hZrZ5PCAHlsp
 Vw+mN9ehV25jXPe7AJkQeATyE51rG4eDmCsL9dUro3yxzGmhATjZguz+tFwcQwtn6ym+
 pHqIZmmqQVVO440ZtkQK4Tb0XdKSkq905Fpvhum8m0UByOTqioQJqD/GsLvcRFSy24lq
 c2SGz7lgp65R9LjEUQY1rUIFxtvUprIUMQRv3Ko/3zYgTSM+WY8FH8WHKi0ESFx8tCpi
 on3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uXz1p1569OZLUX0VzAchBtPsRwQuQavRQcjQZ2ZJXHM=;
 b=pnbs4G/+6Dgx5IUIwz+3+ucXUSa5Fn7Oc4VnsFG6nLET18mE8CUTc938PSrnEwAeFR
 MNHLcbUbSmzZNNapFzBUNzxYIU1k2sQMcJ2JAVBBEYKtguMir6pzgWay+Q+FHx28jIX2
 jrnMK6xDEXUEkRvAA9n1stmidqgtjlZLqBacjJvPb+jR8TnJhvzSkfCbS4Is+EpI1PIo
 oCtJnMtVjItIWNPonGHekvZva1rAccMfJnda1DZz7mqelAC5AVoujGjCRk7oNIgCekrU
 dTbohnKciUqcXpTxV0bUg46UizbNJB1L5ijONwrnZiF75p5mnuxZHrNz9vbaOh+mgW3R
 Wkjw==
X-Gm-Message-State: AOAM532IE8QLZjbJlpyJOTX2qYMWKOJAAruhNc8gFI4/XxOVtXKhVucI
 3wFNSHgGxzJoix3m2fkamTNpxWvZC3peHA==
X-Google-Smtp-Source: ABdhPJwwFLFB0yEKoYaGU9nxyFy3ETFeEdy5LnlhzGhu3/7mmxpf8KxgaWxpqevXkSuQBFaTK/rxkA==
X-Received: by 2002:a63:1247:: with SMTP id 7mr5264840pgs.366.1629235106795;
 Tue, 17 Aug 2021 14:18:26 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/21] target/riscv: Use get_gpr in branches
Date: Tue, 17 Aug 2021 11:17:55 -1000
Message-Id: <20210817211803.283639-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817211803.283639-1-richard.henderson@linaro.org>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Narrow the scope of t0 in trans_jalr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index e25f64c45a..af3e0bc0e6 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -54,24 +54,25 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
 
 static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
 {
-    /* no chaining with JALR */
     TCGLabel *misaligned = NULL;
-    TCGv t0 = tcg_temp_new();
 
-
-    gen_get_gpr(ctx, cpu_pc, a->rs1);
-    tcg_gen_addi_tl(cpu_pc, cpu_pc, a->imm);
+    tcg_gen_addi_tl(cpu_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
     tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
 
     if (!has_ext(ctx, RVC)) {
+        TCGv t0 = tcg_temp_new();
+
         misaligned = gen_new_label();
         tcg_gen_andi_tl(t0, cpu_pc, 0x2);
         tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
+        tcg_temp_free(t0);
     }
 
     if (a->rd != 0) {
         tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
     }
+
+    /* No chaining with JALR. */
     lookup_and_goto_ptr(ctx);
 
     if (misaligned) {
@@ -80,21 +81,18 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 
-    tcg_temp_free(t0);
     return true;
 }
 
 static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 {
     TCGLabel *l = gen_new_label();
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
 
-    tcg_gen_brcond_tl(cond, source1, source2, l);
+    tcg_gen_brcond_tl(cond, src1, src2, l);
     gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
+
     gen_set_label(l); /* branch taken */
 
     if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
@@ -105,9 +103,6 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-
     return true;
 }
 
-- 
2.25.1


