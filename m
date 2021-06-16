Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F3B3A8E72
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:35:59 +0200 (CEST)
Received: from localhost ([::1]:49746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKTG-0004im-NJ
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltKE8-0003rC-KV; Tue, 15 Jun 2021 21:20:21 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:46950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltKE5-0004PC-7o; Tue, 15 Jun 2021 21:20:20 -0400
Received: by mail-qt1-x82e.google.com with SMTP id a15so581987qtx.13;
 Tue, 15 Jun 2021 18:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Otc4Xxg9oKPK1ZYhzXJX913Wp5VnSfIZ1yBwKpJgpy0=;
 b=s3zK5HrrEYVeMkUvVhsNJOtZ1jS7aYXgb4HuwjQZDTU//6yRrBwlyVFtJizqgdmLif
 2VCOMSXF03rTiDMYT2vAIX+D5l5H+OYyzpCR7VrRKMiZ09C7MHVrHRrC2wjuqNmueZBS
 NqrhZQj85gpZEDBTjWz31Wy5iuJFbNxtsS/MJbTR5cdZrskKUZNZd4nuwEiqEbpn2knH
 +pSlzcWxaRwY7V4iVX3kQyvheEy9cLvsvRX41RLK15Z+R8gP7nRM1FLz3lkLARVhJ3NF
 ajanLOSRPkaypW8Mdna6mXW4SsdHWP3S4MyHvO7srFsx+C7n2DHonzB/r9xiNHXqLIFj
 +2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Otc4Xxg9oKPK1ZYhzXJX913Wp5VnSfIZ1yBwKpJgpy0=;
 b=q26I8QLJbCgK1xV2fBOvDwYwfnhWPWOMWkGkbjLPpe9iC9pZcm+5clRwkIfhYn2SDu
 fuYcl89gyCSSA9YCLlR5dNOZOt6mANwneKrWjCH5ISeil8klGlEOsq998JmvojUNMDv+
 5/oMRsv9MsnPd/0gpM0ZdS7l09AH5MNmkQusH46Pj7Oo97XgmohiZ/Nqe/6qnwI+q19w
 HzAa4MTFWckqM5Z4DVK8UasUN4LHvze7HJV+FVuoeOyJNCME/KPNu0Pt0ehuQ6rR+9Aa
 ZT+6Au4LgR1/sQUcKQu6gw4h5Fell9l0IQq07gOH4L+9xLD09iU20/grOdcMHlx2ekvP
 NJjw==
X-Gm-Message-State: AOAM530TgrRfIRtag0OagoXYsX3Nq4C1JG0y67shMj8Gwg+eV8ZmekYj
 MKK5lXO28hZjuvi6si66RYG8ZxXOX4w=
X-Google-Smtp-Source: ABdhPJxB2iPSmW907mRDfirlcC4YiSmsjr5/S87H6HVFnJYOdKBX0nyU2Qu1p3Pe0vlyGKQCHhzjCA==
X-Received: by 2002:ac8:670f:: with SMTP id e15mr2504979qtp.291.1623806415741; 
 Tue, 15 Jun 2021 18:20:15 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id f19sm627994qkg.70.2021.06.15.18.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:20:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 7/7] spapr: move memory/cpu less check to
 spapr_numa_FORM1_affinity_init()
Date: Tue, 15 Jun 2021 22:19:44 -0300
Message-Id: <20210616011944.2996399-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616011944.2996399-1-danielhb413@gmail.com>
References: <20210616011944.2996399-1-danielhb413@gmail.com>
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
index b6b822a065..2216693e21 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2776,39 +2776,6 @@ static void spapr_machine_init(MachineState *machine)
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
index e7d455d304..6a2eafcae1 100644
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


