Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DA157E0C3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 13:24:29 +0200 (CEST)
Received: from localhost ([::1]:42480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEqlg-00056w-0k
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 07:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEqaw-0003Hv-VG
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 07:13:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEqat-0006yC-SS
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 07:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658488399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RqEtGNLuWYOLrpWaZiEoXzn80W3wnyaAEh7QNoTyeIs=;
 b=L2kocJNfayc2GSFG3DoKXnr+jK4A+8XRqnLvep01fPm3o8fp3k1PkYWB5GlMaiN6gv7azs
 Ml2ZuikT6urBsBdLakv5aBjFtNrUlXanbVWaMxReBWkr6jEw7RleZj0O/DpdHh13BGmjEI
 Fe4za8fqk2y1sWBspDQoF2VsjGwEySk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-HeYN8Z68MAyU6y97XslZSw-1; Fri, 22 Jul 2022 07:13:15 -0400
X-MC-Unique: HeYN8Z68MAyU6y97XslZSw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8DD92813D22;
 Fri, 22 Jul 2022 11:13:14 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBC4440D2962;
 Fri, 22 Jul 2022 11:13:11 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
Subject: [PATCH v4 6/7] vdpa: Add virtio-net mac address via CVQ at start
Date: Fri, 22 Jul 2022 13:12:44 +0200
Message-Id: <20220722111245.3403062-7-eperezma@redhat.com>
In-Reply-To: <20220722111245.3403062-1-eperezma@redhat.com>
References: <20220722111245.3403062-1-eperezma@redhat.com>
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
 net/vhost-vdpa.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 61516b1432..3e15a42c35 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -365,10 +365,71 @@ static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(VhostShadowVirtqueue *svq,
     return VIRTIO_NET_OK;
 }
 
+static int vhost_vdpa_net_start(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+    VirtIONet *n;
+    uint64_t features;
+    VhostShadowVirtqueue *svq;
+
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    if (!v->shadow_vqs_enabled) {
+        return 0;
+    }
+
+    if (v->dev->nvqs != 1 &&
+        v->dev->vq_index + v->dev->nvqs != v->dev->vq_index_end) {
+        /* Only interested in CVQ */
+        return 0;
+    }
+
+    n = VIRTIO_NET(v->dev->vdev);
+    features = v->dev->vdev->host_features;
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
 static NetClientInfo net_vhost_vdpa_info = {
         .type = NET_CLIENT_DRIVER_VHOST_VDPA,
         .size = sizeof(VhostVDPAState),
         .receive = vhost_vdpa_receive,
+        .start = vhost_vdpa_net_start,
         .cleanup = vhost_vdpa_cleanup,
         .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
         .has_ufo = vhost_vdpa_has_ufo,
-- 
2.31.1


