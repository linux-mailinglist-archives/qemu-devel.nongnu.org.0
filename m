Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DB94021AB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 02:31:47 +0200 (CEST)
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNP1d-0003FE-Gn
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 20:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNOw5-0004eo-4p; Mon, 06 Sep 2021 20:26:01 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:40500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNOvr-0005k3-Lj; Mon, 06 Sep 2021 20:26:00 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id 93so4822885qva.7;
 Mon, 06 Sep 2021 17:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tW0QOQSSP0XPRH7DVGBI3ZVFDrH57j+4eTdaY13/ywY=;
 b=i8/h24/TROmwjpA5HWHMug+J8REhWhzFDp2tcuGwj8fccyAp1SWvzVDGUnenwsStpQ
 o5DwxTcnSzrEdHYk6RrrBRf5s/j3NMzSy/4RdDV3yEd/g2tzUWUKSnyKHvBpPzZuB3C/
 ZdTsS8W91IC3PyhlnTYChY6HzkO5E+vfvh+1a6ukMFGmZZbbHcp2xmTYxtJ41ay5eu2e
 v0KDhnsTyP4UdUWENsqmk5Y1/Oy7loyRgRkDPsxRDcFSLKyjTA8I3swmsH1psljUP/6x
 wBVKqqPyINxbLxn+Z95AXOVpxuTBnOdhEzXz4ZU86Hi/7/bgk00cLJBi2L3BCtLBMBtU
 4mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tW0QOQSSP0XPRH7DVGBI3ZVFDrH57j+4eTdaY13/ywY=;
 b=RVSmV5GPJCvils0IpW0lrEfEeP78jdxSShG3kW6+VyLXovbMBwqY+3iNrGSNrVAyHD
 sBKLyarpA6C8GTQwGk6U/87NCO/sC/GgeyMApowhphx4DkZYjcPa3eo4sVjbUKcObfkR
 wUx/0+Hpxhst4oct53F+I8sxw1EFt0eIS9IV3GwR3k7R8CmUWu9ILwXpZ9yH4V5ChOLl
 fMdmQgLpUCELw8/TbRkYjePVS9ZnVrtn6qUS4v1CGRmANpiv1rLJOG+sNaK/OGaaRIvW
 JdVZjqpKaSPPF6dIsj7NkWCz+aTZ1UWzXpZv9iB9rS2Eip3BhzMMW7NTJeLL1zlbdGCE
 pxPQ==
X-Gm-Message-State: AOAM532RY7ljVzIkE9Rw2N+Fo6lPN0ScJUho3iYKcVcybgz2vkaXlbQA
 2Kgjj1kqusEYLBAtcEt/DhCxGbBXcj0=
X-Google-Smtp-Source: ABdhPJxNRFOcZaOXuw2RwsvyAMHETuLb333jpO8k8fWXf9yl+3phcLLGx0cPPpDFvk0BJJspVNqTGw==
X-Received: by 2002:a0c:8d0f:: with SMTP id r15mr14593347qvb.1.1630974343927; 
 Mon, 06 Sep 2021 17:25:43 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id 207sm7892056qkh.45.2021.09.06.17.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 17:25:43 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/4] spapr_numa.c: base FORM2 NUMA affinity support
Date: Mon,  6 Sep 2021 21:25:26 -0300
Message-Id: <20210907002527.412013-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907002527.412013-1-danielhb413@gmail.com>
References: <20210907002527.412013-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The main feature of FORM2 affinity support is the separation of NUMA
distances from ibm,associativity information. This allows for a more
flexible and straightforward NUMA distance assignment without relying on
complex associations between several levels of NUMA via
ibm,associativity matches. Another feature is its extensibility. This base
support contains the facilities for NUMA distance assignment, but in the
future more facilities will be added for latency, performance, bandwidth
and so on.

This patch implements the base FORM2 affinity support as follows:

- the use of FORM2 associativity is indicated by using bit 2 of byte 5
of ibm,architecture-vec-5. A FORM2 aware guest can choose to use FORM1
or FORM2 affinity. Setting both forms will default to FORM2. We're not
advertising FORM2 for pseries-6.1 and older machine versions to prevent
guest visible changes in those;

- call spapr_numa_associativity_reset() in do_client_architecture_support()
if FORM2 is chosen. This will avoid re-initializing FORM1 artifacts that
were already initialized in spapr_machine_reset();

- ibm,associativity-reference-points has a new semantic. Instead of
being used to calculate distances via NUMA levels, it's now used to
indicate the primary domain index in the ibm,associativity domain of
each resource. In our case it's set to {0x4}, matching the position
where we already place logical_domain_id;

- two new RTAS DT artifacts are introduced: ibm,numa-lookup-index-table
and ibm,numa-distance-table. The index table is used to list all the
NUMA logical domains of the platform, in ascending order, and allows for
spartial NUMA configurations (although QEMU ATM doesn't support that).
ibm,numa-distance-table is an array that contains all the distances from
the first NUMA node to all other nodes, then the second NUMA node
distances to all other nodes and so on;

- spapr_post_load changes: since we're adding a new NUMA affinity that
isn't compatible with the existing one, migration must be handled
accordingly because we can't be certain of whether the guest went
through CAS in the source. The solution chosen is to initiate the NUMA
associativity data in spapr_post_load() unconditionally. The worst case
would be to write the DT twice if the guest is in pre-CAS stage.
Otherwise, we're making sure that a FORM1 guest will have the
spapr->numa_assoc_array initialized with the proper information based on
user distance, something that we're not doing with FORM2.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c              |  24 +++++++
 hw/ppc/spapr_hcall.c        |  10 +++
 hw/ppc/spapr_numa.c         | 135 +++++++++++++++++++++++++++++++++++-
 include/hw/ppc/spapr.h      |   1 +
 include/hw/ppc/spapr_ovec.h |   1 +
 5 files changed, 170 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 8e1ff6cd10..8d98e3b08a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1789,6 +1789,22 @@ static int spapr_post_load(void *opaque, int version_id)
         return err;
     }
 
+    /*
+     * NUMA data init is made in CAS time. There is no reliable
+     * way of telling whether the guest already went through CAS
+     * in the source due to how spapr_ov5_cas_needed works: a
+     * FORM1 guest can be migrated with ov5_cas empty regardless
+     * of going through CAS first.
+     *
+     * One solution is to always call numa_associativity_reset. The
+     * downside is that a guest migrated before CAS will run
+     * numa_associativity_reset again when going through it, but
+     * at least we're making sure spapr->numa_assoc_array will be
+     * initialized and hotplug operations won't fail in both before
+     * and after CAS migration cases.
+     */
+     spapr_numa_associativity_reset(spapr);
+
     return err;
 }
 
@@ -2755,6 +2771,11 @@ static void spapr_machine_init(MachineState *machine)
 
     spapr_ovec_set(spapr->ov5, OV5_FORM1_AFFINITY);
 
+    /* Do not advertise FORM2 support for pseries-6.1 and older */
+    if (!smc->pre_6_2_numa_affinity) {
+        spapr_ovec_set(spapr->ov5, OV5_FORM2_AFFINITY);
+    }
+
     /* advertise support for dedicated HP event source to guests */
     if (spapr->use_hotplug_event_source) {
         spapr_ovec_set(spapr->ov5, OV5_HP_EVT);
@@ -4700,8 +4721,11 @@ DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
  */
 static void spapr_machine_6_1_class_options(MachineClass *mc)
 {
+    SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
+
     spapr_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    smc->pre_6_2_numa_affinity = true;
 }
 
 DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 0e9a5b2e40..7efbe93f4b 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -11,6 +11,7 @@
 #include "helper_regs.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_cpu_core.h"
+#include "hw/ppc/spapr_numa.h"
 #include "mmu-hash64.h"
 #include "cpu-models.h"
 #include "trace.h"
@@ -1197,6 +1198,15 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr->cas_pre_isa3_guest = !spapr_ovec_test(ov1_guest, OV1_PPC_3_00);
     spapr_ovec_cleanup(ov1_guest);
 
+    /*
+     * If the guest chooses FORM2 we need to reset the associativity
+     * information - it is being defaulted to FORM1 during
+     * spapr_machine_reset().
+     */
+    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
+        spapr_numa_associativity_reset(spapr);
+    }
+
     /*
      * Ensure the guest asks for an interrupt mode we support;
      * otherwise terminate the boot.
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 84636cb86a..ca276e16cb 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -202,6 +202,24 @@ void spapr_numa_associativity_reset(SpaprMachineState *spapr)
         spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
         spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
 
+        /*
+         * For FORM2 affinity, zero all the non-used associativity
+         * domains (all domains but the last). This step is necessary
+         * because FORM2 will always be populated on top of FORM1
+         * (via spapr_machine_reset()), which populates them.
+         *
+         * The kernel doesn't mind these non-used domains but zeroing
+         * them out makes it clearer to userspace that they are not
+         * being used.
+         */
+        if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
+            for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
+                spapr->numa_assoc_array[i][j] = 0;
+            }
+
+            continue;
+        }
+
         /*
          * Fill all associativity domains of non-zero NUMA nodes with
          * node_id. This is required because the default value (0) is
@@ -236,7 +254,16 @@ void spapr_numa_associativity_reset(SpaprMachineState *spapr)
         spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
     }
 
-    spapr_numa_FORM1_affinity_init(spapr, machine);
+    /*
+     * We test for !FORM2 instead of testing for FORM1 because,
+     * as per spapr_ov5_cas_needed, setting FORM1 is not enough
+     * to get ov5_cas migrated, but setting FORM2 is. Since we're
+     * dealing with either FORM1 or FORM2, test for the option
+     * that is guaranteed to be set after a migration.
+     */
+    if (!spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
+        spapr_numa_FORM1_affinity_init(spapr, machine);
+    }
 }
 
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
@@ -313,6 +340,107 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
     return ret;
 }
 
+static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
+                                               void *fdt, int rtas)
+{
+    MachineState *ms = MACHINE(spapr);
+    NodeInfo *numa_info = ms->numa_state->nodes;
+    int nb_numa_nodes = ms->numa_state->num_nodes;
+    int distance_table_entries = nb_numa_nodes * nb_numa_nodes;
+    g_autofree uint32_t *lookup_index_table = NULL;
+    g_autofree uint32_t *distance_table = NULL;
+    int src, dst, i, distance_table_size;
+    uint8_t *node_distances;
+
+    /*
+     * ibm,numa-lookup-index-table: array with length and a
+     * list of NUMA ids present in the guest.
+     */
+    lookup_index_table = g_new0(uint32_t, nb_numa_nodes + 1);
+    lookup_index_table[0] = cpu_to_be32(nb_numa_nodes);
+
+    for (i = 0; i < nb_numa_nodes; i++) {
+        lookup_index_table[i + 1] = cpu_to_be32(i);
+    }
+
+    _FDT(fdt_setprop(fdt, rtas, "ibm,numa-lookup-index-table",
+                     lookup_index_table,
+                     (nb_numa_nodes + 1) * sizeof(uint32_t)));
+
+    /*
+     * ibm,numa-distance-table: contains all node distances. First
+     * element is the size of the table as uint32, followed up
+     * by all the uint8 distances from the first NUMA node, then all
+     * distances from the second NUMA node and so on.
+     *
+     * ibm,numa-lookup-index-table is used by guest to navigate this
+     * array because NUMA ids can be sparse (node 0 is the first,
+     * node 8 is the second ...).
+     */
+    distance_table = g_new0(uint32_t, distance_table_entries + 1);
+    distance_table[0] = cpu_to_be32(distance_table_entries);
+
+    node_distances = (uint8_t *)&distance_table[1];
+    i = 0;
+
+    for (src = 0; src < nb_numa_nodes; src++) {
+        for (dst = 0; dst < nb_numa_nodes; dst++) {
+            node_distances[i++] = numa_info[src].distance[dst];
+        }
+    }
+
+    distance_table_size = distance_table_entries * sizeof(uint8_t) +
+                          sizeof(uint32_t);
+    _FDT(fdt_setprop(fdt, rtas, "ibm,numa-distance-table",
+                     distance_table, distance_table_size));
+}
+
+/*
+ * This helper could be compressed in a single function with
+ * FORM1 logic since we're setting the same DT values, with the
+ * difference being a call to spapr_numa_FORM2_write_rtas_tables()
+ * in the end. The separation was made to avoid clogging FORM1 code
+ * which already has to deal with compat modes from previous
+ * QEMU machine types.
+ */
+static void spapr_numa_FORM2_write_rtas_dt(SpaprMachineState *spapr,
+                                           void *fdt, int rtas)
+{
+    MachineState *ms = MACHINE(spapr);
+    uint32_t number_nvgpus_nodes = spapr->gpu_numa_id -
+                                   spapr_numa_initial_nvgpu_numa_id(ms);
+
+    /*
+     * In FORM2, ibm,associativity-reference-points will point to
+     * the element in the ibm,associativity array that contains the
+     * primary domain index. This value (in our case, the numa-id) is
+     * then used as an index to retrieve all other attributes of the
+     * node (distance, bandwidth, latency) via ibm,numa-lookup-index-table
+     * and other ibm,numa-*-table properties.
+     */
+    uint32_t refpoints[] = {
+        cpu_to_be32(0x4),
+    };
+
+    uint32_t nr_refpoints = ARRAY_SIZE(refpoints);
+    uint32_t maxdomain = ms->numa_state->num_nodes + number_nvgpus_nodes;
+    uint32_t maxdomains[] = {
+        cpu_to_be32(4),
+        cpu_to_be32(maxdomain),
+        cpu_to_be32(maxdomain),
+        cpu_to_be32(maxdomain),
+        cpu_to_be32(maxdomain)
+    };
+
+    _FDT(fdt_setprop(fdt, rtas, "ibm,associativity-reference-points",
+                     refpoints, nr_refpoints * sizeof(refpoints[0])));
+
+    _FDT(fdt_setprop(fdt, rtas, "ibm,max-associativity-domains",
+                     maxdomains, sizeof(maxdomains)));
+
+    spapr_numa_FORM2_write_rtas_tables(spapr, fdt, rtas);
+}
+
 static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
                                            void *fdt, int rtas)
 {
@@ -379,6 +507,11 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
  */
 void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
 {
+    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
+        spapr_numa_FORM2_write_rtas_dt(spapr, fdt, rtas);
+        return;
+    }
+
     spapr_numa_FORM1_write_rtas_dt(spapr, fdt, rtas);
 }
 
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 637652ad16..21b1cf9ebf 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -145,6 +145,7 @@ struct SpaprMachineClass {
     hwaddr rma_limit;          /* clamp the RMA to this size */
     bool pre_5_1_assoc_refpoints;
     bool pre_5_2_numa_associativity;
+    bool pre_6_2_numa_affinity;
 
     bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
                           uint64_t *buid, hwaddr *pio,
diff --git a/include/hw/ppc/spapr_ovec.h b/include/hw/ppc/spapr_ovec.h
index 48b716a060..c3e8b98e7e 100644
--- a/include/hw/ppc/spapr_ovec.h
+++ b/include/hw/ppc/spapr_ovec.h
@@ -49,6 +49,7 @@ typedef struct SpaprOptionVector SpaprOptionVector;
 /* option vector 5 */
 #define OV5_DRCONF_MEMORY       OV_BIT(2, 2)
 #define OV5_FORM1_AFFINITY      OV_BIT(5, 0)
+#define OV5_FORM2_AFFINITY      OV_BIT(5, 2)
 #define OV5_HP_EVT              OV_BIT(6, 5)
 #define OV5_HPT_RESIZE          OV_BIT(6, 7)
 #define OV5_DRMEM_V2            OV_BIT(22, 0)
-- 
2.31.1


