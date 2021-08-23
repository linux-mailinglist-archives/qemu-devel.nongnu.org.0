Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A49D3F51AC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 22:05:33 +0200 (CEST)
Received: from localhost ([::1]:46884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIGCF-0002Eq-9b
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 16:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2y-0006Sr-FY
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:52 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:55844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2o-00039h-R6
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:52 -0400
Received: by mail-pj1-x1029.google.com with SMTP id mq3so12661156pjb.5
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vJ/pmJnEHhfxg/ptEpqhuR5Wn/nbZbRjoP5x1AyfD8g=;
 b=kkkATWy9uBhIZ58lDcdCsI+9cR8r1979UkjyLUSdvj8Vh7Unx0uV7l9JQY9+QmPCIo
 n6rCHYl8wVii5tU+VPKDVroIMM+vIidF8dyd4SFa+FW140/p9jfeNFq8vxUxUXnOIU5Q
 1ynukNSwvkv7ys0RpruUsWSknc3MiQgGgi6VckjM144v3M/jo/vu1SkshNUM9zksMPnL
 wntxiqxRap5qdssIjicChoYJ9oFomUgtTIOILBXriMrpWqc+qxVLHIp/reK0p0fO2diq
 UsyUgecMBeQ1RFnUiDx+4RBQktEXxjep2TLgvU2KfuC0jHxSGAZviPTxlTurfNiW19or
 IoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vJ/pmJnEHhfxg/ptEpqhuR5Wn/nbZbRjoP5x1AyfD8g=;
 b=K3OJEoSSkR7T0H6chky59fY6EbfDzmmmAqn33rZOMhKdNEmAPE/FLzhPZXCs//Qbad
 W2l3NRKArVjzhILVDhPpbI8PuaPi9DZxNURzb8LGIVrdFXQYT25hbPxHInTCAgJjoYQV
 kX41d6QG6Wp+AdW+hkxkZJPi7KuwjeHU8U3fZavEBtsO5qOPNUsEvViwXN+FeW0m8k1j
 k6fwiPFJihlw2AaNoAXzgk+lxF6Vs1IeXoYyr5zfrTjDLwqd1MjrBLW/nIAps65hIugp
 JYIVYvqwkx3H4yZWPeAd88cpchZmSpFmtwbrpnBom0QuHzbXMq6vObHMiqqc+rFXyCDL
 TsMA==
X-Gm-Message-State: AOAM5312uA2rOhObkVwZjuY7sPzeGvQ/CPOI8p8AUEwOVSMbBzYpDXpz
 bP0z+Q7x8PMt/ULuAPAQzA+FyKIjooi7ug==
X-Google-Smtp-Source: ABdhPJwnivNKvh5YCpPS1Dzej4ZNnmRCn7qEDuWjM69d9QHs0BmUcVku3QKHvorLK49QWwCO1+/SPQ==
X-Received: by 2002:a17:90a:b795:: with SMTP id
 m21mr227222pjr.143.1629748541297; 
 Mon, 23 Aug 2021 12:55:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/24] target/riscv: Use get_gpr in branches
Date: Mon, 23 Aug 2021 12:55:19 -0700
Message-Id: <20210823195529.560295-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Narrow the scope of t0 in trans_jalr.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 9e8d99be51..a5249e71c2 100644
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


