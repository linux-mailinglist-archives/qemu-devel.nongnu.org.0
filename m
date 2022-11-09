Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FF5622457
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 08:03:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osf72-0006iN-BN; Wed, 09 Nov 2022 02:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osf6c-0006fa-Tu
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:02:40 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osf6b-0002QR-8h
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:02:38 -0500
Received: by mail-pg1-x536.google.com with SMTP id 136so11587465pga.1
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ThIdcirnoAwmtpHe6z2EOBTDBtvtEBFVSHhE8OUgyu8=;
 b=Ow0xfLJfL90/9TbbZPCMtPERZ8oFIdNJVjK96Y60n2Fgbr8Z06YMjdPWEvTEngFlHx
 HeD7aUdQYYo3L2SS2GkQAAf1CjRo6uwW8Jmbso0Tbiy/TyfZr+q6VPIj31yal57spYpj
 I9CohZcKZKCqFLLMOXLKP7oi65pYD0UwTDBZ+iVxg8XKXFXmNQo95KB34P7uy7yZVVjq
 ghE/HVT6cYDMi7eajJJxJkNlsD2q90EXC9JhaBNfr8bd05JFWVekvp/EjtVuvJtOHRJ/
 cOVDXhDlqkxoVXA7Fhd5p03zpVWG2RUxdfJoVt8phXwzaqzabz/6szziLrxmqlAj/yrj
 tJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ThIdcirnoAwmtpHe6z2EOBTDBtvtEBFVSHhE8OUgyu8=;
 b=LltTD2KnBJ3HvP7EodfbFSvM9sM1+NDJG2grRmTlLBbdR6dvtqU3gKWLS0UX7gWynX
 54NBxbs37iM+nKVFrySEU3np79k3oJQ4mNUiQ5NAElkhC+iRo6gcI3/LWrklL5JFu18D
 YapVxjEL1mtMaDUmIVIG6PaixE4vQn0xcgNqVnvRMQ4PXbfJcJ2oxma3wux5yivCjj9i
 LL5qpd5J6rWUV/aIzaj+UBHUwVKaSLHuHDRSmauLkzsmO405z3l+HSvVVAQN/bqflBU3
 /vaX71rPzfGljSZCSq0dJvzKepejLPYyQzBiqxF5E/TWy918h4wHSgKai/47HwRy9dJK
 z5dQ==
X-Gm-Message-State: ACrzQf0Xs53MJD3PV93LIhg2tVcLR0vhYbPrmXlkUmjJf+9MpR0EX8vm
 Yd0PbsbbToijbvcqXrNisls6ccZKqlMQ6IlgBB0=
X-Google-Smtp-Source: AMsMyM72Rb58SD8/qwPCetl3wA1A6XxEft6fzT1W6T4omSKCSDRDpriOsT4Dlalg12K2kAHIZYazyw==
X-Received: by 2002:a05:6a00:14cf:b0:56d:88a8:32cf with SMTP id
 w15-20020a056a0014cf00b0056d88a832cfmr47989904pfu.27.1667977355887; 
 Tue, 08 Nov 2022 23:02:35 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-855d-0172-a1c2-6464.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:855d:172:a1c2:6464])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0017bb38e4588sm8158784plk.135.2022.11.08.23.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 23:02:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 2/2] accel/tcg: Split out setjmp_gen_code
Date: Wed,  9 Nov 2022 18:02:24 +1100
Message-Id: <20221109070224.13073-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109070224.13073-1-richard.henderson@linaro.org>
References: <20221109070224.13073-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Isolate the code protected by setjmp.  Fixes:

translate-all.c: In function ‘tb_gen_code’:
translate-all.c:748:51: error: argument ‘cflags’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 58 ++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 9ee21f7f52..ac3ee3740c 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -742,6 +742,37 @@ void page_collection_unlock(struct page_collection *set)
 
 #endif /* !CONFIG_USER_ONLY */
 
+/*
+ * Isolate the portion of code gen which can setjmp/longjmp.
+ * Return the size of the generated code, or negative on error.
+ */
+static int setjmp_gen_code(CPUArchState *env, TranslationBlock *tb,
+                           target_ulong pc, void *host_pc,
+                           int *max_insns, int64_t *ti)
+{
+    int ret = sigsetjmp(tcg_ctx->jmp_trans, 0);
+    if (unlikely(ret != 0)) {
+        return ret;
+    }
+
+    tcg_func_start(tcg_ctx);
+
+    tcg_ctx->cpu = env_cpu(env);
+    gen_intermediate_code(env_cpu(env), tb, *max_insns, pc, host_pc);
+    assert(tb->size != 0);
+    tcg_ctx->cpu = NULL;
+    *max_insns = tb->icount;
+
+#ifdef CONFIG_PROFILER
+    qatomic_set(&tcg_ctx->prof.tb_count, tcg_ctx->prof.tb_count + 1);
+    qatomic_set(&tcg_ctx->prof.interm_time,
+                tcg_ctx->prof.interm_time + profile_getclock() - *ti);
+    *ti = profile_getclock();
+#endif
+
+    return tcg_gen_code(tcg_ctx, tb, pc);
+}
+
 /* Called with mmap_lock held for user mode emulation.  */
 TranslationBlock *tb_gen_code(CPUState *cpu,
                               target_ulong pc, target_ulong cs_base,
@@ -754,8 +785,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     int gen_code_size, search_size, max_insns;
 #ifdef CONFIG_PROFILER
     TCGProfile *prof = &tcg_ctx->prof;
-    int64_t ti;
 #endif
+    int64_t ti;
     void *host_pc;
 
     assert_memory_lock();
@@ -805,33 +836,10 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     ti = profile_getclock();
 #endif
 
-    gen_code_size = sigsetjmp(tcg_ctx->jmp_trans, 0);
-    if (unlikely(gen_code_size != 0)) {
-        goto error_return;
-    }
-
-    tcg_func_start(tcg_ctx);
-
-    tcg_ctx->cpu = env_cpu(env);
-    gen_intermediate_code(cpu, tb, max_insns, pc, host_pc);
-    assert(tb->size != 0);
-    tcg_ctx->cpu = NULL;
-    max_insns = tb->icount;
-
     trace_translate_block(tb, pc, tb->tc.ptr);
 
-    /* generate machine code */
-
-#ifdef CONFIG_PROFILER
-    qatomic_set(&prof->tb_count, prof->tb_count + 1);
-    qatomic_set(&prof->interm_time,
-                prof->interm_time + profile_getclock() - ti);
-    ti = profile_getclock();
-#endif
-
-    gen_code_size = tcg_gen_code(tcg_ctx, tb, pc);
+    gen_code_size = setjmp_gen_code(env, tb, pc, host_pc, &max_insns, &ti);
     if (unlikely(gen_code_size < 0)) {
- error_return:
         switch (gen_code_size) {
         case -1:
             /*
-- 
2.34.1


