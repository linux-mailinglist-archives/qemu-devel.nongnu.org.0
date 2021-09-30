Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8562B41D31E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:15:21 +0200 (CEST)
Received: from localhost ([::1]:59806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpLk-0008Cg-Fs
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosj-0001yN-91; Thu, 30 Sep 2021 01:45:22 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:43815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosh-0003iY-4U; Thu, 30 Sep 2021 01:45:20 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR38lhz4xc0; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=GNrWN7CbH4ycrOkozO8KW08YzHAQ+rYMlrTlt2GVRx0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iV2i60WOnor4oi3qYmnzWr9GGduCXmB6L9AU5zBxiCo74bVlZIFf7GkvWuS8okZ8I
 lSFYRi0yXFhF4C9AP4z3q8+bH/1FiV5zAyJF9mtq03RsnrFxcetRnEf6K8jlwfhhCr
 IY6FNPaJep/SG/0+YDCA1TZypLTy4KdRGnUEHfBo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 29/44] spapr: move FORM1 verifications to post CAS
Date: Thu, 30 Sep 2021 15:44:11 +1000
Message-Id: <20210930054426.357344-30-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

FORM2 NUMA affinity is prepared to deal with empty (memory/cpu less)
NUMA nodes. This is used by the DAX KMEM driver to locate a PAPR SCM
device that has a different latency than the original NUMA node from the
regular memory. FORM2 is also able  to deal with asymmetric NUMA
distances gracefully, something that our FORM1 implementation doesn't
do.

Move these FORM1 verifications to a new function and wait until after
CAS, when we're sure that we're sticking with FORM1, to enforce them.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210920174947.556324-6-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c              | 33 -----------------------
 hw/ppc/spapr_hcall.c        |  6 +++++
 hw/ppc/spapr_numa.c         | 53 ++++++++++++++++++++++++++++++++-----
 include/hw/ppc/spapr_numa.h |  1 +
 4 files changed, 54 insertions(+), 39 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 270106975b..524951def1 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2774,39 +2774,6 @@ static void spapr_machine_init(MachineState *machine)
     /* init CPUs */
     spapr_init_cpus(spapr);
 
-    /*
-     * check we don't have a memory-less/cpu-less NUMA node
-     * Firmware relies on the existing memory/cpu topology to provide the
-     * NUMA topology to the kernel.
-     * And the linux kernel needs to know the NUMA topology at start
-     * to be able to hotplug CPUs later.
-     */
-    if (machine->numa_state->num_nodes) {
-        for (i = 0; i < machine->numa_state->num_nodes; ++i) {
-            /* check for memory-less node */
-            if (machine->numa_state->nodes[i].node_mem == 0) {
-                CPUState *cs;
-                int found = 0;
-                /* check for cpu-less node */
-                CPU_FOREACH(cs) {
-                    PowerPCCPU *cpu = POWERPC_CPU(cs);
-                    if (cpu->node_id == i) {
-                        found = 1;
-                        break;
-                    }
-                }
-                /* memory-less and cpu-less node */
-                if (!found) {
-                    error_report(
-                       "Memory-less/cpu-less nodes are not supported (node %d)",
-                                 i);
-                    exit(1);
-                }
-            }
-        }
-
-    }
-
     spapr->gpu_numa_id = spapr_numa_initial_nvgpu_numa_id(machine);
 
     /* Init numa_assoc_array */
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 9056644890..222c1b6bbd 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1198,6 +1198,12 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr->cas_pre_isa3_guest = !spapr_ovec_test(ov1_guest, OV1_PPC_3_00);
     spapr_ovec_cleanup(ov1_guest);
 
+    /*
+     * Check for NUMA affinity conditions now that we know which NUMA
+     * affinity the guest will use.
+     */
+    spapr_numa_associativity_check(spapr);
+
     /*
      * Ensure the guest asks for an interrupt mode we support;
      * otherwise terminate the boot.
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index dce9ce987a..6718c0fdd1 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -193,6 +193,48 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
 
 }
 
+static void spapr_numa_FORM1_affinity_check(MachineState *machine)
+{
+    int i;
+
+    /*
+     * Check we don't have a memory-less/cpu-less NUMA node
+     * Firmware relies on the existing memory/cpu topology to provide the
+     * NUMA topology to the kernel.
+     * And the linux kernel needs to know the NUMA topology at start
+     * to be able to hotplug CPUs later.
+     */
+    if (machine->numa_state->num_nodes) {
+        for (i = 0; i < machine->numa_state->num_nodes; ++i) {
+            /* check for memory-less node */
+            if (machine->numa_state->nodes[i].node_mem == 0) {
+                CPUState *cs;
+                int found = 0;
+                /* check for cpu-less node */
+                CPU_FOREACH(cs) {
+                    PowerPCCPU *cpu = POWERPC_CPU(cs);
+                    if (cpu->node_id == i) {
+                        found = 1;
+                        break;
+                    }
+                }
+                /* memory-less and cpu-less node */
+                if (!found) {
+                    error_report(
+"Memory-less/cpu-less nodes are not supported with FORM1 NUMA (node %d)", i);
+                    exit(EXIT_FAILURE);
+                }
+            }
+        }
+    }
+
+    if (!spapr_numa_is_symmetrical(machine)) {
+        error_report(
+"Asymmetrical NUMA topologies aren't supported in the pSeries machine using FORM1 NUMA");
+        exit(EXIT_FAILURE);
+    }
+}
+
 /*
  * Set NUMA machine state data based on FORM1 affinity semantics.
  */
@@ -250,12 +292,6 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
         return;
     }
 
-    if (!spapr_numa_is_symmetrical(machine)) {
-        error_report("Asymmetrical NUMA topologies aren't supported "
-                     "in the pSeries machine");
-        exit(EXIT_FAILURE);
-    }
-
     spapr_numa_define_FORM1_domains(spapr);
 }
 
@@ -265,6 +301,11 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
     spapr_numa_FORM1_affinity_init(spapr, machine);
 }
 
+void spapr_numa_associativity_check(SpaprMachineState *spapr)
+{
+    spapr_numa_FORM1_affinity_check(MACHINE(spapr));
+}
+
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                                        int offset, int nodeid)
 {
diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
index 6f9f02d3de..7cb3367400 100644
--- a/include/hw/ppc/spapr_numa.h
+++ b/include/hw/ppc/spapr_numa.h
@@ -24,6 +24,7 @@
  */
 void spapr_numa_associativity_init(SpaprMachineState *spapr,
                                    MachineState *machine);
+void spapr_numa_associativity_check(SpaprMachineState *spapr);
 void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas);
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                                        int offset, int nodeid);
-- 
2.31.1


