Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58B1314424
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:41:50 +0100 (CET)
Received: from localhost ([::1]:56602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GA9-0006ja-S6
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9G7m-00056Z-P7
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 18:39:22 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:45100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9G7f-00011I-9x
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 18:39:21 -0500
Received: by mail-pg1-x52c.google.com with SMTP id o21so9877012pgn.12
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 15:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eL4WqFDBuNtlcGfpllQU5OAqdTK3sQa+xgiSdwASR9g=;
 b=mKokqLWpckqZtMQ+8XiqgwyOgeBd5uyfFW1HD/NErNsLvZdkMYY2JD+qI/QGq7o7tv
 7/vzBNIi9+Za6ZlU+HwnmclCbzhGPW8bfMYmc3MghQYAucvsjJ1pwato145aPTT21wyv
 iUat8hv48V2lWt7nwZRlLoqanRh1gPFwAzkaos/W4Y4FUqMxENx1XEHGefpeh1FzZOOk
 h/VwaTH0ncDW/O3nvUh2zcbYT76+LNWrzP7I9tUlF6VEmgJMXdUTNM6F09fxJUYBOsm1
 MKWk7K2uKReGtvG/ETlxQ01pHf7lVC3LTZyNslQaaFKXMmwwt4Q0jk/hk+wE/70zdiR0
 1nQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eL4WqFDBuNtlcGfpllQU5OAqdTK3sQa+xgiSdwASR9g=;
 b=ZAyQCHATAeazobMlvKoHvRWTI6kOfsKhnDeeE97ocxco2F5kB2wg0aEKVicAEaXl7R
 6jUi8btDpDrEwRiFE2HHBh7eQrxbHpYhOMJkGit5QPnxbuNI0fsqh1h89eQGOChF6sjf
 pNrmSr4VPGbMFFquxdCrz/Sm4MiSMUJUwinjWjU5UL75jrHFKeKbusXjv9KE7GkiJ+63
 0ZZekImkxjXZms1KtdZAWkpTI+AHRJmOKWxXgQc+6+hb1gdbfJ5XlYYRCooFmfJemOwp
 e5yprTYP1sC9nmNcr+TF8tFzryBladb43uSZrq0kNaErlkHaStt/+glk686cHVdb1yJv
 0oNA==
X-Gm-Message-State: AOAM5308tprr03jLuHreP8j28Ucy9T3TKq7H9G+/ahZ8QDvfiQfNvXB7
 MC6UcsCiusGZkm3AC3zldPFYXsBlEJCL0A==
X-Google-Smtp-Source: ABdhPJy4/Z5nfjdnchwdDLJpNVv/qkLRiMp09zM2HO8hGFsfRECHCUO/RUW0KKc0cYd2Uvwz1ensUA==
X-Received: by 2002:a05:6a00:22d6:b029:1cb:35ac:d8e0 with SMTP id
 f22-20020a056a0022d6b02901cb35acd8e0mr19392584pfj.17.1612827553355; 
 Mon, 08 Feb 2021 15:39:13 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k15sm13483489pgt.35.2021.02.08.15.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 15:39:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/sh4: Create superh_io_recompile_replay_branch
Date: Mon,  8 Feb 2021 15:39:06 -0800
Message-Id: <20210208233906.479571-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208233906.479571-1-richard.henderson@linaro.org>
References: <20210208233906.479571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: alex.bennee@linaro.org, cfontana@suse.de,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the code from accel/tcg/translate-all.c to target/sh4/cpu.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 accel/tcg/translate-all.c | 12 ------------
 target/sh4/cpu.c          | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 470657b02a..b8ad95aa1b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2417,9 +2417,6 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
  */
 void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
 {
-#if defined(TARGET_SH4)
-    CPUArchState *env = cpu->env_ptr;
-#endif
     TranslationBlock *tb;
     CPUClass *cc;
     uint32_t n;
@@ -2443,15 +2440,6 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
         cpu_neg(cpu)->icount_decr.u16.low++;
         n = 2;
     }
-#if defined(TARGET_SH4)
-    if ((env->flags & ((DELAY_SLOT | DELAY_SLOT_CONDITIONAL))) != 0
-        && env->pc != tb->pc) {
-        env->pc -= 2;
-        cpu_neg(cpu)->icount_decr.u16.low++;
-        env->flags &= ~(DELAY_SLOT | DELAY_SLOT_CONDITIONAL);
-        n = 2;
-    }
-#endif
 
     /* Generate a new TB executing the I/O insn.  */
     cpu->cflags_next_tb = curr_cflags() | CF_LAST_IO | n;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index a78d283bc8..ac65c88f1f 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -43,6 +43,23 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
 }
 
+#ifndef CONFIG_USER_ONLY
+static bool superh_io_recompile_replay_branch(CPUState *cs,
+                                              const TranslationBlock *tb)
+{
+    SuperHCPU *cpu = SUPERH_CPU(cs);
+    CPUSH4State *env = &cpu->env;
+
+    if ((env->flags & ((DELAY_SLOT | DELAY_SLOT_CONDITIONAL))) != 0
+        && env->pc != tb->pc) {
+        env->pc -= 2;
+        env->flags &= ~(DELAY_SLOT | DELAY_SLOT_CONDITIONAL);
+        return true;
+    }
+    return false;
+}
+#endif
+
 static bool superh_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
@@ -217,6 +234,7 @@ static struct TCGCPUOps superh_tcg_ops = {
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = superh_cpu_do_interrupt,
     .do_unaligned_access = superh_cpu_do_unaligned_access,
+    .io_recompile_replay_branch = superh_io_recompile_replay_branch,
 #endif /* !CONFIG_USER_ONLY */
 };
 
-- 
2.25.1


