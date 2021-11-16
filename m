Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96D3453675
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:55:09 +0100 (CET)
Received: from localhost ([::1]:39822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0nc-0007yJ-Go
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:55:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mn0lc-0005Vl-6N; Tue, 16 Nov 2021 10:53:04 -0500
Received: from mga04.intel.com ([192.55.52.120]:64383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mn0la-0007ek-GM; Tue, 16 Nov 2021 10:53:03 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="232438843"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="232438843"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 07:52:59 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="454494332"
Received: from lgieryk-lnx.igk.intel.com ([172.22.230.153])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 07:52:57 -0800
From: =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/15] pcie: Add some SR/IOV API documentation in
 docs/pcie_sriov.txt
Date: Tue, 16 Nov 2021 16:34:33 +0100
Message-Id: <20211116153446.317143-3-lukasz.gieryk@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, Knut Omang <knuto@ifi.uio.no>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Knut Omang <knut.omang@oracle.com>

Add a small intro + minimal documentation for how to
implement SR/IOV support for an emulated device.

Signed-off-by: Knut Omang <knuto@ifi.uio.no>
---
 docs/pcie_sriov.txt | 115 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 docs/pcie_sriov.txt

diff --git a/docs/pcie_sriov.txt b/docs/pcie_sriov.txt
new file mode 100644
index 0000000000..f5e891e1d4
--- /dev/null
+++ b/docs/pcie_sriov.txt
@@ -0,0 +1,115 @@
+PCI SR/IOV EMULATION SUPPORT
+============================
+
+Description
+===========
+SR/IOV (Single Root I/O Virtualization) is an optional extended capability
+of a PCI Express device. It allows a single physical function (PF) to appear as multiple
+virtual functions (VFs) for the main purpose of eliminating software
+overhead in I/O from virtual machines.
+
+Qemu now implements the basic common functionality to enable an emulated device
+to support SR/IOV. Yet no fully implemented devices exists in Qemu, but a
+proof-of-concept hack of the Intel igb can be found here:
+
+git://github.com/knuto/qemu.git sriov_patches_v5
+
+Implementation
+==============
+Implementing emulation of an SR/IOV capable device typically consists of
+implementing support for two types of device classes; the "normal" physical device
+(PF) and the virtual device (VF). From Qemu's perspective, the VFs are just
+like other devices, except that some of their properties are derived from
+the PF.
+
+A virtual function is different from a physical function in that the BAR
+space for all VFs are defined by the BAR registers in the PFs SR/IOV
+capability. All VFs have the same BARs and BAR sizes.
+
+Accesses to these virtual BARs then is computed as
+
+   <VF BAR start> + <VF number> * <BAR sz> + <offset>
+
+From our emulation perspective this means that there is a separate call for
+setting up a BAR for a VF.
+
+1) To enable SR/IOV support in the PF, it must be a PCI Express device so
+   you would need to add a PCI Express capability in the normal PCI
+   capability list. You might also want to add an ARI (Alternative
+   Routing-ID Interpretation) capability to indicate that your device
+   supports functions beyond it's "own" function space (0-7),
+   which is necessary to support more than 7 functions, or
+   if functions extends beyond offset 7 because they are placed at an
+   offset > 1 or have stride > 1.
+
+   ...
+   #include "hw/pci/pcie.h"
+   #include "hw/pci/pcie_sriov.h"
+
+   pci_your_pf_dev_realize( ... )
+   {
+      ...
+      int ret = pcie_endpoint_cap_init(d, 0x70);
+      ...
+      pcie_ari_init(d, 0x100, 1);
+      ...
+
+      /* Add and initialize the SR/IOV capability */
+      pcie_sriov_pf_init(d, 0x200, "your_virtual_dev",
+                       vf_devid, initial_vfs, total_vfs,
+                       fun_offset, stride);
+
+      /* Set up individual VF BARs (parameters as for normal BARs) */
+      pcie_sriov_pf_init_vf_bar( ... )
+      ...
+   }
+
+   For cleanup, you simply call:
+
+      pcie_sriov_pf_exit(device);
+
+   which will delete all the virtual functions and associated resources.
+
+2) Similarly in the implementation of the virtual function, you need to
+   make it a PCI Express device and add a similar set of capabilities
+   except for the SR/IOV capability. Then you need to set up the VF BARs as
+   subregions of the PFs SR/IOV VF BARs by calling
+   pcie_sriov_vf_register_bar() instead of the normal pci_register_bar() call:
+
+   pci_your_vf_dev_realize( ... )
+   {
+      ...
+      int ret = pcie_endpoint_cap_init(d, 0x60);
+      ...
+      pcie_ari_init(d, 0x100, 1);
+      ...
+      memory_region_init(mr, ... )
+      pcie_sriov_vf_register_bar(d, bar_nr, mr);
+      ...
+   }
+
+Testing on Linux guest
+======================
+The easiest is if your device driver supports sysfs based SR/IOV
+enabling. Support for this was added in kernel v.3.8, so not all drivers
+support it yet.
+
+To enable 4 VFs for a device at 01:00.0:
+
+	modprobe yourdriver
+	echo 4 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
+
+You should now see 4 VFs with lspci.
+To turn SR/IOV off again - the standard requires you to turn it off before you can enable
+another VF count, and the emulation enforces this:
+
+	echo 0 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
+
+Older drivers typically provide a max_vfs module parameter
+to enable it at load time:
+
+	modprobe yourdriver max_vfs=4
+
+To disable the VFs again then, you simply have to unload the driver:
+
+	rmmod yourdriver
-- 
2.25.1


