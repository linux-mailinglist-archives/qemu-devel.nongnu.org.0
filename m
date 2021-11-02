Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B15D442CA0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:32:37 +0100 (CET)
Received: from localhost ([::1]:57784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhs1s-0000O0-DB
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreE-0003p8-Dw
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:10 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:35365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhre1-0000vG-De
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:00 -0400
Received: by mail-qk1-x72d.google.com with SMTP id az8so8035235qkb.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GxgKUblSc/AuTdeTrCoYEJS946D/KatMQ8ilg/nMD3U=;
 b=WUrOCNn0Fx8p9K2qnWZBibRuOakp5G4qvXPzOV1zMD688l/Ab5LA2oa+LW5QIDxGC/
 mPwkuHDBEfKAEpXTzA6h1uPepGaK0qQ1rIzX5nMzgvfNxPEr99xQCZBCUcvOc6mWWYgb
 xm2IQSa08xmgStfgcdyt3nMYmtyVHNxnkA6gRCU7dHbCqE83WYigbL9AynGDM9uLTOBo
 kF3zrJIdjOuxRq7cW/6wI/0lO50cRvuIJ+YUGhPPNJu+0vV/Y0yhes/jRvLjRdt8gGYS
 XZChZi7Rh/B1UhzvyYOPyqtlq5kc/k9lMA/vwixW0qU/rh6ORG6jx7qDwCN4Feh9aW+Z
 Ho0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GxgKUblSc/AuTdeTrCoYEJS946D/KatMQ8ilg/nMD3U=;
 b=IYzQOguO9H4ZONGVApP3HYVuJsByIZ8rfJpsOMCnjwLywDMaMmrAUcMJ9RMRHdCiYE
 zO3ty8geSbON5ikoFxzxRzU2zG9II9VUVCbH48VZTwuiDxLGiKFxAUqWMsx2OD+LcEih
 IcZ1piY3uxXVGAEzyPJgpWesYBzBUj5xAdQU530LhRbrR7kONtzOTAaphoOAcBjjdO/o
 Zr13KFhe1E/gxaoIh5IV722W5sBxZQTjIHOqpL26ZMpSsp2rj4o9q98mW6Mwdb7ZpYwp
 8OE6JY0q9RRI90/EW8Xn4dH5KHf95X79Ic29d+J+K/sTQ3jYzndsA/IRlEtlKYwaz7FV
 QWRA==
X-Gm-Message-State: AOAM531Pye0Z0bxB6bH7qipOBhyqXE9hDZ2gJDHESCgBpQips16HFh8n
 F5+6zn3qomXV3GwQQp+g45nejhMx59rUkg==
X-Google-Smtp-Source: ABdhPJwqAH/JVEzkdwIJDwS9BqByijqk8BTil4TIWxO3y0kRK6IHYbYNLK65/48zoT9YTPuc3X/D4Q==
X-Received: by 2002:a05:620a:29c8:: with SMTP id
 s8mr11398713qkp.250.1635851275098; 
 Tue, 02 Nov 2021 04:07:55 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/60] target/arm: Implement arm_cpu_record_sigsegv
Date: Tue,  2 Nov 2021 07:07:03 -0400
Message-Id: <20211102110740.215699-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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


