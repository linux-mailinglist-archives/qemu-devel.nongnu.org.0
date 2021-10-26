Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CC143AAD7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 05:48:50 +0200 (CEST)
Received: from localhost ([::1]:59946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfDSD-0003Fl-7p
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 23:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mfDQc-0001NQ-7U
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 23:47:12 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:4095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mfDQY-0002HQ-3K
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 23:47:09 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hdd6r3LpKz90L8;
 Tue, 26 Oct 2021 11:47:00 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 26 Oct 2021 11:47:02 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 26 Oct 2021 11:47:02 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/2] hw/core/machine: Split out the smp parsing code
Date: Tue, 26 Oct 2021 11:46:58 +0800
Message-ID: <20211026034659.22040-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211026034659.22040-1-wangyanan55@huawei.com>
References: <20211026034659.22040-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to introduce an unit test for the parser smp_parse()
in hw/core/machine.c, but now machine.c is only built in softmmu.

In order to solve the build dependency on the smp parsing code and
avoid building unrelated stuff for the unit tests, move the tested
code from machine.c into a separate file, i.e., machine-smp.c and
build it in common field.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 MAINTAINERS           |   1 +
 hw/core/machine-smp.c | 181 ++++++++++++++++++++++++++++++++++++++++++
 hw/core/machine.c     | 159 -------------------------------------
 hw/core/meson.build   |   2 +
 include/hw/boards.h   |   1 +
 5 files changed, 185 insertions(+), 159 deletions(-)
 create mode 100644 hw/core/machine-smp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 894dc43105..80ec27d76a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1623,6 +1623,7 @@ F: cpu.c
 F: hw/core/cpu.c
 F: hw/core/machine-qmp-cmds.c
 F: hw/core/machine.c
+F: hw/core/machine-smp.c
 F: hw/core/null-machine.c
 F: hw/core/numa.c
 F: hw/cpu/cluster.c
diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
new file mode 100644
index 0000000000..116a0cbbfa
--- /dev/null
+++ b/hw/core/machine-smp.c
@@ -0,0 +1,181 @@
+/*
+ * QEMU Machine core (related to -smp parsing)
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
+
+/*
+ * Report information of a machine's supported CPU topology hierarchy.
+ * Topology members will be ordered from the largest to the smallest
+ * in the string.
+ */
+static char *cpu_hierarchy_to_string(MachineState *ms)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    GString *s = g_string_new(NULL);
+
+    g_string_append_printf(s, "sockets (%u)", ms->smp.sockets);
+
+    if (mc->smp_props.dies_supported) {
+        g_string_append_printf(s, " * dies (%u)", ms->smp.dies);
+    }
+
+    g_string_append_printf(s, " * cores (%u)", ms->smp.cores);
+    g_string_append_printf(s, " * threads (%u)", ms->smp.threads);
+
+    return g_string_free(s, false);
+}
+
+/*
+ * smp_parse - Generic function used to parse the given SMP configuration
+ *
+ * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
+ * automatically computed based on the provided ones.
+ *
+ * In the calculation of omitted sockets/cores/threads: we prefer sockets
+ * over cores over threads before 6.2, while preferring cores over sockets
+ * over threads since 6.2.
+ *
+ * In the calculation of cpus/maxcpus: When both maxcpus and cpus are omitted,
+ * maxcpus will be computed from the given parameters and cpus will be set
+ * equal to maxcpus. When only one of maxcpus and cpus is given then the
+ * omitted one will be set to its given counterpart's value. Both maxcpus and
+ * cpus may be specified, but maxcpus must be equal to or greater than cpus.
+ *
+ * For compatibility, apart from the parameters that will be computed, newly
+ * introduced topology members which are likely to be target specific should
+ * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
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
+        warn_report("Deprecated CPU topology (considered invalid): "
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
+        g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
+        error_setg(errp, "Invalid CPU topology: "
+                   "product of the hierarchy must match maxcpus: "
+                   "%s != maxcpus (%u)",
+                   topo_msg, maxcpus);
+        return;
+    }
+
+    if (maxcpus < cpus) {
+        g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
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
index b8d95eec32..dc15f5f9e5 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -749,165 +749,6 @@ void machine_set_cpu_numa_node(MachineState *machine,
     }
 }
 
-/*
- * Report information of a machine's supported CPU topology hierarchy.
- * Topology members will be ordered from the largest to the smallest
- * in the string.
- */
-static char *cpu_hierarchy_to_string(MachineState *ms)
-{
-    MachineClass *mc = MACHINE_GET_CLASS(ms);
-    GString *s = g_string_new(NULL);
-
-    g_string_append_printf(s, "sockets (%u)", ms->smp.sockets);
-
-    if (mc->smp_props.dies_supported) {
-        g_string_append_printf(s, " * dies (%u)", ms->smp.dies);
-    }
-
-    g_string_append_printf(s, " * cores (%u)", ms->smp.cores);
-    g_string_append_printf(s, " * threads (%u)", ms->smp.threads);
-
-    return g_string_free(s, false);
-}
-
-/*
- * smp_parse - Generic function used to parse the given SMP configuration
- *
- * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
- * automatically computed based on the provided ones.
- *
- * In the calculation of omitted sockets/cores/threads: we prefer sockets
- * over cores over threads before 6.2, while preferring cores over sockets
- * over threads since 6.2.
- *
- * In the calculation of cpus/maxcpus: When both maxcpus and cpus are omitted,
- * maxcpus will be computed from the given parameters and cpus will be set
- * equal to maxcpus. When only one of maxcpus and cpus is given then the
- * omitted one will be set to its given counterpart's value. Both maxcpus and
- * cpus may be specified, but maxcpus must be equal to or greater than cpus.
- *
- * For compatibility, apart from the parameters that will be computed, newly
- * introduced topology members which are likely to be target specific should
- * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
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
-        warn_report("Deprecated CPU topology (considered invalid): "
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
-        g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
-        error_setg(errp, "Invalid CPU topology: "
-                   "product of the hierarchy must match maxcpus: "
-                   "%s != maxcpus (%u)",
-                   topo_msg, maxcpus);
-        return;
-    }
-
-    if (maxcpus < cpus) {
-        g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
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
index 18f44fb7c2..c9e8e5b880 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -14,6 +14,8 @@ hwcore_files = files(
 )
 
 common_ss.add(files('cpu-common.c'))
+# machine-smp.c needed for -smp parsing, used by softmmu and unit tests
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


