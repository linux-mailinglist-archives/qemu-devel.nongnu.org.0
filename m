Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2CA42B461
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 07:01:13 +0200 (CEST)
Received: from localhost ([::1]:36326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maWO8-0005qx-62
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 01:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maWLa-0002XX-Vx
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 00:58:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maWLY-0004mV-Mu
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 00:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634101111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L4YegJM/qszkErTdodpTlQGO+o8Lz2xnY4Y8/EmBw8M=;
 b=Xts+WsmUNFVpNT/+NMn6QTlzKyIy4sZLxWSsCUwsjPtucM0ZKSIecH8aHmLOfSGF2mVxBQ
 j9o25wwcnvO86qzc4oa1BQJIrbH1Iz4SP7I38OgV+FAMbkKubHbw1QLPvCRM1P2EkYLsOE
 xQuOvKucB+Rc9DA8neOr+0UugDO0MSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-m_q7Y-WXPeCfTTxqRjPNgQ-1; Wed, 13 Oct 2021 00:58:24 -0400
X-MC-Unique: m_q7Y-WXPeCfTTxqRjPNgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2750C10A8E01;
 Wed, 13 Oct 2021 04:58:23 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E04F5D9C6;
 Wed, 13 Oct 2021 04:58:20 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 1/2] numa: Require distance map when empty node exists
Date: Wed, 13 Oct 2021 12:58:04 +0800
Message-Id: <20211013045805.192165-2-gshan@redhat.com>
In-Reply-To: <20211013045805.192165-1-gshan@redhat.com>
References: <20211013045805.192165-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: robh@kernel.org, drjones@redhat.com, ehabkost@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, shan.gavin@gmail.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following option is used to specify the distance map. It's
possible the option isn't provided by user. In this case, the
distance map isn't populated and exposed to platform. On the
other hand, the empty NUMA node, where no memory resides, is
allowed on platforms like ARM64 virt. For these empty NUMA
nodes, their corresponding device-tree nodes aren't populated,
but their NUMA IDs should be included in the "/distance-map"
device-tree node, so that kernel can probe them properly if
device-tree is used.

  -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>

This adds extra check after the machine is initialized, to
ask for the distance map from user when empty nodes exist in
device-tree.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/machine.c     |  4 ++++
 hw/core/numa.c        | 24 ++++++++++++++++++++++++
 include/sysemu/numa.h |  1 +
 3 files changed, 29 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index b8d95eec32..c0765ad973 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1355,6 +1355,10 @@ void machine_run_board_init(MachineState *machine)
     accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
     machine_class->init(machine);
     phase_advance(PHASE_MACHINE_INITIALIZED);
+
+    if (machine->numa_state) {
+        numa_complete_validation(machine);
+    }
 }
 
 static NotifierList machine_init_done_notifiers =
diff --git a/hw/core/numa.c b/hw/core/numa.c
index 510d096a88..7404b7dd38 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -727,6 +727,30 @@ void numa_complete_configuration(MachineState *ms)
     }
 }
 
+/*
+ * When device-tree is used by the machine, the empty node IDs should
+ * be included in the distance map. So we need provide pairs of distances
+ * in this case.
+ */
+void numa_complete_validation(MachineState *ms)
+{
+    NodeInfo *numa_info = ms->numa_state->nodes;
+    int nb_numa_nodes = ms->numa_state->num_nodes;
+    int i;
+
+    if (!ms->fdt || ms->numa_state->have_numa_distance) {
+        return;
+    }
+
+    for (i = 0; i < nb_numa_nodes; i++) {
+        if (numa_info[i].present && !numa_info[i].node_mem) {
+            error_report("Empty node %d found, please provide "
+                         "distance map.", i);
+            exit(EXIT_FAILURE);
+        }
+    }
+}
+
 void parse_numa_opts(MachineState *ms)
 {
     qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, &error_fatal);
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 4173ef2afa..80f25ab830 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -104,6 +104,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
 void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
                            Error **errp);
 void numa_complete_configuration(MachineState *ms);
+void numa_complete_validation(MachineState *ms);
 void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
 extern QemuOptsList qemu_numa_opts;
 void numa_cpu_pre_plug(const struct CPUArchId *slot, DeviceState *dev,
-- 
2.23.0


