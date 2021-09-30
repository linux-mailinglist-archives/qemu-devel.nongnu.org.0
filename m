Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC54041D313
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:10:29 +0200 (CEST)
Received: from localhost ([::1]:50928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpH2-0001vQ-VZ
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosd-0001nY-Pi; Thu, 30 Sep 2021 01:45:15 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:49923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosb-0003e0-Q9; Thu, 30 Sep 2021 01:45:15 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR2ky7z4xbt; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=g6Rf2uVvu83oM3TD3wsMTGfA3Drp2Sm2Gs72Xvnum5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TYE3x9I8lKACiSkpFndgMS9sDTRZzzpzG44WRz6RSZm8LxZ6tTru1aEj4v/E29AHm
 83F3/G8TMhN3mJYMjceu6DLkwEiJJBH1zE28yhDn0m0ClS2U+Thld8HlCiVVwdViRG
 j09oaLz5q4vrIecUX/nkX+LPcxNKjFyhZONO2vgo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 26/44] spapr_numa.c: scrap 'legacy_numa' concept
Date: Thu, 30 Sep 2021 15:44:08 +1000
Message-Id: <20210930054426.357344-27-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

When first introduced, 'legacy_numa' was a way to refer to guests that
either wouldn't be affected by associativity domain calculations, namely
the ones with only 1 NUMA node, and pre 5.2 guests that shouldn't be
affected by it because it would be an userspace change. Calling these
cases 'legacy_numa' was a convenient way to label these cases.

We're about to introduce a new NUMA affinity, FORM2, and this concept
of 'legacy_numa' is now a bit misleading because, although it is called
'legacy' it is in fact a FORM1 exclusive contraint.

This patch removes spapr_machine_using_legacy_numa() and open code the
conditions in each caller. While we're at it, move the chunk inside
spapr_numa_FORM1_affinity_init() that sets all numa_assoc_array domains
with 'node_id' to spapr_numa_define_FORM1_domains(). This chunk was
being executed if !pre_5_2_numa_associativity and num_nodes => 1, the
same conditions in which spapr_numa_define_FORM1_domains() is called
shortly after.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210920174947.556324-3-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_numa.c | 47 +++++++++++++++++++--------------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 786def7c73..bf520d42b2 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -19,15 +19,6 @@
 /* Moved from hw/ppc/spapr_pci_nvlink2.c */
 #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
 
-static bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr)
-{
-    MachineState *machine = MACHINE(spapr);
-    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
-
-    return smc->pre_5_2_numa_associativity ||
-           machine->numa_state->num_nodes <= 1;
-}
-
 static bool spapr_numa_is_symmetrical(MachineState *ms)
 {
     int src, dst;
@@ -97,7 +88,18 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
     MachineState *ms = MACHINE(spapr);
     NodeInfo *numa_info = ms->numa_state->nodes;
     int nb_numa_nodes = ms->numa_state->num_nodes;
-    int src, dst, i;
+    int src, dst, i, j;
+
+    /*
+     * Fill all associativity domains of non-zero NUMA nodes with
+     * node_id. This is required because the default value (0) is
+     * considered a match with associativity domains of node 0.
+     */
+    for (i = 1; i < nb_numa_nodes; i++) {
+        for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
+            spapr->numa_assoc_array[i][j] = cpu_to_be32(i);
+        }
+    }
 
     for (src = 0; src < nb_numa_nodes; src++) {
         for (dst = src; dst < nb_numa_nodes; dst++) {
@@ -164,7 +166,6 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
     int nb_numa_nodes = machine->numa_state->num_nodes;
     int i, j, max_nodes_with_gpus;
-    bool using_legacy_numa = spapr_machine_using_legacy_numa(spapr);
 
     /*
      * For all associativity arrays: first position is the size,
@@ -178,17 +179,6 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
     for (i = 0; i < nb_numa_nodes; i++) {
         spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
         spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
-
-        /*
-         * Fill all associativity domains of non-zero NUMA nodes with
-         * node_id. This is required because the default value (0) is
-         * considered a match with associativity domains of node 0.
-         */
-        if (!using_legacy_numa && i != 0) {
-            for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
-                spapr->numa_assoc_array[i][j] = cpu_to_be32(i);
-            }
-        }
     }
 
     /*
@@ -214,11 +204,13 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
     }
 
     /*
-     * Legacy NUMA guests (pseries-5.1 and older, or guests with only
-     * 1 NUMA node) will not benefit from anything we're going to do
-     * after this point.
+     * Guests pseries-5.1 and older uses zeroed associativity domains,
+     * i.e. no domain definition based on NUMA distance input.
+     *
+     * Same thing with guests that have only one NUMA node.
      */
-    if (using_legacy_numa) {
+    if (smc->pre_5_2_numa_associativity ||
+        machine->numa_state->num_nodes <= 1) {
         return;
     }
 
@@ -334,7 +326,8 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
         cpu_to_be32(maxdomain)
     };
 
-    if (spapr_machine_using_legacy_numa(spapr)) {
+    if (smc->pre_5_2_numa_associativity ||
+        ms->numa_state->num_nodes <= 1) {
         uint32_t legacy_refpoints[] = {
             cpu_to_be32(0x4),
             cpu_to_be32(0x4),
-- 
2.31.1


