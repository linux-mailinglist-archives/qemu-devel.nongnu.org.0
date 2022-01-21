Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943F049671D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 22:08:11 +0100 (CET)
Received: from localhost ([::1]:57844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB18j-0005Pt-Q8
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 16:08:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0fN-0003Uc-OW
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:37:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0fL-0006a2-O6
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TIMMZNZ/3FgLlCdpxCiJ5q46jj5saAuhvAUSPRz+8U0=;
 b=huxpWX1+QY5c0r9gMHMWCbMZtD+YJUqDUu4+5uMA2OlGlPoug/17dtAvDSWcQxwW3sfD2Q
 uo8Uc6nluj4Nlr6isz658TOWEUMBKQs4TJGnKHmgmhqL+p+9+msHvvFVnCiW8G+L5t4MIi
 54dTxwbkTBXoJSIBGpEIOmVBY1BCv2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-KNv-7i2COu-QdJVZMNg_-w-1; Fri, 21 Jan 2022 15:37:46 -0500
X-MC-Unique: KNv-7i2COu-QdJVZMNg_-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D3978145E1;
 Fri, 21 Jan 2022 20:37:44 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAADFE2D3;
 Fri, 21 Jan 2022 20:36:48 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/31] vdpa: Move vhost_vdpa_get_iova_range to net/vhost-vdpa.c
Date: Fri, 21 Jan 2022 21:27:32 +0100
Message-Id: <20220121202733.404989-31-eperezma@redhat.com>
In-Reply-To: <20220121202733.404989-1-eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since it's a device property, it can be done in net/. This helps SVQ to
allocate the rings in vdpa device initialization, rather than delay
that.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 15 ---------------
 net/vhost-vdpa.c       | 32 ++++++++++++++++++++++++--------
 2 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 75090d65e8..2491c05d29 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -350,19 +350,6 @@ static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
     return 0;
 }
 
-static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
-{
-    int ret = vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE,
-                              &v->iova_range);
-    if (ret != 0) {
-        v->iova_range.first = 0;
-        v->iova_range.last = UINT64_MAX;
-    }
-
-    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
-                                    v->iova_range.last);
-}
-
 static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
 {
     struct vhost_vdpa *v = dev->opaque;
@@ -1295,8 +1282,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
         goto err;
     }
 
-    vhost_vdpa_get_iova_range(v);
-
     if (vhost_vdpa_one_time_request(dev)) {
         return 0;
     }
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 4befba5cc7..cc9cecf8d1 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -22,6 +22,7 @@
 #include <sys/ioctl.h>
 #include <err.h>
 #include "standard-headers/linux/virtio_net.h"
+#include "standard-headers/linux/vhost_types.h"
 #include "monitor/monitor.h"
 #include "hw/virtio/vhost.h"
 
@@ -187,13 +188,25 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
+static void vhost_vdpa_get_iova_range(int fd,
+                                      struct vhost_vdpa_iova_range *iova_range)
+{
+    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
+
+    if (ret < 0) {
+        iova_range->first = 0;
+        iova_range->last = UINT64_MAX;
+    }
+}
+
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
-                                           const char *device,
-                                           const char *name,
-                                           int vdpa_device_fd,
-                                           int queue_pair_index,
-                                           int nvqs,
-                                           bool is_datapath)
+                                       const char *device,
+                                       const char *name,
+                                       int vdpa_device_fd,
+                                       int queue_pair_index,
+                                       int nvqs,
+                                       bool is_datapath,
+                                       struct vhost_vdpa_iova_range iova_range)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
@@ -211,6 +224,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
+    s->vhost_vdpa.iova_range = iova_range;
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
         qemu_del_net_client(nc);
@@ -267,6 +281,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     g_autofree NetClientState **ncs = NULL;
     NetClientState *nc;
     int queue_pairs, i, has_cvq = 0;
+    struct vhost_vdpa_iova_range iova_range;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -286,19 +301,20 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         qemu_close(vdpa_device_fd);
         return queue_pairs;
     }
+    vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
 
     ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
 
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                     vdpa_device_fd, i, 2, true);
+                                     vdpa_device_fd, i, 2, true, iova_range);
         if (!ncs[i])
             goto err;
     }
 
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                 vdpa_device_fd, i, 1, false);
+                                 vdpa_device_fd, i, 1, false, iova_range);
         if (!nc)
             goto err;
     }
-- 
2.27.0


