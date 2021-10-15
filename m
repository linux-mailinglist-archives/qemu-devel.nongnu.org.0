Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C4C42E7E0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:29:25 +0200 (CEST)
Received: from localhost ([::1]:52668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEqS-0003iW-Ob
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEZ8-0007Sh-F7
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:30 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEZ4-0000QD-68
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:30 -0400
Received: by mail-pj1-x102b.google.com with SMTP id gn3so806949pjb.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8XNUdw8ZsBPFhbrTI2TXzCgV9ZFmSEvuHYyy7MRm+qg=;
 b=eibrXC3pq7bwWEGw+/JDgf1MeNPENERuEkP9wb61HWujRIG89jHx4Xh0EOHquef3nW
 20YPz2r+UMGFMrJQUYjZzQgaICuD20TQNGVT9lGDrIt4hdavEB1uzmT2pQe3qJ80VtXA
 8xEDWopZSjxd3VQ4hXec01yubEZ4R24aGVFgyh4k9TIjHix0XqSnpusGw/jabSD3i5BP
 E0zwVrDQUbrfZ9dh92zPa2CL6OK2lSLSY7L1MoUKKS1WKMXdSAAYXLo6IzhoGmK2NtLi
 6mjSokBWBiuGgW7rzyM3MC6dpGDvgKyoLtRjVTrbO4lXhNjOeRSK+BDh/oqRjXkGJ1tE
 InqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8XNUdw8ZsBPFhbrTI2TXzCgV9ZFmSEvuHYyy7MRm+qg=;
 b=aThp6ofk/bGB5tBevj7k0fcxvL6GWz61k5QAn5Jt8O0mFlt1Hhd/ZVyQZsUJXpsk/P
 CpPfbEQlG4p9uO5KcSJYO3Ntf5JYA044LCzUq978aQ3DL8YEpcpof5WyLFeX2xu9sGHp
 mMxfiRYEnYvR7rWELeIxpLqMJpUjdr4aAia3eMjE0kuiuMenSOBQaqW0U7FyIdWH+pRp
 80Tx4Yg92pdBBbk8IA7KemjSGkakgnmAaH8WsYKSyrcfShMElcznNHeGjcAZzpljBQAO
 jHq1/VYXNOjibbWQSJQ30aEMRP3LgTSGXvSncnq/wXz8MkzomD+H7S+MBoG9E1y+97/L
 n12Q==
X-Gm-Message-State: AOAM532JRWJNCNo1iybFpE3vztDirB7WKQ9Xf0fd4IkDz/B8QI57x1by
 C2SLFIIkL8UgitGSaTQLE+hzhWiigMfkCw==
X-Google-Smtp-Source: ABdhPJzAA1oe9AAy55RdQqUkboVi2GRC3XrUDpbxakJmg1JAGmyUPYsCza+rkj37j2Frx1seIqWPiw==
X-Received: by 2002:a17:90b:4a81:: with SMTP id
 lp1mr10840882pjb.124.1634271083385; 
 Thu, 14 Oct 2021 21:11:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 35/67] target/riscv: Make riscv_cpu_tlb_fill sysemu only
Date: Thu, 14 Oct 2021 21:10:21 -0700
Message-Id: <20211015041053.2769193-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for riscv linux-user.

Remove the code from cpu_loop that raised SIGSEGV.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/riscv/cpu_loop.c |  7 -------
 target/riscv/cpu.c          |  2 +-
 target/riscv/cpu_helper.c   | 21 +--------------------
 3 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 9859a366e4..aef019b1c8 100644
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
index 1d69d1887e..2ab89a3f70 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -653,9 +653,9 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
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
index d41d5cd27c..b520d6fc78 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -748,7 +748,6 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                             riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(env, cs->exception_index, retaddr);
 }
-#endif /* !CONFIG_USER_ONLY */
 
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
@@ -756,7 +755,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-#ifndef CONFIG_USER_ONLY
     vaddr im_address;
     hwaddr pa = 0;
     int prot, prot2, prot_pmp;
@@ -888,25 +886,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
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


