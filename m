Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3480B442D45
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:55:07 +0100 (CET)
Received: from localhost ([::1]:51220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsNe-0000sw-BN
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreI-0003zs-1W
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:14 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:34316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreE-0000wo-5V
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:13 -0400
Received: by mail-qk1-x72a.google.com with SMTP id bq14so7748215qkb.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zhmoQq400LN3ckB+F14vIMLu76bali80G5XXiJl040k=;
 b=s7z92tkrpD5ANgAjV7xHrKJzN/K/FoYKYHN7E4lZ+D1NIaWRGjQ5pjvzpe69ObJZAE
 q5RwsOpV2waT/rOqhPEbAbNKQlqCRqNhOIiwVc6kdViOXMdHnwgwoMC4AZ9W5cgdDJhO
 oKMvkWY9uDQIktTLRq5326MAIVYrmdVGQwb/CXtMgL6S0wOxcBc7KqpihJjP6MLAZ7uF
 j4+mDCcTuT7IixIeKMlZeGRP95DneoOppEpt6ne9Bn/ItzS5uxb+KwPlQZMNcHmbunbs
 0Jl48Ad61v1cQk7ZRqAEAZZSYmduZwW/NCq4lU49GR+zgA0kbPOpbeh2BApAdL/6OhrA
 bpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zhmoQq400LN3ckB+F14vIMLu76bali80G5XXiJl040k=;
 b=4mcQhs3c58b/cI/wZyQap+U4efND6qATmOW14fMjb3ScpMEV5PQUEXeO3QXTZhv0Lc
 VwpPqcKUhxy1MGKUdxunoLszBLE/DaDgQg33fynUEH7AAIYQXLU5vTU6H154GRZhS9Ez
 CRQUdRPeY+9o3h0TCY6e0A7IUwqSHuTj6y3//cDXOpzt1ms+v0S1imCLZD+aQtnfbaT0
 q/8eycJAdPirBrxcir9VID6z+5Vur3ZC8KjEMVCKyUlmEYBG4IkLKxFdPwzrWonob9lU
 /CtWjBbHBUmHOs4ixolRkdfsfDv9jlnsKtZjDwx9G4uxLTUK2QgZ+lLN8eXK0e0pTH6Q
 6Lvw==
X-Gm-Message-State: AOAM533u3NHmSFdzHtS+WvRhsoq1BmZV5wtrx84Y3bFuRwxX4K9jl2LL
 9qxH21cCNQ3xfgIGuzT+SnigGqT96ibcoA==
X-Google-Smtp-Source: ABdhPJzNgBem2uvTVztCAXMZkuoQYdtacQNI06VWOICMzFcVz8bymdrLvkyPDSrj3QSMnmo6VDsLmg==
X-Received: by 2002:a05:620a:430a:: with SMTP id
 u10mr28923554qko.53.1635851279857; 
 Tue, 02 Nov 2021 04:07:59 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/60] target/nios2: Implement nios2_cpu_record_sigsegv
Date: Tue,  2 Nov 2021 07:07:11 -0400
Message-Id: <20211102110740.215699-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because the linux-user kuser page handling is currently implemented
by detecting magic addresses in the unnamed 0xaa trap, we cannot
simply remove nios2_cpu_tlb_fill and rely on the fallback code.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h    | 6 ++++++
 target/nios2/cpu.c    | 6 ++++--
 target/nios2/helper.c | 7 ++++---
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index a80587338a..1a69ed7a49 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -218,9 +218,15 @@ static inline int cpu_mmu_index(CPUNios2State *env, bool ifetch)
                                                   MMU_SUPERVISOR_IDX;
 }
 
+#ifdef CONFIG_USER_ONLY
+void nios2_cpu_record_sigsegv(CPUState *cpu, vaddr addr,
+                              MMUAccessType access_type,
+                              bool maperr, uintptr_t ra);
+#else
 bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
+#endif
 
 static inline int cpu_interrupts_enabled(CPUNios2State *env)
 {
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 58ecd27d75..4cade61e93 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -216,9 +216,11 @@ static const struct SysemuCPUOps nios2_sysemu_ops = {
 
 static const struct TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
-    .tlb_fill = nios2_cpu_tlb_fill,
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    .record_sigsegv = nios2_cpu_record_sigsegv,
+#else
+    .tlb_fill = nios2_cpu_tlb_fill,
     .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
     .do_unaligned_access = nios2_cpu_do_unaligned_access,
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 53be8398e9..e5c98650e1 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -38,10 +38,11 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     env->regs[R_EA] = env->regs[R_PC] + 4;
 }
 
-bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                        MMUAccessType access_type, int mmu_idx,
-                        bool probe, uintptr_t retaddr)
+void nios2_cpu_record_sigsegv(CPUState *cs, vaddr addr,
+                              MMUAccessType access_type,
+                              bool maperr, uintptr_t retaddr)
 {
+    /* FIXME: Disentangle kuser page from linux-user sigsegv handling. */
     cs->exception_index = 0xaa;
     cpu_loop_exit_restore(cs, retaddr);
 }
-- 
2.25.1


