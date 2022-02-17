Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EA74BA7BE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 19:10:30 +0100 (CET)
Received: from localhost ([::1]:39362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKlEb-0002Dv-3u
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 13:10:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nKksg-0003Kv-Sd; Thu, 17 Feb 2022 12:47:50 -0500
Received: from mga12.intel.com ([192.55.52.136]:31708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nKkse-0007HN-QS; Thu, 17 Feb 2022 12:47:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645120069; x=1676656069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IehkfP8FT4AXjRVN+cTcBwgV5uC9JpHWPKRxfYzfPvc=;
 b=LAt35ceRFsrkfplbBqrV7QMdVe5+6r7GEhSa1z+Xp++rl2Gj08kK7QDR
 fVfIfxzBfNMWJ9DzwTXSsKqoXevOdTsPAmeyzonWDJ1XaG2JnRziF6x4N
 EdNv+ZA2qtZXD1RGux+gdzofmD3AWQpGzlUoMyjZ7H49nVT82pKJNoLGs
 qyz/0p3VfSE+sMOlNbyY3sYcQGmY8lrTHsNobN/uoKZA3NNTpu27FzDj+
 b61zHK/G2K0r2cSUtcw12/fFRGxjdZSbQABOiRU2gB6zT+ieSHwcGwUWX
 f4rompFdG+mvQj+RXhCGPqWdCX1exce7RsbT3JfLoZrxWNwajRxCmAU7E w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="230894136"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="230894136"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:47:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="545746304"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:47:19 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/15] docs: Add documentation for SR-IOV and
 Virtualization Enhancements
Date: Thu, 17 Feb 2022 18:45:03 +0100
Message-Id: <20220217174504.1051716-15-lukasz.maniak@linux.intel.com>
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
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


