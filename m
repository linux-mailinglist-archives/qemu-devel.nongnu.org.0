Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DD53F7795
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 16:42:52 +0200 (CEST)
Received: from localhost ([::1]:60280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIu79-0005tp-Kg
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 10:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIu4S-0007uA-Ib; Wed, 25 Aug 2021 10:40:04 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:35839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIu4Q-00074l-2C; Wed, 25 Aug 2021 10:40:04 -0400
Received: by mail-qk1-x732.google.com with SMTP id 22so27394211qkg.2;
 Wed, 25 Aug 2021 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=owCZ35gtbPY8bBS59ZkdVXhAs9FpkCvk8rLNvjMOXYA=;
 b=mqxDnTiHyDlfDhL4ko76Nle9lfluV3aRCtzTLsl0jmM8pafSgsFc6eHrusHP4KQscu
 C9FWmrjxYroPGJIGDni3h33uK2PR/xSVQ87sVoRJ9yQyUIghLtykvfL7hKmvjfQSK78I
 CTezrKl/Zjrsxecct74GxGdEy4RaWi4H9DSUom17NtzMBHVZHNovAG4iqyp6UxzQvute
 t6mylYBqhShpanlJl77ZIafxTT1d94/h7NKRxWjabtjJMs5tDCIOqfuny5RdJm9U4Y/j
 wrd3fp9H1mKHpvDPp3/95Q7qqB0r74Ke9xwZ7AE3WiAKQmTCszSZFB9ZEF67qAp5Rxjm
 /pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=owCZ35gtbPY8bBS59ZkdVXhAs9FpkCvk8rLNvjMOXYA=;
 b=Z4do1YlZzm4F+GwpEGzPRAiponDtRFcxzy1zNXfRVvYTH0Bv2pgLqg7F/5+0zwuKJk
 Q9W2OsfWALVsp1HAal/EVF6Jhcw/7+u57az+Rlw/z38NzaCZywHeUyz1nB1twf5YYR/d
 YJxxmoMz8K3cE6VtUDbObPloj+EnPjQwebM2Rd5cTsgGgZumWa0eY5frvvriILCmjEZr
 e6kJVZtySLuGwqmymhMg1AALQjd4nI0ncTAQW0f4RLabPeAiYa1sbGHQvqc2o8wf6wic
 Lpf9LIvrxVMFnvr4g0Vyks0mXLRsUCH5RPHYouh85Swhml0mXvEG45KX6nHlZMmVTzdb
 kbTQ==
X-Gm-Message-State: AOAM531vH3bcJHLMcCxg3zxW8f7xKjx6uDMF2JspMzOZKo10EiG5ywhj
 4fNL9Q7F+kZJKU5kl/Q7bgs9kFNAY1c=
X-Google-Smtp-Source: ABdhPJx2As/xW30TtP60BhNha0MnNdYE6Up9ICe6jnsTiux/cuI41soH55UJpE1KH2wrX21hhV06/A==
X-Received: by 2002:ae9:f70c:: with SMTP id s12mr32132684qkg.254.1629902400561; 
 Wed, 25 Aug 2021 07:40:00 -0700 (PDT)
Received: from rekt.ihost.com ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id 69sm129819qke.55.2021.08.25.07.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 07:40:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH v3 3/5] spapr_numa.c: base FORM2 NUMA affinity support
Date: Wed, 25 Aug 2021 11:39:41 -0300
Message-Id: <20210825143943.529733-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825143943.529733-1-danielhb413@gmail.com>
References: <20210825143943.529733-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x732.google.com
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
or FORM2 affinity. Setting both forms will default to FORM2. We rely on
CAS to decide what to write in the DT, so all writing is postponed until
client architecture support is done. This also mean that we're not
advertising FORM2 for pseries-6.0 and older machine versions to prevent
guest visible changes;

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
 hw/ppc/spapr.c              |  21 ++++++
 hw/ppc/spapr_numa.c         | 127 +++++++++++++++++++++++++++++++++++-
 include/hw/ppc/spapr_ovec.h |   1 +
 3 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d8363bda88..69c7239c48 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1787,6 +1787,22 @@ static int spapr_post_load(void *opaque, int version_id)
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
 
@@ -2753,6 +2769,11 @@ static void spapr_machine_init(MachineState *machine)
 
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
index b0bd056546..1c894bf877 100644
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
@@ -313,6 +332,107 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
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
@@ -390,6 +510,11 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
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


