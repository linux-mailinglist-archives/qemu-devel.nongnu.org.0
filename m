Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18CE4067C2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 09:36:02 +0200 (CEST)
Received: from localhost ([::1]:51870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOb4r-00066u-Vf
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 03:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazn-0004rL-4a; Fri, 10 Sep 2021 03:30:47 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazk-0000qB-6q; Fri, 10 Sep 2021 03:30:46 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H5SF54ZM3zVrcY;
 Fri, 10 Sep 2021 15:29:45 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:39 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:38 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v9 08/16] machine: Prefer cores over sockets in smp parsing
 since 6.2
Date: Fri, 10 Sep 2021 15:30:17 +0800
Message-ID: <20210910073025.16480-9-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210910073025.16480-1-wangyanan55@huawei.com>
References: <20210910073025.16480-1-wangyanan55@huawei.com>
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

In the real SMP hardware topology world, it's much more likely that
we have high cores-per-socket counts and few sockets totally. While
the current preference of sockets over cores in smp parsing results
in a virtual cpu topology with low cores-per-sockets counts and a
large number of sockets, which is just contrary to the real world.

Given that it is better to make the virtual cpu topology be more
reflective of the real world and also for the sake of compatibility,
we start to prefer cores over sockets over threads in smp parsing
since machine type 6.2 for different arches.

In this patch, a boolean "smp_prefer_sockets" is added, and we only
enable the old preference on older machines and enable the new one
since type 6.2 for all arches by using the machine compat mechanism.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
---
 hw/arm/virt.c              |  1 +
 hw/core/machine.c          | 35 ++++++++++++++++++++++++++---------
 hw/i386/pc.c               | 35 ++++++++++++++++++++++++++---------
 hw/i386/pc_piix.c          |  1 +
 hw/i386/pc_q35.c           |  1 +
 hw/ppc/spapr.c             |  1 +
 hw/s390x/s390-virtio-ccw.c |  1 +
 include/hw/boards.h        |  1 +
 qemu-options.hx            |  3 ++-
 9 files changed, 60 insertions(+), 19 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 73e9c6bb7c..ad244f0ff1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2793,6 +2793,7 @@ static void virt_machine_6_1_options(MachineClass *mc)
 {
     virt_machine_6_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    mc->smp_prefer_sockets = true;
 }
 DEFINE_VIRT_MACHINE(6, 1)
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index f1b30b3101..0df597f99c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -748,6 +748,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
 
 static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
@@ -759,7 +760,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         return;
     }
 
-    /* compute missing values, prefer sockets over cores over threads */
+    /* compute missing values based on the provided ones */
     if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
@@ -767,14 +768,30 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     } else {
         maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-        if (sockets == 0) {
-            cores = cores > 0 ? cores : 1;
-            threads = threads > 0 ? threads : 1;
-            sockets = maxcpus / (cores * threads);
-        } else if (cores == 0) {
-            threads = threads > 0 ? threads : 1;
-            cores = maxcpus / (sockets * threads);
-        } else if (threads == 0) {
+        if (mc->smp_prefer_sockets) {
+            /* prefer sockets over cores before 6.2 */
+            if (sockets == 0) {
+                cores = cores > 0 ? cores : 1;
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (cores * threads);
+            } else if (cores == 0) {
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * threads);
+            }
+        } else {
+            /* prefer cores over sockets since 6.2 */
+            if (cores == 0) {
+                sockets = sockets > 0 ? sockets : 1;
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * threads);
+            } else if (sockets == 0) {
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (cores * threads);
+            }
+        }
+
+        /* try to calculate omitted threads at last */
+        if (threads == 0) {
             threads = maxcpus / (sockets * cores);
         }
     }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f08eb4fc3b..2bcf297787 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -716,6 +716,7 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
  */
 static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned dies    = config->has_dies ? config->dies : 0;
@@ -726,7 +727,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     /* directly default dies to 1 if it's omitted */
     dies = dies > 0 ? dies : 1;
 
-    /* compute missing values, prefer sockets over cores over threads */
+    /* compute missing values based on the provided ones */
     if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
@@ -734,14 +735,30 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     } else {
         maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-        if (sockets == 0) {
-            cores = cores > 0 ? cores : 1;
-            threads = threads > 0 ? threads : 1;
-            sockets = maxcpus / (dies * cores * threads);
-        } else if (cores == 0) {
-            threads = threads > 0 ? threads : 1;
-            cores = maxcpus / (sockets * dies * threads);
-        } else if (threads == 0) {
+        if (mc->smp_prefer_sockets) {
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
             threads = maxcpus / (sockets * dies * cores);
         }
     }
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c5da7739ce..077644ee9c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -431,6 +431,7 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
     m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
+    m->smp_prefer_sockets = true;
 }
 
 DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 46cd542d17..2d97c0ab3e 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -371,6 +371,7 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
     m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
+    m->smp_prefer_sockets = true;
 }
 
 DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d39fd4e644..a481fade51 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4702,6 +4702,7 @@ static void spapr_machine_6_1_class_options(MachineClass *mc)
 {
     spapr_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    mc->smp_prefer_sockets = true;
 }
 
 DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 61aeccb163..5401c985cf 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -814,6 +814,7 @@ static void ccw_machine_6_1_class_options(MachineClass *mc)
 {
     ccw_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    mc->smp_prefer_sockets = true;
 }
 DEFINE_CCW_MACHINE(6_1, "6.1", false);
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 463a5514f9..2ae039b74f 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -247,6 +247,7 @@ struct MachineClass {
     bool nvdimm_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
+    bool smp_prefer_sockets;
     const char *default_ram_id;
 
     HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
diff --git a/qemu-options.hx b/qemu-options.hx
index 9d71a661bb..5c1b0311c0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -238,7 +238,8 @@ SRST
     Historically preference was given to the coarsest topology parameters
     when computing missing values (ie sockets preferred over cores, which
     were preferred over threads), however, this behaviour is considered
-    liable to change.
+    liable to change. Prior to 6.2 the preference was sockets over cores
+    over threads. Since 6.2 the preference is cores over sockets over threads.
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
2.23.0


