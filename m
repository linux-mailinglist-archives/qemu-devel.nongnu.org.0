Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B2B34FDC0
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 12:04:49 +0200 (CEST)
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXiS-0004pP-PJ
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 06:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXYD-0002eG-A0; Wed, 31 Mar 2021 05:54:14 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:4059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXY5-0002as-CO; Wed, 31 Mar 2021 05:54:13 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F9M6p0g3tzlWmZ;
 Wed, 31 Mar 2021 17:52:18 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 17:53:52 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH 5/6] hw/arm/virt-acpi-build: Add cluster level for ARM
 PPTT table
Date: Wed, 31 Mar 2021 17:53:42 +0800
Message-ID: <20210331095343.12172-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210331095343.12172-1-wangyanan55@huawei.com>
References: <20210331095343.12172-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangyanan55@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo
 Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a Processor Hierarchy Node of cluster level between core level
and package level for ARM PPTT table.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/acpi/aml-build.c         | 11 ++++++++++
 hw/arm/virt-acpi-build.c    | 43 +++++++++++++++++++++----------------
 include/hw/acpi/aml-build.h |  2 ++
 3 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index a0af3e9d73..fe07817013 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1902,6 +1902,17 @@ void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
     build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
 }
 
+void build_cluster_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
+{
+    build_append_byte(tbl, ACPI_PPTT_TYPE_PROCESSOR); /* Type 0 - processor */
+    build_append_byte(tbl, 20);           /* Length, no private resources */
+    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
+    build_append_int_noprefix(tbl, 0, 4);      /* Flags */
+    build_append_int_noprefix(tbl, parent, 4); /* Parent */
+    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
+    build_append_int_noprefix(tbl, 0, 4); /* Number of private resources */
+}
+
 void build_processor_hierarchy(GArray *tbl, uint32_t flags,
                                uint32_t parent, uint32_t id)
 {
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 38d50ce66c..3b80518a90 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -442,6 +442,7 @@ build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int pptt_start = table_data->len;
     int uid = 0, cpus = 0, socket = 0;
     MachineState *ms = MACHINE(vms);
+    unsigned int smp_clusters = ms->smp.clusters;
     unsigned int smp_cores = ms->smp.cores;
     unsigned int smp_threads = ms->smp.threads;
 
@@ -449,29 +450,35 @@ build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     for (socket = 0; cpus < ms->possible_cpus->len; socket++) {
         uint32_t socket_offset = table_data->len - pptt_start;
-        int core;
+        int cluster;
 
         build_socket_hierarchy(table_data, 0, socket);
 
-        for (core = 0; core < smp_cores; core++) {
-            uint32_t core_offset = table_data->len - pptt_start;
-            int thread;
-
-            if (smp_threads <= 1) {
-                build_processor_hierarchy(table_data,
-                                          ACPI_PPTT_ACPI_PROCESSOR_ID_VALID |
-                                          ACPI_PPTT_ACPI_LEAF_NODE,
-                                          socket_offset, uid++);
-             } else {
-                build_processor_hierarchy(table_data,
-                                          ACPI_PPTT_ACPI_PROCESSOR_ID_VALID,
-                                          socket_offset, core);
-                for (thread = 0; thread < smp_threads; thread++) {
-                    build_thread_hierarchy(table_data, core_offset, uid++);
+        for (cluster = 0; cluster < smp_clusters; cluster++) {
+            uint32_t cluster_offset = table_data->len - pptt_start;
+            int core;
+
+            build_cluster_hierarchy(table_data, socket_offset, cluster);
+
+            for (core = 0; core < smp_cores; core++) {
+                uint32_t core_offset = table_data->len - pptt_start;
+                int thread;
+
+                if (smp_threads <= 1) {
+                    build_processor_hierarchy(table_data,
+                                              ACPI_PPTT_ACPI_PROCESSOR_ID_VALID |
+                                              ACPI_PPTT_ACPI_LEAF_NODE,
+                                              cluster_offset, uid++);
+                } else {
+                    build_processor_hierarchy(table_data, 0, cluster_offset, core);
+
+                    for (thread = 0; thread < smp_threads; thread++) {
+                        build_thread_hierarchy(table_data, core_offset, uid++);
+                    }
                 }
-             }
+            }
         }
-        cpus += smp_cores * smp_threads;
+        cpus += smp_clusters * smp_cores * smp_threads;
     }
 
     build_header(linker, table_data,
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 7f0ca1a198..cb68535cf1 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -464,6 +464,8 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
 
 void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
 
+void build_cluster_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
+
 void build_processor_hierarchy(GArray *tbl, uint32_t flags,
                                uint32_t parent, uint32_t id);
 
-- 
2.19.1


