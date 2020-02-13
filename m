Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B626315BFAC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 14:47:08 +0100 (CET)
Received: from localhost ([::1]:52588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2Epf-00007k-H9
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 08:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58092)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <miaoyubo@huawei.com>) id 1j29GL-00029X-3Y
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 02:50:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <miaoyubo@huawei.com>) id 1j29GK-0000vL-0j
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 02:50:16 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:44314 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <miaoyubo@huawei.com>) id 1j29GJ-0000ph-L3
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 02:50:15 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BD8D327E415507F86BFD;
 Thu, 13 Feb 2020 15:50:06 +0800 (CST)
Received: from DESKTOP-D7EVK5B.china.huawei.com (10.173.221.29) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Thu, 13 Feb 2020 15:49:58 +0800
From: Yubo Miao <miaoyubo@huawei.com>
To: <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>
Subject: [RFC 0/2] pci_expander_brdige:acpi:Support pxb-pcie for ARM
Date: Thu, 13 Feb 2020 15:49:50 +0800
Message-ID: <20200213074952.544-1-miaoyubo@huawei.com>
X-Mailer: git-send-email 2.24.1.windows.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.29]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
X-Mailman-Approved-At: Thu, 13 Feb 2020 08:44:55 -0500
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
Cc: imammedo@redhat.com, miaoyubo@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: miaoyubo <miaoyubo@huawei.com>

Currently pxb-pcie is not supported by arm and only one
main host bridge is described in acpi tables, which means
it is not impossible to present different io numas for different
devices. This series of patches make arm to support PXB-PCIE.

Users can configure pxb-pcie with certain numa, Example command
is:

   -device pxb-pcie,id=3Dpci.7,bus_nr=3D128,numa_node=3D0,bus=3Dpcie.0,ad=
dr=3D0x9

Since devices could not be plugged into pxb-pcie directly, one
pcie-root-port is auto plugged into the pxb, therefore, the devices
could be plugged into pxb-pcie.

With the patches,io numa could be presented to the guest by define a pxb-=
pcie
with the numa and plug the device into the pxb-pcie.

miaoyubo (2):
  arm: acpi: pci-expender-bus: Make arm to support PXB-PCIE
  pci-expender-bus:Add pcie-root-port to pxb-pcie under arm.

 hw/arm/virt-acpi-build.c            | 234 ++++++++++++++++++++++++++--
 hw/pci-bridge/pci_expander_bridge.c |   9 ++
 hw/pci-host/gpex.c                  |   4 +
 include/hw/arm/virt.h               |   1 +
 include/hw/pci/pcie_port.h          |   1 +
 5 files changed, 238 insertions(+), 11 deletions(-)

--=20
2.19.1



