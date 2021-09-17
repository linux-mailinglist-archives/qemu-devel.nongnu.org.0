Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5DB4100C9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 23:38:08 +0200 (CEST)
Received: from localhost ([::1]:46302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRLYd-0007z1-Ih
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 17:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mRLPS-0003zG-Cq; Fri, 17 Sep 2021 17:28:38 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:45764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mRLPC-0007rp-TO; Fri, 17 Sep 2021 17:28:38 -0400
Received: by mail-oi1-x233.google.com with SMTP id j66so15766873oih.12;
 Fri, 17 Sep 2021 14:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kiPKorNNMNDIXpxCvfCCNF20vmLrRMKgVM6q76yHe7c=;
 b=pIrloHgCAKKe591RcZvOLo06QIGyJzxbXWr0u+GAm65e0cNUowgIrA/a4UnQU+XpcK
 aefCsUyTRKMbZUcomPSlvkvA1j3UI5ZRMS2wj2gyY0S93+LkgqAdTam064OBMMDxBpbi
 vVADJ6kHE71w3gz2D7sFaj5+Wrm3AoBxrTP4v13UB2HtgHhcFVOcqFVuHAMTyp+zs44p
 MSlWY7vfMZZHznhpAb0kBPyFnrNi7xwL0l3RwG1uRSBlY7VMspP6g3HCe4bXHBdzm1rw
 4kDVcfVb8RdlavwYipdTmAmN2pv+o+/FpMzQgg6Vavqxku4rND6cbjE4wyiP4FFS/upp
 8yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kiPKorNNMNDIXpxCvfCCNF20vmLrRMKgVM6q76yHe7c=;
 b=sVk/fSDvVt/EAEX6rwurlWKjazkiPIV2OL3o7BIW0eejaG80fARBxsZ+JA0rGF99nX
 FSA6yMCUEVD8/aGrasRAocbGm5tOv11oQIm8NRKESIsJTMUEem5MtDyitbMPesvRcU+e
 UBK0zPEvMvslyyfXZAvw7WYZhYC+oaVVaYO22oueEsBIGzDdzWvGMytf74xh75OZcD8O
 dbYpNcStiBvPMTZrMed8NVzMdFeeOOUujJDMcUBmFHDWWIl7qGTq8TeaUEgnu5xsRo3x
 E8Q9onvwwxa3tVI0SJW72BVpWV/iz5Pg3KTIcwaQnnKypp8Vr/glRNMggWLMJHm+oNQZ
 LKSA==
X-Gm-Message-State: AOAM5338tPttkLuXyXZqkxJ/yArhUwQ/tnvYywpVkNfLflnF8XTmTK/X
 iG2csYbzkeY3otbnFFW9RLUogC+HfdI=
X-Google-Smtp-Source: ABdhPJyKV1RMYbw6KpCYhRtqkPCmtWfz6lWEv8DFfZal8RF98wnPD2L7+McsdhCBg08wmCr8N4ogFg==
X-Received: by 2002:a05:6808:169f:: with SMTP id
 bb31mr5768846oib.18.1631914101397; 
 Fri, 17 Sep 2021 14:28:21 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id s16sm710560otq.78.2021.09.17.14.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 14:28:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 5/7] spapr: move FORM1 verifications to post CAS
Date: Fri, 17 Sep 2021 18:28:00 -0300
Message-Id: <20210917212802.424481-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917212802.424481-1-danielhb413@gmail.com>
References: <20210917212802.424481-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FORM2 NUMA affinity is prepared to deal with empty (memory/cpu less)
NUMA nodes. This is used by the DAX KMEM driver to locate a PAPR SCM
device that has a different latency than the original NUMA node from the
regular memory. FORM2 is also able  to deal with asymmetric NUMA
distances gracefully, something that our FORM1 implementation doesn't
do.

Move these FORM1 verifications to a new function and wait until after
CAS, when we're sure that we're sticking with FORM1, to enforce them.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c              | 33 -----------------------
 hw/ppc/spapr_hcall.c        |  6 +++++
 hw/ppc/spapr_numa.c         | 53 ++++++++++++++++++++++++++++++++-----
 include/hw/ppc/spapr_numa.h |  1 +
 4 files changed, 54 insertions(+), 39 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d39fd4e644..ada85ee083 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2773,39 +2773,6 @@ static void spapr_machine_init(MachineState *machine)
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
index 7339d00d20..dfe4fada01 100644
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


