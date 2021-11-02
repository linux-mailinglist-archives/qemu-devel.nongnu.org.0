Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8D5442CC8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:37:54 +0100 (CET)
Received: from localhost ([::1]:47146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhs70-0003f5-20
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreL-00044k-3k
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:23 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:36559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreF-0000vq-Eb
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:16 -0400
Received: by mail-qk1-x731.google.com with SMTP id i9so18687388qki.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LvK67GkX13tDj2L9Y8ql/Gd7bbn2JZgBQ3dF7lXKOxQ=;
 b=gBpQ1oV8q/Q3dM/FYthNAV8jBglSIh6QLVTeeb5sSRQifJmVXZuiXmw6GpFs1I6h2Y
 F9BxRgViHB+cF6t53Vk2c2Z1QiB+KR73y1nlxogRuws1nYByCyBj9RxsonXnwYKEowWk
 VgalnV9xfVVUOPS4mw+/hXWy9t7IOWLj8LaED80cfw1aXcqhYtg1/RSjkvigCJR/NvvC
 29SRYFThH2QBkqr6UZAjuvJsigojilwE0NVTxZeGM0tdXKYrt8whcBenBMv9KbWo4d5M
 mwLwajmhyYlZQoQrg9tMMaXSTvo/3v+G07l5tgRJyakoduyrX2GRQpZjfLh+jZf04BbF
 5Kcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LvK67GkX13tDj2L9Y8ql/Gd7bbn2JZgBQ3dF7lXKOxQ=;
 b=stU5rfbXbC9WDgszwHSAtYGMExXMew2zDP6MgLmY1TUlC5/Q7PJjhEcSiSdX9hSodK
 AqP/F5fQiFrBEnURGA5Dqq4n+Pr0pbO3QgNNxZ4/5cu2eTKWx1lwMk5yn35rNlR74sy4
 HlJ6HVegl8yApCJoSY0ADAyWryvrnGnkozfghWEMnBDao1Is4G1rddH99W3jZ6Ur3DEX
 93zJF7QYMbz+d1IaMlcVonBknqZMnkNE36e/wJ6TEaWp64CBYi7HPC1edlrmG4bT7p6K
 p/rYvx68M1XsoPuI7DFQKbPSEnyeOgUqlNR6KPMMqJrbe8if7//6Xl9TgutybT3gaFBa
 AJ0w==
X-Gm-Message-State: AOAM531bnneoMrS0M6Ibz8ld/Px36TIar7mjYuYI0awvnkMQtsQBwyJe
 7ejycLZ4gBb4gpTzkYNM3+y2RW1oXTzjjw==
X-Google-Smtp-Source: ABdhPJxg+WSQyoHM8P6JA3GYqqa2l4DlsX7tDaylTG23YXFzWAUJ1szitmFnpOGEjXkZkiDANX5aXg==
X-Received: by 2002:a05:620a:4008:: with SMTP id
 h8mr21744249qko.253.1635851275678; 
 Tue, 02 Nov 2021 04:07:55 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/60] target/cris: Make cris_cpu_tlb_fill sysemu only
Date: Tue,  2 Nov 2021 07:07:04 -0400
Message-Id: <20211102110740.215699-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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

The fallback code in cpu_loop_exit_sigsegv is sufficient
for cris linux-user.

Remove the code from cpu_loop that handled the unnamed 0xaa exception.
This makes all of the code in helper.c sysemu only, so remove the
ifdefs and move the file to cris_softmmu_ss.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/cpu.h          |  8 ++++----
 linux-user/cris/cpu_loop.c | 10 ----------
 target/cris/cpu.c          |  4 ++--
 target/cris/helper.c       | 18 ------------------
 target/cris/meson.build    |  7 +++++--
 5 files changed, 11 insertions(+), 36 deletions(-)

diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index 6603565f83..b445b194ea 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -189,6 +189,10 @@ extern const VMStateDescription vmstate_cris_cpu;
 void cris_cpu_do_interrupt(CPUState *cpu);
 void crisv10_cpu_do_interrupt(CPUState *cpu);
 bool cris_cpu_exec_interrupt(CPUState *cpu, int int_req);
+
+bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool probe, uintptr_t retaddr);
 #endif
 
 void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);
@@ -251,10 +255,6 @@ static inline int cpu_mmu_index (CPUCRISState *env, bool ifetch)
 	return !!(env->pregs[PR_CCS] & U_FLAG);
 }
 
-bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool probe, uintptr_t retaddr);
-
 /* Support function regs.  */
 #define SFR_RW_GC_CFG      0][0
 #define SFR_RW_MM_CFG      env->pregs[PR_SRS]][0
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index b9085619c4..0d5d268609 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -37,16 +37,6 @@ void cpu_loop(CPUCRISState *env)
         process_queued_cpu_work(cs);
 
         switch (trapnr) {
-        case 0xaa:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->pregs[PR_EDA];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
-            break;
         case EXCP_INTERRUPT:
           /* just indicate that signals should be handled asap */
           break;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index c2e7483f5b..ed6c781342 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -205,9 +205,9 @@ static const struct SysemuCPUOps cris_sysemu_ops = {
 
 static const struct TCGCPUOps crisv10_tcg_ops = {
     .initialize = cris_initialize_crisv10_tcg,
-    .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = cris_cpu_tlb_fill,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = crisv10_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -215,9 +215,9 @@ static const struct TCGCPUOps crisv10_tcg_ops = {
 
 static const struct TCGCPUOps crisv32_tcg_ops = {
     .initialize = cris_initialize_tcg,
-    .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = cris_cpu_tlb_fill,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = cris_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/cris/helper.c b/target/cris/helper.c
index 36926faf32..a0d6ecdcd3 100644
--- a/target/cris/helper.c
+++ b/target/cris/helper.c
@@ -39,22 +39,6 @@
 #define D_LOG(...) do { } while (0)
 #endif
 
-#if defined(CONFIG_USER_ONLY)
-
-bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool probe, uintptr_t retaddr)
-{
-    CRISCPU *cpu = CRIS_CPU(cs);
-
-    cs->exception_index = 0xaa;
-    cpu->env.pregs[PR_EDA] = address;
-    cpu_loop_exit_restore(cs, retaddr);
-}
-
-#else /* !CONFIG_USER_ONLY */
-
-
 static void cris_shift_ccs(CPUCRISState *env)
 {
     uint32_t ccs;
@@ -304,5 +288,3 @@ bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
     return ret;
 }
-
-#endif /* !CONFIG_USER_ONLY */
diff --git a/target/cris/meson.build b/target/cris/meson.build
index 67c3793c85..c1e326d950 100644
--- a/target/cris/meson.build
+++ b/target/cris/meson.build
@@ -2,13 +2,16 @@ cris_ss = ss.source_set()
 cris_ss.add(files(
   'cpu.c',
   'gdbstub.c',
-  'helper.c',
   'op_helper.c',
   'translate.c',
 ))
 
 cris_softmmu_ss = ss.source_set()
-cris_softmmu_ss.add(files('mmu.c', 'machine.c'))
+cris_softmmu_ss.add(files(
+  'helper.c',
+  'machine.c',
+  'mmu.c',
+))
 
 target_arch += {'cris': cris_ss}
 target_softmmu_arch += {'cris': cris_softmmu_ss}
-- 
2.25.1


