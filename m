Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C09561DFFE
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 03:39:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orVY0-0000VU-Fb; Sat, 05 Nov 2022 22:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orVXw-0000TA-Ow
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 22:38:04 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orVXu-0003Kf-M8
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 22:38:04 -0400
Received: by mail-pl1-x636.google.com with SMTP id l2so8198188pld.13
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 19:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j7WXfOWK53ahgYMgHy1i+j/q7xrqgYKDWQCtOds9hEc=;
 b=wsaGAT4T6SmnR4faXM1n3hLPx9BoU3RInTpVobHXXwy/Ad07Sp4VlNrQkkiyDt+SXn
 F2nyw3vZT8mKcN9F0n2gw2b/nU+qHbm8ULVZ5sm56RwCTDHk8d25vvmvjd174WrM+xA3
 9p1vEqK0vPJIaMo4xCvVf232F3bZ4AXSOAVLekb3eiUaDdzRzzR88/rivpM29pT+t8yM
 dpAPYQRzgSPdVfI7ue35uqc3PgZlG7SFSSdVSzVouEBlUctlu86kgjiSyuFhniCy5KC6
 r5B+h3Ljz8dOjTFRaGhQN7AIbotcTcwkVYvuWIn1watPLDu+GYq+H7lq0GQ951rYxhjM
 0zKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j7WXfOWK53ahgYMgHy1i+j/q7xrqgYKDWQCtOds9hEc=;
 b=bl209WG9BhLJusiZNLk1GkaWp2sgP4O2tg+I8QeqjpNnub9h/Ctqv1R1UCWzDXD/xk
 zWWiqU+LjMMDCPS87tNoHyZIh8FgC3Gc2ojCr+7c2+Oj78f3Wr8dIKSNZAqo9Z0aw+6v
 gMXmZT0GBEwRftUiMDKm5us5S6VGSXCm0RoBDqBV9OjyvAVO4cGzXPJeJHvVjznGGTID
 40iasiSrOXEaeYetu1ksbY4JnV7V1Zyp6m7d2snFwRunev2Mi6JWEjH1KbardDuaWJwF
 xRDlP3MVyYvFtbJaFfS5GnamlqGGF3e4GG6Sn4+bAg/hns+Ji4RhiqsFfB5vHQC7/Ex3
 Q6rQ==
X-Gm-Message-State: ACrzQf39mZYOymzL/xKuPfBn8Za+IKZNSnTRYF7yg/QWjT+3fpFLpKI2
 obNgphs2ss6S0jMn5pl8lRF+T32KcHpQgA2N
X-Google-Smtp-Source: AMsMyM7/r/g5enyVcDZY5d/AEOeGgy8GT7pQ56CHZpUM+F5fAyy1tBuBfMOa9SDauO5OlK618Cg3PQ==
X-Received: by 2002:a17:902:e846:b0:187:2127:cbb with SMTP id
 t6-20020a170902e84600b0018721270cbbmr35070168plg.125.1667702280878; 
 Sat, 05 Nov 2022 19:38:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:d918:7a00:e617:679e:af7:63d])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a170902d19500b0018862bb3976sm2259457plb.308.2022.11.05.19.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 19:37:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	sw@weilnetz.de
Subject: [RESEND PATCH 6/6] accel/tcg: Split out setjmp_gen_code
Date: Sun,  6 Nov 2022 13:37:35 +1100
Message-Id: <20221106023735.5277-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106023735.5277-1-richard.henderson@linaro.org>
References: <20221106023735.5277-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Isolate the code protected by setjmp.  Fixes:

translate-all.c: In function ‘tb_gen_code’:
translate-all.c:748:51: error: argument ‘cflags’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]

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


