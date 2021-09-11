Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E044D4079B4
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:03:48 +0200 (CEST)
Received: from localhost ([::1]:48714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6Pr-0004sx-WE
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6IQ-00083O-13
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:56:06 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6IM-000310-8O
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:56:05 -0400
Received: by mail-wr1-x434.google.com with SMTP id m9so7508294wrb.1
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ckzIrTOGwucKvNX/l+ogfKjL1PFJKsWDkPt+s6zjYCI=;
 b=OCp5awyfFS9riM+T+wrtHz5h2nfVYyUHspa5X1wcj7vGQg18YvPDJr+VtntH+iOMzj
 qCKZEBOakPY9d35fjxAjzyPQN4sgtRY1dtk9Z8OHGQlXTmOiELCyMtMTWqb292Bvj2RJ
 I3bHQrOOp4YRjEYbHRCYthD+x2Gw2CQ/HOKsH5gkDX4ZMsusxX9ghq4Al53l5e7fij7Q
 2daoS/UvYXP5JBGA1qLZobQi+AP44davF13RvLv3K7jyT/zWxlTM17RmggzL3T5f/ZYZ
 SG023q2n6HVshsQRnYGxvgTfcyRuX95s7RX9kIhUBfiDJziZ1TN075gEywOvDXFD0GUv
 r9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ckzIrTOGwucKvNX/l+ogfKjL1PFJKsWDkPt+s6zjYCI=;
 b=ATJkb+HpAyrQOvcnmJzWuVW3esO2Xzx4/rrdWZqRkVxgzS9T78PJ/5bnysWsuoMm7R
 q7BxPXM71CR7Is8NNW+QWLs/giHcviAdbI/xFdHhvXPBht9Je2aSDd6UoDZysWoLw4gZ
 NxfV+068cHiUM/ddNihVeNPJWmO6scLTgJuj97L/R5EkWC6py6PQlWS4s/QKQ/aCM3q0
 ML2UZnCN+4emzAKk3Ld0+zXTojzD51lBepDHYMThjWz/ZTc/8BFjZ+qeSGE3v4U73JYf
 MwUsI+v+M6Cys6KFFm9fDWakpIuVuTP1+/tvqBKxyEAtspmeXNtTb6HrEDbQjG+IcJl3
 mAFg==
X-Gm-Message-State: AOAM533Gviu0LNhSUVY0l9UjG+yX2G6kDoCX7bkF4KOLoFUPS7Imr6te
 mIaYJ5yyuCnl0A1mZtXS84xoMk9OUxo=
X-Google-Smtp-Source: ABdhPJwN0VpvbfB8cVfSr4MQjbPQS7+gs85z9at7r4xHVwNrtdvv0oy+F2wsQVWEoqgm+XA/vn8tkw==
X-Received: by 2002:adf:80eb:: with SMTP id 98mr3870925wrl.370.1631379360871; 
 Sat, 11 Sep 2021 09:56:00 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id v10sm2192763wrg.15.2021.09.11.09.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:56:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/24] target/ppc: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Sat, 11 Sep 2021 18:54:27 +0200
Message-Id: <20210911165434.531552-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/cpu.h         |  4 ++--
 target/ppc/cpu_init.c    |  2 +-
 target/ppc/excp_helper.c | 21 +++------------------
 3 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 500205229c0..362e7c4c5c7 100644
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
index ad7abc6041a..6aad01d1d3a 100644
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
index 7b6ac16eef7..d7e32ee107e 100644
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
2.31.1


