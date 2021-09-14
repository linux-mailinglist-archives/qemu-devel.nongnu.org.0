Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752D540A20F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:31:52 +0200 (CEST)
Received: from localhost ([::1]:56344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwMZ-0001t5-Fn
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6Z-0001n1-Qe
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:22 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6V-0007l9-Kv
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:18 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 me5-20020a17090b17c500b0019af76b7bb4so81647pjb.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kMgMf4tltj945+b+cBz+KgDOZ1D9R65U6Vn4IysmVyc=;
 b=GAXPp55AKS6E5Win1sgWo9m4cWFqmIad26MwUKdRatRaNFJYlwfppWnIboXaKN5UnI
 fSKPW39oP8dd+XpQ12MfrjSYbkXusRw+r+aOHMDh6KmLGWwoNlyES+hgOOu4S5LrXLDM
 qn2BZhhqIQxTxYOQ0OLeDRXHoXh53bG2DwCYamk/oPeaQr3ATXAMbz45mZonAYMHKDyI
 Qf9N7Tj5zQPyKKLQ/eF/OMnoy7DOdC34d/hScToanhdQjRu0B/av55RrnIVfrSlywqQJ
 3gsUjXx+ARuMIup2xdaUyf304Xq1rjcOtfJK/vZit36o1iEbilm7jf85NPMkXbIC3rKk
 mqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kMgMf4tltj945+b+cBz+KgDOZ1D9R65U6Vn4IysmVyc=;
 b=CjzHrBVIJOGqEXr2KF+hXy4RbwoeIN4I9KnhButENdMv/nQzmO8r99SoybNFzADJVH
 PacogxB+PUCiixVwmcCnnnKjX/QhmQhXRxdJTZYuWi7fKwO8M7rvirnUZUQea9IoGP5Y
 ePVrM8t2j1b7Hy2cQHd9uRFQgdBAnNxsah8vLMtlI2a6h+a+VZVB9100luauXmj1oqvu
 OHkOhqkYxvM613Ls/qufugs6yLyit+UbAKVgVcnyZxyt5VOk6wqU5bqnOyH1FR8zdOV2
 ydyjtbPCepnNueUx3zwsnqhrTzIPTEZSWq1aiW59xpgcvMFg9+2iXv5ehcf9NPajmAJm
 eMuw==
X-Gm-Message-State: AOAM531Q56EIOxlFOfE40PnkBpwEv0eKRQhB1AIvSAAcuIqwLKHsr3OF
 //0RA8c9hzlvtpty3g5HqYoxhuaTa9+hdg==
X-Google-Smtp-Source: ABdhPJz9tqRXmc9fnr3ZseLGZ3N641m8J7qyf0NzmNhL+NdlPfDUOOCRxY49S6XaSqjGCH2xnVZdEA==
X-Received: by 2002:a17:90a:bd06:: with SMTP id y6mr2386117pjr.6.1631578514346; 
 Mon, 13 Sep 2021 17:15:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/44] target/mips: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Mon, 13 Sep 2021 17:14:34 -0700
Message-Id: <20210914001456.793490-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-15-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/tcg-internal.h      |  5 +++--
 target/mips/cpu.c                   |  2 +-
 target/mips/tcg/exception.c         | 18 ------------------
 target/mips/tcg/sysemu/tlb_helper.c | 18 ++++++++++++++++++
 target/mips/tcg/user/tlb_helper.c   |  5 -----
 5 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 81b14eb219..c7a77ddccd 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -18,8 +18,6 @@
 void mips_tcg_init(void);
 
 void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
-void mips_cpu_do_interrupt(CPUState *cpu);
-bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
@@ -41,6 +39,9 @@ static inline void QEMU_NORETURN do_raise_exception(CPUMIPSState *env,
 
 #if !defined(CONFIG_USER_ONLY)
 
+void mips_cpu_do_interrupt(CPUState *cpu);
+bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
+
 void mmu_init(CPUMIPSState *env, const mips_def_t *def);
 
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index d426918291..00e0c55d0e 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -539,10 +539,10 @@ static const struct SysemuCPUOps mips_sysemu_ops = {
 static const struct TCGCPUOps mips_tcg_ops = {
     .initialize = mips_tcg_init,
     .synchronize_from_tb = mips_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .tlb_fill = mips_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
     .do_unaligned_access = mips_cpu_do_unaligned_access,
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 4fb8b00711..7b3026b105 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -86,24 +86,6 @@ void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb)
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
 
-bool mips_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
-{
-    if (interrupt_request & CPU_INTERRUPT_HARD) {
-        MIPSCPU *cpu = MIPS_CPU(cs);
-        CPUMIPSState *env = &cpu->env;
-
-        if (cpu_mips_hw_interrupts_enabled(env) &&
-            cpu_mips_hw_interrupts_pending(env)) {
-            /* Raise it */
-            cs->exception_index = EXCP_EXT_INTERRUPT;
-            env->error_code = 0;
-            mips_cpu_do_interrupt(cs);
-            return true;
-        }
-    }
-    return false;
-}
-
 static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_RESET] = "reset",
     [EXCP_SRESET] = "soft reset",
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index a150a014ec..73254d1929 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -1339,6 +1339,24 @@ void mips_cpu_do_interrupt(CPUState *cs)
     cs->exception_index = EXCP_NONE;
 }
 
+bool mips_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+{
+    if (interrupt_request & CPU_INTERRUPT_HARD) {
+        MIPSCPU *cpu = MIPS_CPU(cs);
+        CPUMIPSState *env = &cpu->env;
+
+        if (cpu_mips_hw_interrupts_enabled(env) &&
+            cpu_mips_hw_interrupts_pending(env)) {
+            /* Raise it */
+            cs->exception_index = EXCP_EXT_INTERRUPT;
+            env->error_code = 0;
+            mips_cpu_do_interrupt(cs);
+            return true;
+        }
+    }
+    return false;
+}
+
 void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra)
 {
     CPUState *cs = env_cpu(env);
diff --git a/target/mips/tcg/user/tlb_helper.c b/target/mips/tcg/user/tlb_helper.c
index b835144b82..210c6d529e 100644
--- a/target/mips/tcg/user/tlb_helper.c
+++ b/target/mips/tcg/user/tlb_helper.c
@@ -57,8 +57,3 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     raise_mmu_exception(env, address, access_type);
     do_raise_exception_err(env, cs->exception_index, env->error_code, retaddr);
 }
-
-void mips_cpu_do_interrupt(CPUState *cs)
-{
-    cs->exception_index = EXCP_NONE;
-}
-- 
2.25.1


