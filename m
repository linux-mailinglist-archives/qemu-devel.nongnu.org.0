Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E7441F38F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:48:20 +0200 (CEST)
Received: from localhost ([::1]:46046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMdw-0001pl-12
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5L-0005GN-Kq
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:35 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:43750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5D-0005MG-EI
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:35 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id k3so1358406qve.10
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QnIuy+UNML3N+Vecxph501fC1v8l7RElAhe1SJhJNCk=;
 b=rB07Vx0y2mdCo6zIZAeaa28kFsqoxZiliNPDUXMNiFPbWQcbvY45St3YZ4KoW5eLS4
 gx1qW7nQ+gEdocu06ws26EL9W2ccS4Cz+uNxpNJlgvpk1AxbfQkE70nX7IN7+mfNu+O/
 QMwkUs0I7q/nc10/F8dCf3WPHlketzxrYHhPKC0+eznOxKtPatZdghGBcjOgUJaphvLI
 RQ375tH+lUfoJsW71nZWwoPqP0lReMzQb4sQ1fjbkD2hZ2U5418QqJLEKoZET89DeKm8
 SsILiTfQKGGzUZyHa9bpDX2RyxLy6neQOnhp+JTBvPlXc5PaXBMU3RysqVgMZBsI3WTV
 w+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QnIuy+UNML3N+Vecxph501fC1v8l7RElAhe1SJhJNCk=;
 b=6Aeg554nPa7qADl9UBx4ZZxzxM8+tAeDEKwDbAZpiQuyA1DBKaNtztE+3thhhUphey
 0SVWR8Kbwpqyu7g3Xu71dmMKYVWrReZ3l/tI67P5ODxAHhiC+LpuptQheCTGiDoJKuNO
 iVQ+OOm/sPLUqgCQeI53VmmXHYv0+z40ViVEN+Uyx9uVzG3/grmVFVEAEb1H46fX4jzE
 VKGOVEYgSZBnl/AQKF17FjJbzfOQ2hC/6QpqF0psNB9P7/covLFdRfwb20GwIu09R4XB
 N3TI5nnaXkT12yb3pq1rMvZ7BqM7OrqSZQWS7wPijTMTyWIpoIIGvUVRRvQw8PLodnEp
 DDDw==
X-Gm-Message-State: AOAM532KnNaw+feu9S2G3LOW/+xaPztZ+EtmYthLx7R/INiZ4LlqAKs1
 9b5jAuy6h3cWfE1G8TIo4f8XNZbQWV5iGw==
X-Google-Smtp-Source: ABdhPJwpRouVfTFiU3SLhS8QbZynz436cvCsDqDE+sbo+TfAi9+5YmVQ5ok9XIPQ2hmKPvbAucHKuQ==
X-Received: by 2002:ad4:4652:: with SMTP id y18mr11349825qvv.2.1633108346370; 
 Fri, 01 Oct 2021 10:12:26 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 38/41] target/sh4: Make sh4_cpu_tlb_fill sysemu only
Date: Fri,  1 Oct 2021 13:11:48 -0400
Message-Id: <20211001171151.1739472-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in raise_sigsegv is sufficient for sh4.
Remove the code from cpu_loop that raised SIGSEGV.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/cpu.h          | 6 +++---
 linux-user/sh4/cpu_loop.c | 8 --------
 target/sh4/cpu.c          | 2 +-
 target/sh4/helper.c       | 9 +--------
 4 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index dc81406646..4cfb109f56 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -213,12 +213,12 @@ void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                     uintptr_t retaddr) QEMU_NORETURN;
 
 void sh4_translate_init(void);
+void sh4_cpu_list(void);
+
+#if !defined(CONFIG_USER_ONLY)
 bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr);
-
-void sh4_cpu_list(void);
-#if !defined(CONFIG_USER_ONLY)
 void superh_cpu_do_interrupt(CPUState *cpu);
 bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void cpu_sh4_invalidate_tlb(CPUSH4State *s);
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 65b8972e3c..ac9b01840c 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -65,14 +65,6 @@ void cpu_loop(CPUSH4State *env)
             info.si_code = TARGET_TRAP_BRKPT;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
-        case 0xa0:
-        case 0xc0:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info.si_code = TARGET_SEGV_MAPERR;
-            info._sifields._sigfault._addr = env->tea;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             arch_interrupt = false;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 2047742d03..06b2691dc4 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -236,9 +236,9 @@ static const struct SysemuCPUOps sh4_sysemu_ops = {
 static const struct TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
     .synchronize_from_tb = superh_cpu_synchronize_from_tb,
-    .tlb_fill = superh_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = superh_cpu_tlb_fill,
     .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .do_interrupt = superh_cpu_do_interrupt,
     .do_unaligned_access = superh_cpu_do_unaligned_access,
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 53cb9c3b63..6a620e36fc 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -796,8 +796,6 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr)
@@ -806,11 +804,6 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     CPUSH4State *env = &cpu->env;
     int ret;
 
-#ifdef CONFIG_USER_ONLY
-    ret = (access_type == MMU_DATA_STORE ? MMU_DTLB_VIOLATION_WRITE :
-           access_type == MMU_INST_FETCH ? MMU_ITLB_VIOLATION :
-           MMU_DTLB_VIOLATION_READ);
-#else
     target_ulong physical;
     int prot;
 
@@ -829,7 +822,6 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (ret != MMU_DTLB_MULTIPLE && ret != MMU_ITLB_MULTIPLE) {
         env->pteh = (env->pteh & PTEH_ASID_MASK) | (address & PTEH_VPN_MASK);
     }
-#endif
 
     env->tea = address;
     switch (ret) {
@@ -868,3 +860,4 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
     cpu_loop_exit_restore(cs, retaddr);
 }
+#endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


