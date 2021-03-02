Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0F632A010
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:05:46 +0100 (CET)
Received: from localhost ([::1]:36780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH4if-0007cQ-Jq
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1lH4Kz-0008P8-8q
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:41:17 -0500
Received: from mga12.intel.com ([192.55.52.136]:6968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1lH4Ks-0002u4-0n
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:41:16 -0500
IronPort-SDR: wd+F9bJB52+61YQ0vZZfa2XGf7DEmOrSkC5wa9g7NT4TDkjzVmWMm+Z9njf/0WGoZAGWXJwWeC
 1W16AZ9grx5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="166033931"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="166033931"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 04:41:07 -0800
IronPort-SDR: qOIBtZvRmYH+IFP8TK8bvwTTGzo3zNwuB0JhTN14LwMPZWdSEAGveWZDRgVaDLLUukKgPKmjpo
 ptxS847I/gNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="427473129"
Received: from yiliu-dev.bj.intel.com (HELO dual-ub.bj.intel.com)
 ([10.238.156.135])
 by fmsmga004.fm.intel.com with ESMTP; 02 Mar 2021 04:41:03 -0800
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org, alex.williamson@redhat.com, peterx@redhat.com,
 jasowang@redhat.com
Subject: [RFC v11 21/25] vfio: add support for flush iommu stage-1 cache
Date: Wed,  3 Mar 2021 04:38:23 +0800
Message-Id: <20210302203827.437645-22-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302203827.437645-1-yi.l.liu@intel.com>
References: <20210302203827.437645-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yi.l.liu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This patch adds flush_stage1_cache() definition in HostIOMUContextClass.
And adds corresponding implementation in VFIO. This is to expose a way
for vIOMMU to flush stage-1 cache in host side since guest owns stage-1
translation structures in dual stage DMA translation configuration.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
 hw/iommu/host_iommu_context.c         | 19 +++++++++++++++++++
 hw/vfio/common.c                      | 24 ++++++++++++++++++++++++
 include/hw/iommu/host_iommu_context.h |  8 ++++++++
 3 files changed, 51 insertions(+)

diff --git a/hw/iommu/host_iommu_context.c b/hw/iommu/host_iommu_context.c
index d7139bcb86..59f5e7af9e 100644
--- a/hw/iommu/host_iommu_context.c
+++ b/hw/iommu/host_iommu_context.c
@@ -69,6 +69,25 @@ int host_iommu_ctx_unbind_stage1_pgtbl(HostIOMMUContext *iommu_ctx,
     return hicxc->unbind_stage1_pgtbl(iommu_ctx, unbind);
 }
 
+int host_iommu_ctx_flush_stage1_cache(HostIOMMUContext *iommu_ctx,
+                                 struct iommu_cache_invalidate_info *cache)
+{
+    HostIOMMUContextClass *hicxc;
+
+    hicxc = HOST_IOMMU_CONTEXT_GET_CLASS(iommu_ctx);
+
+    if (!hicxc) {
+        return -EINVAL;
+    }
+
+    if (!(iommu_ctx->info->features & IOMMU_NESTING_FEAT_CACHE_INVLD) ||
+        !hicxc->flush_stage1_cache) {
+        return -EINVAL;
+    }
+
+    return hicxc->flush_stage1_cache(iommu_ctx, cache);
+}
+
 void host_iommu_ctx_init(void *_iommu_ctx, size_t instance_size,
                          const char *mrtypename,
                          struct iommu_nesting_info *info)
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a12708bcb7..122866fa85 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1623,6 +1623,29 @@ static int vfio_host_iommu_ctx_unbind_stage1_pgtbl(HostIOMMUContext *iommu_ctx,
     return ret;
 }
 
+static int vfio_host_iommu_ctx_flush_stage1_cache(HostIOMMUContext *iommu_ctx,
+                                    struct iommu_cache_invalidate_info *cache)
+{
+    VFIOContainer *container = container_of(iommu_ctx,
+                                            VFIOContainer, iommu_ctx);
+    struct vfio_iommu_type1_nesting_op *op;
+    unsigned long argsz;
+    int ret = 0;
+
+    argsz = sizeof(*op) + sizeof(*cache);
+    op = g_malloc0(argsz);
+    op->argsz = argsz;
+    op->flags = VFIO_IOMMU_NESTING_OP_CACHE_INVLD;
+    memcpy(&op->data, cache, sizeof(*cache));
+
+    if (ioctl(container->fd, VFIO_IOMMU_NESTING_OP, op)) {
+        ret = -errno;
+        error_report("%s: iommu cache flush failed: %m", __func__);
+    }
+    g_free(op);
+    return ret;
+}
+
 /**
  * Get iommu info from host. Caller of this funcion should free
  * the memory pointed by the returned pointer stored in @info
@@ -2389,6 +2412,7 @@ static void vfio_host_iommu_context_class_init(ObjectClass *klass,
 
     hicxc->bind_stage1_pgtbl = vfio_host_iommu_ctx_bind_stage1_pgtbl;
     hicxc->unbind_stage1_pgtbl = vfio_host_iommu_ctx_unbind_stage1_pgtbl;
+    hicxc->flush_stage1_cache = vfio_host_iommu_ctx_flush_stage1_cache;
 }
 
 static const TypeInfo vfio_host_iommu_context_info = {
diff --git a/include/hw/iommu/host_iommu_context.h b/include/hw/iommu/host_iommu_context.h
index 3498a3e25d..8b1171fbf9 100644
--- a/include/hw/iommu/host_iommu_context.h
+++ b/include/hw/iommu/host_iommu_context.h
@@ -55,6 +55,12 @@ typedef struct HostIOMMUContextClass {
     /* Undo a previous bind. @unbind specifies the unbind info. */
     int (*unbind_stage1_pgtbl)(HostIOMMUContext *iommu_ctx,
                                struct iommu_gpasid_bind_data *unbind);
+    /*
+     * Propagate stage-1 cache flush to host IOMMU, cache
+     * info specifid in @cache
+     */
+    int (*flush_stage1_cache)(HostIOMMUContext *iommu_ctx,
+                              struct iommu_cache_invalidate_info *cache);
 } HostIOMMUContextClass;
 
 /*
@@ -70,6 +76,8 @@ int host_iommu_ctx_bind_stage1_pgtbl(HostIOMMUContext *iommu_ctx,
                                      struct iommu_gpasid_bind_data *bind);
 int host_iommu_ctx_unbind_stage1_pgtbl(HostIOMMUContext *iommu_ctx,
                                  struct iommu_gpasid_bind_data *unbind);
+int host_iommu_ctx_flush_stage1_cache(HostIOMMUContext *iommu_ctx,
+                               struct iommu_cache_invalidate_info *cache);
 void host_iommu_ctx_init(void *_iommu_ctx, size_t instance_size,
                          const char *mrtypename,
                          struct iommu_nesting_info *info);
-- 
2.25.1


