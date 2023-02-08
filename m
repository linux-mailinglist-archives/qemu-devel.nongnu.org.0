Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8406368EBE7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:43:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgz9-0005Fd-8F; Wed, 08 Feb 2023 04:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgz6-00059c-B9
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgz4-0005c5-4n
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675849401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sc6f0oTgOqC7WhrLqgiGyfEdfKfEHQtA1UndKmWU7uo=;
 b=GsZ4ivL1owlm6YeUv4HpBFHpGdsDeR2oQ96JMclzHUv/NffxV6mml1B2JjsWZdiq7MEHaF
 bdTt/MI56WR+iMhJqnTbTirbdNgWxSvCJXiJytLoi30WfEhcwon/C+YCsVQkAAw3HTufcv
 Byk/d/k5OB9Qj3JNkU10OefI3YHT5Zc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-YyQkoIczM72GeOT5A9sa7Q-1; Wed, 08 Feb 2023 04:43:16 -0500
X-MC-Unique: YyQkoIczM72GeOT5A9sa7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA7E3811E6E;
 Wed,  8 Feb 2023 09:43:15 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C37D92166B29;
 Wed,  8 Feb 2023 09:43:12 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, alvaro.karsz@solid-run.com,
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
Subject: [PATCH v2 05/13] vdpa: rewind at get_base, not set_base
Date: Wed,  8 Feb 2023 10:42:45 +0100
Message-Id: <20230208094253.702672-6-eperezma@redhat.com>
In-Reply-To: <20230208094253.702672-1-eperezma@redhat.com>
References: <20230208094253.702672-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

At this moment it is only possible to migrate to a vdpa device running
with x-svq=on. As a protective measure, the rewind of the inflight
descriptors was done at the destination. That way if the source sent a
virtqueue with inuse descriptors they are always discarded.

Since this series allows to migrate also to passthrough devices with no
SVQ, the right thing to do is to rewind at the source so the base of
vrings are correct.

Support for inflight descriptors may be added in the future.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 26e38a6aab..d99db0bd03 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1211,18 +1211,7 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
     struct vhost_vdpa *v = dev->opaque;
-    VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
 
-    /*
-     * vhost-vdpa devices does not support in-flight requests. Set all of them
-     * as available.
-     *
-     * TODO: This is ok for networking, but other kinds of devices might
-     * have problems with these retransmissions.
-     */
-    while (virtqueue_rewind(vq, 1)) {
-        continue;
-    }
     if (v->shadow_vqs_enabled) {
         /*
          * Device vring base was set at device start. SVQ base is handled by
@@ -1241,6 +1230,19 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
     int ret;
 
     if (v->shadow_vqs_enabled) {
+        VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
+
+        /*
+         * vhost-vdpa devices does not support in-flight requests. Set all of
+         * them as available.
+         *
+         * TODO: This is ok for networking, but other kinds of devices might
+         * have problems with these retransmissions.
+         */
+        while (virtqueue_rewind(vq, 1)) {
+            continue;
+        }
+
         ring->num = virtio_queue_get_last_avail_idx(dev->vdev, ring->index);
         return 0;
     }
-- 
2.31.1


