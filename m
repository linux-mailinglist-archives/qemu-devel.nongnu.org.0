Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77B2381E20
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 12:39:59 +0200 (CEST)
Received: from localhost ([::1]:54492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liEBi-0006zC-UX
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 06:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE4i-0008Vv-4V; Sun, 16 May 2021 06:32:44 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE4c-0000nH-K0; Sun, 16 May 2021 06:32:43 -0400
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fjdmw4fdfzmVkX;
 Sun, 16 May 2021 18:29:52 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:32:35 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:32:35 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v3 4/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
Date: Sun, 16 May 2021 18:32:28 +0800
Message-ID: <20210516103228.37792-5-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210516103228.37792-1-wangyanan55@huawei.com>
References: <20210516103228.37792-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangyanan55@huawei.com; helo=szxga05-in.huawei.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com, yangyicong@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a separate function virt_smp_parse() in hw/virt/arm.c used
to parse cpu topology for the ARM machines. So add parsing of -smp
cluster parameter in it, then total number of logical cpus will be
calculated like: max_cpus = sockets * clusters * cores * threads.

Note, we will assume multi-cluster in one socket is not supported
and default the value of clusters to 1, if it's not explicitly
specified in -smp cmdline.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7de822e491..678d5ef36c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2642,8 +2642,8 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
  * with the -smp cmdlines when parsing them.
  *
  * We require that at least one of cpus or maxcpus must be provided.
- * Threads will default to 1 if not provided. Sockets and cores must
- * be either both provided or both not.
+ * Clusters and threads will default to 1 if they are not provided.
+ * Sockets and cores must be either both provided or both not.
  *
  * Note, if neither sockets nor cores are specified, we will calculate
  * all the missing values just like smp_parse() does, but will disable
@@ -2652,15 +2652,18 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
 static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(ms);
+    VirtMachineState *vms = VIRT_MACHINE(ms);
 
     if (opts) {
         unsigned cpus = qemu_opt_get_number(opts, "cpus", 0);
         unsigned maxcpus = qemu_opt_get_number(opts, "maxcpus", 0);
         unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
+        unsigned clusters = qemu_opt_get_number(opts, "clusters", 0);
         unsigned cores = qemu_opt_get_number(opts, "cores", 0);
         unsigned threads = qemu_opt_get_number(opts, "threads", 0);
 
-        /* Default threads to 1 if not provided */
+        /* Default clusters and threads to 1 if not provided */
+        clusters = clusters > 0 ? clusters : 1;
         threads = threads > 0 ? threads : 1;
 
         if (cpus == 0 && maxcpus == 0) {
@@ -2676,13 +2679,13 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
             cores = 1;
             if (cpus == 0) {
                 sockets = 1;
-                cpus = sockets * cores * threads;
+                cpus = sockets * clusters * cores * threads;
             } else {
                 maxcpus = maxcpus > 0 ? maxcpus : cpus;
-                sockets = maxcpus / (cores * threads);
+                sockets = maxcpus / (clusters * cores * threads);
             }
         } else if (sockets > 0 && cores > 0) {
-            cpus = cpus > 0 ? cpus : sockets * cores * threads;
+            cpus = cpus > 0 ? cpus : sockets * clusters * cores * threads;
             maxcpus = maxcpus > 0 ? maxcpus : cpus;
         } else {
             error_report("sockets and cores must be both provided "
@@ -2695,25 +2698,26 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
             exit(1);
         }
 
-        if (sockets * cores * threads < cpus) {
+        if (sockets * clusters * cores * threads < cpus) {
             error_report("cpu topology: "
-                         "sockets (%u) * cores (%u) * threads (%u) < "
-                         "smp_cpus (%u)",
-                         sockets, cores, threads, cpus);
+                         "sockets (%u) * clusters (%u) * cores (%u) * "
+                         "threads (%u) < smp_cpus (%u)",
+                         sockets, clusters, cores, threads, cpus);
             exit(1);
         }
 
-        if (sockets * cores * threads != maxcpus) {
+        if (sockets * clusters * cores * threads != maxcpus) {
             error_report("cpu topology: "
-                         "sockets (%u) * cores (%u) * threads (%u) "
-                         "!= maxcpus (%u)",
-                         sockets, cores, threads, maxcpus);
+                         "sockets (%u) * clusters (%u) * cores (%u) * "
+                         "threads (%u) != maxcpus (%u)",
+                         sockets, clusters, cores, threads, maxcpus);
             exit(1);
         }
 
         ms->smp.cpus = cpus;
         ms->smp.max_cpus = maxcpus;
         ms->smp.sockets = sockets;
+        vms->smp_clusters = clusters;
         ms->smp.cores = cores;
         ms->smp.threads = threads;
     }
-- 
2.19.1


