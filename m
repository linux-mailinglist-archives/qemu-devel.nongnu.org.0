Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4581A0C58
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 12:59:03 +0200 (CEST)
Received: from localhost ([::1]:45080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLlwc-0001HJ-BO
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 06:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <miaoyubo@huawei.com>) id 1jLlvG-00080J-AM
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:57:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <miaoyubo@huawei.com>) id 1jLlvF-0007SM-3u
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:57:38 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3224 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <miaoyubo@huawei.com>) id 1jLlvE-0007P1-Cs
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:57:36 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E2023E5B0D510805F3F6;
 Tue,  7 Apr 2020 18:57:27 +0800 (CST)
Received: from DESKTOP-D7EVK5B.china.huawei.com (10.173.221.29) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Tue, 7 Apr 2020 18:57:17 +0800
From: Yubo Miao <miaoyubo@huawei.com>
To: <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>, <lersek@redhat.com>
Subject: [PATCH v5 0/8] pci_expander_brdige:acpi:Support pxb-pcie for ARM
Date: Tue, 7 Apr 2020 18:56:58 +0800
Message-ID: <20200407105706.1920-1-miaoyubo@huawei.com>
X-Mailer: git-send-email 2.24.1.windows.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.29]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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

From: miaoyubo <miaoyubo@huawei.com>

Changes with v4
v5->v4: Not using specific resources for PXB.
Instead, the resources for pxb are composed of the bar space of the
pci-bridge/pcie-root-port behined it and the config space of devices
behind it.

Only if the bios(uefi for arm) support multiple roots,
configure space of devices behind pxbs could be obtained.
The uefi work is updated for discussion by the following link:
https://edk2.groups.io/g/devel/message/56901?p=3D,,,20,0,0,0::Created,,ad=
d+extra+roots+for+Arm,20,2,0,72723351=20
[PATCH] ArmVirtPkg/FdtPciHostBridgeLib: add extra roots for Arm.

Currently pxb-pcie is not supported by arm,
the reason for it is pxb-pcie is not described in DSDT table
and only one main host bridge is described in acpi tables,
which means it is not impossible to present different io numas
for different devices.

This series of patches make arm to support PXB-PCIE.

Users can configure pxb-pcie with certain numa, Example command
is:

   -device pxb-pcie,id=3Dpci.7,bus_nr=3D128,numa_node=3D0,bus=3Dpcie.0,ad=
dr=3D0x9


miaoyubo (8):
  acpi:Extract two APIs from acpi_dsdt_add_pci
  fw_cfg: Write the extra roots into the fw_cfg
  acpi:Extract crs build form acpi_build.c
  acpi: Refactor the source of host bridge and build tables for pxb
  acpi: align the size to 128k
  unit-test: The files changed.
  unit-test: Add testcase for pxb
  unit-test: add the binary file and clear diff.h

 hw/acpi/aml-build.c            | 275 +++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c       | 251 ++++++++++++++++++++++-------
 hw/arm/virt.c                  |  23 +++
 hw/i386/acpi-build.c           | 285 ---------------------------------
 include/hw/acpi/aml-build.h    |  23 +++
 tests/data/acpi/virt/DSDT.pxb  | Bin 0 -> 7802 bytes
 tests/qtest/bios-tables-test.c |  58 ++++++-
 7 files changed, 564 insertions(+), 351 deletions(-)
 create mode 100644 tests/data/acpi/virt/DSDT.pxb

--=20
2.19.1



