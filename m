Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840D53CEE29
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:36:28 +0200 (CEST)
Received: from localhost ([::1]:60124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5aw7-00064u-Jc
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5ajD-0004pJ-AP
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:23:07 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5ajB-0000yn-LN
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:23:07 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r21so2343359pgv.13
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qTk6nTCS3DCR8zWFD1IY+CDlAPgvIuL5FWh8To7K36Q=;
 b=C7BiHPvFHaTsv+rK9yWO7HMhf3pmODRQl1fmrKEb2rggjIdXbsGedvdvbjV2AJJsX7
 lyPvojEnse6pjPupj4/IZqcQrARILmXRBsCaCBsop5htlOKpJtSSWe683ZlUc7uACehz
 a5fx4iq7lHU9K2SmkR+98Hmt28mCmZmPDw1tvht3ZcMO5x7cnN9tCoqaX3bOo7HH5rl4
 b7g/0+QfIY49FJxDKWxncCAqKilPQFGOGnT91+4i+W/62J54NcqQX9bH7pG0K91pOsBg
 2/v6mx+RE/Uo6KYMpQZUyH8WIH7p6y1XRQfDdMwUo8qrUGC7ubFYq3fEnG7Fa05x6HQB
 KN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qTk6nTCS3DCR8zWFD1IY+CDlAPgvIuL5FWh8To7K36Q=;
 b=FmiMj9u06JCEaDKsZwYN20z9WSFSAHBCgmXG5LrQHmzfRBFx/mmRMY/wmIFSV5fiQG
 0awMgsNCFkeQG4m42VAzY8rn1vWTov+pfZbcxmaLDHtLNj3Ys5beBFBl4mMwn2taU83b
 5Rs81zdnd6MbRFpDGNTK5fynD36OGYQeKKAf2RxqeVmKhxZ0hsdqcsbyr1pkCy1qG/Wb
 iKpukD42ZuduF2J6oHdcvnUKX1alJ/T4aAE8h8B6kyvBwodDwz+uhMWny3LLCw9HDCJO
 hGXEjxF8N2jqxZBRTUILQyiKtbHgRfoHX7HF3wR4wUx993VD99mJCozvAa503Il1rXXc
 2QBQ==
X-Gm-Message-State: AOAM531NHvrh01YNlyzblOizEcC5rrQP19XQoy7yJww+wUDXNVSr2mSQ
 VsCskHY61MnAVXHBDKANaXF3+QV8BGGs5w==
X-Google-Smtp-Source: ABdhPJxMqBhPrAvUjqlwsoRqaqmLkCyWXWnlNYFYy3hI2NGB9S3HsSFHBWZvauv5tREcyE3Q9sQP0g==
X-Received: by 2002:a63:65c5:: with SMTP id
 z188mr27523443pgb.174.1626729784491; 
 Mon, 19 Jul 2021 14:23:04 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25008434pgi.94.2021.07.19.14.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:23:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v4 15/15] accel/tcg: Record singlestep_enabled in
 tb->cflags
Date: Mon, 19 Jul 2021 11:22:39 -1000
Message-Id: <20210719212239.428740-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719212239.428740-1-richard.henderson@linaro.org>
References: <20210719212239.428740-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
 include/exec/exec-all.h |  1 +
 accel/tcg/cpu-exec.c    | 12 ++++++++++++
 accel/tcg/translator.c  |  7 +------
 cpu.c                   |  4 ----
 4 files changed, 14 insertions(+), 10 deletions(-)

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
index 6710e15d8b..30a3be9ea7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -272,6 +272,14 @@ static uint32_t cflags_for_breakpoints(CPUState *cpu, target_ulong pc,
         }
     }
 
+    if (unlikely(cpu->singlestep_enabled)) {
+        /*
+         * Record gdb single-step.  We should be exiting the TB by raising
+         * EXCP_DEBUG, but to simplify other tests, disable chaining too.
+         */
+        bflags = CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP | 1;
+    }
+
     if (unlikely(bflags)) {
         cflags = (cflags & ~CF_COUNT_MASK) | bflags;
     }
@@ -409,7 +417,11 @@ void cpu_exec_step_atomic(CPUState *cpu)
          * We only arrive in cpu_exec_step_atomic after beginning execution
          * of an insn that includes an atomic operation we can't handle.
          * Any breakpoint for this insn will have been recognized earlier.
+         * But do record single-stepping.
          */
+        if (unlikely(cpu->singlestep_enabled)) {
+            cflags |= CF_SINGLE_STEP;
+        }
 
         tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
         if (tb == NULL) {
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


