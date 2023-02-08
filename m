Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AF368EBEF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:44:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgzC-0005HK-Ss; Wed, 08 Feb 2023 04:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgzB-0005H8-Ga
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgz9-0005iH-SL
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675849407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjF4XgacC8zKnOGK0TvXOE59ICgnYZ9SEDqHvfr3++I=;
 b=KD/LZL1Q6G2l0gFOfwK1tlihpujmvek2N0cBD1nLuDqE3ycIIAHyjJqUkq3wP8aWLfVXne
 WLr20yRnfqDChQALZI/3sCZ9GqrMrmPG9871N56NfC5sbCXvnCdZLN29e5juj36cWy63Va
 K8vRN/K5IJpiFjw//v/55NjedNroZhQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-mL-av6vCNXye-fuAhFNjcA-1; Wed, 08 Feb 2023 04:43:23 -0500
X-MC-Unique: mL-av6vCNXye-fuAhFNjcA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 665CA100F901;
 Wed,  8 Feb 2023 09:43:22 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 699432166B2A;
 Wed,  8 Feb 2023 09:43:19 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, alvaro.karsz@solid-run.com,
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
Subject: [PATCH v2 07/13] vdpa: add vdpa net migration state notifier
Date: Wed,  8 Feb 2023 10:42:47 +0100
Message-Id: <20230208094253.702672-8-eperezma@redhat.com>
In-Reply-To: <20230208094253.702672-1-eperezma@redhat.com>
References: <20230208094253.702672-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
v3:
* Add TODO to use the resume operation in the future.
* Use migration_in_setup and migration_has_failed instead of a
  complicated switch case.
---
 net/vhost-vdpa.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index dd686b4514..bca13f97fd 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -26,12 +26,14 @@
 #include <err.h>
 #include "standard-headers/linux/virtio_net.h"
 #include "monitor/monitor.h"
+#include "migration/misc.h"
 #include "hw/virtio/vhost.h"
 
 /* Todo:need to add the multiqueue support here */
 typedef struct VhostVDPAState {
     NetClientState nc;
     struct vhost_vdpa vhost_vdpa;
+    Notifier migration_state;
     VHostNetState *vhost_net;
 
     /* Control commands shadow buffers */
@@ -241,10 +243,79 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
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
+    data_queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
+    cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
+                                  n->max_ncs - n->max_queue_pairs : 0;
+    /*
+     * TODO: vhost_net_stop does suspend, get_base and reset. We can be smarter
+     * in the future and resume the device if read-only operations between
+     * suspend and reset goes wrong.
+     */
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
+    if (migration_in_setup(migration)) {
+        vhost_vdpa_net_log_global_enable(s, true);
+    } else if (migration_has_failed(migration)) {
+        vhost_vdpa_net_log_global_enable(s, false);
+    }
+}
+
 static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
 {
     struct vhost_vdpa *v = &s->vhost_vdpa;
 
+    add_migration_state_change_notifier(&s->migration_state);
     if (v->shadow_vqs_enabled) {
         v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
                                            v->iova_range.last);
@@ -278,6 +349,10 @@ static void vhost_vdpa_net_client_stop(NetClientState *nc)
 
     assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
 
+    if (s->vhost_vdpa.index == 0) {
+        remove_migration_state_change_notifier(&s->migration_state);
+    }
+
     dev = s->vhost_vdpa.dev;
     if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
         g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
@@ -741,6 +816,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
     s->always_svq = svq;
+    s->migration_state.notify = vdpa_net_migration_state_notifier;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_range = iova_range;
     s->vhost_vdpa.shadow_data = svq;
-- 
2.31.1


