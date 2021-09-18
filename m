Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA7410856
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:22:09 +0200 (CEST)
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfua-0007jS-22
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLl-0005Go-GD
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:09 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLW-0006wT-6h
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:09 -0400
Received: by mail-pl1-x630.google.com with SMTP id bb10so8391305plb.2
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J7hXQMffuuyXWpRCyuYJCpC7YHlZqNroGTBaJ0dICLY=;
 b=HmaQDaZ6OpxXZdCaSbmOznChge+x9N6Xx4Q/cATmhLf92uiWRSMFIshPAK3oYfVpsJ
 7froXKEsUXT9bPzbXW+GgSGNvWZsT952zmVytnRDYDj7roxKGZLjUUysiztrxdN4/MNW
 /J4sroFSVX7kqfEXfilTbR1Y0vaes7ouYvNtmGucusrjDdSnexZrazew60xEXvYydbUG
 Uq9cC3w+UFC3hu88L9YVNs3tYuiuluqUY+FhSyB2/t/99WkDuzet6ozl+R/1kwWhD4t3
 MdeTmqW5znUkW/7tAmgm5DIF5rNEbgXT0Vu10+rlN/iT5n6ZvlxOkgvE0PQtCFdzQ5jX
 scyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J7hXQMffuuyXWpRCyuYJCpC7YHlZqNroGTBaJ0dICLY=;
 b=ohGms0BuY043sIapSLsuk7QEVern/lqsYRT4fsMjIR7s5KzqiZIFjAmWPq4Hh/mtET
 kvyd9jALiu7kPcnMf2K+uaqCORd02+VYl9gUTYhgYHt9xc/I0vWJUJEuxGwyeXz550on
 4IexkMqMH2qN1GwJ4P4kDD0+gUEZ/++VGE0qz1M0CHwTYJg88hUuWPsNlr4JhOVc6UKR
 TfTUR7W0NX4Kuuo426REPPkyYrKBDIwRDiyb2Mc+IDwyQ6hjm96fZDKKRouEg9z3IYIl
 CD+ThcAH8hOVt2igDxNmCY8wdZG+LQ/Es7IdNP9RiEojqZ7/+RYmZXU+i6/+3lXTVuPV
 IR8A==
X-Gm-Message-State: AOAM533IPe7mQJOHWQHQ3FjrBRhHXNgtXAHi3IeBgsPEfSs1vK95MAPc
 2nLxQjiGk9VUAjSUol3ZT0t8Hay5HEXd9w==
X-Google-Smtp-Source: ABdhPJzfuk2Jcc2LuEmau5l+/gm9fvlIJtgQUj1vdMlg7Vo/O9ESubg3su5pb3lY39jfoKT++OWKxw==
X-Received: by 2002:a17:90b:3e84:: with SMTP id
 rj4mr14300361pjb.208.1631990751974; 
 Sat, 18 Sep 2021 11:45:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/41] target/m68k: Make m68k_cpu_tlb_fill sysemu only
Date: Sat, 18 Sep 2021 11:45:14 -0700
Message-Id: <20210918184527.408540-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

The fallback code in raise_sigsegv is sufficient for m68k-linux-user.
Remove the code from cpu_loop that handled EXCP_ACCESS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c | 10 ----------
 target/m68k/cpu.c          |  2 +-
 target/m68k/helper.c       |  6 +-----
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index c7a500b58c..7d106aa86e 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -88,16 +88,6 @@ void cpu_loop(CPUM68KState *env)
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
index ad5d26b5c9..94b7fc90e8 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -517,10 +517,10 @@ static const struct SysemuCPUOps m68k_sysemu_ops = {
 
 static const struct TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
-    .tlb_fill = m68k_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
     .has_work = m68k_cpu_has_work,
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


