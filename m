Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B60B49D0B6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:29:56 +0100 (CET)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCm7H-0007E0-FI
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:29:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nClsZ-0006O9-5X; Wed, 26 Jan 2022 12:14:44 -0500
Received: from mga11.intel.com ([192.55.52.93]:54184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nClsX-0001dr-15; Wed, 26 Jan 2022 12:14:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643217281; x=1674753281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PYxWA+O10XxFBp9NxQFmnRU3g5B2bt0SC9vlb1Zyzss=;
 b=iUqNW5UZt++Lz9SYPOzxJEELLpdxv9R+RsozSU8Bl6mz+8NAOrNYIZYF
 9T8l+KvTki7oan866qncTxf+GXa6uSPYw+lpVdLNO4TRLHC+GimYiUQV3
 EyGTrR5MB7UWZ/7mmvE1hrMnVhcT9QTdXSMpAFLWZ5gFVZHGUoDIFP4/f
 a9C6Muh1wFnceEtywuV4ZuD/5a+i5RRhKpX9z1sQqnxTl8xjw4/R4vjW5
 Yr2sJxZgWGBnMdC6L5lC1bQ8hv/kGbkePl/ctSDPS1NpL00/QUcIJORrh
 +5Xc/EllxQrupteVJKS7frD8LHvAyj6tmXr6hhWKAEcET/GvlmNW/OA/8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244199180"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="244199180"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:12:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="535254112"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:12:54 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Date: Wed, 26 Jan 2022 18:11:05 +0100
Message-Id: <20220126171120.2939152-1-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Changes since v3:
- Addressed comments to review on pcie: Add support for Single Root I/O
  Virtualization (SR/IOV)
- Fixed issues reported by checkpatch.pl

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
 docs/system/devices/nvme.rst |  36 ++
 hw/nvme/ctrl.c               | 675 ++++++++++++++++++++++++++++++++---
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
 19 files changed, 1460 insertions(+), 81 deletions(-)
 create mode 100644 docs/pcie_sriov.txt
 create mode 100644 hw/pci/pcie_sriov.c
 create mode 100644 include/hw/pci/pcie_sriov.h

-- 
2.25.1


