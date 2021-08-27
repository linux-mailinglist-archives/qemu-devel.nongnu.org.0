Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF113F9707
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 11:32:10 +0200 (CEST)
Received: from localhost ([::1]:59818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJYDP-0005z1-Bw
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 05:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mJY6y-0004MS-Ig; Fri, 27 Aug 2021 05:25:21 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:38674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mJY6v-0002AI-Dv; Fri, 27 Aug 2021 05:25:20 -0400
Received: by mail-ua1-x935.google.com with SMTP id 90so3079874uax.5;
 Fri, 27 Aug 2021 02:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3MDL+qlgirAEmr7expMfciOlo2SN4lrheQl/oUKYbZ4=;
 b=fNTtaEDsXiJcZnNwpu3DVB4w089sxFp5x/xTP/CvpftEdmSL3E5KzAUP7oJurKmvLo
 g8AhvYUmUtn5LEDRL7MdmrFtInR2BlFh+5T0gaTVk7sN9FAy93B0AT+JCheOs5Klgt/r
 PlykWHBEzD/mzC7+HjvgRKCIVadzW7QWC2GOHATE3RR4laG3WTN5BJ05uIdd7PV2ompR
 3U8+os2SYWKGd3vISUCZpvBT2K8J5vBPN0FGR9aVV3khM9CU8wnLvc8CIpfae5kCV+8V
 b8vE+IHTAaqrPY/Pognri//GyYBYkpanU4t8GgI75f+bjfXIX0TFiAi94KQw4DmSnOip
 gwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3MDL+qlgirAEmr7expMfciOlo2SN4lrheQl/oUKYbZ4=;
 b=Gp8wScxQkByZUKmLnxyFWzQHJ/UQtGZ1PSescQPbtNttDYZTD/kPXQQhy17L8QKzek
 IdOZF7A+cniyA3Z+rT4DdQ1YfD1zqsA//8KOFcOnoLWZbddLet4KcYCakQb4l4M1fCTw
 SDSvqzMEYhhKc4vBUp8SP17HHNqU+FKVvG4nsd3Fxcx1KbezFLEW3ol6OsupggeQCdiP
 yvRcmFfjrR97aDsxr0vLY4+hTaqxq5CarjTZPWKy9iwb6C40RlfunItUfG6QDvR+Fird
 SYIZYbwma1kqaA0bGP/gW4F0DU1+bYuntUkEcqDg5nC/PLoZ/QEyHUU+dBBHRlA7qmRh
 IRPw==
X-Gm-Message-State: AOAM5335TytklIwAJX3KcvBUTyEOEaWnZ+2t5we9LIFYjxeMBK3lyIDW
 IWYrU97eV784FQQreGoZ24LtwBnHwlw=
X-Google-Smtp-Source: ABdhPJyPOWo/0R0VRHWQMgql7OY2AkPbut58BINHFIzN6RR4wy0Ye0GYXYbUPCbPIsTWGJeR/hVf3A==
X-Received: by 2002:ab0:2517:: with SMTP id j23mr5855061uan.18.1630056316086; 
 Fri, 27 Aug 2021 02:25:16 -0700 (PDT)
Received: from rekt.COMFAST ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id d17sm629180vsj.9.2021.08.27.02.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 02:25:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] spapr: move memory/cpu less check to
 spapr_numa_FORM1_affinity_init()
Date: Fri, 27 Aug 2021 06:24:55 -0300
Message-Id: <20210827092455.125411-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827092455.125411-1-danielhb413@gmail.com>
References: <20210827092455.125411-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
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
index 63c4876415..4105a2504f 100644
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
index 2f261be9fd..fddac5fcce 100644
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


