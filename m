Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A4443042E
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:28:22 +0200 (CEST)
Received: from localhost ([::1]:52018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboPt-0003Gt-4Y
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDc-0008OL-Mz
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:41 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDX-00025J-E9
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:40 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso11653913pjb.4
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c5EhHQQDifSPFgUkD65aCkDjg20V3dEMIS1pmXt2CpQ=;
 b=lDSC4deyx0uyu1gpqEqS0tOuiUWZ/iSmL1Z55oBD6wvyKNWgSiDSD3EIgiL9SCTa1Q
 lIcPb60BXg3/C6ALNK08pf6SFBdWQDYRX0lFoFv2zV5yzNkRRyQdSjgr3AYnGqrl2aDx
 Mwd4EpurkIG0erMJOHmsh6RyJM6M1Hp1gSqUmJpU1WTmlrzz1MUk3+KftBgzIZqAuKg8
 yez9QT/S+8F4XhNjxQdgHv6EEjkyEmSPjR1agOOeKIiZ9B//LUf/ZaBmsu2wYfAkiwpG
 kvu9FA5A2muBidASfv/e4LAB0dUZlJeUNuh6sPnVSFVV/1OwSK5KG0ry3/XbXb8lcLIm
 dCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c5EhHQQDifSPFgUkD65aCkDjg20V3dEMIS1pmXt2CpQ=;
 b=BnRZTOT5dGD4DiJNRVORPUeEg7jkUuSzZqPChEEXd+cjQ+JDqGtApqpHqcFnQWp2gD
 cqq2i6gNAGgdYiER1KVK/kvuXNepFuU4Hjf32tKORO9pWoMaOOsNtL5pXsRnKxmR5S4l
 dKPkBsM15rq+2yiHbpz7cRxfiKlRmDG+FAc5/cgS2hrxfipqZ/5cvCvbUhYYg/WdaezA
 juelF0GkkRNtt7zItNQCgAUfKlsxOqSTx12F/wN2RZ6SzAD7EqrM/jT6rWULizdiC/9f
 JIkA83zQeplintAr12PpOa6nvtXtDikmr/1A2c4pFl/8zC2KH92MOEfrgaiizQNmSCAP
 l80g==
X-Gm-Message-State: AOAM533M6uYgrpc12LPIfdMhMvZAHLXwXvBlp32VC0FQkJe9yt6RsRSV
 tiPtx8eXaccEnJW6wMJ3uD4c0sTGwyHC9g==
X-Google-Smtp-Source: ABdhPJyLtfJp4txZQDcHZpTldaYRobm/HvGcNsVpFBXbDZI8WRxZKNNhj2TGpY8WZp1J2UgxakVUIA==
X-Received: by 2002:a17:90a:51:: with SMTP id
 17mr21926206pjb.185.1634408132218; 
 Sat, 16 Oct 2021 11:15:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/24] target/riscv: Remove exit_tb and lookup_and_goto_ptr
Date: Sat, 16 Oct 2021 11:15:08 -0700
Message-Id: <20211016181514.3165661-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically, which means
we don't need to do anything in the wrappers.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                      | 27 +------------------
 .../riscv/insn_trans/trans_privileged.c.inc   |  4 +--
 target/riscv/insn_trans/trans_rvi.c.inc       |  8 +++---
 target/riscv/insn_trans/trans_rvv.c.inc       |  2 +-
 4 files changed, 7 insertions(+), 34 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d2442f0cf5..6d7fbca1fa 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -149,31 +149,6 @@ static void generate_exception_mtval(DisasContext *ctx, int excp)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_debug(void)
-{
-    gen_helper_raise_exception(cpu_env, tcg_constant_i32(EXCP_DEBUG));
-}
-
-/* Wrapper around tcg_gen_exit_tb that handles single stepping */
-static void exit_tb(DisasContext *ctx)
-{
-    if (ctx->base.singlestep_enabled) {
-        gen_exception_debug();
-    } else {
-        tcg_gen_exit_tb(NULL, 0);
-    }
-}
-
-/* Wrapper around tcg_gen_lookup_and_goto_ptr that handles single stepping */
-static void lookup_and_goto_ptr(DisasContext *ctx)
-{
-    if (ctx->base.singlestep_enabled) {
-        gen_exception_debug();
-    } else {
-        tcg_gen_lookup_and_goto_ptr();
-    }
-}
-
 static void gen_exception_illegal(DisasContext *ctx)
 {
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
@@ -192,7 +167,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
-        lookup_and_goto_ptr(ctx);
+        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index a7afcb15ce..75c6ef80a6 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -78,7 +78,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 
     if (has_ext(ctx, RVS)) {
         gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
-        exit_tb(ctx); /* no chaining */
+        tcg_gen_exit_tb(NULL, 0); /* no chaining */
         ctx->base.is_jmp = DISAS_NORETURN;
     } else {
         return false;
@@ -94,7 +94,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 #ifndef CONFIG_USER_ONLY
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
     gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
-    exit_tb(ctx); /* no chaining */
+    tcg_gen_exit_tb(NULL, 0); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 #else
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 920ae0edb3..a6a57c94bb 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -71,9 +71,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     if (a->rd != 0) {
         tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
     }
-
-    /* No chaining with JALR. */
-    lookup_and_goto_ptr(ctx);
+    tcg_gen_lookup_and_goto_ptr();
 
     if (misaligned) {
         gen_set_label(misaligned);
@@ -421,7 +419,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
      * however we need to end the translation block
      */
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-    exit_tb(ctx);
+    tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
@@ -430,7 +428,7 @@ static bool do_csr_post(DisasContext *ctx)
 {
     /* We may have changed important cpu state -- exit to main loop. */
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-    exit_tb(ctx);
+    tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fa451938f1..081a5ca34d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -41,7 +41,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
     gen_set_gpr(ctx, a->rd, dst);
 
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-    lookup_and_goto_ptr(ctx);
+    tcg_gen_lookup_and_goto_ptr();
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
-- 
2.25.1


