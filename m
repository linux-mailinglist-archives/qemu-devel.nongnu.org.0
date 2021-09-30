Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF9941D30D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:08:53 +0200 (CEST)
Received: from localhost ([::1]:46166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpFT-000753-2M
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVot1-00025t-J9; Thu, 30 Sep 2021 01:45:39 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:39785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosx-0003wx-BZ; Thu, 30 Sep 2021 01:45:38 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR3TLxz4xc2; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=hfMcxXBJtPHyird6v5DPZq11tYki/FAEj4jsPh29EkM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WWqYCCaW7VmW8JneuhFIb2CgrC0aWjdiVtL0qp/lH6Q4+sBfLEnkdtx+FOcK0e0no
 AgNT0CuvUlj54pKluP0nQIrJtwZAeJPXO+/1c6ksIVW1gw05tPJ7hORtwKN8laGAWb
 G8zc/yIRYkXs7hj9pTeETZTf+/CEpVCNspUmhMKY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 31/44] spapr_numa.c: handle auto NUMA node with no distance info
Date: Thu, 30 Sep 2021 15:44:13 +1000
Message-Id: <20210930054426.357344-32-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
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
 hpoussin@reactos.org, clg@kaod.org, Igor Mammedov <imammedo@redhat.com>,
 qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

numa_complete_configuration() in hw/core/numa.c always adds a NUMA node
for the pSeries machine if none was specified, but without node distance
information for the single node created.

NUMA FORM1 affinity code didn't rely on numa_state information to do its
job, but FORM2 does. As is now, this is the result of a pSeries guest
with NUMA FORM2 affinity when no NUMA nodes is specified:

$ numactl -H
available: 1 nodes (0)
node 0 cpus: 0
node 0 size: 16222 MB
node 0 free: 15681 MB
No distance information available.

This can be amended in spapr_numa_FORM2_write_rtas_tables(). We're
enforcing that the local distance (the distance to the node to itself) is
always 10. This allows for the proper creation of the NUMA distance tables,
fixing the output of 'numactl -H' in the guest:

$ numactl -H
available: 1 nodes (0)
node 0 cpus: 0
node 0 size: 16222 MB
node 0 free: 15685 MB
node distances:
node   0
  0:  10

CC: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210920174947.556324-8-danielhb413@gmail.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_numa.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 13db321997..58d5dc7084 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -539,6 +539,17 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
 
     for (src = 0; src < nb_numa_nodes; src++) {
         for (dst = 0; dst < nb_numa_nodes; dst++) {
+            /*
+             * We need to be explicit with the local distance
+             * value to cover the case where the user didn't added any
+             * NUMA nodes, but QEMU adds the default NUMA node without
+             * adding the numa_info to retrieve distance info from.
+             */
+            if (src == dst) {
+                node_distances[i++] = 10;
+                continue;
+            }
+
             node_distances[i++] = numa_info[src].distance[dst];
         }
     }
-- 
2.31.1


