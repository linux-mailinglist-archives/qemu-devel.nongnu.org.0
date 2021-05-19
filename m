Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9903C389413
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:48:48 +0200 (CEST)
Received: from localhost ([::1]:37686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPNH-0005RN-LQ
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP7y-0007hc-4e
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP7u-0006Ip-E3
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Va3lQ1jFZTAO+vX7RJUj5VEK4CtKAhX+9xJSzKnaFW8=;
 b=bz9Ezg1ay0i8t4whjN81mRUchum0VhuIsUTWMnVPMlJ4LYrQ57JNj62Qw/z+eXoYnnhbGl
 NGGjBl6wq0F0vxKNFsUj9wzSNsyQEDJi2kgWDS4+zRTcIzJYA3iRSoLpDUd79QlXj8tifn
 kM7qS7kgEQWrp5Y1jhMvyEFQ69abtyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-LriYgRduOnyrXhT_r14bpw-1; Wed, 19 May 2021 12:32:51 -0400
X-MC-Unique: LriYgRduOnyrXhT_r14bpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A5AB1854E2D;
 Wed, 19 May 2021 16:32:50 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1A225D6AC;
 Wed, 19 May 2021 16:32:43 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 29/29] vhost: Start vhost-vdpa SVQ directly
Date: Wed, 19 May 2021 18:29:03 +0200
Message-Id: <20210519162903.1172366-30-eperezma@redhat.com>
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since it does not have sense to keep a non-working vdpa device, start
directly in SVQ mode.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 286863ad42..fd812e1a80 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1386,7 +1386,6 @@ static bool vhost_sw_live_migration_start_vq(struct vhost_dev *dev,
         assert(r == VHOST_DMA_MAP_OK);
     }
 
-    vhost_virtqueue_stop(dev, dev->vdev, &dev->vqs[idx], dev->vq_index + idx);
     /* TODO: Why cannot make this read only? */
     r = vhost_vdpa_dma_map(dev->opaque, addr.desc_user_addr, driver_region.size,
                            (void *)driver_region.translated_addr, false);
@@ -1467,6 +1466,11 @@ static int vhost_sw_live_migration_start(struct vhost_dev *dev)
 
     /* Can be read by vhost_virtqueue_mask, from vm exit */
     dev->shadow_vqs_enabled = true;
+
+    /* Reset device, so SVQ can assign its address */
+    r = dev->vhost_ops->vhost_dev_start(dev, false);
+    assert(r == 0);
+
     for (idx = 0; idx < dev->nvqs; ++idx) {
         bool ok = vhost_sw_live_migration_start_vq(dev, idx);
         if (unlikely(!ok)) {
@@ -2107,6 +2111,8 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
             vhost_device_iotlb_miss(hdev, vq->used_phys, true);
         }
     }
+
+    vhost_sw_live_migration_start(hdev);
     return 0;
 fail_log:
     vhost_log_put(hdev, false);
-- 
2.27.0


