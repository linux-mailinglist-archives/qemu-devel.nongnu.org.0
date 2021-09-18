Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F00241084E
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:13:00 +0200 (CEST)
Received: from localhost ([::1]:51208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRflj-0002nD-Ho
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLf-0005D0-Q2
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:04 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:37439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLS-0006ts-Vi
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:00 -0400
Received: by mail-pg1-x536.google.com with SMTP id 17so13098847pgp.4
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yhN8ow8bafB9lvcE0BZaSXFoylrPitNEFmmVqtlA/N4=;
 b=t28LFLBBoCwttS/Xsn/H8Z9+uNlnEzbRSDN3S0d9ZoOOEEi2AmnrupLxJTTYpyeG2q
 Rd6fCBIqZkbl15zwrzgNsB/kcvG1ytYlp/lpS2jDdh1A3s9uaaaSS5v7BZBMQEbrMdAM
 7rl4sGMtQOOimiryyJ7aHmsHBDE8xJGwaNn19S5xBeflat+k0pGu7mEN3H2dvJPfWWTl
 /8idErSCwZ3w5K/Zs3EucKPtlKMD55ipH89m8u7nkasTX4+iVAVtVNvzuqpKh11y7UAz
 BuNyzNzMC9+1zWM6TMrMrUJ4Z07LoqcUkmQ+zXotlIEeX/7og/uPaZiDke/uiCodTNwz
 LJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yhN8ow8bafB9lvcE0BZaSXFoylrPitNEFmmVqtlA/N4=;
 b=K0kkcaNKQEvfOQjdpUFg0xvDn07B/lC51sYUBIhCFkSAAOKctYU/Pbq04RWiNaofOL
 nfF/KilqLi9bpGN1amIzMPqsrMa9DWYUcLpVOReRAc+vl83E1aJVo6xJ5O17E1HyXLc1
 7fOjoEwhX/Eled9fdIcYH/Gqmm23kjt6hFM8CnkiveBIv7CKXNT9YvfFu9hd6vjsJ/oq
 yXaI6bVvmX3IHgdq64sNqlJt/25w+sTG9B6TpduX8O8SV53O6Xb+gSOrfpcLyPhuPd17
 NKl6G3iWrC214QiTKO84MN1dH73Slp04T1BYcZ3RxTMw6jMheWIk1bjH7J27NIxvcRt9
 TQeA==
X-Gm-Message-State: AOAM531P/R26LXymrPgMk2+nT1WcEnSkgGrw60VUbeb80Bw68JASnY3a
 M1ZDOmsWQD/u05Zgpu/IKjdQergBc1nwUQ==
X-Google-Smtp-Source: ABdhPJxHDK4F1ckS2I/iGdTwZt6wgayV/88sJM6YYaFEMGOFE3bIVcgGvKXbQrO38KHgkYxYaEPx3w==
X-Received: by 2002:a05:6a00:1481:b0:43d:275b:7ba4 with SMTP id
 v1-20020a056a00148100b0043d275b7ba4mr17032200pfu.63.1631990748685; 
 Sat, 18 Sep 2021 11:45:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/41] target/cris: Make cris_cpu_tlb_fill sysemu only
Date: Sat, 18 Sep 2021 11:45:10 -0700
Message-Id: <20210918184527.408540-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

The fallback code in raise_sigsegv is sufficient for cris-linux-user.
Remove the code from cpu_loop that handled the unnamed 0xaa exception.

This makes all of the code in helper.c sysemu only, so remove the
ifdefs and move the file to cris_softmmu_ss.

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
index 334edddd1e..0de941c0b4 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -35,16 +35,6 @@ void cpu_loop(CPUCRISState *env)
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
index b9f30ba58f..b8ac1b9f25 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -207,10 +207,10 @@ static const struct SysemuCPUOps cris_sysemu_ops = {
 
 static const struct TCGCPUOps crisv10_tcg_ops = {
     .initialize = cris_initialize_crisv10_tcg,
-    .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
     .has_work = cris_cpu_has_work,
+    .tlb_fill = cris_cpu_tlb_fill,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = crisv10_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -218,9 +218,9 @@ static const struct TCGCPUOps crisv10_tcg_ops = {
 
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


