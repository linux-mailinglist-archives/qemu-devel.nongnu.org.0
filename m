Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9E33D0291
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:14:04 +0200 (CEST)
Received: from localhost ([::1]:34930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5w7v-0005YC-Fk
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpc-0007Wb-Kr
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:55:08 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpa-0008Ck-P9
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:55:08 -0400
Received: by mail-pl1-x632.google.com with SMTP id c15so11944877pls.13
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wpCm80kgLZbyypXRy+NSC5PGXOWFkDjMVeqOCfwZ1jY=;
 b=PDLSAOq6BrH4dwJDPkmiZUDimJ3aCYprwGmV5fNoxjHgGw+C5NYwlpDTQJCC9h1u5X
 q05jtFa+Ar8iubci3Nt4WPJ5J/TnmMqpUiKXXhlJP7YODPx8/syL/+dFyox282l9geVV
 wTKOvzSxpmctmFsT/VbN3KKL6OuTE0TBLG8Wg3X1hH8xKFNI5VoJbbhoT3qltiaWHEL6
 zCNPuoHgEMNZH7ykbW31xip6iKLAcBi6eVkjTLJk+JnTwF4aw7+FfS0MobLuYxG2++it
 h4fUZDn7V03dgGX87oVJSuQD+dVHe4l3z/uNqGywYwgsEetS+c4Un1UOTrJQOSuhg2c0
 1EHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wpCm80kgLZbyypXRy+NSC5PGXOWFkDjMVeqOCfwZ1jY=;
 b=aC5hmvv8m5FFgvn8z6qk6d71c79tNlgK74O1kyZoET9uEy1caRyByAch+/nvL+JuIc
 KlBzTZ03WoRqCnZTwofx7AhkWEITahc47MmUwqxYSjb4wKeG5sHIgzhi0N3zVD1VO2QP
 hSDZjiFvHmOM+aaeuU/vZAhZ9cOfYW8+gCHrpWq9+UYKyD1JCswRfVRVUl1O5814m7e7
 x0oWo+66jMkAS7QdjowIisFahRSU5uGO0reiWIZCNftfBb6/xysXcVZ3+alP0D++Qssw
 YnuXlkm8/eAEoCmNzUSA9T5SEzr2TxTCpWCy3BbCMSyCdYe9cr31zQnFwJ3/UeSclQqY
 dBAw==
X-Gm-Message-State: AOAM5319wLNy7TI8zr0YEAK12rdNNutr1cHdmTFitqPBnJBFr0euhjVs
 wsdoR4xmzC+BEhj9+LehrnUNJIOikFFwLg==
X-Google-Smtp-Source: ABdhPJxwMiPkCqxZeThhF5tUCqCXPH2RgbSMDRpWEX3DA+UJdiH9oif1Qh9HmhQ9O3rj8do8q9Xwog==
X-Received: by 2002:a17:90a:b63:: with SMTP id
 90mr31397749pjq.58.1626810905510; 
 Tue, 20 Jul 2021 12:55:05 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:55:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 17/17] accel/tcg: Record singlestep_enabled in
 tb->cflags
Date: Tue, 20 Jul 2021 09:54:39 -1000
Message-Id: <20210720195439.626594-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
index 5cc6363f4c..fc895cf51e 100644
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
index d6ae5ae581..e1799a15bc 100644
--- a/cpu.c
+++ b/cpu.c
@@ -326,10 +326,6 @@ void cpu_single_step(CPUState *cpu, int enabled)
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


