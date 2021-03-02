Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342D6329F9F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 13:56:41 +0100 (CET)
Received: from localhost ([::1]:51986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH4Zs-0001NT-7u
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 07:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1lH4KB-0007jp-VL
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:40:28 -0500
Received: from mga05.intel.com ([192.55.52.43]:62468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1lH4KA-0002nT-2P
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:40:27 -0500
IronPort-SDR: SGIqMdRTmlIyO1dy71edT40ugJ3qJ7iY02v0f8t+FurgzkEojTbJnLJo2roc+AAEeSlhKYA5r9
 fpHxgs996rOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="271803101"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="271803101"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 04:40:25 -0800
IronPort-SDR: 3m2tH7iTtFMEWJ1fNEtLOwW5jsZf0m2Tm6vYxUwFZllkkL72c4tFJWJLN3nHDOWSdjpTDEyAty
 eT6FiT3EfZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="427472924"
Received: from yiliu-dev.bj.intel.com (HELO dual-ub.bj.intel.com)
 ([10.238.156.135])
 by fmsmga004.fm.intel.com with ESMTP; 02 Mar 2021 04:40:20 -0800
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org, alex.williamson@redhat.com, peterx@redhat.com,
 jasowang@redhat.com
Subject: [RFC v11 12/25] vfio: add HostIOMMUContext support
Date: Wed,  3 Mar 2021 04:38:14 +0800
Message-Id: <20210302203827.437645-13-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302203827.437645-1-yi.l.liu@intel.com>
References: <20210302203827.437645-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yi.l.liu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, yi.l.liu@intel.com,
 Yi Sun <yi.y.sun@linux.intel.com>, kvm@vger.kernel.org, mst@redhat.com,
 jun.j.tian@intel.com, eric.auger@redhat.com, yi.y.sun@intel.com,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, pbonzini@redhat.com,
 Lingshan.Zhu@intel.com, hao.wu@intel.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds support for HostIOMMUContext, implements bind_stage1_pgtbl()
and unbind_stage1_pgtbl() for vIOMMU to setup dual stage DMA translation for
passthru devices on hardware.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
 hw/vfio/common.c                      | 70 +++++++++++++++++++++++++++
 include/hw/iommu/host_iommu_context.h |  3 ++
 include/hw/vfio/vfio-common.h         |  3 ++
 3 files changed, 76 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 883815d5b0..433938c245 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1575,6 +1575,54 @@ static int vfio_get_iommu_type(VFIOContainer *container,
     return ret;
 }
 
+static int vfio_host_iommu_ctx_bind_stage1_pgtbl(HostIOMMUContext *iommu_ctx,
+                                         struct iommu_gpasid_bind_data *bind)
+{
+    VFIOContainer *container = container_of(iommu_ctx,
+                                            VFIOContainer, iommu_ctx);
+    struct vfio_iommu_type1_nesting_op *op;
+    unsigned long argsz;
+    int ret = 0;
+
+    argsz = sizeof(*op) + sizeof(*bind);
+    op = g_malloc0(argsz);
+    op->argsz = argsz;
+    op->flags = VFIO_IOMMU_NESTING_OP_BIND_PGTBL;
+    memcpy(&op->data, bind, sizeof(*bind));
+
+    if (ioctl(container->fd, VFIO_IOMMU_NESTING_OP, op)) {
+        ret = -errno;
+        error_report("%s: pasid (%llu) bind failed: %m",
+                      __func__, bind->hpasid);
+    }
+    g_free(op);
+    return ret;
+}
+
+static int vfio_host_iommu_ctx_unbind_stage1_pgtbl(HostIOMMUContext *iommu_ctx,
+                                         struct iommu_gpasid_bind_data *unbind)
+{
+    VFIOContainer *container = container_of(iommu_ctx,
+                                            VFIOContainer, iommu_ctx);
+    struct vfio_iommu_type1_nesting_op *op;
+    unsigned long argsz;
+    int ret = 0;
+
+    argsz = sizeof(*op) + sizeof(*unbind);
+    op = g_malloc0(argsz);
+    op->argsz = argsz;
+    op->flags = VFIO_IOMMU_NESTING_OP_UNBIND_PGTBL;
+    memcpy(&op->data, unbind, sizeof(*unbind));
+
+    if (ioctl(container->fd, VFIO_IOMMU_NESTING_OP, op)) {
+        ret = -errno;
+        error_report("%s: pasid (%llu) unbind failed: %m",
+                      __func__, unbind->hpasid);
+    }
+    g_free(op);
+    return ret;
+}
+
 static int vfio_init_container(VFIOContainer *container, int group_fd,
                                bool want_nested, Error **errp)
 {
@@ -2268,3 +2316,25 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
     }
     return vfio_eeh_container_op(container, op);
 }
+
+static void vfio_host_iommu_context_class_init(ObjectClass *klass,
+                                                       void *data)
+{
+    HostIOMMUContextClass *hicxc = HOST_IOMMU_CONTEXT_CLASS(klass);
+
+    hicxc->bind_stage1_pgtbl = vfio_host_iommu_ctx_bind_stage1_pgtbl;
+    hicxc->unbind_stage1_pgtbl = vfio_host_iommu_ctx_unbind_stage1_pgtbl;
+}
+
+static const TypeInfo vfio_host_iommu_context_info = {
+    .parent = TYPE_HOST_IOMMU_CONTEXT,
+    .name = TYPE_VFIO_HOST_IOMMU_CONTEXT,
+    .class_init = vfio_host_iommu_context_class_init,
+};
+
+static void vfio_register_types(void)
+{
+    type_register_static(&vfio_host_iommu_context_info);
+}
+
+type_init(vfio_register_types)
diff --git a/include/hw/iommu/host_iommu_context.h b/include/hw/iommu/host_iommu_context.h
index 41c4176c15..3498a3e25d 100644
--- a/include/hw/iommu/host_iommu_context.h
+++ b/include/hw/iommu/host_iommu_context.h
@@ -33,6 +33,9 @@
 #define TYPE_HOST_IOMMU_CONTEXT "qemu:host-iommu-context"
 #define HOST_IOMMU_CONTEXT(obj) \
         OBJECT_CHECK(HostIOMMUContext, (obj), TYPE_HOST_IOMMU_CONTEXT)
+#define HOST_IOMMU_CONTEXT_CLASS(klass) \
+        OBJECT_CLASS_CHECK(HostIOMMUContextClass, (klass), \
+                         TYPE_HOST_IOMMU_CONTEXT)
 #define HOST_IOMMU_CONTEXT_GET_CLASS(obj) \
         OBJECT_GET_CLASS(HostIOMMUContextClass, (obj), \
                          TYPE_HOST_IOMMU_CONTEXT)
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 293d3785f3..55241ee270 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -26,6 +26,7 @@
 #include "qemu/notify.h"
 #include "ui/console.h"
 #include "hw/display/ramfb.h"
+#include "hw/iommu/host_iommu_context.h"
 #ifdef CONFIG_LINUX
 #include <linux/vfio.h>
 #endif
@@ -33,6 +34,8 @@
 
 #define VFIO_MSG_PREFIX "vfio %s: "
 
+#define TYPE_VFIO_HOST_IOMMU_CONTEXT "qemu:vfio-host-iommu-context"
+
 enum {
     VFIO_DEVICE_TYPE_PCI = 0,
     VFIO_DEVICE_TYPE_PLATFORM = 1,
-- 
2.25.1


