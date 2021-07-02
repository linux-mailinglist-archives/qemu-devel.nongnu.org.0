Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA663B9EE2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:12:26 +0200 (CEST)
Received: from localhost ([::1]:36116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzG9p-0004Gy-Q3
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lzG5e-0005Hb-I0
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:08:09 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lzG5b-0003VL-Sm
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:08:06 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GGVz42xGFz74gh;
 Fri,  2 Jul 2021 18:03:44 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 18:07:47 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 18:07:47 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 4/6] machine: Uniformly use maxcpus to calculate the
 missing values
Date: Fri, 2 Jul 2021 18:07:37 +0800
Message-ID: <20210702100739.13672-5-wangyanan55@huawei.com>
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

We are currently using maxcpus to calculate value of sockets but using
cpus to calculate value of cores/threads. This makes cmdlines like
"-smp 8,maxcpus=12,cores=4" work while "-smp 8,maxcpus=12,sockets=3"
break the invalid cpu topology check.

This patch allows us to uniformly use maxcpus to calculate the missing
values. Also the if branch of "cpus == 0 || sockets == 0" was splited
into branches of "cpus == 0" and "sockets == 0" so that we can clearly
figure out that we are parsing -smp cmdlines with a preference of cpus
over sockets over cores over threads.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine.c | 36 +++++++++++++++++++-----------------
 hw/i386/pc.c      | 37 +++++++++++++++++++------------------
 2 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1e194677cd..58882835be 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -752,34 +752,36 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     }
 
     /* compute missing values, prefer sockets over cores over threads */
-    if (cpus == 0 || sockets == 0) {
+    maxcpus = maxcpus > 0 ? maxcpus : cpus;
+
+    if (cpus == 0) {
+        sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
         threads = threads > 0 ? threads : 1;
-        if (cpus == 0) {
-            sockets = sockets > 0 ? sockets : 1;
-            cpus = cores * threads * sockets;
-        } else {
-            maxcpus = maxcpus > 0 ? maxcpus : cpus;
-            sockets = maxcpus / (cores * threads);
-            sockets = sockets > 0 ? sockets : 1;
-        }
+        cpus = sockets * cores * threads;
+        maxcpus = maxcpus > 0 ? maxcpus : cpus;
+    } else if (sockets == 0) {
+        cores = cores > 0 ? cores : 1;
+        threads = threads > 0 ? threads : 1;
+        sockets = maxcpus / (cores * threads);
+        sockets = sockets > 0 ? sockets : 1;
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
-        cores = cpus / (sockets * threads);
+        cores = maxcpus / (sockets * threads);
         cores = cores > 0 ? cores : 1;
     } else if (threads == 0) {
-        threads = cpus / (cores * sockets);
+        threads = maxcpus / (sockets * cores);
         threads = threads > 0 ? threads : 1;
-    } else if (sockets * cores * threads < cpus) {
+    }
+
+    if (sockets * cores * threads < cpus) {
         error_setg(errp, "cpu topology: "
-                   "sockets (%u) * cores (%u) * threads (%u) < "
-                   "smp_cpus (%u)",
+                   "sockets (%u) * cores (%u) * threads (%u) "
+                   "< smp_cpus (%u)",
                    sockets, cores, threads, cpus);
         return;
     }
 
-    maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
     if (maxcpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
         return;
@@ -795,9 +797,9 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     }
 
     ms->smp.cpus = cpus;
+    ms->smp.sockets = sockets;
     ms->smp.cores = cores;
     ms->smp.threads = threads;
-    ms->smp.sockets = sockets;
     ms->smp.max_cpus = maxcpus;
 }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 93d1f12a49..1812f33ab1 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -721,35 +721,36 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
 
     /* compute missing values, prefer sockets over cores over threads */
     dies = dies > 0 ? dies : 1;
+    maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-    if (cpus == 0 || sockets == 0) {
+    if (cpus == 0) {
+        sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
         threads = threads > 0 ? threads : 1;
-        if (cpus == 0) {
-            sockets = sockets > 0 ? sockets : 1;
-            cpus = cores * threads * dies * sockets;
-        } else {
-            maxcpus = maxcpus > 0 ? maxcpus : cpus;
-            sockets = maxcpus / (dies * cores * threads);
-            sockets = sockets > 0 ? sockets : 1;
-        }
+        cpus = sockets * dies * cores * threads;
+        maxcpus = maxcpus > 0 ? maxcpus : cpus;
+    } else if (sockets == 0) {
+        cores = cores > 0 ? cores : 1;
+        threads = threads > 0 ? threads : 1;
+        sockets = maxcpus / (dies * cores * threads);
+        sockets = sockets > 0 ? sockets : 1;
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
-        cores = cpus / (sockets * dies * threads);
+        cores = maxcpus / (sockets * dies * threads);
         cores = cores > 0 ? cores : 1;
     } else if (threads == 0) {
-        threads = cpus / (cores * dies * sockets);
+        threads = maxcpus / (sockets * dies * cores);
         threads = threads > 0 ? threads : 1;
-    } else if (sockets * dies * cores * threads < cpus) {
+    }
+
+    if (sockets * dies * cores * threads < cpus) {
         error_setg(errp, "cpu topology: "
-                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
-                   "smp_cpus (%u)",
+                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
+                   "< smp_cpus (%u)",
                    sockets, dies, cores, threads, cpus);
         return;
     }
 
-    maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
     if (maxcpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
         return;
@@ -765,10 +766,10 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     }
 
     ms->smp.cpus = cpus;
-    ms->smp.cores = cores;
-    ms->smp.threads = threads;
     ms->smp.sockets = sockets;
     ms->smp.dies = dies;
+    ms->smp.cores = cores;
+    ms->smp.threads = threads;
     ms->smp.max_cpus = maxcpus;
 }
 
-- 
2.19.1


