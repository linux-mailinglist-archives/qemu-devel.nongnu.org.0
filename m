Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2DF6F51FE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:41:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6te-0004tP-Pf; Wed, 03 May 2023 03:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ta-0004oS-3W
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:26 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tX-0005h4-7h
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:25 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1950f5676so49149125e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098842; x=1685690842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHMznhDZOucZiZnqaYMteWVjZfl00HdpVCrzNF7XO3s=;
 b=BN9HubY7EDyLyXLjJALxMAMh2uyMENuNjEvv/j7+csEOYoXpT2w2FPmFuj3rGQDCLy
 hx9OZw0XuP6Ti1ZIBN0oHXB++9WlfqIByBRe+VX7LTCYe2TwzLlwJOlokJEwLpVWtb3X
 OxPqztq5+HcBUwc0P8Kxo8eUdpYVgP5gAC4XUB3WQDl44e0uk0WAPPDIUrrWT0e3ARF7
 NNzYyqfXxowyvs6bMKeEt5uy9FwqqRTTJJMUTtAEeX6fZU6CShfFvMemMkLwGQEz2NUv
 KanUE39WvUzSMUb5XXFmNRUVcNICHAY+EJlyc2GnsSN0Aos5LVngH6u4rif7bQmkXCKW
 WKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098842; x=1685690842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHMznhDZOucZiZnqaYMteWVjZfl00HdpVCrzNF7XO3s=;
 b=SVoowPhKNU4qJ9co3hCKa9jRneo+ojRgESSMju/+NHLKqWkzy1stD6u1rizepcr9UM
 OMTmx66Slh2+IAqLNrXXRik1oYRHLHtFDTAv1igSG9P26XzFfJqs8RqoTwQG5ufmQtUY
 v2DC5H8x9UXK81FDFVSC49g3NHR6yRAWW8LvDnxAtmRQB4uoPszJGQUweHgIO3njxlOz
 1AMJq6W5KE0W35rHrpKTWTpzKy6qAG8RO/m4efuFwlk3NrOSCbnz7voyai1hXyuBUirU
 +6tz7rSjsURRnLix5O9Ux3l4NcVH7y8ClX+HgVud5uuvt+5N4+k1K6qBAjAFy2nFi02I
 NsmQ==
X-Gm-Message-State: AC+VfDyMolvD4qlXi19nKgcGYQqjWKxKwquix07+ifoHebNy1KR1EQdC
 wI5YrfF+Umcapji4/YWtzpTXSSFNY4jE8y46srImSQ==
X-Google-Smtp-Source: ACHHUZ4e5//T4S935m9LPkDlTaTFtWyWiRUeUI/FN7iR0B175KroWez8/hLoyrZMEcL//QeX1Eao1Q==
X-Received: by 2002:a05:600c:22d0:b0:3f0:7e15:f8fc with SMTP id
 16-20020a05600c22d000b003f07e15f8fcmr14919649wmg.14.1683098841749; 
 Wed, 03 May 2023 00:27:21 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 65/84] accel/tcg: Move most of gen-icount.h into translator.c
Date: Wed,  3 May 2023 08:23:12 +0100
Message-Id: <20230503072331.1747057-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The only usage of gen_tb_start and gen_tb_end are here.
Move the static icount_start_insn variable into a local
within translator_loop.  Simplify the two subroutines
by passing in the existing local cflags variable.

Leave only the declaration of gen_io_start in gen-icount.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 79 +------------------------------------
 accel/tcg/translator.c    | 83 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 82 insertions(+), 80 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index f6de79a6b4..6006af4c06 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -1,83 +1,6 @@
 #ifndef GEN_ICOUNT_H
 #define GEN_ICOUNT_H
 
-#include "exec/exec-all.h"
-
-/* Helpers for instruction counting code generation.  */
-
-static TCGOp *icount_start_insn;
-
-static inline void gen_io_start(void)
-{
-    tcg_gen_st_i32(tcg_constant_i32(1), cpu_env,
-                   offsetof(ArchCPU, parent_obj.can_do_io) -
-                   offsetof(ArchCPU, env));
-}
-
-static inline void gen_tb_start(const TranslationBlock *tb)
-{
-    TCGv_i32 count = tcg_temp_new_i32();
-
-    tcg_gen_ld_i32(count, cpu_env,
-                   offsetof(ArchCPU, neg.icount_decr.u32) -
-                   offsetof(ArchCPU, env));
-
-    if (tb_cflags(tb) & CF_USE_ICOUNT) {
-        /*
-         * We emit a sub with a dummy immediate argument. Keep the insn index
-         * of the sub so that we later (when we know the actual insn count)
-         * can update the argument with the actual insn count.
-         */
-        tcg_gen_sub_i32(count, count, tcg_constant_i32(0));
-        icount_start_insn = tcg_last_op();
-    }
-
-    /*
-     * Emit the check against icount_decr.u32 to see if we should exit
-     * unless we suppress the check with CF_NOIRQ. If we are using
-     * icount and have suppressed interruption the higher level code
-     * should have ensured we don't run more instructions than the
-     * budget.
-     */
-    if (tb_cflags(tb) & CF_NOIRQ) {
-        tcg_ctx->exitreq_label = NULL;
-    } else {
-        tcg_ctx->exitreq_label = gen_new_label();
-        tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, tcg_ctx->exitreq_label);
-    }
-
-    if (tb_cflags(tb) & CF_USE_ICOUNT) {
-        tcg_gen_st16_i32(count, cpu_env,
-                         offsetof(ArchCPU, neg.icount_decr.u16.low) -
-                         offsetof(ArchCPU, env));
-        /*
-         * cpu->can_do_io is cleared automatically here at the beginning of
-         * each translation block.  The cost is minimal and only paid for
-         * -icount, plus it would be very easy to forget doing it in the
-         * translator. Doing it here means we don't need a gen_io_end() to
-         * go with gen_io_start().
-         */
-        tcg_gen_st_i32(tcg_constant_i32(0), cpu_env,
-                       offsetof(ArchCPU, parent_obj.can_do_io) -
-                       offsetof(ArchCPU, env));
-    }
-}
-
-static inline void gen_tb_end(const TranslationBlock *tb, int num_insns)
-{
-    if (tb_cflags(tb) & CF_USE_ICOUNT) {
-        /*
-         * Update the num_insn immediate parameter now that we know
-         * the actual insn count.
-         */
-        tcg_set_insn_param(icount_start_insn, 2,
-                           tcgv_i32_arg(tcg_constant_i32(num_insns)));
-    }
-
-    if (tcg_ctx->exitreq_label) {
-        gen_set_label(tcg_ctx->exitreq_label);
-        tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
-    }
-}
+void gen_io_start(void);
 
 #endif
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 6120ef2a92..b0d0015c70 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -18,6 +18,84 @@
 #include "exec/plugin-gen.h"
 #include "exec/replay-core.h"
 
+
+void gen_io_start(void)
+{
+    tcg_gen_st_i32(tcg_constant_i32(1), cpu_env,
+                   offsetof(ArchCPU, parent_obj.can_do_io) -
+                   offsetof(ArchCPU, env));
+}
+
+static TCGOp *gen_tb_start(uint32_t cflags)
+{
+    TCGv_i32 count = tcg_temp_new_i32();
+    TCGOp *icount_start_insn = NULL;
+
+    tcg_gen_ld_i32(count, cpu_env,
+                   offsetof(ArchCPU, neg.icount_decr.u32) -
+                   offsetof(ArchCPU, env));
+
+    if (cflags & CF_USE_ICOUNT) {
+        /*
+         * We emit a sub with a dummy immediate argument. Keep the insn index
+         * of the sub so that we later (when we know the actual insn count)
+         * can update the argument with the actual insn count.
+         */
+        tcg_gen_sub_i32(count, count, tcg_constant_i32(0));
+        icount_start_insn = tcg_last_op();
+    }
+
+    /*
+     * Emit the check against icount_decr.u32 to see if we should exit
+     * unless we suppress the check with CF_NOIRQ. If we are using
+     * icount and have suppressed interruption the higher level code
+     * should have ensured we don't run more instructions than the
+     * budget.
+     */
+    if (cflags & CF_NOIRQ) {
+        tcg_ctx->exitreq_label = NULL;
+    } else {
+        tcg_ctx->exitreq_label = gen_new_label();
+        tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, tcg_ctx->exitreq_label);
+    }
+
+    if (cflags & CF_USE_ICOUNT) {
+        tcg_gen_st16_i32(count, cpu_env,
+                         offsetof(ArchCPU, neg.icount_decr.u16.low) -
+                         offsetof(ArchCPU, env));
+        /*
+         * cpu->can_do_io is cleared automatically here at the beginning of
+         * each translation block.  The cost is minimal and only paid for
+         * -icount, plus it would be very easy to forget doing it in the
+         * translator. Doing it here means we don't need a gen_io_end() to
+         * go with gen_io_start().
+         */
+        tcg_gen_st_i32(tcg_constant_i32(0), cpu_env,
+                       offsetof(ArchCPU, parent_obj.can_do_io) -
+                       offsetof(ArchCPU, env));
+    }
+
+    return icount_start_insn;
+}
+
+static void gen_tb_end(const TranslationBlock *tb, uint32_t cflags,
+                       TCGOp *icount_start_insn, int num_insns)
+{
+    if (cflags & CF_USE_ICOUNT) {
+        /*
+         * Update the num_insn immediate parameter now that we know
+         * the actual insn count.
+         */
+        tcg_set_insn_param(icount_start_insn, 2,
+                           tcgv_i32_arg(tcg_constant_i32(num_insns)));
+    }
+
+    if (tcg_ctx->exitreq_label) {
+        gen_set_label(tcg_ctx->exitreq_label);
+        tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
+    }
+}
+
 bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
 {
     /* Suppress goto_tb if requested. */
@@ -34,6 +112,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
                      const TranslatorOps *ops, DisasContextBase *db)
 {
     uint32_t cflags = tb_cflags(tb);
+    TCGOp *icount_start_insn;
     bool plugin_enabled;
 
     /* Initialize DisasContext */
@@ -55,7 +134,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
     /* Start translating.  */
-    gen_tb_start(db->tb);
+    icount_start_insn = gen_tb_start(cflags);
     ops->tb_start(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
@@ -112,7 +191,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
 
     /* Emit code to exit the TB, as indicated by db->is_jmp.  */
     ops->tb_stop(db, cpu);
-    gen_tb_end(db->tb, db->num_insns);
+    gen_tb_end(tb, cflags, icount_start_insn, db->num_insns);
 
     if (plugin_enabled) {
         plugin_gen_tb_end(cpu);
-- 
2.34.1


