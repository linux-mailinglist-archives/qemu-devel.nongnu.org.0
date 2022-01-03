Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92639482F1C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 09:49:51 +0100 (CET)
Received: from localhost ([::1]:60372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4J2M-000751-6w
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 03:49:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4IzU-0004Ih-L3; Mon, 03 Jan 2022 03:46:52 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4IzS-0006Rh-2P; Mon, 03 Jan 2022 03:46:52 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JS8V75Yf0zcc2g;
 Mon,  3 Jan 2022 16:46:07 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 3 Jan 2022 16:46:39 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha
 <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v6 1/7] hw/arm/virt: Support CPU cluster on ARM virt machine
Date: Mon, 3 Jan 2022 16:46:30 +0800
Message-ID: <20220103084636.2496-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20220103084636.2496-1-wangyanan55@huawei.com>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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

ARM64 machines like Kunpeng Family Server Chips have a level
of hardware topology in which a group of CPU cores share L3
cache tag or L2 cache. For example, Kunpeng 920 typically
has 6 or 8 clusters in each NUMA node (also represent range
of CPU die), and each cluster has 4 CPU cores. All clusters
share L3 cache data, but CPU cores in each cluster share a
local L3 tag.

Running a guest kernel with Cluster-Aware Scheduling on the
Hosts which have physical clusters, if we can design a vCPU
topology with cluster level for guest kernel and then have
a dedicated vCPU pinning, the guest will gain scheduling
performance improvement from cache affinity of CPU cluster.

So let's enable the support for this new parameter on ARM
virt machines. After this patch, we can define a 4-level
CPU hierarchy like: cpus=*,maxcpus=*,sockets=*,clusters=*,
cores=*,threads=*.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c   |  1 +
 qemu-options.hx | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6bce595aba..f413e146d9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2700,6 +2700,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug_request = virt_machine_device_unplug_request_cb;
     hc->unplug = virt_machine_device_unplug_cb;
     mc->nvdimm_supported = true;
+    mc->smp_props.clusters_supported = true;
     mc->auto_enable_numa_with_memhp = true;
     mc->auto_enable_numa_with_memdev = true;
     mc->default_ram_id = "mach-virt.ram";
diff --git a/qemu-options.hx b/qemu-options.hx
index fd1f8135fb..69ef1cdb85 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -277,6 +277,16 @@ SRST
 
         -smp 16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16
 
+    The following sub-option defines a CPU topology hierarchy (2 sockets
+    totally on the machine, 2 clusters per socket, 2 cores per cluster,
+    2 threads per core) for ARM virt machines which support sockets/clusters
+    /cores/threads. Some members of the option can be omitted but their values
+    will be automatically computed:
+
+    ::
+
+        -smp 16,sockets=2,clusters=2,cores=2,threads=2,maxcpus=16
+
     Historically preference was given to the coarsest topology parameters
     when computing missing values (ie sockets preferred over cores, which
     were preferred over threads), however, this behaviour is considered
-- 
2.27.0


