Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE7667C8B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1KR-0007Gy-Oz; Thu, 12 Jan 2023 12:25:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1KQ-0007ES-DQ
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:25:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1KO-0008V7-PW
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:25:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673544324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/o+Q7rasy1fqv7eDwj8XY+QEs1GE3kULQsMVaKGwbYk=;
 b=dS/KUpb6SbYxzBe9U4y6UKLUmLv8sGoFzZcoXXuyAaj0krfqos8ZiTfei8wdbdSFLR8717
 JQRFW6zlo40/abDAZ1uNS3SRu+qCSeHHqrhG2RCma0gbMZFzRBCPA57/PHmV7LnmXGegTn
 9eQN3vykI0z8IQNbZaNbK6V59HQriRE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-UG5Kv0t0M3eM16-veu3YAA-1; Thu, 12 Jan 2023 12:25:18 -0500
X-MC-Unique: UG5Kv0t0M3eM16-veu3YAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30D10802D2A;
 Thu, 12 Jan 2023 17:25:18 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05AF74078903;
 Thu, 12 Jan 2023 17:25:14 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: si-wei.liu@oracle.com, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [RFC v2 11/13] vdpa: add vdpa net migration state notifier
Date: Thu, 12 Jan 2023 18:24:32 +0100
Message-Id: <20230112172434.760850-12-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-1-eperezma@redhat.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This allows net to restart the device backend to configure SVQ on it.

Ideally, these changes should not be net specific. However, the vdpa net
backend is the one with enough knowledge to configure everything because
of some reasons:
* Queues might need to be shadowed or not depending on its kind (control
  vs data).
* Queues need to share the same map translations (iova tree).

Because of that it is cleaner to restart the whole net backend and
configure again as expected, similar to how vhost-kernel moves between
userspace and passthrough.

If more kinds of devices need dynamic switching to SVQ we can create a
callback struct like VhostOps and move most of the code there.
VhostOps cannot be reused since all vdpa backend share them, and to
personalize just for networking would be too heavy.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 5d7ad6e4d7..f38532b1df 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -26,6 +26,8 @@
 #include <err.h>
 #include "standard-headers/linux/virtio_net.h"
 #include "monitor/monitor.h"
+#include "migration/migration.h"
+#include "migration/misc.h"
 #include "migration/blocker.h"
 #include "hw/virtio/vhost.h"
 
@@ -33,6 +35,7 @@
 typedef struct VhostVDPAState {
     NetClientState nc;
     struct vhost_vdpa vhost_vdpa;
+    Notifier migration_state;
     Error *migration_blocker;
     VHostNetState *vhost_net;
 
@@ -243,10 +246,86 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
     return DO_UPCAST(VhostVDPAState, nc, nc0);
 }
 
+static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bool enable)
+{
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+    VirtIONet *n;
+    VirtIODevice *vdev;
+    int data_queue_pairs, cvq, r;
+    NetClientState *peer;
+
+    /* We are only called on the first data vqs and only if x-svq is not set */
+    if (s->vhost_vdpa.shadow_vqs_enabled == enable) {
+        return;
+    }
+
+    vdev = v->dev->vdev;
+    n = VIRTIO_NET(vdev);
+    if (!n->vhost_started) {
+        return;
+    }
+
+    if (enable) {
+        ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
+    }
+    data_queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
+    cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
+                                  n->max_ncs - n->max_queue_pairs : 0;
+    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
+
+    peer = s->nc.peer;
+    for (int i = 0; i < data_queue_pairs + cvq; i++) {
+        VhostVDPAState *vdpa_state;
+        NetClientState *nc;
+
+        if (i < data_queue_pairs) {
+            nc = qemu_get_peer(peer, i);
+        } else {
+            nc = qemu_get_peer(peer, n->max_queue_pairs);
+        }
+
+        vdpa_state = DO_UPCAST(VhostVDPAState, nc, nc);
+        vdpa_state->vhost_vdpa.shadow_data = enable;
+
+        if (i < data_queue_pairs) {
+            /* Do not override CVQ shadow_vqs_enabled */
+            vdpa_state->vhost_vdpa.shadow_vqs_enabled = enable;
+        }
+    }
+
+    r = vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
+    if (unlikely(r < 0)) {
+        error_report("unable to start vhost net: %s(%d)", g_strerror(-r), -r);
+    }
+}
+
+static void vdpa_net_migration_state_notifier(Notifier *notifier, void *data)
+{
+    MigrationState *migration = data;
+    VhostVDPAState *s = container_of(notifier, VhostVDPAState,
+                                     migration_state);
+
+    switch (migration->state) {
+    case MIGRATION_STATUS_SETUP:
+        vhost_vdpa_net_log_global_enable(s, true);
+        return;
+
+    case MIGRATION_STATUS_CANCELLING:
+    case MIGRATION_STATUS_CANCELLED:
+    case MIGRATION_STATUS_FAILED:
+        vhost_vdpa_net_log_global_enable(s, false);
+        return;
+    };
+}
+
 static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
 {
     struct vhost_vdpa *v = &s->vhost_vdpa;
 
+    if (v->feature_log) {
+        add_migration_state_change_notifier(&s->migration_state);
+    }
+
     if (v->shadow_vqs_enabled) {
         v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
                                            v->iova_range.last);
@@ -280,6 +359,10 @@ static void vhost_vdpa_net_client_stop(NetClientState *nc)
 
     assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
 
+    if (s->vhost_vdpa.index == 0 && s->vhost_vdpa.feature_log) {
+        remove_migration_state_change_notifier(&s->migration_state);
+    }
+
     dev = s->vhost_vdpa.dev;
     if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
         g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
@@ -767,6 +850,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
     s->always_svq = svq;
+    s->migration_state.notify = vdpa_net_migration_state_notifier;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_range = iova_range;
     s->vhost_vdpa.shadow_data = svq;
-- 
2.31.1


