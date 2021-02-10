Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A37315F7E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:31:37 +0100 (CET)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9j2G-0007Z1-HK
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ipT-0002LI-Rz; Wed, 10 Feb 2021 01:18:23 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:49725 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ipR-0000Ph-Ph; Wed, 10 Feb 2021 01:18:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gn4HY6z9sWC; Wed, 10 Feb 2021 17:17:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937861;
 bh=YFmNTTNma9//FHVJBREgqMfejrkYKFN1Rpke611iBfc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JiNut4kejFC8bZVbzq+LPvOthdEQ7tj0R2QTni+lpXFqc3T1KQ2ArVRsGJ9QpKUSO
 N/+4UDNujuKt+XMU8QS0n3L2qbGqLS7Kta7rG+/UI38JJoKh4Lph46pynVd+QbonEJ
 5Ve5XYC5XtXsyW6R885R+2JGy/EZiBgrG3AQsM6c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 13/19] spapr_numa.c: create spapr_numa_initial_nvgpu_numa_id()
 helper
Date: Wed, 10 Feb 2021 17:17:29 +1100
Message-Id: <20210210061735.304384-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

We'll need to check the initial value given to spapr->gpu_numa_id when
building the rtas DT, so put it in a helper for easier access and to
avoid repetition.

Tested-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210128174213.1349181-3-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c              | 11 +----------
 hw/ppc/spapr_numa.c         | 14 ++++++++++++++
 include/hw/ppc/spapr_numa.h |  1 +
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 8a1a979257..85fe65f894 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2770,16 +2770,7 @@ static void spapr_machine_init(MachineState *machine)
 
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
2.29.2


