Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F3856B7FE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:08:10 +0200 (CEST)
Received: from localhost ([::1]:45216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9lqD-0001DE-8F
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZy-0000sR-5S
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:51:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZu-0008BX-Gc
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657277477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=spnCULPhobFq/0+TtwvBFhQdKPqMwlumFZecB3m8EC0=;
 b=hhIpQv8BlUsH2uxkNDMFXpnPMudhmp8xRQNY0OB5AxPQJn7POWfFFO6sRq+9hffc8ZkTMi
 rS+0D3FKQ188Us1XWx/yJF6yQo21gG5rz4qQ4nSDCCfE5ESchfHMeIQqA4dKIcQ0wbOBKT
 4s7P0aCAxPjNnX0qe5HI97xO50VQexQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-K0RUwMs2OpWXq_EsJy8vfw-1; Fri, 08 Jul 2022 06:51:14 -0400
X-MC-Unique: K0RUwMs2OpWXq_EsJy8vfw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D4ED3C0ED4C;
 Fri,  8 Jul 2022 10:51:13 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4E9D1121314;
 Fri,  8 Jul 2022 10:51:10 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 18/22] vdpa: manual forward CVQ buffers
Date: Fri,  8 Jul 2022 12:50:09 +0200
Message-Id: <20220708105013.1899854-19-eperezma@redhat.com>
In-Reply-To: <20220708105013.1899854-1-eperezma@redhat.com>
References: <20220708105013.1899854-1-eperezma@redhat.com>
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
 net/vhost-vdpa.c               | 59 ++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 1 deletion(-)

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
index 7d2922ccbf..c1162daecc 100644
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
index df1e69ee72..8558ad7a01 100644
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
@@ -187,6 +190,58 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
+/**
+ * Forward buffer for the moment.
+ */
+static bool vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
+                                             VirtQueueElement *guest_elem,
+                                             void *opaque)
+{
+    g_autofree VirtQueueElement *elem = guest_elem;
+    unsigned int n = elem->out_num + elem->in_num;
+    g_autofree struct iovec *iov = g_new(struct iovec, n);
+    size_t in_len;
+    virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
+    int r;
+
+    memcpy(iov, elem->out_sg, elem->out_num);
+    memcpy(iov + elem->out_num, elem->in_sg, elem->in_num);
+
+    r = vhost_svq_inject(svq, iov, elem->out_num, elem->in_num, elem);
+    if (unlikely(r != 0)) {
+        goto err;
+    }
+
+    /* Now elem belongs to SVQ */
+    g_steal_pointer(&elem);
+    return true;
+
+err:
+    in_len = iov_from_buf(elem->in_sg, elem->in_num, 0, &status,
+                          sizeof(status));
+    vhost_svq_push_elem(svq, elem, in_len);
+    return true;
+}
+
+static VirtQueueElement *vhost_vdpa_net_handle_ctrl_detach(void *elem_opaque)
+{
+    return elem_opaque;
+}
+
+static void vhost_vdpa_net_handle_ctrl_used(VhostShadowVirtqueue *svq,
+                                            void *vq_elem_opaque,
+                                            uint32_t dev_written)
+{
+    g_autofree VirtQueueElement *guest_elem = vq_elem_opaque;
+    vhost_svq_push_elem(svq, guest_elem, sizeof(virtio_net_ctrl_ack));
+}
+
+static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
+    .avail_handler = vhost_vdpa_net_handle_ctrl_avail,
+    .used_handler = vhost_vdpa_net_handle_ctrl_used,
+    .detach_handler = vhost_vdpa_net_handle_ctrl_detach,
+};
+
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                            const char *device,
                                            const char *name,
@@ -211,6 +266,10 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
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


