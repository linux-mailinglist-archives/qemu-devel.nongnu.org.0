Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2123E44E584
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:21:24 +0100 (CET)
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUcV-0005xP-9I
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:21:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mlUXL-0005dq-5U
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:16:03 -0500
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:36337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mlUXF-00078S-Fr
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:16:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C07B721CC6;
 Fri, 12 Nov 2021 11:15:46 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 12 Nov
 2021 12:15:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00479648c07-1230-4c61-b750-4543476d94d5,
 F9CF0200ECD1631E1678AE6CCE6AA99FD507468A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Subject: [PULL 2/3] spapr_numa.c: fix FORM1 distance-less nodes
Date: Fri, 12 Nov 2021 12:15:42 +0100
Message-ID: <20211112111543.2556837-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112111543.2556837-1-clg@kaod.org>
References: <20211112111543.2556837-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 71f26322-8e31-43ef-8e79-f4ebd8241a32
X-Ovh-Tracer-Id: 5539990492451605295
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrvdefgddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeetjeefleehtdehfefhvdduieevheellefggfekhfeltdfgteevjedtveduueetheenucffohhmrghinhepghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Commit 71e6fae3a99 fixed an issue with FORM2 affinity guests with NUMA
nodes in which the distance info is absent in
machine_state->numa_state->nodes. This happens when QEMU adds a default
NUMA node and when the user adds NUMA nodes without specifying the
distances.

During the discussions of the forementioned patch [1] it was found that
FORM1 guests were behaving in a strange way in the same scenario, with
the kernel seeing the distances between the nodes as '160', as we can
see in this example with 4 NUMA nodes without distance information:

$ numactl -H
available: 4 nodes (0-3)
(...)
node distances:
node   0   1   2   3
  0:  10  160  160  160
  1:  160  10  160  160
  2:  160  160  10  160
  3:  160  160  160  10

Turns out that we have the same problem with FORM1 guests - we are
calculating associativity domain using zeroed values. And as it also
turns out, the solution from 71e6fae3a99 applies to FORM1 as well.

This patch creates a wrapper called 'get_numa_distance' that contains
the logic used in FORM2 to define node distances when this information
is absent. This helper is then used in all places where we need to read
distance information from machine_state->numa_state->nodes. That way
we'll guarantee that the NUMA node distance is always being curated
before being used.

After this patch, the FORM1 guest mentioned above will have the
following topology:

$ numactl -H
available: 4 nodes (0-3)
(...)
node distances:
node   0   1   2   3
  0:  10  20  20  20
  1:  20  10  20  20
  2:  20  20  10  20
  3:  20  20  20  10

This is compatible with what FORM2 guests and other archs do in this
case.

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg01960.html

Fixes: 690fbe4295d5 ("spapr_numa: consider user input when defining associativity")
CC: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
CC: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/spapr_numa.c | 62 ++++++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 56ab2a5fb649..e9ef7e764696 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -66,16 +66,41 @@ static const uint32_t *get_associativity(SpaprMachineState *spapr, int node_id)
     return spapr->FORM1_assoc_array[node_id];
 }
 
+/*
+ * Wrapper that returns node distance from ms->numa_state->nodes
+ * after handling edge cases where the distance might be absent.
+ */
+static int get_numa_distance(MachineState *ms, int src, int dst)
+{
+    NodeInfo *numa_info = ms->numa_state->nodes;
+    int ret = numa_info[src].distance[dst];
+
+    if (ret != 0) {
+        return ret;
+    }
+
+    /*
+     * In case QEMU adds a default NUMA single node when the user
+     * did not add any, or where the user did not supply distances,
+     * the distance will be absent (zero). Return local/remote
+     * distance in this case.
+     */
+    if (src == dst) {
+        return NUMA_DISTANCE_MIN;
+    }
+
+    return NUMA_DISTANCE_DEFAULT;
+}
+
 static bool spapr_numa_is_symmetrical(MachineState *ms)
 {
-    int src, dst;
     int nb_numa_nodes = ms->numa_state->num_nodes;
-    NodeInfo *numa_info = ms->numa_state->nodes;
+    int src, dst;
 
     for (src = 0; src < nb_numa_nodes; src++) {
         for (dst = src; dst < nb_numa_nodes; dst++) {
-            if (numa_info[src].distance[dst] !=
-                numa_info[dst].distance[src]) {
+            if (get_numa_distance(ms, src, dst) !=
+                get_numa_distance(ms, dst, src)) {
                 return false;
             }
         }
@@ -133,7 +158,6 @@ static uint8_t spapr_numa_get_numa_level(uint8_t distance)
 static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
 {
     MachineState *ms = MACHINE(spapr);
-    NodeInfo *numa_info = ms->numa_state->nodes;
     int nb_numa_nodes = ms->numa_state->num_nodes;
     int src, dst, i, j;
 
@@ -170,7 +194,7 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
              * The PPC kernel expects the associativity domains of node 0 to
              * be always 0, and this algorithm will grant that by default.
              */
-            uint8_t distance = numa_info[src].distance[dst];
+            uint8_t distance = get_numa_distance(ms, src, dst);
             uint8_t n_level = spapr_numa_get_numa_level(distance);
             uint32_t assoc_src;
 
@@ -498,7 +522,6 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
                                                void *fdt, int rtas)
 {
     MachineState *ms = MACHINE(spapr);
-    NodeInfo *numa_info = ms->numa_state->nodes;
     int nb_numa_nodes = ms->numa_state->num_nodes;
     int distance_table_entries = nb_numa_nodes * nb_numa_nodes;
     g_autofree uint32_t *lookup_index_table = NULL;
@@ -540,30 +563,7 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
 
     for (src = 0; src < nb_numa_nodes; src++) {
         for (dst = 0; dst < nb_numa_nodes; dst++) {
-            /*
-             * We need to be explicit with the local distance
-             * value to cover the case where the user didn't added any
-             * NUMA nodes, but QEMU adds the default NUMA node without
-             * adding the numa_info to retrieve distance info from.
-             */
-            distance_table[i] = numa_info[src].distance[dst];
-            if (distance_table[i] == 0) {
-                /*
-                 * In case QEMU adds a default NUMA single node when the user
-                 * did not add any, or where the user did not supply distances,
-                 * the value will be 0 here. Populate the table with a fallback
-                 * simple local / remote distance.
-                 */
-                if (src == dst) {
-                    distance_table[i] = NUMA_DISTANCE_MIN;
-                } else {
-                    distance_table[i] = numa_info[src].distance[dst];
-                    if (distance_table[i] < NUMA_DISTANCE_MIN) {
-                        distance_table[i] = NUMA_DISTANCE_DEFAULT;
-                    }
-                }
-            }
-            i++;
+            distance_table[i++] = get_numa_distance(ms, src, dst);
         }
     }
 
-- 
2.31.1


