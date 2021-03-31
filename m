Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BBD34FDBC
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 12:03:46 +0200 (CEST)
Received: from localhost ([::1]:53456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXhR-00038l-Iv
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 06:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXYH-0002ht-5z; Wed, 31 Mar 2021 05:54:18 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXY6-0002Xu-KD; Wed, 31 Mar 2021 05:54:15 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9M6G08PWz1BFy7;
 Wed, 31 Mar 2021 17:51:50 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 17:53:47 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH 1/6] vl.c: Add arch-neutral -smp,
 clusters=* command line support
Date: Wed, 31 Mar 2021 17:53:38 +0800
Message-ID: <20210331095343.12172-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210331095343.12172-1-wangyanan55@huawei.com>
References: <20210331095343.12172-1-wangyanan55@huawei.com>
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
 Eduardo
 Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A cluster means a group of cores that share some resources (e.g. cache)
among them under the LLC. For example, ARM64 server chip Kunpeng 920 has
6 or 8 clusters in each NUMA, and each cluster has 4 cores. All clusters
share L3 cache data while cores within each cluster share the L2 cache.

Also, there are some x86 CPU implementations (e.g. Jacobsville) where L2
cache is shared among a cluster of cores instead of being exclusive to
one single core. For example, on Jacobsville there are 6 clusters of 4
Atom cores, each cluster sharing a separate L2, and 24 cores sharing L3).

The cache affinity of cluster has been proved to improve the Linux kernel
scheduling performance and a patchset has been posted, in which a general
sched_domain for clusters was added and a cluster level was added in the
arch-neutral cpu topology struct like below.
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

Also the Kernel Doc: Documentation/devicetree/bindings/cpu/cpu-topology.txt
defines a four-level CPU topology hierarchy like socket/cluster/core/thread.
According to the context, a socket node's child nodes must be one or more
cluster nodes and a cluster node's child nodes must be one or more cluster
nodes/one or more core nodes.

So let's add the arch-neutral -smp, clusters=* command line support, so that
future guest os could make use of cluster cpu topology for better scheduling
performance. And whichever architecture that has groups of cpus sharing some
separate resources(e.g. L2 cache) internely under LLC can use this command
line parameter to define a VM with cluster level cpu topology.

For ARM machines, a four-level cpu hierarchy can be defined and it will be
sockets/clusters/cores/threads. For PC machines, a five-level cpu hierarchy
can be defined and it will be sockets/dies/clusters/cores/threads.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 include/hw/boards.h |  4 +++-
 qemu-options.hx     | 27 ++++++++++++++++-----------
 softmmu/vl.c        |  3 +++
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index a46dfe5d1a..776c3fe5e1 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -235,13 +235,15 @@ typedef struct DeviceMemoryState {
 /**
  * CpuTopology:
  * @cpus: the number of present logical processors on the machine
- * @cores: the number of cores in one package
+ * @clusters: the number of clusters in one package
+ * @cores: the number of cores in one cluster
  * @threads: the number of threads in one core
  * @sockets: the number of sockets on the machine
  * @max_cpus: the maximum number of logical processors on the machine
  */
 typedef struct CpuTopology {
     unsigned int cpus;
+    unsigned int clusters;
     unsigned int cores;
     unsigned int threads;
     unsigned int sockets;
diff --git a/qemu-options.hx b/qemu-options.hx
index 6c34c7050f..213904ceda 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -184,25 +184,30 @@ SRST
 ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
-    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
+    "-smp [cpus=]n[,maxcpus=cpus][,clusters=clusters][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
     "                set the number of CPUs to 'n' [default=1]\n"
     "                maxcpus= maximum number of total cpus, including\n"
     "                offline CPUs for hotplug, etc\n"
-    "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
+    "                clusters= number of CPU clusters on one socket\n"
+    "                (for PC, it's on one die)\n"
+    "                cores= number of CPU cores on one cluster\n"
     "                threads= number of threads on one CPU core\n"
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
+``-smp [cpus=]n[,maxcpus=cpus][,clusters=clusters][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]``
+    Simulate an SMP system with n CPUs. On the PC target, up to 255
+    CPUs are supported. On the Sparc32 target, Linux limits the number
+    of usable CPUs to 4. For the PC target, the number of threads per
+    core, the number of cores per cluster, the number of clusters per
+    die, the number of dies per package and the total number of sockets
+    can be specified. For the ARM target, the number of threads per core,
+    the number of cores per cluster, the number of clusters per socket
+    and the total number of sockets can be specified. And missing values
+    will be computed. If any of the five values is given, the total
+    number of CPUs n can be omitted. Maxcpus specifies the maximum
+    number of hotpluggable CPUs.
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b219ce1f35..b915f0606a 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -711,6 +711,9 @@ static QemuOptsList qemu_smp_opts = {
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


