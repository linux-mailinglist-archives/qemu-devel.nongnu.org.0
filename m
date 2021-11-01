Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437D5441FA8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:54:43 +0100 (CET)
Received: from localhost ([::1]:50754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbW6-0005Nj-E0
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6B-0003nt-5n
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:57 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:44931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb61-0000e4-AH
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:54 -0400
Received: by mail-qt1-x834.google.com with SMTP id j1so9299250qtq.11
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GxgKUblSc/AuTdeTrCoYEJS946D/KatMQ8ilg/nMD3U=;
 b=gTsi6l4g+0ho/KbOcFEBSdVMM2iTv+nKVO+AhSBroZGXyDIiZ3of7M8lc2p8xoTFkX
 /z4D+2fizBIxsuea8wRMHCiVpP0GOxHOSKLG0kvdq/QJPVxgozaDgG6oXj4o+hzUbWXg
 S8KnR6dvBlluYf+DTJvKDH3QW28efRmqBAok5PdF9EMfZrpSJqbi8lxeEBB2vxc7Exgs
 Kk1P7F88oGAsvGFdUsmj3HtaYiZ0EGM40O/Dup63tuL3Q02wjwe15XJqAvqD7k+EoNN7
 uLf5DXIUE5EdMFwu29XQwze0V9rLfAm89Yq/mC5/M8Teef0HqdA27iypXx5pQHkV2gbB
 SIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GxgKUblSc/AuTdeTrCoYEJS946D/KatMQ8ilg/nMD3U=;
 b=lgLmum1+yD1ox6Bzm/tO9odHHq7CA+MYmzcJauHqlYoVTDkHjd6quJLh5hDYj/vemH
 y3+4iDifdAVstkaDIzaHP6m74SfVAanVUhuTaP8zzPn1WZ8faPPISc9LEA34JfHoqsAi
 77LHkxCMu5vYsgUXCqlVTn7G9cOkNyRppHkIMosSaY4+oh0kTLF0/j2OqgZXAUfyw5Gv
 UO4QyuyCJcnF2i0kBfsm9zrB7GkdiHQSZk8WqNdbFbMzvlr6iHD4palcgHIrULaslTJv
 7uwEOkd/3iIytHYjf4rk4l/ShCH42NrwpOUctk7qJZL5JjOMSmEoFGlSU/81EW7cre8n
 Fbbg==
X-Gm-Message-State: AOAM5335vAkX6zMRK6BftKKNqazoQ0e2lfE2/eHsD1isTr5sLEgEEUQ6
 elaL6o1vtg3BsOCHsapKZQDDC86cQZm8yA==
X-Google-Smtp-Source: ABdhPJyVk+MXGIIjOTHTX9XFFTsToocO2hkya4PPdE/8zIFcWicVsabI0WpAkUVbTz/de74rLWgltg==
X-Received: by 2002:a05:622a:46:: with SMTP id
 y6mr31987990qtw.244.1635787664448; 
 Mon, 01 Nov 2021 10:27:44 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 23/60] target/arm: Implement arm_cpu_record_sigsegv
Date: Mon,  1 Nov 2021 13:26:52 -0400
Message-Id: <20211101172729.23149-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because of the complexity of setting ESR, continue to use
arm_deliver_fault.  This means we cannot remove the code
within cpu_loop that decodes EXCP_DATA_ABORT and
EXCP_PREFETCH_ABORT.

But using the new hook means that we don't have to do the
page_get_flags check manually, and we'll be able to restrict
the tlb_fill hook to sysemu later.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  |  6 ++++++
 target/arm/cpu.c        |  6 ++++--
 target/arm/cpu_tcg.c    |  6 ++++--
 target/arm/tlb_helper.c | 36 +++++++++++++++++++-----------------
 4 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3612107ab2..5a7aaf0f51 100644
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


