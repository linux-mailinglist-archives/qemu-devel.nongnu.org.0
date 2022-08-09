Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EB958DD6D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 19:48:18 +0200 (CEST)
Received: from localhost ([::1]:33598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLTKz-00064f-Ap
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 13:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLTD2-000337-2r
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 13:40:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLTD0-0007f0-Az
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 13:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660066801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QR1U1armRTXVVHfH7veuah9Unlsvvlnz6Qv+TY9aGUc=;
 b=dd7z2YcBBLddDv1/gy3nPLlGs58ctvg99y7LVI2u7/FCLEerZYhKecpi4m6MliLS2AvPDo
 msH6EaNcP5EulPd+Y9uren29uJ0gZOouzZUZ7jlJ2afiAn1VeVxr7Pb11IaEzS4I2m0cyo
 j7DCkjw/pVcgfV7cQyngLG59405ff+0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-UsL3nAMpMrCcrjKxJ0njow-1; Tue, 09 Aug 2022 13:40:00 -0400
X-MC-Unique: UsL3nAMpMrCcrjKxJ0njow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 121963815D36;
 Tue,  9 Aug 2022 17:40:00 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F48818EB5;
 Tue,  9 Aug 2022 17:39:57 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [PATCH v8 09/12] vdpa: extract vhost_vdpa_net_cvq_add from
 vhost_vdpa_net_handle_ctrl_avail
Date: Tue,  9 Aug 2022 19:39:23 +0200
Message-Id: <20220809173926.1695280-10-eperezma@redhat.com>
In-Reply-To: <20220809173926.1695280-1-eperezma@redhat.com>
References: <20220809173926.1695280-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

So we can reuse it to inject state messages.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
--
v7:
* Remove double free error

v6:
* Do not assume in buffer sent to the device is sizeof(virtio_net_ctrl_ack)

v5:
* Do not use an artificial !NULL VirtQueueElement
* Use only out size instead of iovec dev_buffers for these functions.
---
 net/vhost-vdpa.c | 59 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 5254b58bdc..df85567cff 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -331,6 +331,38 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
     }
 }
 
+static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
+                                      size_t in_len)
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
+    int r;
+
+    r = vhost_svq_add(svq, &out, 1, &in, 1, NULL);
+    if (unlikely(r != 0)) {
+        if (unlikely(r == -ENOSPC)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue\n",
+                          __func__);
+        }
+        return r;
+    }
+
+    /*
+     * We can poll here since we've had BQL from the time we sent the
+     * descriptor. Also, we need to take the answer before SVQ pulls by itself,
+     * when BQL is released
+     */
+    return vhost_svq_poll(svq);
+}
+
 static NetClientInfo net_vhost_vdpa_cvq_info = {
     .type = NET_CLIENT_DRIVER_VHOST_VDPA,
     .size = sizeof(VhostVDPAState),
@@ -387,23 +419,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
                                             void *opaque)
 {
     VhostVDPAState *s = opaque;
-    size_t in_len, dev_written;
+    size_t in_len;
     virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
     /* Out buffer sent to both the vdpa device and the device model */
     struct iovec out = {
         .iov_base = s->cvq_cmd_out_buffer,
     };
-    /* In buffer sent to the device */
-    const struct iovec dev_in = {
-        .iov_base = s->cvq_cmd_in_buffer,
-        .iov_len = sizeof(virtio_net_ctrl_ack),
-    };
     /* in buffer used for device model */
     const struct iovec in = {
         .iov_base = &status,
         .iov_len = sizeof(status),
     };
-    int r = -EINVAL;
+    ssize_t dev_written = -EINVAL;
     bool ok;
 
     out.iov_len = iov_to_buf(elem->out_sg, elem->out_num, 0,
@@ -414,21 +441,11 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
         goto out;
     }
 
-    r = vhost_svq_add(svq, &out, 1, &dev_in, 1, elem);
-    if (unlikely(r != 0)) {
-        if (unlikely(r == -ENOSPC)) {
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue\n",
-                          __func__);
-        }
+    dev_written = vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(status));
+    if (unlikely(dev_written < 0)) {
         goto out;
     }
 
-    /*
-     * We can poll here since we've had BQL from the time we sent the
-     * descriptor. Also, we need to take the answer before SVQ pulls by itself,
-     * when BQL is released
-     */
-    dev_written = vhost_svq_poll(svq);
     if (unlikely(dev_written < sizeof(status))) {
         error_report("Insufficient written data (%zu)", dev_written);
         goto out;
@@ -436,7 +453,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
 
     memcpy(&status, s->cvq_cmd_in_buffer, sizeof(status));
     if (status != VIRTIO_NET_OK) {
-        goto out;
+        return VIRTIO_NET_ERR;
     }
 
     status = VIRTIO_NET_ERR;
@@ -453,7 +470,7 @@ out:
     }
     vhost_svq_push_elem(svq, elem, MIN(in_len, sizeof(status)));
     g_free(elem);
-    return r;
+    return dev_written < 0 ? dev_written : 0;
 }
 
 static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
-- 
2.31.1


