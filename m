Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E60440AC9
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:55:28 +0200 (CEST)
Received: from localhost ([::1]:59048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsZj-0004gA-5S
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryi-0002KP-L3
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:13 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryf-0000DZ-Vz
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:12 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so13057397pji.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HtawaHYSfgiYXorLPYx7eO4JeOJDito5IEpdHHHLhLI=;
 b=lmdjodi1zC9160wxOhmCH889U5IhoFe3nerTLJjBHCvULJacfMO3NZFouTIZehwXTC
 YNdwsyCBRUctFBlvg8FMxIodV9LAxS+YHlYE/gND0+EQJtj3Fe8vdyeBTuKLh0zhGbw6
 /dg+lpJoGm3ADTe+ySJCJXqV77ZZ1mGJWS+iwaT9/kacudKPiD8l3pg8hKrmDEsitVU6
 9tBL45TyjqCOLodHgryPk0kXcuheZ5AjLAHn2LaWN/ozed0qEEktBERWfZPf4PH+1X50
 yOcLTBbdDarBFI+lr6gsOe1YXlBNvyaxALtz98Hfs06S0NgcUNDSuGTh3et7/kWow4ot
 cmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HtawaHYSfgiYXorLPYx7eO4JeOJDito5IEpdHHHLhLI=;
 b=MVeJfDwcqlH8h1UGRRi7hwZodoXpOQBQ6eou3++80mYe/nG8XU4bEu9rtuFkK3FYeb
 X2riyy2pDn7J2yDlXS8Vye1Ko+r3BMB3v43IWW9WalPJrSs8EN/esXOZc97Je3AZntu5
 xja2107ITkYC/W5NONXblPla0CnZiNL+mVmelMQnOQJ0xB1LBX1E4/pmDcAFKadNywRA
 Stih5RcixQ3e2PCAMGL4zr4dNCzBBd3gV5Sr/dAyTP+BlQzQDTrkilZ+XgeN3yJHH9Zl
 6KbSFDrI1gWd1JA1uOGY6i4MZJEhxiwpcOQiHgLQ+xAx6m08KGqCdJFZUBW28yXwEQfI
 xpoA==
X-Gm-Message-State: AOAM532dUmXREfnKwPIKZjVH3MFaOsvcOcr0PqqFpCpnoXyQ6HvnFL8g
 XBD9G6La1n9oQv3mb1Zj4FksSu+LOEzYDA==
X-Google-Smtp-Source: ABdhPJzTAR2vQDsQ8Sk6tbVJGfyCtV6O0tib/nr7CWcC/zfADi8GWw+7XTHfzTBS+3GmjtdkzdyluA==
X-Received: by 2002:a17:90b:1e09:: with SMTP id
 pg9mr27906420pjb.59.1635614228810; 
 Sat, 30 Oct 2021 10:17:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:17:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 35/66] target/riscv: Make riscv_cpu_tlb_fill sysemu only
Date: Sat, 30 Oct 2021 10:16:04 -0700
Message-Id: <20211030171635.1689530-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
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


