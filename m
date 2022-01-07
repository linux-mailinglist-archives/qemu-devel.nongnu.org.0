Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8261848742A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 09:36:04 +0100 (CET)
Received: from localhost ([::1]:42610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5kjC-00036Y-77
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 03:36:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg3-0000NC-5w; Fri, 07 Jan 2022 03:32:47 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg0-0001dt-8o; Fri, 07 Jan 2022 03:32:46 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JVc012jdPzbjqj;
 Fri,  7 Jan 2022 16:32:01 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 16:32:36 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha
 <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v7 2/6] hw/arm/virt: Support cluster level in DT cpu-map
Date: Fri, 7 Jan 2022 16:32:28 +0800
Message-ID: <20220107083232.16256-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20220107083232.16256-1-wangyanan55@huawei.com>
References: <20220107083232.16256-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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

Support one cluster level between core and physical package in the
cpu-map of Arm/virt devicetree. This is also consistent with Linux
Doc "Documentation/devicetree/bindings/cpu/cpu-topology.txt".

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f413e146d9..fc5eea8c8c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -430,9 +430,8 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
          * can contain several layers of clustering within a single physical
          * package and cluster nodes can be contained in parent cluster nodes.
          *
-         * Given that cluster is not yet supported in the vCPU topology,
-         * we currently generate one cluster node within each socket node
-         * by default.
+         * Note: currently we only support one layer of clustering within
+         * each physical package.
          */
         qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
 
@@ -442,14 +441,16 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 
             if (ms->smp.threads > 1) {
                 map_path = g_strdup_printf(
-                    "/cpus/cpu-map/socket%d/cluster0/core%d/thread%d",
-                    cpu / (ms->smp.cores * ms->smp.threads),
+                    "/cpus/cpu-map/socket%d/cluster%d/core%d/thread%d",
+                    cpu / (ms->smp.clusters * ms->smp.cores * ms->smp.threads),
+                    (cpu / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters,
                     (cpu / ms->smp.threads) % ms->smp.cores,
                     cpu % ms->smp.threads);
             } else {
                 map_path = g_strdup_printf(
-                    "/cpus/cpu-map/socket%d/cluster0/core%d",
-                    cpu / ms->smp.cores,
+                    "/cpus/cpu-map/socket%d/cluster%d/core%d",
+                    cpu / (ms->smp.clusters * ms->smp.cores),
+                    (cpu / ms->smp.cores) % ms->smp.clusters,
                     cpu % ms->smp.cores);
             }
             qemu_fdt_add_path(ms->fdt, map_path);
-- 
2.27.0


