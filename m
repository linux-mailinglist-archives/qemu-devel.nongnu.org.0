Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329B15A1965
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 21:20:50 +0200 (CEST)
Received: from localhost ([::1]:36696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRIPI-0000Qf-Mv
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 15:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oRI9S-00006B-Ez
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 15:04:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oRI9E-0006Qo-Uu
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 15:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661454250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=947XT4qKSHAoxN6t9wuk7kVV5CX4QvokhO/FmmUQDNI=;
 b=dl6ZXGArOClgSYuY2e7tYBgfyavKS6xsOD5FiogdMcrpC2eZ1tVdf6ZBLX6OgkROKWMjLl
 Sm1rlvfxjyxo5DB3cvWcob/kRujbOFjjI5fLxbVFADZSZ/rkfp3xq/IT7BTD/HJal+8SqB
 7MvAiFZKvoQHjPjQYOE2amt5e0DjQcY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-s6DUDxdnMaGHyXvnvVaQSA-1; Thu, 25 Aug 2022 15:04:09 -0400
X-MC-Unique: s6DUDxdnMaGHyXvnvVaQSA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73756101A58E;
 Thu, 25 Aug 2022 19:04:08 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A926D492CA2;
 Thu, 25 Aug 2022 19:04:05 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Parav Pandit <parav@mellanox.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eli Cohen <eli@mellanox.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 2/6] vdpa: extract vhost_vdpa_net_load_mac from
 vhost_vdpa_net_load
Date: Thu, 25 Aug 2022 21:03:52 +0200
Message-Id: <20220825190356.317527-3-eperezma@redhat.com>
In-Reply-To: <20220825190356.317527-1-eperezma@redhat.com>
References: <20220825190356.317527-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Since there may be many commands we need to issue to load the NIC
state, let's split them in individual functions

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
--
v2: Add vhost_vdpa_net_load_cmd helper
v3: Move ctrl header definition to vhost_vdpa_net_load_cmd
---
 net/vhost-vdpa.c | 62 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 22 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 535315c1d0..e799e744cd 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -365,12 +365,47 @@ static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
     return vhost_svq_poll(svq);
 }
 
+static ssize_t vhost_vdpa_net_load_cmd(VhostVDPAState *s, uint8_t class,
+                                       uint8_t cmd, const void *data,
+                                       size_t data_size)
+{
+    const struct virtio_net_ctrl_hdr ctrl = {
+        .class = class,
+        .cmd = cmd,
+    };
+
+    assert(data_size < vhost_vdpa_net_cvq_cmd_page_len() - sizeof(ctrl));
+
+    memcpy(s->cvq_cmd_out_buffer, &ctrl, sizeof(ctrl));
+    memcpy(s->cvq_cmd_out_buffer + sizeof(ctrl), data, data_size);
+
+    return vhost_vdpa_net_cvq_add(s, sizeof(ctrl) + data_size,
+                                  sizeof(virtio_net_ctrl_ack));
+}
+
+static int vhost_vdpa_net_load_mac(VhostVDPAState *s, const VirtIONet *n)
+{
+    uint64_t features = n->parent_obj.guest_features;
+    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
+        ssize_t dev_written = vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CTRL_MAC,
+                                                  VIRTIO_NET_CTRL_MAC_ADDR_SET,
+                                                  n->mac, sizeof(n->mac));
+        if (unlikely(dev_written < 0)) {
+            return dev_written;
+        }
+
+        return *s->status != VIRTIO_NET_OK;
+    }
+
+    return 0;
+}
+
 static int vhost_vdpa_net_load(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
-    const struct vhost_vdpa *v = &s->vhost_vdpa;
+    struct vhost_vdpa *v = &s->vhost_vdpa;
     const VirtIONet *n;
-    uint64_t features;
+    int r;
 
     assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
 
@@ -379,26 +414,9 @@ static int vhost_vdpa_net_load(NetClientState *nc)
     }
 
     n = VIRTIO_NET(v->dev->vdev);
-    features = n->parent_obj.guest_features;
-    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
-        const struct virtio_net_ctrl_hdr ctrl = {
-            .class = VIRTIO_NET_CTRL_MAC,
-            .cmd = VIRTIO_NET_CTRL_MAC_ADDR_SET,
-        };
-        char *cursor = s->cvq_cmd_out_buffer;
-        ssize_t dev_written;
-
-        memcpy(cursor, &ctrl, sizeof(ctrl));
-        cursor += sizeof(ctrl);
-        memcpy(cursor, n->mac, sizeof(n->mac));
-
-        dev_written = vhost_vdpa_net_cvq_add(s, sizeof(ctrl) + sizeof(n->mac),
-                                             sizeof(virtio_net_ctrl_ack));
-        if (unlikely(dev_written < 0)) {
-            return dev_written;
-        }
-
-        return *s->status != VIRTIO_NET_OK;
+    r = vhost_vdpa_net_load_mac(s, n);
+    if (unlikely(r < 0)) {
+        return r;
     }
 
     return 0;
-- 
2.31.1


