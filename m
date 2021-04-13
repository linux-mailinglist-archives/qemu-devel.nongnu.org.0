Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB3935DA29
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 10:34:37 +0200 (CEST)
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEVH-0001gF-Cj
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 04:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWESy-0008PI-Lx; Tue, 13 Apr 2021 04:32:12 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWESu-0004pt-KW; Tue, 13 Apr 2021 04:32:12 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FKJgX0Y54z1BGF9;
 Tue, 13 Apr 2021 16:29:44 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 16:31:49 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v2 0/4] hw/arm/virt: Introduce cluster cpu topology support
Date: Tue, 13 Apr 2021 16:31:43 +0800
Message-ID: <20210413083147.34236-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
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
 "Michael S .
 Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com, yangyicong@huawei.com,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com, Igor
 Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series is a new version of [0] posted to introduce the cluster cpu
topology support for ARM platform, besides now existing sockets, cores,
and threads. And the code has been rewriten based on patch series [1].
[0] https://patchwork.kernel.org/project/qemu-devel/cover/20210331095343.12172-1-wangyanan55@huawei.com/
[1] https://patchwork.kernel.org/project/qemu-devel/cover/20210413080745.33004-1-wangyanan55@huawei.com/

Changelogs:
v1->v2:
- Only focus on cluster support for ARM platform
- Rebase the code on patch series [1]

Description:
A cluster means a group of cores that share some resources (e.g. cache)
among them under the LLC. For example, ARM64 server chip Kunpeng 920 has
6 or 8 clusters in each NUMA, and each cluster has 4 cores. All clusters
share L3 cache data while cores within each cluster share the L2 cache.

The cache affinity of cluster has been proved to improve the Linux kernel
scheduling performance and a patchset [2] has already been posted, where
a general sched_domain for clusters was added and a cluster level was
added in the arch-neutral cpu topology struct like below.
struct cpu_topology {
    int thread_id;
    int core_id;
    int cluster_id;
    int package_id;
    int llc_id;
    cpumask_t thread_sibling;
    cpumask_t core_sibling;
    cpumask_t cluster_sibling;
    cpumask_t llc_sibling;
};

Also Kernel Doc [3]: Documentation/devicetree/bindings/cpu/cpu-topology.txt
defines a four-level CPU topology hierarchy like socket/cluster/core/thread.
According to the context, a socket node's child nodes must be one or more
cluster nodes and a cluster node's child nodes must be one or more cluster
nodes/one or more core nodes.

So let's add the -smp, clusters=* command line support for ARM cpu, so that
future guest os could make use of cluster cpu topology for better scheduling
performance. For ARM machines, a four-level cpu hierarchy can be defined and
it will be sockets/clusters/cores/threads.
[2] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210319041618.14316-1-song.bao.hua@hisilicon.com/
[3] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/cpu/cpu-topology.txt

Test results:
After applying this patch series, launch a guest with virt-6.0 and cpu
topology configured with: -smp
96,sockets=2,clusters=6,cores=4,threads=2,
VM's cpu topology description shows as below.
lscpu:
Architecture:        aarch64
Byte Order:          Little Endian
CPU(s):              96
On-line CPU(s) list: 0-95
Thread(s) per core:  2
Core(s) per socket:  24
Socket(s):           2
NUMA node(s):        1
Vendor ID:           0x48
Model:               0
Stepping:            0x1
BogoMIPS:            200.00
NUMA node0 CPU(s):   0-95

Topology information of clusters can also be got:
cat /sys/devices/system/cpu/cpu0/topology/cluster_cpus_list: 0-7
cat /sys/devices/system/cpu/cpu0/topology/cluster_id: 56

cat /sys/devices/system/cpu/cpu8/topology/cluster_cpus_list: 8-15
cat /sys/devices/system/cpu/cpu8/topology/cluster_id: 316
...
cat /sys/devices/system/cpu/cpu95/topology/cluster_cpus_list: 88-95
cat /sys/devices/system/cpu/cpu95/topology/cluster_id: 2936

Yanan Wang (4):
  vl.c: Add -smp, clusters=* command line support for ARM cpu
  hw/arm/virt: Parse -smp cluster parameter in virt_smp_parse
  hw/arm/virt-acpi-build: Add cluster level for PPTT table
  hw/arm/virt: Add cluster level for device tree

 hw/arm/virt-acpi-build.c | 55 ++++++++++++++++++++++++----------------
 hw/arm/virt.c            | 44 +++++++++++++++++++-------------
 include/hw/arm/virt.h    |  1 +
 qemu-options.hx          | 26 +++++++++++--------
 softmmu/vl.c             |  3 +++
 5 files changed, 78 insertions(+), 51 deletions(-)

-- 
2.19.1


