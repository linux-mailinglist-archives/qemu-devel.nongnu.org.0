Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9964067D8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 09:39:51 +0200 (CEST)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOb8Y-0006Pp-AR
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 03:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazr-00054Q-IX; Fri, 10 Sep 2021 03:30:51 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazn-0000x4-JU; Fri, 10 Sep 2021 03:30:51 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4H5SFc1hqvz8t2W;
 Fri, 10 Sep 2021 15:30:12 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:43 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:43 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v9 11/16] machine: Make smp_parse generic enough for all arches
Date: Fri, 10 Sep 2021 15:30:20 +0800
Message-ID: <20210910073025.16480-12-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210910073025.16480-1-wangyanan55@huawei.com>
References: <20210910073025.16480-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Greg Kurz <groug@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the only difference between smp_parse and pc_smp_parse
is the support of dies parameter and the related error reporting.
With some arch compat variables like "bool dies_supported", we can
make smp_parse generic enough for all arches and the PC specific
one can be removed.

Making smp_parse() generic enough can reduce code duplication and
ease the code maintenance, and also allows extending the topology
with more arch specific members (e.g., clusters) in the future.

Suggested-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/core/machine.c   | 110 ++++++++++++++++++++++++++++++++++++--------
 hw/i386/pc.c        |  84 +--------------------------------
 include/hw/boards.h |   9 ++++
 3 files changed, 100 insertions(+), 103 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index a21fcd7700..4b5c943f8e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -15,6 +15,7 @@
 #include "qapi/qmp/qerror.h"
 #include "sysemu/replay.h"
 #include "qemu/units.h"
+#include "qemu/cutils.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "qapi/error.h"
@@ -746,20 +747,87 @@ void machine_set_cpu_numa_node(MachineState *machine,
     }
 }
 
+static char *cpu_topology_hierarchy(MachineState *ms)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    SMPCompatProps *smp_props = &mc->smp_props;
+    char topo_msg[256] = "";
+
+    /*
+     * Topology members should be ordered from the largest to the smallest.
+     * Concept of sockets/cores/threads is supported by default and will be
+     * reported in the hierarchy. Unsupported members will not be reported.
+     */
+    g_autofree char *sockets_msg = g_strdup_printf(
+            " * sockets (%u)", ms->smp.sockets);
+    pstrcat(topo_msg, sizeof(topo_msg), sockets_msg);
+
+    if (smp_props->dies_supported) {
+        g_autofree char *dies_msg = g_strdup_printf(
+                " * dies (%u)", ms->smp.dies);
+        pstrcat(topo_msg, sizeof(topo_msg), dies_msg);
+    }
+
+    g_autofree char *cores_msg = g_strdup_printf(
+            " * cores (%u)", ms->smp.cores);
+    pstrcat(topo_msg, sizeof(topo_msg), cores_msg);
+
+    g_autofree char *threads_msg = g_strdup_printf(
+            " * threads (%u)", ms->smp.threads);
+    pstrcat(topo_msg, sizeof(topo_msg), threads_msg);
+
+    return g_strdup_printf("%s", topo_msg + 3);
+}
+
+/*
+ * smp_parse - Generic function used to parse the given SMP configuration
+ *
+ * If not supported by the machine, a topology parameter must be omitted
+ * or specified equal to 1. Concept of sockets/cores/threads is supported
+ * by default. Unsupported members will not be reported in the topology
+ * hierarchy message.
+ *
+ * For compatibility, omitted arch-specific members (e.g. dies) will not
+ * be computed, but will directly default to 1 instead. This logic should
+ * also apply to future introduced ones.
+ *
+ * Omitted arch-neutral parameters (i.e. cpus/sockets/cores/threads/maxcpus)
+ * will be computed based on the provided ones. When both maxcpus and cpus
+ * are omitted, maxcpus will be computed from the given parameters and cpus
+ * will be set equal to maxcpus. When only one of maxcpus and cpus is given
+ * then the omitted one will be set to its given counterpart's value.
+ * Both maxcpus and cpus may be specified, but maxcpus must be equal to or
+ * greater than cpus.
+ *
+ * In calculation of omitted sockets/cores/threads, we prefer sockets over
+ * cores over threads before 6.2, while preferring cores over sockets over
+ * threads since 6.2.
+ */
 static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
+    unsigned dies    = config->has_dies ? config->dies : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
     unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
 
-    if (config->has_dies && config->dies > 1) {
+    /*
+     * If not supported by the machine, a topology parameter must be
+     * omitted or specified equal to 1.
+     */
+    if (!mc->smp_props.dies_supported && dies > 1) {
         error_setg(errp, "dies not supported by this machine's CPU topology");
         return;
     }
 
+    /*
+     * Omitted arch-specific members will not be computed, but will
+     * directly default to 1 instead.
+     */
+    dies = dies > 0 ? dies : 1;
+
     /* compute missing values based on the provided ones */
     if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
@@ -773,55 +841,57 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
             if (sockets == 0) {
                 cores = cores > 0 ? cores : 1;
                 threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (cores * threads);
+                sockets = maxcpus / (dies * cores * threads);
             } else if (cores == 0) {
                 threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * threads);
+                cores = maxcpus / (sockets * dies * threads);
             }
         } else {
             /* prefer cores over sockets since 6.2 */
             if (cores == 0) {
                 sockets = sockets > 0 ? sockets : 1;
                 threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * threads);
+                cores = maxcpus / (sockets * dies * threads);
             } else if (sockets == 0) {
                 threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (cores * threads);
+                sockets = maxcpus / (dies * cores * threads);
             }
         }
 
         /* try to calculate omitted threads at last */
         if (threads == 0) {
-            threads = maxcpus / (sockets * cores);
+            threads = maxcpus / (sockets * dies * cores);
         }
     }
 
-    maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
+    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
     cpus = cpus > 0 ? cpus : maxcpus;
 
-    if (sockets * cores * threads != maxcpus) {
+    ms->smp.cpus = cpus;
+    ms->smp.sockets = sockets;
+    ms->smp.dies = dies;
+    ms->smp.cores = cores;
+    ms->smp.threads = threads;
+    ms->smp.max_cpus = maxcpus;
+
+    /* sanity-check of the computed topology */
+    if (sockets * dies * cores * threads != maxcpus) {
+        g_autofree char *topo_msg = cpu_topology_hierarchy(ms);
         error_setg(errp, "Invalid CPU topology: "
                    "product of the hierarchy must match maxcpus: "
-                   "sockets (%u) * cores (%u) * threads (%u) "
-                   "!= maxcpus (%u)",
-                   sockets, cores, threads, maxcpus);
+                   "%s != maxcpus (%u)",
+                   topo_msg, maxcpus);
         return;
     }
 
     if (maxcpus < cpus) {
+        g_autofree char *topo_msg = cpu_topology_hierarchy(ms);
         error_setg(errp, "Invalid CPU topology: "
                    "maxcpus must be equal to or greater than smp: "
-                   "sockets (%u) * cores (%u) * threads (%u) "
-                   "== maxcpus (%u) < smp_cpus (%u)",
-                   sockets, cores, threads, maxcpus, cpus);
+                   "%s == maxcpus (%u) < smp_cpus (%u)",
+                   topo_msg, maxcpus, cpus);
         return;
     }
-
-    ms->smp.cpus = cpus;
-    ms->smp.sockets = sockets;
-    ms->smp.cores = cores;
-    ms->smp.threads = threads;
-    ms->smp.max_cpus = maxcpus;
 }
 
 static void machine_get_smp(Object *obj, Visitor *v, const char *name,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2bcf297787..2eb7125fca 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -710,88 +710,6 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
     }
 }
 
-/*
- * This function is very similar to smp_parse()
- * in hw/core/machine.c but includes CPU die support.
- */
-static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
-{
-    MachineClass *mc = MACHINE_GET_CLASS(ms);
-    unsigned cpus    = config->has_cpus ? config->cpus : 0;
-    unsigned sockets = config->has_sockets ? config->sockets : 0;
-    unsigned dies    = config->has_dies ? config->dies : 0;
-    unsigned cores   = config->has_cores ? config->cores : 0;
-    unsigned threads = config->has_threads ? config->threads : 0;
-    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
-
-    /* directly default dies to 1 if it's omitted */
-    dies = dies > 0 ? dies : 1;
-
-    /* compute missing values based on the provided ones */
-    if (cpus == 0 && maxcpus == 0) {
-        sockets = sockets > 0 ? sockets : 1;
-        cores = cores > 0 ? cores : 1;
-        threads = threads > 0 ? threads : 1;
-    } else {
-        maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
-        if (mc->smp_prefer_sockets) {
-            /* prefer sockets over cores before 6.2 */
-            if (sockets == 0) {
-                cores = cores > 0 ? cores : 1;
-                threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (dies * cores * threads);
-            } else if (cores == 0) {
-                threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * dies * threads);
-            }
-        } else {
-            /* prefer cores over sockets since 6.2 */
-            if (cores == 0) {
-                sockets = sockets > 0 ? sockets : 1;
-                threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * dies * threads);
-            } else if (sockets == 0) {
-                threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (dies * cores * threads);
-            }
-        }
-
-        /* try to calculate omitted threads at last */
-        if (threads == 0) {
-            threads = maxcpus / (sockets * dies * cores);
-        }
-    }
-
-    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
-    cpus = cpus > 0 ? cpus : maxcpus;
-
-    if (sockets * dies * cores * threads != maxcpus) {
-        error_setg(errp, "Invalid CPU topology: "
-                   "product of the hierarchy must match maxcpus: "
-                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                   "!= maxcpus (%u)",
-                   sockets, dies, cores, threads, maxcpus);
-        return;
-    }
-
-    if (maxcpus < cpus) {
-        error_setg(errp, "Invalid CPU topology: "
-                   "maxcpus must be equal to or greater than smp: "
-                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                   "== maxcpus (%u) < smp_cpus (%u)",
-                   sockets, dies, cores, threads, maxcpus, cpus);
-        return;
-    }
-
-    ms->smp.cpus = cpus;
-    ms->smp.sockets = sockets;
-    ms->smp.dies = dies;
-    ms->smp.cores = cores;
-    ms->smp.threads = threads;
-    ms->smp.max_cpus = maxcpus;
-}
-
 static
 void pc_machine_done(Notifier *notifier, void *data)
 {
@@ -1736,7 +1654,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     mc->auto_enable_numa_with_memdev = true;
     mc->has_hotpluggable_cpus = true;
     mc->default_boot_order = "cad";
-    mc->smp_parse = pc_smp_parse;
     mc->block_default_type = IF_IDE;
     mc->max_cpus = 255;
     mc->reset = pc_machine_reset;
@@ -1747,6 +1664,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug = pc_machine_device_unplug_cb;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = true;
+    mc->smp_props.dies_supported = true;
     mc->default_ram_id = "pc.ram";
 
     object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 2a1bba86c0..72a23e4e0f 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -108,6 +108,14 @@ typedef struct {
     CPUArchId cpus[];
 } CPUArchIdList;
 
+/**
+ * SMPCompatProps:
+ * @dies_supported - whether dies are supported by the machine
+ */
+typedef struct {
+    bool dies_supported;
+} SMPCompatProps;
+
 /**
  * MachineClass:
  * @deprecation_reason: If set, the machine is marked as deprecated. The
@@ -248,6 +256,7 @@ struct MachineClass {
     bool numa_mem_supported;
     bool auto_enable_numa;
     bool smp_prefer_sockets;
+    SMPCompatProps smp_props;
     const char *default_ram_id;
 
     HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
-- 
2.23.0


