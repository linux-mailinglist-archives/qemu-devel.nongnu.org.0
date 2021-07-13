Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038C53C7769
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:45:21 +0200 (CEST)
Received: from localhost ([::1]:59216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3OLH-0001CJ-VX
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m3OHG-0000zt-7P; Tue, 13 Jul 2021 15:41:10 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m3OHE-0006Ux-Gd; Tue, 13 Jul 2021 15:41:09 -0400
Received: by mail-pf1-x431.google.com with SMTP id x16so20526549pfa.13;
 Tue, 13 Jul 2021 12:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JQbLYJekVFXHz1j8A8zyhgeWXPfW3Rmufm8WbLN+aw4=;
 b=CTNZZkHg59AMBFZ7jpPlupOVjD3KtQ5YFnLvG/SKH6+ohAXndoaZMdUE9NZvM2Xlis
 v5mPm2rbAzP+EUWXnknG7QhzfkAue/48WcEpkKGB1g6/7qw3UUV2F6IPvZFQ05TL2EP6
 8O51Ec9f4HiQ1anDn0PpSSCC6jDeSWxUpTdPrPszri/MezJDgU62A8UHXdYio3rtlIlt
 7bqrhRW122LOKRu+oIBcr/OB7rK6GkNpElqUKnrf336Ny++daumkXa5Sar+mVaGyfg/p
 kYEUOwHGg5pITeFmHA8vDGoZTc+aAqf027nSZChnCh8yHtALZqMY1Q1dezmGjZs0aXwR
 Xhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JQbLYJekVFXHz1j8A8zyhgeWXPfW3Rmufm8WbLN+aw4=;
 b=doh3GQusKy+C0DiUbrb5Z05ePbM+Ij9h6/vU6i3wRtKY4b9MbmkERKaZS9nR+Z7MZ3
 4jOwUKlIZaPJwDnbZ8mMxtd9twN+8k8iWrI0OG7xphtd8LHuKKsQjSkmRbQjIhDVyfhz
 LmQ/7AMwctml852tM7isH27NxsvOs/+5k/NJSMZXF3FGR08QT3rgCq5Ia1lhGKWqvo5x
 EXRNDhm7gyunlucHfyFKdC2aq9NEXzPkpcbiiUoNSAvvOXRcA4U/WtHi4dpFAs8rshNa
 0Lc7kajj/vsATmYVozhP2Dmt7ksfjNIGVEuCizFJwjrVPm2iQmd2LPVZuwqM6ZHjAq7H
 WRnw==
X-Gm-Message-State: AOAM532GX/fYvnr/s8xGDlxFgzBjeXzjMnhNx3YmoS3SC+Hy1eCh3OXy
 fMyvaA33QtsYXxB0Ccz4PotsxSKyod+nHJxIazo=
X-Google-Smtp-Source: ABdhPJye85PcMPJOl2ccsjbKMWida0mnORZgjeXpsXca4ai+z8oBpkR6ffAlvbODN9Xz5MfdhRHIdA==
X-Received: by 2002:a63:110c:: with SMTP id g12mr5667058pgl.139.1626205266140; 
 Tue, 13 Jul 2021 12:41:06 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.193.148.134])
 by smtp.gmail.com with ESMTPSA id o72sm20077506pfg.44.2021.07.13.12.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 12:41:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 5/5] spapr: move memory/cpu less check to
 spapr_numa_FORM1_affinity_init()
Date: Tue, 13 Jul 2021 16:40:45 -0300
Message-Id: <20210713194045.916263-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713194045.916263-1-danielhb413@gmail.com>
References: <20210713194045.916263-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=danielhb413@gmail.com; helo=mail-pf1-x431.google.com
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
Cc: aneesh.kumar@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FORM2 NUMA affinity is prepared to deal with memory/cpu less
NUMA nodes. This is used by the DAX KMEM driver to locate a
PAPR SCM device that has a different latency than the original
NUMA node from the regular memory.

Move this verification to FORM1 affinity code.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c      | 33 ---------------------------------
 hw/ppc/spapr_numa.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 76f1637959..538c5bcd94 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2794,39 +2794,6 @@ static void spapr_machine_init(MachineState *machine)
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
 
     if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index bba5a984e4..98740c732d 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -162,6 +162,39 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
                                            MachineState *machine)
 {
     bool using_legacy_numa = spapr_machine_using_legacy_numa(spapr);
+    int i;
+
+    /*
+     * check we don't have a memory-less/cpu-less NUMA node
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
+                       "Memory-less/cpu-less nodes are not supported (node %d)",
+                                 i);
+                    exit(1);
+                }
+            }
+        }
+    }
 
     /*
      * Legacy NUMA guests (pseries-5.1 and older, or guests with only
-- 
2.31.1


