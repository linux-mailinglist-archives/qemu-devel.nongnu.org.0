Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDA942808F
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 12:43:01 +0200 (CEST)
Received: from localhost ([::1]:41706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZWIF-0001wz-Md
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 06:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mZWG0-0008FQ-2x
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 06:40:40 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mZWFv-0005rS-43
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 06:40:39 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HRz1P0rmPz1DH80;
 Sun, 10 Oct 2021 18:38:49 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 10 Oct 2021 18:40:22 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 10 Oct 2021 18:40:21 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 1/2] hw/core/machine: Split out smp_parse as an inline API
Date: Sun, 10 Oct 2021 18:39:53 +0800
Message-ID: <20211010103954.20644-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211010103954.20644-1-wangyanan55@huawei.com>
References: <20211010103954.20644-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, Yanan Wang <wangyanan55@huawei.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Functionally smp_parse() is only called once and in one place
i.e. machine_set_smp, the possible second place where it'll be
called should be some unit tests if any.

Actually we are going to introduce an unit test for the parser.
For necessary isolation of the tested code, split smp_parse out
into a separate header as an inline API.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 MAINTAINERS           |   1 +
 hw/core/machine.c     | 160 +-----------------------------------
 include/hw/core/smp.h | 185 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 187 insertions(+), 159 deletions(-)
 create mode 100644 include/hw/core/smp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 50435b8d2f..dc9091c1d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1629,6 +1629,7 @@ F: qapi/machine.json
 F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
+F: include/hw/core/smp.h
 F: include/hw/cpu/cluster.h
 F: include/sysemu/numa.h
 T: git https://gitlab.com/ehabkost/qemu.git machine-next
diff --git a/hw/core/machine.c b/hw/core/machine.c
index b8d95eec32..3018230033 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -17,6 +17,7 @@
 #include "qemu/units.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
+#include "hw/core/smp.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-common.h"
 #include "qapi/qapi-visit-machine.h"
@@ -749,165 +750,6 @@ void machine_set_cpu_numa_node(MachineState *machine,
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
diff --git a/include/hw/core/smp.h b/include/hw/core/smp.h
new file mode 100644
index 0000000000..fe892a5193
--- /dev/null
+++ b/include/hw/core/smp.h
@@ -0,0 +1,185 @@
+/*
+ * QEMU Machine core (related to SMP)
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
+#ifndef MACHINE_CORE_SMP_H
+#define MACHINE_CORE_SMP_H
+
+#include "hw/boards.h"
+#include "qapi/error.h"
+
+/*
+ * Report information of a machine's supported CPU topology hierarchy.
+ * Topology members will be ordered from the largest to the smallest
+ * in the string.
+ */
+static inline char *cpu_hierarchy_to_string(MachineState *ms)
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
+static inline void smp_parse(MachineState *ms, SMPConfiguration *config,
+                             Error **errp)
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
+
+#endif
-- 
2.19.1


