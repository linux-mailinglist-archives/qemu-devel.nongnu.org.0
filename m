Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1530575351
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:47:34 +0200 (CEST)
Received: from localhost ([::1]:37506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1zx-0006kn-Q8
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC1lk-00082F-QT
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:32:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC1lg-0003UQ-Sl
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657816367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sy+xPzttod/ZX4by1O1hm5FvRr0iGtitHtdlAuxqTUg=;
 b=HYIkK7/VJbtyHiLz+66jwgJXP1GdSfRiZf2xDFwa+ezQkSemLjHys9V0Q4m2ZxDt7WqBHz
 OIPIM1irueQ55fxM3BHVhaEMbyeMYf8PKmypvq2HfQLkR/Hkq6AoCHiB54uVLb1W+rdq+n
 aL269yRZkel/rIro1xPrNkr2Eu9iJWM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-Hbrz8rYjPQu-IJ9lJ8zRfg-1; Thu, 14 Jul 2022 12:32:43 -0400
X-MC-Unique: Hbrz8rYjPQu-IJ9lJ8zRfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5E0C803301;
 Thu, 14 Jul 2022 16:32:42 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0807C1121314;
 Thu, 14 Jul 2022 16:32:39 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Jason Wang <jasowang@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v2 15/19] vdpa: manual forward CVQ buffers
Date: Thu, 14 Jul 2022 18:31:46 +0200
Message-Id: <20220714163150.2536327-16-eperezma@redhat.com>
In-Reply-To: <20220714163150.2536327-1-eperezma@redhat.com>
References: <20220714163150.2536327-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

Do a simple forwarding of CVQ buffers, the same work SVQ could do but
through callbacks. No functional change intended.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  3 ++
 hw/virtio/vhost-vdpa.c         |  3 +-
 net/vhost-vdpa.c               | 58 ++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 7214eb47dc..1111d85643 100644
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
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 96997210be..beaaa7049a 100644
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
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index df1e69ee72..805c9dd6b6 100644
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
+                                            SVQElement *svq_elem, void *opaque)
+{
+    VirtQueueElement *elem = &svq_elem->elem;
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
+                      elem->in_num, svq_elem);
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
+    vhost_svq_push_elem(svq, svq_elem, MIN(in_len, sizeof(status)));
+    g_free(svq_elem);
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
2.31.1


