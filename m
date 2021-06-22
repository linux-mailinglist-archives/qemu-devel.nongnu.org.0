Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C45E3B006B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:36:42 +0200 (CEST)
Received: from localhost ([::1]:49182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvcpk-0005kv-Uq
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcnj-0002vN-Tn; Tue, 22 Jun 2021 05:34:35 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcnh-00030F-0G; Tue, 22 Jun 2021 05:34:35 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G8Lj649lQz71H2;
 Tue, 22 Jun 2021 17:30:18 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:24 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:23 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
Subject: [RFC PATCH v4 2/7] hw/arm/virt: Add separate -smp parsing function
 for ARM machines
Date: Tue, 22 Jun 2021 17:34:08 +0800
Message-ID: <20210622093413.13360-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210622093413.13360-1-wangyanan55@huawei.com>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Yanan Wang <wangyanan55@huawei.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com, yangyicong@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an ARM-specific -smp parsing function named virt_smp_parse.
When support for exposing cpu topology to the guest is disabled,
this function shares the same logic with smp_parse(). While when
the support is enabled, an accurate virtual cpu topology is very
important, so we require that cpus/sockets/cores/threads must be
given, while maxcpus is optional.

Given that ARM cpu hotplug is not supported yet, a configuration
with "maxcpus > cpus" is meaningless, so if exposure is turned on
we also explicitly enforce that maxcpus must be equal to smp cpus
if specified, until cpu hotplug is available.

Given that the virtual cpu topology exposure support may come
to different architectures in the future, a new structure member
"bool expose_cpu_topology" is also added to MachineState to
record whether the feature is supported & enabled.

Suggested-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c       | 113 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/boards.h |   1 +
 2 files changed, 114 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4b96f06014..f29d796f3f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -77,6 +77,8 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "qapi/qmp/qerror.h"
+#include "sysemu/replay.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -2584,6 +2586,116 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
     return fixed_ipa ? 0 : requested_pa_size;
 }
 
+/*
+ * virt_smp_parse - Parses the -smp command line for ARM machines.
+ *
+ * When support for exposing cpu topology to the guest is disabled,
+ * this function shares the same parsing logic with smp_parse().
+ * While when the exposure is enabled, an accurate virtual cpu topology
+ * is important, so we required that cpus/sockets/cores/threads must be
+ * provided, while maxcpus can be optional.
+ */
+static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
+{
+    if (opts) {
+        unsigned cpus = qemu_opt_get_number(opts, "cpus", 0);
+        unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
+        unsigned cores = qemu_opt_get_number(opts, "cores", 0);
+        unsigned threads = qemu_opt_get_number(opts, "threads", 0);
+        unsigned maxcpus = qemu_opt_get_number(opts, "maxcpus", 0);
+        bool expose = qemu_opt_get_bool(opts, "expose", false);
+
+        if (expose) {
+            if (cpus == 0) {
+                error_report("expose=on: cpus must be specified");
+                exit(1);
+            }
+            if (sockets == 0) {
+                error_report("expose=on: sockets must be specified");
+                exit(1);
+            }
+            if (cores == 0) {
+                error_report("expose=on: cores must be specified");
+                exit(1);
+            }
+            if (threads == 0) {
+                error_report("expose=on: threads must be specified");
+                exit(1);
+            }
+        } else {
+            /*
+             * An accurate cpu topology configuration is not required in this
+             * case, so we compute the missing values preferring sockets over
+             * cores over threads.
+             */
+            if (cpus == 0 || sockets == 0) {
+                cores = cores > 0 ? cores : 1;
+                threads = threads > 0 ? threads : 1;
+                if (cpus == 0) {
+                    sockets = sockets > 0 ? sockets : 1;
+                    cpus = cores * threads * sockets;
+                } else {
+                    maxcpus = maxcpus > 0 ? maxcpus : cpus;
+                    sockets = maxcpus / (cores * threads);
+                }
+            } else if (cores == 0) {
+                threads = threads > 0 ? threads : 1;
+                cores = cpus / (sockets * threads);
+                cores = cores > 0 ? cores : 1;
+            } else if (threads == 0) {
+                threads = cpus / (cores * sockets);
+                threads = threads > 0 ? threads : 1;
+            }
+        }
+
+        maxcpus = maxcpus > 0 ? maxcpus : cpus;
+
+        if (sockets * cores * threads < cpus) {
+            error_report("cpu topology: "
+                         "sockets (%u) * cores (%u) * threads (%u) < "
+                         "smp_cpus (%u)",
+                         sockets, cores, threads, cpus);
+            exit(1);
+        }
+
+        if (maxcpus < cpus) {
+            error_report("maxcpus must be equal to or greater than smp");
+            exit(1);
+        }
+
+        if (sockets * cores * threads != maxcpus) {
+            error_report("Invalid CPU topology: "
+                         "sockets (%u) * cores (%u) * threads (%u) "
+                         "!= maxcpus (%u)",
+                         sockets, cores, threads, maxcpus);
+            exit(1);
+        }
+
+        /*
+         * Given that cpu hotplug is not supported yet, require that maxcpus
+         * must be equal to smp cpus if we are going to expose cpu topology
+         * to the guest.
+         */
+        if (expose == true && maxcpus != cpus) {
+            error_report("cpu hotplug is not supported yet, maxcpus must be"
+                         "equal to smp");
+        }
+
+        ms->smp.cpus = cpus;
+        ms->smp.sockets = sockets;
+        ms->smp.cores = cores;
+        ms->smp.threads = threads;
+        ms->smp.max_cpus = maxcpus;
+        ms->expose_cpu_topology = expose;
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
@@ -2611,6 +2723,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+    mc->smp_parse = virt_smp_parse;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 3d55d2bd62..54accc810a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -332,6 +332,7 @@ struct MachineState {
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
+    bool expose_cpu_topology;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
-- 
2.23.0


