Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BA9339AAC
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:02:44 +0100 (CET)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKsfz-0000iY-AS
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdo-000719-9t
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:28 -0500
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:43912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdk-0003Lp-8v
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:27 -0500
Received: by mail-qk1-x733.google.com with SMTP id b130so26276908qkc.10
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AY33bvhRAO2gM02jn6+LJdwP80pyHHRM7rF6JxFdsYA=;
 b=zabczsyOxwbAjuc2rpcQIgdr758Va97gj3Yt0J2l0nCrfixutM7TxoUb3GRevegoku
 +Iet4xcox2x1qG4gBxmArR8ouk1lVukhrxGGHI05MVY6y6hyTN+P2fAqgdYEFIkwI4LA
 LPLXpxKR1qwDSw5Uw+zuHSEWlGN2Owv/DNHCBSGBCY6PNq/9WF2qi6DbFsXqmSs6Fqau
 O1yxfvJhNB8xepa0tZ8dcpvjq1eNc1LguGz+sh/iM+bNKB9emEAY0Udo0dS8JJA5b9R9
 y/ugTcECM62JQaMhdVuLlcPZETUiN71JDi8XrKjuUezk5STIaIWs/nMO3qcN1BwCLyXA
 6lhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AY33bvhRAO2gM02jn6+LJdwP80pyHHRM7rF6JxFdsYA=;
 b=LAdq0UHRHC+oV1MPmmXG29M6CLVx+fHe+Q9jPxdF5YWFg09Slpeb5FZHtO6ynuR65q
 vlf2yAEa+S+DHI3fWyDGHQHpGb8CAiVgeNlNF4G7X0aEcPfk8dMc0INDYR6m+HWPxqBF
 dwmc2v+MDsIFdKETj/QnFZe+7K/YsVkbJK7RL47lZ5foDfBPrM+iLkEJoFfKoz1yXlF6
 L8PUV4rpecakVgd7mCLwR6kNeehMkOjykjRrkrA94+b4zMf3e7Em6CqJhKBKGVeDWoHV
 3cEg7m5rF3FS6ChB5YsTb8Z2UnkfPLcBiOcmziHt6UfyW61fhag3MHOQM0KrLuu1Gmkq
 UGPg==
X-Gm-Message-State: AOAM532SKnHBXe1wCmtLV64xVCvGif8XwhGhBNtnn1j2jPC99VCpmRw9
 U6vLFT2NhO2cHE+ZPo7oPTSzhyU09ZFHZeWw
X-Google-Smtp-Source: ABdhPJxBJWRQzkVtSMYtbPUOKsRFcdlIlJm21rphr7YyJbEjP8e8s8WQ4Y3HCVhtEDYKKDnV7r14iA==
X-Received: by 2002:a37:a192:: with SMTP id
 k140mr15298135qke.278.1615597222690; 
 Fri, 12 Mar 2021 17:00:22 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l129sm5602078qkd.76.2021.03.12.17.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 17:00:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/15] target/ppc: Move helper_regs.h functions out-of-line
Date: Fri, 12 Mar 2021 19:00:04 -0600
Message-Id: <20210313010018.819153-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313010018.819153-1-richard.henderson@linaro.org>
References: <20210313010018.819153-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the functions to a new file, helper_regs.c.

Note int_helper.c was relying on helper_regs.h to
indirectly include qemu/log.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper_regs.h | 184 ++----------------------------------
 target/ppc/helper_regs.c | 197 +++++++++++++++++++++++++++++++++++++++
 target/ppc/int_helper.c  |   1 +
 target/ppc/meson.build   |   1 +
 4 files changed, 207 insertions(+), 176 deletions(-)
 create mode 100644 target/ppc/helper_regs.c

diff --git a/target/ppc/helper_regs.h b/target/ppc/helper_regs.h
index efcc903427..4148a442b3 100644
--- a/target/ppc/helper_regs.h
+++ b/target/ppc/helper_regs.h
@@ -20,184 +20,16 @@
 #ifndef HELPER_REGS_H
 #define HELPER_REGS_H
 
-#include "qemu/main-loop.h"
-#include "exec/exec-all.h"
-#include "sysemu/kvm.h"
+void hreg_swap_gpr_tgpr(CPUPPCState *env);
+void hreg_compute_mem_idx(CPUPPCState *env);
+void hreg_compute_hflags(CPUPPCState *env);
+void cpu_interrupt_exittb(CPUState *cs);
+int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv);
 
-/* Swap temporary saved registers with GPRs */
-static inline void hreg_swap_gpr_tgpr(CPUPPCState *env)
-{
-    target_ulong tmp;
-
-    tmp = env->gpr[0];
-    env->gpr[0] = env->tgpr[0];
-    env->tgpr[0] = tmp;
-    tmp = env->gpr[1];
-    env->gpr[1] = env->tgpr[1];
-    env->tgpr[1] = tmp;
-    tmp = env->gpr[2];
-    env->gpr[2] = env->tgpr[2];
-    env->tgpr[2] = tmp;
-    tmp = env->gpr[3];
-    env->gpr[3] = env->tgpr[3];
-    env->tgpr[3] = tmp;
-}
-
-static inline void hreg_compute_mem_idx(CPUPPCState *env)
-{
-    /*
-     * This is our encoding for server processors. The architecture
-     * specifies that there is no such thing as userspace with
-     * translation off, however it appears that MacOS does it and some
-     * 32-bit CPUs support it. Weird...
-     *
-     *   0 = Guest User space virtual mode
-     *   1 = Guest Kernel space virtual mode
-     *   2 = Guest User space real mode
-     *   3 = Guest Kernel space real mode
-     *   4 = HV User space virtual mode
-     *   5 = HV Kernel space virtual mode
-     *   6 = HV User space real mode
-     *   7 = HV Kernel space real mode
-     *
-     * For BookE, we need 8 MMU modes as follow:
-     *
-     *  0 = AS 0 HV User space
-     *  1 = AS 0 HV Kernel space
-     *  2 = AS 1 HV User space
-     *  3 = AS 1 HV Kernel space
-     *  4 = AS 0 Guest User space
-     *  5 = AS 0 Guest Kernel space
-     *  6 = AS 1 Guest User space
-     *  7 = AS 1 Guest Kernel space
-     */
-    if (env->mmu_model & POWERPC_MMU_BOOKE) {
-        env->immu_idx = env->dmmu_idx = msr_pr ? 0 : 1;
-        env->immu_idx += msr_is ? 2 : 0;
-        env->dmmu_idx += msr_ds ? 2 : 0;
-        env->immu_idx += msr_gs ? 4 : 0;
-        env->dmmu_idx += msr_gs ? 4 : 0;
-    } else {
-        env->immu_idx = env->dmmu_idx = msr_pr ? 0 : 1;
-        env->immu_idx += msr_ir ? 0 : 2;
-        env->dmmu_idx += msr_dr ? 0 : 2;
-        env->immu_idx += msr_hv ? 4 : 0;
-        env->dmmu_idx += msr_hv ? 4 : 0;
-    }
-}
-
-static inline void hreg_compute_hflags(CPUPPCState *env)
-{
-    target_ulong hflags_mask;
-
-    /* We 'forget' FE0 & FE1: we'll never generate imprecise exceptions */
-    hflags_mask = (1 << MSR_VR) | (1 << MSR_AP) | (1 << MSR_SA) |
-        (1 << MSR_PR) | (1 << MSR_FP) | (1 << MSR_SE) | (1 << MSR_BE) |
-        (1 << MSR_LE) | (1 << MSR_VSX) | (1 << MSR_IR) | (1 << MSR_DR);
-    hflags_mask |= (1ULL << MSR_CM) | (1ULL << MSR_SF) | MSR_HVB;
-    hreg_compute_mem_idx(env);
-    env->hflags = env->msr & hflags_mask;
-    /* Merge with hflags coming from other registers */
-    env->hflags |= env->hflags_nmsr;
-}
-
-static inline void cpu_interrupt_exittb(CPUState *cs)
-{
-    if (!kvm_enabled()) {
-        return;
-    }
-
-    if (!qemu_mutex_iothread_locked()) {
-        qemu_mutex_lock_iothread();
-        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
-        qemu_mutex_unlock_iothread();
-    } else {
-        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
-    }
-}
-
-static inline int hreg_store_msr(CPUPPCState *env, target_ulong value,
-                                 int alter_hv)
-{
-    int excp;
-#if !defined(CONFIG_USER_ONLY)
-    CPUState *cs = env_cpu(env);
-#endif
-
-    excp = 0;
-    value &= env->msr_mask;
-#if !defined(CONFIG_USER_ONLY)
-    /* Neither mtmsr nor guest state can alter HV */
-    if (!alter_hv || !(env->msr & MSR_HVB)) {
-        value &= ~MSR_HVB;
-        value |= env->msr & MSR_HVB;
-    }
-    if (((value >> MSR_IR) & 1) != msr_ir ||
-        ((value >> MSR_DR) & 1) != msr_dr) {
-        cpu_interrupt_exittb(cs);
-    }
-    if ((env->mmu_model & POWERPC_MMU_BOOKE) &&
-        ((value >> MSR_GS) & 1) != msr_gs) {
-        cpu_interrupt_exittb(cs);
-    }
-    if (unlikely((env->flags & POWERPC_FLAG_TGPR) &&
-                 ((value ^ env->msr) & (1 << MSR_TGPR)))) {
-        /* Swap temporary saved registers with GPRs */
-        hreg_swap_gpr_tgpr(env);
-    }
-    if (unlikely((value >> MSR_EP) & 1) != msr_ep) {
-        /* Change the exception prefix on PowerPC 601 */
-        env->excp_prefix = ((value >> MSR_EP) & 1) * 0xFFF00000;
-    }
-    /*
-     * If PR=1 then EE, IR and DR must be 1
-     *
-     * Note: We only enforce this on 64-bit server processors.
-     * It appears that:
-     * - 32-bit implementations supports PR=1 and EE/DR/IR=0 and MacOS
-     *   exploits it.
-     * - 64-bit embedded implementations do not need any operation to be
-     *   performed when PR is set.
-     */
-    if (is_book3s_arch2x(env) && ((value >> MSR_PR) & 1)) {
-        value |= (1 << MSR_EE) | (1 << MSR_DR) | (1 << MSR_IR);
-    }
-#endif
-    env->msr = value;
-    hreg_compute_hflags(env);
-#if !defined(CONFIG_USER_ONLY)
-    if (unlikely(msr_pow == 1)) {
-        if (!env->pending_interrupts && (*env->check_pow)(env)) {
-            cs->halted = 1;
-            excp = EXCP_HALTED;
-        }
-    }
-#endif
-
-    return excp;
-}
-
-#if !defined(CONFIG_USER_ONLY)
-static inline void check_tlb_flush(CPUPPCState *env, bool global)
-{
-    CPUState *cs = env_cpu(env);
-
-    /* Handle global flushes first */
-    if (global && (env->tlb_need_flush & TLB_NEED_GLOBAL_FLUSH)) {
-        env->tlb_need_flush &= ~TLB_NEED_GLOBAL_FLUSH;
-        env->tlb_need_flush &= ~TLB_NEED_LOCAL_FLUSH;
-        tlb_flush_all_cpus_synced(cs);
-        return;
-    }
-
-    /* Then handle local ones */
-    if (env->tlb_need_flush & TLB_NEED_LOCAL_FLUSH) {
-        env->tlb_need_flush &= ~TLB_NEED_LOCAL_FLUSH;
-        tlb_flush(cs);
-    }
-}
-#else
+#ifdef CONFIG_USER_ONLY
 static inline void check_tlb_flush(CPUPPCState *env, bool global) { }
+#else
+void check_tlb_flush(CPUPPCState *env, bool global);
 #endif
 
 #endif /* HELPER_REGS_H */
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
new file mode 100644
index 0000000000..5e18232b84
--- /dev/null
+++ b/target/ppc/helper_regs.c
@@ -0,0 +1,197 @@
+/*
+ *  PowerPC emulation special registers manipulation helpers for qemu.
+ *
+ *  Copyright (c) 2003-2007 Jocelyn Mayer
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "exec/exec-all.h"
+#include "sysemu/kvm.h"
+#include "helper_regs.h"
+
+/* Swap temporary saved registers with GPRs */
+void hreg_swap_gpr_tgpr(CPUPPCState *env)
+{
+    target_ulong tmp;
+
+    tmp = env->gpr[0];
+    env->gpr[0] = env->tgpr[0];
+    env->tgpr[0] = tmp;
+    tmp = env->gpr[1];
+    env->gpr[1] = env->tgpr[1];
+    env->tgpr[1] = tmp;
+    tmp = env->gpr[2];
+    env->gpr[2] = env->tgpr[2];
+    env->tgpr[2] = tmp;
+    tmp = env->gpr[3];
+    env->gpr[3] = env->tgpr[3];
+    env->tgpr[3] = tmp;
+}
+
+void hreg_compute_mem_idx(CPUPPCState *env)
+{
+    /*
+     * This is our encoding for server processors. The architecture
+     * specifies that there is no such thing as userspace with
+     * translation off, however it appears that MacOS does it and some
+     * 32-bit CPUs support it. Weird...
+     *
+     *   0 = Guest User space virtual mode
+     *   1 = Guest Kernel space virtual mode
+     *   2 = Guest User space real mode
+     *   3 = Guest Kernel space real mode
+     *   4 = HV User space virtual mode
+     *   5 = HV Kernel space virtual mode
+     *   6 = HV User space real mode
+     *   7 = HV Kernel space real mode
+     *
+     * For BookE, we need 8 MMU modes as follow:
+     *
+     *  0 = AS 0 HV User space
+     *  1 = AS 0 HV Kernel space
+     *  2 = AS 1 HV User space
+     *  3 = AS 1 HV Kernel space
+     *  4 = AS 0 Guest User space
+     *  5 = AS 0 Guest Kernel space
+     *  6 = AS 1 Guest User space
+     *  7 = AS 1 Guest Kernel space
+     */
+    if (env->mmu_model & POWERPC_MMU_BOOKE) {
+        env->immu_idx = env->dmmu_idx = msr_pr ? 0 : 1;
+        env->immu_idx += msr_is ? 2 : 0;
+        env->dmmu_idx += msr_ds ? 2 : 0;
+        env->immu_idx += msr_gs ? 4 : 0;
+        env->dmmu_idx += msr_gs ? 4 : 0;
+    } else {
+        env->immu_idx = env->dmmu_idx = msr_pr ? 0 : 1;
+        env->immu_idx += msr_ir ? 0 : 2;
+        env->dmmu_idx += msr_dr ? 0 : 2;
+        env->immu_idx += msr_hv ? 4 : 0;
+        env->dmmu_idx += msr_hv ? 4 : 0;
+    }
+}
+
+void hreg_compute_hflags(CPUPPCState *env)
+{
+    target_ulong hflags_mask;
+
+    /* We 'forget' FE0 & FE1: we'll never generate imprecise exceptions */
+    hflags_mask = (1 << MSR_VR) | (1 << MSR_AP) | (1 << MSR_SA) |
+        (1 << MSR_PR) | (1 << MSR_FP) | (1 << MSR_SE) | (1 << MSR_BE) |
+        (1 << MSR_LE) | (1 << MSR_VSX) | (1 << MSR_IR) | (1 << MSR_DR);
+    hflags_mask |= (1ULL << MSR_CM) | (1ULL << MSR_SF) | MSR_HVB;
+    hreg_compute_mem_idx(env);
+    env->hflags = env->msr & hflags_mask;
+    /* Merge with hflags coming from other registers */
+    env->hflags |= env->hflags_nmsr;
+}
+
+void cpu_interrupt_exittb(CPUState *cs)
+{
+    if (!kvm_enabled()) {
+        return;
+    }
+
+    if (!qemu_mutex_iothread_locked()) {
+        qemu_mutex_lock_iothread();
+        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
+        qemu_mutex_unlock_iothread();
+    } else {
+        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
+    }
+}
+
+int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
+{
+    int excp;
+#if !defined(CONFIG_USER_ONLY)
+    CPUState *cs = env_cpu(env);
+#endif
+
+    excp = 0;
+    value &= env->msr_mask;
+#if !defined(CONFIG_USER_ONLY)
+    /* Neither mtmsr nor guest state can alter HV */
+    if (!alter_hv || !(env->msr & MSR_HVB)) {
+        value &= ~MSR_HVB;
+        value |= env->msr & MSR_HVB;
+    }
+    if (((value >> MSR_IR) & 1) != msr_ir ||
+        ((value >> MSR_DR) & 1) != msr_dr) {
+        cpu_interrupt_exittb(cs);
+    }
+    if ((env->mmu_model & POWERPC_MMU_BOOKE) &&
+        ((value >> MSR_GS) & 1) != msr_gs) {
+        cpu_interrupt_exittb(cs);
+    }
+    if (unlikely((env->flags & POWERPC_FLAG_TGPR) &&
+                 ((value ^ env->msr) & (1 << MSR_TGPR)))) {
+        /* Swap temporary saved registers with GPRs */
+        hreg_swap_gpr_tgpr(env);
+    }
+    if (unlikely((value >> MSR_EP) & 1) != msr_ep) {
+        /* Change the exception prefix on PowerPC 601 */
+        env->excp_prefix = ((value >> MSR_EP) & 1) * 0xFFF00000;
+    }
+    /*
+     * If PR=1 then EE, IR and DR must be 1
+     *
+     * Note: We only enforce this on 64-bit server processors.
+     * It appears that:
+     * - 32-bit implementations supports PR=1 and EE/DR/IR=0 and MacOS
+     *   exploits it.
+     * - 64-bit embedded implementations do not need any operation to be
+     *   performed when PR is set.
+     */
+    if (is_book3s_arch2x(env) && ((value >> MSR_PR) & 1)) {
+        value |= (1 << MSR_EE) | (1 << MSR_DR) | (1 << MSR_IR);
+    }
+#endif
+    env->msr = value;
+    hreg_compute_hflags(env);
+#if !defined(CONFIG_USER_ONLY)
+    if (unlikely(msr_pow == 1)) {
+        if (!env->pending_interrupts && (*env->check_pow)(env)) {
+            cs->halted = 1;
+            excp = EXCP_HALTED;
+        }
+    }
+#endif
+
+    return excp;
+}
+
+#ifndef CONFIG_USER_ONLY
+void check_tlb_flush(CPUPPCState *env, bool global)
+{
+    CPUState *cs = env_cpu(env);
+
+    /* Handle global flushes first */
+    if (global && (env->tlb_need_flush & TLB_NEED_GLOBAL_FLUSH)) {
+        env->tlb_need_flush &= ~TLB_NEED_GLOBAL_FLUSH;
+        env->tlb_need_flush &= ~TLB_NEED_LOCAL_FLUSH;
+        tlb_flush_all_cpus_synced(cs);
+        return;
+    }
+
+    /* Then handle local ones */
+    if (env->tlb_need_flush & TLB_NEED_LOCAL_FLUSH) {
+        env->tlb_need_flush &= ~TLB_NEED_LOCAL_FLUSH;
+        tlb_flush(cs);
+    }
+}
+#endif
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 429de28494..a44c2d90ea 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -22,6 +22,7 @@
 #include "internal.h"
 #include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
+#include "qemu/log.h"
 #include "exec/helper-proto.h"
 #include "crypto/aes.h"
 #include "fpu/softfloat.h"
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index bbfef90e08..4079d01ee3 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -6,6 +6,7 @@ ppc_ss.add(files(
   'excp_helper.c',
   'fpu_helper.c',
   'gdbstub.c',
+  'helper_regs.c',
   'int_helper.c',
   'mem_helper.c',
   'misc_helper.c',
-- 
2.25.1


