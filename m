Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2E25AF0A6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 18:39:36 +0200 (CEST)
Received: from localhost ([::1]:33466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVbbr-0000YB-75
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 12:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oVbZ1-0004Ek-St
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 12:36:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oVbYz-00019k-4b
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 12:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662482196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/snyyw/WEVjIAx3YSMW+h3i4bkzEDABbuMagtE5LOU=;
 b=h/sI+VIgPCHnRE9ZIgaGoCYIJp8Nj1U3TAhlxsWLCkxIhw1IMK+DIrCU5jgU1l8d4paGDq
 r6o96awb0eSoFubJrDeSf4jdT/EY8ZH0vKPbWBr5miZ997ro3Wgi3SPCHXl9FhNhvQTJFk
 9VY88hW8j9aJDtxRPjGF1hmFOKVwCuw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-m2vsuY0yOL6NIDhtTYM0UQ-1; Tue, 06 Sep 2022 12:36:35 -0400
X-MC-Unique: m2vsuY0yOL6NIDhtTYM0UQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52CA6803916;
 Tue,  6 Sep 2022 16:36:34 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DDA9492C3B;
 Tue,  6 Sep 2022 16:36:29 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
Date: Tue,  6 Sep 2022 18:36:20 +0200
Message-Id: <20220906163621.1144675-3-eperezma@redhat.com>
In-Reply-To: <20220906163621.1144675-1-eperezma@redhat.com>
References: <20220906163621.1144675-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

To have enabled vlans at device startup may happen in the destination of
a live migration, so this configuration must be restored.

At this moment the code is not accessible, since SVQ refuses to start if
vlan feature is exposed by the device.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 4bc3fd01a8..ecbfd08eb9 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_features =
     BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
     BIT_ULL(VIRTIO_NET_F_STANDBY);
 
+#define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
+
 VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -423,6 +425,47 @@ static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
     return *s->status != VIRTIO_NET_OK;
 }
 
+static int vhost_vdpa_net_load_single_vlan(VhostVDPAState *s,
+                                           const VirtIONet *n,
+                                           uint16_t vid)
+{
+    ssize_t dev_written = vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CTRL_VLAN,
+                                                  VIRTIO_NET_CTRL_VLAN_ADD,
+                                                  &vid, sizeof(vid));
+    if (unlikely(dev_written < 0)) {
+        return dev_written;
+    }
+
+    if (unlikely(*s->status != VIRTIO_NET_OK)) {
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int vhost_vdpa_net_load_vlan(VhostVDPAState *s,
+                                    const VirtIONet *n)
+{
+    uint64_t features = n->parent_obj.guest_features;
+
+    if (!(features & BIT_ULL(VIRTIO_NET_F_CTRL_VLAN))) {
+        return 0;
+    }
+
+    for (int i = 0; i < MAX_VLAN >> 5; i++) {
+        for (int j = 0; n->vlans[i] && j <= 0x1f; j++) {
+            if (n->vlans[i] & (1U << j)) {
+                int r = vhost_vdpa_net_load_single_vlan(s, n, (i << 5) + j);
+                if (unlikely(r != 0)) {
+                    return r;
+                }
+            }
+        }
+    }
+
+    return 0;
+}
+
 static int vhost_vdpa_net_load(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -445,8 +488,7 @@ static int vhost_vdpa_net_load(NetClientState *nc)
     if (unlikely(r)) {
         return r;
     }
-
-    return 0;
+    return vhost_vdpa_net_load_vlan(s, n);
 }
 
 static NetClientInfo net_vhost_vdpa_cvq_info = {
-- 
2.31.1


