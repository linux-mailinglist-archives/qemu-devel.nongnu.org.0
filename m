Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A814576D9E
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 13:45:47 +0200 (CEST)
Received: from localhost ([::1]:53038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCgF0-0007J4-GS
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 07:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCg4r-00073C-3T
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 07:35:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCg4p-0007Ej-J6
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 07:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657971314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uh45UoidiDgk6PrTkeYV4fUgwT7KiBhFuzjsVW4W4kg=;
 b=aOxQfHL99zLh30H3VtvyOxfMDZkgOcmJWbPk6Q2Wo8JvjfZmuvXTjxiR+F6vDnhu2gwTVQ
 0BdCmoqjD6/UnUajA0mIHm2yGC3ctQsPszwgdcQDmegzCPL8vjKIfNi10eMtr2y0UIJzkl
 /Q5s9JKIQb2BdoCqA0jwlrr+L1j4isM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-Vj1B96lYPyiuu-f22snO8A-1; Sat, 16 Jul 2022 07:35:11 -0400
X-MC-Unique: Vj1B96lYPyiuu-f22snO8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B82B380450A;
 Sat, 16 Jul 2022 11:35:11 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5ED440E80E0;
 Sat, 16 Jul 2022 11:35:06 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Gautam Dawar <gdawar@xilinx.com>
Subject: [RFC PATCH 11/12] vdpa: Add virtio-net mac address via CVQ at start
Date: Sat, 16 Jul 2022 13:34:06 +0200
Message-Id: <20220716113407.2730331-12-eperezma@redhat.com>
In-Reply-To: <20220716113407.2730331-1-eperezma@redhat.com>
References: <20220716113407.2730331-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

This is needed so the destination vdpa device see the same state a the
guest set in the source.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 0183fce353..2873be2ba4 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -383,7 +383,7 @@ static virtio_net_ctrl_ack vhost_vdpa_net_svq_add(VhostShadowVirtqueue *svq,
     return VIRTIO_NET_OK;
 }
 
-static int vhost_vdpa_start_control_svq(struct vhost_vdpa *v)
+static int vhost_vdpa_enable_control_svq(struct vhost_vdpa *v)
 {
     struct vhost_vring_state state = {
         .index = v->dev->vq_index,
@@ -395,6 +395,57 @@ static int vhost_vdpa_start_control_svq(struct vhost_vdpa *v)
     return r < 0 ? -errno : r;
 }
 
+static int vhost_vdpa_start_control_svq(struct vhost_vdpa *v)
+{
+
+    VirtIONet *n = VIRTIO_NET(v->dev->vdev);
+    uint64_t features = v->dev->vdev->host_features;
+    VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, 0);
+    VhostVDPAState *s = container_of(v, VhostVDPAState, vhost_vdpa);
+    int r;
+
+    r = vhost_vdpa_enable_control_svq(v);
+    if (unlikely(r < 0)) {
+        return r;
+    }
+
+    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
+        const struct virtio_net_ctrl_hdr ctrl = {
+            .class = VIRTIO_NET_CTRL_MAC,
+            .cmd = VIRTIO_NET_CTRL_MAC_ADDR_SET,
+        };
+        uint8_t mac[6];
+        const struct iovec out[] = {
+            {
+                .iov_base = (void *)&ctrl,
+                .iov_len = sizeof(ctrl),
+            },{
+                .iov_base = mac,
+                .iov_len = sizeof(mac),
+            },
+        };
+        struct iovec dev_buffers[2] = {
+            { .iov_base = s->cvq_cmd_out_buffer },
+            { .iov_base = s->cvq_cmd_in_buffer },
+        };
+        bool ok;
+        virtio_net_ctrl_ack state;
+
+        ok = vhost_vdpa_net_cvq_map_sg(s, out, ARRAY_SIZE(out), dev_buffers);
+        if (unlikely(!ok)) {
+            return -1;
+        }
+
+        memcpy(mac, n->mac, sizeof(mac));
+        state = vhost_vdpa_net_svq_add(svq, dev_buffers);
+        vhost_vdpa_cvq_unmap_buf(v, dev_buffers[0].iov_base);
+        vhost_vdpa_cvq_unmap_buf(v, dev_buffers[1].iov_base);
+        return state == VIRTIO_NET_OK ? 0 : 1;
+    }
+
+    return 0;
+}
+
 /**
  * Do not forward commands not supported by SVQ. Otherwise, the device could
  * accept it and qemu would not know how to update the device model.
-- 
2.31.1


