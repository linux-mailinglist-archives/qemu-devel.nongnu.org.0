Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A2D5A0178
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:39:43 +0200 (CEST)
Received: from localhost ([::1]:38360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQvHy-0004A6-24
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQvEZ-0007a2-Jk
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:36:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQvEV-0005Ru-C3
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661366166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=naaRwhcnqZscdMw6fcVC2/f7vDSLifPy1NzGabm4hQk=;
 b=gOggw3BS2KzUx00diqim7H/gjXB8GRGzCzbsGfW28A3Po/TwHfX+/bGeWz6tDZ1S/q45/P
 qb1QmhVVjd1H6PZ3A1cdSo659FANZMKe9HPppeXkZrojKYomCXrTvHoiRGhObokNhJDl66
 iG60/wn21pTl4dQcc06S3/FklgJ+Fn8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-Q3NFcxfXPWqQEUubYJy4Yg-1; Wed, 24 Aug 2022 14:36:03 -0400
X-MC-Unique: Q3NFcxfXPWqQEUubYJy4Yg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0BAE293248E;
 Wed, 24 Aug 2022 18:36:02 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C95B2166B29;
 Wed, 24 Aug 2022 18:35:59 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Parav Pandit <parav@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eli Cohen <eli@mellanox.com>
Subject: [PATCH v2 2/6] vdpa: extract vhost_vdpa_net_load_mac from
 vhost_vdpa_net_load
Date: Wed, 24 Aug 2022 20:35:47 +0200
Message-Id: <20220824183551.197052-3-eperezma@redhat.com>
In-Reply-To: <20220824183551.197052-1-eperezma@redhat.com>
References: <20220824183551.197052-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
---
 net/vhost-vdpa.c | 54 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 468e460ac2..c89e2262d9 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -365,35 +365,31 @@ static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
     return vhost_svq_poll(svq);
 }
 
-static int vhost_vdpa_net_load(NetClientState *nc)
+static ssize_t vhost_vdpa_net_load_cmd(VhostVDPAState *s,
+                                       const struct virtio_net_ctrl_hdr *ctrl,
+                                       const void *data, size_t data_size)
 {
-    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
-    const struct vhost_vdpa *v = &s->vhost_vdpa;
-    const VirtIONet *n;
-    uint64_t features;
+    assert(data_size < vhost_vdpa_net_cvq_cmd_page_len() - sizeof(*ctrl));
 
-    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+    memcpy(s->cvq_cmd_out_buffer, ctrl, sizeof(*ctrl));
+    memcpy(s->cvq_cmd_out_buffer + sizeof(ctrl), data, data_size);
 
-    if (!v->shadow_vqs_enabled) {
-        return 0;
-    }
+    return vhost_vdpa_net_cvq_add(s, sizeof(ctrl) + data_size,
+                                  sizeof(virtio_net_ctrl_ack));
+}
 
-    n = VIRTIO_NET(v->dev->vdev);
-    features = n->parent_obj.guest_features;
+static int vhost_vdpa_net_load_mac(VhostVDPAState *s, const VirtIONet *n)
+{
+    uint64_t features = n->parent_obj.guest_features;
     if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
         const struct virtio_net_ctrl_hdr ctrl = {
             .class = VIRTIO_NET_CTRL_MAC,
             .cmd = VIRTIO_NET_CTRL_MAC_ADDR_SET,
         };
-        char *cursor = s->cvq_cmd_out_buffer;
         ssize_t dev_written;
 
-        memcpy(cursor, &ctrl, sizeof(ctrl));
-        cursor += sizeof(ctrl);
-        memcpy(cursor, n->mac, sizeof(n->mac));
-
-        dev_written = vhost_vdpa_net_cvq_add(s, sizeof(ctrl) + sizeof(n->mac),
-                                             sizeof(virtio_net_ctrl_ack));
+        dev_written = vhost_vdpa_net_load_cmd(s, &ctrl, n->mac,
+                                              sizeof(n->mac));
         if (unlikely(dev_written < 0)) {
             return dev_written;
         }
@@ -404,6 +400,28 @@ static int vhost_vdpa_net_load(NetClientState *nc)
     return 0;
 }
 
+static int vhost_vdpa_net_load(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+    const VirtIONet *n;
+    int r;
+
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    if (!v->shadow_vqs_enabled) {
+        return 0;
+    }
+
+    n = VIRTIO_NET(v->dev->vdev);
+    r = vhost_vdpa_net_load_mac(s, n);
+    if (unlikely(r < 0)) {
+        return r;
+    }
+
+    return 0;
+}
+
 static NetClientInfo net_vhost_vdpa_cvq_info = {
     .type = NET_CLIENT_DRIVER_VHOST_VDPA,
     .size = sizeof(VhostVDPAState),
-- 
2.31.1


