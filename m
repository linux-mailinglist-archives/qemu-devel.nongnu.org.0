Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391DD308EDF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:59:50 +0100 (CET)
Received: from localhost ([::1]:40718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5art-0002jQ-AW
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5amw-0006oa-T1
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:54:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5amv-0002d7-Ce
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611953680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i9RnuNpZLXz2OkziKFnmRdfAX0eO1bpk6F204EzVNMg=;
 b=TH0/qFB3BnRwmMwSymgffo2MzUKmEiYuvrRgwihqFuu5lH8z4g2j9s7bRk92C0iL9s2/2B
 o96rzVPSFSY3iKLioTZf5u+18i06Ey3NZeKWrs6f52socXDR7+3v5OcjkyNazAU11nru21
 HVuvewaGJOJxxbTuBCWVLsQ+PNLzlZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-klTNv_kuO4aNTzmItSu-9A-1; Fri, 29 Jan 2021 15:54:38 -0500
X-MC-Unique: klTNv_kuO4aNTzmItSu-9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2C74107AD41;
 Fri, 29 Jan 2021 20:54:36 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-115.ams2.redhat.com
 [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82B9819C66;
 Fri, 29 Jan 2021 20:54:33 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 02/10] virtio: Add set_vq_handler
Date: Fri, 29 Jan 2021 21:54:07 +0100
Message-Id: <20210129205415.876290-3-eperezma@redhat.com>
In-Reply-To: <20210129205415.876290-1-eperezma@redhat.com>
References: <20210129205415.876290-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So other subsystem can override vq handler and device can reset it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio.h |  5 +++++
 hw/net/virtio-net.c        | 26 ++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 9b5479e256..9988c6d5c9 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -149,6 +149,11 @@ struct VirtioDeviceClass {
     void (*guest_notifier_mask)(VirtIODevice *vdev, int n, bool mask);
     int (*start_ioeventfd)(VirtIODevice *vdev);
     void (*stop_ioeventfd)(VirtIODevice *vdev);
+    /*
+     * Set handler for a vq. NULL handler for reset to default.
+     */
+    bool (*set_vq_handler)(VirtIODevice *vdev, unsigned int n,
+                           VirtIOHandleOutput handle_output);
     /* Saving and loading of a device; trying to deprecate save/load
      * use vmsd for new devices.
      */
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 5150f295e8..f7b2998fb1 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2699,6 +2699,31 @@ static void virtio_net_set_multiqueue(VirtIONet *n, int multiqueue)
     virtio_net_set_queues(n);
 }
 
+static bool virtio_net_set_vq_handler(VirtIODevice *vdev, unsigned int i,
+                                      VirtIOHandleOutput handle_output)
+{
+    const VirtIONet *n = VIRTIO_NET(vdev);
+    const unsigned max_queues = n->multiqueue ? n->max_queues : 1;
+    VirtQueue *vq;
+
+    /* Reset control queue also not supported */
+    assert(i < max_queues * 2);
+
+    vq = virtio_get_queue(vdev, i);
+    if (handle_output == NULL) {
+        if (i % 2) {
+            handle_output = virtio_net_handle_rx;
+        } else {
+            const VirtIONetQueue *q = &n->vqs[i / 2];
+            handle_output = q->tx_timer ? virtio_net_handle_tx_timer
+                                        : virtio_net_handle_tx_bh;
+        }
+    }
+
+    virtqueue_set_handler(vq, handle_output);
+    return true;
+}
+
 static int virtio_net_post_load_device(void *opaque, int version_id)
 {
     VirtIONet *n = opaque;
@@ -3519,6 +3544,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->set_status = virtio_net_set_status;
     vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
     vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;
+    vdc->set_vq_handler = virtio_net_set_vq_handler;
     vdc->legacy_features |= (0x1 << VIRTIO_NET_F_GSO);
     vdc->post_load = virtio_net_post_load_virtio;
     vdc->vmsd = &vmstate_virtio_net_device;
-- 
2.27.0


