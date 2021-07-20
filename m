Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6B63CF15A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:30:33 +0200 (CEST)
Received: from localhost ([::1]:39636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eae-0000V8-Ea
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOx-0006u5-Vd
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:28 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOw-0003Xm-7A
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:27 -0400
Received: by mail-pg1-x534.google.com with SMTP id 62so21069217pgf.1
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 18:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2FDXCfbsBbtNLEY6fDNcDSK7r82AZnHwFJMSFaWU+Ps=;
 b=AiEk4SKX09e6GQ31+kpuHldhswWPA0n9reD8aBJdvM5IpDpuBwQ3guioynt/NF0gbg
 EfCQHZRaIUv21gUwo+3sVQMfLGyYDLZoRIySruxoSm/4gdFHkLu5P9qZbcgmNq+yPnUK
 fUEUxFJ/4zEqxZduVB4OCirD5YCGeLu1p71haIcpCduIz7AG6Z76x9/6RUl9sq2o7PLB
 1OufsmRq26g5qO5/H3h/PQt/JpcmL46siXSuMbVaGmRws8ic9Au/UWAS6N2e/52C6YCE
 OxX+K7zFX56yIL5kTF2QhU5NsHlPtF+T4gKxdNnZhDo99MZZWnqQ7t5q1vaIDvax5lEI
 nKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2FDXCfbsBbtNLEY6fDNcDSK7r82AZnHwFJMSFaWU+Ps=;
 b=F+giW+UbCE4kYFoKpM6ek4AffdWYaDE0aNXLNSj3l6D7iDuN87b4RZ0PQBXIXoZDOm
 MotkdnDR94SarjpmjA3Q2U5fYBZWBfrzm71EJHYC2O/yEybm6ITfPukdQf7BNjDX9cyQ
 RQaAYBartkmcK33m2x571jVzwG1oiEkU0Ks8axSCTbo+qE7l4eztDivJ6mLkPFZhVOaS
 rl4yNztdgWVWBawJYOr4PLXb5PY8SZQ6BN2kD6e7kmzQe7dv10WfGy4ljPZHeC39YO/t
 wqbc9EBr7ab/SZ3mBXIHs+WDMQ8OQ6iZWnTb/5TSDO+U6/oIkirV+UmvFE0Dvoa2gh1w
 D5GQ==
X-Gm-Message-State: AOAM530ve0YWwAKdpaPceGR3OQNGWQpim/NtrmpMTs4Kv2+5qqYSfVOb
 NMbY5pyQTlza7cnWNeWqEZRvCySMyEFi5A==
X-Google-Smtp-Source: ABdhPJwlmS1Vfs6DyhXkqJ87p5tj5YoNMg+FjlUd8s/YL603nTRPxrfLAM6bDmElgmw5qxPC+qv5yw==
X-Received: by 2002:a65:5186:: with SMTP id h6mr27964717pgq.62.1626743904945; 
 Mon, 19 Jul 2021 18:18:24 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25378054pgi.94.2021.07.19.18.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 18:18:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v5 15/15] accel/tcg: Record singlestep_enabled in
 tb->cflags
Date: Mon, 19 Jul 2021 15:18:00 -1000
Message-Id: <20210720011800.483966-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720011800.483966-1-richard.henderson@linaro.org>
References: <20210720011800.483966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set CF_SINGLE_STEP when single-stepping is enabled.
This avoids the need to flush all tb's when turning
single-stepping on or off.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   | 1 +
 accel/tcg/cpu-exec.c      | 7 ++++++-
 accel/tcg/translate-all.c | 4 ----
 accel/tcg/translator.c    | 7 +------
 cpu.c                     | 4 ----
 5 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6873cce8df..5d1b6d80fb 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -497,6 +497,7 @@ struct TranslationBlock {
 #define CF_COUNT_MASK    0x000001ff
 #define CF_NO_GOTO_TB    0x00000200 /* Do not chain with goto_tb */
 #define CF_NO_GOTO_PTR   0x00000400 /* Do not chain with goto_ptr */
+#define CF_SINGLE_STEP   0x00000800 /* gdbstub single-step in effect */
 #define CF_LAST_IO       0x00008000 /* Last insn may be an IO access.  */
 #define CF_MEMI_ONLY     0x00010000 /* Only instrument memory ops */
 #define CF_USE_ICOUNT    0x00020000
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index f5371e03d4..8b2d41bfa0 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -150,10 +150,15 @@ uint32_t curr_cflags(CPUState *cpu)
     uint32_t cflags = cpu->tcg_cflags;
 
     /*
+     * Record gdb single-step.  We should be exiting the TB by raising
+     * EXCP_DEBUG, but to simplify other tests, disable chaining too.
+     *
      * For singlestep and -d nochain, suppress goto_tb so that
      * we can log -d cpu,exec after every TB.
      */
-    if (singlestep) {
+    if (unlikely(cpu->singlestep_enabled)) {
+        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP | 1;
+    } else if (singlestep) {
         cflags |= CF_NO_GOTO_TB | 1;
     } else if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
         cflags |= CF_NO_GOTO_TB;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bf82c15aab..bbfcfb698c 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1432,10 +1432,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     }
     QEMU_BUILD_BUG_ON(CF_COUNT_MASK + 1 != TCG_MAX_INSNS);
 
-    if (cpu->singlestep_enabled) {
-        max_insns = 1;
-    }
-
  buffer_overflow:
     tb = tcg_tb_alloc(tcg_ctx);
     if (unlikely(!tb)) {
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index b45337f3ba..c53a7f8e44 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -38,11 +38,6 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
         return false;
     }
 
-    /* Suppress goto_tb in the case of single-steping.  */
-    if (db->singlestep_enabled) {
-        return false;
-    }
-
     /* Check for the dest on the same page as the start of the TB.  */
     return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;
 }
@@ -60,7 +55,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     db->is_jmp = DISAS_NEXT;
     db->num_insns = 0;
     db->max_insns = max_insns;
-    db->singlestep_enabled = cpu->singlestep_enabled;
+    db->singlestep_enabled = cflags & CF_SINGLE_STEP;
 
     ops->init_disas_context(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
diff --git a/cpu.c b/cpu.c
index 660b56f431..addcb5db9c 100644
--- a/cpu.c
+++ b/cpu.c
@@ -316,10 +316,6 @@ void cpu_single_step(CPUState *cpu, int enabled)
         cpu->singlestep_enabled = enabled;
         if (kvm_enabled()) {
             kvm_update_guest_debug(cpu, 0);
-        } else {
-            /* must flush all the translated code to avoid inconsistencies */
-            /* XXX: only flush what is necessary */
-            tb_flush(cpu);
         }
         trace_breakpoint_singlestep(cpu->cpu_index, enabled);
     }
-- 
2.25.1


