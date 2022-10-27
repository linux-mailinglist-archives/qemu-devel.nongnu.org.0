Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C8D60EEB6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 05:38:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ontXt-0006C6-Gl; Wed, 26 Oct 2022 23:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1ontXr-00067h-N6
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 23:27:03 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1ontXl-0003L6-M9
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 23:27:03 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MyWGg51gyzpVtd;
 Thu, 27 Oct 2022 11:23:23 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 11:26:50 +0800
To: <mst@redhat.com>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
 <ani@anisinha.ca>, <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>,
 <f4bug@amsat.org>, <wangyanan55@huawei.com>, <qemu-devel@nongnu.org>
CC: <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
 <yangyicong@hisilicon.com>, <prime.zeng@huawei.com>,
 <hesham.almatary@huawei.com>, <ionela.voinescu@arm.com>,
 <darren@os.amperecomputing.com>
Subject: [PATCH v2 0/4] Only generate cluster node in PPTT when specified
Date: Thu, 27 Oct 2022 11:26:09 +0800
Message-ID: <20221027032613.18377-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=yangyicong@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Yicong Yang <yangyicong@hisilicon.com>

This series mainly change the policy for building a cluster topology node
in PPTT. Previously we'll always build a cluster node in PPTT without
asking the user, after this set the cluster node will be built only the
the user specify through "-smp clusters=X".

One problem is related to this but not fully caused by this, see the
discussion in [*]. When booting the VM with `-smp 8` and 4 numa nodes,
the linux scheduling domains in the VM misses the NUMA domains. It's
because the MC level span extends to Cluster level (which is generated
by the Qemu by default) that spans all the cpus in the system, then the
scheduling domain building stops at MC level since it already includes all
the cpus.

Considering cluster is an optional level and most platforms don't have it,
they may even don't realize this is built and a always build policy cannot
emulate the topology on these platforms. So in this series improve the
policy to only generate cluster when the user explicitly want.

Update the tests and test tables accordingly.

[*] https://lore.kernel.org/lkml/2c079860-ee82-7719-d3d2-756192f41704@huawei.com/

Change since v1:
- Only includes the test tables which is really needed
- Enrich the commit
Link: https://lore.kernel.org/qemu-devel/20220922131143.58003-1-yangyicong@huawei.com/

Yicong Yang (4):
  hw/acpi/aml-build: Only generate cluster node in PPTT when specified
  tests: virt: update expected ACPI tables for virt test
  tests: acpi: aarch64: add topology test for aarch64
  tests: acpi: aarch64: add *.topology tables

 hw/acpi/aml-build.c                |   2 +-
 hw/core/machine-smp.c              |   3 +++
 include/hw/boards.h                |   2 ++
 qemu-options.hx                    |   2 ++
 tests/data/acpi/virt/APIC.topology | Bin 0 -> 700 bytes
 tests/data/acpi/virt/DSDT.topology | Bin 0 -> 5398 bytes
 tests/data/acpi/virt/PPTT          | Bin 96 -> 76 bytes
 tests/data/acpi/virt/PPTT.topology | Bin 0 -> 336 bytes
 tests/qtest/bios-tables-test.c     |  22 ++++++++++++++++++++++
 9 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 tests/data/acpi/virt/APIC.topology
 create mode 100644 tests/data/acpi/virt/DSDT.topology
 create mode 100644 tests/data/acpi/virt/PPTT.topology

-- 
2.24.0


