Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC105381E21
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 12:40:05 +0200 (CEST)
Received: from localhost ([::1]:54890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liEBo-0007FO-Lb
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 06:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE4h-0008S5-3u; Sun, 16 May 2021 06:32:43 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE4a-0000lb-Qc; Sun, 16 May 2021 06:32:40 -0400
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fjdmr6cykzmVLV;
 Sun, 16 May 2021 18:29:48 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:32:32 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:32:31 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v3 1/4] vl.c: Add -smp,
 clusters=* command line support for ARM cpu
Date: Sun, 16 May 2021 18:32:25 +0800
Message-ID: <20210516103228.37792-2-wangyanan55@huawei.com>
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

In implementations of ARM architecture, at most there could be a
cpu hierarchy like "sockets/dies/clusters/cores/threads" defined.
For example, ARM64 server chip Kunpeng 920 totally has 2 sockets,
2 NUMA nodes (also means cpu dies) in each socket, 6 clusters in
each NUMA node, 4 cores in each cluster, and doesn't support SMT.
Clusters within the same NUMA share a L3 cache and cores within
the same cluster share a L2 cache.

The cache affinity of ARM cluster has been proved to improve the
kernel scheduling performance and a patchset has been posted, in
which a general sched_domain for clusters was added and a cluster
level was added in the arch-neutral cpu topology struct like below.

struct cpu_topology {
    int thread_id;
    int core_id;
    int cluster_id;
    int package_id;
    int llc_id;
    cpumask_t thread_sibling;
    cpumask_t core_sibling;
    cpumask_t cluster_sibling;
    cpumask_t llc_sibling;
}

In virtuallization, exposing the cluster level topology to guest
kernel may also improve the scheduling performance. So let's add
the -smp, clusters=* command line support for ARM cpu, then users
will be able to define a four-level cpu hierarchy for machines
and it will be sockets/clusters/cores/threads.

Because we only support clusters for ARM cpu currently, a new member
"smp_clusters" is only added to the VirtMachineState structure.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 include/hw/arm/virt.h |  1 +
 qemu-options.hx       | 26 +++++++++++++++-----------
 softmmu/vl.c          |  3 +++
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index f546dd2023..74fff9667b 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -156,6 +156,7 @@ struct VirtMachineState {
     char *pciehb_nodename;
     const int *irqmap;
     int fdt_size;
+    unsigned smp_clusters;
     uint32_t clock_phandle;
     uint32_t gic_phandle;
     uint32_t msi_phandle;
diff --git a/qemu-options.hx b/qemu-options.hx
index bd97086c21..245eb415a6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -184,25 +184,29 @@ SRST
 ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
-    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
+    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,clusters=clusters][,dies=dies][,sockets=sockets]\n"
     "                set the number of CPUs to 'n' [default=1]\n"
     "                maxcpus= maximum number of total cpus, including\n"
     "                offline CPUs for hotplug, etc\n"
-    "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
+    "                cores= number of CPU cores on one socket\n"
+    "                (it's on one die for PC, and on one cluster for ARM)\n"
     "                threads= number of threads on one CPU core\n"
+    "                clusters= number of CPU clusters on one socket (for ARM only)\n"
     "                dies= number of CPU dies on one socket (for PC only)\n"
     "                sockets= number of discrete sockets in the system\n",
         QEMU_ARCH_ALL)
 SRST
-``-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]``
-    Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
-    are supported. On Sparc32 target, Linux limits the number of usable
-    CPUs to 4. For the PC target, the number of cores per die, the
-    number of threads per cores, the number of dies per packages and the
-    total number of sockets can be specified. Missing values will be
-    computed. If any on the three values is given, the total number of
-    CPUs n can be omitted. maxcpus specifies the maximum number of
-    hotpluggable CPUs.
+``-smp [cpus=]n[,cores=cores][,threads=threads][,clusters=clusters][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]``
+    Simulate an SMP system with n CPUs. On the PC target, up to 255
+    CPUs are supported. On the Sparc32 target, Linux limits the number
+    of usable CPUs to 4. For the PC target, the number of threads per
+    core, the number of cores per die, the number of dies per package
+    and the total number of sockets can be specified. For the ARM target,
+    the number of threads per core, the number of cores per cluster, the
+    number of clusters per socket and the total number of sockets can be
+    specified. And missing values will be computed. If any of the five
+    values is given, the total number of CPUs n can be omitted. Maxcpus
+    specifies the maximum number of hotpluggable CPUs.
 
     For the ARM target, at least one of cpus or maxcpus must be provided.
     Threads will default to 1 if not provided. Sockets and cores must be
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 307944aef3..69a5c73ef7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -719,6 +719,9 @@ static QemuOptsList qemu_smp_opts = {
         }, {
             .name = "dies",
             .type = QEMU_OPT_NUMBER,
+        }, {
+            .name = "clusters",
+            .type = QEMU_OPT_NUMBER,
         }, {
             .name = "cores",
             .type = QEMU_OPT_NUMBER,
-- 
2.19.1


