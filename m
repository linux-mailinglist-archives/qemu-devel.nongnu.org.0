Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D419561E694
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 22:30:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ornCm-0005PK-MI; Sun, 06 Nov 2022 16:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ornCh-0005Or-Hh
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:29:20 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ornCf-0004HV-W2
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:29:19 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso12770700pjg.5
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 13:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ThIdcirnoAwmtpHe6z2EOBTDBtvtEBFVSHhE8OUgyu8=;
 b=l4++2rv8XoZogRWLSfdBHoELULz8zS57aTyDAQLFrKz1Mk5EC958E5eAg8KT21TVJ1
 ry4u06edvo2PgYxHMMXZd17u2n/VEtd8/LtiNAKtzH5FmnJpOHaJvovq3lDY/qchshkN
 F9VpibntI3GGD8/OuhW0aGnvEVf5Z4m9F2MbBB3IwA8GkHTSId02TuZu+lrfx7B7rslk
 G/T0T94zVcK8IbnycYI7w/V/lS+RqtQp2tvV0OqcTmCY5x7bHQ8wtAL2FwZPqf2SaOwB
 9txbClTDBR/Dlo765Bvrnh9bnietMr+/M3kuLbxCy72Yu94vpdjEGs48DVh8vmh67mXR
 ECnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ThIdcirnoAwmtpHe6z2EOBTDBtvtEBFVSHhE8OUgyu8=;
 b=SoNQK/1m7ZK/gx+ulVYLEyRB0zAjGTyZ4/tkT02aWN7iS2kk/T/59BR+PjIGa8+SF5
 +cAWynDpgMa4XWDrmS90Gpm+i0k4nGnvjgJGE2Z4ktH1z+9ADMOO4AlzOWSf3y+99hf0
 I7mXv4wTCKMNfqWDFAcAie65SRZnpt8Yc8UBU8efmSPomtp+jN22SJqfeZ/EfO2vrKPC
 UN22gIsqhz+Dziqv16qXFXF7nYw6YUq96wAY0usIkcoWCdQp1xyC5Ak5EC/zwdA1Ovln
 N3Vq7+TEyUOSSCceOwNlfpPNfq5xgnWSfCgPZO5o06A1zBYkIQwRZs0uILO+Ohk8XwMr
 10DQ==
X-Gm-Message-State: ACrzQf2gno8mPOkAQtWOgZa85bxCeLMf7NciU5tmPDvqWln8uwOS7PCm
 En0Q8ObMKb8ieCDliS+22GBWszXzl6KuOvMN
X-Google-Smtp-Source: AMsMyM5uxR4hxGhIZQtztaif2mmAN2f7rDDFiuDueMjZi39RrbiWhSJV2EuZOjpw0OJ5WYN6XOaegQ==
X-Received: by 2002:a17:90a:b00d:b0:212:f91d:88c7 with SMTP id
 x13-20020a17090ab00d00b00212f91d88c7mr48346462pjq.112.1667770156725; 
 Sun, 06 Nov 2022 13:29:16 -0800 (PST)
Received: from localhost.localdomain ([2001:8003:d918:7a00:f28:fa55:3b51:3624])
 by smtp.gmail.com with ESMTPSA id
 20-20020a621914000000b00563ce1905f4sm2998746pfz.5.2022.11.06.13.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 13:29:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu,
	philmd@linaro.org,
	sw@weilnetz.de
Subject: [PATCH v2 6/6] accel/tcg: Split out setjmp_gen_code
Date: Mon,  7 Nov 2022 08:28:52 +1100
Message-Id: <20221106212852.152384-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106212852.152384-1-richard.henderson@linaro.org>
References: <20221106212852.152384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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


