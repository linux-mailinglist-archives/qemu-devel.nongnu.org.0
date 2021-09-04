Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07221400DA6
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:08:17 +0200 (CEST)
Received: from localhost ([::1]:55902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfho-0004te-3G
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfXD-0008FI-O4
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:19 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfXC-0008Hc-4g
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:19 -0400
Received: by mail-wr1-x435.google.com with SMTP id u16so4053959wrn.5
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N+NN7MUp81y6VS+L5YAPM+yHuTskNuvr3OHs0wj0LLY=;
 b=apFOtQou0JAltbc5UjR6buWuyhK+sKx/jKhsd5/Hqy+28LwqdnK42IyfopgCznlnq4
 aFcnm23wfgrDyIt/rD+Boi8lx9XxuR6b3lOyrLkqoQmnWHmzLJKNQsDibguKgx1G9JW9
 Hs5befKhdN8pbpx3hogL/b97FaHb2zt7Ah0TDLku1VCbaaKIHdmcCeLTOds725vcRZqX
 UI+noNbrcnH4SJTuApENvsl5KNs/tW0+abew/6U2LdmIvtNhRWREmBbcs/WdwLvzOUpg
 k/SPH8Nk5iibWP6Ho5xVGQH88R2GbjvSLNULgflsEPi2vHIPQUs32OJG4xsiHCFXnJuq
 qxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N+NN7MUp81y6VS+L5YAPM+yHuTskNuvr3OHs0wj0LLY=;
 b=WPcZ/IgwfwgXrTpORd67e6eO2hlxYJayb91FLuofYxVphNAce+qVVpw4upINRRADQK
 5OOTEjv+IbV+Uqj8B6MVef90/M20fHQgraEWpSE90XwMHJb41paacbVz9yTQanb+1oI/
 uxf/sZ3C5gXnspMPKdwlGh1SZo8a6IBvAkueFgB/Ly/0eP6Ue/q1iwG0OVAyNpmZTdvw
 S7cgMquL7WbVW47l0Dl9ncbtFEPyVK+NHScI0+Vhfe4OnyNUXkBTEd6w7VtBZM/zWcdP
 fCekfVwukomP1HnMDocZS0fwgXDwy6U1dJSJxVcAlNA7lMa+3hQXMuwz4KZPLI2AT+fk
 QiSg==
X-Gm-Message-State: AOAM532yNSP9k75+CS5LxSMXoq5wz7236igaJX10asmLH5AYLRictGJB
 fMqOwhV48/Z4AqpURnhXnMR86PRvBCs=
X-Google-Smtp-Source: ABdhPJyvWTFPlTZd+GgoSoudIyJeUY7QUpIzGO/siqVWlfGZ7HgmNLUoVCVKKmzJhNgjE5dGdLwVCA==
X-Received: by 2002:a5d:67c3:: with SMTP id n3mr5994964wrw.201.1630799836698; 
 Sat, 04 Sep 2021 16:57:16 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id f20sm3113680wml.38.2021.09.04.16.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:57:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/24] target/riscv: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sun,  5 Sep 2021 01:55:36 +0200
Message-Id: <20210904235542.1092641-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/riscv/cpu.h        | 2 +-
 target/riscv/cpu.c        | 2 +-
 target/riscv/cpu_helper.c | 5 -----
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00b..e735e53e26c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -334,7 +334,6 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, void *opaque);
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
@@ -362,6 +361,7 @@ void riscv_cpu_list(void);
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
+bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
 uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1a2b03d579c..13575c14085 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -644,10 +644,10 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 static const struct TCGCPUOps riscv_tcg_ops = {
     .initialize = riscv_translate_init,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .tlb_fill = riscv_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
     .do_unaligned_access = riscv_cpu_do_unaligned_access,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 968cb8046f4..701858d670c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -75,11 +75,9 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
         return RISCV_EXCP_NONE; /* indicates no pending interrupt */
     }
 }
-#endif
 
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-#if !defined(CONFIG_USER_ONLY)
     if (interrupt_request & CPU_INTERRUPT_HARD) {
         RISCVCPU *cpu = RISCV_CPU(cs);
         CPURISCVState *env = &cpu->env;
@@ -90,12 +88,9 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
             return true;
         }
     }
-#endif
     return false;
 }
 
-#if !defined(CONFIG_USER_ONLY)
-
 /* Return true is floating point support is currently enabled */
 bool riscv_cpu_fp_enabled(CPURISCVState *env)
 {
-- 
2.31.1


