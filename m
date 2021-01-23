Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF113018D1
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 00:03:46 +0100 (CET)
Received: from localhost ([::1]:56894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3RwW-0007nS-Ef
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 18:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Ru5-0007IJ-Ps
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 18:01:15 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:42758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Ru2-000137-HN
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 18:01:13 -0500
Received: by mail-pl1-x630.google.com with SMTP id s15so5355941plr.9
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 15:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pUBQbqe4A30BsRnyAQZWsz9QK33dA/fPH993x2jm/Uc=;
 b=WbYUILHIu2Xv2Ovt87cqlH4GyEEoPXlUu+FQP8ji5ctgRnLePrvBhHENdg/pHKCshr
 cSqJoB+0ijGpCliTq/9tS4IFMnKKxyTLItc3fCepAcOSOLwmLqQs5FsYCVZ1jmTXUbwy
 Zyu1b/xm1LzM9CwuPQGPkHgEt+jKPA8c4EJeVpPjE/WLCa7J04feR/CAQfUjMWeKWDBC
 XQ2hPYyKjwrzC4VLAB8LCn8Tj7+GIFpTt0C3FOFJYPtr2EyZHAn9MLwMXxc3afwfNdOz
 +Za1X04y5+yVCJjXJEacBVOew9PQMC4cNJ/ATA/bDMY7v9blzcR1+7z3fRr3vkwXA5Vl
 kCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pUBQbqe4A30BsRnyAQZWsz9QK33dA/fPH993x2jm/Uc=;
 b=D2trLbVGK6Gn+ozVH/RbOIF3ZWsV/ns746Ap2fbrePzeohVHrfRHRKCAIHhveRiZga
 5sGYi0JU+pZ8tPdXJA5EiTkXWuK8jeFpLJhnN45XLqFOwVlzKS2JqImsFMQNloj9IKAc
 LKez2YIqvca5u9osh6Lkw7MXhktU99FqM17ceXSMHEMr529pdsHbFu6QMDTZWecAPn3j
 XlkYhZp7aBVc84sAL+al5JPe01xJtwGSId5QvdlTYIwSvoZILzTgKzhOLEFyVN26w51k
 yT6O25UbORI9VwesxHxgFHYTxzorw8CK84JEQy9fyYT0AqcVnqOpBqgriZN/K0bp9+zY
 UJGg==
X-Gm-Message-State: AOAM5324Qe+oJv0eNyV2NzGnkFwaDbt0ot6jPW56F541Udbfqz8p1mNx
 6NKWWtVikaoisqyky2MFPfoQv8bBpkScww==
X-Google-Smtp-Source: ABdhPJztDj+Dm8RCUlem3iAnR5lkbfNaWv1QDOYGt8vLP63Gonsgr7IJym+XvJsm3iz0hwEuFcoNFg==
X-Received: by 2002:a17:902:8492:b029:de:17d0:16cf with SMTP id
 c18-20020a1709028492b02900de17d016cfmr12107311plo.74.1611442868784; 
 Sat, 23 Jan 2021 15:01:08 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id l14sm13146588pjy.15.2021.01.23.15.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 15:01:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Restart code generation when we run out of temps
Date: Sat, 23 Jan 2021 13:01:05 -1000
Message-Id: <20210123230105.2076270-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: lvivier@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some large translation blocks can generate so many unique
constants that we run out of temps to hold them.  In this
case, longjmp back to the start of code generation and
restart with a smaller translation block.

Buglink: https://bugs.launchpad.net/bugs/1912065
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

This replaces both the patch to increase the number of temps,
and the buggy patch set that dynamically allocated the temps.


r~

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


