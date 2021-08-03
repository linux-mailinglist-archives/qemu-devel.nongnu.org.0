Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C243DE7F9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:10:10 +0200 (CEST)
Received: from localhost ([::1]:34794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApV3-0001mR-0P
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mApR5-0001ig-3z
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:06:03 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mApR2-0004Ml-29
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:06:02 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gf6rJ5dxCzYkg1;
 Tue,  3 Aug 2021 16:05:52 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 3 Aug 2021 16:05:38 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 3 Aug 2021 16:05:37 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.2 v4 06/14] machine: Prefer cores over sockets in smp
 parsing since 6.2
Date: Tue, 3 Aug 2021 16:05:19 +0800
Message-ID: <20210803080527.156556-7-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210803080527.156556-1-wangyanan55@huawei.com>
References: <20210803080527.156556-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
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

Reviewed-by: Andrew Jones <drjones@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c              |  1 +
 hw/core/machine.c          | 36 ++++++++++++++++++++++++++----------
 hw/i386/pc.c               | 36 ++++++++++++++++++++++++++----------
 hw/i386/pc_piix.c          |  1 +
 hw/i386/pc_q35.c           |  1 +
 hw/ppc/spapr.c             |  1 +
 hw/s390x/s390-virtio-ccw.c |  1 +
 include/hw/boards.h        |  1 +
 qemu-options.hx            |  3 ++-
 9 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 01165f7f53..7babea40dc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2797,6 +2797,7 @@ static void virt_machine_6_1_options(MachineClass *mc)
 {
     virt_machine_6_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    mc->smp_prefer_sockets = true;
 }
 DEFINE_VIRT_MACHINE(6, 1)
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 458d9736e3..a8173a0f45 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -746,6 +746,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
 
 static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
@@ -757,7 +758,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         return;
     }
 
-    /* compute missing values, prefer sockets over cores over threads */
+    /* compute missing values based on the provided ones */
     if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
@@ -765,15 +766,30 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
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
-            threads = maxcpus / (sockets * cores);
+        if (mc->smp_prefer_sockets) {
+            /* prefer sockets over cores over threads before 6.2 */
+            if (sockets == 0) {
+                cores = cores > 0 ? cores : 1;
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (cores * threads);
+            } else if (cores == 0) {
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * threads);
+            } else if (threads == 0) {
+                threads = maxcpus / (sockets * cores);
+            }
+        } else {
+            /* prefer cores over sockets over threads since 6.2 */
+            if (cores == 0) {
+                sockets = sockets > 0 ? sockets : 1;
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * threads);
+            } else if (sockets == 0) {
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (cores * threads);
+            } else if (threads == 0) {
+                threads = maxcpus / (sockets * cores);
+            }
         }
     }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index afd8b9c283..5d7c3efc43 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -717,6 +717,7 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
  */
 static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned dies    = config->has_dies ? config->dies : 0;
@@ -727,7 +728,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     /* directly default dies to 1 if it's omitted */
     dies = dies > 0 ? dies : 1;
 
-    /* compute missing values, prefer sockets over cores over threads */
+    /* compute missing values based on the provided ones */
     if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
@@ -735,15 +736,30 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
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
-            threads = maxcpus / (sockets * dies * cores);
+        if (mc->smp_prefer_sockets) {
+            /* prefer sockets over cores over threads before 6.2 */
+            if (sockets == 0) {
+                cores = cores > 0 ? cores : 1;
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (dies * cores * threads);
+            } else if (cores == 0) {
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * dies * threads);
+            } else if (threads == 0) {
+                threads = maxcpus / (sockets * dies * cores);
+            }
+        } else {
+            /* prefer cores over sockets over threads since 6.2 */
+            if (cores == 0) {
+                sockets = sockets > 0 ? sockets : 1;
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * dies * threads);
+            } else if (sockets == 0) {
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (dies * cores * threads);
+            } else if (threads == 0) {
+                threads = maxcpus / (sockets * dies * cores);
+            }
         }
     }
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index fd5c2277f2..9b811fc6ca 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -432,6 +432,7 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
     m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
+    m->smp_prefer_sockets = true;
 }
 
 DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index b45903b15e..88efb7fde4 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -372,6 +372,7 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
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
index 4d25278cf2..b40e647883 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -809,6 +809,7 @@ static void ccw_machine_6_1_class_options(MachineClass *mc)
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
index 06f819177e..451d2cd817 100644
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
2.19.1


