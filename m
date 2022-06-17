Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48854F11E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 08:40:01 +0200 (CEST)
Received: from localhost ([::1]:44614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o25eC-0006Ds-HN
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 02:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o25S9-0001xo-Tr
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 02:27:36 -0400
Received: from mga17.intel.com ([192.55.52.151]:8479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o25S6-0000FY-GS
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 02:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655447250; x=1686983250;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HHRxCRo8nccqX9iaBtaQsm1tqkBAJ0ZbGoclZYK9GxU=;
 b=IsGq4hmbbebVRulvxiz7xrf4sl4/WIjiA+ctMF4oxB+C+Y6QWiDnpVOL
 fCcBNpXSSTRbDF8RAn2kBGR9zLWzb0K2+uMIkrv3yWOJMixKVtkII/51H
 F7T5nFnAi5MHdrB/hzpGzXMKYzIfYhN8YutTHLw+EwOiqsbFgo/V2VyzR
 Jb2KXEIAXZqtD7JrCpndGi5FJ8UJBJpGNDp1ehg/nO9+JGJTF7drA7SHT
 ZMB/GnWTQrOuBgX/5j9tO8IQu87IeABr0xTg9FLArj+SufpH+MJ5CPC0i
 ZBgd6qFFX1apQ+y/iHxCCIIv3XrLyQfDw1DONznZ4lPjE8JFQOlq9clee Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259891956"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259891956"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 23:27:25 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641907327"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 23:27:23 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: eric.auger@redhat.com,
	mst@redhat.com
Subject: [PATCH v2] virtio-iommu: Fix the partial copy of probe request
Date: Fri, 17 Jun 2022 14:20:24 +0800
Message-Id: <20220617062024.3168331-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=zhenzhong.duan@intel.com; helo=mga17.intel.com
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

Fixes: 1733eebb9e75b ("virtio-iommu: Implement RESV_MEM probe request")
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 v2: keep bugfix change and drop cleanup change

 hw/virtio/virtio-iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 7c122ab95780..195f909620ab 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -708,7 +708,8 @@ static int virtio_iommu_handle_probe(VirtIOIOMMU *s,
                                      uint8_t *buf)
 {
     struct virtio_iommu_req_probe req;
-    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req));
+    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req,
+                    sizeof(req) + sizeof(struct virtio_iommu_req_tail));
 
     return ret ? ret : virtio_iommu_probe(s, &req, buf);
 }
-- 
2.25.1


