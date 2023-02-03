Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1EE68A2B2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 20:13:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO1U0-0006c4-RI; Fri, 03 Feb 2023 14:12:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pO1To-0006ZF-HN
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 14:12:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pO1Tn-0007Yv-09
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 14:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675451528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbe2RQY0RLyncYTUFWY0cPcVrWsqzfZRkDYAiCISaW0=;
 b=JmMJad1ALCYHYqavzPElE7BGpx6EnwBqRtZQl4OogoxGLaL9UdVSkCSYsLeg5M2zOWaJN8
 Jarz1twHPbucowJo1IAgjneymgp9PEwiNSXFApj2BebcTiyAu2G0+2KzyOxpBog67anHnW
 zVKPGthy5yoNLaCZL+JpN6/pMW/alN4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-CgbVeW8FN6aJR3oAH9U1xQ-1; Fri, 03 Feb 2023 14:12:04 -0500
X-MC-Unique: CgbVeW8FN6aJR3oAH9U1xQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E1CB100F909;
 Fri,  3 Feb 2023 19:12:04 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3D87492C14;
 Fri,  3 Feb 2023 19:12:00 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, longpeng2@huawei.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Parav Pandit <parav@mellanox.com>, si-wei.liu@oracle.com,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH 05/13] vdpa: rewind at get_base, not set_base
Date: Fri,  3 Feb 2023 20:11:34 +0100
Message-Id: <20230203191142.362623-6-eperezma@redhat.com>
In-Reply-To: <20230203191142.362623-1-eperezma@redhat.com>
References: <20230203191142.362623-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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
index 6d20d70601..6385c16a55 100644
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


