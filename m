Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C9E3CCC9E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 05:25:40 +0200 (CEST)
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5JuV-0002Tk-GD
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 23:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m5JqN-0007MM-TR
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:21:23 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m5JqL-0006L5-RK
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:21:23 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GSn923jLwzZqm5;
 Mon, 19 Jul 2021 11:17:58 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 11:20:53 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 11:20:52 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.2 v2 05/11] machine: Improve the error reporting of smp
 parsing
Date: Mon, 19 Jul 2021 11:20:37 +0800
Message-ID: <20210719032043.25416-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210719032043.25416-1-wangyanan55@huawei.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 yuzenghui@huawei.com, Igor
 Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We totally have two requirements for a valid SMP configuration:
the sum of "sockets * dies * cores * threads" must represent all
the possible cpus, i.e., max_cpus, and must include the initial
present cpus, i.e., smp_cpus.

We only need to ensure "sockets * dies * cores * threads == maxcpus"
at first and then ensure "sockets * dies * cores * threads >= cpus".
With a reasonable order of the sanity-check, we can simplify the
error reporting code.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 668f0a1553..8b4d07d3fc 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -788,21 +788,6 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     cpus = cpus > 0 ? cpus : sockets * dies * cores * threads;
     maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-    if (sockets * dies * cores * threads < cpus) {
-        g_autofree char *dies_msg = g_strdup_printf(
-            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
-        error_setg(errp, "cpu topology: "
-                   "sockets (%u)%s * cores (%u) * threads (%u) < "
-                   "smp_cpus (%u)",
-                   sockets, dies_msg, cores, threads, cpus);
-        return;
-    }
-
-    if (maxcpus < cpus) {
-        error_setg(errp, "maxcpus must be equal to or greater than smp");
-        return;
-    }
-
     if (sockets * dies * cores * threads != maxcpus) {
         g_autofree char *dies_msg = g_strdup_printf(
             mc->smp_dies_supported ? " * dies (%u)" : "", dies);
@@ -814,6 +799,16 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         return;
     }
 
+    if (sockets * dies * cores * threads < cpus) {
+        g_autofree char *dies_msg = g_strdup_printf(
+            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
+        error_setg(errp, "Invalid CPU topology: "
+                   "sockets (%u)%s * cores (%u) * threads (%u) < "
+                   "smp_cpus (%u)",
+                   sockets, dies_msg, cores, threads, cpus);
+        return;
+    }
+
     ms->smp.cpus = cpus;
     ms->smp.sockets = sockets;
     ms->smp.dies = dies;
-- 
2.19.1


