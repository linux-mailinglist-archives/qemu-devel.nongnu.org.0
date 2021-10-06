Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207CA42454D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:53:10 +0200 (CEST)
Received: from localhost ([::1]:49330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYB6L-0001wQ-5x
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdg-0007H7-2K
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:32 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdd-0008BL-V7
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:31 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 cs11-20020a17090af50b00b0019fe3df3dddso4067627pjb.0
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LvK67GkX13tDj2L9Y8ql/Gd7bbn2JZgBQ3dF7lXKOxQ=;
 b=a/+8qjryT1V7Pz/U7KS1wQSJu55VCxPknNzrqBiHvt6H4Yr/wyy8DbxwRNgfhey6zg
 9X852WNNLRV7N646t60qzBKgKZRKEjgX+OuYU+5emHkFFdsZUFw3Zhq/plMZsGv2sLBR
 onoLpHnm/iU0EO5zmNofJOeKMVQb44/jWLv7w+pmmH+kMqOuNqm0/4YHhfqaBblUgMVJ
 NFnXJaEnclaKef6FQvwSazNaPG49hc26/BnpazXQSOT7pZ64zMgjcj+7qfz1sjDqExVK
 64xtFqQt/9ZC+2CQDg/KWSyVgC2OluAaOqNNU15s3m+1OKouPUj/iL8c9odPVCr4DveH
 +aBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LvK67GkX13tDj2L9Y8ql/Gd7bbn2JZgBQ3dF7lXKOxQ=;
 b=wdBkAZ35+ZTWIQkn8sOR8wJyS5IneTa/lP3Yhx2I7aaGsyH0xXgA2Y9m8w5tNUbG9p
 5QvGFu+usf++V2B3W/ddLS+DGha08rY+XtK77ycgv2O36cUq0xYtm0f/LhZOmTBh2Nfl
 LBtXrXwUFj8y1EV7w6RIrzung2+TMGTvIff3xp2WoVsoWVpsImlrcmpN64n5QZcgY6DS
 JQU8M8QUoQ955vMqrh83upHP2OrgpBi8NcS0WglCRppYZ8uwTolGGuRH1xN87LSIBz0c
 bjzzjCEffX35GU8sSBARMO2cZ6mmWEnDr1Muqm9m5lDUO87VggUuVMptEDqWVlzoG7mB
 yZew==
X-Gm-Message-State: AOAM5304OzhwtZci4dz25L0blfavKcWjuw6LodHGGp0ELhst3Kh+cgCo
 YIP/nkS+43MM718boMvcURdiXLf79KzDwQ==
X-Google-Smtp-Source: ABdhPJxFr+GW+ZroMmt5m3tWbM4Qyo3dYRwMxRuY24UAGcGSBEu06ZvzxOKrVAC9wnz8/ajzx8Mb1w==
X-Received: by 2002:a17:902:be0f:b0:13a:95e:a51 with SMTP id
 r15-20020a170902be0f00b0013a095e0a51mr12054218pls.44.1633541008686; 
 Wed, 06 Oct 2021 10:23:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/41] target/cris: Make cris_cpu_tlb_fill sysemu only
Date: Wed,  6 Oct 2021 10:22:50 -0700
Message-Id: <20211006172307.780893-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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


