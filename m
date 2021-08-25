Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE63F779C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 16:44:17 +0200 (CEST)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIu8W-0001DI-IG
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 10:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIu4W-00088X-9E; Wed, 25 Aug 2021 10:40:08 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:39704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIu4U-00077J-Ju; Wed, 25 Aug 2021 10:40:08 -0400
Received: by mail-qk1-x72a.google.com with SMTP id y144so27388022qkb.6;
 Wed, 25 Aug 2021 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7k8OYciL/eUBwAke7lRKwvBq4ud894thIDkNUi64C5k=;
 b=n9bZG7A+DWfueGGcbftopfivsnhnNk3uHPLsutvJkyhnFTeb6UK4MsWdMJbnchhceO
 UW3Pp8sRwj/OcE4V0oCUt3GikM+O9NNfwtfhgre7E3YDzSXIbZC3NCfr6Rcpqz67TjDm
 h+nw4Qre6MTW6ufe2DZndBqM74Heu0KPq4QMr5tFpzxxjRsZyuXWo8v4Wn5dcOSZJkdx
 bdGSCmEROqVfYWtYNUDNJhjF8ZjDOU/uYEeihS2Xb0SxXTVTlKARePFdjnbBS1vS9uTB
 xj3VrT7wfbnHA+QVGTgxWPXGtphrBpj95ebvIsTarkRVzcVoqfCfemMnYhj3CLr5lnE1
 VEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7k8OYciL/eUBwAke7lRKwvBq4ud894thIDkNUi64C5k=;
 b=PvtFf6ZGb8QHJFr1Abcm8hrr6JyocJWimakk/uKJPUm6ke/WZaTKdw9DohSFZzwB7g
 wX5CwOFivPfJItKSOrsNFl5o2Ro+NxG9tn5nv5r9Er9qJFyqvcKmAaNnjOM9c9ijCBmP
 G4Ld6DR7iZEAczgtBMUxfrPhBp5nD60PfeGC30ecRVRlpvKQm6nrEn09C6Ps02E5CTvG
 ww6MMURZBTA8ISFgUB6GofYP/Jr6WMbHn9Yo7sVLdkk6ZnStWl5IXK0OjJi42QDLD4Ol
 EEVlmEIrBdGPhBaJPz9nJBI09XCMeUkbGQNK69AUbthNjTusgdmieFAfHW4BZUQSrSCv
 AFDg==
X-Gm-Message-State: AOAM530sxEaSYCSLHU/mj6idrozxwydZYlNxSyyTqE7GWSLUFLlJnGaw
 HWx/4SsflIItTc9CYcv2BrOHA0t6xyQ=
X-Google-Smtp-Source: ABdhPJytzhwSiH4OBQQvOwCrAQfcZOYSdd9q29DzLibVXmyJ5LkmHMkudt7zDIXrdYoheJIbTfU6vA==
X-Received: by 2002:a37:a80c:: with SMTP id r12mr31385930qke.299.1629902404768; 
 Wed, 25 Aug 2021 07:40:04 -0700 (PDT)
Received: from rekt.ihost.com ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id 69sm129819qke.55.2021.08.25.07.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 07:40:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH v3 5/5] spapr: move memory/cpu less check to
 spapr_numa_FORM1_affinity_init()
Date: Wed, 25 Aug 2021 11:39:43 -0300
Message-Id: <20210825143943.529733-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825143943.529733-1-danielhb413@gmail.com>
References: <20210825143943.529733-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72a.google.com
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
index 7ea7605abf..3605472445 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2795,39 +2795,6 @@ static void spapr_machine_init(MachineState *machine)
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


