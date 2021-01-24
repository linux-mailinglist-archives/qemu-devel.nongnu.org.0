Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CCA301E12
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 19:13:15 +0100 (CET)
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3jsw-0005Te-9E
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 13:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3jrH-0003xW-Mv
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 13:11:31 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3jrE-0003V7-Tn
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 13:11:31 -0500
Received: by mail-pf1-x42f.google.com with SMTP id y205so7080126pfc.5
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 10:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dMC8pDMFrpkWp3tIhJXkAEfl2zqGr88OycytaS5rwLg=;
 b=hH/KXPxdKSgAD/tYpJeXA0UWa8OV7d1F4bepKLOCftPs/c7QITLMeHDx7dLQIOtN14
 2mraEeb6tdM/RaSFm68AwSBxzJrR+a1H++2V8wxHq0zXQ6dMrtoiDlsq/MIo6Ebe3uBN
 uCL077i6+h8qoEfFiboAZsOwwlx8nCX9yqhvg7jIgLtW31vJ/yzAAERWQL8DIKbvzipq
 4EFiVv+6GM7i+sn0gVJKoWq7QJ/fiJC4HQ7hYe1eRyR/GSoknCliMQ09/8LPzMKXNf3+
 EoDW/YSzWV8aBRbG3pXWrD0TMOx+aqERUAgoC8Eve6ULG/oAQ4fAx9KW5v4/K1A5RyG+
 y99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dMC8pDMFrpkWp3tIhJXkAEfl2zqGr88OycytaS5rwLg=;
 b=kxkz2e6JQlX/zOBghd1H7PcBObhff+qNPaSlT9p0MJ8mM9aBcZOm1gM4at/9pmRG9E
 5z6KFHZsaDB7BFyYAta7PJCHXs4t0N2f6XHS+rXo1PsRxyTGlb3xfI7zIj+kQXub6ne5
 IakRxKrtUn/9VgEe6p+k8lG64R/IC+LPjvL5V1hcTCVvALjGurTS48CZTnvr34Yyj9OE
 iaMZrwHknJj7+MPzdmj+95NRkhHv2fWQZ9UumjObKwuqXthDli8UdKJRc+9A8lqb7h9y
 RnczljrQgu7ALqgGU2oN6ZJpns5q/3LNP3j1DoAm/iPP0dTX64MUynFo7hD+XdRpmBjB
 /p4g==
X-Gm-Message-State: AOAM532EexnXlNCmxjfgWJf4we7BbIbv7rP89kkz2oESoEhUhM+zmatn
 XpFaA4mbhlvuGsWysOFZfuX9kghBUkYvpw==
X-Google-Smtp-Source: ABdhPJzjreRsIhfw326phnEjsZEXOji/c1tNZY6WAZuoy1c+03C/hTEw85tLUv/s5mmpLJxwwdhRug==
X-Received: by 2002:a65:6450:: with SMTP id s16mr1246781pgv.71.1611511887571; 
 Sun, 24 Jan 2021 10:11:27 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id 123sm14547629pgf.38.2021.01.24.10.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 10:11:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/10] tcg: Restart code generation when we run out of temps
Date: Sun, 24 Jan 2021 08:11:22 -1000
Message-Id: <20210124181122.5447-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210124181122.5447-1-richard.henderson@linaro.org>
References: <20210124181122.5447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some large translation blocks can generate so many unique
constants that we run out of temps to hold them.  In this
case, longjmp back to the start of code generation and
restart with a smaller translation block.

Buglink: https://bugs.launchpad.net/bugs/1912065
Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         |  3 +++
 accel/tcg/translate-all.c | 15 ++++++++++++++-
 tcg/tcg.c                 | 11 ++++++++---
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index c5a9d65d5f..0f0695e90d 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -680,6 +680,9 @@ struct TCGContext {
 
     uint16_t gen_insn_end_off[TCG_MAX_INSNS];
     target_ulong gen_insn_data[TCG_MAX_INSNS][TARGET_INSN_START_WORDS];
+
+    /* Exit to translator on overflow. */
+    sigjmp_buf jmp_trans;
 };
 
 static inline bool temp_readonly(TCGTemp *ts)
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index d09c187e0f..81d4c83f22 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1926,11 +1926,17 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     ti = profile_getclock();
 #endif
 
+    gen_code_size = sigsetjmp(tcg_ctx->jmp_trans, 0);
+    if (unlikely(gen_code_size != 0)) {
+        goto error_return;
+    }
+
     tcg_func_start(tcg_ctx);
 
     tcg_ctx->cpu = env_cpu(env);
     gen_intermediate_code(cpu, tb, max_insns);
     tcg_ctx->cpu = NULL;
+    max_insns = tb->icount;
 
     trace_translate_block(tb, tb->pc, tb->tc.ptr);
 
@@ -1955,6 +1961,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
     gen_code_size = tcg_gen_code(tcg_ctx, tb);
     if (unlikely(gen_code_size < 0)) {
+ error_return:
         switch (gen_code_size) {
         case -1:
             /*
@@ -1966,6 +1973,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
              * flush the TBs, allocate a new TB, re-initialize it per
              * above, and re-do the actual code generation.
              */
+            qemu_log_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OPT,
+                          "Restarting code generation for "
+                          "code_gen_buffer overflow\n");
             goto buffer_overflow;
 
         case -2:
@@ -1978,9 +1988,12 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
              * Try again with half as many insns as we attempted this time.
              * If a single insn overflows, there's a bug somewhere...
              */
-            max_insns = tb->icount;
             assert(max_insns > 1);
             max_insns /= 2;
+            qemu_log_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OPT,
+                          "Restarting code generation with "
+                          "smaller translation block (max %d insns)\n",
+                          max_insns);
             goto tb_overflow;
 
         default:
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 67b08f708d..9e1b0d73c7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1205,18 +1205,23 @@ void tcg_func_start(TCGContext *s)
     QSIMPLEQ_INIT(&s->labels);
 }
 
-static inline TCGTemp *tcg_temp_alloc(TCGContext *s)
+static TCGTemp *tcg_temp_alloc(TCGContext *s)
 {
     int n = s->nb_temps++;
-    tcg_debug_assert(n < TCG_MAX_TEMPS);
+
+    if (n >= TCG_MAX_TEMPS) {
+        /* Signal overflow, starting over with fewer guest insns. */
+        siglongjmp(s->jmp_trans, -2);
+    }
     return memset(&s->temps[n], 0, sizeof(TCGTemp));
 }
 
-static inline TCGTemp *tcg_global_alloc(TCGContext *s)
+static TCGTemp *tcg_global_alloc(TCGContext *s)
 {
     TCGTemp *ts;
 
     tcg_debug_assert(s->nb_globals == s->nb_temps);
+    tcg_debug_assert(s->nb_globals < TCG_MAX_TEMPS);
     s->nb_globals++;
     ts = tcg_temp_alloc(s);
     ts->kind = TEMP_GLOBAL;
-- 
2.25.1


