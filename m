Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3327579FA2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:30:08 +0200 (CEST)
Received: from localhost ([::1]:39546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnId-00056w-Py
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn6e-0008Fg-Kh
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn6b-0004u3-2I
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658236660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8B6UsG2MNeYnZ5l+lFsLztMDtncEdaH9qY7d8PisO9s=;
 b=BWPjhBSXOj2S6mhox9BW7cam7XS1FZJ8WZLH0QKDkPtFxCAFrV63dQ73W6eQdeQOrOGCmn
 s7j5Z02hPP6dxMfBhCs8PFsFV1il9btH/z0Dm9tgO6YSKBfUgF8k/6FYREcb9ddQpX/FVL
 kFdEZ6bOAJw8vRi9hYn6Sb+nGItd4qU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-CgUFf-XtPFuJOQvKGyQu1g-1; Tue, 19 Jul 2022 09:17:37 -0400
X-MC-Unique: CgUFf-XtPFuJOQvKGyQu1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C54F9101A54E;
 Tue, 19 Jul 2022 13:17:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-77.pek2.redhat.com [10.72.12.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C88340CFD0A;
 Tue, 19 Jul 2022 13:17:34 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 16/24] vdpa: manual forward CVQ buffers
Date: Tue, 19 Jul 2022 21:16:29 +0800
Message-Id: <20220719131637.46131-17-jasowang@redhat.com>
In-Reply-To: <20220719131637.46131-1-jasowang@redhat.com>
References: <20220719131637.46131-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

Do a simple forwarding of CVQ buffers, the same work SVQ could do but
through callbacks. No functional change intended.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c         |  3 ++-
 include/hw/virtio/vhost-vdpa.h |  3 +++
 net/vhost-vdpa.c               | 58 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 9699721..beaaa70 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -419,7 +419,8 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
         g_autoptr(VhostShadowVirtqueue) svq;
 
-        svq = vhost_svq_new(v->iova_tree, NULL, NULL);
+        svq = vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
+                            v->shadow_vq_ops_opaque);
         if (unlikely(!svq)) {
             error_setg(errp, "Cannot create svq %u", n);
             return -1;
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 7214eb4..1111d85 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -15,6 +15,7 @@
 #include <gmodule.h>
 
 #include "hw/virtio/vhost-iova-tree.h"
+#include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "hw/virtio/virtio.h"
 #include "standard-headers/linux/vhost_types.h"
 
@@ -35,6 +36,8 @@ typedef struct vhost_vdpa {
     /* IOVA mapping used by the Shadow Virtqueue */
     VhostIOVATree *iova_tree;
     GPtrArray *shadow_vqs;
+    const VhostShadowVirtqueueOps *shadow_vq_ops;
+    void *shadow_vq_ops_opaque;
     struct vhost_dev *dev;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index df1e69e..2e3b6b1 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -11,11 +11,14 @@
 
 #include "qemu/osdep.h"
 #include "clients.h"
+#include "hw/virtio/virtio-net.h"
 #include "net/vhost_net.h"
 #include "net/vhost-vdpa.h"
 #include "hw/virtio/vhost-vdpa.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qemu/memalign.h"
 #include "qemu/option.h"
 #include "qapi/error.h"
 #include <linux/vhost.h>
@@ -187,6 +190,57 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
+/**
+ * Forward buffer for the moment.
+ */
+static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
+                                            VirtQueueElement *elem,
+                                            void *opaque)
+{
+    unsigned int n = elem->out_num + elem->in_num;
+    g_autofree struct iovec *dev_buffers = g_new(struct iovec, n);
+    size_t in_len, dev_written;
+    virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
+    int r;
+
+    memcpy(dev_buffers, elem->out_sg, elem->out_num);
+    memcpy(dev_buffers + elem->out_num, elem->in_sg, elem->in_num);
+
+    r = vhost_svq_add(svq, &dev_buffers[0], elem->out_num, &dev_buffers[1],
+                      elem->in_num, elem);
+    if (unlikely(r != 0)) {
+        if (unlikely(r == -ENOSPC)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue\n",
+                          __func__);
+        }
+        goto out;
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
+    }
+
+out:
+    in_len = iov_from_buf(elem->in_sg, elem->in_num, 0, &status,
+                          sizeof(status));
+    if (unlikely(in_len < sizeof(status))) {
+        error_report("Bad device CVQ written length");
+    }
+    vhost_svq_push_elem(svq, elem, MIN(in_len, sizeof(status)));
+    g_free(elem);
+    return r;
+}
+
+static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
+    .avail_handler = vhost_vdpa_net_handle_ctrl_avail,
+};
+
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                            const char *device,
                                            const char *name,
@@ -211,6 +265,10 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
+    if (!is_datapath) {
+        s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
+        s->vhost_vdpa.shadow_vq_ops_opaque = s;
+    }
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
         qemu_del_net_client(nc);
-- 
2.7.4


