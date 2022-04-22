Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5851850BDEF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:06:17 +0200 (CEST)
Received: from localhost ([::1]:49490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwjY-0004yl-EP
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWk-0000dj-OT
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:02 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWj-0007FB-3Z
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:02 -0400
Received: by mail-pl1-x630.google.com with SMTP id j8so12078909pll.11
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSluLj2R1JhZMB4God4i50Z4RRfFTHgwIiUmh8NzNww=;
 b=RLCp3TyZ1hCaxWgxWbV6hCtRSnxxyWMNkMRcY6H0qaB+S9Lv8hTX6TPOyJ7W1SgFPK
 KPz3CCCg3tt1qZE2pVTP9tajSRGmQWy5vXm/Rkw+ONT0n/EFVXIn9ZxoWHIzHOlNbAxT
 ZinDvGC64Im4kg4Ft8Z9jSmHJw3k/eduyxZKVKssqnbH3ExX9Ky1yaEWmbRUNGrKTxmk
 tG5Dohf5Vrfh7g+xoyM1y+yWCBvadHdn7PNul6FCVVvEOhKyAcrhX896medVBsxM+ytA
 jqUl9DPFL7tJZzmj+tP9e9EDBNz6HzPZ280OiwJYWETJBukw3gcIMA2DftRVwbmrDfDB
 ujmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSluLj2R1JhZMB4God4i50Z4RRfFTHgwIiUmh8NzNww=;
 b=M60UvroaEYys9eVcKQKPdJ+51DLCkkTcP+wcAobNlNK/3SgsPUHBaZ29X6CsRTOJt5
 24DAElxlRA3h1iuUQR1zCXS/bJqHsZ8il+I2Ut4qbkEpPruLsoMjGr/CR3Sv7erTxBna
 ++7prVWLoDZHyVg0wG2exdYt0htkv/PoZn0OyLZs34J8m5PruXEDSSIMaHFdhxMndk5p
 4deVZI5LvCIOxIt3k50rqLcuxj37XB9Cl74zPkBsZ/eJr/EqkZeqBz3lNQeMOEtY8I3U
 FIqlvYqIx7Uun/Ji0pxyFKbITPgNXNIR9lJ6fTam2LIa3q3MjnUvr+iqZwmKw6P3C2t4
 xOVg==
X-Gm-Message-State: AOAM532VLGjOvvt/3WUtPcqevoMTsrTHiZZ5O7beIq8a/33t/83CzXHe
 pPUhubCx65b1djqJdCCf2GcCgr1jIIG521jA
X-Google-Smtp-Source: ABdhPJwSbos9AYRKDKgpJ/9/49ORYRRhxdIJDJE28pKzrsIZ/Jc/Tuci+LuatVSAN6Qn0p4hCewBkQ==
X-Received: by 2002:a17:903:120c:b0:154:c135:60d3 with SMTP id
 l12-20020a170903120c00b00154c13560d3mr5526141plh.48.1650646378707; 
 Fri, 22 Apr 2022 09:52:58 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:52:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 10/68] target/nios2: Remove nios2_cpu_record_sigsegv
Date: Fri, 22 Apr 2022 09:51:40 -0700
Message-Id: <20220422165238.1971496-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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


