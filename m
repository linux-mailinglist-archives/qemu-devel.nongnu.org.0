Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44371441FC9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:06:35 +0100 (CET)
Received: from localhost ([::1]:34776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbhZ-00078Z-7h
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6G-0003w4-J7
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:28:05 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:38670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb69-0000fr-Hv
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:28:00 -0400
Received: by mail-qk1-x72e.google.com with SMTP id bi29so17217108qkb.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HtawaHYSfgiYXorLPYx7eO4JeOJDito5IEpdHHHLhLI=;
 b=dJj+mSSFptQx4/Lvl+mjYuEtJkxG+nE6EeioTsZC/eLGjtDKLHEU2M9HfeE7wrZSCM
 J0IvhhDLKxWzOP01vJyueUlhwuu/z/ouKHmWwYGxsS5AgKfAKgNkOmKW3FxJc5QSfQcf
 p6pfKxYhm5x5AJM7yvyGDmu2bG8hY3Llm2wH5IWPtBm4V9cYMsWtpdq93y0ljLnsWkcH
 f/c6BfNbYHjU1yDNzdXJIK9hEanvBSwpjkkfM0AqTYLvWfOOje17uQfk5T6nnHtdmJ9y
 9hf9iAP+hzxsYl9iQAOfnxW/8aydBboEiPYtIrZ0633+YVlch/j1tKhBsE7WD1qrJ2Qd
 1/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HtawaHYSfgiYXorLPYx7eO4JeOJDito5IEpdHHHLhLI=;
 b=oOdGOOYJqaEAP5KEJTba4ap3bElGUW3YAZ2tgZpO0TRw3GitIm1NM1nZamDpA671FN
 dQzpGxFsLhx/5nyPcXx7/wjEN8+hoYabhN+o3F4adRV1nhFqHsOJlWn+zz+Chsysy6+c
 bXTVUGlf+3HM6oMbJJRUfszlrUPG0EQPYjl0Cmp32Ub+eRFWkwE+P5iOXWrAXZodTDMt
 mr/hJ8bx+4SltJQE6GkxM9R3clvM2NxQ8994vKNBKpWfN1Ht/2sluq3Y+hXdLiBFjiyh
 ZpPx+IWsPychvG8bpeID13NXZhFHUBDP2ND58wPvJGQcNPMIz+3azsHTKA3Lm24Jwe/Y
 74Tg==
X-Gm-Message-State: AOAM531VCITZKiATj+lG4pf7DIQndQGIcMLTLeIFE8d1GX+tKl7oyn7h
 rOCD6M5d9IS53+dPEPtlUj6YolgfhRDCfg==
X-Google-Smtp-Source: ABdhPJxariVysMo/oa1V4vQeBWSnVMUz0fyEkd2wOsygfUq3NuiSJnkSP29h2cORvpNE6UHTk9VdyA==
X-Received: by 2002:a05:620a:254f:: with SMTP id
 s15mr23849778qko.397.1635787671220; 
 Mon, 01 Nov 2021 10:27:51 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 35/60] target/riscv: Make riscv_cpu_tlb_fill sysemu only
Date: Mon,  1 Nov 2021 13:27:04 -0400
Message-Id: <20211101172729.23149-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for riscv linux-user.

Remove the code from cpu_loop that raised SIGSEGV.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/riscv/cpu_loop.c |  7 -------
 target/riscv/cpu.c          |  2 +-
 target/riscv/cpu_helper.c   | 21 +--------------------
 3 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index e5bb6d908a..b301dac802 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -87,13 +87,6 @@ void cpu_loop(CPURISCVState *env)
             sigcode = TARGET_TRAP_BRKPT;
             sigaddr = env->pc;
             break;
-        case RISCV_EXCP_INST_PAGE_FAULT:
-        case RISCV_EXCP_LOAD_PAGE_FAULT:
-        case RISCV_EXCP_STORE_PAGE_FAULT:
-            signum = TARGET_SIGSEGV;
-            sigcode = TARGET_SEGV_MAPERR;
-            sigaddr = env->badaddr;
-            break;
         case RISCV_EXCP_SEMIHOST:
             env->gpr[xA0] = do_common_semihosting(cs);
             env->pc += 4;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d53125dbc..f812998123 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -694,9 +694,9 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 static const struct TCGCPUOps riscv_tcg_ops = {
     .initialize = riscv_translate_init,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
-    .tlb_fill = riscv_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = riscv_cpu_tlb_fill,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f30ff672f8..9eeed38c7e 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -814,7 +814,6 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                             riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(env, cs->exception_index, retaddr);
 }
-#endif /* !CONFIG_USER_ONLY */
 
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
@@ -822,7 +821,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-#ifndef CONFIG_USER_ONLY
     vaddr im_address;
     hwaddr pa = 0;
     int prot, prot2, prot_pmp;
@@ -954,25 +952,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 
     return true;
-
-#else
-    switch (access_type) {
-    case MMU_INST_FETCH:
-        cs->exception_index = RISCV_EXCP_INST_PAGE_FAULT;
-        break;
-    case MMU_DATA_LOAD:
-        cs->exception_index = RISCV_EXCP_LOAD_PAGE_FAULT;
-        break;
-    case MMU_DATA_STORE:
-        cs->exception_index = RISCV_EXCP_STORE_PAGE_FAULT;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    env->badaddr = address;
-    cpu_loop_exit_restore(cs, retaddr);
-#endif
 }
+#endif /* !CONFIG_USER_ONLY */
 
 /*
  * Handle Traps
-- 
2.25.1


