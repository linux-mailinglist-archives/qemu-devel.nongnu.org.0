Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4288E5E64C6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:11:23 +0200 (CEST)
Received: from localhost ([::1]:50408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMvC-0008IF-Cr
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1obM27-0005WM-CV
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:14:27 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1obM23-0001Fx-Mj
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:14:27 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYFz95290zpVHx;
 Thu, 22 Sep 2022 21:11:17 +0800 (CST)
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
Subject: [PATCH 0/4] Only generate cluster node in PPTT when specified
Date: Thu, 22 Sep 2022 21:11:39 +0800
Message-ID: <20220922131143.58003-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=yangyicong@huawei.com; helo=szxga01-in.huawei.com
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

This series mainly change the policy for building a cluster topology node
in PPTT. Previously we'll always build a cluster node in PPTT without
asking the user, after this set the cluster node will be built only the
the user specify through "-smp clusters=X".

Update the tests and test tables accordingly.

Yicong Yang (4):
  hw/acpi/aml-build: Only generate cluster node in PPTT when specified
  tests: virt: update expected ACPI tables for virt test
  tests: acpi: aarch64: add topology test for aarch64
  tests: acpi: aarch64: add *.topology tables

 hw/acpi/aml-build.c                |   2 +-
 hw/core/machine-smp.c              |   3 +++
 include/hw/boards.h                |   2 ++
 tests/data/acpi/virt/APIC.pxb      | Bin 0 -> 168 bytes
 tests/data/acpi/virt/APIC.topology | Bin 0 -> 700 bytes
 tests/data/acpi/virt/DBG2.memhp    | Bin 0 -> 87 bytes
 tests/data/acpi/virt/DBG2.numamem  | Bin 0 -> 87 bytes
 tests/data/acpi/virt/DBG2.pxb      | Bin 0 -> 87 bytes
 tests/data/acpi/virt/DBG2.topology | Bin 0 -> 87 bytes
 tests/data/acpi/virt/DSDT.topology | Bin 0 -> 5398 bytes
 tests/data/acpi/virt/FACP.pxb      | Bin 0 -> 268 bytes
 tests/data/acpi/virt/FACP.topology | Bin 0 -> 268 bytes
 tests/data/acpi/virt/GTDT.pxb      | Bin 0 -> 96 bytes
 tests/data/acpi/virt/GTDT.topology | Bin 0 -> 96 bytes
 tests/data/acpi/virt/IORT.topology | Bin 0 -> 128 bytes
 tests/data/acpi/virt/MCFG.pxb      | Bin 0 -> 60 bytes
 tests/data/acpi/virt/MCFG.topology | Bin 0 -> 60 bytes
 tests/data/acpi/virt/PPTT          | Bin 96 -> 76 bytes
 tests/data/acpi/virt/PPTT.memhp    | Bin 0 -> 76 bytes
 tests/data/acpi/virt/PPTT.numamem  | Bin 0 -> 76 bytes
 tests/data/acpi/virt/PPTT.pxb      | Bin 0 -> 76 bytes
 tests/data/acpi/virt/PPTT.topology | Bin 0 -> 336 bytes
 tests/data/acpi/virt/SPCR.pxb      | Bin 0 -> 80 bytes
 tests/data/acpi/virt/SPCR.topology | Bin 0 -> 80 bytes
 tests/qtest/bios-tables-test.c     |  22 ++++++++++++++++++++++
 25 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 tests/data/acpi/virt/APIC.pxb
 create mode 100644 tests/data/acpi/virt/APIC.topology
 create mode 100644 tests/data/acpi/virt/DBG2.memhp
 create mode 100644 tests/data/acpi/virt/DBG2.numamem
 create mode 100644 tests/data/acpi/virt/DBG2.pxb
 create mode 100644 tests/data/acpi/virt/DBG2.topology
 create mode 100644 tests/data/acpi/virt/DSDT.topology
 create mode 100644 tests/data/acpi/virt/FACP.pxb
 create mode 100644 tests/data/acpi/virt/FACP.topology
 create mode 100644 tests/data/acpi/virt/GTDT.pxb
 create mode 100644 tests/data/acpi/virt/GTDT.topology
 create mode 100644 tests/data/acpi/virt/IORT.topology
 create mode 100644 tests/data/acpi/virt/MCFG.pxb
 create mode 100644 tests/data/acpi/virt/MCFG.topology
 create mode 100644 tests/data/acpi/virt/PPTT.memhp
 create mode 100644 tests/data/acpi/virt/PPTT.numamem
 create mode 100644 tests/data/acpi/virt/PPTT.pxb
 create mode 100644 tests/data/acpi/virt/PPTT.topology
 create mode 100644 tests/data/acpi/virt/SPCR.pxb
 create mode 100644 tests/data/acpi/virt/SPCR.topology

-- 
2.24.0


