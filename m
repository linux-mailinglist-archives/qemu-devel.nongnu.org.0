Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374B430436
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:33:18 +0200 (CEST)
Received: from localhost ([::1]:33026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboUf-00015w-7f
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDa-0008Ni-Kg
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:40 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDV-000244-Rt
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:38 -0400
Received: by mail-pj1-x1035.google.com with SMTP id oa4so9488210pjb.2
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NHkVXGk0j5znwFvR9UOGNMQ7aEfwMBh0zYc+I8bw0PM=;
 b=BXNBzxm4QV+69mPa4dOHiN6kufwdMMhuTfj8KleWCXQoIpc01HUpkKMZAKQ+VZSeac
 /Q87eMAlb9bm/a28vbSXTDGzZrubAB5mDPaMZHPflpeh9UoU6fAf6oA7IHaDwh5vRVlj
 v5Uw/gmOQW1tC6VdqrnHxRGmwEpHvTk8Mi87IA3JIzj7bOPuWyYQPHm22Kztwb4vN/yE
 GvrwvlJfKJOJUZCyBluTawuszG1ul55fE8fwrfolQOakllFQoEVIfVlf951PQRAvBs3v
 A+ekI2hIU20UYcRmRUcOOscEWe0j2Ni+s1lzO5scXlPIiRVaK3kFw3oLXGsdbjaZBTPE
 yCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NHkVXGk0j5znwFvR9UOGNMQ7aEfwMBh0zYc+I8bw0PM=;
 b=wyJY/83Ew0Fc9/FT+1wsz17fASzfb9Y5A4QVwMcVWPTPGyCCAvXJTVTikp7nfgZBZQ
 uIk9aBWaCw77hlfFdt+lNRCjQkS2eTMjWQrsaLCkeQ8nWU6BEwPaFfueZ+/lmB21HAJs
 YlNfyA6R2jxNhqFjqQ4kcHYIyU+khQzYifKFWGMj56+nb6N4FsDOuywBA7Fh4q/esyNW
 bn1rBcJQZ9rWozFvbXqd7LEeqhPb3fIlEt3hE2IcoGlXNIwymjIc5YJ2AZgVudIgJuzx
 JF9H4ULF5awebvVLcGfqOmfsMGd7tTSKmBbMF5D+xnzmtVvnsdHzR2KTZNA5PCuljCPE
 aAKA==
X-Gm-Message-State: AOAM530GDV4czmmDpL61QWM6/gqDtwKBGpbAm7eXHvqNaT/ghJsNBASw
 jSyfAOXT1SUje7feNFDnStRvnfEYq/Gz2Q==
X-Google-Smtp-Source: ABdhPJzrBgFr7UXFfXd4re9U/VWphRAkUbmggVT0YtYeuRXnKm9F1NlIbwvyv+Wx/vPX1y0tyIhg3Q==
X-Received: by 2002:a17:90a:5d89:: with SMTP id
 t9mr13329615pji.21.1634408130624; 
 Sat, 16 Oct 2021 11:15:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/24] target/ppc: Drop exit checks for singlestep_enabled
Date: Sat, 16 Oct 2021 11:15:06 -0700
Message-Id: <20211016181514.3165661-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
index 9ca78ee156..c3c6cb9589 100644
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
 
@@ -4309,15 +4308,8 @@ static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 
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
@@ -8563,17 +8555,11 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
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
@@ -8642,7 +8628,6 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     DisasJumpType is_jmp = ctx->base.is_jmp;
     target_ulong nip = ctx->base.pc_next;
-    int sse;
 
     if (is_jmp == DISAS_NORETURN) {
         /* We have already exited the TB. */
@@ -8650,8 +8635,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 
     /* Honor single stepping. */
-    sse = ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP);
-    if (unlikely(sse)) {
+    if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP)
+        && (nip <= 0x100 || nip > 0xf00)) {
         switch (is_jmp) {
         case DISAS_TOO_MANY:
         case DISAS_EXIT_UPDATE:
@@ -8665,15 +8650,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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


