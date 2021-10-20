Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CB8434DFE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:38:30 +0200 (CEST)
Received: from localhost ([::1]:46014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCjd-0005fZ-IG
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdCTK-0006t4-9v; Wed, 20 Oct 2021 10:21:39 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdCTG-0002A3-UE; Wed, 20 Oct 2021 10:21:37 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HZCMz6rF2z90ML;
 Wed, 20 Oct 2021 22:16:31 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 22:21:27 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 22:21:27 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Eric Auger <eauger@redhat.com>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v9 0/8] hw/arm/virt: Introduce cpu topology support
Date: Wed, 20 Oct 2021 22:21:17 +0800
Message-ID: <20211020142125.7516-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is the latest v9 series which supports exposing vCPU topology
to the guest for Arm virt machines.

Description of this series:
Once the view of an accurate virtual cpu topology is provided to guest,
with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
e.g., the scheduling performance improvement. See Dario Faggioli's
research and the related performance tests in [1] for reference.

This patch series introduces cpu topology support for Arm platform.
Both cpu-map in DT and ACPI PPTT table are introduced to store the
topology information. And we only describe the topology information
to 6.2 and newer virt machines, considering compatibility.

[1] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
-friend-or-foe-dario-faggioli-suse

Changelog:
v8->v9:
- add Eric's R-bs, thanks!
- address Eric's suggestions to update some function comments and commit msg (patch #5)
- make build_processor_hierarchy_node static as it's only used by build_pptt (patch #4)
- retested.
- v8: https://lore.kernel.org/qemu-devel/20211014132206.19220-1-wangyanan55@huawei.com/

v7->v8:
- rebased on top of master (commit e5b2333f24)
- only add one generic expected file for PPTT instead of four, which works
  fine enough for now (patch #6 and #8 updated)
- v7: https://lore.kernel.org/qemu-devel/20211007030746.10420-1-wangyanan55@huawei.com/

v6->v7:
- rebased on top of master (commit ca61fa4b80)
- use newly introduced acpi_table_begin/acpi_table_end APIs to build PPTT
  (patch #5 updated)
- add reference files for PPTT to fix broken bios-table-test for Aarch64
  virt machine (patch #6-#8 added)
- v6: https://lore.kernel.org/qemu-devel/20210824122016.144364-1-wangyanan55@huawei.com/

Andrew Jones (2):
  hw/arm/virt: Add cpu-map to device tree
  hw/acpi/aml-build: Add PPTT table

Yanan Wang (6):
  hw/arm/virt: Only describe cpu topology since virt-6.2
  device_tree: Add qemu_fdt_add_path
  hw/acpi/aml-build: Add Processor hierarchy node structure
  tests/data/acpi/virt: Add an empty expected file for PPTT
  hw/arm/virt-acpi-build: Generate PPTT table
  tests/data/acpi/virt: Update the empty expected file for PPTT

 hw/acpi/aml-build.c          |  89 +++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c     |   8 +++-
 hw/arm/virt.c                |  71 ++++++++++++++++++++++++----
 include/hw/acpi/aml-build.h  |   3 ++
 include/hw/arm/virt.h        |   4 +-
 include/sysemu/device_tree.h |   1 +
 softmmu/device_tree.c        |  44 ++++++++++++++++-
 tests/data/acpi/virt/PPTT    | Bin 0 -> 76 bytes
 8 files changed, 206 insertions(+), 14 deletions(-)
 create mode 100644 tests/data/acpi/virt/PPTT

--
2.19.1


