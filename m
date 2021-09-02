Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C33FECB5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 13:11:39 +0200 (CEST)
Received: from localhost ([::1]:37632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLkd8-0001Ho-AH
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 07:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkVY-0006uZ-Qm; Thu, 02 Sep 2021 07:03:48 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkVU-0003XM-Er; Thu, 02 Sep 2021 07:03:48 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H0dLg5ZzTzYrkJ;
 Thu,  2 Sep 2021 19:02:51 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 2 Sep 2021 19:03:35 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 2 Sep 2021 19:03:34 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v8 02/14] machine: Minor refactor/fix for the smp parsers
Date: Thu, 2 Sep 2021 19:03:18 +0800
Message-ID: <20210902110330.18036-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210902110330.18036-1-wangyanan55@huawei.com>
References: <20210902110330.18036-1-wangyanan55@huawei.com>
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

To pave the way for the functional improvement in later patches,
make some refactor/cleanup for the smp parsers, including using
local maxcpus instead of ms->smp.max_cpus in the calculation,
defaulting dies to 0 initially like other members, cleanup the
sanity check for dies.

We actually also fix a hidden defect by avoiding directly using
the provided *zero value* in the calculation, which could cause
a segment fault (e.g. using dies=0 in the calculation).

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/core/machine.c | 18 ++++++++++--------
 hw/i386/pc.c      | 23 ++++++++++++++---------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 711e83db54..cf9cf53911 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -752,8 +752,9 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
+    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
 
-    if (config->has_dies && config->dies != 0 && config->dies != 1) {
+    if (config->has_dies && config->dies > 1) {
         error_setg(errp, "dies not supported by this machine's CPU topology");
         return;
     }
@@ -766,8 +767,8 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
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
@@ -784,26 +785,27 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
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
index 1276bfeee4..8733c2882f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -718,9 +718,13 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
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
@@ -730,8 +734,8 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
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
@@ -748,27 +752,28 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
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


