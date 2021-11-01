Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9244544217F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:13:24 +0100 (CET)
Received: from localhost ([::1]:36206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdgJ-0001qB-47
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcHT-0000WG-Pz
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcHP-0008Qv-Gz
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635792214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=euU/R1theKjT6dJ6MZK+iqP5pd5vFwd810oB/EoUuBg=;
 b=hAJNNmcDfNsC6gbrsWHXm9J9wPYBqsiolgzNyyv9Gj13a0Xx3hbWJYYyYFDv0W2XyfIHDc
 oQmgF0TJ13WEEC8ZP1hG6xxph3GcjnhtlFYjT66SzBD5LVgJfv6UuAPxIDkOuvdZz5+LU2
 u1fKL2bc78hGHZFm2vqAGiU/t4yhSPs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-BWWL6DOKODOY8M5bDD5zBQ-1; Mon, 01 Nov 2021 14:43:33 -0400
X-MC-Unique: BWWL6DOKODOY8M5bDD5zBQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 f3-20020a5d50c3000000b00183ce1379feso1918226wrt.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=euU/R1theKjT6dJ6MZK+iqP5pd5vFwd810oB/EoUuBg=;
 b=WLsKzg7kilO/b05lvnxZ7xb0LfzPQW9zRWzgpIlQpxYnNdcGxVD8j0sjr1JgZ+jAy+
 RFtcnIMJJwvd8T1Du+ecoGs4OCMMODhxUaG7CFOTHUmwy1QXS8JMTS4MuL5YWB1hX8rV
 IfZAGsp3hM6IgD9jJc2EFjQ712/FoPh41HciSLjnxYlvo+VZooKd54FGTxv5S8wK/30X
 VomtvvXJMRJ1x7Mhdj+m9hHB4RFWXFs3LJmd9pzEzjmF45E2V6+PEWCmiPUBlwp1p6RT
 9rpv/Vs29p/4rvjPfQmiWmCBrt7vjuCtYHeZs8uIehlZEJgZiwC47KdH7m8PN0LDITbL
 Ix5w==
X-Gm-Message-State: AOAM5307KXRKTO/vQq7+LWzZdB/wxd61YfEguklD0g9xMhjsphollmh8
 FlWsh3tyDGonZtTLRx/nfRqrnUYNUv5ComhEtEPb3UoSHY5Em1dLoo6uZl/3Sgng5MFPIRRVJdR
 4ZW9chex+eCpOo+RT9dJ0XlxiGciL49XQYUZtl1+QCE/BRVxT5zlyJ/nCEi2o4awc
X-Received: by 2002:adf:a2d4:: with SMTP id t20mr39931983wra.229.1635792211755; 
 Mon, 01 Nov 2021 11:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyihhNw49t6ufRSX37zJzPNx+61qvWWf5NiBkpCdEF2U+kq6KT8EYdGjy/XfP9xFwBcJxpynQ==
X-Received: by 2002:adf:a2d4:: with SMTP id t20mr39931925wra.229.1635792211298; 
 Mon, 01 Nov 2021 11:43:31 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 l26sm314952wms.15.2021.11.01.11.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:43:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/10] hw/core/machine: Split out the smp parsing code
Date: Mon,  1 Nov 2021 19:42:55 +0100
Message-Id: <20211101184259.2859090-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101184259.2859090-1-philmd@redhat.com>
References: <20211101184259.2859090-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

We are going to introduce an unit test for the parser smp_parse()
in hw/core/machine.c, but now machine.c is only built in softmmu.

In order to solve the build dependency on the smp parsing code and
avoid building unrelated stuff for the unit tests, move the tested
code from machine.c into a separate file, i.e., machine-smp.c and
build it in common field.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211026034659.22040-2-wangyanan55@huawei.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/boards.h   |   1 +
 hw/core/machine-smp.c | 181 ++++++++++++++++++++++++++++++++++++++++++
 hw/core/machine.c     | 159 -------------------------------------
 MAINTAINERS           |   1 +
 hw/core/meson.build   |   1 +
 5 files changed, 184 insertions(+), 159 deletions(-)
 create mode 100644 hw/core/machine-smp.c

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 5adbcbb99b1..e36fc7d8615 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -34,6 +34,7 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine);
 void machine_set_cpu_numa_node(MachineState *machine,
                                const CpuInstanceProperties *props,
                                Error **errp);
+void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp);
 
 /**
  * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
new file mode 100644
index 00000000000..116a0cbbfab
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
index b8d95eec32d..dc15f5f9e5c 100644
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 894dc431052..80ec27d76ae 100644
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
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 7ec7bb93d5f..0f884d6fd4d 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -23,6 +23,7 @@
 endif
 
 common_ss.add(files('cpu-common.c'))
+common_ss.add(files('machine-smp.c'))
 softmmu_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
 softmmu_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
 softmmu_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
-- 
2.31.1


