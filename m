Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951B5381E1C
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 12:37:15 +0200 (CEST)
Received: from localhost ([::1]:43600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liE94-0008Bt-L7
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 06:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE1Y-0001WN-Al; Sun, 16 May 2021 06:29:29 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE1R-0007Ge-Nh; Sun, 16 May 2021 06:29:28 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fjdj53K6tzmVYm;
 Sun, 16 May 2021 18:26:33 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:29:16 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:29:15 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, "Alistair
 Francis" <alistair.francis@wdc.com>, David Gibson
 <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v3 9/9] hw/arm/virt: Add separate -smp parsing function
 for ARM machines
Date: Sun, 16 May 2021 18:29:00 +0800
Message-ID: <20210516102900.28036-10-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210516102900.28036-1-wangyanan55@huawei.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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
Cc: Barry Song <song.bao.hua@hisilicon.com>, zhukeqian1@huawei.com,
 yangyicong@huawei.com, prime.zeng@hisilicon.com, wanghaibin.wang@huawei.com,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cpu hierarchy topology information parsed out from QEMU -smp
command line will be exposed to guest kernel through ACPI and DT
since machine type 6.1, so we will expect more detailed topology
descriptions and will be more strict with the -smp cmdlines when
parsing them.

Compared with the default smp_parse() where all missing values
are automatically calculated in turn, there is some difference
in ARM specific virt_smp_parse(). The parsing logic is like:
At least one of cpus or maxcpus must be provided. Threads will
default to 1 if not provided (assume not support SMT). Sockets
and cores must be either both provided or both not.

Note, if neither sockets nor cores are provided, we calculate
all the missing values like smp_parse() did before, but will
disable support of exposing these auto-populated descriptions
to guest. Then guest will populate its topology by default.

Suggested-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c   | 95 +++++++++++++++++++++++++++++++++++++++++++++++++
 qemu-options.hx |  4 +++
 2 files changed, 99 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 50e324975f..44e990e3be 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -76,6 +76,8 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "qapi/qmp/qerror.h"
+#include "sysemu/replay.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -2627,6 +2629,98 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
     return fixed_ipa ? 0 : requested_pa_size;
 }
 
+/*
+ * virt_smp_parse - Used to parse -smp command line for ARM machines.
+ *
+ * Compared with the default smp_parse where all the missing values
+ * are automatically calculated in turn, in this function, we expect
+ * more detailed topology information provided and are more strict
+ * with the -smp cmdlines when parsing them.
+ *
+ * We require that at least one of cpus or maxcpus must be provided.
+ * Threads will default to 1 if not provided. Sockets and cores must
+ * be either both provided or both not.
+ *
+ * Note, if neither sockets nor cores are specified, we will calculate
+ * all the missing values just like smp_parse() does, but will disable
+ * exposure of cpu topology descriptions to guest.
+ */
+static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
+{
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(ms);
+
+    if (opts) {
+        unsigned cpus = qemu_opt_get_number(opts, "cpus", 0);
+        unsigned maxcpus = qemu_opt_get_number(opts, "maxcpus", 0);
+        unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
+        unsigned cores = qemu_opt_get_number(opts, "cores", 0);
+        unsigned threads = qemu_opt_get_number(opts, "threads", 0);
+
+        /* Default threads to 1 if not provided */
+        threads = threads > 0 ? threads : 1;
+
+        if (cpus == 0 && maxcpus == 0) {
+            error_report("at least one of cpus or maxcpus must be provided");
+            exit(1);
+        }
+
+        if (sockets == 0 && cores == 0) {
+            /* Disable exposure of topology descriptions to guest */
+            vmc->no_cpu_topology = true;
+
+            /* Compute missing values, prefer sockets over cores */
+            cores = 1;
+            if (cpus == 0) {
+                sockets = 1;
+                cpus = sockets * cores * threads;
+            } else {
+                maxcpus = maxcpus > 0 ? maxcpus : cpus;
+                sockets = maxcpus / (cores * threads);
+            }
+        } else if (sockets > 0 && cores > 0) {
+            cpus = cpus > 0 ? cpus : sockets * cores * threads;
+            maxcpus = maxcpus > 0 ? maxcpus : cpus;
+        } else {
+            error_report("sockets and cores must be both provided "
+                         "or both not");
+            exit(1);
+        }
+
+        if (maxcpus < cpus) {
+            error_report("maxcpus must be equal to or greater than smp");
+            exit(1);
+        }
+
+        if (sockets * cores * threads < cpus) {
+            error_report("cpu topology: "
+                         "sockets (%u) * cores (%u) * threads (%u) < "
+                         "smp_cpus (%u)",
+                         sockets, cores, threads, cpus);
+            exit(1);
+        }
+
+        if (sockets * cores * threads != maxcpus) {
+            error_report("cpu topology: "
+                         "sockets (%u) * cores (%u) * threads (%u) "
+                         "!= maxcpus (%u)",
+                         sockets, cores, threads, maxcpus);
+            exit(1);
+        }
+
+        ms->smp.cpus = cpus;
+        ms->smp.max_cpus = maxcpus;
+        ms->smp.sockets = sockets;
+        ms->smp.cores = cores;
+        ms->smp.threads = threads;
+    }
+
+    if (ms->smp.cpus > 1) {
+        Error *blocker = NULL;
+        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
+        replay_add_blocker(blocker);
+    }
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -2652,6 +2746,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+    mc->smp_parse = virt_smp_parse;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
diff --git a/qemu-options.hx b/qemu-options.hx
index 635dc8a624..bd97086c21 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -203,6 +203,10 @@ SRST
     computed. If any on the three values is given, the total number of
     CPUs n can be omitted. maxcpus specifies the maximum number of
     hotpluggable CPUs.
+
+    For the ARM target, at least one of cpus or maxcpus must be provided.
+    Threads will default to 1 if not provided. Sockets and cores must be
+    either both provided or both not.
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
2.19.1


