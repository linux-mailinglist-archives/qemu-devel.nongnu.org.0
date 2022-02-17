Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FBD4BA76F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:49:15 +0100 (CET)
Received: from localhost ([::1]:47490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKku2-0003Pc-4y
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:49:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nKkrk-00010s-U6; Thu, 17 Feb 2022 12:46:53 -0500
Received: from mga12.intel.com ([192.55.52.136]:31684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nKkrh-0007Dy-7c; Thu, 17 Feb 2022 12:46:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645120009; x=1676656009;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EFIdeDQQOWK24gFUMjJWkZxXCmi5fXSlyJYtYbVNQcs=;
 b=e5MICTWRN5NfjduqQApVqCgrhM92FuY+GBYgU9GICdJq6qzShX90JK53
 0lBo2ZokSn7mf10X6Meknbh+Aylt7buTNOc75zEj6uUMfQSGWtSjDIObb
 Tr2EkuHxVSfbS2kvjyKixo3431GDdICRsxOJT/KfNk1i1BmY40Jp7wlBZ
 1oy2ED0j8NTjWHTWzuNgevTH+2W75AXT6wIil0mj4jsIiyOovZKdDPcBx
 8HeIQwo6uzIdju6S0CXU0ZZBZwHnlnz9bekq+DdWbJa+NS6hLmpC1wgaZ
 cPYdQ1+cECqH9xNyvJ7+qlbgnM/ErxmnSbUTpR8X061DBD9lRUoS0O+bh w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="230894024"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="230894024"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:46:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="545745959"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:46:44 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Date: Thu, 17 Feb 2022 18:44:49 +0100
Message-Id: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes since v4:
- Added hello world example for SR-IOV to the docs
- Moved AER initialization from nvme_init_ctrl to nvme_init_state
- Fixed division by zero issue in calculation of vqfrt and vifrt
  capabilities

Knut Omang (2):
  pcie: Add support for Single Root I/O Virtualization (SR/IOV)
  pcie: Add some SR/IOV API documentation in docs/pcie_sriov.txt

Lukasz Maniak (4):
  hw/nvme: Add support for SR-IOV
  hw/nvme: Add support for Primary Controller Capabilities
  hw/nvme: Add support for Secondary Controller List
  docs: Add documentation for SR-IOV and Virtualization Enhancements

Łukasz Gieryk (9):
  pcie: Add a helper to the SR/IOV API
  pcie: Add 1.2 version token for the Power Management Capability
  hw/nvme: Implement the Function Level Reset
  hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
  hw/nvme: Remove reg_size variable and update BAR0 size calculation
  hw/nvme: Calculate BAR attributes in a function
  hw/nvme: Initialize capability structures for primary/secondary
    controllers
  hw/nvme: Add support for the Virtualization Management command
  hw/nvme: Update the initalization place for the AER queue

 docs/pcie_sriov.txt          | 115 ++++++
 docs/system/devices/nvme.rst |  82 +++++
 hw/nvme/ctrl.c               | 674 ++++++++++++++++++++++++++++++++---
 hw/nvme/ns.c                 |   2 +-
 hw/nvme/nvme.h               |  55 ++-
 hw/nvme/subsys.c             |  75 +++-
 hw/nvme/trace-events         |   6 +
 hw/pci/meson.build           |   1 +
 hw/pci/pci.c                 | 100 ++++--
 hw/pci/pcie.c                |   5 +
 hw/pci/pcie_sriov.c          | 302 ++++++++++++++++
 hw/pci/trace-events          |   5 +
 include/block/nvme.h         |  65 ++++
 include/hw/pci/pci.h         |  12 +-
 include/hw/pci/pci_ids.h     |   1 +
 include/hw/pci/pci_regs.h    |   1 +
 include/hw/pci/pcie.h        |   6 +
 include/hw/pci/pcie_sriov.h  |  77 ++++
 include/qemu/typedefs.h      |   2 +
 19 files changed, 1505 insertions(+), 81 deletions(-)
 create mode 100644 docs/pcie_sriov.txt
 create mode 100644 hw/pci/pcie_sriov.c
 create mode 100644 include/hw/pci/pcie_sriov.h

-- 
2.25.1


