Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B0940D141
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 03:35:58 +0200 (CEST)
Received: from localhost ([::1]:40876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQgJh-0007Ku-Bk
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 21:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQgER-0006rW-8h; Wed, 15 Sep 2021 21:30:32 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:35487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQgEO-0004Hz-BP; Wed, 15 Sep 2021 21:30:31 -0400
Received: by mail-qv1-xf31.google.com with SMTP id g11so3212248qvd.2;
 Wed, 15 Sep 2021 18:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2C5b76jtImHGxpA+qB3vnX40UTYGfv0o/HjtPEWFh8k=;
 b=QlYxHVrgmtSjneWsJ9UE6j/sLXg3ttNzGX2urkemoJgEZ6QP8fDeXnAHG2bshO7+bX
 6RBJcHwA496AQV/+r/D2J1wctOPWBSfQ7e3eDh60QjayfgVX7G2mTfVdgc0klf+ePMvc
 nBrMHEpsqfn0hGd//h31iW1HbfKcuntH4lYEG10wN0jTzuxM+POkzHsjgKTloE2P/tvF
 FfMtHB6N9iECrlXB7+2MKGVzykw/7UYAq8rKn1eZM34xrBwI65YCL1Ao2L56HbjqDJpl
 PUBnbgq0knpkkrBsu3UFRHQTBSYhCmLHCpdZlP4KStZv2P69DjtyxZpFDK9pI5O+HYb+
 SY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2C5b76jtImHGxpA+qB3vnX40UTYGfv0o/HjtPEWFh8k=;
 b=wOhF/2+crUczxKhX+2YQ2Vz7Ioa51E3BFTsbQ3J02dVmdbW7Z/3g+4LSh1MPGHtjcO
 3yaumxjoNXspCHhokMrK6lHW6x6MZgmzoDRzCeu41WvXpSwjFZDVIuGZrnb7/uzemY6j
 hkZeDZzQmoYrgRV6JjYXppaJyKVBHOQoZK7EgS6LvECCqmy5doIlNA5rUfJHVlyFE3u3
 GONIbu4hgTZlrmmXIzmR1be9P4zzTvVXe7RHHnIxmc04kKVdYXJQxTxSYXo4UMQ9nSbD
 kH5mMATUcOrUjHFsu4XFAzQDwk+YijC3PL0YQk0EozvXUOecBAP2qLTyrPKITvfH90Fm
 2DtA==
X-Gm-Message-State: AOAM530gbGsagbJ1Q1IJ7uNoJwlBt3tiYR0u76fVOYTasYU8zeVPj0hH
 XVIz1vSLiAj546Qq4CPI2jzwes525QM=
X-Google-Smtp-Source: ABdhPJwdUco/KvrsOancQ2K/bVR/fY7EXAFRAqJI+SkcgNZi8po+z49kMQpgmuGhQUisy3D7j9+lfQ==
X-Received: by 2002:a0c:d44d:: with SMTP id r13mr2877872qvh.50.1631755827064; 
 Wed, 15 Sep 2021 18:30:27 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id 67sm1369417qkl.1.2021.09.15.18.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 18:30:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 5/7] spapr: move FORM1 verifications to post CAS
Date: Wed, 15 Sep 2021 22:30:02 -0300
Message-Id: <20210916013004.272059-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916013004.272059-1-danielhb413@gmail.com>
References: <20210916013004.272059-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf31.google.com
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
index 39f9a73429..3f7f612b03 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -195,6 +195,48 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
 
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
@@ -252,12 +294,6 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
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
 
@@ -267,6 +303,11 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
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


