Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9897482F7A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 10:32:35 +0100 (CET)
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Jhi-0007Y5-98
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 04:32:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andy.pei@intel.com>)
 id 1n4JgM-0006hG-Q0; Mon, 03 Jan 2022 04:31:10 -0500
Received: from mga09.intel.com ([134.134.136.24]:28830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andy.pei@intel.com>)
 id 1n4JgI-00062X-0v; Mon, 03 Jan 2022 04:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641202266; x=1672738266;
 h=from:to:cc:subject:date:message-id;
 bh=QtN6DoYbBGpaNz1jTGZ+jQz36rppjkqXmRULQJ4B3H8=;
 b=iYDRFp9Hriie23Wb/Yzqonqts5hIpve5qDFL+f2SultvZ5BOryUpBpvp
 LO2o+twgiYq9v0gjMnfOUs6oXI3scMsGP437zQQMPrtgChuAOMXN5KU5F
 +VxHsEusNZWZvK65fCqnrFTfmYKOTPDluPnDH2zv85bFYCV+wSq2/XVxS
 dJ5hZ3r1veN8m77KwG5Ntd8WzDtOtC1DIbeNLgOXd4Pxp0O3P+gdxR2Lr
 3KSUbmfhrh9kwigKlW2mmqTrQCcoGJtKIGCRIp5bhlytlo5qaDe4HIp5I
 JwMbORoAv/4I5p57GcmGnuoUsmd3Uy+JJhr/IDjKmLjADScyeWwoc02IM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10215"; a="241837324"
X-IronPort-AV: E=Sophos;i="5.88,257,1635231600"; d="scan'208";a="241837324"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2022 01:31:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,257,1635231600"; d="scan'208";a="525499830"
Received: from dpdk-dipei.sh.intel.com ([10.67.111.91])
 by orsmga008.jf.intel.com with ESMTP; 03 Jan 2022 01:31:01 -0800
From: Andy Pei <andy.pei@intel.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v2] hw/vhost-user-blk: turn on VIRTIO_BLK_F_SIZE_MAX feature
 for virtio blk device
Date: Mon,  3 Jan 2022 17:28:12 +0800
Message-Id: <1641202092-149677-1-git-send-email-andy.pei@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=134.134.136.24; envelope-from=andy.pei@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, mst@redhat.com, changpeng.liu@intel.com,
 mreitz@redhat.com, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Turn on pre-defined feature VIRTIO_BLK_F_SIZE_MAX for virtio blk device to
avoid guest DMA request sizes which are too large for hardware spec.

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


