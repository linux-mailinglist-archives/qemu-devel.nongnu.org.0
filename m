Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8248E5AA8A1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 09:16:47 +0200 (CEST)
Received: from localhost ([::1]:44712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU0v0-00068r-I9
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 03:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0Nx-0007ZP-Bd
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0Nv-0004vw-LD
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662100955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=25oxyVesuZucLld4PLzEbpPV66KPt5EKpAOBu7pz71Y=;
 b=A4PCWEr8JU2nT2QML3z+ZX+yOyE6H6rlbtkQXZg0lPL8dVi3tElPylHGViqS0kGRR039vh
 ujaU5Fd1Qt8qcydtFVK0XSkOCuh6hyxs5mE3lZpPJXkIeDJ7m84RJvu7tCmF1uAHRqN8Dq
 WfigzVPety+v8OIbfIfEyrfbmKyxn+w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-WBGvePzwOQGO3y0JdQZH_w-1; Fri, 02 Sep 2022 02:42:31 -0400
X-MC-Unique: WBGvePzwOQGO3y0JdQZH_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FEE1101A56C;
 Fri,  2 Sep 2022 06:42:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-152.pek2.redhat.com
 [10.72.12.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 695601415137;
 Fri,  2 Sep 2022 06:42:29 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 16/21] vdpa: extract vhost_vdpa_net_cvq_add from
 vhost_vdpa_net_handle_ctrl_avail
Date: Fri,  2 Sep 2022 14:41:33 +0800
Message-Id: <20220902064138.56468-17-jasowang@redhat.com>
In-Reply-To: <20220902064138.56468-1-jasowang@redhat.com>
References: <20220902064138.56468-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Eugenio Pérez <eperezma@redhat.com>

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

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 59 ++++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 452d10e..3575bf6 100644
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
2.7.4


