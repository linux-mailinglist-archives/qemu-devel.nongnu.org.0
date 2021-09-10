Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AB0407240
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 22:02:52 +0200 (CEST)
Received: from localhost ([::1]:51784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOmja-0006RC-RG
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 16:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mOmdH-0005mb-FN; Fri, 10 Sep 2021 15:56:20 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:42945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mOmd8-0006IW-CR; Fri, 10 Sep 2021 15:56:15 -0400
Received: by mail-qk1-x72e.google.com with SMTP id t4so3298449qkb.9;
 Fri, 10 Sep 2021 12:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ONO1XN79/I80lTzqXELVruANGjMyyEb07J0RTZJ2s7Q=;
 b=THnuIYK0chth0UQLDvanB53EJ+geMFFjdoZUX1VHcTJkW87YZkCmVRSKCynJR+N5pl
 yh1Wlk9+TUxarlgNZpP6+cuoEHMslmn6xJU1z9VvRKCyVjVJy/IRwlrKAvxaMeU1NjM3
 xnJaQWytpCEHz7OyC7Z95zSQJkGb/oyYQgvW5W0EZDaUwUy2UXQSySMm24knwKLf2yNY
 xL65Rm9ikEeyCcC6278nyOYd4L4b60EECxTUuG/J6zVfpJGbnzKoz/5ckfPEuT4ks62b
 5F5UvwZNIoKN3gGvvUAmx6KaDUHXP2d9IcEn8oyKnUhQosdkPq7jIYdsqmeOrKcg2mZt
 HMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ONO1XN79/I80lTzqXELVruANGjMyyEb07J0RTZJ2s7Q=;
 b=ToUHykZp3QmtRKYSLNPPy6smVPMpzrRCnoe9In4/nA6tbQPaziojF1+04KvqXRLW1e
 RMTxIEBRAZGs96WW/qK3K/2NvAE6o5o7e+rJwnGZsOYLrapM5V3//5NryXpl3rXHnka1
 iB45BGm/Vv/2tvRYYVg/9aLMeyTkBbwCHltzHpVc/nMghWq/dukMfxT9sANIpvswuNhQ
 CsU7UNE4fSv0Cd7lCNACyV4XOYmwu7kklC3mTn1XYRIc58bUFVY1dbIqgkj8tBVg9aIf
 WH63/xSlaGKaHJ5yUkIqX2kOmhWv6BZKumaxaCduBZP6DrjVV22XQTh4BL/nrWhNUw6a
 wi9w==
X-Gm-Message-State: AOAM530HCiylRQ7CCps1To4YQbPfC5IO6GnOiPLX2dgCUr1zC7P0roqA
 3WwSlL72CIHkB56O++8bmWiUAS5rzLM=
X-Google-Smtp-Source: ABdhPJxCr1gDgca96NX3Zx1vjS6r9FuazG5RNYVZsXjhIQZ9R5gsBpiFkP9/Cub9i/Ueb8uv7qWkrA==
X-Received: by 2002:a05:620a:a85:: with SMTP id
 v5mr9290794qkg.261.1631303768676; 
 Fri, 10 Sep 2021 12:56:08 -0700 (PDT)
Received: from rekt.COMFAST ([191.193.98.206])
 by smtp.gmail.com with ESMTPSA id k10sm3873356qth.44.2021.09.10.12.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 12:56:08 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 6/6] spapr_numa.c: FORM2 NUMA affinity support
Date: Fri, 10 Sep 2021 16:55:39 -0300
Message-Id: <20210910195539.797170-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910195539.797170-1-danielhb413@gmail.com>
References: <20210910195539.797170-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72e.google.com
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

- get_max_dist_ref_points() and get_numa_assoc_size() now checks for
OV5_FORM2_AFFINITY and returns FORM2 values if the guest selected FORM2
affinity during CAS.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c              |   8 ++
 hw/ppc/spapr_numa.c         | 151 +++++++++++++++++++++++++++++++++++-
 include/hw/ppc/spapr.h      |   2 +
 include/hw/ppc/spapr_ovec.h |   1 +
 4 files changed, 159 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 0703a26093..23aba5ae2d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2766,6 +2766,11 @@ static void spapr_machine_init(MachineState *machine)
 
     spapr_ovec_set(spapr->ov5, OV5_FORM1_AFFINITY);
 
+    /* Do not advertise FORM2 NUMA support for pseries-6.1 and older */
+    if (!smc->pre_6_2_numa_affinity) {
+        spapr_ovec_set(spapr->ov5, OV5_FORM2_AFFINITY);
+    }
+
     /* advertise support for dedicated HP event source to guests */
     if (spapr->use_hotplug_event_source) {
         spapr_ovec_set(spapr->ov5, OV5_HP_EVT);
@@ -4681,8 +4686,11 @@ DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
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
index 0ade63c2d3..dd52b8921c 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -31,12 +31,22 @@
 #define FORM1_DIST_REF_POINTS            4
 #define FORM1_NUMA_ASSOC_SIZE            (FORM1_DIST_REF_POINTS + 1)
 
+/*
+ * FORM2 NUMA affinity has a single associativity domain, giving
+ * us a assoc size of 2.
+ */
+#define FORM2_DIST_REF_POINTS            1
+#define FORM2_NUMA_ASSOC_SIZE            (FORM2_DIST_REF_POINTS + 1)
+
 /*
  * Retrieves max_dist_ref_points of the current NUMA affinity.
  */
 static int get_max_dist_ref_points(SpaprMachineState *spapr)
 {
-    /* No FORM2 affinity implemented yet */
+    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
+        return FORM2_DIST_REF_POINTS;
+    }
+
     return FORM1_DIST_REF_POINTS;
 }
 
@@ -45,7 +55,10 @@ static int get_max_dist_ref_points(SpaprMachineState *spapr)
  */
 static int get_numa_assoc_size(SpaprMachineState *spapr)
 {
-    /* No FORM2 affinity implemented yet */
+    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
+        return FORM2_NUMA_ASSOC_SIZE;
+    }
+
     return FORM1_NUMA_ASSOC_SIZE;
 }
 
@@ -305,10 +318,39 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
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
+        spapr->FORM2_assoc_array[i] = g_new0(uint32_t, 2);
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
 
     /*
      * Default to FORM1 affinity until CAS. We'll call affinity_reset()
@@ -326,7 +368,11 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
 void spapr_numa_associativity_reset(SpaprMachineState *spapr,
                                     bool post_CAS_check)
 {
-    /* No FORM2 affinity implemented yet */
+    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
+        spapr->numa_assoc_array = spapr->FORM2_assoc_array;
+        return;
+    }
+
     spapr->numa_assoc_array = spapr->FORM1_assoc_array;
 
     if (post_CAS_check) {
@@ -471,6 +517,100 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
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
@@ -478,6 +618,11 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
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
index 2554928250..2a4502b65d 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -133,6 +133,7 @@ struct SpaprMachineClass {
     hwaddr rma_limit;          /* clamp the RMA to this size */
     bool pre_5_1_assoc_refpoints;
     bool pre_5_2_numa_associativity;
+    bool pre_6_2_numa_affinity;
 
     bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
                           uint64_t *buid, hwaddr *pio,
@@ -238,6 +239,7 @@ struct SpaprMachineState {
     SpaprTpmProxy *tpm_proxy;
 
     uint32_t *FORM1_assoc_array[NUMA_NODES_MAX_NUM];
+    uint32_t *FORM2_assoc_array[NUMA_NODES_MAX_NUM];
     uint32_t **numa_assoc_array;
 
     Error *fwnmi_migration_blocker;
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


