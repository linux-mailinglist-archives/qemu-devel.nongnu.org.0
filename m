Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B628B41D33F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:23:33 +0200 (CEST)
Received: from localhost ([::1]:41022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpTg-0006Qg-Nb
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVot7-0002Ny-UM; Thu, 30 Sep 2021 01:45:45 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:53215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVot6-00044m-1O; Thu, 30 Sep 2021 01:45:45 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR3y5gz4xc6; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=yAY+LD8MQArIJOi80Rk5/239hHY0FX96UQCZuSlFHxs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yb4MiWax/qyb2Nk5l5p7VCxurLQGMDk6X7DRVeG5pV2Sd6NA+L3uhU1gWpnsWp+aZ
 IQTkkVTuCQZ/06Lkc1wD4m8/lrNR18qB2B/dEI/Elrhat4hXT3jE7GklaFMlK3AhCc
 L5Wo1d24mYARjfctw8m/g+NDTTDkpNVsCZQ0XPYg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 37/44] spapr_numa.c: fixes in
 spapr_numa_FORM2_write_rtas_tables()
Date: Thu, 30 Sep 2021 15:44:19 +1000
Message-Id: <20210930054426.357344-38-david@gibson.dropbear.id.au>
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

This patch has a handful of modifications for the recent added
FORM2 support:

- to not allocate more than the necessary size in 'distance_table'.
At this moment the array is oversized due to allocating uint32_t for
all elements, when most of them fits in an uint8_t. Fix it by
changing the array to uint8_t and allocating the exact size;

- use stl_be_p() to store the uint32_t at the start of 'distance_table';

- use sizeof(uint32_t) to skip the uint32_t length when populating the
distances;

- use the NUMA_DISTANCE_MIN macro from sysemu/numa.h to avoid hardcoding
the local distance value.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210922122852.130054-2-danielhb413@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_numa.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 58d5dc7084..5822938448 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -502,9 +502,8 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
     int nb_numa_nodes = ms->numa_state->num_nodes;
     int distance_table_entries = nb_numa_nodes * nb_numa_nodes;
     g_autofree uint32_t *lookup_index_table = NULL;
-    g_autofree uint32_t *distance_table = NULL;
+    g_autofree uint8_t *distance_table = NULL;
     int src, dst, i, distance_table_size;
-    uint8_t *node_distances;
 
     /*
      * ibm,numa-lookup-index-table: array with length and a
@@ -531,11 +530,13 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
      * array because NUMA ids can be sparse (node 0 is the first,
      * node 8 is the second ...).
      */
-    distance_table = g_new0(uint32_t, distance_table_entries + 1);
-    distance_table[0] = cpu_to_be32(distance_table_entries);
+    distance_table_size = distance_table_entries * sizeof(uint8_t) +
+                          sizeof(uint32_t);
+    distance_table = g_new0(uint8_t, distance_table_size);
+    stl_be_p(distance_table, distance_table_entries);
 
-    node_distances = (uint8_t *)&distance_table[1];
-    i = 0;
+    /* Skip the uint32_t array length at the start */
+    i = sizeof(uint32_t);
 
     for (src = 0; src < nb_numa_nodes; src++) {
         for (dst = 0; dst < nb_numa_nodes; dst++) {
@@ -546,16 +547,14 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
              * adding the numa_info to retrieve distance info from.
              */
             if (src == dst) {
-                node_distances[i++] = 10;
+                distance_table[i++] = NUMA_DISTANCE_MIN;
                 continue;
             }
 
-            node_distances[i++] = numa_info[src].distance[dst];
+            distance_table[i++] = numa_info[src].distance[dst];
         }
     }
 
-    distance_table_size = distance_table_entries * sizeof(uint8_t) +
-                          sizeof(uint32_t);
     _FDT(fdt_setprop(fdt, rtas, "ibm,numa-distance-table",
                      distance_table, distance_table_size));
 }
-- 
2.31.1


