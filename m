Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBB35435CE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:01:03 +0200 (CEST)
Received: from localhost ([::1]:37308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyxB8-0004tH-DZ
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nyx4y-00071D-4U
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:54:40 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nyx4v-00064J-CB
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:54:39 -0400
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LJ9C90sXNz6872x;
 Wed,  8 Jun 2022 22:51:01 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 16:54:33 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 15:54:32 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v3 0/8] hw/cxl: Move CXL emulation options and state to
 machines.
Date: Wed, 8 Jun 2022 15:54:32 +0100
Message-ID: <20220608145440.26106-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml703-chm.china.huawei.com (10.201.108.52) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

Changes since v2: (reviews from Davidlohr and Ben - thanks!)
- Update qemu-options.hx to reflect that cxl-fmw is now a machine
  property. (Davidlohr Bueso)
- Pick up David (patch 1) and Ben's RBs (all).

Changes since v1 (thanks to Paolo Bonzini)
* Update 'description' of cxl-fmw as suggested to mention it's an array.
* Add a wrapper cxl_hook_up_pxb_registers() to cxl-host.c as it'll be common
  for all machines using CXL with PXB.

V1 Cover letter:

Currently the only machine with CXL support upstream is i386/pc but arm/virt
patches have been posted and once this is merged an updated series will
follow. Switch support is queued behind this as well because they both
include documentation updates.

Paolo Bonzini highlighted a couple of issues with the current CXL
emulation code.

* Top level parameter rather than machine for fixed memory windows

  The --cxl-fixed-memory-window top level command line parameters won't play
  well with efforts to make it possible to instantiate entire machines via
  RPC. Better to move these to be machine configuration.  This change is
  relatively straight forward, but does result in very long command lines
  (cannot break fixed window setup into multiple -M entries).

* Move all CXL stuff to machine specific code and helpers

  To simplify the various interactions between machine setup and host
  bridges etc, currently various CXL steps are called from the generic
  core/machine.c and softmmu/vl.c + there are CXL elements in MachineState.

  Much of this is straight forward to do with one exception:
  The CXL pci_expander_bridge host bridges require MMIO register space.
  This series does this by walking the bus and filling the register space
  in via the machine_done callback. This is similar to the walk done for
  identifying host bridges in the ACPI building code but it is rather ugly
  and postpones rejection of PXB_CXL instances where cxl=off (default).

All comments welcome, but the first patch at least changes the command-line
so to avoid have to add backwards compatibility code, it would be great
to merge that before 7.1 is released.

Thanks,

Jonathan

Jonathan Cameron (8):
  hw/cxl: Make the CXL fixed memory window setup a machine parameter.
  hw/acpi/cxl: Pass in the CXLState directly rather than MachineState
  hw/cxl: Push linking of CXL targets into i386/pc rather than in
    machine.c
  tests/acpi: Allow modification of q35 CXL CEDT table.
  pci/pci_expander_bridge: For CXL HB delay the HB register memory
    region setup.
  tests/acpi: Update q35/CEDT.cxl for new memory addresses.
  hw/cxl: Move the CXLState from MachineState to machine type specific
    state.
  hw/machine: Drop cxl_supported flag as no longer useful

 docs/system/devices/cxl.rst                 |   4 +-
 hw/acpi/cxl.c                               |   9 +-
 hw/core/machine.c                           |  28 ------
 hw/cxl/cxl-host-stubs.c                     |   9 +-
 hw/cxl/cxl-host.c                           | 100 ++++++++++++++++++--
 hw/i386/acpi-build.c                        |   8 +-
 hw/i386/pc.c                                |  31 +++---
 hw/pci-bridge/meson.build                   |   5 +-
 hw/pci-bridge/pci_expander_bridge.c         |  32 ++++---
 hw/pci-bridge/pci_expander_bridge_stubs.c   |  14 +++
 include/hw/acpi/cxl.h                       |   5 +-
 include/hw/boards.h                         |   3 +-
 include/hw/cxl/cxl.h                        |   9 +-
 include/hw/cxl/cxl_host.h                   |  23 +++++
 include/hw/i386/pc.h                        |   2 +
 include/hw/pci-bridge/pci_expander_bridge.h |  12 +++
 qapi/machine.json                           |  13 +++
 qemu-options.hx                             |  73 +++++++-------
 softmmu/vl.c                                |  46 ---------
 tests/data/acpi/q35/CEDT.cxl                | Bin 184 -> 184 bytes
 tests/qtest/bios-tables-test.c              |   4 +-
 tests/qtest/cxl-test.c                      |   4 +-
 22 files changed, 256 insertions(+), 178 deletions(-)
 create mode 100644 hw/pci-bridge/pci_expander_bridge_stubs.c
 create mode 100644 include/hw/cxl/cxl_host.h
 create mode 100644 include/hw/pci-bridge/pci_expander_bridge.h

-- 
2.32.0


