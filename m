Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91C8557124
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 04:42:23 +0200 (CEST)
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4CnW-00024m-DX
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 22:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o4ClH-0001Gt-IC
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 22:40:03 -0400
Received: from mga05.intel.com ([192.55.52.43]:39338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o4ClD-0003Nv-8g
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 22:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655951999; x=1687487999;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fb3PgNrJbycZBknPv2N81nor5H78OvRGhnoQwAiIhdM=;
 b=WWoTt1DvYdnO5MAQx9bYcfrfNPT5fs1qAMdWaw+0+LRVs44U47KSRwbt
 tCKdDabqjU1xZqw4gNww5dTjC38Ld+e89LXClBbF2739mJParrFIQsWmG
 pg0k5JtULTIE2GqdVmdcGqNjNkNoNeyZX8pHWS0nENofBVA0tFa4VSRS3
 TgZE7TR5n0td9JpnfgS81XSPW5NF1Ndzu7z0dOAkuWUMPDW82YWX9O0Hn
 CxNZ0OdABGS0Zp2Q5zeVyLa3KkVINy2vnyVM0uuBKhQC5+T23j3KdZG2q
 VCPCGBu0/+2U4xNBowZq2O/5pR/flIc/F1kETVjISCsxrOKSvxTPnHZOc Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="366925491"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="366925491"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 19:39:38 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="644504560"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 19:39:36 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: eric.auger@redhat.com,
	mst@redhat.com,
	jean-philippe@linaro.org
Subject: [PATCH v3] virtio-iommu: Fix the partial copy of probe request
Date: Thu, 23 Jun 2022 10:31:52 +0800
Message-Id: <20220623023152.3473231-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=zhenzhong.duan@intel.com; helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The structure of probe request doesn't include the tail, this leads
to a few field missed to be copied. Currently this isn't an issue as
those missed field belong to reserved field, just in case reserved
field will be used in the future.

Changed 4th parameter of virtio_iommu_iov_to_req() to receive size
of device-readable part.

Fixes: 1733eebb9e75b ("virtio-iommu: Implement RESV_MEM probe request")
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 v3: moved "- sizeof(struct virtio_iommu_req_tail)" to virtio_iommu_handle_req() per Jean
 v2: keep bugfix change and drop cleanup change

 hw/virtio/virtio-iommu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 7c122ab95780..08b227e828f8 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -675,11 +675,10 @@ static int virtio_iommu_probe(VirtIOIOMMU *s,
 
 static int virtio_iommu_iov_to_req(struct iovec *iov,
                                    unsigned int iov_cnt,
-                                   void *req, size_t req_sz)
+                                   void *req, size_t payload_sz)
 {
-    size_t sz, payload_sz = req_sz - sizeof(struct virtio_iommu_req_tail);
+    size_t sz = iov_to_buf(iov, iov_cnt, 0, req, payload_sz);
 
-    sz = iov_to_buf(iov, iov_cnt, 0, req, payload_sz);
     if (unlikely(sz != payload_sz)) {
         return VIRTIO_IOMMU_S_INVAL;
     }
@@ -692,7 +691,8 @@ static int virtio_iommu_handle_ ## __req(VirtIOIOMMU *s,                \
                                          unsigned int iov_cnt)          \
 {                                                                       \
     struct virtio_iommu_req_ ## __req req;                              \
-    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req)); \
+    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req,               \
+                    sizeof(req) - sizeof(struct virtio_iommu_req_tail));\
                                                                         \
     return ret ? ret : virtio_iommu_ ## __req(s, &req);                 \
 }
-- 
2.25.1


