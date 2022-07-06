Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D55569215
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 20:45:26 +0200 (CEST)
Received: from localhost ([::1]:48366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9A1d-0008Ei-EI
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 14:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99x2-00056F-3D
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:40:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99ws-0000nF-1H
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NY2G+SGnz32QRth35C6CWxybrvutzglBHoDq5RtZ7Rc=;
 b=h739M1DiprE0bTuGmkqAeQIdX3P5OYxvz37nylf9YhLYqpl8vHHs6VL2cInr+vqi+GmBB/
 z4O3xeJurITrny9r2HMpD/znur0mkdZ3NTY5YyKGayhyjq/7/mKjFL+LJGxHoXcXWZSUqR
 7ghArEnDdqf4eLDjNLWVsIsYVOjH+uU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-8mrE4SPdOjmp_Pmu7fvGEg-1; Wed, 06 Jul 2022 14:40:25 -0400
X-MC-Unique: 8mrE4SPdOjmp_Pmu7fvGEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE2CD294EDEC;
 Wed,  6 Jul 2022 18:40:24 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ACA71410F3C;
 Wed,  6 Jul 2022 18:40:22 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH v9 04/23] vhost: Get vring base from vq, not svq
Date: Wed,  6 Jul 2022 20:39:49 +0200
Message-Id: <20220706184008.1649478-5-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-1-eperezma@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The used idx used to match with this, but it will not match from the
moment we introduce svq_inject. Rewind all the descriptors not used by
vdpa device and get the vq state properly.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio.h | 1 +
 hw/virtio/vhost-vdpa.c     | 7 +++----
 hw/virtio/virtio.c         | 5 +++++
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf6b..4b51ab9d06 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -302,6 +302,7 @@ hwaddr virtio_queue_get_desc_size(VirtIODevice *vdev, int n);
 hwaddr virtio_queue_get_avail_size(VirtIODevice *vdev, int n);
 hwaddr virtio_queue_get_used_size(VirtIODevice *vdev, int n);
 unsigned int virtio_queue_get_last_avail_idx(VirtIODevice *vdev, int n);
+unsigned int virtio_queue_get_in_use(const VirtQueue *vq);
 void virtio_queue_set_last_avail_idx(VirtIODevice *vdev, int n,
                                      unsigned int idx);
 void virtio_queue_restore_last_avail_idx(VirtIODevice *vdev, int n);
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 2ee8009594..de76128030 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1189,12 +1189,10 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
     struct vhost_vdpa *v = dev->opaque;
-    int vdpa_idx = ring->index - dev->vq_index;
     int ret;
 
     if (v->shadow_vqs_enabled) {
-        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
-
+        const VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
         /*
          * Setting base as last used idx, so destination will see as available
          * all the entries that the device did not use, including the in-flight
@@ -1203,7 +1201,8 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
          * TODO: This is ok for networking, but other kinds of devices might
          * have problems with these retransmissions.
          */
-        ring->num = svq->last_used_idx;
+        ring->num = virtio_queue_get_last_avail_idx(dev->vdev, ring->index) -
+                    virtio_queue_get_in_use(vq);
         return 0;
     }
 
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..e02656f7a2 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3420,6 +3420,11 @@ unsigned int virtio_queue_get_last_avail_idx(VirtIODevice *vdev, int n)
     }
 }
 
+unsigned int virtio_queue_get_in_use(const VirtQueue *vq)
+{
+    return vq->inuse;
+}
+
 static void virtio_queue_packed_set_last_avail_idx(VirtIODevice *vdev,
                                                    int n, unsigned int idx)
 {
-- 
2.31.1


