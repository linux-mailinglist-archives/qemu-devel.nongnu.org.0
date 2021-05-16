Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB08381E1E
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 12:38:04 +0200 (CEST)
Received: from localhost ([::1]:46148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liE9r-0001Qm-4Y
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 06:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE4h-0008To-J0; Sun, 16 May 2021 06:32:43 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE4b-0000mI-5S; Sun, 16 May 2021 06:32:43 -0400
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fjdm23s16zPxrT;
 Sun, 16 May 2021 18:29:06 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:32:33 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:32:32 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v3 2/4] hw/arm/virt: Add cluster level to device tree
Date: Sun, 16 May 2021 18:32:26 +0800
Message-ID: <20210516103228.37792-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210516103228.37792-1-wangyanan55@huawei.com>
References: <20210516103228.37792-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangyanan55@huawei.com; helo=szxga05-in.huawei.com
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

Add a cluster level between core level and socket level to ARM
device tree. This is also consistent with content in Linux Doc
"Documentation/devicetree/bindings/cpu/cpu-topology.txt".

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 44e990e3be..7de822e491 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -431,14 +431,18 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 
             if (ms->smp.threads > 1) {
                 map_path = g_strdup_printf(
-                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
-                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
+                    "/cpus/cpu-map/%s%d/%s%d/%s%d/%s%d",
+                    "socket", cpu / (vms->smp_clusters * ms->smp.cores *
+                    ms->smp.threads),
+                    "cluster", (cpu / (ms->smp.cores * ms->smp.threads)) %
+                    vms->smp_clusters,
                     "core", (cpu / ms->smp.threads) % ms->smp.cores,
                     "thread", cpu % ms->smp.threads);
             } else {
                 map_path = g_strdup_printf(
-                    "/cpus/cpu-map/%s%d/%s%d",
-                    "socket", cpu / ms->smp.cores,
+                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
+                    "socket", cpu / (vms->smp_clusters * ms->smp.cores),
+                    "cluster", (cpu / ms->smp.cores) % vms->smp_clusters,
                     "core", cpu % ms->smp.cores);
             }
             qemu_fdt_add_path(ms->fdt, map_path);
-- 
2.19.1


