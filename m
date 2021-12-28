Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70434807C7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 10:25:04 +0100 (CET)
Received: from localhost ([::1]:40324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n28j9-0001tZ-P3
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 04:25:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28h0-0007Yy-AO; Tue, 28 Dec 2021 04:22:50 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28gx-000774-Fo; Tue, 28 Dec 2021 04:22:50 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JNTZT4SFbzbjjn;
 Tue, 28 Dec 2021 17:22:09 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 17:22:36 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>, Markus
 Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v5 00/14] ARM virt: Introduce CPU clusters topology support
Date: Tue, 28 Dec 2021 17:22:07 +0800
Message-ID: <20211228092221.21068-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

This series introduces the new CPU clusters topology parameter
and enable the support for it on ARM virt machines.

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

In virtualization, on the Hosts which have pClusters, if we can
design a vCPU topology with cluster level for guest kernel and
have a dedicated vCPU pinning. A Cluster-Aware Guest kernel can
also make use of the cache affinity of CPU clusters to gain
similar scheduling performance. So this series introduce clusters
support in the vCPU topology on ARM virt machines.

The patches are arranged mainly in two parts:
The first part (patch 1-7):
- Implement infrastructure for CPU cluster level topology support,
  including the SMP documentation, configuration and parsing,
  adding testcases for clusters.

The second part (part 8-14):
- Enable CPU cluster support on ARM virt machines, so that users
  can specify a 4-level CPU hierarchy sockets/clusters/cores/threads.
  And the 4-level topology will be described to guest kernel through
  ACPI PPTT and DT cpu-map.

Changelog:
v3->v4:
- Significant change from v3 to v4, since the whole series is reworked
  based on latest QEMU SMP frame.
- v3: https://patchew.org/QEMU/20210516103228.37792-1-wangyanan55@huawei.com/

v4->v5:
- newly added patches 4-7
- rebased on Philippe series: "tests/unit: Rework test-smp-parse tests"
  https://patchew.org/QEMU/20211216132015.815493-1-philmd@redhat.com/
- v4: https://patchew.org/QEMU/20211121122502.9844-1-wangyanan55@huawei.com/

Yanan Wang (14):
  qemu-options: Improve readability of SMP related Docs
  hw/core/machine: Introduce CPU cluster topology support
  hw/core/machine: Wrap target specific parameters together
  tests/unit/test-smp-parse: Add testcases for CPU clusters
  tests/unit/test-smp-parse: No need to explicitly zero MachineClass
    members
  tests/unit/test-smp-parse: Keep default MIN/MAX CPUs in
    machine_base_class_init
  MAINTAINERS: Self-recommended as reviewer of "Machine core"
  hw/arm/virt: Support clusters on ARM virt machines
  hw/arm/virt: Support cluster level in DT cpu-map
  hw/acpi/aml-build: Improve scalability of PPTT generation
  hw/arm/virt-acpi-build: Make an ARM specific PPTT generator
  tests/acpi/bios-tables-test: Allow changes to virt/PPTT file
  hw/arm/virt-acpi-build: Support cluster level in PPTT generation
  tests/acpi/bios-table-test: Update expected virt/PPTT file

 MAINTAINERS                 |   1 +
 hw/acpi/aml-build.c         |  66 +----------------
 hw/arm/virt-acpi-build.c    |  92 +++++++++++++++++++++++-
 hw/arm/virt.c               |  16 +++--
 hw/core/machine-smp.c       |  29 ++++++--
 hw/core/machine.c           |   3 +
 include/hw/acpi/aml-build.h |   5 +-
 include/hw/boards.h         |   6 +-
 qapi/machine.json           |   5 +-
 qemu-options.hx             |  91 ++++++++++++++++++-----
 softmmu/vl.c                |   3 +
 tests/data/acpi/virt/PPTT   | Bin 76 -> 96 bytes
 tests/unit/test-smp-parse.c | 140 ++++++++++++++++++++++++++++++------
 13 files changed, 332 insertions(+), 125 deletions(-)

--
2.27.0


