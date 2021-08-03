Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D7B3DE81B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:14:41 +0200 (CEST)
Received: from localhost ([::1]:52288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApZQ-000530-AT
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mApQs-00010H-5v
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:05:50 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mApQl-000417-QQ
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:05:49 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gf6qq2BcrzYgTd;
 Tue,  3 Aug 2021 16:05:27 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 3 Aug 2021 16:05:31 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 3 Aug 2021 16:05:31 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.2 v4 01/14] machine: Minor refactor/cleanup for the smp
 parsers
Date: Tue, 3 Aug 2021 16:05:14 +0800
Message-ID: <20210803080527.156556-2-wangyanan55@huawei.com>
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

To pave the way for the functional improvement in later patches,
make some refactor/cleanup for the smp parsers, including using
local maxcpus instead of ms->smp.max_cpus in the calculation,
defaulting dies to 0 initially like other members, cleanup the
sanity check for dies.

No functional change intended.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine.c | 19 +++++++++++--------
 hw/i386/pc.c      | 23 ++++++++++++++---------
 2 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index e1533dfc47..696d9e8e47 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -747,9 +747,11 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
+    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
 
-    if (config->has_dies && config->dies != 0 && config->dies != 1) {
+    if (config->has_dies && config->dies > 1) {
         error_setg(errp, "dies not supported by this machine's CPU topology");
+        return;
     }
 
     /* compute missing values, prefer sockets over cores over threads */
@@ -760,8 +762,8 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
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
@@ -778,26 +780,27 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
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
 
     ms->smp.cpus = cpus;
+    ms->smp.sockets = sockets;
     ms->smp.cores = cores;
     ms->smp.threads = threads;
-    ms->smp.sockets = sockets;
+    ms->smp.max_cpus = maxcpus;
 }
 
 static void machine_get_smp(Object *obj, Visitor *v, const char *name,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c2b9d62a35..acd31af452 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -716,9 +716,13 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
 {
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
-    unsigned dies    = config->has_dies ? config->dies : 1;
+    unsigned dies    = config->has_dies ? config->dies : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
+    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
+
+    /* directly default dies to 1 if it's omitted */
+    dies = dies > 0 ? dies : 1;
 
     /* compute missing values, prefer sockets over cores over threads */
     if (cpus == 0 || sockets == 0) {
@@ -728,8 +732,8 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
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
@@ -746,27 +750,28 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
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
 
     ms->smp.cpus = cpus;
-    ms->smp.cores = cores;
-    ms->smp.threads = threads;
     ms->smp.sockets = sockets;
     ms->smp.dies = dies;
+    ms->smp.cores = cores;
+    ms->smp.threads = threads;
+    ms->smp.maxcpus = maxcpus;
 }
 
 static
-- 
2.19.1


