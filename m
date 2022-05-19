Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FAE52DD98
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 21:17:12 +0200 (CEST)
Received: from localhost ([::1]:52186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrle3-0007hI-L2
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 15:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlaS-0004W2-2E
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:13:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlaP-0006Mf-E5
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652987603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vyHZhb6zx7ZuHZ4lGtFyTqLlMaDmn0PajVBkN5g/Ha8=;
 b=iiB9NB0iPjNrTIv1XOp3vUm6boxZYuQTeYoLeoL2e20Gtmr09a6LInkCT/fJ+MaV1fB1kl
 bMPQUmoq0g8y23HOW921HW2OCy3uiJKpEo+6VbiQX8Bi39IjjXEKyn06OTkqylgd/RFHGk
 R68AXRAJ1ahGOq4Olqb4ftI8YFAeql0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-BBd_GkHqNWeKvtw9HC-1AQ-1; Thu, 19 May 2022 15:13:20 -0400
X-MC-Unique: BBd_GkHqNWeKvtw9HC-1AQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D688101AA44;
 Thu, 19 May 2022 19:13:20 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0E9C2026D6A;
 Thu, 19 May 2022 19:13:17 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Subject: [RFC PATCH v8 03/21] vdpa: control virtqueue support on shadow
 virtqueue
Date: Thu, 19 May 2022 21:12:48 +0200
Message-Id: <20220519191306.821774-4-eperezma@redhat.com>
In-Reply-To: <20220519191306.821774-1-eperezma@redhat.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

Introduce the control virtqueue support for vDPA shadow virtqueue. This
is needed for advanced networking features like multiqueue.

To demonstrate command handling, VIRTIO_NET_F_CTRL_MACADDR and
VIRTIO_NET_CTRL_MQ are implemented. If vDPA device is started with SVQ
support and virtio-net driver changes MAC or the number of queues
virtio-net device model will be updated with the new one.

Others cvq commands could be added here straightforwardly but they have
been not tested.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index df1e69ee72..ef12fc284c 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "clients.h"
+#include "hw/virtio/virtio-net.h"
 #include "net/vhost_net.h"
 #include "net/vhost-vdpa.h"
 #include "hw/virtio/vhost-vdpa.h"
@@ -187,6 +188,46 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
+static void vhost_vdpa_net_handle_ctrl(VirtIODevice *vdev,
+                                       const VirtQueueElement *elem)
+{
+    struct virtio_net_ctrl_hdr ctrl;
+    virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
+    size_t s;
+    struct iovec in = {
+        .iov_base = &status,
+        .iov_len = sizeof(status),
+    };
+
+    s = iov_to_buf(elem->out_sg, elem->out_num, 0, &ctrl, sizeof(ctrl.class));
+    if (s != sizeof(ctrl.class)) {
+        return;
+    }
+
+    switch (ctrl.class) {
+    case VIRTIO_NET_CTRL_MAC_ADDR_SET:
+    case VIRTIO_NET_CTRL_MQ:
+        break;
+    default:
+        return;
+    };
+
+    s = iov_to_buf(elem->in_sg, elem->in_num, 0, &status, sizeof(status));
+    if (s != sizeof(status) || status != VIRTIO_NET_OK) {
+        return;
+    }
+
+    status = VIRTIO_NET_ERR;
+    virtio_net_handle_ctrl_iov(vdev, &in, 1, elem->out_sg, elem->out_num);
+    if (status != VIRTIO_NET_OK) {
+        error_report("Bad CVQ processing in model");
+    }
+}
+
+static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
+    .used_elem_handler = vhost_vdpa_net_handle_ctrl,
+};
+
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                            const char *device,
                                            const char *name,
@@ -211,6 +252,9 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
+    if (!is_datapath) {
+        s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
+    }
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
         qemu_del_net_client(nc);
-- 
2.27.0


