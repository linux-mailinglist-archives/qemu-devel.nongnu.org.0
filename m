Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C99458364
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 13:33:24 +0100 (CET)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mom27-00037E-C9
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 07:33:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluO-0003qg-5P; Sun, 21 Nov 2021 07:25:24 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluI-0005mW-VX; Sun, 21 Nov 2021 07:25:23 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HxqH506Gmzbhqq;
 Sun, 21 Nov 2021 20:20:17 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 20:25:14 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Markus Armbruster <armbru@redhat.com>, Eric
 Blake <eblake@redhat.com>, <wanghaibin.wang@huawei.com>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: [PATCH v4 07/10] hw/arm/virt-acpi-build: Make an ARM specific PPTT
 generator
Date: Sun, 21 Nov 2021 20:24:59 +0800
Message-ID: <20211121122502.9844-8-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211121122502.9844-1-wangyanan55@huawei.com>
References: <20211121122502.9844-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-devel@nongnu.org>

We have a generic build_pptt() in hw/acpi/aml-build.c but it's
currently only used in ARM acpi initialization. Now we are going
to support the new CPU cluster parameter which is currently only
supported by ARM, it won't be a very good idea to add it to the
generic build_pptt() as it will make the code complex and hard
to maintain especially when we also support CPU cache topology
hierarchy in build_pptt() too. Note that the cache topology
design also varies between different CPU targets.

So an ARM specific PPTT generator becomes necessary now. Given
that the generic one is currently only used by ARM, let's just
move build_pptt() from aml-build.c to virt-acpi-build.c with
minor update.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/acpi/aml-build.c         | 80 ++-----------------------------------
 hw/arm/virt-acpi-build.c    | 77 ++++++++++++++++++++++++++++++++++-
 include/hw/acpi/aml-build.h |  5 ++-
 3 files changed, 81 insertions(+), 81 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index be3851be36..040fbc9b4b 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1968,10 +1968,9 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
  * ACPI spec, Revision 6.3
  * 5.2.29.1 Processor hierarchy node structure (Type 0)
  */
-static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
-                                           uint32_t parent, uint32_t id,
-                                           uint32_t *priv_rsrc,
-                                           uint32_t priv_num)
+void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
+                                    uint32_t parent, uint32_t id,
+                                    uint32_t *priv_rsrc, uint32_t priv_num)
 {
     int i;
 
@@ -1994,79 +1993,6 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
     }
 }
 
-/*
- * ACPI spec, Revision 6.3
- * 5.2.29 Processor Properties Topology Table (PPTT)
- */
-void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
-                const char *oem_id, const char *oem_table_id)
-{
-    GQueue *list = g_queue_new();
-    guint pptt_start = table_data->len;
-    guint father_offset;
-    guint length, i;
-    int uid = 0;
-    int socket;
-    AcpiTable table = { .sig = "PPTT", .rev = 2,
-                        .oem_id = oem_id, .oem_table_id = oem_table_id };
-
-    acpi_table_begin(&table, table_data);
-
-    for (socket = 0; socket < ms->smp.sockets; socket++) {
-        g_queue_push_tail(list,
-            GUINT_TO_POINTER(table_data->len - pptt_start));
-        build_processor_hierarchy_node(
-            table_data,
-            /*
-             * Physical package - represents the boundary
-             * of a physical package
-             */
-            (1 << 0),
-            0, socket, NULL, 0);
-    }
-
-    length = g_queue_get_length(list);
-    for (i = 0; i < length; i++) {
-        int core;
-
-        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-        for (core = 0; core < ms->smp.cores; core++) {
-            if (ms->smp.threads > 1) {
-                g_queue_push_tail(list,
-                    GUINT_TO_POINTER(table_data->len - pptt_start));
-                build_processor_hierarchy_node(
-                    table_data,
-                    (0 << 0), /* not a physical package */
-                    father_offset, core, NULL, 0);
-            } else {
-                build_processor_hierarchy_node(
-                    table_data,
-                    (1 << 1) | /* ACPI Processor ID valid */
-                    (1 << 3),  /* Node is a Leaf */
-                    father_offset, uid++, NULL, 0);
-            }
-        }
-    }
-
-    length = g_queue_get_length(list);
-    for (i = 0; i < length; i++) {
-        int thread;
-
-        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-        for (thread = 0; thread < ms->smp.threads; thread++) {
-            build_processor_hierarchy_node(
-                table_data,
-                (1 << 1) | /* ACPI Processor ID valid */
-                (1 << 2) | /* Processor is a Thread */
-                (1 << 3),  /* Node is a Leaf */
-                father_offset, uid++, NULL, 0);
-        }
-    }
-
-    g_queue_free(list);
-    acpi_table_end(linker, &table);
-}
-
 /* build rev1/rev3/rev5.1 FADT */
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id)
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 674f902652..bef7056213 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -807,6 +807,80 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_table_end(linker, &table);
 }
 
+/*
+ * ACPI spec, Revision 6.3
+ * 5.2.29 Processor Properties Topology Table (PPTT)
+ */
+static void
+build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+{
+    MachineState *ms = MACHINE(vms);
+    GQueue *list = g_queue_new();
+    guint pptt_start = table_data->len;
+    guint father_offset;
+    guint length, i;
+    int uid = 0;
+    int socket;
+    AcpiTable table = { .sig = "PPTT", .rev = 2, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+
+    for (socket = 0; socket < ms->smp.sockets; socket++) {
+        g_queue_push_tail(list,
+            GUINT_TO_POINTER(table_data->len - pptt_start));
+        build_processor_hierarchy_node(
+            table_data,
+            /*
+             * Physical package - represents the boundary
+             * of a physical package
+             */
+            (1 << 0),
+            0, socket, NULL, 0);
+    }
+
+    length = g_queue_get_length(list);
+    for (i = 0; i < length; i++) {
+        int core;
+
+        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
+        for (core = 0; core < ms->smp.cores; core++) {
+            if (ms->smp.threads > 1) {
+                g_queue_push_tail(list,
+                    GUINT_TO_POINTER(table_data->len - pptt_start));
+                build_processor_hierarchy_node(
+                    table_data,
+                    (0 << 0), /* not a physical package */
+                    father_offset, core, NULL, 0);
+            } else {
+                build_processor_hierarchy_node(
+                    table_data,
+                    (1 << 1) | /* ACPI Processor ID valid */
+                    (1 << 3),  /* Node is a Leaf */
+                    father_offset, uid++, NULL, 0);
+            }
+        }
+    }
+
+    length = g_queue_get_length(list);
+    for (i = 0; i < length; i++) {
+        int thread;
+
+        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
+        for (thread = 0; thread < ms->smp.threads; thread++) {
+            build_processor_hierarchy_node(
+                table_data,
+                (1 << 1) | /* ACPI Processor ID valid */
+                (1 << 2) | /* Processor is a Thread */
+                (1 << 3),  /* Node is a Leaf */
+                father_offset, uid++, NULL, 0);
+        }
+    }
+
+    g_queue_free(list);
+    acpi_table_end(linker, &table);
+}
+
 /* FADT */
 static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
                             VirtMachineState *vms, unsigned dsdt_tbl_offset)
@@ -952,8 +1026,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     if (!vmc->no_cpu_topology) {
         acpi_add_table(table_offsets, tables_blob);
-        build_pptt(tables_blob, tables->linker, ms,
-                   vms->oem_id, vms->oem_table_id);
+        build_pptt(tables_blob, tables->linker, vms);
     }
 
     acpi_add_table(table_offsets, tables_blob);
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 8346003a22..2c457c8f17 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -489,8 +489,9 @@ void build_srat_memory(GArray *table_data, uint64_t base,
 void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id);
 
-void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
-                const char *oem_id, const char *oem_table_id);
+void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
+                                    uint32_t parent, uint32_t id,
+                                    uint32_t *priv_rsrc, uint32_t priv_num);
 
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id);
-- 
2.19.1


