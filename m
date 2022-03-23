Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD3C4E4D60
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 08:33:21 +0100 (CET)
Received: from localhost ([::1]:49746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWvUf-0005OZ-13
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 03:33:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWvNI-0004KM-Kj
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 03:25:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWvND-0000vF-AV
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 03:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648020338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAJd0hGB8nw+2V/gTx6R569XDtTQv4RTpc1L97YpVCo=;
 b=YcrrqE9vBwFMZS186I8JQtGkItVWvcoJsysYMb5u2yu+3OrGEhaLB+zqKA7ZBPKjozJMsh
 tC7YRj/NOGEEqITTI38xL3qsCBJAuXLdcF7J5RwzK1Fyvy2FlEkxID7aM/j9AAv2Tpfj0S
 wyD0R++4FStR/vyVPhneaaIocCesULk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-kikSnJE9POuUpLOA09E44g-1; Wed, 23 Mar 2022 03:25:35 -0400
X-MC-Unique: kikSnJE9POuUpLOA09E44g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 146F985A5BC;
 Wed, 23 Mar 2022 07:25:35 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-33.pek2.redhat.com [10.72.12.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 083542166B2D;
 Wed, 23 Mar 2022 07:25:29 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 3/4] hw/acpi/aml-build: Use existing CPU topology to build
 PPTT table
Date: Wed, 23 Mar 2022 15:24:37 +0800
Message-Id: <20220323072438.71815-4-gshan@redhat.com>
In-Reply-To: <20220323072438.71815-1-gshan@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
it's unecessary because the CPU topology has been populated in
virt_possible_cpu_arch_ids() on arm/virt machine.

This avoids to re-calculate the CPU topology by reusing the existing
one in ms->possible_cpus. Currently, the only user of build_pptt() is
arm/virt machine.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/acpi/aml-build.c | 96 +++++++++++++++++++++++++++++++++------------
 1 file changed, 72 insertions(+), 24 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 4086879ebf..10a2d63b96 100644
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
+    int n, socket_id, cluster_id, core_id, thread_id;
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
@@ -2023,65 +2032,104 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
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
+                cluster_id = cpus->cpus[n].props.cluster_id;
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
+            if (mc->smp_props.clusters_supported &&
+                cpus->cpus[n].props.cluster_id != cluster_id) {
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
+            }
+
+            if (g_queue_find(core_list, GUINT_TO_POINTER(core_id))) {
+                continue;
             }
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


