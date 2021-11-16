Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE041453686
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:58:19 +0100 (CET)
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0qg-0005OG-QY
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:58:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mn0la-0005Up-LI; Tue, 16 Nov 2021 10:53:02 -0500
Received: from mga04.intel.com ([192.55.52.120]:64375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mn0lX-0007eQ-4W; Tue, 16 Nov 2021 10:53:02 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="232438836"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="232438836"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 07:52:55 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="454494304"
Received: from lgieryk-lnx.igk.intel.com ([172.22.230.153])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 07:52:53 -0800
From: =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Date: Tue, 16 Nov 2021 16:34:31 +0100
Message-Id: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the updated version of SR-IOV support for the NVMe device.

Changes since v1:
 - Dropped the "pcie: Set default and supported MaxReadReq to 512" patch.
   The original author agrees it may be no longer needed for recent
   kernels.
 - Dropped the "pcie: Add callback preceding SR-IOV VFs update" patch.
   A customized pc->config_write callback is used instead.
 - Split the "hw/nvme: Calculate BAR attributes in a function” patch into
   cleanup and update parts.
 - Reworked the configuration options related to SR-IOV.
 - Fixed nvme_update_msixcap_ts() for platform without MSIX support.
 - Updated handling of SUBSYS_SLOT_RSVD values in nvme_subsys_ctrl().
 - Updated error codes returned from the Virtualization Management
   command (DNR is set).
 - Updated typedef/enum names mismatch.
 - Few other minor tweaks and improvements.

List of known gaps and nice-to-haves:

1) Interaction of secondary controllers with namespaces is not 100%
following the spec

The limitation: VF has to be visible on the PCI bus first, and only then
such VF can have a namespace attached.

The problem is that the mapping between controller and attached
namespaces is stored in the NvmeCtrl object, and unrealized VF doesn’t
have this object allocated. There are multiple ways to address the
issue, but none of those we’ve considered so far is elegant. The fact,
that the namespace-related code area is busy (pending patches, some
rework?), doesn’t help either.


2) VFs report and support the same features as the parent PF

Due to security reasons, user of a VF should be not allowed to interact
with other VFs. Essentially, VFs should not announce and support:
Namespace Management, Attachment, corresponding Identify commands, and
maybe other features as well.


3) PMR and CMB must be disabled when SR-IOV is active

The main concern is whether PMR/CMB should be even implemented for a
device that supports SR-IOV. If the answer is yes, then another question
arises: how the feature should behave? Simulation of different devices
may require different implementation.

It's too early to get into such details, so we’ve decided to disallow
both features altogether if SR-IOV is enabled.


4) The Private Resources Mode

The NVMe Spec defines Flexible Resources as an optional feature. VFs can
alternatively support a fixed number of queues/interrupts.

This SR-IOV implementation supports Flexible Resources with the
Virtualization Management command, and a fallback to Private Resources
is not available. Support for such fallback, if there’s demand, can be
implemented later.


5) Support for Namespace Management command

Device with virtualization enhancements must support the Namespace
Management command. The command is not absolutely necessary to use
SR-IOV, but for a more complete set of features you may want to
cherry-pick this patch:
https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg03107.html
together with this fix:
https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg06734.html


Knut Omang (2):
  pcie: Add support for Single Root I/O Virtualization (SR/IOV)
  pcie: Add some SR/IOV API documentation in docs/pcie_sriov.txt

Lukasz Maniak (4):
  hw/nvme: Add support for SR-IOV
  hw/nvme: Add support for Primary Controller Capabilities
  hw/nvme: Add support for Secondary Controller List
  docs: Add documentation for SR-IOV and Virtualization Enhancements

Łukasz Gieryk (9):
  pcie: Add helpers to the SR/IOV API
  pcie: Add 1.2 version token for the Power Management Capability
  hw/nvme: Implement the Function Level Reset
  hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
  hw/nvme: Remove reg_size variable and update BAR0 size calculation
  hw/nvme: Calculate BAR attributes in a function
  hw/nvme: Initialize capability structures for primary/secondary
    controllers
  hw/nvme: Add support for the Virtualization Management command
  hw/nvme: Update the initalization place for the AER queue

 docs/pcie_sriov.txt          | 115 +++++++
 docs/system/devices/nvme.rst |  35 ++
 hw/nvme/ctrl.c               | 634 ++++++++++++++++++++++++++++++++---
 hw/nvme/ns.c                 |   2 +-
 hw/nvme/nvme.h               |  51 ++-
 hw/nvme/subsys.c             |  74 +++-
 hw/nvme/trace-events         |   6 +
 hw/pci/meson.build           |   1 +
 hw/pci/pci.c                 |  97 ++++--
 hw/pci/pcie.c                |   5 +
 hw/pci/pcie_sriov.c          | 301 +++++++++++++++++
 hw/pci/trace-events          |   5 +
 include/block/nvme.h         |  65 ++++
 include/hw/pci/pci.h         |  12 +-
 include/hw/pci/pci_ids.h     |   1 +
 include/hw/pci/pci_regs.h    |   1 +
 include/hw/pci/pcie.h        |   6 +
 include/hw/pci/pcie_sriov.h  |  75 +++++
 include/qemu/typedefs.h      |   2 +
 19 files changed, 1407 insertions(+), 81 deletions(-)
 create mode 100644 docs/pcie_sriov.txt
 create mode 100644 hw/pci/pcie_sriov.c
 create mode 100644 include/hw/pci/pcie_sriov.h

-- 
2.25.1


