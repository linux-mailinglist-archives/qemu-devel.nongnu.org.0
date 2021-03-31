Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AFD34FD92
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 11:58:20 +0200 (CEST)
Received: from localhost ([::1]:40754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXcB-0006J8-RB
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 05:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXYL-0002lr-T0; Wed, 31 Mar 2021 05:54:21 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXY7-0002aw-2M; Wed, 31 Mar 2021 05:54:21 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9M6M1MGlz1BFy9;
 Wed, 31 Mar 2021 17:51:55 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 17:53:51 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH 4/6] hw/i386/pc: Parse cluster cpu topology for PC machines
Date: Wed, 31 Mar 2021 17:53:41 +0800
Message-ID: <20210331095343.12172-5-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210331095343.12172-1-wangyanan55@huawei.com>
References: <20210331095343.12172-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangyanan55@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo
 Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a separate function pc_smp_parse() in hw/i386/pc.c used
to parse cpu topology for the PC machines. And there are some x86
implementations that have a similar concept of cluster, for example,
on Jacobsville there are 6 clusters of 4 Atom cores, each cluster
sharing a separate L2 cache, and 24 cores sharing L3 cache.
So parse cluster cpu topology the for PC machines, then guest kernel
will take advantages of it for better scheduling performance.

In pc_smp_parse(), the computing logic of missing values prefers
sockets over cores over threads. And the value of clusters will be
set as default 1 if not explictly specified, so that it will not
impact the parsing results of machines that won't specify "clusters="
in -smp command line because they just don't support it.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/i386/pc.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8aa85dec54..f2906f9185 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -716,33 +716,39 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
         unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
         unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
         unsigned dies = qemu_opt_get_number(opts, "dies", 1);
+        unsigned clusters = qemu_opt_get_number(opts, "clusters", 1);
         unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
         unsigned threads = qemu_opt_get_number(opts, "threads", 0);
 
-        /* compute missing values, prefer sockets over cores over threads */
+        /*
+         * Compute missing values, prefer sockets over cores
+         * over threads. And the value of dies or clusters has
+         * been set as default 1 if not explicitly specified.
+         */
         if (cpus == 0 || sockets == 0) {
             cores = cores > 0 ? cores : 1;
             threads = threads > 0 ? threads : 1;
             if (cpus == 0) {
                 sockets = sockets > 0 ? sockets : 1;
-                cpus = cores * threads * dies * sockets;
+                cpus = sockets * dies * clusters * cores * threads;
             } else {
                 ms->smp.max_cpus =
                         qemu_opt_get_number(opts, "maxcpus", cpus);
-                sockets = ms->smp.max_cpus / (cores * threads * dies);
+                sockets = ms->smp.max_cpus /
+                          (dies * clusters * cores * threads);
             }
         } else if (cores == 0) {
             threads = threads > 0 ? threads : 1;
-            cores = cpus / (sockets * dies * threads);
+            cores = cpus / (sockets * dies * clusters * threads);
             cores = cores > 0 ? cores : 1;
         } else if (threads == 0) {
-            threads = cpus / (cores * dies * sockets);
+            threads = cpus / (sockets * dies * clusters * cores);
             threads = threads > 0 ? threads : 1;
-        } else if (sockets * dies * cores * threads < cpus) {
+        } else if (sockets * dies * clusters * cores * threads < cpus) {
             error_report("cpu topology: "
-                         "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
-                         "smp_cpus (%u)",
-                         sockets, dies, cores, threads, cpus);
+                         "sockets (%u) * dies (%u) * clusters (%u) * "
+                         "cores (%u) * threads (%u) < smp_cpus (%u)",
+                         sockets, dies, clusters, cores, threads, cpus);
             exit(1);
         }
 
@@ -756,14 +762,15 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
 
         if (sockets * dies * cores * threads != ms->smp.max_cpus) {
             error_report("Invalid CPU topology deprecated: "
-                         "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                         "!= maxcpus (%u)",
-                         sockets, dies, cores, threads,
+                         "sockets (%u) * dies (%u) * clusters (%u) * "
+                         "cores (%u) * threads (%u) != maxcpus (%u)",
+                         sockets, dies, clusters, cores, threads,
                          ms->smp.max_cpus);
             exit(1);
         }
 
         ms->smp.cpus = cpus;
+        ms->smp.clusters = clusters;
         ms->smp.cores = cores;
         ms->smp.threads = threads;
         ms->smp.sockets = sockets;
-- 
2.19.1


