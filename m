Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640794120AA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:55:24 +0200 (CEST)
Received: from localhost ([::1]:59426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSNVj-0002Aw-C7
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSNQg-0001yy-KR; Mon, 20 Sep 2021 13:50:10 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:36624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSNQe-0008WV-RN; Mon, 20 Sep 2021 13:50:10 -0400
Received: by mail-qt1-x82e.google.com with SMTP id d11so16408798qtw.3;
 Mon, 20 Sep 2021 10:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hVxHdgriD2upNmPHe9n8GeNG82h29/ty3zgSuHIOKGs=;
 b=eo5Fm7FgtMXUioW79uJx3c50xtvmW3uHRmsZL1NsV/Mwy/VXKLbn4wxWnYRxwyxHwg
 WmyicRBzOyDSORvrJrCLdLX9Pf2ZDo9mxHOAixgq9ky/Nkyecm1HxRMnNcHUCV2TAxlE
 5y9rY1FQ/e8e765ZZzwPSR0G0SIEL6VWRk1BOv8UjdPtaYxLQ4Zs7qybFNjnoimlyeiv
 q9yEgMUqh1VAjVcJ8JmWsyqBzEX8Nvd5eB35IJKbWmE478vXDFFCu383uZe1bfjcRg3I
 KsOXRnA1R05lPj1DlCoigNFB/ax7LAJFDICBNZEqLt/at4ioVnt7RTE3cmG6PQ8Jsau4
 uibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hVxHdgriD2upNmPHe9n8GeNG82h29/ty3zgSuHIOKGs=;
 b=bMxzvObkCGSIuAY6Wkfu7YR85T6LLdKA6kOXWZRDX8t1+Z08yrAQYGg7aIbWsUW5c6
 hDTGsku691SRFIjBnmdgPIzCaC5qyCGSclfqte59VP6o/bu63FHCe54ww6G5wbHMFuiM
 ZYfrqW7sraiGGIpAhQeZP3ql8Zv4nuAYJlYSzN5YDwarNh++yrYCXiq4W5QB+/F/8pW+
 MUm4p6It73wr8xBhevo/SsAwUeWmYavFA609mhqPfDyfmjh9fNzsJDpIRIx6KX9+G2z2
 sU1oikjpMoMXAcFL5lUsizdm/AVule+hkicyyT1rBOB4a4dy1j8u0yOBUjGvEXiGyvfK
 oULg==
X-Gm-Message-State: AOAM532HpHD19yFq8Vx/AQIZBWTolCI5+ozoDrq0YQL4NS3/OGM7dQCy
 la05yLhCngAKaMYnv3WwZCAfd9JgPRk=
X-Google-Smtp-Source: ABdhPJwxnElOhZUK1xHDRK3/AdpJ1Otw97pGDlXWO2D4FS6NyLqINXgpcFB2SzvSZzI4l3kTd9lGoQ==
X-Received: by 2002:ac8:57c7:: with SMTP id w7mr23777654qta.53.1632160207449; 
 Mon, 20 Sep 2021 10:50:07 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id l28sm6073614qkl.127.2021.09.20.10.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 10:50:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 5/7] spapr: move FORM1 verifications to post CAS
Date: Mon, 20 Sep 2021 14:49:45 -0300
Message-Id: <20210920174947.556324-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920174947.556324-1-danielhb413@gmail.com>
References: <20210920174947.556324-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Reviewed-by: Greg Kurz <groug@kaod.org>
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


