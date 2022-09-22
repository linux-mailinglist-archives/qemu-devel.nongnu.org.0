Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56855E6586
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:29:35 +0200 (CEST)
Received: from localhost ([::1]:50202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNCn-0005C5-PN
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1obM26-0005Te-8n
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:14:26 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:3878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1obM23-0001Fy-Kx
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:14:26 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MYFxg5F96z14S3x;
 Thu, 22 Sep 2022 21:09:59 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 21:14:07 +0800
To: <mst@redhat.com>, <imammedo@redhat.com>, <ani@anisinha.ca>,
 <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <f4bug@amsat.org>,
 <wangyanan55@huawei.com>, <qemu-devel@nongnu.org>
CC: <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
 <yangyicong@hisilicon.com>, <prime.zeng@huawei.com>,
 <hesham.almatary@huawei.com>, <ionela.voinescu@arm.com>,
 <darren@os.amperecomputing.com>
Subject: [PATCH 1/4] hw/acpi/aml-build: Only generate cluster node in PPTT
 when specified
Date: Thu, 22 Sep 2022 21:11:40 +0800
Message-ID: <20220922131143.58003-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220922131143.58003-1-yangyicong@huawei.com>
References: <20220922131143.58003-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=yangyicong@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-devel@nongnu.org>

From: Yicong Yang <yangyicong@hisilicon.com>

Currently we'll always generate a cluster node no matter user has
specified '-smp clusters=X' or not. Cluster is an optional level
and it's unncessary to build it if user don't need. So only generate
it when user specify explicitly.

Also update the test ACPI tables.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 hw/acpi/aml-build.c   | 2 +-
 hw/core/machine-smp.c | 3 +++
 include/hw/boards.h   | 2 ++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index e6bfac95c7..aab73af66d 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2030,7 +2030,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 0, socket_id, NULL, 0);
         }
 
-        if (mc->smp_props.clusters_supported) {
+        if (mc->smp_props.clusters_supported && ms->smp.build_cluster) {
             if (cpus->cpus[n].props.cluster_id != cluster_id) {
                 assert(cpus->cpus[n].props.cluster_id > cluster_id);
                 cluster_id = cpus->cpus[n].props.cluster_id;
diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index b39ed21e65..5d37e8d07a 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -158,6 +158,9 @@ void machine_parse_smp_config(MachineState *ms,
     ms->smp.threads = threads;
     ms->smp.max_cpus = maxcpus;
 
+    if (config->has_clusters)
+        ms->smp.build_cluster = true;
+
     /* sanity-check of the computed topology */
     if (sockets * dies * clusters * cores * threads != maxcpus) {
         g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 7b416c9787..24aafc213d 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -305,6 +305,7 @@ typedef struct DeviceMemoryState {
  * @cores: the number of cores in one cluster
  * @threads: the number of threads in one core
  * @max_cpus: the maximum number of logical processors on the machine
+ * @build_cluster: build cluster topology or not
  */
 typedef struct CpuTopology {
     unsigned int cpus;
@@ -314,6 +315,7 @@ typedef struct CpuTopology {
     unsigned int cores;
     unsigned int threads;
     unsigned int max_cpus;
+    bool build_cluster;
 } CpuTopology;
 
 /**
-- 
2.24.0


