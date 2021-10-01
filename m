Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2CC41F31E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:28:44 +0200 (CEST)
Received: from localhost ([::1]:59642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMKx-00062j-Ko
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5A-00057R-Jp
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:25 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:37663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM55-0005G4-91
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:24 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id o13so253958qvm.4
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G1HWedffqhycyxP8d2WDLOk4nPDaQm4JAuhJ0f230MI=;
 b=vQnMVrMdTud4hPh9849gToubme1/ecnkXnebmDninxdpRxb81tWN5nG/hXuOBHhpSr
 z1+ceETpmivgbRdOHyy9nmNf0/DZbRQqN4XpZ56rw5YOj9qvhvZZ11WaWrMGKsKaarIq
 Ptv8qMBJFYIrt9lk8xuYocf/IlIb9Vhtyxo3HjH6oKOdTMNFx14FGxGn1jkCpqYlMHU4
 25VVQ4c57kxvUmYupyKSvzcRBkQVQpjvPlZydpojt2xe3ZXaQllwItw6wtKCrK6lgd/z
 GZK6Vo98/JITUE9MxOGOAEItMsJHpRNe3qApxtxSm064QWZGpy/7PaWE68dm3yCcNwne
 sdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G1HWedffqhycyxP8d2WDLOk4nPDaQm4JAuhJ0f230MI=;
 b=QD9TlLUfduTeEZrP/EwsSQ+zORsqlgq1nppcNlXEOynzmWlJxmtzwwsI9r9mQjtHD1
 NScmXNtQjZxcHbDgiwt34PsIjuuDkCfr2+tojNj8xM6Uhx2UNLHoAUR1N2qjuXBg0TX0
 c2fyjrdCicFJjBsEkioo7zWj8pdDvHluGn/k5mZqeTcs9auwMyvZT3a3NvuCpPKw+LbV
 uFm2dxyVOxkn2pgL7ItL9qnkq8wttcfr/hkLXRiFJzwBwsQyjm+lkSNQZ2dVf75rUgv2
 n+UmFgQbzJuT2Q14fr99nrUDth0JxG+34DgwIxLeHHu4X3+KRU3Igsy6YbjNo96VT+rc
 1ynw==
X-Gm-Message-State: AOAM531lQjuUpU6uFAKp1nawyHxc3I+stjXabtL+2Iuhobtx73AcaqUf
 SD1Jc7Jj33cm+NYUqmr0MTH7TvQWrk7huw==
X-Google-Smtp-Source: ABdhPJxHU8fwlYKH7zeMVzfZQziyhlvCotkqVskyhdpdXL02vsdWYSFCcRgw3XFigB1IscIV7Ahevw==
X-Received: by 2002:a0c:b2c5:: with SMTP id d5mr10179990qvf.65.1633108338023; 
 Fri, 01 Oct 2021 10:12:18 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/41] target/m68k: Make m68k_cpu_tlb_fill sysemu only
Date: Fri,  1 Oct 2021 13:11:38 -0400
Message-Id: <20211001171151.1739472-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
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


