Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDE441D358
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:29:56 +0200 (CEST)
Received: from localhost ([::1]:52862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpZr-00061X-KH
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosk-0001zP-W7; Thu, 30 Sep 2021 01:45:24 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:50427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosh-0003iR-9G; Thu, 30 Sep 2021 01:45:22 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR2y3Dz4xby; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=kNAF5MrJ1MsEsW76qbXpJcq81x2JeaDZn9ax95eR+Zs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UCOQ4D5mCfREtjZXIacUJWK6HdL+6F3iRbclok6t+281KIHk1XV3/GFw7ZXHcHVPT
 9RBiKf9lqLO3doEQxhQRb5q7i8zoUSzSaooyAtma1pXY0EZa9YW4FPw+tP4x64JvOm
 G6hH07wKcOVkjNmzzkXvK/I6JcwlDnpJfRHiYgW4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 28/44] spapr_numa.c: rename numa_assoc_array to
 FORM1_assoc_array
Date: Thu, 30 Sep 2021 15:44:10 +1000
Message-Id: <20210930054426.357344-29-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
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

Introducing a new NUMA affinity, FORM2, requires a new mechanism to
switch between affinity modes after CAS. Also, we want FORM2 data
structures and functions to be completely separated from the existing
FORM1 code, allowing us to avoid adding new code that inherits the
existing complexity of FORM1.

The idea of switching values used by the write_dt() functions in
spapr_numa.c was already introduced in the previous patch, and
the same approach will be used when dealing with the FORM1 and FORM2
arrays.

We can accomplish that by that by renaming the existing numa_assoc_array
to FORM1_assoc_array, which now is used exclusively to handle FORM1 affinity
data. A new helper get_associativity() is then introduced to be used by the
write_dt() functions to retrieve the current ibm,associativity array of
a given node, after considering affinity selection that might have been
done during CAS. All code that was using numa_assoc_array now needs to
retrieve the array by calling this function.

This will allow for an easier plug of FORM2 data later on.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210920174947.556324-5-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c   |  1 +
 hw/ppc/spapr_numa.c    | 38 +++++++++++++++++++++++++-------------
 include/hw/ppc/spapr.h |  2 +-
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 0e9a5b2e40..9056644890 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -17,6 +17,7 @@
 #include "kvm_ppc.h"
 #include "hw/ppc/fdt.h"
 #include "hw/ppc/spapr_ovec.h"
+#include "hw/ppc/spapr_numa.h"
 #include "mmu-book3s-v3.h"
 #include "hw/mem/memory-device.h"
 
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 08e2d6aed8..dce9ce987a 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -46,6 +46,15 @@ static int get_vcpu_assoc_size(SpaprMachineState *spapr)
     return get_numa_assoc_size(spapr) + 1;
 }
 
+/*
+ * Retrieves the ibm,associativity array of NUMA node 'node_id'
+ * for the current NUMA affinity.
+ */
+static const uint32_t *get_associativity(SpaprMachineState *spapr, int node_id)
+{
+    return spapr->FORM1_assoc_array[node_id];
+}
+
 static bool spapr_numa_is_symmetrical(MachineState *ms)
 {
     int src, dst;
@@ -124,7 +133,7 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
      */
     for (i = 1; i < nb_numa_nodes; i++) {
         for (j = 1; j < FORM1_DIST_REF_POINTS; j++) {
-            spapr->numa_assoc_array[i][j] = cpu_to_be32(i);
+            spapr->FORM1_assoc_array[i][j] = cpu_to_be32(i);
         }
     }
 
@@ -176,8 +185,8 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
              * and going up to 0x1.
              */
             for (i = n_level; i > 0; i--) {
-                assoc_src = spapr->numa_assoc_array[src][i];
-                spapr->numa_assoc_array[dst][i] = assoc_src;
+                assoc_src = spapr->FORM1_assoc_array[src][i];
+                spapr->FORM1_assoc_array[dst][i] = assoc_src;
             }
         }
     }
@@ -204,8 +213,8 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
      * 'i' will be a valid node_id set by the user.
      */
     for (i = 0; i < nb_numa_nodes; i++) {
-        spapr->numa_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
-        spapr->numa_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
+        spapr->FORM1_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
+        spapr->FORM1_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
     }
 
     /*
@@ -219,15 +228,15 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
     max_nodes_with_gpus = nb_numa_nodes + NVGPU_MAX_NUM;
 
     for (i = nb_numa_nodes; i < max_nodes_with_gpus; i++) {
-        spapr->numa_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
+        spapr->FORM1_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
 
         for (j = 1; j < FORM1_DIST_REF_POINTS; j++) {
             uint32_t gpu_assoc = smc->pre_5_1_assoc_refpoints ?
                                  SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
-            spapr->numa_assoc_array[i][j] = gpu_assoc;
+            spapr->FORM1_assoc_array[i][j] = gpu_assoc;
         }
 
-        spapr->numa_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
+        spapr->FORM1_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
     }
 
     /*
@@ -259,14 +268,17 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                                        int offset, int nodeid)
 {
+    const uint32_t *associativity = get_associativity(spapr, nodeid);
+
     _FDT((fdt_setprop(fdt, offset, "ibm,associativity",
-                      spapr->numa_assoc_array[nodeid],
+                      associativity,
                       get_numa_assoc_size(spapr) * sizeof(uint32_t))));
 }
 
 static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
                                            PowerPCCPU *cpu)
 {
+    const uint32_t *associativity = get_associativity(spapr, cpu->node_id);
     int max_distance_ref_points = get_max_dist_ref_points(spapr);
     int vcpu_assoc_size = get_vcpu_assoc_size(spapr);
     uint32_t *vcpu_assoc = g_new(uint32_t, vcpu_assoc_size);
@@ -280,7 +292,7 @@ static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
      */
     vcpu_assoc[0] = cpu_to_be32(max_distance_ref_points + 1);
     vcpu_assoc[vcpu_assoc_size - 1] = cpu_to_be32(index);
-    memcpy(vcpu_assoc + 1, spapr->numa_assoc_array[cpu->node_id] + 1,
+    memcpy(vcpu_assoc + 1, associativity + 1,
            (vcpu_assoc_size - 2) * sizeof(uint32_t));
 
     return vcpu_assoc;
@@ -319,10 +331,10 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
     cur_index += 2;
     for (i = 0; i < nr_nodes; i++) {
         /*
-         * For the lookup-array we use the ibm,associativity array,
-         * from numa_assoc_array. without the first element (size).
+         * For the lookup-array we use the ibm,associativity array of the
+         * current NUMA affinity, without the first element (size).
          */
-        uint32_t *associativity = spapr->numa_assoc_array[i];
+        const uint32_t *associativity = get_associativity(spapr, i);
         memcpy(cur_index, ++associativity,
                sizeof(uint32_t) * max_distance_ref_points);
         cur_index += max_distance_ref_points;
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 814e087e98..6b3dfc5dc2 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -249,7 +249,7 @@ struct SpaprMachineState {
     unsigned gpu_numa_id;
     SpaprTpmProxy *tpm_proxy;
 
-    uint32_t numa_assoc_array[NUMA_NODES_MAX_NUM][FORM1_NUMA_ASSOC_SIZE];
+    uint32_t FORM1_assoc_array[NUMA_NODES_MAX_NUM][FORM1_NUMA_ASSOC_SIZE];
 
     Error *fwnmi_migration_blocker;
 };
-- 
2.31.1


