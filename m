Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6391D3BE8F0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 15:43:24 +0200 (CEST)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m17pj-0006tU-Em
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 09:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1m17nO-0003PT-VH
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:40:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1m17nL-0005pa-BE
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625665254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JA2dEBiX752pGOKGQK1EWz6l4XO4kSrIh3rxrRRVnAI=;
 b=ekhHv3/x6MNcZsZ/OnsNxTp8TqbUb6wtDSv+WLAuKRoT9G/Apl5K5gMnYknX1n1tMqD9iw
 ZTbf7NDFiTQaNF3ntfp3UY/+SyDSVVrt6krn7YB2evCyxPaUuPnSWaUEZHT3OXa0iSMexr
 Sfc8f+pTYjZXqFeifF9e1FGDZc/MUyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-TPo8IhRCPauN-aZGm6aMmg-1; Wed, 07 Jul 2021 09:40:52 -0400
X-MC-Unique: TPo8IhRCPauN-aZGm6aMmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B8D618414A0;
 Wed,  7 Jul 2021 13:40:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 705405D6AB;
 Wed,  7 Jul 2021 13:40:50 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] numa: Parse initiator= attribute before cpus= attribute
Date: Wed,  7 Jul 2021 15:40:30 +0200
Message-Id: <b27a6a88986d63e3f610a728c845e01ff8d92e2e.1625662776.git.mprivozn@redhat.com>
In-Reply-To: <cover.1625662776.git.mprivozn@redhat.com>
References: <cover.1625662776.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: imammedo@redhat.com, tao3.xu@intel.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When parsing cpus= attribute of -numa object couple of checks
is performed, such as correct initiator setting (see the if()
statement at the end of for() loop in
machine_set_cpu_numa_node()).

However, with the current code cpus= attribute is parsed before
initiator= attribute and thus the check may fail even though it
is not obvious why. But since parsing the initiator= attribute
does not depend on the cpus= attribute we can swap the order of
the two.

It's fairly easy to reproduce with the following command line
(snippet of an actual cmd line):

  -smp 4,sockets=4,cores=1,threads=1 \
  -object '{"qom-type":"memory-backend-ram","id":"ram-node0","size":2147483648}' \
  -numa node,nodeid=0,cpus=0-1,initiator=0,memdev=ram-node0 \
  -object '{"qom-type":"memory-backend-ram","id":"ram-node1","size":2147483648}' \
  -numa node,nodeid=1,cpus=2-3,initiator=1,memdev=ram-node1 \
  -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=5 \
  -numa hmat-lb,initiator=0,target=0,hierarchy=first-level,data-type=access-latency,latency=10 \
  -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=5 \
  -numa hmat-lb,initiator=1,target=1,hierarchy=first-level,data-type=access-latency,latency=10 \
  -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=204800K \
  -numa hmat-lb,initiator=0,target=0,hierarchy=first-level,data-type=access-bandwidth,bandwidth=208896K \
  -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=204800K \
  -numa hmat-lb,initiator=1,target=1,hierarchy=first-level,data-type=access-bandwidth,bandwidth=208896K \
  -numa hmat-cache,node-id=0,size=10K,level=1,associativity=direct,policy=write-back,line=8 \
  -numa hmat-cache,node-id=1,size=10K,level=1,associativity=direct,policy=write-back,line=8 \

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 hw/core/numa.c | 45 +++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 1058d3697b..510d096a88 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -88,6 +88,29 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
         return;
     }
 
+    /*
+     * If not set the initiator, set it to MAX_NODES. And if
+     * HMAT is enabled and this node has no cpus, QEMU will raise error.
+     */
+    numa_info[nodenr].initiator = MAX_NODES;
+    if (node->has_initiator) {
+        if (!ms->numa_state->hmat_enabled) {
+            error_setg(errp, "ACPI Heterogeneous Memory Attribute Table "
+                       "(HMAT) is disabled, enable it with -machine hmat=on "
+                       "before using any of hmat specific options");
+            return;
+        }
+
+        if (node->initiator >= MAX_NODES) {
+            error_report("The initiator id %" PRIu16 " expects an integer "
+                         "between 0 and %d", node->initiator,
+                         MAX_NODES - 1);
+            return;
+        }
+
+        numa_info[nodenr].initiator = node->initiator;
+    }
+
     for (cpus = node->cpus; cpus; cpus = cpus->next) {
         CpuInstanceProperties props;
         if (cpus->value >= max_cpus) {
@@ -142,28 +165,6 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
         numa_info[nodenr].node_memdev = MEMORY_BACKEND(o);
     }
 
-    /*
-     * If not set the initiator, set it to MAX_NODES. And if
-     * HMAT is enabled and this node has no cpus, QEMU will raise error.
-     */
-    numa_info[nodenr].initiator = MAX_NODES;
-    if (node->has_initiator) {
-        if (!ms->numa_state->hmat_enabled) {
-            error_setg(errp, "ACPI Heterogeneous Memory Attribute Table "
-                       "(HMAT) is disabled, enable it with -machine hmat=on "
-                       "before using any of hmat specific options");
-            return;
-        }
-
-        if (node->initiator >= MAX_NODES) {
-            error_report("The initiator id %" PRIu16 " expects an integer "
-                         "between 0 and %d", node->initiator,
-                         MAX_NODES - 1);
-            return;
-        }
-
-        numa_info[nodenr].initiator = node->initiator;
-    }
     numa_info[nodenr].present = true;
     max_numa_nodeid = MAX(max_numa_nodeid, nodenr + 1);
     ms->numa_state->num_nodes++;
-- 
2.31.1


