Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820840723E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 22:02:07 +0200 (CEST)
Received: from localhost ([::1]:50608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOmis-0005d5-3V
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 16:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mOmdF-0005lJ-Jb; Fri, 10 Sep 2021 15:56:18 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:38799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mOmd6-0006Gy-Lb; Fri, 10 Sep 2021 15:56:11 -0400
Received: by mail-qt1-x82f.google.com with SMTP id g11so2560769qtk.5;
 Fri, 10 Sep 2021 12:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lnj82D7Iqit6aGU3+jjvOh1+PKs9zxH1Qv/gZJ0LXIs=;
 b=RcuEzGvx9ioQr5gT4GNPEEF9lKxAUrAinbPCWJLgvMDHMRNNXlucW39MYfO2IRvDaw
 zIjMheCxzaotu3Nb8xMMXs+i4w11Ps4dp1q6Kno3gc8uCTRzHmuYSyqvKJ9WOmoKiPbH
 R3nq0+mhjTMMI2gghaBPfJnPxoGUweBTWX4I/EUbe8L2xP4s5Ds/YIcI3igDkGfRxQVB
 HJsUobzdfhDg4DBWPwoWtIxSXPaHvwf7qUOzRRJCnFB/noQhKxNRg5yYyh0pc687gL3L
 wb4q0a9QCjBbUCcZlO/YvZvnW3qvfulaqO1nwkEYg+11Dym20rGo3XpjCO0LXlTOV3RT
 o0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lnj82D7Iqit6aGU3+jjvOh1+PKs9zxH1Qv/gZJ0LXIs=;
 b=NiZvqI79SERjJSUppvR+KwsGm1NH/zuMzsGIidfTy0TO2huL/RRl4m7/SK3b5fzkgD
 xaXzHYE2+fFZGtRnIttw1DUUCUzXE1z8EeGvxilbHrUnHinQrI4+ki154JfS0oei3lJn
 4pTFOYWC0Sv/1fZ+p2dtAzQSbQyQEnHi+m3gFwijdijEndryaumMoXJGGLTjE85b7ogF
 7Tt6yeyBgQUo7TAYMGnj1mHW3yckp4b7o4TaxZ5MtM2dG8NWuPN8JKQobTFxvsCSdYSw
 nNmSdgt+350wh+C/I+NzDKCSZ6uan1d+oZkQJ7kN6aJl7JwwjG1oH+528uVazjkUoGCY
 Npyw==
X-Gm-Message-State: AOAM532GZuuwcv9RRKJFVvL6R7PLas+VGth0G+pz8ZahpzBdvSi19bH3
 aB6Y4qe4EfmGXhvjdAX7+zwlIvMXrcs=
X-Google-Smtp-Source: ABdhPJzOQ7kXBV+hagb09VTMjFFiW+JMbQlAZH3N32w0arcBX1x/XlCiu5hK7/6mDsxWiIJpWcygmQ==
X-Received: by 2002:a05:622a:3d4:: with SMTP id
 k20mr9649369qtx.353.1631303766850; 
 Fri, 10 Sep 2021 12:56:06 -0700 (PDT)
Received: from rekt.COMFAST ([191.193.98.206])
 by smtp.gmail.com with ESMTPSA id k10sm3873356qth.44.2021.09.10.12.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 12:56:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 5/6] spapr: move FORM1 verifications to post CAS
Date: Fri, 10 Sep 2021 16:55:38 -0300
Message-Id: <20210910195539.797170-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910195539.797170-1-danielhb413@gmail.com>
References: <20210910195539.797170-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82f.google.com
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
regular memory. FORM2 is also enable to deal with asymmetric NUMA
distances gracefully, something that our FORM1 implementation doesn't
do.

Move these FORM1 verifications to a new function and wait until after
CAS, when we're sure that we're sticking with FORM1, to enforce them.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c              | 35 +----------------------
 hw/ppc/spapr_hcall.c        |  2 +-
 hw/ppc/spapr_numa.c         | 55 ++++++++++++++++++++++++++++++++-----
 include/hw/ppc/spapr_numa.h |  3 +-
 4 files changed, 52 insertions(+), 43 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 5afbb76cab..0703a26093 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1798,7 +1798,7 @@ static int spapr_post_load(void *opaque, int version_id)
      * through it, but since it's a lightweight operation it's worth being
      * a little redundant to be safe.
      */
-     spapr_numa_associativity_reset(spapr);
+     spapr_numa_associativity_reset(spapr, false);
 
     return err;
 }
@@ -2787,39 +2787,6 @@ static void spapr_machine_init(MachineState *machine)
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
index 82ab92ddba..2dc22e2dc7 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1202,7 +1202,7 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
      * Reset numa_assoc_array now that we know which NUMA affinity
      * the guest will use.
      */
-    spapr_numa_associativity_reset(spapr);
+    spapr_numa_associativity_reset(spapr, true);
 
     /*
      * Ensure the guest asks for an interrupt mode we support;
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 7ad4b6582b..0ade63c2d3 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -198,6 +198,48 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
 
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
@@ -260,12 +302,6 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
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
 
@@ -287,10 +323,15 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
     spapr->numa_assoc_array = spapr->FORM1_assoc_array;
 }
 
-void spapr_numa_associativity_reset(SpaprMachineState *spapr)
+void spapr_numa_associativity_reset(SpaprMachineState *spapr,
+                                    bool post_CAS_check)
 {
     /* No FORM2 affinity implemented yet */
     spapr->numa_assoc_array = spapr->FORM1_assoc_array;
+
+    if (post_CAS_check) {
+        spapr_numa_FORM1_affinity_check(MACHINE(spapr));
+    }
 }
 
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
index ccf3e4eae8..246767d0a8 100644
--- a/include/hw/ppc/spapr_numa.h
+++ b/include/hw/ppc/spapr_numa.h
@@ -24,7 +24,8 @@
  */
 void spapr_numa_associativity_init(SpaprMachineState *spapr,
                                    MachineState *machine);
-void spapr_numa_associativity_reset(SpaprMachineState *spapr);
+void spapr_numa_associativity_reset(SpaprMachineState *spapr,
+                                    bool post_CAS_check);
 void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas);
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                                        int offset, int nodeid);
-- 
2.31.1


