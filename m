Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75AA54EFE0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 05:52:07 +0200 (CEST)
Received: from localhost ([::1]:60302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o231i-0003ZB-U6
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 23:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o230X-0002rl-0K
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 23:50:53 -0400
Received: from mga18.intel.com ([134.134.136.126]:17374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o230U-0004yu-9B
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 23:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655437850; x=1686973850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8n0DvnNmbzPU+uyo0wJ9LEDtlQKHr9Ebt28YUEBqrnE=;
 b=YzDul3PzR/yP6lnX+U1X9qNV4haJl6ms67U43DOL7XDrDs5pCXN7bzuB
 yKneL77Fk+Rjf3ppLOf5w4PcAQwu/d3DtjkgAsWQbL/YS5/3aDW2k8Skd
 i1+0B8lRHaUF86lAHBZVsoHCSbYrzMdSvpet8tRaVrdrQVKJZlGUemPfp
 pCkgZQY8s47Q+AXO+dsxvTBHW8JNPuzviiyNmr3YG4nRCD2unPPyTba70
 mUIv+No1goyLIWDHsoSXiLi0dlu2uuF/YdKpk6z8DAx2auzNAHj1fca74
 ymdvxnArdPAvXozl0RA6ltZyEAOZ2QvpcJAngDVa16/PnATD1AYSGOT/u Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="262429388"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="262429388"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 20:50:46 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641857605"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 20:50:45 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: eric.auger@redhat.com,
	mst@redhat.com
Subject: [PATCH] virtio-iommu: Fix the partial copy of probe request
Date: Fri, 17 Jun 2022 11:43:48 +0800
Message-Id: <20220617034348.3162918-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=zhenzhong.duan@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The structure of probe request doesn't include the tail, this lead to
a few field is missed to be copied. Currently this isn't an issue as
those missed field belong to reserved field, just in case reserved
field will be used in the future.

By this chance, also remove a few useless code.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/virtio/virtio-iommu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 7c122ab95780..bc96caf37c0c 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -656,19 +656,16 @@ static int virtio_iommu_probe(VirtIOIOMMU *s,
                               uint8_t *buf)
 {
     uint32_t ep_id = le32_to_cpu(req->endpoint);
-    size_t free = VIOMMU_PROBE_SIZE;
     ssize_t count;
 
     if (!virtio_iommu_mr(s, ep_id)) {
         return VIRTIO_IOMMU_S_NOENT;
     }
 
-    count = virtio_iommu_fill_resv_mem_prop(s, ep_id, buf, free);
+    count = virtio_iommu_fill_resv_mem_prop(s, ep_id, buf, VIOMMU_PROBE_SIZE);
     if (count < 0) {
         return VIRTIO_IOMMU_S_INVAL;
     }
-    buf += count;
-    free -= count;
 
     return VIRTIO_IOMMU_S_OK;
 }
@@ -708,7 +705,8 @@ static int virtio_iommu_handle_probe(VirtIOIOMMU *s,
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


