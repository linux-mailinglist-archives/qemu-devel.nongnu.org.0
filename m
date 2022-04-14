Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D414500BC1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 13:03:55 +0200 (CEST)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nexGU-0001gz-Aw
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 07:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex1F-0003aO-Kh
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:48:09 -0400
Received: from mga12.intel.com ([192.55.52.136]:34768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex1D-0005Ka-Le
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649933287; x=1681469287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0P3OalrBHnBhU01QF07hMbsmlYmh/io4cNMn4gf855E=;
 b=G3hZ/nXbWaRokI6YYdLJeRk3u+Hs7cPyhTzOmPIaBOUn5+JC9LBiN2xa
 iA/6tYQyHALAFQra5nfN+BI03KQzC8C4xmqqdCD7skYVI3J5cnUGcojeg
 htF0On3uYn8E+LiL/nB+p46QVukLn2hQ+WGK9Og1gN1j2TUlGFlYVXFsL
 YYK28UrIqYipGN+WKVMih2shAGdKl/a0LhBf9H20hexauqFSaptMVtOmu
 K3ygXK5i1ySO+8Q6ydQRuhM64htaGr393PRP4t2amSaO/5qTI8ufi1zOc
 GC3dt6mscDhT63IDcDTk94zfmgVgmpi6AGB8UMpP0+6NVBQ46I/gOfRWx A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="242836525"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="242836525"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 03:47:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="803091268"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2022 03:47:25 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	cohuck@redhat.com,
	qemu-devel@nongnu.org
Subject: [RFC 18/18] vfio/pci: Add an iommufd option
Date: Thu, 14 Apr 2022 03:47:10 -0700
Message-Id: <20220414104710.28534-19-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220414104710.28534-1-yi.l.liu@intel.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yi.l.liu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, thuth@redhat.com,
 yi.l.liu@intel.com, kvm@vger.kernel.org, mjrosato@linux.ibm.com,
 jasowang@redhat.com, farman@linux.ibm.com, peterx@redhat.com,
 pasic@linux.ibm.com, eric.auger@redhat.com, yi.y.sun@intel.com,
 chao.p.peng@intel.com, nicolinc@nvidia.com, kevin.tian@intel.com,
 jgg@nvidia.com, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

This auto/on/off option allows the user to force a the select
the iommu BE (iommufd or legacy).

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 hw/vfio/pci.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index cf5703f94b..70a4c2b0a8 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -42,6 +42,8 @@
 #include "qapi/error.h"
 #include "migration/blocker.h"
 #include "migration/qemu-file.h"
+#include "qapi/visitor.h"
+#include "qapi/qapi-visit-common.h"
 
 #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
 
@@ -3246,6 +3248,26 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void get_iommu_be(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    VFIOPCIDevice *vdev = VFIO_PCI(obj);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+    OnOffAuto iommufd_be = vbasedev->iommufd_be;
+
+    visit_type_OnOffAuto(v, name, &iommufd_be, errp);
+}
+
+static void set_iommu_be(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    VFIOPCIDevice *vdev = VFIO_PCI(obj);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    visit_type_OnOffAuto(v, name, &vbasedev->iommufd_be, errp);
+}
+
+
 static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -3253,6 +3275,10 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 
     dc->reset = vfio_pci_reset;
     device_class_set_props(dc, vfio_pci_dev_properties);
+    object_class_property_add(klass, "iommufd", "OnOffAuto",
+                              get_iommu_be, set_iommu_be, NULL, NULL);
+    object_class_property_set_description(klass, "iommufd",
+                                          "Enable iommufd backend");
     dc->desc = "VFIO-based PCI device assignment";
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     pdc->realize = vfio_realize;
-- 
2.27.0


