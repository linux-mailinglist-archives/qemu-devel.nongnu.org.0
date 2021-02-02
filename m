Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50A130B45D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 02:02:42 +0100 (CET)
Received: from localhost ([::1]:41220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6k5Z-0001We-JE
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 20:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k36-00088m-9R
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:00:08 -0500
Received: from mga18.intel.com ([134.134.136.126]:33362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k2z-0001oN-Uj
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:00:08 -0500
IronPort-SDR: w+pBhj6NHxjumwgY7RRFhE526d+/8xhX+iFsFSOrEP1vcoupQO/NR6c2yLCGTGrFlhcjczDSHI
 WmM1Y1MDn6gg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="168457073"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="168457073"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 16:59:53 -0800
IronPort-SDR: pf1QD9hHUc1+K5uUWufVN4/kqPF43fuGAzWHrk3/HszAMrSetH4N1JPM86O7qXtKxi6uXLo696
 wKOJEyN4bW3Q==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="581764021"
Received: from jambrizm-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.133.15])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 16:59:52 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 00/31] CXL 2.0 Support
Date: Mon,  1 Feb 2021 16:59:17 -0800
Message-Id: <20210202005948.241655-1-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=ben.widawsky@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Ben Widawsky <ben.widawsky@intel.com>, David Hildenbrand <david@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 "John Groves \(jgroves\)" <jgroves@micron.com>,
 Chris Browy <cbrowy@avery-design.com>, Markus Armbruster <armbru@redhat.com>,
 linux-cxl@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Major changes since v2 [1]:
 * Removed all register endian/alignment/size checking. Using core functionality
   instead. This untested on big endian hosts, but Should Work(tm).
 * Fix component capability header generation (off by 1).
 * Fixed HDM programming (multiple issues).
 * Fixed timestamp command implementations.
 * Added commands: GET_FIRMWARE_UPDATE_INFO, GET_PARTITION_INFO, GET_LSA, SET_LSA

Things have remained fairly stable since since v2. The biggest change here is
definitely the HDM programming which has received limited (but not 0) testing in
the Linux driver.

Jonathan Cameron has gotten this patch series working on ARM [2], and added some
much sought after functionality [3].

---

I've started #cxl on OFTC IRC for discussion. Please feel free to use that
channel for questions or suggestions in addition to #qemu.

---

Introduce emulation of Compute Express Link 2.0
(https://www.computeexpresslink.org/). Specifically, add support for Type 3
memory expanders with persistent memory.

The emulation has been critical to get the Linux enabling started [4], it would
be an ideal place to land regression tests for different topology handling, and
there may be applications for this emulation as a way for a guest to manipulate
its address space relative to different performance memories.

Three of the five CXL component types are emulated with some level of
functionality: host bridge, root port, and memory device. All components and
devices implement basic MMIO. Devices/memory devices implement the mailbo
interface. Basic ACPI support is also included. Upstream ports and downstream
ports aren't implemented (the two components needed to make up a switch).

CXL 2.0 is built on top of PCIe (see spec for details). As a result, much of the
implementation utilizes existing PCI paradigms. To implement the host bridge,
I've chosen to use PXB (PCI Expander Bridge). It seemed to be the most natural
fit even though it doesn't directly map to how hardware will work. For
persistent capacity of the memory device, I utilized the memory subsystem
(hw/mem).

We have 3 reasons why this work is valuable:
1. Linux driver feature development benefits from emulation both due to a lack
   of initial hardware availability, but also, as is seen with NVDIMM/PMEM
   emulation, there is value in being able to share topologies with
   system-software developers even after hardware is available.

2. The Linux kernel's unit test suite for NVDIMM/PMEM ended up injecting fake
   resources via custom modules (nfit_test). In retrospect a QEMU emulation of
   nfit_test capabilities would have made the test environment more portable,
   and allowed for easier community contributions of example configurations.

3. This is still being fleshed out, but in short it provides a standardized
   mechanism for the guest to provide feedback to the host about size and
   placement needs of the memory. After the host gives the guest a physical
   window mapping to the CXL device, the emulated HDM decoders allow the guest a
   way to tell the host how much it wants and where. There are likely simpler
   ways to do this, but they'd require inventing a new interface and you'd need
   to have diverging driver code in the guest programming of the HDM decoder vs.
   the host. Since we've already done this work, why not use it?

There is quite a long list of work to do for full spec compliance, but I don't
believe that any of it precludes merging. Off the top of my head:
- Main host bridge support (WIP)
- Interleaving
- Better Tests
- Hot plug support
- Emulating volatile capacity
- CDAT emulation [3]

The flow of the patches in general is to define all the data structures and
registers associated with the various components in a top down manner. Host
bridge, component, ports, devices. Then, the actual implementation is done in
the same order.

The summary is:
1-5: Infrastructure for component and device emulation
6-9: Basic mailbox command implementations
10-19: Implement CXL host bridges as PXB devices
20: Implement a root port
21-22: Implement a memory device
23-26: ACPI bits
27-29: Add some more advanced mailbox command implementations
30: Start working on enabling the main host bridge
31: Basic test case

---

[1]: https://lore.kernel.org/qemu-devel/20210105165323.783725-1-ben.widawsky@intel.com/
[2]: https://lore.kernel.org/qemu-devel/20210201152655.31027-1-Jonathan.Cameron@huawei.com/
[3]: https://lore.kernel.org/qemu-devel/20210201151629.29656-1-Jonathan.Cameron@huawei.com/
[4]: https://lore.kernel.org/linux-cxl/20210130002438.1872527-1-ben.widawsky@intel.com/

---

Ben Widawsky (31):
  hw/pci/cxl: Add a CXL component type (interface)
  hw/cxl/component: Introduce CXL components (8.1.x, 8.2.5)
  hw/cxl/device: Introduce a CXL device (8.2.8)
  hw/cxl/device: Implement the CAP array (8.2.8.1-2)
  hw/cxl/device: Implement basic mailbox (8.2.8.4)
  hw/cxl/device: Add memory device utilities
  hw/cxl/device: Add cheap EVENTS implementation (8.2.9.1)
  hw/cxl/device: Timestamp implementation (8.2.9.3)
  hw/cxl/device: Add log commands (8.2.9.4) + CEL
  hw/pxb: Use a type for realizing expanders
  hw/pci/cxl: Create a CXL bus type
  hw/pxb: Allow creation of a CXL PXB (host bridge)
  qtest: allow DSDT acpi table changes
  acpi/pci: Consolidate host bridge setup
  tests/acpi: remove stale allowed tables
  hw/pci: Plumb _UID through host bridges
  hw/cxl/component: Implement host bridge MMIO (8.2.5, table 142)
  acpi/pxb/cxl: Reserve host bridge MMIO
  hw/pxb/cxl: Add "windows" for host bridges
  hw/cxl/rp: Add a root port
  hw/cxl/device: Add a memory device (8.2.8.5)
  hw/cxl/device: Implement MMIO HDM decoding (8.2.5.12)
  acpi/cxl: Add _OSC implementation (9.14.2)
  tests/acpi: allow CEDT table addition
  acpi/cxl: Create the CEDT (9.14.1)
  tests/acpi: Add new CEDT files
  hw/cxl/device: Add some trivial commands
  hw/cxl/device: Plumb real LSA sizing
  hw/cxl/device: Implement get/set LSA
  qtest/cxl: Add very basic sanity tests
  WIP: i386/cxl: Initialize a host bridge

 MAINTAINERS                         |   6 +
 hw/Kconfig                          |   1 +
 hw/acpi/Kconfig                     |   5 +
 hw/acpi/cxl.c                       | 173 ++++++++++
 hw/acpi/meson.build                 |   1 +
 hw/arm/virt.c                       |   1 +
 hw/core/machine.c                   |  26 ++
 hw/core/numa.c                      |   3 +
 hw/cxl/Kconfig                      |   3 +
 hw/cxl/cxl-component-utils.c        | 208 ++++++++++++
 hw/cxl/cxl-device-utils.c           | 264 +++++++++++++++
 hw/cxl/cxl-mailbox-utils.c          | 498 ++++++++++++++++++++++++++++
 hw/cxl/meson.build                  |   5 +
 hw/i386/acpi-build.c                |  87 ++++-
 hw/i386/microvm.c                   |   1 +
 hw/i386/pc.c                        |   2 +
 hw/mem/Kconfig                      |   5 +
 hw/mem/cxl_type3.c                  | 405 ++++++++++++++++++++++
 hw/mem/meson.build                  |   1 +
 hw/meson.build                      |   1 +
 hw/pci-bridge/Kconfig               |   5 +
 hw/pci-bridge/cxl_root_port.c       | 231 +++++++++++++
 hw/pci-bridge/meson.build           |   1 +
 hw/pci-bridge/pci_expander_bridge.c | 209 +++++++++++-
 hw/pci-bridge/pcie_root_port.c      |   6 +-
 hw/pci/pci.c                        |  32 +-
 hw/pci/pcie.c                       |  30 ++
 hw/ppc/spapr.c                      |   2 +
 include/hw/acpi/cxl.h               |  27 ++
 include/hw/boards.h                 |   2 +
 include/hw/cxl/cxl.h                |  29 ++
 include/hw/cxl/cxl_component.h      | 187 +++++++++++
 include/hw/cxl/cxl_device.h         | 255 ++++++++++++++
 include/hw/cxl/cxl_pci.h            | 160 +++++++++
 include/hw/pci/pci.h                |  15 +
 include/hw/pci/pci_bridge.h         |  25 ++
 include/hw/pci/pci_bus.h            |   8 +
 include/hw/pci/pci_ids.h            |   1 +
 monitor/hmp-cmds.c                  |  15 +
 qapi/machine.json                   |   1 +
 tests/data/acpi/pc/CEDT             | Bin 0 -> 36 bytes
 tests/data/acpi/pc/DSDT             | Bin 5065 -> 5065 bytes
 tests/data/acpi/pc/DSDT.acpihmat    | Bin 6390 -> 6390 bytes
 tests/data/acpi/pc/DSDT.bridge      | Bin 6924 -> 6924 bytes
 tests/data/acpi/pc/DSDT.cphp        | Bin 5529 -> 5529 bytes
 tests/data/acpi/pc/DSDT.dimmpxm     | Bin 6719 -> 6719 bytes
 tests/data/acpi/pc/DSDT.hpbridge    | Bin 5026 -> 5026 bytes
 tests/data/acpi/pc/DSDT.hpbrroot    | Bin 3084 -> 3084 bytes
 tests/data/acpi/pc/DSDT.ipmikcs     | Bin 5137 -> 5137 bytes
 tests/data/acpi/pc/DSDT.memhp       | Bin 6424 -> 6424 bytes
 tests/data/acpi/pc/DSDT.numamem     | Bin 5071 -> 5071 bytes
 tests/data/acpi/pc/DSDT.roothp      | Bin 5261 -> 5261 bytes
 tests/data/acpi/q35/CEDT            | Bin 0 -> 36 bytes
 tests/data/acpi/q35/DSDT            | Bin 7801 -> 7801 bytes
 tests/data/acpi/q35/DSDT.acpihmat   | Bin 9126 -> 9126 bytes
 tests/data/acpi/q35/DSDT.bridge     | Bin 7819 -> 7819 bytes
 tests/data/acpi/q35/DSDT.cphp       | Bin 8265 -> 8265 bytes
 tests/data/acpi/q35/DSDT.dimmpxm    | Bin 9455 -> 9455 bytes
 tests/data/acpi/q35/DSDT.ipmibt     | Bin 7876 -> 7876 bytes
 tests/data/acpi/q35/DSDT.memhp      | Bin 9160 -> 9160 bytes
 tests/data/acpi/q35/DSDT.mmio64     | Bin 8932 -> 8932 bytes
 tests/data/acpi/q35/DSDT.numamem    | Bin 7807 -> 7807 bytes
 tests/qtest/cxl-test.c              |  93 ++++++
 tests/qtest/meson.build             |   4 +
 64 files changed, 3004 insertions(+), 30 deletions(-)
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
 create mode 100644 tests/data/acpi/pc/CEDT
 create mode 100644 tests/data/acpi/q35/CEDT
 create mode 100644 tests/qtest/cxl-test.c

-- 
2.30.0


