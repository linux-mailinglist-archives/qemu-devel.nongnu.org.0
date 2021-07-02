Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB59E3B9EEA
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:16:26 +0200 (CEST)
Received: from localhost ([::1]:50372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGDh-0005aD-FA
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lzG5f-0005Hd-GN
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:08:09 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lzG5b-0003VK-Q0
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:08:07 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GGVz42LWkz74fp;
 Fri,  2 Jul 2021 18:03:44 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 18:07:44 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 18:07:43 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 1/6] machine: Set the value of maxcpus to match cpus if
 specified as zero
Date: Fri, 2 Jul 2021 18:07:34 +0800
Message-ID: <20210702100739.13672-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210702100739.13672-1-wangyanan55@huawei.com>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Yanan Wang <wangyanan55@huawei.com>, Igor
 Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is currently allowed to explicitly specified the topology parameters
as 0 in the -smp cmdlines, such as -smp cpus=8,maxcpus=0,sockets=0. And
for the values of cpus/sockets/cores/threads, we always determine that
they are ommited if either set to 0 in the cmdline(e.g. sockets=0) or
just not explicitly specified, then we compute the ommited values.

We probably should also treat "maxcpus=0" as ommited and then set the
value to match smp cpus. This makes cmdlines like "-smp 8, maxcpus=0"
start to work as "-smp 8,maxcpus=8,sockets=8,cores=1,threads=1".

Note that this patch won't affect any existing working cmdlines, but
will allow configuration like "-smp cpus=n,maxcpus=0" to be valid.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine.c | 14 ++++++++------
 hw/i386/pc.c      | 14 ++++++++------
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index ffc076ae84..f17bbe3275 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -745,6 +745,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
+    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
 
     if (config->has_dies && config->dies != 0 && config->dies != 1) {
         error_setg(errp, "dies not supported by this machine's CPU topology");
@@ -758,8 +759,8 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
             sockets = sockets > 0 ? sockets : 1;
             cpus = cores * threads * sockets;
         } else {
-            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
-            sockets = ms->smp.max_cpus / (cores * threads);
+            maxcpus = maxcpus > 0 ? maxcpus : cpus;
+            sockets = maxcpus / (cores * threads);
         }
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
@@ -776,19 +777,19 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         return;
     }
 
-    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
+    maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-    if (ms->smp.max_cpus < cpus) {
+    if (maxcpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
         return;
     }
 
-    if (sockets * cores * threads != ms->smp.max_cpus) {
+    if (sockets * cores * threads != maxcpus) {
         error_setg(errp, "Invalid CPU topology: "
                    "sockets (%u) * cores (%u) * threads (%u) "
                    "!= maxcpus (%u)",
                    sockets, cores, threads,
-                   ms->smp.max_cpus);
+                   maxcpus);
         return;
     }
 
@@ -796,6 +797,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     ms->smp.cores = cores;
     ms->smp.threads = threads;
     ms->smp.sockets = sockets;
+    ms->smp.max_cpus = maxcpus;
 }
 
 static void machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8e1220db72..a9b22fdc01 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -717,6 +717,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     unsigned dies    = config->has_dies ? config->dies : 1;
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
+    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
 
     /* compute missing values, prefer sockets over cores over threads */
     if (cpus == 0 || sockets == 0) {
@@ -726,8 +727,8 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
             sockets = sockets > 0 ? sockets : 1;
             cpus = cores * threads * dies * sockets;
         } else {
-            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
-            sockets = ms->smp.max_cpus / (cores * threads * dies);
+            maxcpus = maxcpus > 0 ? maxcpus : cpus;
+            sockets = maxcpus / (dies * cores * threads);
         }
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
@@ -744,19 +745,19 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
         return;
     }
 
-    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
+    maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-    if (ms->smp.max_cpus < cpus) {
+    if (maxcpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
         return;
     }
 
-    if (sockets * dies * cores * threads != ms->smp.max_cpus) {
+    if (sockets * dies * cores * threads != maxcpus) {
         error_setg(errp, "Invalid CPU topology deprecated: "
                    "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
                    "!= maxcpus (%u)",
                    sockets, dies, cores, threads,
-                   ms->smp.max_cpus);
+                   maxcpus);
         return;
     }
 
@@ -765,6 +766,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     ms->smp.threads = threads;
     ms->smp.sockets = sockets;
     ms->smp.dies = dies;
+    ms->smp.max_cpus = maxcpus;
 }
 
 static
-- 
2.19.1


