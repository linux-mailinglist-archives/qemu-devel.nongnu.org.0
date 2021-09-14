Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426F740A23C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:56:48 +0200 (CEST)
Received: from localhost ([::1]:46578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwkh-0008UT-B5
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6b-0001n4-54
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:24 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:45953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6Y-0007mo-Q7
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:20 -0400
Received: by mail-pf1-x436.google.com with SMTP id w19so6051630pfn.12
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AcoTYsBEjVbee6ShXdncl7G4H7q8l+3JaJK4RCD5s1g=;
 b=LgLgSL6sudI6AwmAK3pCVUoV+r7gAGWd6ZtZPSeN6Ak6DstUHb5HgTppz9lcmStaKX
 C3p4rlgi6Huh+IdoPCcZ/rbv17x5Ynu+77vkzJTBSfpUnhDVqTNQDwH3hkcBjH7Ku0yn
 CMMprHkAkSlHm3LlZYCzQlfgKJqfEIt4EYMAsN/sjWGcKotz4s4QtU1Zxmkjn5mtfrk2
 VOdju/3DND8eZQJYPoCpxfHEuV2/q1FuTDNYepBrCDIQjfHpQov11uCS8ajBbClUIBhD
 2HspVtPYwEiWIuSVf4nGJYqL9OrlJ7T2VvpOxlAOYka6lHiBEvEVq6u+UDkqVjEEN0d1
 54LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AcoTYsBEjVbee6ShXdncl7G4H7q8l+3JaJK4RCD5s1g=;
 b=WepFNso5vbXp6wz5AOdIlU9lceF4aV/RS9TW1Jqs/S+lnOxAaX+F3E4KYO18aV7AfQ
 PwWzEx/4XIXvLMR+xsoTkIN2w7F+6Rnd9pVwOmbyOAwMZGaDh8HF4RwyTkCE1EZvGiAJ
 +ty9EX7mSl+q1UMEFJglYBbA/OoBCHpIx69qEQ/bR+i2cKxPxWPp2jN+7BZLV5pxYoN8
 YrYgq+cgENd1GgPfzAV49oUwa6dAV4yEpYIYYzzizbMSRuMtFMO3B5d5BdHDEPKdSh7m
 tYIGzpzcfDY9CHj97uSEh+oR0E2m9YyijN+7DpmLOFH/JE7qM1Md3Y/t+s/y/QKFRQdw
 EoTA==
X-Gm-Message-State: AOAM533FJEgbp+8uvQzSfZ9jkor2PpbQ49eBbtlQn4F21PIyUp2FvaBA
 IIvXUpOqjqA4XpG3KeUIzJht4D2+8vJGZg==
X-Google-Smtp-Source: ABdhPJw89HGCXIslI+3aMVQxviWv/TMrYEa5DIjluoYaXqwvM7LTH7AjqnseGoeB6Am5nu9I8L8ckg==
X-Received: by 2002:a65:62c4:: with SMTP id m4mr13324201pgv.453.1631578516650; 
 Mon, 13 Sep 2021 17:15:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/44] target/ppc: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Mon, 13 Sep 2021 17:14:37 -0700
Message-Id: <20210914001456.793490-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
 Warner Losh <imp@bsdimp.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20210911165434.531552-18-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         |  4 ++--
 target/ppc/cpu_init.c    |  2 +-
 target/ppc/excp_helper.c | 21 +++------------------
 3 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 500205229c..362e7c4c5c 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1254,8 +1254,6 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtualHypervisorClass,
                      PPC_VIRTUAL_HYPERVISOR, TYPE_PPC_VIRTUAL_HYPERVISOR)
 #endif /* CONFIG_USER_ONLY */
 
-void ppc_cpu_do_interrupt(CPUState *cpu);
-bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
@@ -1271,6 +1269,8 @@ int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
 int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, void *opaque);
 #ifndef CONFIG_USER_ONLY
+void ppc_cpu_do_interrupt(CPUState *cpu);
+bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_do_system_reset(CPUState *cs);
 void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector);
 extern const VMStateDescription vmstate_ppc_cpu;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index ad7abc6041..6aad01d1d3 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9014,10 +9014,10 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
 
 static const struct TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
-  .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .tlb_fill = ppc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+  .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .do_interrupt = ppc_cpu_do_interrupt,
   .cpu_exec_enter = ppc_cpu_exec_enter,
   .cpu_exec_exit = ppc_cpu_exec_exit,
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7b6ac16eef..d7e32ee107 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -40,24 +40,8 @@
 
 /*****************************************************************************/
 /* Exception processing */
-#if defined(CONFIG_USER_ONLY)
-void ppc_cpu_do_interrupt(CPUState *cs)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
+#if !defined(CONFIG_USER_ONLY)
 
-    cs->exception_index = POWERPC_EXCP_NONE;
-    env->error_code = 0;
-}
-
-static void ppc_hw_interrupt(CPUPPCState *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = POWERPC_EXCP_NONE;
-    env->error_code = 0;
-}
-#else /* defined(CONFIG_USER_ONLY) */
 static inline void dump_syscall(CPUPPCState *env)
 {
     qemu_log_mask(CPU_LOG_INT, "syscall r0=%016" PRIx64
@@ -1113,7 +1097,6 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
 
     powerpc_set_excp_state(cpu, vector, msr);
 }
-#endif /* !CONFIG_USER_ONLY */
 
 bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -1130,6 +1113,8 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 #if defined(DEBUG_OP)
 static void cpu_dump_rfi(target_ulong RA, target_ulong msr)
 {
-- 
2.25.1


