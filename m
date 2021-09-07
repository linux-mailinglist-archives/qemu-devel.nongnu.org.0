Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982D04021A5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 02:27:49 +0200 (CEST)
Received: from localhost ([::1]:36934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNOxo-0006SH-H3
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 20:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNOvs-00044c-Tk; Mon, 06 Sep 2021 20:25:48 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:34807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNOvr-0005km-3u; Mon, 06 Sep 2021 20:25:48 -0400
Received: by mail-qk1-x72b.google.com with SMTP id a66so8444243qkc.1;
 Mon, 06 Sep 2021 17:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e0OAJGK7QQ67l/s45XfqlUOoltbSPMh/cftld7lIQUY=;
 b=XL7F/brNfhGHKSiMqb3FqtJ6w6/tBGPZtz4ev06XurnVhmqYfsRK+ziZoIQYHpAhjE
 C8M+9n7Mm1R5KDKuBQz96YXIXZuoQeFBwH4I1Fd4nFyC38Q8lHzb1QucCip2D+3kCkzh
 fCsFUpxJCCEV0Z5CM6X73hIfZhDJro27rPtfk9HmflhJXCqh8tGpZ/QFVt68WsfS0JiI
 dDfZJmG5NVL4czHY4ZnCxKwqiCHdaNRlk12lXZSzjCJGgEotiSIiHeEPh/eeHzc5kl3y
 VdpgdjSoL6/1i7PH3V1KWXc4w0CCl+yIOyu4IHjnLKzM0EqnW4o1EUXav5hwN5UIL112
 Gxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e0OAJGK7QQ67l/s45XfqlUOoltbSPMh/cftld7lIQUY=;
 b=FD7iBFO9rUS1Nelarul/uYLzsbLpTgZ9aCIpM9ei9mI7Yl1s08qpCgG3wvkMRuLMt3
 3/bomZrBh+Z/5ot4BRJDakLTJ3+Sl653i2EFnh5h52Fh8v02v4OF01bC1wt8UcZkz3Ux
 MoRoJzFG40ReWOPF5Ig5NzFxqlz1ifrr4NrxNYNLDiMgoKYhcF8WLRpHen7JXQevHT1U
 eDAMeb9gtdkpMrdZ6lXsGpZg7jF44kGm9PbqFbcNqRs6BDiA2dCxRCSYW9iU1L8zP3dM
 00Uh/1OWp7X+2shfQ90sUeIHJt8YfHs/5i4C2fAcKt0meT8eaXVZfH4jDsticI+2E7ob
 srOQ==
X-Gm-Message-State: AOAM5309YANfHJfS906WQLMBBZJ74gA/MdnUUoUpc8xV3vY/BN/lk19y
 XyzpN72ip/jKaxIkZVmihlRiTruwuTE=
X-Google-Smtp-Source: ABdhPJwp8v8gvnyy57uIf9GK9eX3wdbvWVn1qKMsUxKUVKjsiZHnWl8yiv9HACfamkN5XRA5Js3xCQ==
X-Received: by 2002:a05:620a:4541:: with SMTP id
 u1mr13569614qkp.106.1630974345630; 
 Mon, 06 Sep 2021 17:25:45 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id 207sm7892056qkh.45.2021.09.06.17.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 17:25:45 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/4] spapr: move FORM1 verifications to
 do_client_architecture_support()
Date: Mon,  6 Sep 2021 21:25:27 -0300
Message-Id: <20210907002527.412013-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907002527.412013-1-danielhb413@gmail.com>
References: <20210907002527.412013-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72b.google.com
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
 hw/ppc/spapr.c              | 33 -------------------------
 hw/ppc/spapr_hcall.c        |  6 +++++
 hw/ppc/spapr_numa.c         | 49 ++++++++++++++++++++++++++++++++-----
 include/hw/ppc/spapr_numa.h |  1 +
 4 files changed, 50 insertions(+), 39 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 8d98e3b08a..c974c07fb8 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2797,39 +2797,6 @@ static void spapr_machine_init(MachineState *machine)
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
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 7efbe93f4b..27ee713600 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1202,9 +1202,15 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
      * If the guest chooses FORM2 we need to reset the associativity
      * information - it is being defaulted to FORM1 during
      * spapr_machine_reset().
+     *
+     * If we're sure that we'll be using FORM1, verify now if we have
+     * a configuration or condition that is not available for FORM1
+     * (namely asymmetric NUMA topologies and empty NUMA nodes).
      */
     if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
         spapr_numa_associativity_reset(spapr);
+    } else {
+        spapr_numa_check_FORM1_constraints(MACHINE(spapr));
     }
 
     /*
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index ca276e16cb..0c57d03184 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -155,6 +155,49 @@ static void spapr_numa_define_associativity_domains(SpaprMachineState *spapr)
 
 }
 
+void spapr_numa_check_FORM1_constraints(MachineState *machine)
+{
+    int i;
+
+    if (!spapr_numa_is_symmetrical(machine)) {
+        error_report("Asymmetrical NUMA topologies aren't supported "
+                     "in the pSeries machine");
+        exit(EXIT_FAILURE);
+    }
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
+                    exit(EXIT_FAILURE);
+                }
+            }
+        }
+    }
+}
+
 /*
  * Set NUMA machine state data based on FORM1 affinity semantics.
  */
@@ -172,12 +215,6 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
         return;
     }
 
-    if (!spapr_numa_is_symmetrical(machine)) {
-        error_report("Asymmetrical NUMA topologies aren't supported "
-                     "in the pSeries machine");
-        exit(EXIT_FAILURE);
-    }
-
     spapr_numa_define_associativity_domains(spapr);
 }
 
diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
index 0e457bba57..b5a19cb3f1 100644
--- a/include/hw/ppc/spapr_numa.h
+++ b/include/hw/ppc/spapr_numa.h
@@ -25,5 +25,6 @@ int spapr_numa_fixup_cpu_dt(SpaprMachineState *spapr, void *fdt,
 int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
                                          int offset);
 unsigned int spapr_numa_initial_nvgpu_numa_id(MachineState *machine);
+void spapr_numa_check_FORM1_constraints(MachineState *machine);
 
 #endif /* HW_SPAPR_NUMA_H */
-- 
2.31.1


