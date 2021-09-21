Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7AF413AEC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 21:45:39 +0200 (CEST)
Received: from localhost ([::1]:52814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSlhx-0006el-Nw
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 15:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSlgQ-0005nL-Ek; Tue, 21 Sep 2021 15:44:02 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:41953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSlgO-00016N-Kv; Tue, 21 Sep 2021 15:44:02 -0400
Received: by mail-qv1-xf35.google.com with SMTP id r18so390661qvy.8;
 Tue, 21 Sep 2021 12:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c4945fIv4YDsDCTW9UWm8COJgQ+HKzNXCTc5rO5BtJg=;
 b=btMDQmZhxVKRfaqRA4stf4C7D2nf40lLaZ5rWvH2s5l5WnMWgi2wNQ3st7oVd+AXK5
 QjKOK7CM62A9T1U9mHKDfV+SDsHVh/qwx2fPFGFkRn4viAlmj9hkAvK/R/xgRPRUK3rN
 SD66iJsmmfESyci073My1F+45PFHUyyuUnDuGwskp2hlh5+Mgu+A8S8xMt90JHIZDBbY
 G8bjlomWaCeQqk/5nuN2+ZpYalvUghnU21jHKV4K23RBBL5/EN9rUnp0z1cpqclDYp5c
 A2g0J7RaHUcDuzt011p9mPQJ8Muje/+nJxT3ttOX5vlOfy2b84/jsmZWxbfPix2jffwY
 Qvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c4945fIv4YDsDCTW9UWm8COJgQ+HKzNXCTc5rO5BtJg=;
 b=QEFXq2Ej8eLOOmuQYd46NdPpKGJ+L2sdB46JKr/ADjPtQYO7bvXxyIUbULx36ZvIPb
 uI4gjNGQXULLeTAWZhtcTKHHT5Ixkyl+WUk8ffcIyvRmCt6TUylxxnRMCpHWnQMDhE30
 ywX+crTbq78gLOHgRdh0gybCBoi+0F28OOzCjLSuGKRQhcarhajCkfkWTqI172nWhqmM
 +RknPmPIeDqk2VH31ySu6QCXJHE7xf1ksrcNi3+kUMGJBmOoZIluZtVTMeABk4FRRbDN
 rz+nltOzw6J9R3DF/CxFLPucTMY9yU+FEbi7wkBE0jJJoT0OhVvFZ7ifOmD9tjqDlWBd
 aeuQ==
X-Gm-Message-State: AOAM532XZHXNyTxtN62PJKFBy9/2lGWd7iZWYKWazsvl/wkIyIvpgpfM
 Qdl12InGniXc+KxIwhx2szJkUtec3f0=
X-Google-Smtp-Source: ABdhPJx8tjXmPrlkFVF7ImewaREC0qfOLvPKG6iwFPpDneRY/I+rQ6bZEMQ8bXabEbbXPV8VHrqZ8Q==
X-Received: by 2002:a0c:a889:: with SMTP id x9mr13217668qva.11.1632253438576; 
 Tue, 21 Sep 2021 12:43:58 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id t17sm4529772qtq.56.2021.09.21.12.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 12:43:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] spapr_numa.c: fixes in spapr_numa_FORM2_write_rtas_tables()
Date: Tue, 21 Sep 2021 16:43:47 -0300
Message-Id: <20210921194347.52347-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf35.google.com
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

This patch has a handful of modifications for the recent added
FORM2 support:

- there is no particular reason for both 'lookup_index_table' and
'distance_table' to be allocated in the heap, since their sizes are
known right at the start of the function. Use static allocation in
them to spare a couple of g_new0() calls;

- to not allocate more than the necessary size in 'distance_table'. At
this moment the array is oversized due to allocating uint32_t for all
elements, when most of them fits in an uint8_t;

- create a NUMA_LOCAL_DISTANCE macro to avoid hardcoding the local
distance value.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 58d5dc7084..039a0439c6 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -19,6 +19,9 @@
 /* Moved from hw/ppc/spapr_pci_nvlink2.c */
 #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
 
+/* Macro to avoid hardcoding the local distance value */
+#define NUMA_LOCAL_DISTANCE         10
+
 /*
  * Retrieves max_dist_ref_points of the current NUMA affinity.
  */
@@ -500,17 +503,21 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
     MachineState *ms = MACHINE(spapr);
     NodeInfo *numa_info = ms->numa_state->nodes;
     int nb_numa_nodes = ms->numa_state->num_nodes;
+    /* Lookup index table has an extra uint32_t with its length */
+    uint32_t lookup_index_table[nb_numa_nodes + 1];
     int distance_table_entries = nb_numa_nodes * nb_numa_nodes;
-    g_autofree uint32_t *lookup_index_table = NULL;
-    g_autofree uint32_t *distance_table = NULL;
-    int src, dst, i, distance_table_size;
-    uint8_t *node_distances;
+    /*
+     * Distance table is an uint8_t array with a leading uint32_t
+     * containing its length.
+     */
+    uint8_t distance_table[distance_table_entries + 4];
+    uint32_t *distance_table_length;
+    int src, dst, i;
 
     /*
      * ibm,numa-lookup-index-table: array with length and a
      * list of NUMA ids present in the guest.
      */
-    lookup_index_table = g_new0(uint32_t, nb_numa_nodes + 1);
     lookup_index_table[0] = cpu_to_be32(nb_numa_nodes);
 
     for (i = 0; i < nb_numa_nodes; i++) {
@@ -518,8 +525,7 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
     }
 
     _FDT(fdt_setprop(fdt, rtas, "ibm,numa-lookup-index-table",
-                     lookup_index_table,
-                     (nb_numa_nodes + 1) * sizeof(uint32_t)));
+                     lookup_index_table, sizeof(lookup_index_table)));
 
     /*
      * ibm,numa-distance-table: contains all node distances. First
@@ -531,11 +537,10 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
      * array because NUMA ids can be sparse (node 0 is the first,
      * node 8 is the second ...).
      */
-    distance_table = g_new0(uint32_t, distance_table_entries + 1);
-    distance_table[0] = cpu_to_be32(distance_table_entries);
+    distance_table_length = (uint32_t *)distance_table;
+    distance_table_length[0] = cpu_to_be32(distance_table_entries);
 
-    node_distances = (uint8_t *)&distance_table[1];
-    i = 0;
+    i = 4;
 
     for (src = 0; src < nb_numa_nodes; src++) {
         for (dst = 0; dst < nb_numa_nodes; dst++) {
@@ -546,18 +551,16 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
              * adding the numa_info to retrieve distance info from.
              */
             if (src == dst) {
-                node_distances[i++] = 10;
+                distance_table[i++] = NUMA_LOCAL_DISTANCE;
                 continue;
             }
 
-            node_distances[i++] = numa_info[src].distance[dst];
+            distance_table[i++] = numa_info[src].distance[dst];
         }
     }
 
-    distance_table_size = distance_table_entries * sizeof(uint8_t) +
-                          sizeof(uint32_t);
     _FDT(fdt_setprop(fdt, rtas, "ibm,numa-distance-table",
-                     distance_table, distance_table_size));
+                     distance_table, sizeof(distance_table)));
 }
 
 /*
-- 
2.31.1


