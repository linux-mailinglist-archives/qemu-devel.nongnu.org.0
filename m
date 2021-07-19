Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A003CCC99
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 05:24:06 +0200 (CEST)
Received: from localhost ([::1]:52214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Jsz-0005yD-Gr
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 23:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m5Jq4-00068n-Te
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:21:04 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m5Jpz-0005x6-He
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:21:04 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GSn8V3Lx4zZqmj;
 Mon, 19 Jul 2021 11:17:30 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 11:20:50 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 11:20:49 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.2 v2 02/11] machine: Make smp_parse generic enough for
 all arches
Date: Mon, 19 Jul 2021 11:20:34 +0800
Message-ID: <20210719032043.25416-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210719032043.25416-1-wangyanan55@huawei.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 yuzenghui@huawei.com, Igor
 Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the only difference between smp_parse and pc_smp_parse
is the support of multi-dies and the related error reporting code.
With an arch compat variable "bool smp_dies_supported", we can
easily make smp_parse generic enough for all arches and the PC
specific one can be removed.

Making smp_parse() generic enough can reduce code duplication and
ease the code maintenance, and also allows extending the topology
with more arch specific members (e.g., clusters) in the future.

No functional change intended.

Suggested-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine.c   | 28 ++++++++++-------
 hw/i386/pc.c        | 76 +--------------------------------------------
 include/hw/boards.h |  1 +
 3 files changed, 19 insertions(+), 86 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d73daa10f4..ed6712e964 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -743,6 +743,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
 
 static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned dies    = config->has_dies ? config->dies : 1;
@@ -761,7 +762,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         return;
     }
 
-    if (dies > 1) {
+    if (!mc->smp_dies_supported && dies > 1) {
         error_setg(errp, "dies not supported by this machine's CPU topology");
         return;
     }
@@ -772,23 +773,25 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         threads = threads > 0 ? threads : 1;
         if (cpus == 0) {
             sockets = sockets > 0 ? sockets : 1;
-            cpus = cores * threads * sockets;
+            cpus = sockets * dies * cores * threads;
         } else {
             maxcpus = maxcpus > 0 ? maxcpus : cpus;
-            sockets = maxcpus / (cores * threads);
+            sockets = maxcpus / (dies * cores * threads);
         }
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
-        cores = cpus / (sockets * threads);
+        cores = cpus / (sockets * dies * threads);
         cores = cores > 0 ? cores : 1;
     } else if (threads == 0) {
-        threads = cpus / (cores * sockets);
+        threads = cpus / (sockets * dies * cores);
         threads = threads > 0 ? threads : 1;
-    } else if (sockets * cores * threads < cpus) {
+    } else if (sockets * dies * cores * threads < cpus) {
+        g_autofree char *dies_msg = g_strdup_printf(
+            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
         error_setg(errp, "cpu topology: "
-                   "sockets (%u) * cores (%u) * threads (%u) < "
+                   "sockets (%u)%s * cores (%u) * threads (%u) < "
                    "smp_cpus (%u)",
-                   sockets, cores, threads, cpus);
+                   sockets, dies_msg, cores, threads, cpus);
         return;
     }
 
@@ -799,17 +802,20 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         return;
     }
 
-    if (sockets * cores * threads != maxcpus) {
+    if (sockets * dies * cores * threads != maxcpus) {
+        g_autofree char *dies_msg = g_strdup_printf(
+            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
         error_setg(errp, "Invalid CPU topology: "
-                   "sockets (%u) * cores (%u) * threads (%u) "
+                   "sockets (%u)%s * cores (%u) * threads (%u) "
                    "!= maxcpus (%u)",
-                   sockets, cores, threads,
+                   sockets, dies_msg, cores, threads,
                    maxcpus);
         return;
     }
 
     ms->smp.cpus = cpus;
     ms->smp.sockets = sockets;
+    ms->smp.dies = dies;
     ms->smp.cores = cores;
     ms->smp.threads = threads;
     ms->smp.max_cpus = maxcpus;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c6b63c00a5..d94ef582b5 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -708,80 +708,6 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
     }
 }
 
-/*
- * This function is very similar to smp_parse()
- * in hw/core/machine.c but includes CPU die support.
- */
-static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
-{
-    unsigned cpus    = config->has_cpus ? config->cpus : 0;
-    unsigned sockets = config->has_sockets ? config->sockets : 0;
-    unsigned dies    = config->has_dies ? config->dies : 1;
-    unsigned cores   = config->has_cores ? config->cores : 0;
-    unsigned threads = config->has_threads ? config->threads : 0;
-    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
-
-    if ((config->has_cpus && config->cpus == 0) ||
-        (config->has_sockets && config->sockets == 0) ||
-        (config->has_dies && config->dies == 0) ||
-        (config->has_cores && config->cores == 0) ||
-        (config->has_threads && config->threads == 0) ||
-        (config->has_maxcpus && config->maxcpus == 0)) {
-        error_setg(errp, "parameters must be equal to or greater than one"
-                   "if provided");
-        return;
-    }
-
-    /* compute missing values, prefer sockets over cores over threads */
-    if (cpus == 0 || sockets == 0) {
-        cores = cores > 0 ? cores : 1;
-        threads = threads > 0 ? threads : 1;
-        if (cpus == 0) {
-            sockets = sockets > 0 ? sockets : 1;
-            cpus = cores * threads * dies * sockets;
-        } else {
-            maxcpus = maxcpus > 0 ? maxcpus : cpus;
-            sockets = maxcpus / (cores * threads * dies);
-        }
-    } else if (cores == 0) {
-        threads = threads > 0 ? threads : 1;
-        cores = cpus / (sockets * dies * threads);
-        cores = cores > 0 ? cores : 1;
-    } else if (threads == 0) {
-        threads = cpus / (cores * dies * sockets);
-        threads = threads > 0 ? threads : 1;
-    } else if (sockets * dies * cores * threads < cpus) {
-        error_setg(errp, "cpu topology: "
-                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
-                   "smp_cpus (%u)",
-                   sockets, dies, cores, threads, cpus);
-        return;
-    }
-
-    maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
-    if (maxcpus < cpus) {
-        error_setg(errp, "maxcpus must be equal to or greater than smp");
-        return;
-    }
-
-    if (sockets * dies * cores * threads != maxcpus) {
-        error_setg(errp, "Invalid CPU topology deprecated: "
-                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                   "!= maxcpus (%u)",
-                   sockets, dies, cores, threads,
-                   maxcpus);
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
@@ -1735,7 +1661,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     mc->auto_enable_numa_with_memdev = true;
     mc->has_hotpluggable_cpus = true;
     mc->default_boot_order = "cad";
-    mc->smp_parse = pc_smp_parse;
     mc->block_default_type = IF_IDE;
     mc->max_cpus = 255;
     mc->reset = pc_machine_reset;
@@ -1746,6 +1671,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug = pc_machine_device_unplug_cb;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = true;
+    mc->smp_dies_supported = true;
     mc->default_ram_id = "pc.ram";
 
     object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
diff --git a/include/hw/boards.h b/include/hw/boards.h
index accd6eff35..b6161cee88 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -246,6 +246,7 @@ struct MachineClass {
     bool smbus_no_migration_support;
     bool nvdimm_supported;
     bool numa_mem_supported;
+    bool smp_dies_supported;
     bool auto_enable_numa;
     const char *default_ram_id;
 
-- 
2.19.1


