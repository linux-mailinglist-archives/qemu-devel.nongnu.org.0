Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B8E4BA798
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:58:39 +0100 (CET)
Received: from localhost ([::1]:42472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKl38-0002RP-Ep
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:58:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nKks9-0001tZ-MS; Thu, 17 Feb 2022 12:47:17 -0500
Received: from mga12.intel.com ([192.55.52.136]:31708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nKks7-0007HN-FG; Thu, 17 Feb 2022 12:47:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645120035; x=1676656035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7aWLCfqEH3wAS3DoQMecZFpKqBM6WmO2oK099Wc0338=;
 b=Q7KanCnp24TWmU9dEPQEVWJ+IscBpCVkFD6NLD3D7tSsK431h9DMH5Ba
 rmXJ6659JEn/RyRm6/J3HnYNuv/NeN4Zch8GU3PG/wHvZZGqbmEmWHstp
 alSJ2mkE41Y+aab1m0bKpIKxm1k3YyaQAtNKZW5D/MtAQIrCO9TzeWWdO
 I+RRNHR6iW1QT4z17AHLgQCSZUhjOiK/FTPamKtyyeYxQUXkw3VylbKpi
 rwC51h/LaTulQlZw6cDTJUyA93TtrdTPuiJmD0sj40c8q6J6OrnJvwbBG
 G7QXCw3GfD9vTQTSq+fXMXmZ7k1Ol/eHxwRW0QsuoaDDcwtOWfVCV5RdI g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="230894045"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="230894045"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:46:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="545746004"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:46:48 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/15] pcie: Add some SR/IOV API documentation in
 docs/pcie_sriov.txt
Date: Thu, 17 Feb 2022 18:44:51 +0100
Message-Id: <20220217174504.1051716-3-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Knut Omang <knuto@ifi.uio.no>
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
index 00000000000..f5e891e1d45
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


