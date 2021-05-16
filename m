Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B21381E22
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 12:41:26 +0200 (CEST)
Received: from localhost ([::1]:58510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liED7-0001I8-V5
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 06:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE4h-0008Ul-Qp; Sun, 16 May 2021 06:32:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE4b-0000mP-7V; Sun, 16 May 2021 06:32:43 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fjdmv0v76z16QXG;
 Sun, 16 May 2021 18:29:51 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:32:34 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:32:33 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v3 3/4] hw/arm/virt-acpi-build: Add cluster level to PPTT
 table
Date: Sun, 16 May 2021 18:32:27 +0800
Message-ID: <20210516103228.37792-4-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210516103228.37792-1-wangyanan55@huawei.com>
References: <20210516103228.37792-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com, yangyicong@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a Processor Hierarchy Node of cluster level between core level
and socket level to ARM PPTT table.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt-acpi-build.c | 45 ++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b03d57745a..4d09b51bb0 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -447,34 +447,43 @@ static void build_pptt(GArray *table_data, BIOSLinker *linker,
 
     for (socket = 0; socket < ms->smp.sockets; socket++) {
         uint32_t socket_offset = table_data->len - pptt_start;
-        int core;
+        int cluster;
 
         build_processor_hierarchy_node(
             table_data,
             (1 << 0), /* ACPI 6.2 - Physical package */
             0, socket, NULL, 0);
 
-        for (core = 0; core < ms->smp.cores; core++) {
-            uint32_t core_offset = table_data->len - pptt_start;
-            int thread;
-
-            if (ms->smp.threads <= 1) {
-                build_processor_hierarchy_node(
-                    table_data,
-                    (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
-                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
-                    socket_offset, uid++, NULL, 0);
-            } else {
-                build_processor_hierarchy_node(table_data, 0, socket_offset,
-                                               core, NULL, 0);
-
-                for (thread = 0; thread < ms->smp.threads; thread++) {
+        for (cluster = 0; cluster < vms->smp_clusters; cluster++) {
+            uint32_t cluster_offset = table_data->len - pptt_start;
+            int core;
+
+            build_processor_hierarchy_node(table_data, 0, socket_offset,
+                                           cluster, NULL, 0);
+
+            for (core = 0; core < ms->smp.cores; core++) {
+                uint32_t core_offset = table_data->len - pptt_start;
+                int thread;
+
+                if (ms->smp.threads <= 1) {
                     build_processor_hierarchy_node(
                         table_data,
                         (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
-                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
                         (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
-                        core_offset, uid++, NULL, 0);
+                        cluster_offset, uid++, NULL, 0);
+                } else {
+                    build_processor_hierarchy_node(table_data, 0,
+                                                   cluster_offset,
+                                                   core, NULL, 0);
+
+                    for (thread = 0; thread < ms->smp.threads; thread++) {
+                        build_processor_hierarchy_node(
+                            table_data,
+                            (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
+                            (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
+                            (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
+                            core_offset, uid++, NULL, 0);
+                    }
                 }
             }
         }
-- 
2.19.1


