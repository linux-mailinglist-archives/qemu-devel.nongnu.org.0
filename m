Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2480933C730
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:56:03 +0100 (CET)
Received: from localhost ([::1]:38354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtJq-0004fH-64
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtDl-0005gE-JI
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtDj-00048q-TM
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615837783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vd99cAaSU6abm6dJJrsG/VaQ4xBejc6I+hFkbFVbYYg=;
 b=YFQ7U0gfK1hGEMSb6raGMb2Vceekt6XNN3L4KhmpZUuBJkkRM7zR3lISZnBRgkOAM5YxTV
 h6OV8GNNX98YJIYtSaoZ46FpXAvxo6tqhk9zzsaZwCFotPXv/yi6V2MbNaQOkpUKRXN4Ub
 2yYD9z9mM3G7GxPNreXUIgdBxZjj/0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-12HN0WNgNReWuLyaKBKEAg-1; Mon, 15 Mar 2021 15:49:41 -0400
X-MC-Unique: 12HN0WNgNReWuLyaKBKEAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95DC392502;
 Mon, 15 Mar 2021 19:49:39 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-173.ams2.redhat.com
 [10.36.112.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4614A1C4;
 Mon, 15 Mar 2021 19:49:36 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 09/13] virtio: Add virtio_queue_full
Date: Mon, 15 Mar 2021 20:48:38 +0100
Message-Id: <20210315194842.277740-10-eperezma@redhat.com>
In-Reply-To: <20210315194842.277740-1-eperezma@redhat.com>
References: <20210315194842.277740-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Guru Prasad <guru.prasad@broadcom.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check if all descriptors of the queue are available. In other words, is
the complete opposite of virtio_queue_empty: If the queue is full, the
driver cannot transfer more buffers to the device until the latter
make some as used.

In Shadow vq this situation happens with the correct guest network
driver, since the rx queue is filled for the device to write. Since
Shadow Virtqueue forward the available ones blindly, it will call the
driver forever for them, reaching the point where no more descriptors
are available.

While a straightforward solution is to keep the count of them in SVQ,
this specific issue is the only need for that counter. Exposing this
check helps to keep the SVQ simpler storing as little status as
possible.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio.h |  2 ++
 hw/virtio/virtio.c         | 18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index c2c7cee993..899c5e3506 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -232,6 +232,8 @@ int virtio_queue_ready(VirtQueue *vq);
 
 int virtio_queue_empty(VirtQueue *vq);
 
+bool virtio_queue_full(const VirtQueue *vq);
+
 /* Host binding interface.  */
 
 uint32_t virtio_config_readb(VirtIODevice *vdev, uint32_t addr);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index a86b3f9c26..e9a4d9ffae 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -670,6 +670,20 @@ int virtio_queue_empty(VirtQueue *vq)
     }
 }
 
+/*
+ * virtio_queue_full:
+ * @vq The #VirtQueue
+ *
+ * Check if all descriptors of the queue are available. In other words, is the
+ * complete opposite of virtio_queue_empty: If the queue is full, the driver
+ * cannot transfer more buffers to the device until the latter make some as
+ * used.
+ */
+bool virtio_queue_full(const VirtQueue *vq)
+{
+    return vq->inuse >= vq->vring.num;
+}
+
 static void virtqueue_unmap_sg(VirtQueue *vq, const VirtQueueElement *elem,
                                unsigned int len)
 {
@@ -1439,7 +1453,7 @@ static void *virtqueue_split_pop(VirtQueue *vq, size_t sz)
 
     max = vq->vring.num;
 
-    if (vq->inuse >= vq->vring.num) {
+    if (unlikely(virtio_queue_full(vq))) {
         virtio_error(vdev, "Virtqueue size exceeded");
         goto done;
     }
@@ -1574,7 +1588,7 @@ static void *virtqueue_packed_pop(VirtQueue *vq, size_t sz)
 
     max = vq->vring.num;
 
-    if (vq->inuse >= vq->vring.num) {
+    if (unlikely(virtio_queue_full(vq))) {
         virtio_error(vdev, "Virtqueue size exceeded");
         goto done;
     }
-- 
2.27.0


