Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4202AE867
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 06:49:39 +0100 (CET)
Received: from localhost ([::1]:43594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcj0k-0005WK-4d
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 00:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyn-0003qf-DW
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:37 -0500
Received: from mga14.intel.com ([192.55.52.115]:60776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyk-0008P1-W4
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:37 -0500
IronPort-SDR: Sdu6icWtjqlUn2cSFA14OPG4Hw9siUQ9kW/4FJSpCcaUgudK3dxLtTO/rRLKzztxO1lHs5SO6R
 p74p5DybmVVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169314657"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="169314657"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:27 -0800
IronPort-SDR: npeW6Hk5XzvH0AOUua3iylNewKMWq+T0e8RVr657Rh27ixTFKSTs939A6vex0yYb397sJMhymS
 212FQ+5F8+qA==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308710383"
Received: from hccoutan-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.131.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:27 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/25] Introduce CXL 2.0 Emulation
Date: Tue, 10 Nov 2020 21:46:59 -0800
Message-Id: <20201111054724.794888-1-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=ben.widawsky@intel.com; helo=mga14.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 00:47:28
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Ben Widawsky <ben.widawsky@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce emulation of Compute Express Link 2.0, which was released
today at https://www.computeexpresslink.org/.

I've pushed a branch here: https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0

The emulation has been critical to get the Linux enabling started
(https://lore.kernel.org/linux-cxl/), it would be an ideal place to land
regression tests for different topology handling, and there may be applications
for this emulation as a way for a guest to manipulate its address space relative
to different performance memories. I am new to QEMU development, so please
forgive and point me in the right direction if I severely misinterpreted where a
piece of infrastructure belongs.

Three of the five CXL component types are emulated with some level of functionality:
host bridge, root port, and memory device. Upstream ports and downstream ports
aren't implemented (the two components needed to make up a switch).

CXL 2.0 is built on top of PCIe (see spec for details). As a result, much of the
implementation utilizes existing PCI paradigms. To implement the host bridge,
I've chosen to use PXB (PCI Expander Bridge). It seemed to be the most natural
fit even though it doesn't directly map to how hardware will work. For
persistent capacity of the memory device, I utilized the memory subsystem
(hw/mem).

We have 3 reasons why this work is valuable:
1. OS driver development and testing
2. OS driver regression testing
3. Possible guest support for HDMs

As mentioned above there are three benefits to carrying this enabling in
upstream QEMU:

1. Linux driver feature development benefits from emulation both due to
a lack of initial hardware availability, but also, as is seen with
NVDIMM/PMEM emulation, there is value in being able to share
topologies with system-software developers even after hardware is
available.

2. The Linux kernel's unit test suite for NVDIMM/PMEM ended up injecting fake
resources via custom modules (nfit_test). In retrospect a QEMU emulation of
nfit_test capabilities would have made the test environment more portable, and
allowed for easier community contributions of example configurations.

3. This is still being fleshed out, but in short it provides a standardized
mechanism for the guest to provide feedback to the host about size and placement
needs of the memory. After the host gives the guest a physical window mapping to
the CXL device, the emulated HDM decoders allow the guest a way to tell the host
how much it wants and where. There are likely simpler ways to do this, but
they'd require inventing a new interface and you'd need to have diverging driver
code in the guest programming of the HDM decoder vs. the host. Since we've
already done this work, why not use it?

There is quite a long list of work to do for full spec compliance, but I don't
believe that any of it precludes merging. Off the top of my head:
- Main host bridge support (WIP)
- Interleaving
- Better Tests
- Huge swaths of firmware functionality
- Hot plug support
- Emulating volatile capacity

The flow of the patches in general is to define all the data structures and
registers associated with the various components in a top down manner. Host
bridge, component, ports, devices. Then, the actual implementation is done in
the same order.

The summary is:
1-8: Put infrastructure in place for emulation of the components.
9-11: Create the concept of a CXL bus and plumb into PXB
12-16: Implement host bridges
17: Implement a root port
18: Implement a memory device
19: Implement HDM decoders
20-24: ACPI bits
25: Start working on enabling the main host bridge

Ben Widawsky (23):
  hw/pci/cxl: Add a CXL component type (interface)
  hw/cxl/component: Introduce CXL components (8.1.x, 8.2.5)
  hw/cxl/device: Introduce a CXL device (8.2.8)
  hw/cxl/device: Implement the CAP array (8.2.8.1-2)
  hw/cxl/device: Add device status (8.2.8.3)
  hw/cxl/device: Implement basic mailbox (8.2.8.4)
  hw/cxl/device: Add memory devices (8.2.8.5)
  hw/pxb: Use a type for realizing expanders
  hw/pci/cxl: Create a CXL bus type
  hw/pxb: Allow creation of a CXL PXB (host bridge)
  acpi/pci: Consolidate host bridge setup
  hw/pci: Plumb _UID through host bridges
  hw/cxl/component: Implement host bridge MMIO (8.2.5, table 142)
  acpi/pxb/cxl: Reserve host bridge MMIO
  hw/pxb/cxl: Add "windows" for host bridges
  hw/cxl/rp: Add a root port
  hw/cxl/device: Add a memory device (8.2.8.5)
  hw/cxl/device: Implement MMIO HDM decoding (8.2.5.12)
  acpi/cxl: Add _OSC implementation (9.14.2)
  acpi/cxl: Create the CEDT (9.14.1)
  Temp: acpi/cxl: Add ACPI0017 (CEDT awareness)
  WIP: i386/cxl: Initialize a host bridge
  qtest/cxl: Add very basic sanity tests

Jonathan Cameron (1):
  Temp: Add the PCI_EXT_ID_DVSEC definition to the qemu pci_regs.h copy.

Vishal Verma (1):
  acpi/cxl: Introduce a compat-driver UUID for CXL _OSC

 MAINTAINERS                               |   6 +
 hw/Kconfig                                |   1 +
 hw/acpi/Kconfig                           |   5 +
 hw/acpi/cxl.c                             | 198 +++++++++++++
 hw/acpi/meson.build                       |   1 +
 hw/arm/virt.c                             |   1 +
 hw/core/machine.c                         |  26 ++
 hw/core/numa.c                            |   3 +
 hw/cxl/Kconfig                            |   3 +
 hw/cxl/cxl-component-utils.c              | 192 +++++++++++++
 hw/cxl/cxl-device-utils.c                 | 293 +++++++++++++++++++
 hw/cxl/cxl-mailbox-utils.c                | 139 +++++++++
 hw/cxl/meson.build                        |   5 +
 hw/i386/acpi-build.c                      |  87 +++++-
 hw/i386/microvm.c                         |   1 +
 hw/i386/pc.c                              |   2 +
 hw/mem/Kconfig                            |   5 +
 hw/mem/cxl_type3.c                        | 334 ++++++++++++++++++++++
 hw/mem/meson.build                        |   1 +
 hw/meson.build                            |   1 +
 hw/pci-bridge/Kconfig                     |   5 +
 hw/pci-bridge/cxl_root_port.c             | 231 +++++++++++++++
 hw/pci-bridge/meson.build                 |   1 +
 hw/pci-bridge/pci_expander_bridge.c       | 209 +++++++++++++-
 hw/pci-bridge/pcie_root_port.c            |   6 +-
 hw/pci/pci.c                              |  32 ++-
 hw/pci/pcie.c                             |  30 ++
 hw/ppc/spapr.c                            |   2 +
 include/hw/acpi/cxl.h                     |  27 ++
 include/hw/boards.h                       |   2 +
 include/hw/cxl/cxl.h                      |  30 ++
 include/hw/cxl/cxl_component.h            | 181 ++++++++++++
 include/hw/cxl/cxl_device.h               | 199 +++++++++++++
 include/hw/cxl/cxl_pci.h                  | 155 ++++++++++
 include/hw/pci/pci.h                      |  15 +
 include/hw/pci/pci_bridge.h               |  25 ++
 include/hw/pci/pci_bus.h                  |   8 +
 include/hw/pci/pci_ids.h                  |   1 +
 include/standard-headers/linux/pci_regs.h |   1 +
 monitor/hmp-cmds.c                        |  15 +
 qapi/machine.json                         |   1 +
 tests/qtest/cxl-test.c                    |  93 ++++++
 tests/qtest/meson.build                   |   4 +
 43 files changed, 2547 insertions(+), 30 deletions(-)
 create mode 100644 hw/acpi/cxl.c
 create mode 100644 hw/cxl/Kconfig
 create mode 100644 hw/cxl/cxl-component-utils.c
 create mode 100644 hw/cxl/cxl-device-utils.c
 create mode 100644 hw/cxl/cxl-mailbox-utils.c
 create mode 100644 hw/cxl/meson.build
 create mode 100644 hw/mem/cxl_type3.c
 create mode 100644 hw/pci-bridge/cxl_root_port.c
 create mode 100644 include/hw/acpi/cxl.h
 create mode 100644 include/hw/cxl/cxl.h
 create mode 100644 include/hw/cxl/cxl_component.h
 create mode 100644 include/hw/cxl/cxl_device.h
 create mode 100644 include/hw/cxl/cxl_pci.h
 create mode 100644 tests/qtest/cxl-test.c

-- 
2.29.2


