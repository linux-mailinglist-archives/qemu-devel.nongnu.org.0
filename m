Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F70257877F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:37:20 +0200 (CEST)
Received: from localhost ([::1]:47680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTkF-0002Aq-EJ
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDTdG-0001bk-Do
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:30:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDTdE-0001yZ-MQ
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658161803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0s+V/WeCdrTwXKGRjvxrCDJPS1vqq8doXBYc6mmab4w=;
 b=MP+57GipHUgm23zwGOKasq1LEDGiiVmzyAj36s9XjUS0vy9iJoz0D3W9Sg/mEh3Sy11bem
 sEh33iTOIgFud4azCW00f48y+5bkVsX5BeSY+3gDwJ1l+LCJ4vqOKpsj2fSezkXKDWbqGZ
 5Mc4n1XmV+DNMahejjvkh+3Ag92BTLQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-BgYxd58rP-afRczTGfvxlA-1; Mon, 18 Jul 2022 12:30:00 -0400
X-MC-Unique: BgYxd58rP-afRczTGfvxlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 049F38032F0;
 Mon, 18 Jul 2022 16:30:00 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBDE840E80E0;
 Mon, 18 Jul 2022 16:29:56 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Parav Pandit <parav@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 4/5] vdpa: Add virtio-net mac address via CVQ at start
Date: Mon, 18 Jul 2022 18:29:37 +0200
Message-Id: <20220718162938.2938783-5-eperezma@redhat.com>
In-Reply-To: <20220718162938.2938783-1-eperezma@redhat.com>
References: <20220718162938.2938783-1-eperezma@redhat.com>
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
 include/net/vhost-vdpa.h |  1 +
 hw/net/vhost_net.c       |  8 +++++
 net/vhost-vdpa.c         | 64 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
index b81f9a6f2a..38d65e845d 100644
--- a/include/net/vhost-vdpa.h
+++ b/include/net/vhost-vdpa.h
@@ -15,6 +15,7 @@
 #define TYPE_VHOST_VDPA "vhost-vdpa"
 
 struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
+int vhost_vdpa_start(NetClientState *nc);
 
 extern const int vdpa_feature_bits[];
 
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index ccac5b7a64..f9cebd9716 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -274,6 +274,13 @@ static int vhost_net_start_one(struct vhost_net *net,
             }
         }
     }
+
+    if (net->nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+        r = vhost_vdpa_start(net->nc);
+        if (r < 0) {
+            goto fail;
+        }
+    }
     return 0;
 fail:
     file.fd = -1;
@@ -373,6 +380,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         r = vhost_net_start_one(get_vhost_net(peer), dev);
 
         if (r < 0) {
+            vhost_net_stop_one(get_vhost_net(peer), dev);
             goto err_start;
         }
 
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 533bd9f680..84e90f067a 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -342,9 +342,12 @@ static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(VhostShadowVirtqueue *svq,
     virtio_net_ctrl_ack status;
     size_t dev_written;
     int r;
-    void *unused = (void *)1;
 
-    r = vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, unused);
+    /*
+     * Add a fake non-NULL VirtQueueElement since we'll remove before SVQ
+     * event loop can get it.
+     */
+    r = vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, (void *)1);
     if (unlikely(r != 0)) {
         if (unlikely(r == -ENOSPC)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue\n",
@@ -372,6 +375,63 @@ static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(VhostShadowVirtqueue *svq,
     return VIRTIO_NET_OK;
 }
 
+int vhost_vdpa_start(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+    VirtIONet *n = VIRTIO_NET(v->dev->vdev);
+    uint64_t features = v->dev->vdev->host_features;
+    VhostShadowVirtqueue *svq;
+
+    if (!v->shadow_vqs_enabled) {
+        return 0;
+    }
+
+    if (v->dev->vq_index + v->dev->nvqs != v->dev->vq_index_end) {
+        /* Only interested in CVQ */
+        return 0;
+    }
+
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    svq = g_ptr_array_index(v->shadow_vqs, 0);
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
+        state = vhost_vdpa_net_cvq_add(svq, dev_buffers);
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


