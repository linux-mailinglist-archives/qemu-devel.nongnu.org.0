Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7EF2BB51D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:21:05 +0100 (CET)
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBxw-00051z-4q
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBZf-0007Rz-Bv
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:56:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBZY-00086K-Ud
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:55:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZxEbXIS4zyXv2m5LGIw7P1HSVQ2S2HneDTGUSzuoD4=;
 b=NeKpx8RDCXzDnVnnSzOwCMIQ8c7SFIOlDZcO5QZWV5zm63yJ5FhSfj5feU2fgi6M/unwvz
 14kE38Y+iNbaK3/Mqvr6bAk3I9U+UHkSo6/AQGONa+p65hTvK4V+OTH9fiv6VNJy8JY6G2
 zI8QWUER6F5hagsRF+QxPfeV+It9FBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-TAvJhVXkPzytOL7DCgwuCw-1; Fri, 20 Nov 2020 13:55:46 -0500
X-MC-Unique: TAvJhVXkPzytOL7DCgwuCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A68DA8030A3;
 Fri, 20 Nov 2020 18:55:43 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 146EB5C1D5;
 Fri, 20 Nov 2020 18:55:30 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 19/27] vhost: add vhost_vring_get_buf_rcu
Date: Fri, 20 Nov 2020 19:50:57 +0100
Message-Id: <20201120185105.279030-20-eperezma@redhat.com>
In-Reply-To: <20201120185105.279030-1-eperezma@redhat.com>
References: <20201120185105.279030-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-sw-lm-ring.h |  1 +
 hw/virtio/vhost-sw-lm-ring.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/hw/virtio/vhost-sw-lm-ring.h b/hw/virtio/vhost-sw-lm-ring.h
index 03257d60c1..429a125558 100644
--- a/hw/virtio/vhost-sw-lm-ring.h
+++ b/hw/virtio/vhost-sw-lm-ring.h
@@ -19,6 +19,7 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
 bool vhost_vring_kick(VhostShadowVirtqueue *vq);
 int vhost_vring_add(VhostShadowVirtqueue *vq, VirtQueueElement *elem);
+VirtQueueElement *vhost_vring_get_buf_rcu(VhostShadowVirtqueue *vq, size_t sz);
 
 /* Called within rcu_read_lock().  */
 void vhost_vring_set_notification_rcu(VhostShadowVirtqueue *vq, bool enable);
diff --git a/hw/virtio/vhost-sw-lm-ring.c b/hw/virtio/vhost-sw-lm-ring.c
index 3652889d8e..4fafd1b278 100644
--- a/hw/virtio/vhost-sw-lm-ring.c
+++ b/hw/virtio/vhost-sw-lm-ring.c
@@ -187,6 +187,35 @@ int vhost_vring_add(VhostShadowVirtqueue *vq, VirtQueueElement *elem)
     return 0;
 }
 
+VirtQueueElement *vhost_vring_get_buf_rcu(VhostShadowVirtqueue *vq, size_t sz)
+{
+    const vring_used_t *used = vq->vring.used;
+    VirtQueueElement *ret;
+    vring_used_elem_t used_elem;
+    uint16_t last_used;
+
+    if (!vhost_vring_poll_rcu(vq)) {
+        return NULL;
+    }
+
+    last_used = vq->used_idx & (vq->vring.num - 1);
+    used_elem.id = virtio_tswap32(vq->vdev, used->ring[last_used].id);
+    used_elem.len = virtio_tswap32(vq->vdev, used->ring[last_used].len);
+
+    if (unlikely(used_elem.id >= vq->vring.num)) {
+        virtio_error(vq->vdev, "Device says index %u is available",
+                     used_elem.id);
+        return NULL;
+    }
+
+    ret = vq->ring_id_maps[used_elem.id];
+    ret->len = used_elem.len;
+
+    vq->used_idx++;
+
+    return ret;
+}
+
 void vhost_vring_write_addr(const VhostShadowVirtqueue *vq,
                             struct vhost_vring_addr *addr)
 {
-- 
2.18.4


