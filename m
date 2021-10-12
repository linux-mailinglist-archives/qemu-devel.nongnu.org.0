Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483A542A97B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:34:03 +0200 (CEST)
Received: from localhost ([::1]:47840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKj4-0000hW-Bl
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXi-0006cA-AS
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:18 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXe-00048g-LY
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:17 -0400
Received: by mail-pg1-x52b.google.com with SMTP id s75so14335330pgs.5
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=c+2jqTHYz2HTI6HWdOH/qFDNzECfx/sjJFCOKjm9YjM=;
 b=RWstJtMl3aEqYL2dVvkQmrB5CHCmrnyI8UEWHCyHhOZoNgGJt6vtp2fUWtDBLsCl3l
 9gvY5gHwACF30Lx9ngqEKGCLoNwf5yIwq7wMtm/+hyDLTadxkDOpZqAoyY/9144R1XMP
 b1ApRi+sfLOsTBQK1j/DB/7BrnO+qJckOIXGY6rVGf8wjla3LZZ//oqHbfxb0ekrzamX
 cKDhjgEENPMgliwGS7pWVyKTNX4c/A/7zypAZNHCZiMcO5Z6FAlHXt9Fh4o7wLhQiFav
 CboCNw0+IrjjUiWhbYaY4JnBbzUShzhw5kS7jTgAXYhlW1Z/5vPPA+Mp6cmdXjChXie6
 zC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c+2jqTHYz2HTI6HWdOH/qFDNzECfx/sjJFCOKjm9YjM=;
 b=NL1q8KsWYzEUNt0M+5FGr8ffNaiB9dED35XH9TWuy/peZ+XXfQqCa7FmlEKMkmtBr2
 Fq6+0uI4idaiYfHwRCgh4D/h73r6yp38nBs57nNg49BxMB9euJ5iRskZ71o1hi3YGqcM
 hT1P7TnENW5N7i5q5OFpa+czYgjPAsv47rDe9hHoNxEKeeiE+ybfk5yDlY5dTED0tWTX
 aQ3SMYOJcxRr3S4iajBO3bofTkP2udtrILraQ0pPp/YSqpbgfuUCyL+w43id211hDGb8
 1/Mx6cpFejhqAEMvKhmDGOcQvy73zP0D079SQRKxhur3gVZ4GwuM81IGbgs11in1wI3f
 x1tA==
X-Gm-Message-State: AOAM5324FI7wY6E5sSFjjUKrSpH9aG3EytDJxeeX45ZdTLDy1A6WI0CU
 r9k+mdIBSiEnEQ0tS15qjpvefHHaXwazFw==
X-Google-Smtp-Source: ABdhPJzuIdX+KnqJ5lowzXsESbUwfFgY7p/yClLBewlD8LUrBfdG7f2n3/rI6if+rssElaZwOhMPyw==
X-Received: by 2002:aa7:8891:0:b0:44d:a66:2f1b with SMTP id
 z17-20020aa78891000000b0044d0a662f1bmr16303973pfe.22.1634055733326; 
 Tue, 12 Oct 2021 09:22:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/23] target/ppc: Drop exit checks for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:52 -0700
Message-Id: <20211012162159.471406-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.
Reuse gen_debug_exception to handle architectural debug exceptions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 38 ++++++++------------------------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b985e9e55b..80635b0621 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -42,7 +42,6 @@
 
 #define CPU_SINGLE_STEP 0x1
 #define CPU_BRANCH_STEP 0x2
-#define GDBSTUB_SINGLE_STEP 0x4
 
 /* Include definitions for instructions classes and implementations flags */
 /* #define PPC_DEBUG_DISAS */
@@ -333,7 +332,7 @@ static uint32_t gen_prep_dbgex(DisasContext *ctx)
 
 static void gen_debug_exception(DisasContext *ctx)
 {
-    gen_helper_raise_exception(cpu_env, tcg_constant_i32(EXCP_DEBUG));
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(gen_prep_dbgex(ctx)));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -4307,15 +4306,8 @@ static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 
 static void gen_lookup_and_goto_ptr(DisasContext *ctx)
 {
-    int sse = ctx->singlestep_enabled;
-    if (unlikely(sse)) {
-        if (sse & GDBSTUB_SINGLE_STEP) {
-            gen_debug_exception(ctx);
-        } else if (sse & (CPU_SINGLE_STEP | CPU_BRANCH_STEP)) {
-            gen_helper_raise_exception(cpu_env, tcg_constant_i32(gen_prep_dbgex(ctx)));
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+    if (unlikely(ctx->singlestep_enabled)) {
+        gen_debug_exception(ctx);
     } else {
         tcg_gen_lookup_and_goto_ptr();
     }
@@ -8561,17 +8553,11 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->singlestep_enabled = 0;
     if ((hflags >> HFLAGS_SE) & 1) {
         ctx->singlestep_enabled |= CPU_SINGLE_STEP;
+        ctx->base.max_insns = 1;
     }
     if ((hflags >> HFLAGS_BE) & 1) {
         ctx->singlestep_enabled |= CPU_BRANCH_STEP;
     }
-    if (unlikely(ctx->base.singlestep_enabled)) {
-        ctx->singlestep_enabled |= GDBSTUB_SINGLE_STEP;
-    }
-
-    if (ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP)) {
-        ctx->base.max_insns = 1;
-    }
 }
 
 static void ppc_tr_tb_start(DisasContextBase *db, CPUState *cs)
@@ -8640,7 +8626,6 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     DisasJumpType is_jmp = ctx->base.is_jmp;
     target_ulong nip = ctx->base.pc_next;
-    int sse;
 
     if (is_jmp == DISAS_NORETURN) {
         /* We have already exited the TB. */
@@ -8648,8 +8633,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 
     /* Honor single stepping. */
-    sse = ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP);
-    if (unlikely(sse)) {
+    if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP)
+        && (nip <= 0x100 || nip > 0xf00)) {
         switch (is_jmp) {
         case DISAS_TOO_MANY:
         case DISAS_EXIT_UPDATE:
@@ -8663,15 +8648,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
             g_assert_not_reached();
         }
 
-        if (sse & GDBSTUB_SINGLE_STEP) {
-            gen_debug_exception(ctx);
-            return;
-        }
-        /* else CPU_SINGLE_STEP... */
-        if (nip <= 0x100 || nip > 0xf00) {
-            gen_helper_raise_exception(cpu_env, tcg_constant_i32(gen_prep_dbgex(ctx)));
-            return;
-        }
+        gen_debug_exception(ctx);
+        return;
     }
 
     switch (is_jmp) {
-- 
2.25.1


