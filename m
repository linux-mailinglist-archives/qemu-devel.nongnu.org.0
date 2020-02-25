Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C5516B769
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 02:52:13 +0100 (CET)
Received: from localhost ([::1]:47426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6PON-0000HH-GF
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 20:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34569)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <miaoyubo@huawei.com>) id 1j6PNJ-0008Hw-2L
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 20:51:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <miaoyubo@huawei.com>) id 1j6PNH-0002Ix-Qs
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 20:51:04 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3241 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <miaoyubo@huawei.com>) id 1j6PNH-0002CD-GU
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 20:51:03 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 65DCB32B0DB3ED37D029;
 Tue, 25 Feb 2020 09:50:52 +0800 (CST)
Received: from DESKTOP-D7EVK5B.china.huawei.com (10.173.221.29) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Tue, 25 Feb 2020 09:50:44 +0800
From: Yubo Miao <miaoyubo@huawei.com>
To: <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>
Subject: [PATCH v4 0/3] pci_expander_brdige:acpi:Support pxb-pcie for ARM
Date: Tue, 25 Feb 2020 09:50:23 +0800
Message-ID: <20200225015026.940-1-miaoyubo@huawei.com>
X-Mailer: git-send-email 2.24.1.windows.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.29]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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

Currently pxb-pcie is not supported by arm, the reason for it is
pxb-pcie is not described in DSDT table and only one main host bridge
is described in acpi tables, which means it is not impossible to
present different io numas for different devices, especially
host-passthrough devices.

This series of patches make arm to support PXB-PCIE.

Users can configure pxb-pcie with certain numa, Example command
is:

   -device pxb-pcie,id=3Dpci.7,bus_nr=3D128,numa_node=3D0,bus=3Dpcie.0,ad=
dr=3D0x9

Since the bus of pxb-pcie is root bus, devices could not be plugged
into pxb-pcie directly,pcie-root-port or pci-bridge should be defined
and plugged on pxb-pcie, then the device could be plugged onto the
pcie-root-port or pci-bridge.

With the patches,io numa could be presented to the guest by define a
pxb-pcie with the numa and plug the device on it.

miaoyubo (3):
  acpi:Extract two APIs from acpi_dsdt_add_pci
  acpi:pci-expender-bus: Add pxb support for arm
  ACPI/unit-test: Add a new test for pxb-pcie for arm

 hw/arm/virt-acpi-build.c                    | 232 +++++++++++++++-----
 hw/arm/virt.c                               |   3 +
 include/hw/arm/virt.h                       |   7 +
 tests/data/acpi/virt/DSDT.pxb               | Bin 0 -> 8048 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 +
 tests/qtest/bios-tables-test.c              |  54 ++++-
 6 files changed, 233 insertions(+), 64 deletions(-)
 create mode 100644 tests/data/acpi/virt/DSDT.pxb

--=20
2.19.1



