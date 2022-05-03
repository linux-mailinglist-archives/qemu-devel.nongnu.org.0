Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F935190CC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:03:00 +0200 (CEST)
Received: from localhost ([::1]:56670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0bj-0001wS-UR
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nlzCQ-0007oG-TS
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:32:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nlzCA-0000J5-LN
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651609933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uCUtFbqM5mSd41jI/kJsuYvbaOhUPX++37Nx2wdTXOk=;
 b=MCJvFnPnbrPqTDhu/tLPSS232rnkPH+3phSrVXzx2g+/FfpvvSwKSLtNkHvWhOWcL+bssh
 uS37pbtk6k8GNZZWIKOfOOmyWxzEMYToSsms5t9nNkz7Nq8vzM8+0CY+MAsbohQHbkZW+d
 RyoxpSJAqJzZMr8E3/au/4NSkWqyjHQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-bEGqs_7qPVuw-dPATo5EJA-1; Tue, 03 May 2022 10:50:47 -0400
X-MC-Unique: bEGqs_7qPVuw-dPATo5EJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78A2E1D7F89D;
 Tue,  3 May 2022 14:03:27 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-47.pek2.redhat.com [10.72.12.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3C4D1538411;
 Tue,  3 May 2022 14:03:18 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, Jonathan.Cameron@Huawei.com,
 drjones@redhat.com, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v9 1/6] qapi/machine.json: Add cluster-id
Date: Tue,  3 May 2022 22:02:59 +0800
Message-Id: <20220503140304.855514-2-gshan@redhat.com>
In-Reply-To: <20220503140304.855514-1-gshan@redhat.com>
References: <20220503140304.855514-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds cluster-id in CPU instance properties, which will be used
by arm/virt machine. Besides, the cluster-id is also verified or
dumped in various spots:

  * hw/core/machine.c::machine_set_cpu_numa_node() to associate
    CPU with its NUMA node.

  * hw/core/machine.c::machine_numa_finish_cpu_init() to record
    CPU slots with no NUMA mapping set.

  * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
    cluster-id.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/core/machine-hmp-cmds.c |  4 ++++
 hw/core/machine.c          | 16 ++++++++++++++++
 qapi/machine.json          |  6 ++++--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index 4e2f319aeb..5cb5eecbfc 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -77,6 +77,10 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
         if (c->has_die_id) {
             monitor_printf(mon, "    die-id: \"%" PRIu64 "\"\n", c->die_id);
         }
+        if (c->has_cluster_id) {
+            monitor_printf(mon, "    cluster-id: \"%" PRIu64 "\"\n",
+                           c->cluster_id);
+        }
         if (c->has_core_id) {
             monitor_printf(mon, "    core-id: \"%" PRIu64 "\"\n", c->core_id);
         }
diff --git a/hw/core/machine.c b/hw/core/machine.c
index cb9bbc844d..700c1e76b8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -682,6 +682,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
             return;
         }
 
+        if (props->has_cluster_id && !slot->props.has_cluster_id) {
+            error_setg(errp, "cluster-id is not supported");
+            return;
+        }
+
         if (props->has_socket_id && !slot->props.has_socket_id) {
             error_setg(errp, "socket-id is not supported");
             return;
@@ -701,6 +706,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
                 continue;
         }
 
+        if (props->has_cluster_id &&
+            props->cluster_id != slot->props.cluster_id) {
+                continue;
+        }
+
         if (props->has_die_id && props->die_id != slot->props.die_id) {
                 continue;
         }
@@ -995,6 +1005,12 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
         }
         g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
     }
+    if (cpu->props.has_cluster_id) {
+        if (s->len) {
+            g_string_append_printf(s, ", ");
+        }
+        g_string_append_printf(s, "cluster-id: %"PRId64, cpu->props.cluster_id);
+    }
     if (cpu->props.has_core_id) {
         if (s->len) {
             g_string_append_printf(s, ", ");
diff --git a/qapi/machine.json b/qapi/machine.json
index d25a481ce4..4c417e32a5 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -868,10 +868,11 @@
 # @node-id: NUMA node ID the CPU belongs to
 # @socket-id: socket number within node/board the CPU belongs to
 # @die-id: die number within socket the CPU belongs to (since 4.1)
-# @core-id: core number within die the CPU belongs to
+# @cluster-id: cluster number within die the CPU belongs to (since 7.1)
+# @core-id: core number within cluster the CPU belongs to
 # @thread-id: thread number within core the CPU belongs to
 #
-# Note: currently there are 5 properties that could be present
+# Note: currently there are 6 properties that could be present
 #       but management should be prepared to pass through other
 #       properties with device_add command to allow for future
 #       interface extension. This also requires the filed names to be kept in
@@ -883,6 +884,7 @@
   'data': { '*node-id': 'int',
             '*socket-id': 'int',
             '*die-id': 'int',
+            '*cluster-id': 'int',
             '*core-id': 'int',
             '*thread-id': 'int'
   }
-- 
2.23.0


