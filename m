Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25814DE1A0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 20:12:10 +0100 (CET)
Received: from localhost ([::1]:35610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVI1B-0000lv-VO
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 15:12:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVHm1-0004os-Jo; Fri, 18 Mar 2022 14:56:31 -0400
Received: from mga11.intel.com ([192.55.52.93]:7203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVHlz-0006sI-1w; Fri, 18 Mar 2022 14:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647629787; x=1679165787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IehkfP8FT4AXjRVN+cTcBwgV5uC9JpHWPKRxfYzfPvc=;
 b=htm+k6/gxJ0cLZ4/H81Va+d1DLHIZyDmccCP4Y0NnQ4y3mXd9LcpHaeQ
 nYCoEIBrU9Zgp/Ofrw/1r26XXjCsnLd6Bh0yGAnOEZgVrBUm1BK9La8Qk
 3ShyTdv7f1PsT3JrzunUK6CLs7H+BRBDPtwS0ybZcWm6elwkzNQIWNOu+
 cr6QsRS+DgRFzzFb6um0ry115ZhWQLW7zYsAfX7iQnC9yP3eBio+1zY33
 DpdUlTPx5wWq2Cywtv3ZTUgsCHK6T41DuYs/P92jobs9vBtCEO7gCS/6O
 Orp7zb177jRZBZxEFK/Gq/QykWSjYqFXYUo3CiT/mC9Abz85nYs6HjP7J g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="254772053"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="254772053"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 11:56:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="499352666"
Received: from lmaniak-dev.elements.local ([10.55.249.72])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 11:56:13 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/12] docs: Add documentation for SR-IOV and
 Virtualization Enhancements
Date: Fri, 18 Mar 2022 19:53:49 +0100
Message-Id: <20220318185352.1667375-10-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318185352.1667375-1-lukasz.maniak@linux.intel.com>
References: <20220318185352.1667375-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
---
 docs/system/devices/nvme.rst | 82 ++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index b5acb2a9c19..aba253304e4 100644
--- a/docs/system/devices/nvme.rst
+++ b/docs/system/devices/nvme.rst
@@ -239,3 +239,85 @@ The virtual namespace device supports DIF- and DIX-based protection information
   to ``1`` to transfer protection information as the first eight bytes of
   metadata. Otherwise, the protection information is transferred as the last
   eight bytes.
+
+Virtualization Enhancements and SR-IOV (Experimental Support)
+-------------------------------------------------------------
+
+The ``nvme`` device supports Single Root I/O Virtualization and Sharing
+along with Virtualization Enhancements. The controller has to be linked to
+an NVM Subsystem device (``nvme-subsys``) for use with SR-IOV.
+
+A number of parameters are present (**please note, that they may be
+subject to change**):
+
+``sriov_max_vfs`` (default: ``0``)
+  Indicates the maximum number of PCIe virtual functions supported
+  by the controller. Specifying a non-zero value enables reporting of both
+  SR-IOV and ARI (Alternative Routing-ID Interpretation) capabilities
+  by the NVMe device. Virtual function controllers will not report SR-IOV.
+
+``sriov_vq_flexible``
+  Indicates the total number of flexible queue resources assignable to all
+  the secondary controllers. Implicitly sets the number of primary
+  controller's private resources to ``(max_ioqpairs - sriov_vq_flexible)``.
+
+``sriov_vi_flexible``
+  Indicates the total number of flexible interrupt resources assignable to
+  all the secondary controllers. Implicitly sets the number of primary
+  controller's private resources to ``(msix_qsize - sriov_vi_flexible)``.
+
+``sriov_max_vi_per_vf`` (default: ``0``)
+  Indicates the maximum number of virtual interrupt resources assignable
+  to a secondary controller. The default ``0`` resolves to
+  ``(sriov_vi_flexible / sriov_max_vfs)``
+
+``sriov_max_vq_per_vf`` (default: ``0``)
+  Indicates the maximum number of virtual queue resources assignable to
+  a secondary controller. The default ``0`` resolves to
+  ``(sriov_vq_flexible / sriov_max_vfs)``
+
+The simplest possible invocation enables the capability to set up one VF
+controller and assign an admin queue, an IO queue, and a MSI-X interrupt.
+
+.. code-block:: console
+
+   -device nvme-subsys,id=subsys0
+   -device nvme,serial=deadbeef,subsys=subsys0,sriov_max_vfs=1,
+    sriov_vq_flexible=2,sriov_vi_flexible=1
+
+The minimum steps required to configure a functional NVMe secondary
+controller are:
+
+  * unbind flexible resources from the primary controller
+
+.. code-block:: console
+
+   nvme virt-mgmt /dev/nvme0 -c 0 -r 1 -a 1 -n 0
+   nvme virt-mgmt /dev/nvme0 -c 0 -r 0 -a 1 -n 0
+
+  * perform a Function Level Reset on the primary controller to actually
+    release the resources
+
+.. code-block:: console
+
+   echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
+
+  * enable VF
+
+.. code-block:: console
+
+   echo 1 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
+
+  * assign the flexible resources to the VF and set it ONLINE
+
+.. code-block:: console
+
+   nvme virt-mgmt /dev/nvme0 -c 1 -r 1 -a 8 -n 1
+   nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 8 -n 2
+   nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 9 -n 0
+
+  * bind the NVMe driver to the VF
+
+.. code-block:: console
+
+   echo 0000:01:00.1 > /sys/bus/pci/drivers/nvme/bind
\ No newline at end of file
-- 
2.25.1


