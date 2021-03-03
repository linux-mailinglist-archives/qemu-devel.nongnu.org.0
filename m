Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA1432BD00
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:11:20 +0100 (CET)
Received: from localhost ([::1]:47742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZiB-0003wt-9P
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:11:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMp-0006bF-CC; Wed, 03 Mar 2021 16:49:15 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMn-0002bV-GO; Wed, 03 Mar 2021 16:49:15 -0500
Received: by mail-wm1-x329.google.com with SMTP id n22so6339041wmc.2;
 Wed, 03 Mar 2021 13:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S715M+675Z0PbXHD9I+O0NRlMeoHb9x2yw8235n4aD4=;
 b=DNtWkruqQxMBHcQBamIrB4xsS7MiGaAHrAuEuSs5YOzzpdCnZZm7sKSNOXBWI5liGW
 H2lDY0QTTk+AyiIejw1ZHVZJlLHGPtQ9o/o3k8LwkPNwIO4cVZZSDE519gmSckUlxsDf
 tr53Ze5OuSq4JewiMuHpFs6rIGKIXGCNLIgcsQLwQkXIxRRkjsxmnXR7wKfByBpXIlfw
 z5Y01cxTBhYxiYtpta2UG4LMabBcIGwunB56wdmrFy3qOypaepMshPs4m8+mE/Gws6XD
 1lVReeu3obRyPgms1cnCdr7zV+MSK37qVJ2U1H/Dp66kQYwD6/8D3VTXjZnqD2vCALbS
 nSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S715M+675Z0PbXHD9I+O0NRlMeoHb9x2yw8235n4aD4=;
 b=mBdn21ouYfNzrWKGG7m2eXxTEhptPwOL8jLY/jt8dFF5JSXMcBEHpejDS2MMzZCmZ0
 Q+w3ZI/QU1TNUe8PeB92wMsjxXuOSXIzJQDNaomWryRPc+UYnkyTUb9KAIBtVovfH6Gc
 NOTQHdUAD/JfQ4xAMzZP/QKRDm6z2iXM1/C7gqJs1Zd3/q5+dcX2HvZDsdpLF2QRU38u
 kkM84enVW/IzIBrmVLswqaM1YjJhB7q7nCmJH3Pw7DpippuWeaem1CkGislh+CdCAF7v
 Kt0e6fSeo+BWtFJIcHThL768nqtCWMCL4noPAD8ICdY6m3pTp1NKBvdR/QIXlIskvE42
 JOSQ==
X-Gm-Message-State: AOAM532DfsOXuKp/3DEQBUaWrQNs10fXBMOrogvpR9S33xBsBczdRla1
 vvshGe/N/OQfttoTBQdGKLNcSZq2GgM=
X-Google-Smtp-Source: ABdhPJyzq/395EXQ7e4rc/g9RXP3aHnx4RSP9K994E5vIztFHzllmbAJ3xzDwYr2hRTxnQ8Y/iALCg==
X-Received: by 2002:a05:600c:2254:: with SMTP id
 a20mr852186wmm.115.1614808150922; 
 Wed, 03 Mar 2021 13:49:10 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i8sm39345178wry.90.2021.03.03.13.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:49:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/28] target/arm: Restrict watchpoint code to system
 emulation
Date: Wed,  3 Mar 2021 22:47:02 +0100
Message-Id: <20210303214708.1727801-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can not use watchpoints in user-mode emulation because we
need the softmmu slow path to detect accesses to watchpointed
memory. Add #ifdef'ry around it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h    |  2 ++
 target/arm/cpu.c          |  4 ++--
 target/arm/debug_helper.c |  8 ++++++++
 target/arm/helper.c       |  4 ++++
 target/arm/sve_helper.c   | 12 ++++++++++++
 5 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3fb295431ae..8fa0a244d59 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -263,6 +263,7 @@ static inline bool extended_addresses_enabled(CPUARMState *env)
            (arm_feature(env, ARM_FEATURE_LPAE) && (tcr->raw_tcr & TTBCR_EAE));
 }
 
+#ifndef CONFIG_USER_ONLY
 /*
  * Update a QEMU watchpoint based on the information the guest has set in the
  * DBGWCR<n>_EL1 and DBGWVR<n>_EL1 registers.
@@ -286,6 +287,7 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
  * addresses.
  */
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len);
+#endif /* !CONFIG_USER_ONLY */
 
 void hw_breakpoint_update(ARMCPU *cpu, int n);
 /*
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 09566a535e5..efc338b24eb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -432,10 +432,10 @@ static void arm_cpu_reset(DeviceState *dev)
     if (kvm_enabled()) {
         kvm_arm_reset_vcpu(cpu);
     }
-#endif
 
-    hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
+#endif
+    hw_breakpoint_update_all(cpu);
     arm_rebuild_hflags(env);
 }
 
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 980110e1328..b8b7d81762d 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -11,6 +11,8 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
+#ifndef CONFIG_USER_ONLY
+
 /* Return true if the linked breakpoint entry lbn passes its checks */
 static bool linked_bp_matches(ARMCPU *cpu, int lbn)
 {
@@ -227,6 +229,8 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
     return check_watchpoints(cpu);
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 static bool check_breakpoints(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
@@ -240,11 +244,13 @@ static bool check_breakpoints(ARMCPU *cpu)
         return false;
     }
 
+#ifndef CONFIG_USER_ONLY
     for (int n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
         if (bp_wp_matches(cpu, n, false)) {
             return true;
         }
     }
+#endif /* !CONFIG_USER_ONLY */
     return false;
 }
 
@@ -267,6 +273,7 @@ void arm_debug_excp_handler(CPUState *cs)
     CPUARMState *env = &cpu->env;
     uint64_t pc;
     bool same_el;
+#ifndef CONFIG_USER_ONLY
     CPUWatchpoint *wp_hit = cs->watchpoint_hit;
 
     if (wp_hit && (wp_hit->flags & BP_CPU)) {
@@ -282,6 +289,7 @@ void arm_debug_excp_handler(CPUState *cs)
                         arm_debug_target_el(env));
         return;
     }
+#endif /* !CONFIG_USER_ONLY */
 
     pc = is_a64(env) ? env->pc : env->regs[15];
     same_el = (arm_debug_target_el(env) == arm_current_el(env));
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 54648c7fbb6..2e7a6356ae3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6345,6 +6345,7 @@ static const ARMCPRegInfo zcr_el3_reginfo = {
     .writefn = zcr_write, .raw_writefn = raw_write
 };
 
+#ifndef CONFIG_USER_ONLY
 void hw_watchpoint_update(ARMCPU *cpu, int n)
 {
     CPUARMState *env = &cpu->env;
@@ -6470,6 +6471,7 @@ static void dbgwcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
     hw_watchpoint_update(cpu, i);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 void hw_breakpoint_update(ARMCPU *cpu, int n)
 {
@@ -6643,6 +6645,7 @@ static void define_debug_regs(ARMCPU *cpu)
         define_arm_cp_regs(cpu, dbgregs);
     }
 
+#ifndef CONFIG_USER_ONLY
     for (i = 0; i < arm_num_wrps(cpu); i++) {
         ARMCPRegInfo dbgregs[] = {
             { .name = "DBGWVR", .state = ARM_CP_STATE_BOTH,
@@ -6661,6 +6664,7 @@ static void define_debug_regs(ARMCPU *cpu)
         };
         define_arm_cp_regs(cpu, dbgregs);
     }
+#endif /* !CONFIG_USER_ONLY */
 }
 
 static void define_pmu_regs(ARMCPU *cpu)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 844db08bd57..ed3f22d78a5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4849,6 +4849,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                 /* Some page is MMIO, see below. */
                 goto do_fault;
             }
+#ifndef CONFIG_USER_ONLY
             if (unlikely(flags & TLB_WATCHPOINT) &&
                 (cpu_watchpoint_address_matches
                  (env_cpu(env), addr + mem_off, 1 << msz)
@@ -4856,6 +4857,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                 /* Watchpoint hit, see below. */
                 goto do_fault;
             }
+#endif
             if (mtedesc && !mte_probe1(env, mtedesc, addr + mem_off)) {
                 goto do_fault;
             }
@@ -4900,12 +4902,14 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
         uint64_t pg = *(uint64_t *)(vg + (reg_off >> 3));
         do {
             if ((pg >> (reg_off & 63)) & 1) {
+#ifndef CONFIG_USER_ONLY
                 if (unlikely(flags & TLB_WATCHPOINT) &&
                     (cpu_watchpoint_address_matches
                      (env_cpu(env), addr + mem_off, 1 << msz)
                      & BP_MEM_READ)) {
                     goto do_fault;
                 }
+#endif
                 if (mtedesc && !mte_probe1(env, mtedesc, addr + mem_off)) {
                     goto do_fault;
                 }
@@ -5355,10 +5359,12 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                                mmu_idx, retaddr);
 
                 if (likely(in_page >= msize)) {
+#ifndef CONFIG_USER_ONLY
                     if (unlikely(info.flags & TLB_WATCHPOINT)) {
                         cpu_check_watchpoint(env_cpu(env), addr, msize,
                                              info.attrs, BP_MEM_READ, retaddr);
                     }
+#endif
                     if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
                         mte_check1(env, mtedesc, addr, retaddr);
                     }
@@ -5367,11 +5373,13 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                     /* Element crosses the page boundary. */
                     sve_probe_page(&info2, false, env, addr + in_page, 0,
                                    MMU_DATA_LOAD, mmu_idx, retaddr);
+#ifndef CONFIG_USER_ONLY
                     if (unlikely((info.flags | info2.flags) & TLB_WATCHPOINT)) {
                         cpu_check_watchpoint(env_cpu(env), addr,
                                              msize, info.attrs,
                                              BP_MEM_READ, retaddr);
                     }
+#endif
                     if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
                         mte_check1(env, mtedesc, addr, retaddr);
                     }
@@ -5568,11 +5576,13 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                 if (unlikely(info.flags & (TLB_INVALID_MASK | TLB_MMIO))) {
                     goto fault;
                 }
+#ifndef CONFIG_USER_ONLY
                 if (unlikely(info.flags & TLB_WATCHPOINT) &&
                     (cpu_watchpoint_address_matches
                      (env_cpu(env), addr, msize) & BP_MEM_READ)) {
                     goto fault;
                 }
+#endif
                 if (mtedesc &&
                     arm_tlb_mte_tagged(&info.attrs) &&
                     !mte_probe1(env, mtedesc, addr)) {
@@ -5754,10 +5764,12 @@ void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                     info.flags |= info2.flags;
                 }
 
+#ifndef CONFIG_USER_ONLY
                 if (unlikely(info.flags & TLB_WATCHPOINT)) {
                     cpu_check_watchpoint(env_cpu(env), addr, msize,
                                          info.attrs, BP_MEM_WRITE, retaddr);
                 }
+#endif
 
                 if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
                     mte_check1(env, mtedesc, addr, retaddr);
-- 
2.26.2


