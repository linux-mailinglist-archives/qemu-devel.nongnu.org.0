Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F67E41F3A0
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:51:46 +0200 (CEST)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMhF-0008Mu-5M
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM53-000524-VG
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:17 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:36495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM50-00059w-7j
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:17 -0400
Received: by mail-qt1-x834.google.com with SMTP id l13so9640208qtv.3
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MEdAv6cRA9BBhR4lgddgtqkvjCOWQwmTeigzGsiVe00=;
 b=c2/PCTGmxFAl0TLyzDRB7+HZIZysaWYlbZ+OuKovOl7lPsrCRxIrsz1Vac6AGvWSe1
 KI3bwazbDzCYiaYVtE6le0ouZUeZkJ/WT4y3HTcS4sTsIqJEsEBjLkMpa5UKt4ewUQib
 0plFN5JOozU5lzzMoTQ2+RBSAz2OFxaQoNU+rQxvaAhOM+j7sQws6UfdHOyiciKwcU/J
 ux3a9V8Y2sobCRr3e+XG7v4CWbKQGI6oJxRAqL8q65TdAzvp2MA7x1kviVJYSDBDlYWO
 dwWZ4LnwFE+v2F7aiLGh8sguiNBW5YWfidvdtKZKwxsgQXvqoCN81iFDHVzyjtXwZ6MZ
 fdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MEdAv6cRA9BBhR4lgddgtqkvjCOWQwmTeigzGsiVe00=;
 b=RzEqLCDXVNsyR1Nay3skI4qdZ0Wbq+KXdJqaLnv3xRfGrKyYBsrqhAs1oMr1LrOwdF
 V2gYUTIGgwxYLTomfpiXydYxBPd5hWPw+D+tc2Iw3qknt6urXQ77Z8z4Gd0GqHIAjCQO
 S0zeamA1hUr7xsddgJewEnWD4Q1/lCJU0jV4iFUc815zjwY2ybhEPHycaIHmxmF1eH2j
 WfsuH5nvuVEsnJXimc7F9X4Jv+V00Ku+T7zH7nKdjwrlmw05jVQ3zf7ShrCL1GJyMGmg
 6IT+f76RZL3YM9EmwvffxFI40f2Ks64sQilHBX1yrtN0xsLLu16cuCMQXJZno8ByX41o
 YRGw==
X-Gm-Message-State: AOAM531KQyB3BxauSF08VU63Zqd506wkQXYSGiLyURzxXor7ggXy2Fsr
 yPmsJuKmmqUBkbAXHw3auyH1xRUBdKiuyQ==
X-Google-Smtp-Source: ABdhPJxNpruzr96ElwLGZAdAKitmgpXuG+7zQ4BXiqapMUIIqyCIgRH6+QjyBg21sWdjdDEg2I2MVw==
X-Received: by 2002:a05:622a:181d:: with SMTP id
 t29mr14136633qtc.337.1633108333357; 
 Fri, 01 Oct 2021 10:12:13 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/41] target/arm: Implement arm_cpu_record_sigsegv
Date: Fri,  1 Oct 2021 13:11:33 -0400
Message-Id: <20211001171151.1739472-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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

Because of the complexity of setting ESR, continue to use
arm_deliver_fault.  This means we cannot remove the code
within cpu_loop that decodes EXCP_DATA_ABORT and
EXCP_PREFETCH_ABORT.

But using the new hook means that we don't have to do the
page_get_flags check manually, and we'll be able to restrict
the tlb_fill hook to sysemu later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  |  6 ++++++
 target/arm/cpu.c        |  6 ++++--
 target/arm/cpu_tcg.c    |  6 ++++--
 target/arm/tlb_helper.c | 36 +++++++++++++++++++-----------------
 4 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9fbb364968..984c84d27e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -544,9 +544,15 @@ static inline bool arm_extabort_type(MemTxResult result)
     return result != MEMTX_DECODE_ERROR;
 }
 
+#ifdef CONFIG_USER_ONLY
+void arm_cpu_record_sigsegv(CPUState *cpu, vaddr addr,
+                            MMUAccessType access_type,
+                            bool maperr, uintptr_t ra);
+#else
 bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr);
+#endif
 
 static inline int arm_to_core_mmu_idx(ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 641a8c2d3d..7a18a58ca0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2031,10 +2031,12 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
 static const struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
-    .tlb_fill = arm_cpu_tlb_fill,
     .debug_excp_handler = arm_debug_excp_handler,
 
-#if !defined(CONFIG_USER_ONLY)
+#ifdef CONFIG_USER_ONLY
+    .record_sigsegv = arm_cpu_record_sigsegv,
+#else
+    .tlb_fill = arm_cpu_tlb_fill,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 0d5adccf1a..7b3bea2fbb 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -898,10 +898,12 @@ static void pxa270c5_initfn(Object *obj)
 static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
-    .tlb_fill = arm_cpu_tlb_fill,
     .debug_excp_handler = arm_debug_excp_handler,
 
-#if !defined(CONFIG_USER_ONLY)
+#ifdef CONFIG_USER_ONLY
+    .record_sigsegv = arm_cpu_record_sigsegv,
+#else
+    .tlb_fill = arm_cpu_tlb_fill,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .do_interrupt = arm_v7m_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 3107f9823e..dc5860180f 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -147,28 +147,12 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     arm_deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
 }
 
-#endif /* !defined(CONFIG_USER_ONLY) */
-
 bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     ARMMMUFaultInfo fi = {};
-
-#ifdef CONFIG_USER_ONLY
-    int flags = page_get_flags(useronly_clean_ptr(address));
-    if (flags & PAGE_VALID) {
-        fi.type = ARMFault_Permission;
-    } else {
-        fi.type = ARMFault_Translation;
-    }
-    fi.level = 3;
-
-    /* now we have a real cpu fault */
-    cpu_restore_state(cs, retaddr, true);
-    arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
-#else
     hwaddr phys_addr;
     target_ulong page_size;
     int prot, ret;
@@ -210,5 +194,23 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         cpu_restore_state(cs, retaddr, true);
         arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
     }
-#endif
 }
+#else
+void arm_cpu_record_sigsegv(CPUState *cs, vaddr addr,
+                            MMUAccessType access_type,
+                            bool maperr, uintptr_t ra)
+{
+    ARMMMUFaultInfo fi = {
+        .type = maperr ? ARMFault_Translation : ARMFault_Permission,
+        .level = 3,
+    };
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    /*
+     * We report both ESR and FAR to signal handlers.
+     * For now, it's easiest to deliver the fault normally.
+     */
+    cpu_restore_state(cs, ra, true);
+    arm_deliver_fault(cpu, addr, access_type, MMU_USER_IDX, &fi);
+}
+#endif /* !defined(CONFIG_USER_ONLY) */
-- 
2.25.1


