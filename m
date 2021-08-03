Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944443DE7F4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:09:54 +0200 (CEST)
Received: from localhost ([::1]:33456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApUn-0000uE-Ko
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mApQq-0000wl-C1
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:05:48 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mApQl-00048x-KR
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:05:48 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Gf6r06F8mz1CRxJ;
 Tue,  3 Aug 2021 16:05:36 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 3 Aug 2021 16:05:41 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 3 Aug 2021 16:05:40 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.2 v4 08/14] machine: Tweak the order of topology members
 in struct CpuTopology
Date: Tue, 3 Aug 2021 16:05:21 +0800
Message-ID: <20210803080527.156556-9-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210803080527.156556-1-wangyanan55@huawei.com>
References: <20210803080527.156556-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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

Now that all the possible topology parameters are integrated in struct
CpuTopology, tweak the order of topology members to be "cpus/sockets/
dies/cores/threads/maxcpus" for readability and consistency. We also
tweak the comment by adding explanation of dies parameter.

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine.c   | 8 ++++----
 include/hw/boards.h | 7 ++++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index e13a8f2f34..46eaf522ee 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -826,11 +826,11 @@ static void machine_get_smp(Object *obj, Visitor *v, const char *name,
 {
     MachineState *ms = MACHINE(obj);
     SMPConfiguration *config = &(SMPConfiguration){
-        .has_cores = true, .cores = ms->smp.cores,
+        .has_cpus = true, .cpus = ms->smp.cpus,
         .has_sockets = true, .sockets = ms->smp.sockets,
         .has_dies = true, .dies = ms->smp.dies,
+        .has_cores = true, .cores = ms->smp.cores,
         .has_threads = true, .threads = ms->smp.threads,
-        .has_cpus = true, .cpus = ms->smp.cpus,
         .has_maxcpus = true, .maxcpus = ms->smp.max_cpus,
     };
     if (!visit_type_SMPConfiguration(v, name, &config, &error_abort)) {
@@ -1057,10 +1057,10 @@ static void machine_initfn(Object *obj)
     /* default to mc->default_cpus */
     ms->smp.cpus = mc->default_cpus;
     ms->smp.max_cpus = mc->default_cpus;
-    ms->smp.cores = 1;
+    ms->smp.sockets = 1;
     ms->smp.dies = 1;
+    ms->smp.cores = 1;
     ms->smp.threads = 1;
-    ms->smp.sockets = 1;
 }
 
 static void machine_finalize(Object *obj)
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 2ae039b74f..2a1bba86c0 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -275,17 +275,18 @@ typedef struct DeviceMemoryState {
 /**
  * CpuTopology:
  * @cpus: the number of present logical processors on the machine
- * @cores: the number of cores in one package
- * @threads: the number of threads in one core
  * @sockets: the number of sockets on the machine
+ * @dies: the number of dies in one socket
+ * @cores: the number of cores in one die
+ * @threads: the number of threads in one core
  * @max_cpus: the maximum number of logical processors on the machine
  */
 typedef struct CpuTopology {
     unsigned int cpus;
+    unsigned int sockets;
     unsigned int dies;
     unsigned int cores;
     unsigned int threads;
-    unsigned int sockets;
     unsigned int max_cpus;
 } CpuTopology;
 
-- 
2.19.1


