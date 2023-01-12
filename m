Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4314B667C89
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:31:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1KC-0006j7-L8; Thu, 12 Jan 2023 12:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1KA-0006gP-UJ
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:25:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1K9-0008S1-AK
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:25:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673544308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiaTOpqMF28Kc4TLRxud3gd9roZpZlxsAr/zuMH5FLE=;
 b=E96EQpe6TfEtoFZJ+5YhNlic4+mX1vOosiFcuTO6JQY9z7jygA+/U7jxFjfcUL8EO6HwuT
 kswfukFeLZ6rgwHuD5qJ/g2V3wg6QLHGBxCIAwVmXqyg26sU2s8frmk1ldXzbkE4IpvpBQ
 11pEVLCwOvFMeQgSWfLARDoTSFlblx0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-V_glhRUbPdWCY5Odgu_x6g-1; Thu, 12 Jan 2023 12:25:05 -0500
X-MC-Unique: V_glhRUbPdWCY5Odgu_x6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76A8785A588;
 Thu, 12 Jan 2023 17:25:04 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EA474078903;
 Thu, 12 Jan 2023 17:25:01 +0000 (UTC)
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
Subject: [RFC v2 07/13] vdpa: delay set_vring_ready after DRIVER_OK
Date: Thu, 12 Jan 2023 18:24:28 +0100
Message-Id: <20230112172434.760850-8-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-1-eperezma@redhat.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

To restore the device at the destination of a live migration we send the
commands through control virtqueue. For a device to read CVQ it must
have received the DRIVER_OK status bit.

However this opens a window where the device could start receiving
packets in rx queue 0 before it receives the RSS configuration. To avoid
that, we will not send vring_enable until all configuration is used by
the device.

Delegating the sending of VHOST_VDPA_SET_VRING_ENABLE
to the vhost_set_vring_ready VhostOp.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/vhost_net.c     | 8 ++++++--
 hw/virtio/vhost-vdpa.c | 8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 3900599465..87938b4449 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -406,15 +406,19 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     }
 
     for (int j = 0; j < nvhosts; j++) {
+        int enable;
+
         if (j < data_queue_pairs) {
             peer = qemu_get_peer(ncs, j);
         } else {
             peer = qemu_get_peer(ncs, n->max_queue_pairs);
         }
 
-        if (peer->vring_enable) {
+        enable = net->nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA ||
+                 peer->vring_enable;
+        if (enable) {
             /* restore vring enable state */
-            r = vhost_set_vring_enable(peer, peer->vring_enable);
+            r = vhost_set_vring_enable(peer, enable);
 
             if (r < 0) {
                 goto err_start;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 28a52ddc78..4296427a69 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -722,9 +722,13 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
     return idx;
 }
 
-static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
+static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, int ready)
 {
     int i;
+
+    if (unlikely(!ready)) {
+        return -ENOTSUP;
+    }
     trace_vhost_vdpa_set_vring_ready(dev);
     for (i = 0; i < dev->nvqs; ++i) {
         struct vhost_vring_state state = {
@@ -1119,7 +1123,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         if (unlikely(!ok)) {
             return -1;
         }
-        vhost_vdpa_set_vring_ready(dev);
     } else {
         vhost_vdpa_svqs_stop(dev);
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
@@ -1324,6 +1327,7 @@ const VhostOps vdpa_ops = {
         .vhost_set_features = vhost_vdpa_set_features,
         .vhost_reset_device = vhost_vdpa_reset_device,
         .vhost_get_vq_index = vhost_vdpa_get_vq_index,
+        .vhost_set_vring_enable = vhost_vdpa_set_vring_ready,
         .vhost_get_config  = vhost_vdpa_get_config,
         .vhost_set_config = vhost_vdpa_set_config,
         .vhost_requires_shm_log = NULL,
-- 
2.31.1


