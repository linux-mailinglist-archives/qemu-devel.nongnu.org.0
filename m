Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE06482F1E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 09:50:31 +0100 (CET)
Received: from localhost ([::1]:33288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4J30-0007pg-7R
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 03:50:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4IzW-0004J3-Ms; Mon, 03 Jan 2022 03:46:55 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4IzR-0006S5-Vr; Mon, 03 Jan 2022 03:46:54 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JS8VB4rtPzbhjd;
 Mon,  3 Jan 2022 16:46:10 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 3 Jan 2022 16:46:42 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha
 <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v6 4/7] hw/arm/virt-acpi-build: Make an ARM specific PPTT
 generator
Date: Mon, 3 Jan 2022 16:46:33 +0800
Message-ID: <20220103084636.2496-5-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20220103084636.2496-1-wangyanan55@huawei.com>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index d0f4867fdf..3ce7680393 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -808,6 +808,80 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
@@ -953,8 +1027,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
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
2.27.0


