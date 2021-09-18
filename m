Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E9441083F
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:02:37 +0200 (CEST)
Received: from localhost ([::1]:46218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfbg-0005ep-1I
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLj-0005Eb-2P
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:08 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLU-0006tG-DX
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:06 -0400
Received: by mail-pg1-x535.google.com with SMTP id k24so13081169pgh.8
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ACTRx2M3S4z/05kxGieMFxgHgCHNXfLhyJ3AhpLuew=;
 b=xCdM6xjQMJLP47IbmyIfhyHC1n6R9vqOD00J+JcDNAw6cTMIq926r8zR/78Am5BZPF
 uzT/IHXEe+zUMrVDmUqmLJOpyyfIslwyq0hgmR3SdB/SXzBA/5T/VYDpgdu2gGWDFp1s
 MtN+6FzwDJ33odnY2wHMpa0Uiw5XSlv13M9SGralQ0MQDknLJ1KIsTpnk86cVGN1gLow
 wlZc+kAUNHcy6q4pCJisxGHR0HR7EQYKf5TiAZMaenByuLi+rhecQ0+ulrXPoiJSsVYM
 tHB2PqrNIDY+qzqiR6XTICnxnwvcOuyTw3FuErfmWuy5VeerqDX/tTWTzTsppFJuoStf
 DBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ACTRx2M3S4z/05kxGieMFxgHgCHNXfLhyJ3AhpLuew=;
 b=XHtY2nM5KIQHMZEASrJKI2u+fDBSrSnlk7UbBw+mgt4TCfg8iMwm1o2A9oIEL9gF+W
 6azQdClAs/Z+VdKocv89nBzArlY/AYo5jKCyvC2L0UdLZMt+F9RgM6xyIySZVYuWBeFW
 ff1cj3ME1Al269eEhudsw827U7TwgkxQo6AOqa2Pi1GSVY7Aa+jfAa8H7oesV1FkaLao
 IfgzLt+YUzefXiILR31TodERp/sFjXrbZWe1lCz0mwJOg16UIr61Pm1wP6VfK3yItExL
 9EG+NBbjb3+YL6RyLF3Ji7Ucgz0anUscfta1GMg3fNpwGIpoAqawfE0lATgExILlgXuR
 s0wA==
X-Gm-Message-State: AOAM530xuN8lxejsL4Bx4mhktV+Q8jqAtKusDx0cC1wQ7+lh8T0+T+Fu
 SuVYZNmCDu3srb8lMN642WM/+oaoucLJHg==
X-Google-Smtp-Source: ABdhPJxffc64WJkGSVyIOHNp21Ydt8lQ2rtqxhxMOwpIWSjPi4i9oaunMtlFTpsC8FXjIB2kNmabgQ==
X-Received: by 2002:a62:1b92:0:b0:3eb:3f92:724 with SMTP id
 b140-20020a621b92000000b003eb3f920724mr17218868pfb.3.1631990747875; 
 Sat, 18 Sep 2021 11:45:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/41] target/arm: Implement arm_cpu_record_sigsegv
Date: Sat, 18 Sep 2021 11:45:09 -0700
Message-Id: <20210918184527.408540-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
index cd2ea8a388..480145b382 100644
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
index e11aa625a5..4fc01768ab 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2016,10 +2016,12 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
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
     .has_work = arm_cpu_has_work,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .do_interrupt = arm_cpu_do_interrupt,
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


