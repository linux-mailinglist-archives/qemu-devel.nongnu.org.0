Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8109043E4BE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:15:00 +0200 (CEST)
Received: from localhost ([::1]:45566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg77L-0002OR-Lg
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg72B-0003OS-5F
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:09:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg726-0007hi-LS
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:09:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635433773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbOYartnyazvLTe6gb4OaRaZMz4D3pKWunSBNtEOXEI=;
 b=TSCjYTTTb7xPGfNPHwlauv60DnTuxAkXuC4E4XzOWZf5RZcAjl4r/qGHpj9ict9Qt09/g0
 psyUJaUNxdTveiRM1mSIAr+n9nw/iCeHuKWFplbDmQvOBfPOleW1wIIw0KTs3HKDqeT4X5
 kordV/jgrkhfxRBtbWRK3Mm4t87NqSk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-5riiU3QcMmKoQ81plrEc3w-1; Thu, 28 Oct 2021 11:09:23 -0400
X-MC-Unique: 5riiU3QcMmKoQ81plrEc3w-1
Received: by mail-wm1-f69.google.com with SMTP id
 67-20020a1c0046000000b0032cd88916e5so842594wma.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FbOYartnyazvLTe6gb4OaRaZMz4D3pKWunSBNtEOXEI=;
 b=XSSINLuLTJLzG+rN0KHjJE1zgwt2JHck6ShaxjFqGo7y/X9hx4icFYbEYfJWRJD5F0
 88CzpfJsrXpcUvNKskvzej4BnkqhCR/jCJ6Fw47z2x6BXlT9IQs98e6peV3QiY/W56P+
 P0BUz3hphHgw8XhBGpVz2o+T7MAMHpbeeg1bL7+7cUG1BvTEffsykW7luJ32Cun1yBdh
 oB1t/0Aed6cKr8c0iehJk+Mqu7kseHs+TbzH4jz1+Y4LyMniUjaOsYGn8/Mj3rYad5/O
 IqAR/rgy2kH9ehABcpWhwnSCCq1DSBBeMmdnzpujgTk0nML1jFX/Sqcc71uT01rY2lgJ
 aP5w==
X-Gm-Message-State: AOAM532HfFUb7gm+2eZ1Z/oiBhf+DdkGHLPjIYSbtFNn4vmGA05vzEc8
 36jgRZzQ84nclFcHn8sQ3ZBLfoaDJVe+/r3YQnsDSUbDOTYHfsHwDtMuJVTPcyG5gHdbMfRIhSj
 FHE7aWXLqkPRQZS0w6svwqPJl8Npzh6s9SH5Ca96sIkF/Zfxoa7qUbYRlztmQ2opB
X-Received: by 2002:adf:d0cf:: with SMTP id z15mr6483778wrh.219.1635433761126; 
 Thu, 28 Oct 2021 08:09:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs7DCe4S+9byLTzNovwCMJBvkj/E+tT2At0BRdybwFe0nD3kWtyVgiSYhDmJPXAZHTfVyIeA==
X-Received: by 2002:adf:d0cf:: with SMTP id z15mr6483681wrh.219.1635433760608; 
 Thu, 28 Oct 2021 08:09:20 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e18sm1823312wrs.48.2021.10.28.08.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:09:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] hw/core/machine: Split out the smp parsing code
Date: Thu, 28 Oct 2021 17:09:12 +0200
Message-Id: <20211028150913.1975305-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028150913.1975305-1-philmd@redhat.com>
References: <20211028150913.1975305-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
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
index afc5ed2c906..987bb118c3d 100644
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


