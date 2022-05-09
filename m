Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FE3520013
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:41:56 +0200 (CEST)
Received: from localhost ([::1]:59156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4aC-0004LD-2J
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1no4EK-0002Fw-SW; Mon, 09 May 2022 10:19:20 -0400
Received: from mga05.intel.com ([192.55.52.43]:24288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1no4EI-0001AQ-4I; Mon, 09 May 2022 10:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652105958; x=1683641958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=teWfneLmPkP/tQTqHrRJG4OODSqIIMXDbgMLbnIwKRM=;
 b=K4101bKZeyYlh96sno5JDliSXJFHB0wm3bgxBZtDDiYqHPl0zkhBnI/I
 l4HcUt/vTrMgs8RhEwFfyCgnLJ7krMgguY2TV/KWHgofkjS7P79tqYczB
 lEddhTsd22ca5321VzQZZAfSuXQ5LyE0W93x7gW0K9Fw32NHDr3Q31sfL
 dA69haCsMrQpWPlv0n3H4yhTZ2uiRUj1ay8Khc97MI023Dv2y78PeBO42
 e3glQte1QiX9HZQF+fvlGtwNIefIj6RDGF0RteTt0BN4ezAjg+Iut0KI4
 M2NCZsChAdvAoxSQhi7+FXGmfpqanbXSNbHXxAc2yOjnUPHGF/fbHXQ+b g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="355490896"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="355490896"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:19:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="622987362"
Received: from lmaniak-dev.elements.local ([10.55.249.72])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:19:12 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, ani@anisinha.ca, armbru@redhat.com, f4bug@amsat.org,
 fam@euphon.net, hreitz@redhat.com, imammedo@redhat.com, its@irrelevant.dk,
 kbusch@kernel.org, k.jensen@samsung.com, kwolf@redhat.com,
 lukasz.gieryk@linux.intel.com, lukasz.maniak@linux.intel.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, stefanha@redhat.com,
 xypron.glpk@gmx.de
Subject: [PATCH v8 10/12] docs: Add documentation for SR-IOV and
 Virtualization Enhancements
Date: Mon,  9 May 2022 16:16:18 +0200
Message-Id: <20220509141620.3868733-11-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
References: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
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

Documentation describes 5 new parameters being added regarding SR-IOV:
sriov_max_vfs
sriov_vq_flexible
sriov_vi_flexible
sriov_max_vi_per_vf
sriov_max_vq_per_vf

The description also includes the simplest possible QEMU invocation
and the series of NVMe commands required to enable SR-IOV support.

Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
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


