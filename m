Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C2A4DE186
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 19:58:59 +0100 (CET)
Received: from localhost ([::1]:35010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVHoQ-0006Ew-0l
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 14:58:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVHl8-0003Su-AR; Fri, 18 Mar 2022 14:55:34 -0400
Received: from mga05.intel.com ([192.55.52.43]:18114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVHl6-0006W7-6M; Fri, 18 Mar 2022 14:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647629732; x=1679165732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o/4/FDJP2OjBsQvID1HEMg3IG3LIXiAC9LxJyfUZAdQ=;
 b=GZ99AMFjAqAzGI8lKGxscB4a+S8MXl515obY12w8+PDs2hK5KrxxveB/
 koeZHmRdq6CRHAuq7uq5s9cEmAz1G764XMEu3kmxSBPs8ECVTSbOvPacg
 aUqkm8+Sbwflhybi1U0gOu59+4GM8Vm6yn610iIvgLNFEXyv/bljhBk/y
 o9peVCNgoX9sflO1PCE9dahNgeqOJoud+/DAQNTak2ZvySOSUP9loQP00
 TvvlsF0Tc9ZD1vPTFFqDzhQZB+U5HDCop/GPYlSwD2vkFeRLYqlEYoJb0
 Fn5Y2AxBfI09+rdef/rJRkHh7QjqAEi+77ua86Cd0psNDDyIRtZJxNf5V A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="343639656"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="343639656"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 11:55:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="499352428"
Received: from lmaniak-dev.elements.local ([10.55.249.72])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 11:55:24 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/12] hw/nvme: SR-IOV with Virtualization Enhancements
Date: Fri, 18 Mar 2022 19:53:27 +0100
Message-Id: <20220318185327.1666536-1-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, lukasz.maniak@linux.intel.com,
 stefanha@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 k.jensen@samsung.com, armbru@redhat.com, f4bug@amsat.org, kbusch@kernel.org,
 its@irrelevant.dk, hreitz@redhat.com, xypron.glpk@gmx.de,
 lukasz.gieryk@linux.intel.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


