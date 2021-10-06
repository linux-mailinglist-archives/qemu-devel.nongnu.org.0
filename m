Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B944245C8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 20:13:24 +0200 (CEST)
Received: from localhost ([::1]:58500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYBPv-0002A0-ET
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 14:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdq-0007kB-DZ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:42 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdn-0008Jn-AJ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:42 -0400
Received: by mail-pf1-x42f.google.com with SMTP id c29so2984892pfp.2
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FGojKB1MhBg8jwsgkZLRwblMIZjIzT+Djmo8uocQA0s=;
 b=Nmc1a2nlu4MH+kSNTXuXZ+xGpUrf6RGu+SI+ocSPM6IqBHyCSagbRB1/m76W5HaxpG
 U6aqzMPlOS6lB7qAI1a1A0UR8c82rYcmZORVmBYHxXvNyulrT64LjOrflExrAU70zUeY
 PSD+jk4kQz8oagiDDQqR/DfS6VGKE+gUkjHU3t00DQWa7+xUiY2erXgl1CmwWHkvNCET
 wkKTCutQDz4aYKSmnbJfeFvFDk70pkjEjEC+08m1u8m0yPACKdfXfxYEwAgysVoJS/ti
 M+aX53to+xFS6cd5hRwXemEjQVqfBTFWTyfoKWReM2weV2/YRW+bWhjK8AEgP0XHv32F
 kyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FGojKB1MhBg8jwsgkZLRwblMIZjIzT+Djmo8uocQA0s=;
 b=F/uwW+hHV8Rx7B/rLYD1p8U7q0kTgPwYW0gtR8vAQQuTOGhTZUFNYB4mibtZPsenxb
 2gxKhag6r2FLB2CvHjdn6vG+obWehBLTc7l2a6PAQCjDf6GQz4vLe1r4dW3PX06xnS9z
 rA5RyB2dQibIgYhCZbk4RLGMdVPDiLGv8aIMMTP76cmhHA2ovJt2v3pyhSDh4cBEmc/+
 AqVNz0aCL06FYqr38RBfY/mOkBqvj9TLm7iJ6Mz8v0l8on2aRWoh5urL9KZvBkr+Y8Du
 XNVqVb8dbICsYeHqfs8ixt5drab8ryWyN8wHZ/FkBrVkGfn9lu9XZng5vV7ZZxc7OtHB
 ctkg==
X-Gm-Message-State: AOAM533YcTo3WBGhhYEEFvxC/kO5Rx9dpyoK4XmAF0oCq2Rr/SqpKZFW
 FV6+mZ/uNtLZWFsjhRMtz18LrQQIsXmTdw==
X-Google-Smtp-Source: ABdhPJzA9d6UmJGva4HEhEDBMpYDUjSCgqWDBUjgLzsgHl21ka6z+5wGyexN4DDTKmSsrlw++KxFIA==
X-Received: by 2002:a05:6a00:1801:b0:44c:aab8:a5ba with SMTP id
 y1-20020a056a00180100b0044caab8a5bamr2999357pfa.32.1633541017930; 
 Wed, 06 Oct 2021 10:23:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 35/41] target/riscv: Make riscv_cpu_tlb_fill sysemu only
Date: Wed,  6 Oct 2021 10:23:01 -0700
Message-Id: <20211006172307.780893-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for riscv linux-user.

Remove the code from cpu_loop that raised SIGSEGV.

Cc: qemu-riscv@nongnu.org
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
index 7c626d89cd..0292a72feb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -675,9 +675,9 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
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


