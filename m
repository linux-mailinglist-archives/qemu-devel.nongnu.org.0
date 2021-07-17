Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85CA3CC69B
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:21:30 +0200 (CEST)
Received: from localhost ([::1]:36840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4sgb-0001Yo-Ov
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seC-0006so-7f
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:00 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:38409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4se8-0001zK-Ke
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:18:59 -0400
Received: by mail-pf1-x431.google.com with SMTP id i14so599785pfd.5
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yb2TZBaGmBIU6jClQSI4WWkNZXKcd24AJZ/6Z/OuA78=;
 b=Gji1BlHqzmLr0HYhVV9QBysmorVbbjBt6AxnYg4/BNGT+faAJlRRglirSWIroaRSky
 cPd+2/bqeW0ujzXOuGCcMQu/GZISih/FU4MN+xWMTpDjHo4m4423FUU3VQuFlTWafwoQ
 qbtL6UrU9U+VTzEhb68GFGqY9KhDReFxyBYrQctW5pcpI6eitgSHg2LJbon0mAmVY7XN
 iqXVFmbtPjIVjWA88izuuhSNNx9HbNx2qFqFLr0IdGV+5Rx/ziuPmzaQxleC/HuBqRJv
 gn/U6cIzV0nMLdrv9BWZD4gcaJWCrEq2JatcFsbK1xgB4BI4fR12fMQKrUZDY9o0Xqy6
 SgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yb2TZBaGmBIU6jClQSI4WWkNZXKcd24AJZ/6Z/OuA78=;
 b=ULFSvWj/4JBC2LkGrBgagzooHR/v8wKvuQ6YqupI1khS8QvMyeouzYC6T8rEtgjlF5
 kBwIYP+OdKmM2WeLrlNlcOZ43FRTvmbsJtIsgOi6bOgWXntmy7bPi1Vnx55lMIhHQpUw
 9nuE6vRk1WgCOReKQSvpTsN6Ag2T0Tih/ijgxkNFaAV75OaH12cPU0fM1sPTVh8rGLrj
 1KMk8HOwIIqN8ZaXzw5NDMzLetKhBGKBPGnfYI3XytQv7ZYxVw3iZfBuAY96F3yxMtaL
 pPI5AuHvSz6Dsh2FykwhjRw/bqgnEywYICXrwQx1VSkhgyMPoStFShDjB0WlUJP0lkYq
 T5Zg==
X-Gm-Message-State: AOAM531XZ5K60XPCCcAdqcDpJSUO56IDa68Yh0n8w9VAkKTLd+Xw1W75
 4BLTKROz5cya+6s1Iz9Tf8SvI5u6XnXTnw==
X-Google-Smtp-Source: ABdhPJzR4uvlGCNOdqUXA2wu5/jISe7aN6H5UDVUxHi4Zggqcm1WN9dpEIRyvhUUQz/18wREHZQYWw==
X-Received: by 2002:a63:5802:: with SMTP id m2mr16907935pgb.171.1626560334699; 
 Sat, 17 Jul 2021 15:18:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n14sm2405091pjv.34.2021.07.17.15.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 15:18:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/13] accel/tcg: Add CF_NO_GOTO_TB and CF_NO_GOTO_PTR
Date: Sat, 17 Jul 2021 15:18:41 -0700
Message-Id: <20210717221851.2124573-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717221851.2124573-1-richard.henderson@linaro.org>
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the -d nochain check to bits on tb->cflags.
These will be used for more than -d nochain shortly.

Set bits during curr_cflags, test them in translator_use_goto_tb,
assert we're not doing anything odd in tcg_gen_goto_tb.  The test
in tcg_gen_exit_tb is redundant with the assert for goto_tb_issue_mask.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


