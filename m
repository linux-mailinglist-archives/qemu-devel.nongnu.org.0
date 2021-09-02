Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A08A3FECCB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 13:19:34 +0200 (CEST)
Received: from localhost ([::1]:58332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLkkn-0007Fc-Cz
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 07:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkVj-0007Ra-Id; Thu, 02 Sep 2021 07:04:00 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkVe-0003mh-5o; Thu, 02 Sep 2021 07:03:58 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H0dHF6wjCzblCw;
 Thu,  2 Sep 2021 18:59:53 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 2 Sep 2021 19:03:50 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 2 Sep 2021 19:03:49 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v8 13/14] machine: Split out the smp parsing code
Date: Thu, 2 Sep 2021 19:03:29 +0800
Message-ID: <20210902110330.18036-14-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210902110330.18036-1-wangyanan55@huawei.com>
References: <20210902110330.18036-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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

We are going to introduce an unit test for the parser smp_parse()
in hw/core/machine.c, but now machine.c is only built in softmmu.

In order to solve the build dependency on the smp parsing code and
avoid building unrelated stuff for the unit tests, move the related
code from machine.c into a new common file, i.e., machine-smp.c.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 MAINTAINERS           |   1 +
 hw/core/machine-smp.c | 200 ++++++++++++++++++++++++++++++++++++++++++
 hw/core/machine.c     | 178 -------------------------------------
 hw/core/meson.build   |   1 +
 include/hw/boards.h   |   1 +
 5 files changed, 203 insertions(+), 178 deletions(-)
 create mode 100644 hw/core/machine-smp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c8221650b8..fb0bd4c023 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1631,6 +1631,7 @@ F: cpu.c
 F: hw/core/cpu.c
 F: hw/core/machine-qmp-cmds.c
 F: hw/core/machine.c
+F: hw/core/machine-smp.c
 F: hw/core/null-machine.c
 F: hw/core/numa.c
 F: hw/cpu/cluster.c
diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
new file mode 100644
index 0000000000..07604aef8d
--- /dev/null
+++ b/hw/core/machine-smp.c
@@ -0,0 +1,200 @@
+/*
+ * QEMU Machine (related to SMP)
+ *
+ * Copyright (c) 2021 Huawei Technologies Co., Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/boards.h"
+#include "qapi/error.h"
+#include "qemu/cutils.h"
+
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
+void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    unsigned cpus    = config->has_cpus ? config->cpus : 0;
+    unsigned sockets = config->has_sockets ? config->sockets : 0;
+    unsigned dies    = config->has_dies ? config->dies : 0;
+    unsigned cores   = config->has_cores ? config->cores : 0;
+    unsigned threads = config->has_threads ? config->threads : 0;
+    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
+
+    /*
+     * Specified CPU topology parameters must be greater than zero,
+     * explicit configuration like "cpus=0" is not allowed.
+     */
+    if ((config->has_cpus && config->cpus == 0) ||
+        (config->has_sockets && config->sockets == 0) ||
+        (config->has_dies && config->dies == 0) ||
+        (config->has_cores && config->cores == 0) ||
+        (config->has_threads && config->threads == 0) ||
+        (config->has_maxcpus && config->maxcpus == 0)) {
+        warn_report("Invalid CPU topology deprecated: "
+                    "CPU topology parameters must be greater than zero");
+    }
+
+    /*
+     * If not supported by the machine, a topology parameter must be
+     * omitted or specified equal to 1.
+     */
+    if (!mc->smp_props.dies_supported && dies > 1) {
+        error_setg(errp, "dies not supported by this machine's CPU topology");
+        return;
+    }
+
+    /*
+     * Omitted arch-specific members will not be computed, but will
+     * directly default to 1 instead.
+     */
+    dies = dies > 0 ? dies : 1;
+
+    /* compute missing values based on the provided ones */
+    if (cpus == 0 && maxcpus == 0) {
+        sockets = sockets > 0 ? sockets : 1;
+        cores = cores > 0 ? cores : 1;
+        threads = threads > 0 ? threads : 1;
+    } else {
+        maxcpus = maxcpus > 0 ? maxcpus : cpus;
+
+        if (mc->smp_props.prefer_sockets) {
+            /* prefer sockets over cores before 6.2 */
+            if (sockets == 0) {
+                cores = cores > 0 ? cores : 1;
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (dies * cores * threads);
+            } else if (cores == 0) {
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * dies * threads);
+            }
+        } else {
+            /* prefer cores over sockets since 6.2 */
+            if (cores == 0) {
+                sockets = sockets > 0 ? sockets : 1;
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * dies * threads);
+            } else if (sockets == 0) {
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (dies * cores * threads);
+            }
+        }
+
+        /* try to calculate omitted threads at last */
+        if (threads == 0) {
+            threads = maxcpus / (sockets * dies * cores);
+        }
+    }
+
+    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
+    cpus = cpus > 0 ? cpus : maxcpus;
+
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
+        error_setg(errp, "Invalid CPU topology: "
+                   "product of the hierarchy must match maxcpus: "
+                   "%s != maxcpus (%u)",
+                   topo_msg, maxcpus);
+        return;
+    }
+
+    if (maxcpus < cpus) {
+        g_autofree char *topo_msg = cpu_topology_hierarchy(ms);
+        error_setg(errp, "Invalid CPU topology: "
+                   "maxcpus must be equal to or greater than smp: "
+                   "%s == maxcpus (%u) < smp_cpus (%u)",
+                   topo_msg, maxcpus, cpus);
+        return;
+    }
+
+    if (ms->smp.cpus < mc->min_cpus) {
+        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
+                   "supported by machine '%s' is %d",
+                   ms->smp.cpus,
+                   mc->name, mc->min_cpus);
+        return;
+    }
+
+    if (ms->smp.max_cpus > mc->max_cpus) {
+        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
+                   "supported by machine '%s' is %d",
+                   ms->smp.max_cpus,
+                   mc->name, mc->max_cpus);
+        return;
+    }
+}
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 5b62ba7e34..771c0be17d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -15,7 +15,6 @@
 #include "qapi/qmp/qerror.h"
 #include "sysemu/replay.h"
 #include "qemu/units.h"
-#include "qemu/cutils.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "qapi/error.h"
@@ -747,183 +746,6 @@ void machine_set_cpu_numa_node(MachineState *machine,
     }
 }
 
-static char *cpu_topology_hierarchy(MachineState *ms)
-{
-    MachineClass *mc = MACHINE_GET_CLASS(ms);
-    SMPCompatProps *smp_props = &mc->smp_props;
-    char topo_msg[256] = "";
-
-    /*
-     * Topology members should be ordered from the largest to the smallest.
-     * Concept of sockets/cores/threads is supported by default and will be
-     * reported in the hierarchy. Unsupported members will not be reported.
-     */
-    g_autofree char *sockets_msg = g_strdup_printf(
-            " * sockets (%u)", ms->smp.sockets);
-    pstrcat(topo_msg, sizeof(topo_msg), sockets_msg);
-
-    if (smp_props->dies_supported) {
-        g_autofree char *dies_msg = g_strdup_printf(
-                " * dies (%u)", ms->smp.dies);
-        pstrcat(topo_msg, sizeof(topo_msg), dies_msg);
-    }
-
-    g_autofree char *cores_msg = g_strdup_printf(
-            " * cores (%u)", ms->smp.cores);
-    pstrcat(topo_msg, sizeof(topo_msg), cores_msg);
-
-    g_autofree char *threads_msg = g_strdup_printf(
-            " * threads (%u)", ms->smp.threads);
-    pstrcat(topo_msg, sizeof(topo_msg), threads_msg);
-
-    return g_strdup_printf("%s", topo_msg + 3);
-}
-
-/*
- * smp_parse - Generic function used to parse the given SMP configuration
- *
- * If not supported by the machine, a topology parameter must be omitted
- * or specified equal to 1. Concept of sockets/cores/threads is supported
- * by default. Unsupported members will not be reported in the topology
- * hierarchy message.
- *
- * For compatibility, omitted arch-specific members (e.g. dies) will not
- * be computed, but will directly default to 1 instead. This logic should
- * also apply to future introduced ones.
- *
- * Omitted arch-neutral parameters (i.e. cpus/sockets/cores/threads/maxcpus)
- * will be computed based on the provided ones. When both maxcpus and cpus
- * are omitted, maxcpus will be computed from the given parameters and cpus
- * will be set equal to maxcpus. When only one of maxcpus and cpus is given
- * then the omitted one will be set to its given counterpart's value.
- * Both maxcpus and cpus may be specified, but maxcpus must be equal to or
- * greater than cpus.
- *
- * In calculation of omitted sockets/cores/threads, we prefer sockets over
- * cores over threads before 6.2, while preferring cores over sockets over
- * threads since 6.2.
- */
-static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
-{
-    MachineClass *mc = MACHINE_GET_CLASS(ms);
-    unsigned cpus    = config->has_cpus ? config->cpus : 0;
-    unsigned sockets = config->has_sockets ? config->sockets : 0;
-    unsigned dies    = config->has_dies ? config->dies : 0;
-    unsigned cores   = config->has_cores ? config->cores : 0;
-    unsigned threads = config->has_threads ? config->threads : 0;
-    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
-
-    /*
-     * Specified CPU topology parameters must be greater than zero,
-     * explicit configuration like "cpus=0" is not allowed.
-     */
-    if ((config->has_cpus && config->cpus == 0) ||
-        (config->has_sockets && config->sockets == 0) ||
-        (config->has_dies && config->dies == 0) ||
-        (config->has_cores && config->cores == 0) ||
-        (config->has_threads && config->threads == 0) ||
-        (config->has_maxcpus && config->maxcpus == 0)) {
-        warn_report("Invalid CPU topology deprecated: "
-                    "CPU topology parameters must be greater than zero");
-    }
-
-    /*
-     * If not supported by the machine, a topology parameter must be
-     * omitted or specified equal to 1.
-     */
-    if (!mc->smp_props.dies_supported && dies > 1) {
-        error_setg(errp, "dies not supported by this machine's CPU topology");
-        return;
-    }
-
-    /*
-     * Omitted arch-specific members will not be computed, but will
-     * directly default to 1 instead.
-     */
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
-        if (mc->smp_props.prefer_sockets) {
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
-    ms->smp.cpus = cpus;
-    ms->smp.sockets = sockets;
-    ms->smp.dies = dies;
-    ms->smp.cores = cores;
-    ms->smp.threads = threads;
-    ms->smp.max_cpus = maxcpus;
-
-    /* sanity-check of the computed topology */
-    if (sockets * dies * cores * threads != maxcpus) {
-        g_autofree char *topo_msg = cpu_topology_hierarchy(ms);
-        error_setg(errp, "Invalid CPU topology: "
-                   "product of the hierarchy must match maxcpus: "
-                   "%s != maxcpus (%u)",
-                   topo_msg, maxcpus);
-        return;
-    }
-
-    if (maxcpus < cpus) {
-        g_autofree char *topo_msg = cpu_topology_hierarchy(ms);
-        error_setg(errp, "Invalid CPU topology: "
-                   "maxcpus must be equal to or greater than smp: "
-                   "%s == maxcpus (%u) < smp_cpus (%u)",
-                   topo_msg, maxcpus, cpus);
-        return;
-    }
-
-    if (ms->smp.cpus < mc->min_cpus) {
-        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
-                   "supported by machine '%s' is %d",
-                   ms->smp.cpus,
-                   mc->name, mc->min_cpus);
-        return;
-    }
-
-    if (ms->smp.max_cpus > mc->max_cpus) {
-        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
-                   "supported by machine '%s' is %d",
-                   ms->smp.max_cpus,
-                   mc->name, mc->max_cpus);
-        return;
-    }
-}
-
 static void machine_get_smp(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 18f44fb7c2..6d727c7742 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -14,6 +14,7 @@ hwcore_files = files(
 )
 
 common_ss.add(files('cpu-common.c'))
+common_ss.add(files('machine-smp.c'))
 common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
 common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
 common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 5adbcbb99b..e36fc7d861 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -34,6 +34,7 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine);
 void machine_set_cpu_numa_node(MachineState *machine,
                                const CpuInstanceProperties *props,
                                Error **errp);
+void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp);
 
 /**
  * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
-- 
2.19.1


