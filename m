Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60DE44A76B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:13:09 +0100 (CET)
Received: from localhost ([::1]:41614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLJc-00026f-LS
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:13:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK5L-0006U1-Uw; Tue, 09 Nov 2021 00:54:21 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=42747
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK5K-0006z7-4R; Tue, 09 Nov 2021 00:54:19 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDq0RH8z4xfX; Tue,  9 Nov 2021 16:52:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437131;
 bh=+XrjXMLI1dwUOwhjHw1bC0qTv6boNamsXU1qE5Lo9sw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C/gTF9mgTzM793lh+2ED1gqhcoREdmmvGkTU1dvK2n6QSEDIMAyxebW9mxZQTxjvj
 +2mnHLuEWpagafKlCX06kraigzXQGZGBvy7qmk+0ijgjpqtkKiFEio57Hlf5VEnAc6
 KTqFoOCQOdYfL5xnf9DkjnQfdO5mUhz8yufp6Bzc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 54/54] spapr_numa.c: FORM2 table handle nodes with no distance
 info
Date: Tue,  9 Nov 2021 16:52:04 +1100
Message-Id: <20211109055204.230765-55-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

A configuration that specifies multiple nodes without distance info
results in the non-local points in the FORM2 matrix having a distance of
0. This causes Linux to complain "Invalid distance value range" because
a node distance is smaller than the local distance.

Fix this by building a simple local / remote fallback for points where
distance information is missing.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20211105135137.1584840-1-npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_numa.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 5822938448..56ab2a5fb6 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -546,12 +546,24 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
              * NUMA nodes, but QEMU adds the default NUMA node without
              * adding the numa_info to retrieve distance info from.
              */
-            if (src == dst) {
-                distance_table[i++] = NUMA_DISTANCE_MIN;
-                continue;
+            distance_table[i] = numa_info[src].distance[dst];
+            if (distance_table[i] == 0) {
+                /*
+                 * In case QEMU adds a default NUMA single node when the user
+                 * did not add any, or where the user did not supply distances,
+                 * the value will be 0 here. Populate the table with a fallback
+                 * simple local / remote distance.
+                 */
+                if (src == dst) {
+                    distance_table[i] = NUMA_DISTANCE_MIN;
+                } else {
+                    distance_table[i] = numa_info[src].distance[dst];
+                    if (distance_table[i] < NUMA_DISTANCE_MIN) {
+                        distance_table[i] = NUMA_DISTANCE_DEFAULT;
+                    }
+                }
             }
-
-            distance_table[i++] = numa_info[src].distance[dst];
+            i++;
         }
     }
 
-- 
2.33.1


