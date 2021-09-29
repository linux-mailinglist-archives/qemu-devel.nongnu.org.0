Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1918C41BD1B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 05:10:55 +0200 (CEST)
Received: from localhost ([::1]:45730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVPzi-0000Wl-3V
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 23:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVPo8-0005cX-1e; Tue, 28 Sep 2021 22:58:56 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVPo4-00063y-HA; Tue, 28 Sep 2021 22:58:55 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HK1Jg6Wk5z8tTv;
 Wed, 29 Sep 2021 10:57:55 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 10:58:34 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 10:58:33 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>
Subject: [PATCH v12 05/16] machine: Set the value of cpus to match maxcpus if
 it's omitted
Date: Wed, 29 Sep 2021 10:58:05 +0800
Message-ID: <20210929025816.21076-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210929025816.21076-1-wangyanan55@huawei.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we directly calculate the omitted cpus based on the given
incomplete collection of parameters. This makes some cmdlines like:
  -smp maxcpus=16
  -smp sockets=2,maxcpus=16
  -smp sockets=2,dies=2,maxcpus=16
  -smp sockets=2,cores=4,maxcpus=16
not work. We should probably set the value of cpus to match maxcpus
if it's omitted, which will make above configs start to work.

So the calculation logic of cpus/maxcpus after this patch will be:
When both maxcpus and cpus are omitted, maxcpus will be calculated
from the given parameters and cpus will be set equal to maxcpus.
When only one of maxcpus and cpus is given then the omitted one
will be set to its counterpart's value. Both maxcpus and cpus may
be specified, but maxcpus must be equal to or greater than cpus.

Note: change in this patch won't affect any existing working cmdlines
but allows more incomplete configs to be valid.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/machine.c | 29 ++++++++++++++++-------------
 hw/i386/pc.c      | 29 ++++++++++++++++-------------
 qemu-options.hx   | 11 ++++++++---
 3 files changed, 40 insertions(+), 29 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 596e758133..d8f458db60 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -760,25 +760,28 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     }
 
     /* compute missing values, prefer sockets over cores over threads */
-    maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
-    if (cpus == 0) {
+    if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
         threads = threads > 0 ? threads : 1;
-        cpus = sockets * cores * threads;
+    } else {
         maxcpus = maxcpus > 0 ? maxcpus : cpus;
-    } else if (sockets == 0) {
-        cores = cores > 0 ? cores : 1;
-        threads = threads > 0 ? threads : 1;
-        sockets = maxcpus / (cores * threads);
-    } else if (cores == 0) {
-        threads = threads > 0 ? threads : 1;
-        cores = maxcpus / (sockets * threads);
-    } else if (threads == 0) {
-        threads = maxcpus / (sockets * cores);
+
+        if (sockets == 0) {
+            cores = cores > 0 ? cores : 1;
+            threads = threads > 0 ? threads : 1;
+            sockets = maxcpus / (cores * threads);
+        } else if (cores == 0) {
+            threads = threads > 0 ? threads : 1;
+            cores = maxcpus / (sockets * threads);
+        } else if (threads == 0) {
+            threads = maxcpus / (sockets * cores);
+        }
     }
 
+    maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
+    cpus = cpus > 0 ? cpus : maxcpus;
+
     if (sockets * cores * threads < cpus) {
         error_setg(errp, "cpu topology: "
                    "sockets (%u) * cores (%u) * threads (%u) < "
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 87c06d3991..d9382b7d57 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -727,25 +727,28 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     dies = dies > 0 ? dies : 1;
 
     /* compute missing values, prefer sockets over cores over threads */
-    maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
-    if (cpus == 0) {
+    if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
         threads = threads > 0 ? threads : 1;
-        cpus = sockets * dies * cores * threads;
+    } else {
         maxcpus = maxcpus > 0 ? maxcpus : cpus;
-    } else if (sockets == 0) {
-        cores = cores > 0 ? cores : 1;
-        threads = threads > 0 ? threads : 1;
-        sockets = maxcpus / (dies * cores * threads);
-    } else if (cores == 0) {
-        threads = threads > 0 ? threads : 1;
-        cores = maxcpus / (sockets * dies * threads);
-    } else if (threads == 0) {
-        threads = maxcpus / (sockets * dies * cores);
+
+        if (sockets == 0) {
+            cores = cores > 0 ? cores : 1;
+            threads = threads > 0 ? threads : 1;
+            sockets = maxcpus / (dies * cores * threads);
+        } else if (cores == 0) {
+            threads = threads > 0 ? threads : 1;
+            cores = maxcpus / (sockets * dies * threads);
+        } else if (threads == 0) {
+            threads = maxcpus / (sockets * dies * cores);
+        }
     }
 
+    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
+    cpus = cpus > 0 ? cpus : maxcpus;
+
     if (sockets * dies * cores * threads < cpus) {
         error_setg(errp, "cpu topology: "
                    "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
diff --git a/qemu-options.hx b/qemu-options.hx
index 91d859aa29..9d71a661bb 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -214,9 +214,14 @@ SRST
     Simulate a SMP system with '\ ``n``\ ' CPUs initially present on
     the machine type board. On boards supporting CPU hotplug, the optional
     '\ ``maxcpus``\ ' parameter can be set to enable further CPUs to be
-    added at runtime. If omitted the maximum number of CPUs will be
-    set to match the initial CPU count. Both parameters are subject to
-    an upper limit that is determined by the specific machine type chosen.
+    added at runtime. When both parameters are omitted, the maximum number
+    of CPUs will be calculated from the provided topology members and the
+    initial CPU count will match the maximum number. When only one of them
+    is given then the omitted one will be set to its counterpart's value.
+    Both parameters may be specified, but the maximum number of CPUs must
+    be equal to or greater than the initial CPU count. Both parameters are
+    subject to an upper limit that is determined by the specific machine
+    type chosen.
 
     To control reporting of CPU topology information, the number of sockets,
     dies per socket, cores per die, and threads per core can be specified.
-- 
2.19.1


