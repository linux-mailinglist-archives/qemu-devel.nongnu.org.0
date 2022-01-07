Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD3487430
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 09:36:36 +0100 (CET)
Received: from localhost ([::1]:43888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5kjj-0003xm-RI
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 03:36:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg4-0000OV-Ek; Fri, 07 Jan 2022 03:32:48 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg1-0001fN-TN; Fri, 07 Jan 2022 03:32:48 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JVc0459qTzcbtW;
 Fri,  7 Jan 2022 16:32:04 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 16:32:39 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha
 <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v7 5/6] hw/acpi/aml-build: Support cluster level in PPTT
 generation
Date: Fri, 7 Jan 2022 16:32:31 +0800
Message-ID: <20220107083232.16256-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20220107083232.16256-1-wangyanan55@huawei.com>
References: <20220107083232.16256-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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

Support CPU cluster topology level in generation of ACPI
Processor Properties Topology Table (PPTT).

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/acpi/aml-build.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 6aaedca2e5..bb2cad63b5 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2001,6 +2001,7 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
 void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     GQueue *list = g_queue_new();
     guint pptt_start = table_data->len;
     guint parent_offset;
@@ -2025,6 +2026,23 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
             0, socket, NULL, 0);
     }
 
+    if (mc->smp_props.clusters_supported) {
+        length = g_queue_get_length(list);
+        for (i = 0; i < length; i++) {
+            int cluster;
+
+            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
+            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
+                g_queue_push_tail(list,
+                    GUINT_TO_POINTER(table_data->len - pptt_start));
+                build_processor_hierarchy_node(
+                    table_data,
+                    (0 << 0), /* not a physical package */
+                    parent_offset, cluster, NULL, 0);
+            }
+        }
+    }
+
     length = g_queue_get_length(list);
     for (i = 0; i < length; i++) {
         int core;
-- 
2.27.0


