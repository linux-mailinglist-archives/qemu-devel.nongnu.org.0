Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF5B3D17E8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:24:22 +0200 (CEST)
Received: from localhost ([::1]:58514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IlS-0005Uz-11
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOU-00032K-VJ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:38 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOS-00064W-PR
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:38 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so511643pjm.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zLV+SXNQp2xsmnQvSIHnLL5fnwmzEtBufgQQMvoXHhI=;
 b=MKR0GHW3cCfINzRj//sWpgHum4HwVXclWQJmeP10RFM0vTbyTDsWTqui44YMIToM61
 ZOp+z1yiGGVzXp4tLNv3cBUhNGYBjTvT7CkI5cp/+g55/JTpXS4EFXCoEIkeSImQskmw
 qI7FTzk6VGK26B64kDmqNzvXPPa00cUXMdmyW0dEo9YBBtWss+DM8LMrQob2VMw6n/v/
 ajKSOO5wNo4wdjpjwQg0H02qL7l5ThTApSeuFLbJeQ1uX9iWOZ4netKTqB/IR84xp1xw
 AHAkEiaL3rKXJPQCE8GkaxZUcUGN3vbXdgNJoZr91/XXUrESqpb8sVBq/ujXjlxVr+sx
 cbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zLV+SXNQp2xsmnQvSIHnLL5fnwmzEtBufgQQMvoXHhI=;
 b=Ok1qWb7CB5BYI3ZsCo37yo6TSYc3rdGc6RBSz6McIjeDrKXBLlXdINByccqfRekwhS
 ZofmCi47dCEzQz2k3VABzVXB7WIsQEA3Y7PDWpKPl41fpElhgQKil0IRvCD2NxlcR2u5
 A1tf6Rj/UjcJO7FiJhRBBMLXxsJYf8dMj4bat7rh1MGgukWt655l7Dyu+DZaCOTO8X4p
 Goe0XFRswHLp1HjrPvxPTt/R1uKTZCOyL0iF2JE6wwunZO8sU7Pjnzluxcm7txjSzPjG
 CsJepL5HJ0f30F2mQ5GXlB4hsK7OkHASAIgyNVxwqf9MNe24by28Gsd98/ltReAwudKo
 OL/Q==
X-Gm-Message-State: AOAM5334ZnMvYzEQQ1Nm7ULzYlqVp6JS6lcR4E/xU2tMCI4sE35C6T2C
 Rzk2p426DzJ3rslQt0FbTk/KMSDY3d3Peg==
X-Google-Smtp-Source: ABdhPJxUu8wpe6VSQwPQMdt7/LqO2o0XwyzgKEUFIMSAxu5zhYr/q99y9BBiiSnuUw9B6QrYVJZw0g==
X-Received: by 2002:a63:cf0a:: with SMTP id j10mr2819695pgg.4.1626897633994;
 Wed, 21 Jul 2021 13:00:33 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/27] accel/tcg: Record singlestep_enabled in tb->cflags
Date: Wed, 21 Jul 2021 09:59:54 -1000
Message-Id: <20210721195954.879535-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set CF_SINGLE_STEP when single-stepping is enabled.
This avoids the need to flush all tb's when turning
single-stepping on or off.

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


