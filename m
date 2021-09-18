Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F000F410845
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:04:51 +0200 (CEST)
Received: from localhost ([::1]:54850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfdr-0003CE-1e
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLm-0005IP-7F
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:10 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:35507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLb-0006xA-3o
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:09 -0400
Received: by mail-pg1-x533.google.com with SMTP id e7so13099560pgk.2
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yZsRnAbPNXmk9r6jQwi13vxXn5d80YjT3gRS7kzZYQg=;
 b=WmdVLLhxYmNfMaOGZHrEbsyNamF2DTSk/3y7jEKEvkeBqNWTBChMbaEnxeL/LG31Q4
 kzSNkf0u2De/SXZovJwB3v9pRE1xPhRxIIpL3G3g3KGX+vXDd/OfzOqtR3BgR4NgqGEz
 OoJavbt3MbN+Pe+WCbpmxPs8s+U7VI2JIPLoFQf3Z/PISohBNJ+XD+ipVYK7MheaERit
 SMFGnUsKCnMx+1Fyq7VH/jjHGCAnSjLM9hDzbirgNi5nANlsXz2q01PplWmHwZF0s6+p
 q3Us/53glIJAnMXrDxd6twD7rBR9lVUlP7tjlEwQSEj/Br/hlsx6Tz7KIJ+LjNEMbvlq
 bl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yZsRnAbPNXmk9r6jQwi13vxXn5d80YjT3gRS7kzZYQg=;
 b=zdVlJ8k/TKMoJUFn4jcZ7jT9tPyeV59C82k47VkDcqnu76CQZlnXIUoS6Z0F0gguGG
 N3rc9Htc2lFp3g9uaOL571BvqlVmqyKiahdLpJyMx3tjZ+JzQvmy8XH6gUxxNKkqnmYQ
 CFrCfVjBWCav1wWwvOOL43aiQEpKEBkw6GAtDzWRMos6382BihRLIf6a0OkW2wBr83cX
 JbgtEcS+7YLLDJIaJqcPHjwIoH6/UfYq0rK+xvvZSKBE9MVpVFrNBkIJ3L5IMrmfxlnj
 t5Vg9hqgp8r3IL2LP03+HaWRdryV1xKkQ6ExSxZPdvpqVdkzFXnP/13t/nxHTYaw8H61
 UhQg==
X-Gm-Message-State: AOAM531SIcFFki/EpXecStC4vUhAEOoCelwac0tkRKnP+D2QQorqxR/Q
 +9FYR6sBxWqgBLFgH0rOX9OhR4AaXMFZ4w==
X-Google-Smtp-Source: ABdhPJyP63/PlolCk+wq/h13pIiqOmflNiENF5AnIHF5JvInlwxTu7OCAF3XXunVHnXgBHorf4acxQ==
X-Received: by 2002:a62:1683:0:b0:3f3:814f:4367 with SMTP id
 125-20020a621683000000b003f3814f4367mr17481629pfw.68.1631990757698; 
 Sat, 18 Sep 2021 11:45:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 35/41] target/riscv: Make riscv_cpu_tlb_fill sysemu only
Date: Sat, 18 Sep 2021 11:45:21 -0700
Message-Id: <20210918184527.408540-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in raise_sigsegv is sufficient for riscv.
Remove the code from cpu_loop that raised SIGSEGV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/riscv/cpu_loop.c |  7 -------
 target/riscv/cpu.c          |  2 +-
 target/riscv/cpu_helper.c   | 21 +--------------------
 3 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 74a9628dc9..49fa2209a7 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -85,13 +85,6 @@ void cpu_loop(CPURISCVState *env)
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
index abb555a8bd..830e5b568f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -642,10 +642,10 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 static const struct TCGCPUOps riscv_tcg_ops = {
     .initialize = riscv_translate_init,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
-    .tlb_fill = riscv_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
     .has_work = riscv_cpu_has_work,
+    .tlb_fill = riscv_cpu_tlb_fill,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 701858d670..2260f95c79 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -747,7 +747,6 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                             riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(env, cs->exception_index, retaddr);
 }
-#endif /* !CONFIG_USER_ONLY */
 
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
@@ -755,7 +754,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-#ifndef CONFIG_USER_ONLY
     vaddr im_address;
     hwaddr pa = 0;
     int prot, prot2, prot_pmp;
@@ -887,25 +885,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
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


