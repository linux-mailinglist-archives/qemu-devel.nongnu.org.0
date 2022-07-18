Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A2D578775
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:33:50 +0200 (CEST)
Received: from localhost ([::1]:41190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTgr-0005uY-5x
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDTdB-0001YR-0N
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:30:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDTd9-0001m5-G3
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658161798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DMIvkXmmZaOxTsInH4pPo+aXPlzf2WfjoAcbktC0adY=;
 b=d9DehMEIj9yH/W4qpsUbquaVXEMq1BAc36zvh3A26hp58j259oXvhm+K1ft9gWUGrCaYbI
 gqz0PqkqO+Uab7dABVWu4jfy0jzB9Wm56xItPiBN/ylqNhCTibtEhjuofmDTDmhfDHhMFN
 B/w7VM1XS1zVeIH2h2+PIrUfHDIZ5R8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-Ra42eaD1PSeV_xG5bk3ucA-1; Mon, 18 Jul 2022 12:29:53 -0400
X-MC-Unique: Ra42eaD1PSeV_xG5bk3ucA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3A183804529;
 Mon, 18 Jul 2022 16:29:52 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1062440E80E0;
 Mon, 18 Jul 2022 16:29:48 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Parav Pandit <parav@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 2/5] vdpa: Extract vhost_vdpa_net_cvq_add from
 vhost_vdpa_net_handle_ctrl_avail
Date: Mon, 18 Jul 2022 18:29:35 +0200
Message-Id: <20220718162938.2938783-3-eperezma@redhat.com>
In-Reply-To: <20220718162938.2938783-1-eperezma@redhat.com>
References: <20220718162938.2938783-1-eperezma@redhat.com>
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

So we can reuse to inject state messages.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 71 ++++++++++++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 27 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 986e6414b4..fa00928854 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -334,6 +334,43 @@ static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
     return true;
 }
 
+static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(VhostShadowVirtqueue *svq,
+                                               const struct iovec *dev_buffers)
+{
+    /* in buffer used for device model */
+    virtio_net_ctrl_ack status;
+    size_t dev_written;
+    int r;
+    void *unused = (void *)1;
+
+    r = vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, unused);
+    if (unlikely(r != 0)) {
+        if (unlikely(r == -ENOSPC)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue\n",
+                          __func__);
+        }
+        return VIRTIO_NET_ERR;
+    }
+
+    /*
+     * We can poll here since we've had BQL from the time we sent the
+     * descriptor. Also, we need to take the answer before SVQ pulls by itself,
+     * when BQL is released
+     */
+    dev_written = vhost_svq_poll(svq);
+    if (unlikely(dev_written < sizeof(status))) {
+        error_report("Insufficient written data (%zu)", dev_written);
+        return VIRTIO_NET_ERR;
+    }
+
+    memcpy(&status, dev_buffers[1].iov_base, sizeof(status));
+    if (status != VIRTIO_NET_OK) {
+        return VIRTIO_NET_ERR;
+    }
+
+    return VIRTIO_NET_OK;
+}
+
 /**
  * Do not forward commands not supported by SVQ. Otherwise, the device could
  * accept it and qemu would not know how to update the device model.
@@ -380,19 +417,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
                                             void *opaque)
 {
     VhostVDPAState *s = opaque;
-    size_t in_len, dev_written;
+    size_t in_len;
     virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
     /* out and in buffers sent to the device */
     struct iovec dev_buffers[2] = {
         { .iov_base = s->cvq_cmd_out_buffer },
         { .iov_base = s->cvq_cmd_in_buffer },
     };
-    /* in buffer used for device model */
+    /* in buffer seen by virtio-net device model */
     const struct iovec in = {
         .iov_base = &status,
         .iov_len = sizeof(status),
     };
-    int r;
     bool ok;
 
     ok = vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
@@ -405,35 +441,16 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
         goto out;
     }
 
-    r = vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, elem);
-    if (unlikely(r != 0)) {
-        if (unlikely(r == -ENOSPC)) {
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue\n",
-                          __func__);
-        }
-        goto out;
-    }
-
-    /*
-     * We can poll here since we've had BQL from the time we sent the
-     * descriptor. Also, we need to take the answer before SVQ pulls by itself,
-     * when BQL is released
-     */
-    dev_written = vhost_svq_poll(svq);
-    if (unlikely(dev_written < sizeof(status))) {
-        error_report("Insufficient written data (%zu)", dev_written);
-        goto out;
-    }
-
-    memcpy(&status, dev_buffers[1].iov_base, sizeof(status));
+    status = vhost_vdpa_net_cvq_add(svq, dev_buffers);
     if (status != VIRTIO_NET_OK) {
         goto out;
     }
 
     status = VIRTIO_NET_ERR;
-    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
-    if (status != VIRTIO_NET_OK) {
+    in_len = virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
+    if (in_len != sizeof(status) || status != VIRTIO_NET_OK) {
         error_report("Bad CVQ processing in model");
+        return VIRTIO_NET_ERR;
     }
 
 out:
@@ -450,7 +467,7 @@ out:
     if (dev_buffers[1].iov_base) {
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[1].iov_base);
     }
-    return r;
+    return status == VIRTIO_NET_OK ? 0 : 1;
 }
 
 static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
-- 
2.31.1


