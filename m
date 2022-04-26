Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4928751072D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:36:41 +0200 (CEST)
Received: from localhost ([::1]:51612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQ3E-0002kA-Cg
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmW-0002Uh-94
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:24 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:41788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmR-0004LZ-Je
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:23 -0400
Received: by mail-pl1-x62f.google.com with SMTP id s14so30970204plk.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSluLj2R1JhZMB4God4i50Z4RRfFTHgwIiUmh8NzNww=;
 b=fde1Z+V5XxB01cD+oNTb0/2SxrK9fd0jvGAHA/DVDwHd4eNjMoEvNK2dy9wvLkIUfU
 H/iNBqcm25GLwkAd9WkmsBvcplZXPAFPyZ6ScQ0kiDOSOYqywSMO+XTzv0Mb8rKrBIQB
 V/xYOvOCAp4EBSPT53PedbZxN4dkZWY9Sc7tguR2tMnTChv1r2FHeY9o17dUHV7ffQHZ
 kZHKf4DddnkqEf+eGbb4ixRSYyOEtDyCUVpsgyyv+psqvW1BIBOxEOqmd8huGOrDG1pH
 ifNG/788GDX45sqAFveMqa49qYNaK2HikSEYTs/qfyMey+s6ditcc7lZ6tLLbQdwgz5k
 vvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSluLj2R1JhZMB4God4i50Z4RRfFTHgwIiUmh8NzNww=;
 b=7Z5toLJ0WVuQGnY8ejk8QKN88mgLI9Z6iEZfmA6N0SYQK8cwH0TEP1h9bg8Ouoakrt
 eDv/uAUiAvFypKTzGrtUXnUe61o9DHld5nB+VO1Lcs6bSZpjIbkLX6Q8VmRKm09RnMQk
 DvDjYxvzSiQBfzUi9zvC/nGw0YskxEkxZBdNX5iStCs3M4yIwyJWRrcs1j1xGQOCJ1e+
 DPDjfhuNHSmK7Qg53BbeAc2t+rOX/M0f05PwLDejBBRd8qrzt4D5XJWbi0qxeahw0Cof
 uSNMSYSQZD7UGMMufzaPO/5cegEPFE0pSlh0CiVvlLBWoqskZo+X86sDCLF2EigyofJA
 8Bcw==
X-Gm-Message-State: AOAM5300WLS4tcwi5mfu+1/94S0OEZ22dgv1kFv4T29s9RTRzG6bdHWx
 eui2cTdu01YyLM4M2RC0N8p6buxhYBoA3g==
X-Google-Smtp-Source: ABdhPJyTKbTF4LMsduYnCBuFbKkJq904q8e47thxAUZYsdm83jrLiv58Y5PQCBGg8Hz6eQt+fAFBIw==
X-Received: by 2002:a17:90b:3b4f:b0:1d2:7117:d758 with SMTP id
 ot15-20020a17090b3b4f00b001d27117d758mr39015938pjb.105.1650997157424; 
 Tue, 26 Apr 2022 11:19:17 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/68] target/nios2: Remove nios2_cpu_record_sigsegv
Date: Tue, 26 Apr 2022 11:18:09 -0700
Message-Id: <20220426181907.103691-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since f5ef0e518d0, we have a real page mapped for kuser,
which means the special casing for SIGSEGV can go away.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220421151735.31996-11-richard.henderson@linaro.org>
---
 target/nios2/cpu.h          |  6 +-----
 linux-user/nios2/cpu_loop.c | 10 ----------
 target/nios2/cpu.c          |  4 +---
 target/nios2/helper.c       | 14 +-------------
 4 files changed, 3 insertions(+), 31 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 1bab805bb0..3198c17213 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -216,11 +216,7 @@ static inline int cpu_mmu_index(CPUNios2State *env, bool ifetch)
                                                   MMU_SUPERVISOR_IDX;
 }
 
-#ifdef CONFIG_USER_ONLY
-void nios2_cpu_record_sigsegv(CPUState *cpu, vaddr addr,
-                              MMUAccessType access_type,
-                              bool maperr, uintptr_t ra);
-#else
+#ifndef CONFIG_USER_ONLY
 bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 2963fc62b4..f37850fe81 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -126,16 +126,6 @@ void cpu_loop(CPUNios2State *env)
             info.si_code = TARGET_TRAP_BRKPT;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
-        case 0xaa:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* TODO: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->regs[R_PC];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
-            break;
         default:
             EXCP_DUMP(env, "\nqemu: unhandled CPU exception %#x - aborting\n",
                      trapnr);
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index b0877cb39e..9774a3b8a4 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -210,9 +210,7 @@ static const struct SysemuCPUOps nios2_sysemu_ops = {
 static const struct TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
 
-#ifdef CONFIG_USER_ONLY
-    .record_sigsegv = nios2_cpu_record_sigsegv,
-#else
+#ifndef CONFIG_USER_ONLY
     .tlb_fill = nios2_cpu_tlb_fill,
     .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 678fd96c4e..55b8fb0bcb 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -28,19 +28,7 @@
 #include "exec/helper-proto.h"
 #include "semihosting/semihost.h"
 
-#if defined(CONFIG_USER_ONLY)
-
-void nios2_cpu_record_sigsegv(CPUState *cs, vaddr addr,
-                              MMUAccessType access_type,
-                              bool maperr, uintptr_t retaddr)
-{
-    /* FIXME: Disentangle kuser page from linux-user sigsegv handling. */
-    cs->exception_index = 0xaa;
-    cpu_loop_exit_restore(cs, retaddr);
-}
-
-#else /* !CONFIG_USER_ONLY */
-
+#if !defined(CONFIG_USER_ONLY)
 void nios2_cpu_do_interrupt(CPUState *cs)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
-- 
2.34.1


