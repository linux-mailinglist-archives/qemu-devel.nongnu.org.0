Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA9D4807D4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 10:31:21 +0100 (CET)
Received: from localhost ([::1]:58980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n28pD-0005vB-01
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 04:31:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28hB-00088H-JE; Tue, 28 Dec 2021 04:23:01 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28h8-0007BX-AO; Tue, 28 Dec 2021 04:23:01 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JNTXW1T3Yz8w7M;
 Tue, 28 Dec 2021 17:20:27 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 17:22:53 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>, Markus
 Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v5 10/14] hw/acpi/aml-build: Improve scalability of PPTT
 generation
Date: Tue, 28 Dec 2021 17:22:17 +0800
Message-ID: <20211228092221.21068-11-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211228092221.21068-1-wangyanan55@huawei.com>
References: <20211228092221.21068-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Currently we generate a PPTT table of n-level processor hierarchy
with n-level loops in build_pptt(). It works fine as now there are
only three CPU topology parameters. But the code may become less
scalable with the processor hierarchy levels increasing.

This patch only improves the scalability of build_pptt by reducing
the loops, and intends to make no functional change.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/acpi/aml-build.c | 50 +++++++++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index b3b3310df3..be3851be36 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2001,7 +2001,10 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
 void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id)
 {
-    int pptt_start = table_data->len;
+    GQueue *list = g_queue_new();
+    guint pptt_start = table_data->len;
+    guint father_offset;
+    guint length, i;
     int uid = 0;
     int socket;
     AcpiTable table = { .sig = "PPTT", .rev = 2,
@@ -2010,9 +2013,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
     acpi_table_begin(&table, table_data);
 
     for (socket = 0; socket < ms->smp.sockets; socket++) {
-        uint32_t socket_offset = table_data->len - pptt_start;
-        int core;
-
+        g_queue_push_tail(list,
+            GUINT_TO_POINTER(table_data->len - pptt_start));
         build_processor_hierarchy_node(
             table_data,
             /*
@@ -2021,35 +2023,47 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
              */
             (1 << 0),
             0, socket, NULL, 0);
+    }
 
-        for (core = 0; core < ms->smp.cores; core++) {
-            uint32_t core_offset = table_data->len - pptt_start;
-            int thread;
+    length = g_queue_get_length(list);
+    for (i = 0; i < length; i++) {
+        int core;
 
+        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
+        for (core = 0; core < ms->smp.cores; core++) {
             if (ms->smp.threads > 1) {
+                g_queue_push_tail(list,
+                    GUINT_TO_POINTER(table_data->len - pptt_start));
                 build_processor_hierarchy_node(
                     table_data,
                     (0 << 0), /* not a physical package */
-                    socket_offset, core, NULL, 0);
-
-                for (thread = 0; thread < ms->smp.threads; thread++) {
-                    build_processor_hierarchy_node(
-                        table_data,
-                        (1 << 1) | /* ACPI Processor ID valid */
-                        (1 << 2) | /* Processor is a Thread */
-                        (1 << 3),  /* Node is a Leaf */
-                        core_offset, uid++, NULL, 0);
-                }
+                    father_offset, core, NULL, 0);
             } else {
                 build_processor_hierarchy_node(
                     table_data,
                     (1 << 1) | /* ACPI Processor ID valid */
                     (1 << 3),  /* Node is a Leaf */
-                    socket_offset, uid++, NULL, 0);
+                    father_offset, uid++, NULL, 0);
             }
         }
     }
 
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
     acpi_table_end(linker, &table);
 }
 
-- 
2.27.0


