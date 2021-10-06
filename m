Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B5C42457E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:59:14 +0200 (CEST)
Received: from localhost ([::1]:38330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYBCD-000504-84
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdj-0007M9-R3
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:35 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdh-0008El-7H
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:35 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 75so3105982pga.3
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/utnMsLyouv7LilvnHYZPxrZ8zRoC/jZ7xS1qGJE894=;
 b=eJ3F+2EWFkhOLkxW5JpspXgG0yPzTb1FezMy93EMio+r10EFnL1Rj+OGKj64h5yO7h
 56aOV1Bya3oGA1RT8/n8EuzXVncCFQKdn0J3xKhi9w+xQLPCt1s8j0htsW8cSKbpcoyE
 3CL2hAwS8DhbMwBn0gMlta2uiekHiGIw0XjOvBv2scKek5wIQR5ml8zGxxasTWLWVMCo
 NFf6v2zPVoZdIGo+qAmK6diTyLJMHYTaVzowqpyb/wMsl4Rx0dATQwDo8Ha8K5lgYxwm
 0NDFMOCCUOF7q4nNVTuocOJPUA8ey/Wpi2e/e1tiQz6ORla/5UEoCQxIP/d6yGXzSymt
 8JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/utnMsLyouv7LilvnHYZPxrZ8zRoC/jZ7xS1qGJE894=;
 b=GeQRl+Ipg0P+KtQvmttr7ajJ0h1MulGgA1uoe9vl/JWmRVF1v5+A3JHEhUNtiSsjsU
 1rcZLYdQBkTrYxy1UfeD08JnUJ7YGyQ6OH2KAoyIvQ0JIEd/CJSfTRhYiDU64hs367/R
 wAun+4D4lU4E+V5pX9DQAKQ4Y6Sh43GO3tY74MicuGZDdIgXX5zj5g9zMO5cLG/99OGT
 4bxECfcXjH+2sWi+AR4VxJkuM7CrV8Rv4dU//OuHoY2kZi3ndIS6nzAPHCqOn99ud7VD
 NT30rqSCer9CxkU+rK9XqBYSzY/eyURzBuY1hVyMZD85cnmCY8QUvnyir4yZ8DabM88R
 BpsQ==
X-Gm-Message-State: AOAM530p2LxVC/330QSFTV0K5P1+hLmxltI6na02qA5ApEXQeHi5z+po
 ia6De98pVwqUHXfj+rbc6+1iF+ujfUlLaw==
X-Google-Smtp-Source: ABdhPJzTG2LGPWlIn27k19ShoS2fOLQRZd9IwruPbBG9FegNuCeAbFlisqfJ3APHjosIp3IkLrjz4A==
X-Received: by 2002:a63:dc42:: with SMTP id f2mr21373260pgj.152.1633541011897; 
 Wed, 06 Oct 2021 10:23:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 28/41] target/m68k: Make m68k_cpu_tlb_fill sysemu only
Date: Wed,  6 Oct 2021 10:22:54 -0700
Message-Id: <20211006172307.780893-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for m68k linux-user.

Remove the code from cpu_loop that handled EXCP_ACCESS.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c | 10 ----------
 target/m68k/cpu.c          |  2 +-
 target/m68k/helper.c       |  6 +-----
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index ebf32be78f..790bd558c3 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -90,16 +90,6 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
-        case EXCP_ACCESS:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->mmu.ar;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
-            break;
         case EXCP_DEBUG:
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 66d22d1189..c7aeb7da9c 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -515,9 +515,9 @@ static const struct SysemuCPUOps m68k_sysemu_ops = {
 
 static const struct TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
-    .tlb_fill = m68k_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = m68k_cpu_tlb_fill,
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .do_interrupt = m68k_cpu_do_interrupt,
     .do_transaction_failed = m68k_cpu_transaction_failed,
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 137a3e1a3d..5728e48585 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -978,16 +978,12 @@ void m68k_set_irq_level(M68kCPU *cpu, int level, uint8_t vector)
     }
 }
 
-#endif
-
 bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType qemu_access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr)
 {
     M68kCPU *cpu = M68K_CPU(cs);
     CPUM68KState *env = &cpu->env;
-
-#ifndef CONFIG_USER_ONLY
     hwaddr physical;
     int prot;
     int access_type;
@@ -1051,12 +1047,12 @@ bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (!(access_type & ACCESS_STORE)) {
         env->mmu.ssw |= M68K_RW_040;
     }
-#endif
 
     cs->exception_index = EXCP_ACCESS;
     env->mmu.ar = address;
     cpu_loop_exit_restore(cs, retaddr);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 uint32_t HELPER(bitrev)(uint32_t x)
 {
-- 
2.25.1


