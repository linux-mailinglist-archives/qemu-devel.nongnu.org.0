Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06A545E581
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 03:45:22 +0100 (CET)
Received: from localhost ([::1]:45440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqREm-0007Uv-Fw
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 21:45:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andy.pei@intel.com>)
 id 1mqRDh-0005jm-6q; Thu, 25 Nov 2021 21:44:13 -0500
Received: from mga09.intel.com ([134.134.136.24]:23132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andy.pei@intel.com>)
 id 1mqRDe-0002ut-R1; Thu, 25 Nov 2021 21:44:12 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="235418676"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="235418676"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 18:44:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="607710459"
Received: from dpdk-dipei.sh.intel.com ([10.67.111.91])
 by orsmga004.jf.intel.com with ESMTP; 25 Nov 2021 18:44:05 -0800
From: Andy Pei <andy.pei@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/vhost-user-blk: turn on VIRTIO_BLK_F_SIZE_MAX feature for
 virtio blk device
Date: Fri, 26 Nov 2021 10:00:18 +0800
Message-Id: <1637892018-89555-1-git-send-email-andy.pei@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=134.134.136.24; envelope-from=andy.pei@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com, mreitz@redhat.com,
 raphael.norwitz@nutanix.com, changpeng.liu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Turn on pre-defined feature VIRTIO_BLK_F_SIZE_MAX virtio blk device
to avoid guest DMA request size is too large to exceed hardware spec.

Signed-off-by: Andy Pei <andy.pei@intel.com>
---
 hw/block/vhost-user-blk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index ba13cb8..eb1264a 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -252,6 +252,7 @@ static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
 
     /* Turn on pre-defined features */
+    virtio_add_feature(&features, VIRTIO_BLK_F_SIZE_MAX);
     virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
     virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
     virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
-- 
1.8.3.1


