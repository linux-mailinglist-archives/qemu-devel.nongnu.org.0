Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB13A458354
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 13:29:57 +0100 (CET)
Received: from localhost ([::1]:32828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1molym-0004Np-Qa
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 07:29:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluM-0003pF-TK; Sun, 21 Nov 2021 07:25:22 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluH-0005lV-TQ; Sun, 21 Nov 2021 07:25:22 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HxqKr55ypzVfmC;
 Sun, 21 Nov 2021 20:22:40 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 20:25:08 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Markus Armbruster <armbru@redhat.com>, Eric
 Blake <eblake@redhat.com>, <wanghaibin.wang@huawei.com>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: [PATCH v4 02/10] hw/core/machine: Introduce CPU cluster topology
 support
Date: Sun, 21 Nov 2021 20:24:54 +0800
Message-ID: <20211121122502.9844-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211121122502.9844-1-wangyanan55@huawei.com>
References: <20211121122502.9844-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The new Cluster-Aware Scheduling support has landed in Linux 5.16,
which has been proved to benefit the scheduling performance (e.g.
load balance and wake_affine strategy) on both x86_64 and AArch64.

So now in Linux 5.16 we have four-level arch-neutral CPU topology
definition like below and a new scheduler level for clusters.
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

A cluster generally means a group of CPU cores which share L2 cache
or other mid-level resources, and it is the shared resources that
is used to improve scheduler's behavior. From the point of view of
the size range, it's between CPU die and CPU core. For example, on
some ARM64 Kunpeng servers, we have 6 clusters in each NUMA node,
and 4 CPU cores in each cluster. The 4 CPU cores share a separate
L2 cache and a L3 cache tag, which brings cache affinity advantage.

In virtualization, on the Hosts which have pClusters, if we can
design a vCPU topology with cluster level for guest kernel and
have a dedicated vCPU pinning. A Cluster-Aware Guest kernel can
also make use of the cache affinity of CPU clusters to gain
similar scheduling performance.

This patch adds infrastructure for CPU cluster level topology
configuration and parsing, so that the user can specify cluster
parameter if their machines support it.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine-smp.c | 26 +++++++++++++++++++-------
 hw/core/machine.c     |  3 +++
 include/hw/boards.h   |  6 +++++-
 qapi/machine.json     |  5 ++++-
 qemu-options.hx       |  7 ++++---
 softmmu/vl.c          |  3 +++
 6 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 116a0cbbfa..87ceb45470 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -37,6 +37,10 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
         g_string_append_printf(s, " * dies (%u)", ms->smp.dies);
     }
 
+    if (mc->smp_props.clusters_supported) {
+        g_string_append_printf(s, " * clusters (%u)", ms->smp.clusters);
+    }
+
     g_string_append_printf(s, " * cores (%u)", ms->smp.cores);
     g_string_append_printf(s, " * threads (%u)", ms->smp.threads);
 
@@ -69,6 +73,7 @@ void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned dies    = config->has_dies ? config->dies : 0;
+    unsigned clusters = config->has_clusters ? config->clusters : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
     unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
@@ -80,6 +85,7 @@ void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     if ((config->has_cpus && config->cpus == 0) ||
         (config->has_sockets && config->sockets == 0) ||
         (config->has_dies && config->dies == 0) ||
+        (config->has_clusters && config->clusters == 0) ||
         (config->has_cores && config->cores == 0) ||
         (config->has_threads && config->threads == 0) ||
         (config->has_maxcpus && config->maxcpus == 0)) {
@@ -95,8 +101,13 @@ void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         error_setg(errp, "dies not supported by this machine's CPU topology");
         return;
     }
+    if (!mc->smp_props.clusters_supported && clusters > 1) {
+        error_setg(errp, "clusters not supported by this machine's CPU topology");
+        return;
+    }
 
     dies = dies > 0 ? dies : 1;
+    clusters = clusters > 0 ? clusters : 1;
 
     /* compute missing values based on the provided ones */
     if (cpus == 0 && maxcpus == 0) {
@@ -111,41 +122,42 @@ void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
             if (sockets == 0) {
                 cores = cores > 0 ? cores : 1;
                 threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (dies * cores * threads);
+                sockets = maxcpus / (dies * clusters * cores * threads);
             } else if (cores == 0) {
                 threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * dies * threads);
+                cores = maxcpus / (sockets * dies * clusters * threads);
             }
         } else {
             /* prefer cores over sockets since 6.2 */
             if (cores == 0) {
                 sockets = sockets > 0 ? sockets : 1;
                 threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * dies * threads);
+                cores = maxcpus / (sockets * dies * clusters * threads);
             } else if (sockets == 0) {
                 threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (dies * cores * threads);
+                sockets = maxcpus / (dies * clusters * cores * threads);
             }
         }
 
         /* try to calculate omitted threads at last */
         if (threads == 0) {
-            threads = maxcpus / (sockets * dies * cores);
+            threads = maxcpus / (sockets * dies * clusters * cores);
         }
     }
 
-    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
+    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * clusters * cores * threads;
     cpus = cpus > 0 ? cpus : maxcpus;
 
     ms->smp.cpus = cpus;
     ms->smp.sockets = sockets;
     ms->smp.dies = dies;
+    ms->smp.clusters = clusters;
     ms->smp.cores = cores;
     ms->smp.threads = threads;
     ms->smp.max_cpus = maxcpus;
 
     /* sanity-check of the computed topology */
-    if (sockets * dies * cores * threads != maxcpus) {
+    if (sockets * dies * clusters * cores * threads != maxcpus) {
         g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
         error_setg(errp, "Invalid CPU topology: "
                    "product of the hierarchy must match maxcpus: "
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 53a99abc56..d4fa6e0306 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -742,10 +742,12 @@ static void machine_get_smp(Object *obj, Visitor *v, const char *name,
         .has_cpus = true, .cpus = ms->smp.cpus,
         .has_sockets = true, .sockets = ms->smp.sockets,
         .has_dies = true, .dies = ms->smp.dies,
+        .has_clusters = true, .clusters = ms->smp.clusters,
         .has_cores = true, .cores = ms->smp.cores,
         .has_threads = true, .threads = ms->smp.threads,
         .has_maxcpus = true, .maxcpus = ms->smp.max_cpus,
     };
+
     if (!visit_type_SMPConfiguration(v, name, &config, &error_abort)) {
         return;
     }
@@ -932,6 +934,7 @@ static void machine_initfn(Object *obj)
     ms->smp.max_cpus = mc->default_cpus;
     ms->smp.sockets = 1;
     ms->smp.dies = 1;
+    ms->smp.clusters = 1;
     ms->smp.cores = 1;
     ms->smp.threads = 1;
 }
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 9c1c190104..1a136edb0e 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -128,10 +128,12 @@ typedef struct {
  * SMPCompatProps:
  * @prefer_sockets - whether sockets are preferred over cores in smp parsing
  * @dies_supported - whether dies are supported by the machine
+ * @clusters_supported - whether clusters are supported by the machine
  */
 typedef struct {
     bool prefer_sockets;
     bool dies_supported;
+    bool clusters_supported;
 } SMPCompatProps;
 
 /**
@@ -298,7 +300,8 @@ typedef struct DeviceMemoryState {
  * @cpus: the number of present logical processors on the machine
  * @sockets: the number of sockets on the machine
  * @dies: the number of dies in one socket
- * @cores: the number of cores in one die
+ * @clusters: the number of clusters in one die
+ * @cores: the number of cores in one cluster
  * @threads: the number of threads in one core
  * @max_cpus: the maximum number of logical processors on the machine
  */
@@ -306,6 +309,7 @@ typedef struct CpuTopology {
     unsigned int cpus;
     unsigned int sockets;
     unsigned int dies;
+    unsigned int clusters;
     unsigned int cores;
     unsigned int threads;
     unsigned int max_cpus;
diff --git a/qapi/machine.json b/qapi/machine.json
index 067e3f5378..b9dd8f7f90 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1396,7 +1396,9 @@
 #
 # @dies: number of dies per socket in the CPU topology
 #
-# @cores: number of cores per die in the CPU topology
+# @clusters: number of clusters per die in the CPU topology
+#
+# @cores: number of cores per cluster in the CPU topology
 #
 # @threads: number of threads per core in the CPU topology
 #
@@ -1408,6 +1410,7 @@
      '*cpus': 'int',
      '*sockets': 'int',
      '*dies': 'int',
+     '*clusters': 'int',
      '*cores': 'int',
      '*threads': 'int',
      '*maxcpus': 'int' } }
diff --git a/qemu-options.hx b/qemu-options.hx
index 7a59db7764..0f26f7dad7 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -206,13 +206,14 @@ SRST
 ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
-    "-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
+    "-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,clusters=clusters][,cores=cores][,threads=threads]\n"
     "                set the number of initial CPUs to 'n' [default=1]\n"
     "                maxcpus= maximum number of total CPUs, including\n"
     "                offline CPUs for hotplug, etc\n"
     "                sockets= number of sockets on the machine board\n"
     "                dies= number of dies in one socket\n"
-    "                cores= number of cores in one die\n"
+    "                clusters= number of clusters in one die\n"
+    "                cores= number of cores in one cluster\n"
     "                threads= number of threads in one core\n"
     "Note: Different machines may have different subsets of the CPU topology\n"
     "      parameters supported, so the actual meaning of the supported parameters\n"
@@ -228,7 +229,7 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
     "      must be set as 1 in the purpose of correct parsing.\n",
     QEMU_ARCH_ALL)
 SRST
-``-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]``
+``-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,clusters=clusters][,cores=cores][,threads=threads]``
     Simulate a SMP system with '\ ``n``\ ' CPUs initially present on
     the machine type board. On boards supporting CPU hotplug, the optional
     '\ ``maxcpus``\ ' parameter can be set to enable further CPUs to be
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1159a64bce..7acf06dace 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -726,6 +726,9 @@ static QemuOptsList qemu_smp_opts = {
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


