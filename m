Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C5C4DE1B4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 20:23:06 +0100 (CET)
Received: from localhost ([::1]:46778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVIBl-0000VL-7w
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 15:23:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVI9L-000692-5M; Fri, 18 Mar 2022 15:20:35 -0400
Received: from mga01.intel.com ([192.55.52.88]:4088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVI9J-0002Gw-4J; Fri, 18 Mar 2022 15:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647631233; x=1679167233;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DGw0pVVv4cLHWflvporjwupKGUOGDNAEzitJOeQwNzI=;
 b=PYMrkW4Nf5SLuLx6YCAbbTVwxFI3x6GfnQ/YfvRdKRKaQsNA7Z4gJwRc
 Grr6UBlJ3fLGaBTZ6j3WfKorYpAv0apI/9Vy79OVCqobSWuIwUDMU2z4W
 gEVsc14iraNNs+cH7wGJu/NeAn3VVDuCP4KEUJX9IOl1ZzrBpFDOMb5y0
 A1qbdAsgkpQNj8NQzRSj8wX9cflA8eoII0SGA193N/+apRR72v2h7u5o2
 yruQhgSMNcpttl781czVBtESZJOce1KlOP3wSqiVIFJr54ISVFy9YSTWp
 97BemTBrO7K8BQ+uWhHjEf1cJwYVQh9UT/1Ayj+q5KdlwSgO/4bwJe7dn A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="282019217"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="282019217"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 12:20:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="541993930"
Received: from lmaniak-dev.elements.local ([10.55.249.72])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 12:20:12 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/12] hw/nvme: SR-IOV with Virtualization Enhancements
Date: Fri, 18 Mar 2022 20:18:07 +0100
Message-Id: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, lukasz.maniak@linux.intel.com,
 stefanha@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 k.jensen@samsung.com, armbru@redhat.com, f4bug@amsat.org, kbusch@kernel.org,
 its@irrelevant.dk, hreitz@redhat.com, xypron.glpk@gmx.de,
 lukasz.gieryk@linux.intel.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resubmitting v6 as v7 since Patchew got lost with my sophisticated CC of
all maintainers just for the cover letter.

Changes since v5:
- Fixed PCI hotplug issue related to deleting VF twice
- Corrected error messages for SR-IOV parameters
- Rebased on master, patches for PCI got pulled into the tree
- Added Reviewed-by labels

Lukasz Maniak (4):
  hw/nvme: Add support for SR-IOV
  hw/nvme: Add support for Primary Controller Capabilities
  hw/nvme: Add support for Secondary Controller List
  docs: Add documentation for SR-IOV and Virtualization Enhancements

Łukasz Gieryk (8):
  hw/nvme: Implement the Function Level Reset
  hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
  hw/nvme: Remove reg_size variable and update BAR0 size calculation
  hw/nvme: Calculate BAR attributes in a function
  hw/nvme: Initialize capability structures for primary/secondary
    controllers
  hw/nvme: Add support for the Virtualization Management command
  hw/nvme: Update the initalization place for the AER queue
  hw/acpi: Make the PCI hot-plug aware of SR-IOV

 docs/system/devices/nvme.rst |  82 +++++
 hw/acpi/pcihp.c              |   6 +-
 hw/nvme/ctrl.c               | 673 ++++++++++++++++++++++++++++++++---
 hw/nvme/ns.c                 |   2 +-
 hw/nvme/nvme.h               |  55 ++-
 hw/nvme/subsys.c             |  75 +++-
 hw/nvme/trace-events         |   6 +
 include/block/nvme.h         |  65 ++++
 include/hw/pci/pci_ids.h     |   1 +
 9 files changed, 909 insertions(+), 56 deletions(-)

-- 
2.25.1


