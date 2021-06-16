Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7DD3A8E6B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:32:24 +0200 (CEST)
Received: from localhost ([::1]:37846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKPn-0004wh-EP
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltKDw-0003VH-T5; Tue, 15 Jun 2021 21:20:08 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:34334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltKDu-0004Hz-8B; Tue, 15 Jun 2021 21:20:08 -0400
Received: by mail-qv1-xf36.google.com with SMTP id 5so769996qvf.1;
 Tue, 15 Jun 2021 18:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p2HUBwJU498l6zjmIzeCkAS9jKLDEKJ6AtdgcGE3JCM=;
 b=N9ku13QWQ3ER9kOO346ynkSJI981s3KuPDQed1p6ZjGgx5DslDOzFyU7NRUY9VAtKs
 R0O4ocwfvv6I9X77CqXwzTxvSzXb7KnDvu042OTG1K9H4y9mL6df49dtAgtumb+GiV/Q
 RzKF/HRFgLHViTLekgbWempbwTqFahA/qJKJuxOzLeuSTPrBejRezfomfNnQr5OaRcAf
 PuIGitf547hDrrLdivvBPs6gMq0kU5bgcSAlz/2ljubrzme0GCit0X6DMhPPw4m3yVmd
 NU/W77jYpJ4C+T6nR7o6mh8pCB8v2CuUD7+dDwOZooLVc3KnjCqcP6NqSLDn8yXe+Nlt
 ELVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p2HUBwJU498l6zjmIzeCkAS9jKLDEKJ6AtdgcGE3JCM=;
 b=IERg/n34rIkN6uCqgHPBTlkaR3GB3WghcaIoBqlnQpRVhcYbcvpWs5lDDPlDm5SHNG
 KcMcYAl2n90ZPZui3TsNnUqk5o7TJZV4Rd9jrXMEB49OzJHyWOzKcXax+MxcYApGlXyo
 gp8LC+sNYTkvahgDaHULEcsGV7eklQLbrd7wkOMSyN72DXb3Vbuf3D2EyjR/yzZkV4XU
 Pn1GRmRrC1cABFRLnV53Jqy8ChI/8GVWuvdJL0HOlhjxNeTZm2A6TtVfQ1IBa/Sj6UNN
 ocW2xmcEmMxeIx1+nGTtTJJQppWhPp2MujsPp9V0XDaLeTXx2L5ZzlOVHKNF7tMNZhAE
 MtaA==
X-Gm-Message-State: AOAM530sG5OH54p8cdPDIZZ5ewS9vXlxqjfffRR5zGjKpLNvhe3sBYF8
 9WPOS9EMrM5DkqO76APpFmEAZ5sZ3B0=
X-Google-Smtp-Source: ABdhPJyRCSre5+1Yb8hVAnZ792UmjbwPgIU3eK3D8ih6ZxqrTP4rjCuE3GvoCAs7Ypx3hBhD1AcxJA==
X-Received: by 2002:a0c:b38c:: with SMTP id t12mr7970847qve.44.1623806404597; 
 Tue, 15 Jun 2021 18:20:04 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id f19sm627994qkg.70.2021.06.15.18.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:20:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 3/7] spapr_numa.c: base FORM2 NUMA affinity support
Date: Tue, 15 Jun 2021 22:19:40 -0300
Message-Id: <20210616011944.2996399-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616011944.2996399-1-danielhb413@gmail.com>
References: <20210616011944.2996399-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf36.google.com
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
or FORM2 affinity. Setting both forms will default to FORM2. We rely on
CAS to decide what to write in the DT, so all writing is postponed until
client architecture support is done. This also mean that we're not
advertising FORM2 for pseries-6.0 and older machine versions to prevent
guest visible changes;

- ibm,associativity-reference-points has a new semantic. Instead of
being used to calculate distances via NUMA levels, the concept of
subdomain was introduced. The primary domain is the first element of the
array, secondary domain is the second element and so on. At this moment,
the only usage of this semantic is with NVDIMMs. This will be explained
further in the next patches;

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
 hw/ppc/spapr.c              |  21 ++++++
 hw/ppc/spapr_numa.c         | 140 +++++++++++++++++++++++++++++++++++-
 include/hw/ppc/spapr_ovec.h |   1 +
 3 files changed, 161 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 8c8029e190..3f655d5084 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1770,6 +1770,22 @@ static int spapr_post_load(void *opaque, int version_id)
         return err;
     }
 
+    /*
+     * NUMA data init is made in CAS time. There is no reliable
+     * way of telling whether the guest already went through CAS
+     * in the source due to how spapr_ov5_cas_needed works: a
+     * FORM1 guest can be migrated with ov5_cas empty regardless
+     * of going through CAS first.
+     *
+     * One solution is to always call numa_associativity_init. The
+     * downside is that a guest migrated before CAS will run
+     * numa_associativity_init again when going through it, but
+     * at least we're making sure spapr->numa_assoc_array will be
+     * initialized and hotplug operations won't fail in both before
+     * and after CAS migration cases.
+     */
+     spapr_numa_associativity_init(spapr, MACHINE(spapr));
+
     return err;
 }
 
@@ -2734,6 +2750,11 @@ static void spapr_machine_init(MachineState *machine)
 
     spapr_ovec_set(spapr->ov5, OV5_FORM1_AFFINITY);
 
+    /* Do not advertise FORM2 support for pseries-6.0 and older */
+    if (!smc->pre_6_1_numa_affinity) {
+        spapr_ovec_set(spapr->ov5, OV5_FORM2_AFFINITY);
+    }
+
     /* advertise support for dedicated HP event source to guests */
     if (spapr->use_hotplug_event_source) {
         spapr_ovec_set(spapr->ov5, OV5_HP_EVT);
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index b0bd056546..4298a4ecdb 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -202,6 +202,16 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
         spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
         spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
 
+        /*
+         * For FORM2 affinity the initialization above is enough. No
+         * need to fill non-zero NUMA nodes with node_id because
+         * there is no associativity domain match to calculate
+         * NUMA distances in FORM2.
+         */
+        if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
+            continue;
+        }
+
         /*
          * Fill all associativity domains of non-zero NUMA nodes with
          * node_id. This is required because the default value (0) is
@@ -236,7 +246,16 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
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
@@ -313,6 +332,120 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
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
+     * From the kernel docs: "With Form2 the primary domainID and
+     * secondary domainID are used to identify the NUMA nodes
+     * the kernel should use when using persistent memory devices."
+     *
+     * Persistent memory devices, such as spapr-nvdimm, will use the
+     * primary domainID to indicate the NUMA node number the guest
+     * OS should use when using the device as regular memory. The
+     * secondary domainID indicates the numa node number that should
+     * be used when the device is used as persistent memory.
+     *
+     * FORM2 specification allows for further subdomains such as
+     * tertiary and quaternary. To avoid having to update
+     * ibm,associativity-reference-points every time a new subdomain
+     * level is going to be used by the kernel, let's set all available
+     * subdomains QEMU is willing to support without increasing
+     * MAX_DISTANCE_REF_POINTS.
+     */
+    uint32_t refpoints[] = {
+        cpu_to_be32(0x4),
+        cpu_to_be32(0x3),
+        cpu_to_be32(0x2),
+        cpu_to_be32(0x1),
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
@@ -390,6 +523,11 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
         return;
     }
 
+    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
+        spapr_numa_FORM2_write_rtas_dt(spapr, fdt, rtas);
+        return;
+    }
+
     spapr_numa_FORM1_write_rtas_dt(spapr, fdt, rtas);
 }
 
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


