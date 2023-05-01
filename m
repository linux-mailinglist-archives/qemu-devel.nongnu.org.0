Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0799F6F42EC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:42:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptoNG-0005iD-9r; Tue, 02 May 2023 07:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptoNA-0005hP-TI
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:40:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptoN9-0005yH-78
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683027642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hiyt/nnCAi9VEFBvwMEV4f6dS2T9p6uQ9qNy9qLBFEA=;
 b=R4Ys9IBIzIBP9BwZ4dwFTf5RigN/kp5Shm0q1ztmvHwnbHoelUtbnCRyrXrry6Bg1jwWwV
 fgCfYt3eAvWO8/DsjA7hinT6mkK/TgbMhhxR3TcolJnvG7F3nNsbO3clsgarU/uOJmKzGc
 /5vFMBbSowiwTndakd17bitdBwssLvc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-JEkoBolOO6m203G4m0BnVw-1; Tue, 02 May 2023 07:40:39 -0400
X-MC-Unique: JEkoBolOO6m203G4m0BnVw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3440884EC0;
 Tue,  2 May 2023 11:40:38 +0000 (UTC)
Received: from localhost (unknown [10.39.194.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42FFA492B03;
 Tue,  2 May 2023 11:40:37 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Yajun Wu <yajunw@nvidia.com>
Subject: [PATCH v2] vhost-user: send SET_STATUS 0 after GET_VRING_BASE
Date: Mon,  1 May 2023 19:04:09 -0400
Message-Id: <20230501230409.274178-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.171, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Setting the VIRTIO Device Status Field to 0 resets the device. The
device's state is lost, including the vring configuration.

vhost-user.c currently sends SET_STATUS 0 before GET_VRING_BASE. This
risks confusion about the lifetime of the vhost-user state (e.g. vring
last_avail_idx) across VIRTIO device reset.

Eugenio Pérez <eperezma@redhat.com> adjusted the order for vhost-vdpa.c
in commit c3716f260bff ("vdpa: move vhost reset after get vring base")
and in that commit description suggested doing the same for vhost-user
in the future.

Go ahead and adjust vhost-user.c now. I ran various online code searches
to identify vhost-user backends implementing SET_STATUS. It seems only
DPDK implements SET_STATUS and Yajun Wu <yajunw@nvidia.com> has
confirmed that it is safe to make this change.

Fixes: commit 923b8921d210763359e96246a58658ac0db6c645 ("vhost-user: Support vhost_dev_start")
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>
Cc: Yajun Wu <yajunw@nvidia.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
v2:
- Added VHOST_USER_PROTOCOL_F_STATUS check [Yajun Wu]
- Added "Fixes:" tag [Michael]
---
 hw/virtio/vhost-user.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index e5285df4ba..40974afd06 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -2677,7 +2677,20 @@ static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
                                           VIRTIO_CONFIG_S_DRIVER |
                                           VIRTIO_CONFIG_S_DRIVER_OK);
     } else {
-        return vhost_user_set_status(dev, 0);
+        return 0;
+    }
+}
+
+static void vhost_user_reset_status(struct vhost_dev *dev)
+{
+    /* Set device status only for last queue pair */
+    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
+        return;
+    }
+
+    if (virtio_has_feature(dev->protocol_features,
+                           VHOST_USER_PROTOCOL_F_STATUS)) {
+        vhost_user_set_status(dev, 0);
     }
 }
 
@@ -2716,4 +2729,5 @@ const VhostOps user_ops = {
         .vhost_get_inflight_fd = vhost_user_get_inflight_fd,
         .vhost_set_inflight_fd = vhost_user_set_inflight_fd,
         .vhost_dev_start = vhost_user_dev_start,
+        .vhost_reset_status = vhost_user_reset_status,
 };
-- 
2.40.1


