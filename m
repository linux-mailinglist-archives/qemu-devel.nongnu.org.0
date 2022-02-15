Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24034B6197
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 04:24:18 +0100 (CET)
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJoRs-0004BY-B8
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 22:24:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoL7-0007DO-7X; Mon, 14 Feb 2022 22:17:17 -0500
Received: from [2607:f8b0:4864:20::631] (port=34373
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoL4-0002ih-Kg; Mon, 14 Feb 2022 22:17:16 -0500
Received: by mail-pl1-x631.google.com with SMTP id 10so12075628plj.1;
 Mon, 14 Feb 2022 19:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LY06/OQyWqE41TmOp2SwVh7O8fO2mchY66KkpNu5e2I=;
 b=mF4t0Wkv2v/zQ8Tblbv6O2HkQw1fXqjN9UPZk3n2DbmWi8ajzQN6PRz9gLoYSTf7Vm
 lpCG0jUS0Aq1RMcMsTVRVC7CE3JcM6OK8nRX2Xf2LQyrhiJk9lHL3NvOtCV3Yi6DbbH1
 bV7x8VKOKBVu10pqrkE1Iv65/EQ1Ge/WL3fUb7pWRrMTjvlYMRh/N5hlzvkPsT2Hetsb
 plQUXwSc6lsYpcw+PVXCFwr0qiAxu0KBvj6mP2YKa93pEWX3s2L46VF+18vsrU4MVgi5
 Lwz5DPm/slgRaU9LOv4fM0rE+X8HYbvt6TEhpKsBn/5f1h1rbQwszC1KWir6AEqACSzq
 ByEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LY06/OQyWqE41TmOp2SwVh7O8fO2mchY66KkpNu5e2I=;
 b=fQUlcfxHfVbenklQUTTrhf47pUtrq272rKh0pc+TWsmekFTww78wwfw/KO0D8iMoCF
 O0TDkphaUMS4U4luITF+LC1KIyoR0KOBgSC28jEK+6cVfLtxmW5lzb1aMPk0ngIsoRL9
 /eznfPTxQJ1qcL3yZlw7Zfi/Jeuvf8q5DCKJ1e4+l8bwoY9gFr2XsbEuKytN0o+AttDT
 dyDoc8SQDMDuggX6b8MkzFDqaKqGLFU/XTP7mXd+NgswjRcvk9ZE+yft60QQ9dJ8s4za
 27Q8iBNJiBR6wrM237tFmgoFMZ+xTciVMnV+DEjOVEbcNrq0Yc50NG2oVAmQH9UjWQwS
 a1ng==
X-Gm-Message-State: AOAM533OARZSRsUlGz9UmpsTsQRDelhRxlWJHkeXOc3Okci5hGwh02ZO
 pLGBXRrdXpLtl5u/wqxmmldJ7kf7Qf8=
X-Google-Smtp-Source: ABdhPJwgBqfXD1d7h9YCIWnGaDPjbrXR0I1LH6HO7zv0dgrg9uzQTgLRBJVX8aI1WpBjCFIJbSbAhQ==
X-Received: by 2002:a17:902:ef4c:: with SMTP id
 e12mr1983270plx.102.1644895032862; 
 Mon, 14 Feb 2022 19:17:12 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-33-251-132.static.tpgi.com.au.
 [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id f22sm38667399pfj.206.2022.02.14.19.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 19:17:12 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 8/9] target/ppc: Introduce a vhyp framework for nested HV
 support
Date: Tue, 15 Feb 2022 13:16:41 +1000
Message-Id: <20220215031642.1691873-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220215031642.1691873-1-npiggin@gmail.com>
References: <20220215031642.1691873-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce virtual hypervisor methods that can support a "Nested KVM HV"
implementation using the bare metal 2-level radix MMU, and using HV
exceptions to return from H_ENTER_NESTED (rather than cause interrupts).

HV exceptions can now be raised in the TCG spapr machine when running a
nested KVM HV guest. The main ones are the lev==1 syscall, the hdecr,
hdsi and hisi, hv fu, and hv emu, and h_virt external interrupts.

HV exceptions are intercepted in the exception handler code and instead
of causing interrupts in the guest and switching the machine to HV mode,
they go to the vhyp where it may exit the H_ENTER_NESTED hcall with the
interrupt vector numer as return value as required by the hcall API.

Address translation is provided by the 2-level page table walker that is
implemented for the bare metal radix MMU. The partition scope page table
is pointed to the L1's partition scope by the get_pate vhc method.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/pegasos2.c        |  6 ++++
 hw/ppc/spapr.c           |  6 ++++
 target/ppc/cpu.h         |  2 ++
 target/ppc/excp_helper.c | 76 ++++++++++++++++++++++++++++++++++------
 target/ppc/mmu-radix64.c | 15 ++++++--
 5 files changed, 92 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 298e6b93e2..d45008ac71 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -449,6 +449,11 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu, Pegasos2MachineState *pm,
     }
 }
 
+static bool pegasos2_cpu_in_nested(PowerPCCPU *cpu)
+{
+    return false;
+}
+
 static void pegasos2_hypercall(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
 {
     Pegasos2MachineState *pm = PEGASOS2_MACHINE(vhyp);
@@ -504,6 +509,7 @@ static void pegasos2_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_id = "pegasos2.ram";
     mc->default_ram_size = 512 * MiB;
 
+    vhc->cpu_in_nested = pegasos2_cpu_in_nested;
     vhc->hypercall = pegasos2_hypercall;
     vhc->cpu_exec_enter = vhyp_nop;
     vhc->cpu_exec_exit = vhyp_nop;
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 1892a29e2d..3a5cf92c94 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4470,6 +4470,11 @@ PowerPCCPU *spapr_find_cpu(int vcpu_id)
     return NULL;
 }
 
+static bool spapr_cpu_in_nested(PowerPCCPU *cpu)
+{
+    return false;
+}
+
 static void spapr_cpu_exec_enter(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
 {
     SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
@@ -4578,6 +4583,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     fwc->get_dev_path = spapr_get_fw_dev_path;
     nc->nmi_monitor_handler = spapr_nmi;
     smc->phb_placement = spapr_phb_placement;
+    vhc->cpu_in_nested = spapr_cpu_in_nested;
     vhc->hypercall = emulate_spapr_hypercall;
     vhc->hpt_mask = spapr_hpt_mask;
     vhc->map_hptes = spapr_map_hptes;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c79ae74f10..d8cc956c97 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1311,6 +1311,8 @@ PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc);
 #ifndef CONFIG_USER_ONLY
 struct PPCVirtualHypervisorClass {
     InterfaceClass parent;
+    bool (*cpu_in_nested)(PowerPCCPU *cpu);
+    void (*deliver_hv_excp)(PowerPCCPU *cpu, int excp);
     void (*hypercall)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
     hwaddr (*hpt_mask)(PPCVirtualHypervisor *vhyp);
     const ppc_hash_pte64_t *(*map_hptes)(PPCVirtualHypervisor *vhyp,
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 778eb4f3b0..ecff7654cb 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1279,6 +1279,22 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
 
+/*
+ * When running a nested HV guest under vhyp, external interrupts are
+ * delivered as HVIRT.
+ */
+static bool vhyp_promotes_external_to_hvirt(PowerPCCPU *cpu)
+{
+    if (cpu->vhyp) {
+        PPCVirtualHypervisorClass *vhc;
+        vhc = PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+        if (vhc->cpu_in_nested(cpu)) {
+            return true;
+        }
+    }
+    return false;
+}
+
 #ifdef TARGET_PPC64
 /*
  * When running under vhyp, hcalls are always intercepted and sent to the
@@ -1287,7 +1303,29 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
 static bool books_vhyp_handles_hcall(PowerPCCPU *cpu)
 {
     if (cpu->vhyp) {
-        return true;
+        PPCVirtualHypervisorClass *vhc;
+        vhc = PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+        if (!vhc->cpu_in_nested(cpu)) {
+            return true;
+        }
+    }
+    return false;
+}
+
+/*
+ * When running a nested KVM HV guest under vhyp, HV exceptions are not
+ * delivered to the guest (because there is no concept of HV support), but
+ * rather they are sent tothe vhyp to exit from the L2 back to the L1 and
+ * return from the H_ENTER_NESTED hypercall.
+ */
+static bool books_vhyp_handles_hv_excp(PowerPCCPU *cpu)
+{
+    if (cpu->vhyp) {
+        PPCVirtualHypervisorClass *vhc;
+        vhc = PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+        if (vhc->cpu_in_nested(cpu)) {
+            return true;
+        }
     }
     return false;
 }
@@ -1540,12 +1578,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         break;
     }
 
-    /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB) && srr0 == SPR_HSRR0) {
-        cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
-                  "no HV support\n", excp);
-    }
-
     /*
      * Sort out endianness of interrupt, this differs depending on the
      * CPU, the HV mode, etc...
@@ -1564,10 +1596,26 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         env->spr[srr1] = msr;
     }
 
-    /* This can update new_msr and vector if AIL applies */
-    ppc_excp_apply_ail(cpu, excp, msr, &new_msr, &vector);
+    if ((new_msr & MSR_HVB) && books_vhyp_handles_hv_excp(cpu)) {
+        PPCVirtualHypervisorClass *vhc =
+            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+        /* Deliver interrupt to L1 by returning from the H_ENTER_NESTED call */
+        vhc->deliver_hv_excp(cpu, excp);
 
-    powerpc_set_excp_state(cpu, vector, new_msr);
+        powerpc_reset_excp_state(cpu);
+
+    } else {
+        /* Sanity check */
+        if (!(env->msr_mask & MSR_HVB) && srr0 == SPR_HSRR0) {
+            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
+                      "no HV support\n", excp);
+        }
+
+        /* This can update new_msr and vector if AIL applies */
+        ppc_excp_apply_ail(cpu, excp, msr, &new_msr, &vector);
+
+        powerpc_set_excp_state(cpu, vector, new_msr);
+    }
 }
 #else
 static inline void powerpc_excp_books(PowerPCCPU *cpu, int excp)
@@ -1687,7 +1735,11 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         /* HEIC blocks delivery to the hypervisor */
         if ((async_deliver && !(heic && msr_hv && !msr_pr)) ||
             (env->has_hv_mode && msr_hv == 0 && !lpes0)) {
-            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
+            if (vhyp_promotes_external_to_hvirt(cpu)) {
+                powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
+            } else {
+                powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
+            }
             return;
         }
     }
@@ -1797,6 +1849,8 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
         msr |= (1ULL << MSR_LE);
     }
 
+    /* Anything for nested required here? MSR[HV] bit? */
+
     powerpc_set_excp_state(cpu, vector, msr);
 }
 
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 3b6d75a292..9b7a6a7f11 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -355,12 +355,23 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
 }
 
 /*
- * The spapr vhc has a flat partition scope provided by qemu memory.
+ * The spapr vhc has a flat partition scope provided by qemu memory when
+ * not nested.
+ *
+ * When running a nested guest, the addressing is 2-level radix on top of the
+ * vhc memory, so it works practically identically to the bare metal 2-level
+ * radix. So that code is selected directly. A cleaner and more flexible nested
+ * hypervisor implementation would allow the vhc to provide a ->nested_xlate()
+ * function but that is not required for the moment.
  */
 static bool vhyp_flat_addressing(PowerPCCPU *cpu)
 {
     if (cpu->vhyp) {
-        return true;
+        PPCVirtualHypervisorClass *vhc;
+        vhc = PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+        if (!vhc->cpu_in_nested(cpu)) {
+            return true;
+        }
     }
     return false;
 }
-- 
2.23.0


