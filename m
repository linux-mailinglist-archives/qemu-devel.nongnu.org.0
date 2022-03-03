Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8FF4CB561
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 04:19:37 +0100 (CET)
Received: from localhost ([::1]:45732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPc08-0006xf-Pp
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 22:19:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nPbtI-0007Xj-EZ
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:12:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nPbtG-0003eu-8s
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646277149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vRhaIRgCbGADfRTaEO4Z3ZTmpreYWc5KRSfB2lRcngM=;
 b=Oobq1F+YBSnS//MzxdNXNOfb8jL/+LFHGCeGddOTaMaClkD1oAJH2H8T/B5irCohEYNgB/
 IF89rua73uboZsCuVQDvsyRb0BFl1reYycb4qcnWYSDl0rNjG17az2jy2Y0UuzXEr2hdBo
 liXLG9KRfeGQdNUpf/0AqtOqisiLYkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-iZy3Pq3ZOlON4mqN63280w-1; Wed, 02 Mar 2022 22:12:26 -0500
X-MC-Unique: iZy3Pq3ZOlON4mqN63280w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A90351DC;
 Thu,  3 Mar 2022 03:12:25 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-119.pek2.redhat.com [10.72.13.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3BC91006856;
 Thu,  3 Mar 2022 03:12:21 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 2/3] hw/acpi/aml-build: Use existing CPU topology to build
 PPTT table
Date: Thu,  3 Mar 2022 11:11:51 +0800
Message-Id: <20220303031152.145960-3-gshan@redhat.com>
In-Reply-To: <20220303031152.145960-1-gshan@redhat.com>
References: <20220303031152.145960-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the PPTT table is built, the CPU topology is re-calculated, but
it's unecessary because the CPU topology, except the cluster IDs,
has been populated in virt_possible_cpu_arch_ids() on arm/virt machine.

This avoids to re-calculate the CPU topology by reusing the existing
one in ms->possible_cpus. However, the cluster ID for the CPU instance
has to be calculated dynamically because there is no corresponding
field in struct CpuInstanceProperties. Currently, the only user of
build_pptt() is arm/virt machine.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/acpi/aml-build.c | 106 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 82 insertions(+), 24 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 8966e16320..572cf5fc00 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2002,18 +2002,27 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
+    CPUArchIdList *cpus = ms->possible_cpus;
+    GQueue *socket_list = g_queue_new();
+    GQueue *cluster_list = g_queue_new();
+    GQueue *core_list = g_queue_new();
     GQueue *list = g_queue_new();
     guint pptt_start = table_data->len;
     guint parent_offset;
     guint length, i;
-    int uid = 0;
-    int socket;
+    int n, id, socket_id, cluster_id, core_id, thread_id;
     AcpiTable table = { .sig = "PPTT", .rev = 2,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
 
     acpi_table_begin(&table, table_data);
 
-    for (socket = 0; socket < ms->smp.sockets; socket++) {
+    for (n = 0; n < cpus->len; n++) {
+        socket_id = cpus->cpus[n].props.socket_id;
+        if (g_queue_find(socket_list, GUINT_TO_POINTER(socket_id))) {
+            continue;
+        }
+
+        g_queue_push_tail(socket_list, GUINT_TO_POINTER(socket_id));
         g_queue_push_tail(list,
             GUINT_TO_POINTER(table_data->len - pptt_start));
         build_processor_hierarchy_node(
@@ -2023,65 +2032,114 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
              * of a physical package
              */
             (1 << 0),
-            0, socket, NULL, 0);
+            0, socket_id, NULL, 0);
     }
 
     if (mc->smp_props.clusters_supported) {
         length = g_queue_get_length(list);
         for (i = 0; i < length; i++) {
-            int cluster;
-
             parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
+            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
+
+            for (n = 0; n < cpus->len; n++) {
+                if (cpus->cpus[n].props.socket_id != socket_id) {
+                    continue;
+                }
+
+                /*
+                 * We have to calculate the cluster ID because it isn't
+                 * available in the CPU instance properties.
+                 */
+                cluster_id = cpus->cpus[n].props.thread_id /
+                             (ms->smp.cores * ms->smp.threads);
+                if (g_queue_find(cluster_list, GUINT_TO_POINTER(cluster_id))) {
+                    continue;
+                }
+
+                g_queue_push_tail(cluster_list, GUINT_TO_POINTER(cluster_id));
                 g_queue_push_tail(list,
                     GUINT_TO_POINTER(table_data->len - pptt_start));
                 build_processor_hierarchy_node(
                     table_data,
                     (0 << 0), /* not a physical package */
-                    parent_offset, cluster, NULL, 0);
+                    parent_offset, cluster_id, NULL, 0);
             }
         }
     }
 
     length = g_queue_get_length(list);
     for (i = 0; i < length; i++) {
-        int core;
-
         parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-        for (core = 0; core < ms->smp.cores; core++) {
-            if (ms->smp.threads > 1) {
-                g_queue_push_tail(list,
-                    GUINT_TO_POINTER(table_data->len - pptt_start));
-                build_processor_hierarchy_node(
-                    table_data,
-                    (0 << 0), /* not a physical package */
-                    parent_offset, core, NULL, 0);
-            } else {
+        if (!mc->smp_props.clusters_supported) {
+            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
+        } else {
+            cluster_id = GPOINTER_TO_UINT(g_queue_pop_head(cluster_list));
+        }
+
+        for (n = 0; n < cpus->len; n++) {
+            if (!mc->smp_props.clusters_supported &&
+                cpus->cpus[n].props.socket_id != socket_id) {
+                continue;
+            }
+
+            /*
+             * We have to calculate the cluster ID because it isn't
+             * available in the CPU instance properties.
+             */
+            id = cpus->cpus[n].props.thread_id /
+                (ms->smp.cores * ms->smp.threads);
+            if (mc->smp_props.clusters_supported && id != cluster_id) {
+                continue;
+            }
+
+            core_id = cpus->cpus[n].props.core_id;
+            if (ms->smp.threads <= 1) {
                 build_processor_hierarchy_node(
                     table_data,
                     (1 << 1) | /* ACPI Processor ID valid */
                     (1 << 3),  /* Node is a Leaf */
-                    parent_offset, uid++, NULL, 0);
+                    parent_offset, core_id, NULL, 0);
+                continue;
             }
+
+            if (g_queue_find(core_list, GUINT_TO_POINTER(core_id))) {
+                continue;
+            }
+
+            g_queue_push_tail(core_list, GUINT_TO_POINTER(core_id));
+            g_queue_push_tail(list,
+                GUINT_TO_POINTER(table_data->len - pptt_start));
+            build_processor_hierarchy_node(
+                table_data,
+                (0 << 0), /* not a physical package */
+                parent_offset, core_id, NULL, 0);
         }
     }
 
     length = g_queue_get_length(list);
     for (i = 0; i < length; i++) {
-        int thread;
-
         parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-        for (thread = 0; thread < ms->smp.threads; thread++) {
+        core_id = GPOINTER_TO_UINT(g_queue_pop_head(core_list));
+
+        for (n = 0; n < cpus->len; n++) {
+            if (cpus->cpus[n].props.core_id != core_id) {
+                continue;
+            }
+
+            thread_id = cpus->cpus[n].props.thread_id;
             build_processor_hierarchy_node(
                 table_data,
                 (1 << 1) | /* ACPI Processor ID valid */
                 (1 << 2) | /* Processor is a Thread */
                 (1 << 3),  /* Node is a Leaf */
-                parent_offset, uid++, NULL, 0);
+                parent_offset, thread_id, NULL, 0);
         }
     }
 
     g_queue_free(list);
+    g_queue_free(core_list);
+    g_queue_free(cluster_list);
+    g_queue_free(socket_list);
     acpi_table_end(linker, &table);
 }
 
-- 
2.23.0


