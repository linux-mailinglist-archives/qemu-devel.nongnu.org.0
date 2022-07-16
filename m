Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6225576D8D
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 13:37:02 +0200 (CEST)
Received: from localhost ([::1]:60362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCg6Y-0001ae-0u
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 07:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCg46-00058o-2A
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 07:34:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCg42-0006ym-Ju
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 07:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657971264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DpSt7JMQBZ++VGl+BnzhEQRAj5HaqmmYD+c9V6YVc/E=;
 b=eZz9XEKtM0mIeBh2f5z6fz4i74UTchF6LqBPN4p31Uy9/NZ56bwYr5AcmLzrpQwlLheJxq
 5DibR1yto0mbktmENBNGb6u23HS/AaG2s0QfsDCRVGN2JA/YsFuTJ8ui1+FpxIGlOE4of2
 0CB7TgODlRBkBpeYCQcvgZvj86ecaCg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-a140c5aINLaRuhGDWWuDKg-1; Sat, 16 Jul 2022 07:34:20 -0400
X-MC-Unique: a140c5aINLaRuhGDWWuDKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0399B3C01C0D;
 Sat, 16 Jul 2022 11:34:20 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2F9F40E80E0;
 Sat, 16 Jul 2022 11:34:15 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Gautam Dawar <gdawar@xilinx.com>
Subject: [RFC PATCH 01/12] vhost: Get vring base from vq, not svq
Date: Sat, 16 Jul 2022 13:33:56 +0200
Message-Id: <20220716113407.2730331-2-eperezma@redhat.com>
In-Reply-To: <20220716113407.2730331-1-eperezma@redhat.com>
References: <20220716113407.2730331-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

The SVQ vring used idx usually match with the guest visible one, as long
as all the guest buffers (GPA) maps to exactly one buffer within qemu's
VA. However, as we can see in virtqueue_map_desc, a single guest buffer
could map to many buffers in SVQ vring.

The solution is to stop using the device's used idx and check for the
last avail idx. Since we cannot report in-flight descriptors with vdpa,
let's rewind all of them.

Fixes: 6d0b22266633 ("vdpa: Adapt vhost_vdpa_get_vring_base to SVQ")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 795ed5a049..18820498b3 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1194,11 +1194,10 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
     struct vhost_vdpa *v = dev->opaque;
-    int vdpa_idx = ring->index - dev->vq_index;
     int ret;
 
     if (v->shadow_vqs_enabled) {
-        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
+        VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
 
         /*
          * Setting base as last used idx, so destination will see as available
@@ -1208,7 +1207,10 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
          * TODO: This is ok for networking, but other kinds of devices might
          * have problems with these retransmissions.
          */
-        ring->num = svq->last_used_idx;
+        while (virtqueue_rewind(vq, 1)) {
+            continue;
+        }
+        ring->num = virtio_queue_get_last_avail_idx(dev->vdev, ring->index);
         return 0;
     }
 
-- 
2.31.1


