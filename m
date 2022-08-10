Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA99758F285
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 20:49:23 +0200 (CEST)
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLqle-0007of-8a
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 14:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLqfG-00028x-NO
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLqfF-0006kT-6C
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660156964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdWfPImGYnxmxXNlua6fqa5IUyRe5dPjNA7afa0LHj0=;
 b=DWmnwvVKcyp45g8KloH5C7MpZojfWEC7/yHaZe4uVHxw1nj5XRhXO1e6oRSii9821E55YL
 mxtkGkYNx7FYvbgmETJD7OTx1D0O+xf31XWbFEmG8Oa/04khDcaOgxzjFIoNFbz7NiGQdw
 ag92OY/XYOb1WkSIDfH5dcHJq1vTU9w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-Rtw7x0VwPtOmWZbn4LnDyA-1; Wed, 10 Aug 2022 14:42:40 -0400
X-MC-Unique: Rtw7x0VwPtOmWZbn4LnDyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEFC385A58F;
 Wed, 10 Aug 2022 18:42:39 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4021BC15BA3;
 Wed, 10 Aug 2022 18:42:37 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [RFC 5/8] vdpa: Add vdpa memory listener
Date: Wed, 10 Aug 2022 20:42:17 +0200
Message-Id: <20220810184220.2362292-6-eperezma@redhat.com>
In-Reply-To: <20220810184220.2362292-1-eperezma@redhat.com>
References: <20220810184220.2362292-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

This enable net/vdpa to restart the full device when a migration is
started or stopped.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index a035c89c34..4c6947feb8 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -21,6 +21,7 @@
 #include "qemu/memalign.h"
 #include "qemu/option.h"
 #include "qapi/error.h"
+#include "exec/address-spaces.h"
 #include <linux/vhost.h>
 #include <sys/ioctl.h>
 #include <err.h>
@@ -32,6 +33,8 @@
 typedef struct VhostVDPAState {
     NetClientState nc;
     struct vhost_vdpa vhost_vdpa;
+    MemoryListener memory_listener;
+
     VHostNetState *vhost_net;
 
     /* Control commands shadow buffers */
@@ -110,6 +113,16 @@ static const uint64_t vdpa_svq_device_features =
 #define VHOST_VDPA_NET_CVQ_PASSTHROUGH 0
 #define VHOST_VDPA_NET_CVQ_ASID 1
 
+/*
+ * Vdpa memory listener must run before vhost one, so vhost_vdpa does not get
+ * _F_LOG_ALL without SVQ.
+ */
+#define VHOST_VDPA_NET_MEMORY_LISTENER_PRIORITY \
+                                       (VHOST_DEV_MEMORY_LISTENER_PRIORITY - 1)
+/* Check for underflow */
+QEMU_BUILD_BUG_ON(VHOST_DEV_MEMORY_LISTENER_PRIORITY <
+                  VHOST_VDPA_NET_MEMORY_LISTENER_PRIORITY);
+
 VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -172,6 +185,9 @@ static void vhost_vdpa_cleanup(NetClientState *nc)
 
     qemu_vfree(s->cvq_cmd_out_buffer);
     qemu_vfree(s->cvq_cmd_in_buffer);
+    if (dev->vq_index == 0) {
+        memory_listener_unregister(&s->memory_listener);
+    }
     if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
         g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
     }
@@ -224,6 +240,69 @@ static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
     return 0;
 }
 
+static void vhost_vdpa_net_log_global_enable(MemoryListener *listener,
+                                             bool enable)
+{
+    VhostVDPAState *s = container_of(listener, VhostVDPAState,
+                                     memory_listener);
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+    VirtIONet *n;
+    VirtIODevice *vdev;
+    int data_queue_pairs, cvq, r;
+    NetClientState *peer;
+
+    if (s->always_svq || s->log_enabled == enable) {
+        return;
+    }
+
+    s->log_enabled = enable;
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
+        vdpa_state->vhost_vdpa.listener_shadow_vq = enable;
+        vdpa_state->vhost_vdpa.shadow_vqs_enabled = enable;
+        vdpa_state->log_enabled = enable;
+    }
+
+    r = vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
+    if (unlikely(r < 0)) {
+        error_report("unable to start vhost net: %s(%d)", g_strerror(-r), -r);
+    }
+}
+
+static void vhost_vdpa_net_log_global_start(MemoryListener *listener)
+{
+    vhost_vdpa_net_log_global_enable(listener, true);
+}
+
+static void vhost_vdpa_net_log_global_stop(MemoryListener *listener)
+{
+    vhost_vdpa_net_log_global_enable(listener, false);
+}
+
 static NetClientInfo net_vhost_vdpa_info = {
         .type = NET_CLIENT_DRIVER_VHOST_VDPA,
         .size = sizeof(VhostVDPAState),
@@ -413,6 +492,7 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
 
     assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
 
+    memory_listener_unregister(&s->memory_listener);
     if (s->vhost_vdpa.shadow_vqs_enabled) {
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_in_buffer);
@@ -671,6 +751,13 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.listener_shadow_vq = svq;
     s->vhost_vdpa.iova_tree = iova_tree;
+    if (queue_pair_index == 0) {
+        s->memory_listener = (MemoryListener) {
+            .log_global_start = vhost_vdpa_net_log_global_start,
+            .log_global_stop = vhost_vdpa_net_log_global_stop,
+        };
+        memory_listener_register(&s->memory_listener, &address_space_memory);
+    }
     if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
                                             vhost_vdpa_net_cvq_cmd_page_len());
-- 
2.31.1


