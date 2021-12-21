Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889B047C193
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 15:36:11 +0100 (CET)
Received: from localhost ([::1]:56736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzgFO-0002Te-BA
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 09:36:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mzgDn-0008Dg-Pg; Tue, 21 Dec 2021 09:34:31 -0500
Received: from mga11.intel.com ([192.55.52.93]:38484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mzgDk-0002OO-MF; Tue, 21 Dec 2021 09:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640097268; x=1671633268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nIzcf8Lg3G3f/E+YIG5vr8VUGxEmW2oQJJOZG36VYzg=;
 b=aXjOFT9n9Py5mJAFACTmP919HNZGRyhhxOFZUIza+TP94tuq2i1Z/fh0
 EVeBpq4UMSiU5+77W9Ma80bYxW3vdfvJH1HZtvKF1Cwf7E9Bll21qnZ9G
 ERv6iYE5TJsEe6yIG9LqozrMLpNJ4KHuBPwa/Jk/xAilkCHcprOXjz9A0
 SkF8AXyJ3Y685QVcE+G7fNg12D1p/u4gyWpjL1WfLywSxkNCh96FVdxOI
 BlUGOveSGMscs4JtJadO1nVNgJv29tsDFrswC3TB5g0cEZQs+rxGyqhpG
 y/OG1N/6roIpdfEFOnV8g2wVBO4c3NOElT9NNTZ/fueA9P5wcaTu6d1ia g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="237940132"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="237940132"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 06:34:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="484429141"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 06:34:19 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Date: Tue, 21 Dec 2021 15:32:31 +0100
Message-Id: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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

This is the version of the patch series that we consider ready for
staging. We do not intend to work on the v4 unless there are major
issues.

Changes since v2:
- The documentation mentions that SR-IOV support is still an
  experimental feature.
- The default value activates properly when sriov_max_v{i,q}_per_vf == 0.
- Secondary Controller List (CNS 15h) handles the CDW10.CNTID field.
- Virtual Function Number ("VFN") in Secondary Controller Entry is not
  cleared to zero as the controller goes offline.
- Removed no longer used helper pcie_sriov_vf_number_total.
- Reset other than Controller Reset is necessary to activate (or
  deactivate) flexible resources.
- The v{i,q}rfap fields in Primary Controller Capabilities store the
  currently active number of bound resources, not the number active
  after reset.
- Secondary controller cannot be set online unless the corresponding VF
  is enabled (sriov_numvfs set to at least the secondary controller's VF
  number)

The list of opens and known gaps remains the same as for v2:
https://lists.gnu.org/archive/html/qemu-block/2021-11/msg00423.html

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
 hw/nvme/ctrl.c               | 665 ++++++++++++++++++++++++++++++++---
 hw/nvme/ns.c                 |   2 +-
 hw/nvme/nvme.h               |  55 ++-
 hw/nvme/subsys.c             |  75 +++-
 hw/nvme/trace-events         |   6 +
 hw/pci/meson.build           |   1 +
 hw/pci/pci.c                 |  97 +++--
 hw/pci/pcie.c                |   5 +
 hw/pci/pcie_sriov.c          | 295 ++++++++++++++++
 hw/pci/trace-events          |   5 +
 include/block/nvme.h         |  65 ++++
 include/hw/pci/pci.h         |  12 +-
 include/hw/pci/pci_ids.h     |   1 +
 include/hw/pci/pci_regs.h    |   1 +
 include/hw/pci/pcie.h        |   6 +
 include/hw/pci/pcie_sriov.h  |  72 ++++
 include/qemu/typedefs.h      |   2 +
 19 files changed, 1435 insertions(+), 81 deletions(-)
 create mode 100644 docs/pcie_sriov.txt
 create mode 100644 hw/pci/pcie_sriov.c
 create mode 100644 include/hw/pci/pcie_sriov.h

-- 
2.25.1


