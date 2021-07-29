Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2628D3D9AA9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 02:57:52 +0200 (CEST)
Received: from localhost ([::1]:53754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uMx-0002qq-1K
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 20:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCW-00049X-7U
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:04 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCU-0002TH-Aa
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:03 -0400
Received: by mail-pl1-x635.google.com with SMTP id z3so3537043plg.8
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=79/BDVQB6iIHA8qtbmo8Z058Jh2Dn0Ccb3iPyejC9bY=;
 b=tEWbgDWR8eofMFVmZhKK3SuV9PmAn+At4HUIlJK5fP3xg4nQfkPr4riek11e1Hjao5
 s45wbaPpnUjcXmspC3fqOr6tZ5GWUFo0wqIGjH7vCUwgqL1QXCfo+Rhed51Nk2cZmUmn
 0w+gEgq3+Dssn2lDedmB6anQ4JZBoSvryn4wL432NOOfAOFVG40RuKjwJeULji3SYFhF
 0HRvYQJOT/Mss0Puscyk61SHxtz9lCzwMMIPaZVUtajVajCxop+G+BRqfFSkVyBrlj2W
 ufBBhXok/frSEpTzgJMjGoSx4dUebhka/Ey30tzgTtiTk/XPhIugaGiAeedcCYFagAqx
 36Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=79/BDVQB6iIHA8qtbmo8Z058Jh2Dn0Ccb3iPyejC9bY=;
 b=gHsvGmrVRjLoC7kYUz4+rjhKTPdxGhr9KW1PiAoClPYwWHlwmq9IcBcvY70B6tAUvn
 tGGIjj85t27AxGcv9uvtPs/+kRIQ9kUREhTv0BqwEQJjDARwNR9sfa9f2vzFSORn3hAT
 8vBkfFvD0npVa7tGr7PxntFMcTp02fqILmHwrX1A0mB7u/3Yq0V6Q7XvdZpFQXiod/7o
 1wJX8B3UJl98aWH1FSuVmE08faJis1f9pHPE1AzAbXal7jsFXrW0CCAy0xX9GZGeCvxR
 9Kqihm0n/A2PpE14x1YOanar/MsFcyecRuc2iRPKUj2urXkniVLnzyXKAGcSZ33l10rn
 0xlA==
X-Gm-Message-State: AOAM5336ooZbvgFUw/zdiM8a7gNPDJGgUqUb2vgUUL/WTpXS6CntCIZP
 PuW0AtBHmvk/kxDGwCMijIrYGSiHkkswEw==
X-Google-Smtp-Source: ABdhPJxbGs+Mu7JashMQqHSIvRzonhn7Ck24o1FmEAWrBd16W621rj/dDLtKmzf0oNxSnlvjCZY/6A==
X-Received: by 2002:a17:902:a9c7:b029:12b:349:b318 with SMTP id
 b7-20020a170902a9c7b029012b0349b318mr2132641plr.13.1627519620840; 
 Wed, 28 Jul 2021 17:47:00 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 09/43] target/riscv: Implement do_unaligned_access for
 user-only
Date: Wed, 28 Jul 2021 14:46:13 -1000
Message-Id: <20210729004647.282017-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-riscv@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/riscv/cpu_loop.c | 7 +++++++
 target/riscv/cpu.c          | 2 +-
 target/riscv/cpu_helper.c   | 8 +++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 74a9628dc9..0428140d86 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -92,6 +92,13 @@ void cpu_loop(CPURISCVState *env)
             sigcode = TARGET_SEGV_MAPERR;
             sigaddr = env->badaddr;
             break;
+        case RISCV_EXCP_INST_ADDR_MIS:
+        case RISCV_EXCP_LOAD_ADDR_MIS:
+        case RISCV_EXCP_STORE_AMO_ADDR_MIS:
+            signum = TARGET_SIGBUS;
+            sigcode = TARGET_BUS_ADRALN;
+            sigaddr = env->badaddr;
+            break;
         case RISCV_EXCP_SEMIHOST:
             env->gpr[xA0] = do_common_semihosting(cs);
             env->pc += 4;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 991a6bb760..591d17e62d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -644,11 +644,11 @@ static const struct TCGCPUOps riscv_tcg_ops = {
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .tlb_fill = riscv_cpu_tlb_fill,
+    .do_unaligned_access = riscv_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
-    .do_unaligned_access = riscv_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 968cb8046f..a440b2834f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -727,6 +727,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                             riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(&cpu->env, cs->exception_index, retaddr);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                    MMUAccessType access_type, int mmu_idx,
@@ -734,6 +735,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
+
     switch (access_type) {
     case MMU_INST_FETCH:
         cs->exception_index = RISCV_EXCP_INST_ADDR_MIS;
@@ -748,11 +750,15 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
         g_assert_not_reached();
     }
     env->badaddr = addr;
+
+#ifdef CONFIG_USER_ONLY
+    cpu_loop_exit_restore(cs, retaddr);
+#else
     env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(env, cs->exception_index, retaddr);
+#endif
 }
-#endif /* !CONFIG_USER_ONLY */
 
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
-- 
2.25.1


