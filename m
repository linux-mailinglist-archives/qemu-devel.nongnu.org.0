Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F428C358
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 23:12:18 +0200 (CEST)
Received: from localhost ([::1]:55508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxe5Z-00025Q-Mm
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 17:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41622)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe0q-0004c4-Oj
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 17:07:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe0o-00011Z-LA
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 17:07:24 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2185 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe0l-0000nd-CX; Tue, 13 Aug 2019 17:07:19 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 77A69E18A6D498EEF8A0;
 Wed, 14 Aug 2019 05:07:11 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.94.0) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 14 Aug 2019 05:07:02 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 13 Aug 2019 22:05:27 +0100
Message-ID: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.94.0]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [PATCH-for-4.2 v9 00/12] ARM virt: ACPI memory hotplug
 support
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is an attempt to provide device memory hotplug support 
on ARM virt platform. This is based on Eric's recent works here[1]
and carries some of the pc-dimm related patches dropped from his
series.

The kernel support for arm64 memory hot add was added recently by
Robin and hence the guest kernel should be => 5.0-rc1.

NVDIM support is not included currently as we still have an unresolved
issue while hot adding NVDIMM[2]. However NVDIMM cold plug patches
can be included, but not done for now, for keeping it simple.

This makes use of GED device to sent hotplug ACPI events to the
Guest. GED code is based on Nemu. Thanks to the efforts of Samuel and
Sebastien to add the hardware-reduced support to Nemu using GED
device[3]. (Please shout if I got the author/signed-off wrong for
those patches or missed any names).

This is sanity tested on a HiSilicon ARM64 platform and appreciate
any further testing.

Note:
Attempted adding dimm_pxm test case to bios-tables-test for arm/virt.
But noticed the issue decribed here[5]. This is under investigation 
now.

Thanks,
Shameer

[1] https://patchwork.kernel.org/cover/10837565/
[2] https://patchwork.kernel.org/cover/10783589/
[3] https://github.com/intel/nemu/blob/topic/virt-x86/hw/acpi/ged.c
[4] http://lists.infradead.org/pipermail/linux-arm-kernel/2019-May/651763.html
[5] https://www.mail-archive.com/qemu-devel@nongnu.org/msg632651.html

v8 --> v9
 -Changes related to GED being a TYPE_SYS_BUS_DEVICE now.
 -Re-arranged patches 8 and 9.
 -Added GED ABI documentation(patch #10).
 -Added numamem and memhp tests to arm/virt(#11 and #12)
 -Dropped few R-by tags as code has changed a bit.
 -Please see Individual patch history for details.
 
v7 --> v8
 -Addressed comments from Igor.Please see individual patches.
 -Updated bios-tables-test-allowed-diff.h to avoid "make check"
  failure (patch #6) and dropped patch #10
 -Added Igor's R-by to patches 4 & 5.
 -Dropped Erics's R-by from patch #9 for now.

v6 --> v7
- Added 4.2 machine support and restricted GED creation for < 4.2
  This is to address the migration test fail reported by Eric.
- Included "tests: Update DSDT ACPI table.." patch(#10) from Eric
  to fix the "make check" bios-tables-test failure.
  
v5 --> v6

-Addressed comments from Eric.
-Added R-by from Eric and Igor.

v4 --> v5
-Removed gsi/ged-irq routing in virt.
-Added Migration support.
-Dropped support for DT coldplug case based on the discussions
 here[4]
-Added system_powerdown support through GED.

v3 --> v4
Addressed comments from Igor and Eric,
-Renamed "virt-acpi" to "acpi-ged".
-Changed ged device parent to TYPE_DEVICE.
-Introduced DT memory node property "hotpluggable" to resolve device
 memory being treated as early boot memory issue(patch #7).
-Combined patches #3 and #9 from v3 into #3.

v2 --> v3

Addressed comments from Igor and Eric,
-Made virt acpi device platform independent and moved
 to hw/acpi/generic_event_device.c
-Moved ged specific code into hw/acpi/generic_event_device.c
-Introduced an opt-in feature "fdt" to resolve device-memory being
 treated as early boot memory.
-Dropped patch #1 from v2.

RFC --> v2

-Use GED device instead of GPIO for ACPI hotplug events.
-Removed NVDIMM support for now.
-Includes dropped patches from Eric's v9 series.

Eric Auger (1):
  hw/arm/virt: Add memory hotplug framework

Samuel Ortiz (2):
  hw/acpi: Do not create memory hotplug method when handler is not
    defined
  hw/acpi: Add ACPI Generic Event Device Support

Shameer Kolothum (9):
  hw/acpi: Make ACPI IO address space configurable
  hw/arm/virt: Add 4.2 machine type
  hw/arm/virt: Enable device memory cold/hot plug with ACPI boot
  hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
  hw/arm: Factor out powerdown notifier from GPIO
  hw/arm: Use GED for system_powerdown event
  docs/specs: Add ACPI GED documentation
  tests: add dummy ACPI tables for arm/virt board
  tests: Add bios tests to arm/virt

 docs/specs/acpi_hw_reduced_hotplug.txt |  60 +++++
 hw/acpi/Kconfig                        |   4 +
 hw/acpi/Makefile.objs                  |   1 +
 hw/acpi/generic_event_device.c         | 324 +++++++++++++++++++++++++
 hw/acpi/memory_hotplug.c               |  39 +--
 hw/arm/Kconfig                         |   4 +
 hw/arm/virt-acpi-build.c               |  31 ++-
 hw/arm/virt.c                          | 136 ++++++++++-
 hw/core/machine.c                      |   3 +
 hw/i386/acpi-build.c                   |   4 +-
 hw/i386/pc.c                           |   3 +
 include/hw/acpi/acpi_dev_interface.h   |   1 +
 include/hw/acpi/generic_event_device.h | 103 ++++++++
 include/hw/acpi/memory_hotplug.h       |   9 +-
 include/hw/arm/virt.h                  |   5 +
 include/hw/boards.h                    |   3 +
 include/hw/i386/pc.h                   |   3 +
 tests/bios-tables-test-allowed-diff.h  |   2 +
 tests/bios-tables-test.c               |  49 ++++
 tests/data/acpi/virt/SLIT              | Bin 0 -> 48 bytes
 tests/data/acpi/virt/SRAT              | Bin 0 -> 224 bytes
 21 files changed, 746 insertions(+), 38 deletions(-)
 create mode 100644 docs/specs/acpi_hw_reduced_hotplug.txt
 create mode 100644 hw/acpi/generic_event_device.c
 create mode 100644 include/hw/acpi/generic_event_device.h
 create mode 100644 tests/data/acpi/virt/SLIT
 create mode 100644 tests/data/acpi/virt/SRAT

-- 
2.17.1



