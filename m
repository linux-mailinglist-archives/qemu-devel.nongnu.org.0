Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1956589CE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 07:57:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAmpa-0003qx-Rz; Thu, 29 Dec 2022 01:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1pAmpU-0003pQ-FM
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 01:55:52 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1pAmpR-0002A1-8Y
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 01:55:52 -0500
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NjJyt63NQz16Ltv;
 Thu, 29 Dec 2022 14:54:14 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 29 Dec 2022 14:55:32 +0800
To: <mst@redhat.com>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
 <ani@anisinha.ca>, <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>,
 <f4bug@amsat.org>, <wangyanan55@huawei.com>, <qemu-devel@nongnu.org>
CC: <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
 <yangyicong@hisilicon.com>, <prime.zeng@huawei.com>,
 <hesham.almatary@huawei.com>, <ionela.voinescu@arm.com>,
 <darren@os.amperecomputing.com>
Subject: [PATCH v5 2/6] hw/acpi/aml-build: Only generate cluster node in PPTT
 when specified
Date: Thu, 29 Dec 2022 14:55:09 +0800
Message-ID: <20221229065513.55652-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20221229065513.55652-1-yangyicong@huawei.com>
References: <20221229065513.55652-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Yicong Yang <yangyicong@hisilicon.com>

Currently we'll always generate a cluster node no matter user has
specified '-smp clusters=X' or not. Cluster is an optional level
and will participant the building of Linux scheduling domains and
only appears on a few platforms. It's unncessary to always build
it when it cannot reflect the real topology on platforms having no
cluster implementation and to avoid affecting the linux scheduling
domains in the VM. So only generate the cluster topology in ACPI
PPTT when the user has specified it explicitly in -smp.

Tested qemu-system-aarch64 with `-smp 8` and linux 6.1-rc1, without
this patch:
estuary:/sys/devices/system/cpu/cpu0/topology$ cat cluster_*
ff	# cluster_cpus
0-7	# cluster_cpus_list
56	# cluster_id

with this patch:
estuary:/sys/devices/system/cpu/cpu0/topology$ cat cluster_*
ff	# cluster_cpus
0-7	# cluster_cpus_list
36	# cluster_id, with no cluster node kernel will make it to
	  physical package id

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 hw/acpi/aml-build.c   | 2 +-
 hw/core/machine-smp.c | 2 ++
 include/hw/boards.h   | 3 +++
 qemu-options.hx       | 3 +++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 42feb4d4d7..ea331a20d1 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2030,7 +2030,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 0, socket_id, NULL, 0);
         }
 
-        if (mc->smp_props.clusters_supported) {
+        if (mc->smp_props.clusters_supported && mc->smp_props.has_clusters) {
             if (cpus->cpus[n].props.cluster_id != cluster_id) {
                 assert(cpus->cpus[n].props.cluster_id > cluster_id);
                 cluster_id = cpus->cpus[n].props.cluster_id;
diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index b39ed21e65..c3dab007da 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -158,6 +158,8 @@ void machine_parse_smp_config(MachineState *ms,
     ms->smp.threads = threads;
     ms->smp.max_cpus = maxcpus;
 
+    mc->smp_props.has_clusters = config->has_clusters;
+
     /* sanity-check of the computed topology */
     if (sockets * dies * clusters * cores * threads != maxcpus) {
         g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index d18d6d0073..b0abbdd5dc 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -130,11 +130,14 @@ typedef struct {
  * @prefer_sockets - whether sockets are preferred over cores in smp parsing
  * @dies_supported - whether dies are supported by the machine
  * @clusters_supported - whether clusters are supported by the machine
+ * @has_clusters - whether clusters are explicitly specified in the user
+ *                 provided SMP configuration
  */
 typedef struct {
     bool prefer_sockets;
     bool dies_supported;
     bool clusters_supported;
+    bool has_clusters;
 } SMPCompatProps;
 
 /**
diff --git a/qemu-options.hx b/qemu-options.hx
index 7f99d15b23..8662568324 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -343,6 +343,9 @@ SRST
     ::
 
         -smp 2
+
+    Note: The cluster topology will only be generated in ACPI and exposed
+    to guest if it's explicitly specified in -smp.
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
2.24.0


