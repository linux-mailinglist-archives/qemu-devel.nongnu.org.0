Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F66425921
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:18:00 +0200 (CEST)
Received: from localhost ([::1]:34296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYX1r-0004uJ-BT
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWKt-0006yf-Ly; Thu, 07 Oct 2021 12:33:35 -0400
Received: from mga06.intel.com ([134.134.136.31]:50263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWKq-0002SD-5f; Thu, 07 Oct 2021 12:33:34 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="287184241"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="287184241"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:25:46 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="624325681"
Received: from lmaniak-dev.igk.intel.com ([10.55.248.48])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:25:44 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Date: Thu,  7 Oct 2021 18:23:51 +0200
Message-Id: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 07 Oct 2021 13:12:41 -0400
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
Cc: =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series of patches is an attempt to add support for the following
sections of NVMe specification revision 1.4:

8.5 Virtualization Enhancements (Optional)
    8.5.1 VQ Resource Definition
    8.5.2 VI Resource Definition
    8.5.3 Secondary Controller States and Resource Configuration
    8.5.4 Single Root I/O Virtualization and Sharing (SR-IOV)

The NVMe controller's Single Root I/O Virtualization and Sharing
implementation is based on patches introducing SR-IOV support for PCI
Express proposed by Knut Omang:
https://lists.gnu.org/archive/html/qemu-devel/2015-10/msg05155.html

However, based on what I was able to find historically, Knut's patches
have not yet been pulled into QEMU due to no example of a working device
up to this point:
https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg02722.html

In terms of design, the Physical Function controller and the Virtual
Function controllers are almost independent, with few exceptions:
PF handles flexible resource allocation for all its children (VFs have
read-only access to this data), and reset (PF explicitly calls it on VFs).
Since the MMIO access is serialized, no extra precautions are required
to handle concurrent resets, as well as the secondary controller state
access doesn't need to be atomic.

A controller with full SR-IOV support must be capable of handling the
Namespace Management command. As there is a pending review with this
functionality, this patch list is not duplicating efforts.
Yet, NS management patches are not required to test the SR-IOV support.

We tested the patches on Ubuntu 20.04.3 LTS with kernel 5.4.0. We have
hit various issues with NVMe CLI (list and virt-mgmt commands) between
releases from version 1.09 to master, thus we chose this golden NVMe CLI
hash for testing: a50a0c1.

The implementation is not 100% finished and certainly not bug free,
since we are already aware of some issues e.g. interaction with
namespaces related to AER, or unexpected (?) kernel behavior in more
complex reset scenarios. However, our SR-IOV implementation is already
able to support typical SR-IOV use cases, so we believe the patches are
ready to share with the community.

Hope you find some time to review the work we did, and share your
thoughts.

Kind regards,
Lukasz

Knut Omang (3):
  pcie: Set default and supported MaxReadReq to 512
  pcie: Add support for Single Root I/O Virtualization (SR/IOV)
  pcie: Add some SR/IOV API documentation in docs/pcie_sriov.txt

Lukasz Maniak (5):
  pcie: Add callback preceding SR-IOV VFs update
  hw/nvme: Add support for SR-IOV
  hw/nvme: Add support for Primary Controller Capabilities
  hw/nvme: Add support for Secondary Controller List
  docs: Add documentation for SR-IOV and Virtualization Enhancements

Łukasz Gieryk (7):
  pcie: Add 1.2 version token for the Power Management Capability
  hw/nvme: Implement the Function Level Reset
  hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
  hw/nvme: Calculate BAR atributes in a function
  hw/nvme: Initialize capability structures for primary/secondary
    controllers
  pcie: Add helpers to the SR/IOV API
  hw/nvme: Add support for the Virtualization Management command

 docs/pcie_sriov.txt          | 115 +++++++
 docs/system/devices/nvme.rst |  27 ++
 hw/nvme/ctrl.c               | 589 ++++++++++++++++++++++++++++++++---
 hw/nvme/ns.c                 |   2 +-
 hw/nvme/nvme.h               |  47 ++-
 hw/nvme/subsys.c             |  74 ++++-
 hw/nvme/trace-events         |   6 +
 hw/pci/meson.build           |   1 +
 hw/pci/pci.c                 |  97 ++++--
 hw/pci/pcie.c                |  10 +-
 hw/pci/pcie_sriov.c          | 313 +++++++++++++++++++
 hw/pci/trace-events          |   5 +
 include/block/nvme.h         |  65 ++++
 include/hw/pci/pci.h         |  12 +-
 include/hw/pci/pci_ids.h     |   1 +
 include/hw/pci/pci_regs.h    |   1 +
 include/hw/pci/pcie.h        |   6 +
 include/hw/pci/pcie_sriov.h  |  81 +++++
 include/qemu/typedefs.h      |   2 +
 19 files changed, 1369 insertions(+), 85 deletions(-)
 create mode 100644 docs/pcie_sriov.txt
 create mode 100644 hw/pci/pcie_sriov.c
 create mode 100644 include/hw/pci/pcie_sriov.h

-- 
2.25.1


