Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4D3482F1D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 09:50:30 +0100 (CET)
Received: from localhost ([::1]:33284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4J2z-0007pS-CW
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 03:50:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4IzW-0004Iz-Au; Mon, 03 Jan 2022 03:46:54 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4IzS-0006Rg-2j; Mon, 03 Jan 2022 03:46:54 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JS8V62BPvzbj23;
 Mon,  3 Jan 2022 16:46:06 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 3 Jan 2022 16:46:38 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha
 <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v6 0/7] ARM virt: Support CPU cluster topology
Date: Mon, 3 Jan 2022 16:46:29 +0800
Message-ID: <20220103084636.2496-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-devel@nongnu.org>

This v6 series enables the support for CPU cluster topology on
ARM virt machines. The generic infrastructure for CPU cluster
parameter now is in upstream.

Background and descriptions:
The new Cluster-Aware Scheduling support has landed in Linux 5.16,
which has been proved to benefit the scheduling performance (e.g.
load balance and wake_affine strategy) for both x86_64 and AArch64.
We can see the PR [1] or the actual patch series [2] for reference.

So since Linux 5.16 we have four-level arch-neutral CPU topology
definition like below and a new scheduler level for clusters.
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
}

A cluster generally means a group of CPU cores which share L2 cache
or other mid-level resources, and it is the shared resources that
is used to improve scheduler's behavior. From the point of view of
the size range, it's between CPU die and CPU core. For example, on
some ARM64 Kunpeng servers, we have 6 clusters in each NUMA node,
and 4 CPU cores in each cluster. The 4 CPU cores share a separate
L2 cache and a L3 cache tag, which brings cache affinity advantage.

[1] https://lore.kernel.org/lkml/163572864855.3357115.17938524897008353101.tglx@xen13/
[2] https://lkml.org/lkml/2021/9/24/178

In virtualization, on the Hosts which have physical clusters, if we
can design a vCPU topology with cluster level for guest kernel and
have a dedicated vCPU pinning. A Cluster-Aware Guest kernel can also
make use of the cache affinity of CPU clusters to gain similar
scheduling performance. This series only enables clusters support
in the vCPU topology on ARM virt machines. We can also enable it
for other machine types in the future if needed.

The patches in this series do:
- Enable CPU cluster support on ARM virt machines, so that users
  can specify a 4-level CPU hierarchy sockets/clusters/cores/threads.
  And the 4-level topology will be described to guest kernel through
  ACPI PPTT and DT cpu-map.

Changelog:
v5->v6:
- drop the generic part which is in upstream now
- rebased on latest master
- v5: https://patchew.org/QEMU/20211228092221.21068-1-wangyanan55@huawei.com/

Yanan Wang (7):
  hw/arm/virt: Support CPU cluster on ARM virt machine
  hw/arm/virt: Support cluster level in DT cpu-map
  hw/acpi/aml-build: Improve scalability of PPTT generation
  hw/arm/virt-acpi-build: Make an ARM specific PPTT generator
  tests/acpi/bios-tables-test: Allow changes to virt/PPTT file
  hw/arm/virt-acpi-build: Support cluster level in PPTT generation
  tests/acpi/bios-table-test: Update expected virt/PPTT file

 hw/acpi/aml-build.c         |  66 ++------------------------
 hw/arm/virt-acpi-build.c    |  92 +++++++++++++++++++++++++++++++++++-
 hw/arm/virt.c               |  16 ++++---
 include/hw/acpi/aml-build.h |   5 +-
 qemu-options.hx             |  10 ++++
 tests/data/acpi/virt/PPTT   | Bin 76 -> 96 bytes
 6 files changed, 115 insertions(+), 74 deletions(-)

--
2.27.0


