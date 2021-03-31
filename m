Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABF434FD8A
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 11:57:21 +0200 (CEST)
Received: from localhost ([::1]:36206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXbE-0004Mw-4z
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 05:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXYB-0002dE-4r; Wed, 31 Mar 2021 05:54:12 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXY3-0002Xx-MS; Wed, 31 Mar 2021 05:54:10 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9M6F6Y7qz1BFy0;
 Wed, 31 Mar 2021 17:51:49 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 17:53:45 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH 0/6] Introduce cluster cpu topology support
Date: Wed, 31 Mar 2021 17:53:37 +0800
Message-ID: <20210331095343.12172-1-wangyanan55@huawei.com>
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
 Eduardo
 Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
This series introduces the cluster cpu topology support, besides now
existing sockets, cores, and threads.

A cluster means a group of cores that share some resources (e.g. cache)
among them under the LLC. For example, ARM64 server chip Kunpeng 920 has
6 or 8 clusters in each NUMA, and each cluster has 4 cores. All clusters
share L3 cache data while cores within each cluster share the L2 cache.

Also, there are some x86 CPU implementations (e.g. Jacobsville) where L2
cache is shared among a cluster of cores instead of being exclusive to
one single core. For example, on Jacobsville there are 6 clusters of 4
Atom cores, each cluster sharing a separate L2, and 24 cores sharing L3).

The cache affinity of cluster has been proved to improve the Linux kernel
scheduling performance and a patchset [1] has already been posted, where
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

Also Kernel Doc [2]: Documentation/devicetree/bindings/cpu/cpu-topology.txt
defines a four-level CPU topology hierarchy like socket/cluster/core/thread.
According to the context, a socket node's child nodes must be one or more
cluster nodes and a cluster node's child nodes must be one or more cluster
nodes/one or more core nodes.

So let's add the arch-neutral -smp, clusters=* command line support, so that
future guest os could make use of cluster cpu topology for better scheduling
performance. And whichever architecture that has groups of cpus sharing some
separate resources(e.g. L2 cache) internely under LLC can use this command
line parameter to define a VM with cluster level cpu topology.

For ARM machines, a four-level cpu hierarchy can be defined and it will be
sockets/clusters/cores/threads. For PC machines, a five-level cpu hierarchy
can be defined and it will be sockets/dies/clusters/cores/threads.

About this series:
Note that, this series was implemented based on [3] and [4]. Although they
have not merged into qemu mainline for now, it's still meaning to post this
series to express the thoughts first. So a RFC is sent and any comments are
welcomed and appreciated.

Test results:
With command line: -smp 96,sockets=2,clusters=6,cores=4,threads=2, VM's cpu
topology description shows as below.
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
L1d cache:           unknown size
L1i cache:           unknown size
L2 cache:            unknown size
NUMA node0 CPU(s):   0-95

Topology information of clusters can also be got:
cat /sys/devices/system/cpu/cpu0/topology/cluster_cpus_list: 0-7
cat /sys/devices/system/cpu/cpu0/topology/cluster_id: 56

cat /sys/devices/system/cpu/cpu8/topology/cluster_cpus_list: 8-15
cat /sys/devices/system/cpu/cpu8/topology/cluster_id: 316
...
cat /sys/devices/system/cpu/cpu95/topology/cluster_cpus_list: 88-95
cat /sys/devices/system/cpu/cpu95/topology/cluster_id: 2936

Links:
[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210319041618.14316-1-song.bao.hua@hisilicon.com/
[2] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/cpu/cpu-topology.txt
[3] https://patchwork.kernel.org/project/qemu-devel/cover/20210225085627.2263-1-fangying1@huawei.com/
[4] https://patchwork.kernel.org/project/qemu-devel/patch/20201109030452.2197-4-fangying1@huawei.com/

Yanan Wang (6):
  vl.c: Add arch-neutral -smp, clusters=* command line support
  hw/core/machine: Parse cluster cpu topology in smp_parse()
  hw/arm/virt: Parse cluster cpu topology for ARM machines
  hw/i386/pc: Parse cluster cpu topology for PC machines
  hw/arm/virt-acpi-build: Add cluster level for ARM PPTT table
  hw/arm/virt: Add cluster level for ARM device tree

 hw/acpi/aml-build.c         | 11 +++++++++
 hw/arm/virt-acpi-build.c    | 43 ++++++++++++++++++++---------------
 hw/arm/virt.c               | 45 ++++++++++++++++++++++---------------
 hw/core/machine.c           | 32 +++++++++++++++-----------
 hw/i386/pc.c                | 31 +++++++++++++++----------
 include/hw/acpi/aml-build.h |  2 ++
 include/hw/boards.h         |  4 +++-
 qemu-options.hx             | 27 +++++++++++++---------
 softmmu/vl.c                |  3 +++
 9 files changed, 125 insertions(+), 73 deletions(-)

-- 
2.19.1


