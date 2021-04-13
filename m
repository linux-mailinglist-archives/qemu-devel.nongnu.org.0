Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD83935DA2D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 10:35:12 +0200 (CEST)
Received: from localhost ([::1]:35874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEVr-00027R-5M
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 04:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWESz-0008Pj-K6; Tue, 13 Apr 2021 04:32:13 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWESw-0004tJ-MU; Tue, 13 Apr 2021 04:32:13 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FKJgd1jVPz1BGYB;
 Tue, 13 Apr 2021 16:29:49 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 16:31:56 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v2 3/4] hw/arm/virt-acpi-build: Add cluster level for PPTT
 table
Date: Tue, 13 Apr 2021 16:31:46 +0800
Message-ID: <20210413083147.34236-4-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210413083147.34236-1-wangyanan55@huawei.com>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangyanan55@huawei.com; helo=szxga04-in.huawei.com
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
 "Michael S .
 Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com, yangyicong@huawei.com,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com, Igor
 Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a Processor Hierarchy Node of cluster level between core level
and package level for ARM PPTT table.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt-acpi-build.c | 55 ++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 03fd812d5a..2b745711d1 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -443,6 +443,7 @@ build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int pptt_start = table_data->len;
     int uid = 0, cpus = 0, socket = 0;
     MachineState *ms = MACHINE(vms);
+    unsigned int smp_clusters = vms->smp_clusters;
     unsigned int smp_cores = ms->smp.cores;
     unsigned int smp_threads = ms->smp.threads;
 
@@ -450,42 +451,52 @@ build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     for (socket = 0; cpus < ms->possible_cpus->len; socket++) {
         uint32_t socket_offset = table_data->len - pptt_start;
-        int core;
+        int cluster;
 
         build_processor_hierarchy_node(
             table_data, 1, /* Physical package */
             0, socket, /* No parent */
             NULL, 0);  /* No private resources */
 
-        for (core = 0; core < smp_cores; core++) {
-            uint32_t core_offset = table_data->len - pptt_start;
-            int thread;
-
-            if (smp_threads <= 1) {
-                build_processor_hierarchy_node(
-                    table_data,
-                    (1 << 1) | /* ACPI Processor ID valid */
-                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
-                    socket_offset, uid++, /* Parent is a Socket */
-                    NULL, 0);  /* No private resources */
-            } else {
-                build_processor_hierarchy_node(
-                    table_data, 0,
-                    socket_offset, core, /* Parent is a Socket */
-                    NULL, 0); /* No private resources */
-
-                for (thread = 0; thread < smp_threads; thread++) {
+        for (cluster = 0; cluster < smp_clusters; cluster++) {
+            uint32_t cluster_offset = table_data->len - pptt_start;
+            int core;
+
+            build_processor_hierarchy_node(
+                table_data, 0,
+                socket_offset, cluster, /* Parent is a Socket */
+                NULL, 0); /* No private resources */
+
+            for (core = 0; core < smp_cores; core++) {
+                uint32_t core_offset = table_data->len - pptt_start;
+                int thread;
+
+                if (smp_threads <= 1) {
                     build_processor_hierarchy_node(
                         table_data,
                         (1 << 1) | /* ACPI Processor ID valid */
-                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
                         (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
-                        core_offset, uid++, /* Parent is a Core */
+                        cluster_offset, uid++, /* Parent is a Cluster */
                         NULL, 0);  /* No private resources */
+                } else {
+                    build_processor_hierarchy_node(
+                        table_data, 0,
+                        cluster_offset, core, /* Parent is a Cluster */
+                        NULL, 0); /* No private resources */
+
+                    for (thread = 0; thread < smp_threads; thread++) {
+                        build_processor_hierarchy_node(
+                            table_data,
+                            (1 << 1) | /* ACPI Processor ID valid */
+                            (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
+                            (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
+                            core_offset, uid++, /* Parent is a Core */
+                            NULL, 0);  /* No private resources */
+                    }
                 }
             }
         }
-        cpus += smp_cores * smp_threads;
+        cpus += smp_clusters * smp_cores * smp_threads;
     }
 
     build_header(linker, table_data,
-- 
2.19.1


