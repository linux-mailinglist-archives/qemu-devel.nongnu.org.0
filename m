Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFAB3D0947
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:57:26 +0200 (CEST)
Received: from localhost ([::1]:53204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m66AX-0004PS-Cn
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vt-0005Cv-S0
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:19 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vr-0005d3-EI
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:17 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so3415509pjb.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0yWsbDmTZbiJvikOhyn9x2esTpv/FkMhTyF7Ez0FCJA=;
 b=gi8QZx6pCt2KMMGSsJDZs7qonW/uhYmxiX9PQaZsEjIACAqlRvSMDrhJDyIHXP3Eh+
 C6ow1p5vQ5P6iisQ7D0f8yP/4Oi45tVrN2cEJyTJtDeB+zdwJShwfWMOjJ7qJEIMNbwX
 8zXKzLKYYvlK5P/7KPZX8bnDcscxvlo7BtjW2NYeJgOnJEUTvod7PCNyZ3yILq++1Zm+
 uxrOO/q9EVMgY4Kc6LnbvlktLXhvA8yg7R66e+A+vWa8RWX4HfSoGzAWlNr7dLMHzzgO
 IAy33oxy3Pd2P+c8nRSRRkFOpeRUj6WzCPuc3ktTdt6y4hhTcP+ZrBKHm8gJRCeZnwnq
 ybmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0yWsbDmTZbiJvikOhyn9x2esTpv/FkMhTyF7Ez0FCJA=;
 b=bVwBdfZ+6/zU1rMkKfdKGQnXGeThizsRW0FPbUbqSACV9Ai6zwTdMTw0RdX0vTTwJb
 dJltJHNo3kchKXNsal2Q1kpFH7/vJzHvd7Z7aBQofyK8uGEHy6j5y+1QFGu/xSnnc4uL
 q34sjGqGQuUOBW9BPTl2rTIjt3m7EoutN8/7jvVHadhVLAv5he/GhaO29dYqv0kxpabJ
 oeudj9SvXIEBoH34Ai0p3/ahOnuVUp6Nho6g1gVcQ+Cd0ToS0i2S2DRm8Nbj5KxGHr+X
 NJfoIxNMG8bLJ3Om5eR0dD3k97+XsNnd9noioyfnB6zsP1TOPquZoUSv+CI2SotOkW50
 rddg==
X-Gm-Message-State: AOAM530jWXotd9JEDwUD2aLx4Z+cjxkCAX9TSYJ9JnZHjxc20yQIxWet
 vEAdaeGAH1fcB6vTbbZRUxuh3C6y5sMY2A==
X-Google-Smtp-Source: ABdhPJyFbxLYizJ5R0U+PoQqmU1vchkS4d5KoiorR6K9KYaX3D6i2TM+nVIzUArCcI/Ei4Ac5m5dxA==
X-Received: by 2002:a17:903:234f:b029:12b:7bad:75cb with SMTP id
 c15-20020a170903234fb029012b7bad75cbmr15859776plh.67.1626849734159; 
 Tue, 20 Jul 2021 23:42:14 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 16/23] target/ppc: Drop exit checks for
 singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:48 -1000
Message-Id: <20210721064155.645508-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
index 171b216e17..70dbb61a15 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -42,7 +42,6 @@
 
 #define CPU_SINGLE_STEP 0x1
 #define CPU_BRANCH_STEP 0x2
-#define GDBSTUB_SINGLE_STEP 0x4
 
 /* Include definitions for instructions classes and implementations flags */
 /* #define PPC_DEBUG_DISAS */
@@ -332,7 +331,7 @@ static uint32_t gen_prep_dbgex(DisasContext *ctx)
 
 static void gen_debug_exception(DisasContext *ctx)
 {
-    gen_helper_raise_exception(cpu_env, tcg_constant_i32(EXCP_DEBUG));
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(gen_prep_dbgex(ctx)));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -4306,15 +4305,8 @@ static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 
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
@@ -8543,17 +8535,11 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
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
@@ -8621,7 +8607,6 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     DisasJumpType is_jmp = ctx->base.is_jmp;
     target_ulong nip = ctx->base.pc_next;
-    int sse;
 
     if (is_jmp == DISAS_NORETURN) {
         /* We have already exited the TB. */
@@ -8629,8 +8614,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 
     /* Honor single stepping. */
-    sse = ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP);
-    if (unlikely(sse)) {
+    if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP)
+        && (nip <= 0x100 || nip > 0xf00)) {
         switch (is_jmp) {
         case DISAS_TOO_MANY:
         case DISAS_EXIT_UPDATE:
@@ -8644,15 +8629,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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


