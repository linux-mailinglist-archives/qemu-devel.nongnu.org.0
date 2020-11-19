Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281EF2B89E3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 02:55:28 +0100 (CET)
Received: from localhost ([::1]:43968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfZAV-0004VI-8A
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 20:55:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kfZ6H-0008Jb-IQ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 20:51:05 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kfZ6E-0003NL-0Y
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 20:51:05 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cc2gk622VzkWxQ;
 Thu, 19 Nov 2020 09:50:26 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 19 Nov 2020
 09:50:36 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v10 0/9] pci_expander_brdige:acpi: Support pxb-pcie for ARM
Date: Thu, 19 Nov 2020 09:48:32 +0800
Message-ID: <20201119014841.7298-1-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=cenjiahui@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 20:50:47
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, Peter Maydell <peter.maydell@linaro.org>,
 Jiahui Cen <cenjiahui@huawei.com>, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, miaoyubo@huawei.com,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes with v9
v9->v10:
Refactor patch2 to drop useless macros and variables.
Split patch2 into two patches.

Changes with v8
v8->v9:
Rebase to master

Changes with v7
v7->v8:
Fix the error:no member named 'fw_cfg' in 'struct PCMachineState'

Changes with v6
v6->v7:
Refactor fw_cfg_write_extra_pci_roots
Add API PCI_GET_PCIE_HOST_STATE
Fix typos

Changes with v5
v5->v6: stat crs_range_insert in aml_build.h

Changes with v4
v4->v5: Not using specific resources for PXB.
Instead, the resources for pxb are composed of the bar space of the
pci-bridge/pcie-root-port behined it and the config space of devices
behind it.

Only if the bios(uefi for arm) support multiple roots,
configure space of devices behind pxbs could be obtained.
The newest uefi work is updated for discussion by the following link:
https://edk2.groups.io/g/devel/topic/78135572#67173
[PATCH v2 0/4] Add extra pci roots support for Arm

Currently pxb-pcie is not supported by arm,
the reason for it is pxb-pcie is not described in DSDT table
and only one main host bridge is described in acpi tables,
which means it is not impossible to present different io numas
for different devices.

This series of patches make arm to support PXB-PCIE.

Users can configure pxb-pcie with certain numa, Example command
is:

   -device pxb-pcie,id=pci.7,bus_nr=128,numa_node=0,bus=pcie.0,addr=0x9

Jiahui Cen (2):
  fw_cfg: Refactor extra pci roots addition
  hw/arm/virt: Write extra pci roots into fw_cfg

Yubo Miao (7):
  acpi/gpex: Extract two APIs from acpi_dsdt_add_pci
  acpi: Extract crs build form acpi_build.c
  acpi/gpex: Build tables for pxb
  acpi: Align the size to 128k
  unit-test: The files changed.
  unit-test: Add testcase for pxb
  unit-test: Add the binary file and clear diff.h

 hw/acpi/aml-build.c            | 285 +++++++++++++++++++
 hw/arm/virt-acpi-build.c       |  31 ++-
 hw/arm/virt.c                  |   7 +-
 hw/i386/acpi-build.c           | 293 --------------------
 hw/i386/pc.c                   |  18 +-
 hw/nvram/fw_cfg.c              |  23 ++
 hw/pci-host/gpex-acpi.c        | 166 +++++++----
 include/hw/acpi/aml-build.h    |  22 ++
 include/hw/arm/virt.h          |   1 +
 include/hw/nvram/fw_cfg.h      |   9 +
 include/hw/pci-host/gpex.h     |   1 +
 tests/data/acpi/virt/DSDT.pxb  | Bin 0 -> 7802 bytes
 tests/qtest/bios-tables-test.c |  58 +++-
 13 files changed, 545 insertions(+), 369 deletions(-)
 create mode 100644 tests/data/acpi/virt/DSDT.pxb

-- 
2.28.0


