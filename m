Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 783A56229CF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 12:12:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osiyk-0002Dw-9M; Wed, 09 Nov 2022 06:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1osiyf-0002CV-2X
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 06:10:41 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1osiyW-000283-5p
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 06:10:40 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VUNyWwp_1667992221; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VUNyWwp_1667992221) by smtp.aliyun-inc.com;
 Wed, 09 Nov 2022 19:10:22 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, stefanha@gmail.com,
 lersek@redhat.com, jasowang@redhat.com, peter.maydell@linaro.org,
 kraxel@redhat.com
Subject: [PATCH] virtio: remove the excess virtio features check
Date: Wed,  9 Nov 2022 19:10:21 +0800
Message-Id: <20221109111021.24344-1-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
X-Git-Hash: e09a80c2ea
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In virtio_queue_enable(), we checked virtio feature VIRTIO_F_VERSION_1.

This check is not necessary, and conflict with SeaBIOS. The problem
appeared in SeaBIOS. But we also remove this check.

Link: https://www.mail-archive.com/qemu-devel@nongnu.org/msg920538.html
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/virtio/virtio.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9683b2e158..701e23ea6a 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2499,11 +2499,6 @@ void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
 {
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
 
-    if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
-        error_report("queue_enable is only suppported in devices of virtio "
-                     "1.0 or later.");
-    }
-
     if (k->queue_enable) {
         k->queue_enable(vdev, queue_index);
     }
-- 
2.32.0.3.g01195cf9f


