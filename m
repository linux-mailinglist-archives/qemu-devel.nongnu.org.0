Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898BD3A736A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 03:41:24 +0200 (CEST)
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsy4x-0003pQ-JT
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 21:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lsxxm-0000r3-7N; Mon, 14 Jun 2021 21:33:58 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:40947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lsxxk-0002em-DF; Mon, 14 Jun 2021 21:33:57 -0400
Received: by mail-qk1-x736.google.com with SMTP id u30so40433409qke.7;
 Mon, 14 Jun 2021 18:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wUgGKo4Xbe8PZndEW+FwB83m/Vv6a6cLHQWWfrS+caU=;
 b=W/buIhwtArAVb5xWO+Lcflhvoe5FqlTwevuQiVYRfRehduvN9jDPHv52hQNYBi3Sk7
 5TyzsdPqvBMoTJInals0pOThReAY+d5I76oKzPr4jKqfoF28e23Jo2SL/kOSc5rr0dtF
 am6rycITNYFLwvNNtiBmwCBrEISCDS/xaFJJKuSnjLbJYQw0d4SuZJoJCSnZw0kNbypU
 OLOR2bp8JsKt+PwtZj6EFHNzq6SJqH81zHj3KRhswB2gOx+lebtkbUpR3s85h0btjefV
 QSLi8yGu1ZNyeOXvR9/6cVuaYE2t92ULW0fAxbmo6MLUnnUnyBH/yLk/XDc3RWw2f3G0
 Rcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wUgGKo4Xbe8PZndEW+FwB83m/Vv6a6cLHQWWfrS+caU=;
 b=IbKLsgXcLTHu2Ro+VWXALxdCNoqyo214P3UXcRHlk2z70KZ6tkxDc1bfFyhH55LNhn
 Mpr8P2jAsW808uCVKncn6pvwcBV8DBmTwzM4Oa+QNCjuePKti3T9vQ6RxSYH1zbqXfZu
 WEX1B4VRqWdIwefsE3j6dKvRUBsf1ruHp4PKrP67NPdKdxX4bTZ4WLBjOjwLPd9Z62t4
 Ey4t7o9y+ob+0Ylo8wxnwpOjtHSaLie5t9LyMJljtELPRxCbhJztRpXVxsXZ19FAJpvN
 Hn2ojGn6UtZSD8kbDvV/jNbJq0SbAqGf5jeLF8NNMRqIm1MQ2focfhnEKS4UsuexsCYP
 jzeg==
X-Gm-Message-State: AOAM532e2dzm7cnzjbsYLYre0tcdhUhr2sx+Vvl72LmBEeXBXtNLg7W0
 eVXm4Qs8j6P1Qv3LZaxxoxS2/qWjt5rGLA==
X-Google-Smtp-Source: ABdhPJyoyFVv0qDK9eSpDJ6fdRYbch5juC2wqaXTKNDw/12BVQnXF32UqogUQGLoCB5SjfvMAgUxJw==
X-Received: by 2002:a05:620a:2058:: with SMTP id
 d24mr13273434qka.472.1623720834999; 
 Mon, 14 Jun 2021 18:33:54 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id h2sm11639320qkf.106.2021.06.14.18.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 18:33:54 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 8/8] spapr: move memory/cpu less check to
 spapr_numa_FORM1_affinity_init()
Date: Mon, 14 Jun 2021 22:33:09 -0300
Message-Id: <20210615013309.2833323-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615013309.2833323-1-danielhb413@gmail.com>
References: <20210615013309.2833323-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x736.google.com
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
index c70b8b2f44..e42bfd314b 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2772,39 +2772,6 @@ static void spapr_machine_init(MachineState *machine)
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
index 0cabb6757f..c7b0745455 100644
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


