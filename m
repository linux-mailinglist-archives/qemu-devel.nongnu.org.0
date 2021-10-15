Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA2642E7E4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:32:16 +0200 (CEST)
Received: from localhost ([::1]:33030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEtD-00012T-CN
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEZ2-0007Nm-LJ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:24 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:44931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYu-0000Li-Op
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:23 -0400
Received: by mail-pf1-x42f.google.com with SMTP id v8so3157975pfu.11
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LvK67GkX13tDj2L9Y8ql/Gd7bbn2JZgBQ3dF7lXKOxQ=;
 b=OInV1vFi/5JfHTupLob/xkMvp2vXB14v82QmIc1vo9SGBFpSFkgfOald66VQVhZTgO
 F+4AKVuA6CbjhvvNYPnvz/n95Hs+YqqhNX7Y75z7YR1ZcXTfyvQ/ETVf1YuqrqP8BcbC
 MXZr0FkkzTUwdfUt5TIys9pWtvFw27hKT3QEMDAX2Kjf1jYH5Uq1dvF10HKsBg5yB73x
 wm6qpqx3hfpPdi5FigzxtHoN6ReCaF1/LEbdnDP0fzyDHuQ4msKgYMY+Gv+tAHlnVDtV
 EQg8XbAc/V/lV64fDh/IKxG8h73D4r0fs0Mn7WVCO78OwG8auvXBhXdVebcso3FXifGb
 f39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LvK67GkX13tDj2L9Y8ql/Gd7bbn2JZgBQ3dF7lXKOxQ=;
 b=GuGQ/szDAba612Jx0uHYiAdtlhaFdydrEZKVxBZqfw8K60j9DJZaU2JlU1xJFwtscR
 IgIg37xXIaZHEGr+KmtT3MaGX2Q0n5WlJn7wL9K5C3nOYl/0xFB7zErAdUm6E2GlvG/h
 f4aomritytf8SdzpeLslFul7coFUAiJLr1vmSqf1f9lw7mQk5et8AUq9ncNpclDNCFua
 7X7tfqKqzb+BRY6GBq4YIpr4TeNGnbrEpgA1CY6EuNAbYHdQuDXxbp2UWdxoaWxDpamh
 cXNyss9f1OMLambqIsXyXdmUZJNqv+NBocGhyHULqyDKr26wLiBbhZODVVKE0JSiLOkM
 0zHA==
X-Gm-Message-State: AOAM530kQEa9yrf5WqlXcFlxNl7+Cptl/U9XuiJ7iGDeOZRjPJPrX4R8
 QcO4biNGWAGa6joJFmu+S0BDrnV7wf9pMA==
X-Google-Smtp-Source: ABdhPJzjcC/GeGPHyEqZa+81JGmEVHO/SebwMRqz2izTfw5Gq/CW11NbwAScDrlKXUnBfzMs4mz7qQ==
X-Received: by 2002:a63:e741:: with SMTP id j1mr7429435pgk.86.1634271075199;
 Thu, 14 Oct 2021 21:11:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 24/67] target/cris: Make cris_cpu_tlb_fill sysemu only
Date: Thu, 14 Oct 2021 21:10:10 -0700
Message-Id: <20211015041053.2769193-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com,
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


