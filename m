Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7585881B5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 20:09:58 +0200 (CEST)
Received: from localhost ([::1]:55080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIwL7-00016n-Ps
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 14:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIw9V-0001MW-Pu
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 13:57:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIw9U-0003gT-09
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 13:57:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659463075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OsCSTTnWlEBOYdl6G8Z7JvD5ZH5EWFYrxQxq3Q3qHIw=;
 b=eiNM3hHFO4FrRBBKk6wFfvn5XKPBWHlDBkRPuqHe6sdCUui39NYQJc2ofYZ9I0ZyOp7PwA
 Zc2VjhION7Cndx/pVIbwdV0p2E3huoBCGh9UXSq7BsqdDgEN98SgRlm9QJObhzbd87W6zX
 GuniEb6PgNiVP3sAHG0/Elz+obMY1CM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-PFPT8DZyPTqInGYdnuUkIw-1; Tue, 02 Aug 2022 13:57:51 -0400
X-MC-Unique: PFPT8DZyPTqInGYdnuUkIw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16B788037AC;
 Tue,  2 Aug 2022 17:57:51 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E45E492C3B;
 Tue,  2 Aug 2022 17:57:48 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH v5 05/10] vdpa: Extract vhost_vdpa_net_cvq_add from
 vhost_vdpa_net_handle_ctrl_avail
Date: Tue,  2 Aug 2022 19:57:26 +0200
Message-Id: <20220802175731.312115-6-eperezma@redhat.com>
In-Reply-To: <20220802175731.312115-1-eperezma@redhat.com>
References: <20220802175731.312115-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

So we can reuse it to inject state messages.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
--
v5:
* Do not use an artificial !NULL VirtQueueElement
* Use only out size instead of iovec dev_buffers for these functions.
---
 net/vhost-vdpa.c | 73 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 24 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index c6699edfbc..33bf3d6409 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -329,6 +329,52 @@ static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
     return true;
 }
 
+static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(VhostVDPAState *s,
+                                                  size_t out_len)
+{
+    /* Buffers for the device */
+    const struct iovec out = {
+        .iov_base = s->cvq_cmd_out_buffer,
+        .iov_len = out_len,
+    };
+    const struct iovec in = {
+        .iov_base = s->cvq_cmd_in_buffer,
+        .iov_len = sizeof(virtio_net_ctrl_ack),
+    };
+    VhostShadowVirtqueue *svq = g_ptr_array_index(s->vhost_vdpa.shadow_vqs, 0);
+    /* in buffer used for device model */
+    virtio_net_ctrl_ack status;
+    size_t dev_written;
+    int r;
+
+    r = vhost_svq_add(svq, &out, 1, &in, 1, NULL);
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
+    memcpy(&status, s->cvq_cmd_in_buffer, sizeof(status));
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
@@ -375,7 +421,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
                                             void *opaque)
 {
     VhostVDPAState *s = opaque;
-    size_t in_len, dev_written;
+    size_t in_len;
     virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
     /* out and in buffers sent to the device */
     struct iovec dev_buffers[2] = {
@@ -387,7 +433,6 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
         .iov_base = &status,
         .iov_len = sizeof(status),
     };
-    int r = -EINVAL;
     bool ok;
 
     ok = vhost_vdpa_net_cvq_map_elem(s, elem, &dev_buffers[0].iov_len);
@@ -400,27 +445,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
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
+    status = vhost_vdpa_net_cvq_add(s, dev_buffers[0].iov_len);
     if (status != VIRTIO_NET_OK) {
         goto out;
     }
@@ -445,7 +470,7 @@ out:
     if (dev_buffers[1].iov_base) {
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[1].iov_base);
     }
-    return r;
+    return 0;
 }
 
 static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
-- 
2.31.1


