Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231373C5F9D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:44:26 +0200 (CEST)
Received: from localhost ([::1]:43890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2y6b-0003Vc-5y
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2h-0003zi-8W
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:24 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:47074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2S-0000tp-A1
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:17 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso220285pjp.5
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=88OJpuFNwx0H+XAN0LuxIptp2x4kYtdoZWDr35UNZ2k=;
 b=lvk1IQDOdSMPL6l7UIBaByeoAUBPTtUo4ThWHeBmRRdQJvZZBz83XTSGLlz5cyo+R0
 4K4MUak9H7jyoT3aU52yIvzx39WLZMclT0B6qyhd57i3IqlfmtsCw0c6tpg8gZSOR95k
 PREypxBKLm82uJekk32hIVeHj38vx7mv9WbnP6d4v/HsEmZLEfMFBEosZUC8forekUde
 Q47ViV9ySmPT1vmN7KD02aeGwzOsl6/Q/wv+J89DTufz4tXbKbDdmiCpI72+24H17kec
 AVmxr7gUiHXVuoO+WD9iV8hQcfRLr5MVC92UUKo5pGxwvosFR5cd3CHa4SQbB7FC/a4M
 xBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=88OJpuFNwx0H+XAN0LuxIptp2x4kYtdoZWDr35UNZ2k=;
 b=oxRAQe1SxQXizUMqwoNtxRNwPn+kx2Ek6L47+Q5b4cXK9R3OelyYoFUKVb1Vy+flyU
 15d7dLW6pA+SNFIjVZbrrEuZHL87Uskqe5VtGtOZymaJJ7IMRH51GZUBcksG6FgyiC8w
 uwc5L6iRzU3mVHnQKlUg2kHa2EXh1a+gtJLev39imntk+aQwASY1B1uv6s40RpceJ9GL
 3TQECVh2qjXMWWVqLLghQwizsJdHmuy/nnLFSdUBggdOHSYk/7laJ+OePgf1v6qTEbzG
 +YWAK/4W3qNms19wTmJOmyjeM6LcO/+UwF23lNrgw1zomXyHGbD5bU/YGFaHzy3wzrmr
 ZAvw==
X-Gm-Message-State: AOAM532mf0HX5Ikp0D+MbMBS8nuylmhcVSKuHplV8OeSMKwSpc+Ab7It
 SfHgo1Q/PBImuOP1l6dkbp5g1BIzpZHIsA==
X-Google-Smtp-Source: ABdhPJzl+U9bDGn7MctGw+elxAEmwihmYNzMAowAtognyKGt3zc5/vGG/mFCYzz05NdTdKe/enPJAg==
X-Received: by 2002:a17:90a:5e06:: with SMTP id
 w6mr52464526pjf.98.1626104406753; 
 Mon, 12 Jul 2021 08:40:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b33sm18247635pgb.92.2021.07.12.08.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:40:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/10] accel/tcg: Add CF_NO_GOTO_TB and CF_NO_GOTO_PTR
Date: Mon, 12 Jul 2021 08:39:57 -0700
Message-Id: <20210712154004.1410832-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712154004.1410832-1-richard.henderson@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the -d nochain check to bits on tb->cflags.
These will be used for more than -d nochain shortly.

Set bits during curr_cflags, test them in translator_use_goto_tb,
assert we're not doing anything odd in tcg_gen_goto_tb.  The test
in tcg_gen_exit_tb is redundant with the assert for goto_tb_issue_mask.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 16 +++++++++-------
 accel/tcg/cpu-exec.c    |  8 +++++++-
 accel/tcg/translator.c  |  5 +++++
 tcg/tcg-op.c            | 28 ++++++++++++----------------
 4 files changed, 33 insertions(+), 24 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index ae7603ca75..6873cce8df 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -494,13 +494,15 @@ struct TranslationBlock {
     uint32_t cflags;    /* compile flags */
 
 /* Note that TCG_MAX_INSNS is 512; we validate this match elsewhere. */
-#define CF_COUNT_MASK  0x000001ff
-#define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
-#define CF_MEMI_ONLY   0x00010000 /* Only instrument memory ops */
-#define CF_USE_ICOUNT  0x00020000
-#define CF_INVALID     0x00040000 /* TB is stale. Set with @jmp_lock held */
-#define CF_PARALLEL    0x00080000 /* Generate code for a parallel context */
-#define CF_CLUSTER_MASK 0xff000000 /* Top 8 bits are cluster ID */
+#define CF_COUNT_MASK    0x000001ff
+#define CF_NO_GOTO_TB    0x00000200 /* Do not chain with goto_tb */
+#define CF_NO_GOTO_PTR   0x00000400 /* Do not chain with goto_ptr */
+#define CF_LAST_IO       0x00008000 /* Last insn may be an IO access.  */
+#define CF_MEMI_ONLY     0x00010000 /* Only instrument memory ops */
+#define CF_USE_ICOUNT    0x00020000
+#define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
+#define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
+#define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
 #define CF_CLUSTER_SHIFT 24
 
     /* Per-vCPU dynamic tracing state used to generate this TB */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index ef4214d893..d3232d5764 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -147,7 +147,13 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 
 uint32_t curr_cflags(CPUState *cpu)
 {
-    return cpu->tcg_cflags;
+    uint32_t cflags = cpu->tcg_cflags;
+
+    if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
+        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR;
+    }
+
+    return cflags;
 }
 
 /* Might cause an exception, so have a longjmp destination ready */
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 59804af37b..2ea5a74f30 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -33,6 +33,11 @@ void translator_loop_temp_check(DisasContextBase *db)
 
 bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
 {
+    /* Suppress goto_tb if requested. */
+    if (tb_cflags(db->tb) & CF_NO_GOTO_TB) {
+        return false;
+    }
+
     /* Suppress goto_tb in the case of single-steping.  */
     if (db->singlestep_enabled || singlestep) {
         return false;
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 0c561fb253..e0d54d537f 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2723,10 +2723,6 @@ void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
            seen this numbered exit before, via tcg_gen_goto_tb.  */
         tcg_debug_assert(tcg_ctx->goto_tb_issue_mask & (1 << idx));
 #endif
-        /* When not chaining, exit without indicating a link.  */
-        if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
-            val = 0;
-        }
     } else {
         /* This is an exit via the exitreq label.  */
         tcg_debug_assert(idx == TB_EXIT_REQUESTED);
@@ -2738,6 +2734,8 @@ void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
 
 void tcg_gen_goto_tb(unsigned idx)
 {
+    /* We tested CF_NO_GOTO_TB in translator_use_goto_tb. */
+    tcg_debug_assert(!(tcg_ctx->tb_cflags & CF_NO_GOTO_TB));
     /* We only support two chained exits.  */
     tcg_debug_assert(idx <= TB_EXIT_IDXMAX);
 #ifdef CONFIG_DEBUG_TCG
@@ -2746,25 +2744,23 @@ void tcg_gen_goto_tb(unsigned idx)
     tcg_ctx->goto_tb_issue_mask |= 1 << idx;
 #endif
     plugin_gen_disable_mem_helpers();
-    /* When not chaining, we simply fall through to the "fallback" exit.  */
-    if (!qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
-        tcg_gen_op1i(INDEX_op_goto_tb, idx);
-    }
+    tcg_gen_op1i(INDEX_op_goto_tb, idx);
 }
 
 void tcg_gen_lookup_and_goto_ptr(void)
 {
-    if (!qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
-        TCGv_ptr ptr;
+    TCGv_ptr ptr;
 
-        plugin_gen_disable_mem_helpers();
-        ptr = tcg_temp_new_ptr();
-        gen_helper_lookup_tb_ptr(ptr, cpu_env);
-        tcg_gen_op1i(INDEX_op_goto_ptr, tcgv_ptr_arg(ptr));
-        tcg_temp_free_ptr(ptr);
-    } else {
+    if (tcg_ctx->tb_cflags & CF_NO_GOTO_PTR) {
         tcg_gen_exit_tb(NULL, 0);
+        return;
     }
+
+    plugin_gen_disable_mem_helpers();
+    ptr = tcg_temp_new_ptr();
+    gen_helper_lookup_tb_ptr(ptr, cpu_env);
+    tcg_gen_op1i(INDEX_op_goto_ptr, tcgv_ptr_arg(ptr));
+    tcg_temp_free_ptr(ptr);
 }
 
 static inline MemOp tcg_canonicalize_memop(MemOp op, bool is64, bool st)
-- 
2.25.1


