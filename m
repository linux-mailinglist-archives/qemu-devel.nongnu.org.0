Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27B241A63F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 06:00:03 +0200 (CEST)
Received: from localhost ([::1]:36874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV4Hi-00050S-OP
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 00:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mV4Fy-0001BI-9m; Mon, 27 Sep 2021 23:58:14 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mV4Fu-0002Gt-VD; Mon, 27 Sep 2021 23:58:13 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HJQg41t9Rz1DHML;
 Tue, 28 Sep 2021 11:56:48 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 11:58:03 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 11:58:02 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>
Subject: [PATCH v11 05/14] machine: Improve the error reporting of smp parsing
Date: Tue, 28 Sep 2021 11:57:46 +0800
Message-ID: <20210928035755.11684-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210928035755.11684-1-wangyanan55@huawei.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have two requirements for a valid SMP configuration:
the product of "sockets * cores * threads" must represent all the
possible cpus, i.e., max_cpus, and then must include the initially
present cpus, i.e., smp_cpus.

So we only need to ensure 1) "sockets * cores * threads == maxcpus"
at first and then ensure 2) "maxcpus >= cpus". With a reasonable
order of the sanity check, we can simplify the error reporting code.
When reporting an error message we also report the exact value of
each topology member to make users easily see what's going on.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
---
 hw/core/machine.c | 22 +++++++++-------------
 hw/i386/pc.c      | 24 ++++++++++--------------
 2 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index fe935cb4a3..f1b30b3101 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -782,25 +782,21 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
     cpus = cpus > 0 ? cpus : maxcpus;
 
-    if (sockets * cores * threads < cpus) {
-        error_setg(errp, "cpu topology: "
-                   "sockets (%u) * cores (%u) * threads (%u) < "
-                   "smp_cpus (%u)",
-                   sockets, cores, threads, cpus);
+    if (sockets * cores * threads != maxcpus) {
+        error_setg(errp, "Invalid CPU topology: "
+                   "product of the hierarchy must match maxcpus: "
+                   "sockets (%u) * cores (%u) * threads (%u) "
+                   "!= maxcpus (%u)",
+                   sockets, cores, threads, maxcpus);
         return;
     }
 
     if (maxcpus < cpus) {
-        error_setg(errp, "maxcpus must be equal to or greater than smp");
-        return;
-    }
-
-    if (sockets * cores * threads != maxcpus) {
         error_setg(errp, "Invalid CPU topology: "
+                   "maxcpus must be equal to or greater than smp: "
                    "sockets (%u) * cores (%u) * threads (%u) "
-                   "!= maxcpus (%u)",
-                   sockets, cores, threads,
-                   maxcpus);
+                   "== maxcpus (%u) < smp_cpus (%u)",
+                   sockets, cores, threads, maxcpus, cpus);
         return;
     }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d9382b7d57..a37eef8057 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -749,25 +749,21 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
     cpus = cpus > 0 ? cpus : maxcpus;
 
-    if (sockets * dies * cores * threads < cpus) {
-        error_setg(errp, "cpu topology: "
-                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
-                   "smp_cpus (%u)",
-                   sockets, dies, cores, threads, cpus);
+    if (sockets * dies * cores * threads != maxcpus) {
+        error_setg(errp, "Invalid CPU topology: "
+                   "product of the hierarchy must match maxcpus: "
+                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
+                   "!= maxcpus (%u)",
+                   sockets, dies, cores, threads, maxcpus);
         return;
     }
 
     if (maxcpus < cpus) {
-        error_setg(errp, "maxcpus must be equal to or greater than smp");
-        return;
-    }
-
-    if (sockets * dies * cores * threads != maxcpus) {
-        error_setg(errp, "Invalid CPU topology deprecated: "
+        error_setg(errp, "Invalid CPU topology: "
+                   "maxcpus must be equal to or greater than smp: "
                    "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                   "!= maxcpus (%u)",
-                   sockets, dies, cores, threads,
-                   maxcpus);
+                   "== maxcpus (%u) < smp_cpus (%u)",
+                   sockets, dies, cores, threads, maxcpus, cpus);
         return;
     }
 
-- 
2.19.1


