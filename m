Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B70551FF66
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:24:27 +0200 (CEST)
Received: from localhost ([::1]:42472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4JG-0006ss-Cq
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1no4Di-0001Er-Sx; Mon, 09 May 2022 10:18:43 -0400
Received: from mga05.intel.com ([192.55.52.43]:24270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1no4Df-00019f-JZ; Mon, 09 May 2022 10:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652105919; x=1683641919;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VwPGrWab3VZ+PE3xeThUyIR8k2I0XzoUAb5oVWLvQFo=;
 b=SQt5G7AnVQK1l5BnG8jjX5XgNqU7O2KeI9DklvbeOzEM9ZgJcl6tBTke
 gWNBq2gVbL/ISUFK64/SHDdOzn8haaotkXtLpBxixDosMkECE4dXTgdkq
 wTneMP+RLIR3k5VfAyYE+uJPjDNDd/3CeDS3Of6Qu1GbFjAHBmjH+6sLB
 72PU6fR5cQykD8VlZobnroGXgsp+jHmWyqBH5KaE4QWuAA9BcADQPuvcj
 0MydpTSfCxJCvlMavfwB2WzlWAdU3qE7pTTbSEVauEDF1zKbj6fhmRqYS
 YE+nLoVw+e5HZZbEzk7/0gN9epjCHpjfMXHRrBK2eNOZ3k3su/7htuIIw Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="355490734"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="355490734"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:18:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="622987221"
Received: from lmaniak-dev.elements.local ([10.55.249.72])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:18:32 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, ani@anisinha.ca, armbru@redhat.com, f4bug@amsat.org,
 fam@euphon.net, hreitz@redhat.com, imammedo@redhat.com, its@irrelevant.dk,
 kbusch@kernel.org, k.jensen@samsung.com, kwolf@redhat.com,
 lukasz.gieryk@linux.intel.com, lukasz.maniak@linux.intel.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, stefanha@redhat.com,
 xypron.glpk@gmx.de
Subject: [PATCH v8 00/12] hw/nvme: SR-IOV with Virtualization Enhancements
Date: Mon,  9 May 2022 16:16:08 +0200
Message-Id: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes since v7:
- Fixed description of hw/acpi: Make the PCI hot-plug aware of SR-IOV
- Added description to docs: Add documentation for SR-IOV and
  Virtualization Enhancements
- Added Reviewed-by and Acked-by tags
- Rebased on master

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


