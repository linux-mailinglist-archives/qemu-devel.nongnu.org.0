Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BE8307CF4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:49:12 +0100 (CET)
Received: from localhost ([::1]:38620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BPr-0003LO-6A
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l5BJU-00085L-VO; Thu, 28 Jan 2021 12:42:36 -0500
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:40589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l5BJQ-00086u-V1; Thu, 28 Jan 2021 12:42:36 -0500
Received: by mail-qk1-x72a.google.com with SMTP id u20so6052346qku.7;
 Thu, 28 Jan 2021 09:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5HfsAKrA1MeJXhkokYuxeDG51ImIm+2RwDEViWvaeFE=;
 b=XsUaUfwzRePWlTHtjUo++UCQYHcm1l/R8zZ8l5ufAyheOx/3XPzEYaHNQFJAxHP1Xf
 R/EsnqZ3iP45RYESMiHU4OOxDJRG67obmPYS8yqFQW5W61hv+QyRf+l6+iLdeUHpPslk
 tPmDvKFHIBxvd1DrZ6By9Z/A5wObby5OimKL3kWDYiU/b7MAcbzLUSidkRAvpDWc6qvA
 mVHqPoA0HxOC7/y4NIgKeuJuijgCRAajJH79GrCZ9NowtRKqJGzWUfdKBJdmRuqklrxT
 8Ukrab/iNRc50KBt6uyMbhNSo7MBou8dBrX8ua4n2+zYuaBru5hIJ5EjFWSGanabq1/r
 ejSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5HfsAKrA1MeJXhkokYuxeDG51ImIm+2RwDEViWvaeFE=;
 b=L89pQl7gzfhe+jFGbqykNeuruSHaKNlG0jkjFwM8IlUxGWzicx+yFo54DaQlLZTT7b
 w1cAukoGybruLGgD3ue5GB/DlBLJ1hXTzQNys8LRB/zm4vF8udiMVV0VP3WjGmrX9p++
 pZkBI/21T4zZEfRMZPzhAOo7juR7MHbiRoGYrUY22qQnpi+WISUe1jH+Z8LKgi6bmSEH
 4KvyfllvSDvgOdaTdXjXgzo3OlmATbapoPXdfnzbeZUSNzyyicPurJ+EQDlDtHUtGpQS
 xWoL+RFkdy6TQ8jZKXqaKWPu+OgrDQV1X/otq2e0duKeunOtlUkJ7FNTpQ46BzgkQXJB
 Wf1Q==
X-Gm-Message-State: AOAM532H21G9lU51sd79a5Y2r6GKp25vz+MgA6sUQM8skaZ9eCDx/Eqc
 dQ1zgwNM2kygVeReZDGvSDYAZh6b1GI=
X-Google-Smtp-Source: ABdhPJz/hmtji2d5PvN8W5rH9/sfO6CZxRkhUUymfJgOXFOLzwpN1rPU/Eg7nV91a3zSKDc1afAaZw==
X-Received: by 2002:a37:d01:: with SMTP id 1mr273188qkn.247.1611855747276;
 Thu, 28 Jan 2021 09:42:27 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6df1:6267:881f:cc79:a1f7])
 by smtp.gmail.com with ESMTPSA id i8sm3804038qtr.84.2021.01.28.09.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 09:42:26 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] spapr_numa.c: create
 spapr_numa_initial_nvgpu_numa_id() helper
Date: Thu, 28 Jan 2021 14:42:12 -0300
Message-Id: <20210128174213.1349181-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128174213.1349181-1-danielhb413@gmail.com>
References: <20210128174213.1349181-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We'll need to check the initial value given to spapr->gpu_numa_id when
building the rtas DT, so put it in a helper for easier access and to
avoid repetition.

Tested-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c              | 11 +----------
 hw/ppc/spapr_numa.c         | 14 ++++++++++++++
 include/hw/ppc/spapr_numa.h |  1 +
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 2d60c6f594..bc3fa276ff 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2765,16 +2765,7 @@ static void spapr_machine_init(MachineState *machine)
 
     }
 
-    /*
-     * NVLink2-connected GPU RAM needs to be placed on a separate NUMA node.
-     * We assign a new numa ID per GPU in spapr_pci_collect_nvgpu() which is
-     * called from vPHB reset handler so we initialize the counter here.
-     * If no NUMA is configured from the QEMU side, we start from 1 as GPU RAM
-     * must be equally distant from any other node.
-     * The final value of spapr->gpu_numa_id is going to be written to
-     * max-associativity-domains in spapr_build_fdt().
-     */
-    spapr->gpu_numa_id = MAX(1, machine->numa_state->num_nodes);
+    spapr->gpu_numa_id = spapr_numa_initial_nvgpu_numa_id(machine);
 
     /* Init numa_assoc_array */
     spapr_numa_associativity_init(spapr, machine);
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 261810525b..a757dd88b8 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -46,6 +46,20 @@ static bool spapr_numa_is_symmetrical(MachineState *ms)
     return true;
 }
 
+/*
+ * NVLink2-connected GPU RAM needs to be placed on a separate NUMA node.
+ * We assign a new numa ID per GPU in spapr_pci_collect_nvgpu() which is
+ * called from vPHB reset handler so we initialize the counter here.
+ * If no NUMA is configured from the QEMU side, we start from 1 as GPU RAM
+ * must be equally distant from any other node.
+ * The final value of spapr->gpu_numa_id is going to be written to
+ * max-associativity-domains in spapr_build_fdt().
+ */
+unsigned int spapr_numa_initial_nvgpu_numa_id(MachineState *machine)
+{
+    return MAX(1, machine->numa_state->num_nodes);
+}
+
 /*
  * This function will translate the user distances into
  * what the kernel understand as possible values: 10
diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
index b3fd950634..6f9f02d3de 100644
--- a/include/hw/ppc/spapr_numa.h
+++ b/include/hw/ppc/spapr_numa.h
@@ -31,5 +31,6 @@ int spapr_numa_fixup_cpu_dt(SpaprMachineState *spapr, void *fdt,
                             int offset, PowerPCCPU *cpu);
 int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
                                          int offset);
+unsigned int spapr_numa_initial_nvgpu_numa_id(MachineState *machine);
 
 #endif /* HW_SPAPR_NUMA_H */
-- 
2.26.2


