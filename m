Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280721DAEED
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 11:39:14 +0200 (CEST)
Received: from localhost ([::1]:45466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbLBx-00040o-6p
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 05:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miaoyubo@huawei.com>)
 id 1jbLAC-0002iU-8g
 for qemu-devel@nongnu.org; Wed, 20 May 2020 05:37:24 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42504 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miaoyubo@huawei.com>)
 id 1jbLAA-0008Tl-SC
 for qemu-devel@nongnu.org; Wed, 20 May 2020 05:37:23 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4DCB3CC510C8B7FF26CE;
 Wed, 20 May 2020 17:37:12 +0800 (CST)
Received: from DESKTOP-D7EVK5B.china.huawei.com (10.173.221.29) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Wed, 20 May 2020 17:37:01 +0800
From: Yubo Miao <miaoyubo@huawei.com>
To: <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>, <lersek@redhat.com>
Subject: [PATCH v7 0/8] pci_expander_brdige:acpi: Support pxb-pcie for ARM
Date: Wed, 20 May 2020 17:36:21 +0800
Message-ID: <20200520093629.1495-1-miaoyubo@huawei.com>
X-Mailer: git-send-email 2.24.1.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.173.221.29]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=miaoyubo@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 05:37:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, miaoyubo@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes with v6
v6->v7:
Refactor fw_cfg_write_extra_pci_roots
Add API PCI_GET_PCIE_HOST_STATE
Fix typos

I have one question for patch
[PATCH v7 8/8] unit-test: Add the binary file and clear diff.

I followed instructions in tests/qtest/bios-tables-test.c
to updated golden master binaries and empty
tests/qtest/bios-tables-test-allowed-diff.h.

However, checkpatch.pl would report the error
ERROR: Do not add expected files together with tests.

Does the error matters?

Changes with v5
v5->v6: stat crs_range_insert in aml_build.h

Changes with v4
v4->v5: Not using specific resources for PXB.
Instead, the resources for pxb are composed of the bar space of the
pci-bridge/pcie-root-port behined it and the config space of devices
behind it.

Only if the bios(uefi for arm) support multiple roots,
configure space of devices behind pxbs could be obtained.
The uefi work is updated for discussion by the following link:
https://edk2.groups.io/g/devel/message/56901?p=,,,20,0,0,0::Created,,add+extra+roots+for+Arm,20,2,0,72723351
[PATCH] ArmVirtPkg/FdtPciHostBridgeLib: add extra roots for Arm.

Currently pxb-pcie is not supported by arm,
the reason for it is pxb-pcie is not described in DSDT table
and only one main host bridge is described in acpi tables,
which means it is not impossible to present different io numas
for different devices.

This series of patches make arm to support PXB-PCIE.

Users can configure pxb-pcie with certain numa, Example command
is:

   -device pxb-pcie,id=pci.7,bus_nr=128,numa_node=0,bus=pcie.0,addr=0x9

Yubo Miao (8):
  acpi: Extract two APIs from acpi_dsdt_add_pci
  fw_cfg: Write the extra roots into the fw_cfg
  acpi: Extract crs build form acpi_build.c
  acpi: Refactor the source of host bridge and build tables for pxb
  acpi: Align the size to 128k
  unit-test: The files changed.
  unit-test: Add testcase for pxb
  unit-test: Add the binary file and clear diff.h

 hw/acpi/aml-build.c            | 275 +++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c       | 249 +++++++++++++++++++++-------
 hw/arm/virt.c                  |   8 +
 hw/i386/acpi-build.c           | 285 ---------------------------------
 hw/i386/pc.c                   |  18 +--
 hw/nvram/fw_cfg.c              |  20 +++
 include/hw/acpi/aml-build.h    |  25 +++
 include/hw/nvram/fw_cfg.h      |   2 +
 include/hw/pci/pcie_host.h     |   4 +
 tests/data/acpi/virt/DSDT.pxb  | Bin 0 -> 7802 bytes
 tests/qtest/bios-tables-test.c |  58 ++++++-
 11 files changed, 579 insertions(+), 365 deletions(-)
 create mode 100644 tests/data/acpi/virt/DSDT.pxb

-- 
2.19.1



