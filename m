Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D3C50A4C4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:56:30 +0200 (CEST)
Received: from localhost ([::1]:35198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZAT-0000id-HH
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZA-00074e-Fa
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:56 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ8-0006Eq-Pu
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:56 -0400
Received: by mail-pf1-x432.google.com with SMTP id y14so4517670pfe.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mRXh6kle+5JC3fg5GhdP1NKq046Rc6qP/+3/3QkWOfw=;
 b=tdnXFdByOKfeykxmj7FK+DSQqtgi1bzP8sk3P7sc8TsV/ldx340CZVAs0R7WuVnucG
 Z7ENJ2YP3qtnIp7wULTfYsJ0IeLufWLWtapBImYmzSubMhPso9uAcJPS1U3bZVsiiLfW
 wIOltH07Ew3ASsaPSs/x9c/UWGBJKAIlaN7/Dr6hYi2IqXwd+DAnjXUgz6XIsb5MNw5L
 AW3w1rHJVR3NErxgI0SGNEFB91mAcqstE7clSGi/109ruCl9WiH3Dyr+zwAoKc2dwsUH
 3k2iPmtyJWF4Jx+Spxoa5HXCQjwH+oz88AtbvOuAJt0dxAEtR3kLzqtlruALOhmSQzYU
 9EFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mRXh6kle+5JC3fg5GhdP1NKq046Rc6qP/+3/3QkWOfw=;
 b=1dIkvqmm3focVetiKQ2e5SC+QEfQOhD4YGoibRbqoLKRMTPqBBqZH6yzJcl6hZ2zzT
 EXgrvMWPTmjXK7PjsoOzLP9uAsViSGOxA/DIU83I7jqpT6QUPQ/DHcTzYNz07mNqrzeM
 23E9kauibb2aF7eX5ijR5xirmYx7SkGrjVPynBg1lKfYoRCpY9l1/j0/BX6t1m9+p0js
 6H2Ki/A15LeK4GXnHL1LcFYy8oxCnWufHw5qHV9T9Rgopd5u/Tx1k2n22K1lD+MK8cf1
 CIse1sDyZNJ99ymCusboaoyfyeOcJmIBWDD8KJYqFFRN4CjSy85s+B+1mfQAXT6jUspL
 faGg==
X-Gm-Message-State: AOAM533fwqWrYk+KN79AIzcQL2GL8i5T5jbMA8JDjH76+id7ipWSRJd9
 7tridQBC7OP012q85fmF0aFzMgBzvoSiNw==
X-Google-Smtp-Source: ABdhPJxQehvd9tiBF9HNhs0WZ+nt/Vjs6+K64U4Ga4BP+OHdzCpwRD2gbTACqo7b3+XbyGM2xqYiHg==
X-Received: by 2002:a65:52cc:0:b0:3a9:fd44:1d7 with SMTP id
 z12-20020a6552cc000000b003a9fd4401d7mr18211024pgp.211.1650554273514; 
 Thu, 21 Apr 2022 08:17:53 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.17.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/64] target/nios2: Remove nios2_cpu_record_sigsegv
Date: Thu, 21 Apr 2022 08:16:41 -0700
Message-Id: <20220421151735.31996-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since f5ef0e518d0, we have a real page mapped for kuser,
which means the special casing for SIGSEGV can go away.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h          |  6 +-----
 linux-user/nios2/cpu_loop.c | 10 ----------
 target/nios2/cpu.c          |  4 +---
 target/nios2/helper.c       | 14 +-------------
 4 files changed, 3 insertions(+), 31 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index ca0f3420cd..7b75641788 100644
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


