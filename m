Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E144381E14
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 12:31:48 +0200 (CEST)
Received: from localhost ([::1]:53436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liE3n-0004Fq-5f
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 06:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE1O-0001Pa-DQ; Sun, 16 May 2021 06:29:18 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE1K-000799-Oo; Sun, 16 May 2021 06:29:17 -0400
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fjdh05rsvzmhBL;
 Sun, 16 May 2021 18:25:36 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:29:03 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:29:02 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, "Alistair
 Francis" <alistair.francis@wdc.com>, David Gibson
 <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v3 0/9] hw/arm/virt: Introduce cpu topology support
Date: Sun, 16 May 2021 18:28:51 +0800
Message-ID: <20210516102900.28036-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
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
Cc: Barry Song <song.bao.hua@hisilicon.com>, zhukeqian1@huawei.com,
 yangyicong@huawei.com, prime.zeng@hisilicon.com, wanghaibin.wang@huawei.com,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is v3 of the series [1] that I posted to introduce support of
generating cpu topology descriptions to guest.

Description:
An accurate cpu topology may help improve the cpu scheduler's decision
making when dealing with multi-core system. So cpu topology description
is helpful to provide guest with the right view. Dario Faggioli's talk
in [2] also shows the virtual topology could have impact on scheduling
performace. Thus this patch series introduces cpu topology support for
ARM platform.

In this series, both cpu-map in DT and ACPI PPTT table are introduced
to present cpu topology to the guest. And a new helper virt_smp_parse
not like the default one is introduced, which has more strict parsing
rules for the -smp command line.

[1] https://patchwork.kernel.org/project/qemu-devel/cover/20210413080745.33004-1-wangyanan55@huawei.com/
[2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines-friend-or-foe-dario-faggioli-suse

Test results about exposure of topology:
After applying this patch series, launch a guest with virt-6.1.

Cmdline: -smp 96, sockets=2, cores=48, threads=1
Output:
linux-atxcNc:~ # lscpu
Architecture:        aarch64
Byte Order:          Little Endian
CPU(s):              96
On-line CPU(s) list: 0-95
Thread(s) per core:  1
Core(s) per socket:  48
Socket(s):           2
NUMA node(s):        1
Vendor ID:           0x48

Cmdline: -smp 96
linux-atxcNc:~ # lscpu
Architecture:        aarch64
Byte Order:          Little Endian
CPU(s):              96
On-line CPU(s) list: 0-95
Thread(s) per core:  1
Core(s) per socket:  96
Socket(s):           1
NUMA node(s):        1
Vendor ID:           0x48

THINGS TO DO SOON:
1) Run some benchmark to test the scheduling improvement of guest kernel
   introduced by virtual cpu topology.
2) Add some QEMU tests about ARM vcpu topology, ACPI PPTT table, and DT
   cpu nodes. Will post in a separate patchset later.

---

Changelogs:
v2->v3:
- address comments from David, Philippe, and Andrew. Thanks!
- split some change into separate commits for ease of review
- adjust parsing rules of virt_smp_parse to be more strict
  (after discussion with Andrew)
- adjust author credit for the patches
- v2: https://patchwork.kernel.org/project/qemu-devel/cover/20210413080745.33004-1-wangyanan55@huawei.com/

v1->v2:
- Address Andrew Jones's comments
- Address Michael S. Tsirkin's comments
- https://patchwork.kernel.org/project/qemu-devel/cover/20210225085627.2263-1-fangying1@huawei.com/

---

Andrew Jones (3):
  device_tree: Add qemu_fdt_add_path
  hw/arm/virt: Add cpu-map to device tree
  hw/arm/virt-acpi-build: Generate PPTT table

Yanan Wang (6):
  hw/arm/virt: Disable cpu topology support on older machine types
  hw/arm/virt: Initialize the present cpu members
  hw/arm/virt-acpi-build: Use possible cpus in generation of DSDT
  hw/arm/virt-acpi-build: Use possible cpus in generation of MADT
  hw/acpi/aml-build: Add Processor hierarchy node structure
  hw/arm/virt: Add separate -smp parsing function for ARM machines

 hw/acpi/aml-build.c          |  26 ++++++
 hw/arm/virt-acpi-build.c     |  99 ++++++++++++++++++++---
 hw/arm/virt.c                | 148 ++++++++++++++++++++++++++++++++++-
 include/hw/acpi/aml-build.h  |   4 +
 include/hw/arm/virt.h        |   2 +
 include/sysemu/device_tree.h |   1 +
 qemu-options.hx              |   4 +
 softmmu/device_tree.c        |  44 ++++++++++-
 8 files changed, 316 insertions(+), 12 deletions(-)

-- 
2.19.1


