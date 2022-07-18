Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E585B57821F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:21:58 +0200 (CEST)
Received: from localhost ([::1]:44950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPl7-000637-2o
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDPVi-0008TY-6t
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:06:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDPVf-0007yl-04
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658145956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FPKF+u6bmU24/j5oOg6MQgmQNT9GBn5jiO6sHlNJEUg=;
 b=hh/0TmO8r6TrzOLwvjGcfDXFtjWBH82NLuRW2tjHOmC7sQZ5buNTYCE1yIZu1uH0jk/NZN
 Lbimr32o7t4oEgxN7Vf3nZ6vONPv+ZMsZefG0dUaOUwY2JhUsMGXNGT8OvhPQ/+NkSq5LJ
 p93BEmWW2NSbWNj+tbYPB7HST8bKtMY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-VKHkGgo2P4u0NDPgDJI0qg-1; Mon, 18 Jul 2022 08:05:48 -0400
X-MC-Unique: VKHkGgo2P4u0NDPgDJI0qg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69E95101A589
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 12:05:48 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA91E141511F;
 Mon, 18 Jul 2022 12:05:47 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2] vhost: Get vring base from vq, not svq
Date: Mon, 18 Jul 2022 14:05:45 +0200
Message-Id: <20220718120545.2879871-1-eperezma@redhat.com>
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

The SVQ vring used idx usually match with the guest visible one, as long
as all the guest buffers (GPA) maps to exactly one buffer within qemu's
VA. However, as we can see in virtqueue_map_desc, a single guest buffer
could map to many buffers in SVQ vring.

Also, its also a mistake to rewind them at the source of migration.
Since VirtQueue is able to migrate the inflight descriptors, its
responsability of the destination to perform the rewind just in case it
cannot report the inflight descriptors to the device.

This makes easier to migrate between backends or to recover them in
vhost devices that support set in flight descriptors.

Fixes: 6d0b22266633 ("vdpa: Adapt vhost_vdpa_get_vring_base to SVQ")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

--
v2: Squash both fixes in one.
---
 hw/virtio/vhost-vdpa.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 795ed5a049..4458c8d23e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1178,7 +1178,18 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
     struct vhost_vdpa *v = dev->opaque;
+    VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);

+    /*
+     * vhost-vdpa devices does not support in-flight requests. Set all of them
+     * as available.
+     *
+     * TODO: This is ok for networking, but other kinds of devices might
+     * have problems with these retransmissions.
+     */
+    while (virtqueue_rewind(vq, 1)) {
+        continue;
+    }
     if (v->shadow_vqs_enabled) {
         /*
          * Device vring base was set at device start. SVQ base is handled by
@@ -1194,21 +1205,10 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
     struct vhost_vdpa *v = dev->opaque;
-    int vdpa_idx = ring->index - dev->vq_index;
     int ret;

     if (v->shadow_vqs_enabled) {
-        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
-
-        /*
-         * Setting base as last used idx, so destination will see as available
-         * all the entries that the device did not use, including the in-flight
-         * processing ones.
-         *
-         * TODO: This is ok for networking, but other kinds of devices might
-         * have problems with these retransmissions.
-         */
-        ring->num = svq->last_used_idx;
+        ring->num = virtio_queue_get_last_avail_idx(dev->vdev, ring->index);
         return 0;
     }

--
2.31.1


