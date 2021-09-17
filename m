Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CAF4100BF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 23:33:33 +0200 (CEST)
Received: from localhost ([::1]:38592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRLUD-0002YD-3m
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 17:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mRLPI-0003TC-9c; Fri, 17 Sep 2021 17:28:28 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32]:34697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mRLPF-0007u9-Q5; Fri, 17 Sep 2021 17:28:28 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 g4-20020a4ab044000000b002900bf3b03fso3654242oon.1; 
 Fri, 17 Sep 2021 14:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mzFhOyctRijVDKSHK8Zrbxl1rpitiRZreC6L+HMEcBQ=;
 b=CwK9zOBkrEgE8HhPss8WmvNOtSfAJt3Qndxwhodb3m9bzLpHtvnzFjCupmm/nR1YwL
 DRuBHglTQYx0IKkdLHPoXNk+zVMBqWxsdVs2ln21A/+RGzowkOPFF2j/GJnXaFnrPV07
 LDM+E2AtLVWO9aba51YduWyjHthELW63v6tapQ3Klj/MphLVXqvxK0iQzXsnNlKqTonS
 u9W/hw/wc1P2v3Wqgmah2IQ25TDlgyW/pgT4KiWSnW5t0j0Gsy6dOXS6jCQTf6BgdYPr
 cyZ5vFzyXgmUMiRxnFvgfYvE4SCy/8O4sVmz2f6eD2Lor/3zZ4Skpbw8z2MP2UgWYU/0
 ZH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mzFhOyctRijVDKSHK8Zrbxl1rpitiRZreC6L+HMEcBQ=;
 b=IYcW+a1UJ8jQsD2Mvp3OYqtU1p4Gf4kVrfhxxTC+FcG1xItPuRkWa7Mztxvvs7y2nz
 599SrrBkqiXmspUYTbj8NsefqAmYRhXbouWKSTiA2F4PL7OyLHkCD5K86GibQVw6VG0R
 QfS3UK1QhECwqcszyofHd1b0uTVl6zdyBOTWJ+B9ASTcMF/mXKW6iNDLVD+G+VWUmVIs
 ZoEjAxDdxoWsCmU0DRj6wyAt9VbRwh5P7sLMooup0xpJGNb5sIxOMrIAfg0/8zsc9ivo
 8bdQdgEWC4LqK5vn9WBnB9tmo7X1LOzvX20YpqRY7I9XlvQefuywnJqM1YE/hnVPnl8g
 tarQ==
X-Gm-Message-State: AOAM530g4LD98alhMLHlEkJ6D9HzdVrp07ufCoVrEcANfgJTBYogxH+3
 EGxByYtfISW/lN5oWTqxQyh/7dWh14s=
X-Google-Smtp-Source: ABdhPJwuGv175uzQ1o6e4GG9kBVVycea4K7TP+suRHytb8cV7BkyExN9sMdZf+i/cAXGBzJkle8JZA==
X-Received: by 2002:a4a:dc51:: with SMTP id q17mr10564397oov.10.1631914103811; 
 Fri, 17 Sep 2021 14:28:23 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id s16sm710560otq.78.2021.09.17.14.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 14:28:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 6/7] spapr_numa.c: FORM2 NUMA affinity support
Date: Fri, 17 Sep 2021 18:28:01 -0300
Message-Id: <20210917212802.424481-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917212802.424481-1-danielhb413@gmail.com>
References: <20210917212802.424481-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc32.google.com
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

- get_max_dist_ref_points(), get_numa_assoc_size() and get_associativity()
now checks for OV5_FORM2_AFFINITY and returns FORM2 values if the guest
selected FORM2 affinity during CAS.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c              |   8 ++
 hw/ppc/spapr_numa.c         | 146 ++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h      |   9 +++
 include/hw/ppc/spapr_ovec.h |   1 +
 4 files changed, 164 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index ada85ee083..babb662845 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2752,6 +2752,11 @@ static void spapr_machine_init(MachineState *machine)
 
     spapr_ovec_set(spapr->ov5, OV5_FORM1_AFFINITY);
 
+    /* Do not advertise FORM2 NUMA support for pseries-6.1 and older */
+    if (!smc->pre_6_2_numa_affinity) {
+        spapr_ovec_set(spapr->ov5, OV5_FORM2_AFFINITY);
+    }
+
     /* advertise support for dedicated HP event source to guests */
     if (spapr->use_hotplug_event_source) {
         spapr_ovec_set(spapr->ov5, OV5_HP_EVT);
@@ -4667,8 +4672,11 @@ DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
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
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index dfe4fada01..659513b405 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -24,6 +24,10 @@
  */
 static int get_max_dist_ref_points(SpaprMachineState *spapr)
 {
+    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
+        return FORM2_DIST_REF_POINTS;
+    }
+
     return FORM1_DIST_REF_POINTS;
 }
 
@@ -32,6 +36,10 @@ static int get_max_dist_ref_points(SpaprMachineState *spapr)
  */
 static int get_numa_assoc_size(SpaprMachineState *spapr)
 {
+    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
+        return FORM2_NUMA_ASSOC_SIZE;
+    }
+
     return FORM1_NUMA_ASSOC_SIZE;
 }
 
@@ -52,6 +60,9 @@ static int get_vcpu_assoc_size(SpaprMachineState *spapr)
  */
 static uint32_t *get_associativity(SpaprMachineState *spapr, int node_id)
 {
+    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
+        return spapr->FORM2_assoc_array[node_id];
+    }
     return spapr->FORM1_assoc_array[node_id];
 }
 
@@ -295,14 +306,50 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
     spapr_numa_define_FORM1_domains(spapr);
 }
 
+/*
+ * Init NUMA FORM2 machine state data
+ */
+static void spapr_numa_FORM2_affinity_init(SpaprMachineState *spapr)
+{
+    int i;
+
+    /*
+     * For all resources but CPUs, FORM2 associativity arrays will
+     * be a size 2 array with the following format:
+     *
+     * ibm,associativity = {1, numa_id}
+     *
+     * CPUs will write an additional 'vcpu_id' on top of the arrays
+     * being initialized here. 'numa_id' is represented by the
+     * index 'i' of the loop.
+     *
+     * Given that this initialization is also valid for GPU associativity
+     * arrays, handle everything in one single step by populating the
+     * arrays up to NUMA_NODES_MAX_NUM.
+     */
+    for (i = 0; i < NUMA_NODES_MAX_NUM; i++) {
+        spapr->FORM2_assoc_array[i][0] = cpu_to_be32(1);
+        spapr->FORM2_assoc_array[i][1] = cpu_to_be32(i);
+    }
+}
+
 void spapr_numa_associativity_init(SpaprMachineState *spapr,
                                    MachineState *machine)
 {
     spapr_numa_FORM1_affinity_init(spapr, machine);
+    spapr_numa_FORM2_affinity_init(spapr);
 }
 
 void spapr_numa_associativity_check(SpaprMachineState *spapr)
 {
+    /*
+     * FORM2 does not have any restrictions we need to handle
+     * at CAS time, for now.
+     */
+    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
+        return;
+    }
+
     spapr_numa_FORM1_affinity_check(MACHINE(spapr));
 }
 
@@ -447,6 +494,100 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
                      maxdomains, sizeof(maxdomains)));
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
+     * primary domain index (for FORM2, the first element).
+     *
+     * This value (in our case, the numa-id) is then used as an index
+     * to retrieve all other attributes of the node (distance,
+     * bandwidth, latency) via ibm,numa-lookup-index-table and other
+     * ibm,numa-*-table properties.
+     */
+    uint32_t refpoints[] = { cpu_to_be32(1) };
+
+    uint32_t maxdomain = ms->numa_state->num_nodes + number_nvgpus_nodes;
+    uint32_t maxdomains[] = { cpu_to_be32(1), cpu_to_be32(maxdomain) };
+
+    _FDT(fdt_setprop(fdt, rtas, "ibm,associativity-reference-points",
+                     refpoints, sizeof(refpoints)));
+
+    _FDT(fdt_setprop(fdt, rtas, "ibm,max-associativity-domains",
+                     maxdomains, sizeof(maxdomains)));
+
+    spapr_numa_FORM2_write_rtas_tables(spapr, fdt, rtas);
+}
+
 /*
  * Helper that writes ibm,associativity-reference-points and
  * max-associativity-domains in the RTAS pointed by @rtas
@@ -454,6 +595,11 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
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
index 6b3dfc5dc2..ee7504b976 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -118,6 +118,13 @@ typedef enum {
 #define FORM1_DIST_REF_POINTS            4
 #define FORM1_NUMA_ASSOC_SIZE            (FORM1_DIST_REF_POINTS + 1)
 
+/*
+ * FORM2 NUMA affinity has a single associativity domain, giving
+ * us a assoc size of 2.
+ */
+#define FORM2_DIST_REF_POINTS            1
+#define FORM2_NUMA_ASSOC_SIZE            (FORM2_DIST_REF_POINTS + 1)
+
 typedef struct SpaprCapabilities SpaprCapabilities;
 struct SpaprCapabilities {
     uint8_t caps[SPAPR_CAP_NUM];
@@ -145,6 +152,7 @@ struct SpaprMachineClass {
     hwaddr rma_limit;          /* clamp the RMA to this size */
     bool pre_5_1_assoc_refpoints;
     bool pre_5_2_numa_associativity;
+    bool pre_6_2_numa_affinity;
 
     bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
                           uint64_t *buid, hwaddr *pio,
@@ -250,6 +258,7 @@ struct SpaprMachineState {
     SpaprTpmProxy *tpm_proxy;
 
     uint32_t FORM1_assoc_array[NUMA_NODES_MAX_NUM][FORM1_NUMA_ASSOC_SIZE];
+    uint32_t FORM2_assoc_array[NUMA_NODES_MAX_NUM][FORM2_NUMA_ASSOC_SIZE];
 
     Error *fwnmi_migration_blocker;
 };
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


