Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC3140A225
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:42:13 +0200 (CEST)
Received: from localhost ([::1]:47512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwWa-0006ip-5n
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6i-0001oF-UI
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:30 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6a-0007nk-Sl
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:26 -0400
Received: by mail-pf1-x42c.google.com with SMTP id x7so10429642pfa.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1uRALgNHXZv9FjZ25Lsx3DYyoEvXPbfVSqiMNjjCoOw=;
 b=k18afEEq2TVS8ZLn+e+YdsoKJu650RYdHS0pUYqFuan7OxLDAs11WLBnHhvHJ2sfOr
 F6IBdyE9FKdKDfpyhTo8RtE4YnsxacOWbjRwmT54+o+n+oqw+rxj3tisbgsTQCaYGy+p
 EXHTA1SwQDZ5UeX0w1R3hhX7T9t/PwKBXxtYGhpfm0hTPUsCHoEXCcdIOvZk6WtW9rJW
 upkAKEHSrCgSpMoFG7WK4jN/7uKitT/1GZLm7cHL6XRdrNDLdI71vO8x8SV5M/uKz58r
 uvUXr4qY5s1iqFtk+/tJQZvCY4HjRkxn0K/msg9SS+t9nYGU3Q8RfC4kmH1+/P4fv4Cs
 XOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1uRALgNHXZv9FjZ25Lsx3DYyoEvXPbfVSqiMNjjCoOw=;
 b=2qjO/BFR15P2+049fYhbve5U/swOtiTP74M70b+ehJki7bghPIlk564wvvcWXYArYL
 ZjHWsnWR5xNX++vVqw6DuPA2GuakWQaR8AoX/yhpvY40zbX1yy8sapZQRj50vbamMEFH
 6AyCrsODUFvoepXSokImdRUU23/Ofc7++kFYFjTbLwNwmSUctqj1pV6e7eLIQ7XNaIoY
 9vKNozAxA+RyxDajn5Y/AeMqMvbQDIz+TeaEVf6FguzOi42ZoEc3n13ny1RgJkC30S34
 JKw1FsC7NhxmsvDzyFKTq7mP6M8IPA+ARqs/HqqBvYWsXZWDgVPm+vEEJA1TXpbCD4zV
 mz7g==
X-Gm-Message-State: AOAM530AWYvTOnd6Ghqao8O248zR3gQuwngssA2ChzaQKjmQlLgmcBIE
 88x8Qnyt4cio+SLNIQ6jDqB9Eb7l1NTYYg==
X-Google-Smtp-Source: ABdhPJwjLAARdgLVC9wwDlusgS6uDGW9VnRfGaQFprandNt/UnClovexoTtPjg5P1f9CRpPQydRVpA==
X-Received: by 2002:a05:6a00:a8a:b029:30c:a10b:3e3f with SMTP id
 b10-20020a056a000a8ab029030ca10b3e3fmr2026182pfl.40.1631578518087; 
 Mon, 13 Sep 2021 17:15:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/44] target/sh4: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Mon, 13 Sep 2021 17:14:39 -0700
Message-Id: <20210914001456.793490-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Message-Id: <20210911165434.531552-20-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/cpu.h    | 4 ++--
 target/sh4/cpu.c    | 2 +-
 target/sh4/helper.c | 9 ++-------
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 01c4344082..017a770214 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -204,8 +204,6 @@ struct SuperHCPU {
 };
 
 
-void superh_cpu_do_interrupt(CPUState *cpu);
-bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
@@ -223,6 +221,8 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 void sh4_cpu_list(void);
 #if !defined(CONFIG_USER_ONLY)
+void superh_cpu_do_interrupt(CPUState *cpu);
+bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void cpu_sh4_invalidate_tlb(CPUSH4State *s);
 uint32_t cpu_sh4_read_mmaped_itlb_addr(CPUSH4State *s,
                                        hwaddr addr);
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 8326922942..2047742d03 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -236,10 +236,10 @@ static const struct SysemuCPUOps sh4_sysemu_ops = {
 static const struct TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
     .synchronize_from_tb = superh_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .tlb_fill = superh_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .do_interrupt = superh_cpu_do_interrupt,
     .do_unaligned_access = superh_cpu_do_unaligned_access,
     .io_recompile_replay_branch = superh_io_recompile_replay_branch,
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 2d622081e8..53cb9c3b63 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -45,11 +45,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 
-void superh_cpu_do_interrupt(CPUState *cs)
-{
-    cs->exception_index = -1;
-}
-
 int cpu_sh4_is_cached(CPUSH4State *env, target_ulong addr)
 {
     /* For user mode, only U0 area is cacheable. */
@@ -784,8 +779,6 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong addr)
     return 0;
 }
 
-#endif
-
 bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     if (interrupt_request & CPU_INTERRUPT_HARD) {
@@ -803,6 +796,8 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr)
-- 
2.25.1


