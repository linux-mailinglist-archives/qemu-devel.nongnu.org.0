Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFA5580F74
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 10:57:48 +0200 (CEST)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGGNv-0004qz-UE
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 04:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGGHZ-0007Ku-3Y
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:51:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGGHW-0000vR-QD
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658825470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wPBU5VFGQvjjlhsAJQEvDheuBYa6yuwCIyxePdi56hA=;
 b=Ck8g8rd/CV6s4f6lGsXya/5l3nFLvsVf0GWOwUfzNIYxq1+i42NJ6F1+vBrh4lP0aqvE0C
 zzDocC1xSd8iPqcSfYbAd6NJ2CKO46i0CfAP5r8MPNoi257wN+AvY/kk4WufAbkUwGdkba
 w/m27wRmUd2ETIZb7BDKonqTUGu8sXE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-CJwduvR9P9O1Q0brOLP4_Q-1; Tue, 26 Jul 2022 04:51:05 -0400
X-MC-Unique: CJwduvR9P9O1Q0brOLP4_Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EBF3811E80;
 Tue, 26 Jul 2022 08:51:05 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-201.pek2.redhat.com
 [10.72.12.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA2BD492CA2;
 Tue, 26 Jul 2022 08:51:02 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 2/3] vhost: Get vring base from vq, not svq
Date: Tue, 26 Jul 2022 16:50:54 +0800
Message-Id: <20220726085055.17239-3-jasowang@redhat.com>
In-Reply-To: <20220726085055.17239-1-jasowang@redhat.com>
References: <20220726085055.17239-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

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
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 291cd19..bce64f4 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1179,7 +1179,18 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
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
@@ -1195,21 +1206,10 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
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
2.7.4


