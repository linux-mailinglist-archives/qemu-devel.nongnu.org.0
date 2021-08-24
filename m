Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20033F5DF6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 14:26:16 +0200 (CEST)
Received: from localhost ([::1]:51798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIVVK-0008Na-Au
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 08:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mIVPv-0007RQ-FP; Tue, 24 Aug 2021 08:20:35 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mIVPs-0003ZC-D4; Tue, 24 Aug 2021 08:20:35 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Gv7Ty37Qlz89gs;
 Tue, 24 Aug 2021 20:20:06 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 20:20:20 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 20:20:19 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v6 0/5] hw/arm/virt: Introduce cpu topology support
Date: Tue, 24 Aug 2021 20:20:11 +0800
Message-ID: <20210824122016.144364-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
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
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This new version is based on patch series [1] which introduces some
fix and improvement for smp parsing.

Description:
Once the view of an accurate virtual cpu topology is provided to guest,
with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
e.g., the scheduling performance improvement. See Dario Faggioli's
research and the related performance tests in [2] for reference.

This patch series introduces cpu topology support for ARM platform.
Both cpu-map in DT and ACPI PPTT table are introduced to store the
topology information. And we only describe the topology information
to 6.2 and newer virt machines, considering compatibility.

patches not yet reviewed: #1 and #3.

[1] https://lore.kernel.org/qemu-devel/20210823122804.7692-1-wangyanan55@huawei.com/
[2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
-friend-or-foe-dario-faggioli-suse

---

Changelogs:

v5->v6:
- update the comment in DT cpu-map generation
- update the comment in ACPI PPTT table generation
- add R-b tags from Michael for ACPI patches
- v5: https://lore.kernel.org/qemu-devel/20210805123921.62540-1-wangyanan55@huawei.com/

v4->v5:
- drop the added -smp "expose=on|off" parameter and only describe topology
  for 6.2 and newer machines
- v4: https://lore.kernel.org/qemu-devel/20210622093413.13360-1-wangyanan55@huawei.com/

v3->v4:
- add new -smp parameter "expose=on|off" for users to enable/disable the feature
- add stricter -smp cmdline parsing rules on "expose=on" case
- move build_pptt to generic aml-build.c
- add default cluster node in the cpu-map
- rebase on top of latest upstream master
- v3: https://lore.kernel.org/qemu-devel/20210516102900.28036-1-wangyanan55@huawei.com/

v2->v3:
- address comments from David, Philippe, and Andrew. Thanks!
- split some change into separate commits for ease of review
- adjust parsing rules of virt_smp_parse to be more strict
  (after discussion with Andrew)
- adjust author credit for the patches
- v2: https://lore.kernel.org/qemu-devel/20210413080745.33004-1-wangyanan55@huawei.com/

v1->v2:
- Address Andrew Jones's comments
- Address Michael S. Tsirkin's comments
- v1: https://lore.kernel.org/qemu-devel/20210225085627.2263-1-fangying1@huawei.com/

---

Andrew Jones (2):
  hw/arm/virt: Add cpu-map to device tree
  hw/acpi/aml-build: Generate PPTT table

Yanan Wang (3):
  hw/arm/virt: Only describe cpu topology since virt-6.2
  device_tree: Add qemu_fdt_add_path
  hw/acpi/aml-build: Add Processor hierarchy node structure

 hw/acpi/aml-build.c          | 86 ++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c     |  8 +++-
 hw/arm/virt.c                | 73 +++++++++++++++++++++++++-----
 include/hw/acpi/aml-build.h  |  7 +++
 include/hw/arm/virt.h        |  4 +-
 include/sysemu/device_tree.h |  1 +
 softmmu/device_tree.c        | 44 +++++++++++++++++-
 7 files changed, 209 insertions(+), 14 deletions(-)

--
2.19.1


