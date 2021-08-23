Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFE53F4AB4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 14:35:03 +0200 (CEST)
Received: from localhost ([::1]:41342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI9AL-0004iF-Sf
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 08:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mI93s-0004qg-Dz
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 08:28:21 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mI93p-0004vE-Hy
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 08:28:20 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GtWjX6G3qz88Jl;
 Mon, 23 Aug 2021 20:28:00 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 23 Aug 2021 20:28:13 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 23 Aug 2021 20:28:12 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v7 03/15] machine: Uniformly use maxcpus to calculate the
 omitted parameters
Date: Mon, 23 Aug 2021 20:27:52 +0800
Message-ID: <20210823122804.7692-4-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210823122804.7692-1-wangyanan55@huawei.com>
References: <20210823122804.7692-1-wangyanan55@huawei.com>
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are currently using maxcpus to calculate the omitted sockets
but using cpus to calculate the omitted cores/threads. This makes
cmdlines like:
  -smp cpus=8,maxcpus=16
  -smp cpus=8,cores=4,maxcpus=16
  -smp cpus=8,threads=2,maxcpus=16
work fine but the ones like:
  -smp cpus=8,sockets=2,maxcpus=16
  -smp cpus=8,sockets=2,cores=4,maxcpus=16
  -smp cpus=8,sockets=2,threads=2,maxcpus=16
break the sanity check.

Since we require for a valid config that the product of "sockets * cores
* threads" should equal to the maxcpus, we should uniformly use maxcpus
to calculate their omitted values.

Also the if-branch of "cpus == 0 || sockets == 0" was split into two
branches of "cpus == 0" and "sockets == 0" so that we can clearly read
that we are parsing the configuration with a preference on cpus over
sockets over cores over threads.

Note: change in this patch won't affect any existing working cmdlines
but improves consistency and allows more incomplete configs to be valid.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
---
 hw/core/machine.c | 30 +++++++++++++++---------------
 hw/i386/pc.c      | 30 +++++++++++++++---------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index bcced1e1c4..dc12b5ec4e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -757,24 +757,26 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
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
-        }
+        cpus = sockets * cores * threads;
+        maxcpus = maxcpus > 0 ? maxcpus : cpus;
+    } else if (sockets == 0) {
+        cores = cores > 0 ? cores : 1;
+        threads = threads > 0 ? threads : 1;
+        sockets = maxcpus / (cores * threads);
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
-        cores = cpus / (sockets * threads);
-        cores = cores > 0 ? cores : 1;
+        cores = maxcpus / (sockets * threads);
     } else if (threads == 0) {
-        threads = cpus / (cores * sockets);
-        threads = threads > 0 ? threads : 1;
-    } else if (sockets * cores * threads < cpus) {
+        threads = maxcpus / (sockets * cores);
+    }
+
+    if (sockets * cores * threads < cpus) {
         error_setg(errp, "cpu topology: "
                    "sockets (%u) * cores (%u) * threads (%u) < "
                    "smp_cpus (%u)",
@@ -782,8 +784,6 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         return;
     }
 
-    maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
     if (maxcpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
         return;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index acd31af452..a9ff9ef52c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -725,24 +725,26 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     dies = dies > 0 ? dies : 1;
 
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
-            cpus = cores * threads * dies * sockets;
-        } else {
-            maxcpus = maxcpus > 0 ? maxcpus : cpus;
-            sockets = maxcpus / (dies * cores * threads);
-        }
+        cpus = sockets * dies * cores * threads;
+        maxcpus = maxcpus > 0 ? maxcpus : cpus;
+    } else if (sockets == 0) {
+        cores = cores > 0 ? cores : 1;
+        threads = threads > 0 ? threads : 1;
+        sockets = maxcpus / (dies * cores * threads);
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
-        cores = cpus / (sockets * dies * threads);
-        cores = cores > 0 ? cores : 1;
+        cores = maxcpus / (sockets * dies * threads);
     } else if (threads == 0) {
-        threads = cpus / (cores * dies * sockets);
-        threads = threads > 0 ? threads : 1;
-    } else if (sockets * dies * cores * threads < cpus) {
+        threads = maxcpus / (sockets * dies * cores);
+    }
+
+    if (sockets * dies * cores * threads < cpus) {
         error_setg(errp, "cpu topology: "
                    "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
                    "smp_cpus (%u)",
@@ -750,8 +752,6 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
         return;
     }
 
-    maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
     if (maxcpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
         return;
-- 
2.19.1


