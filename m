Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E0958DD7F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 19:53:19 +0200 (CEST)
Received: from localhost ([::1]:41964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLTPq-0003Wo-Np
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 13:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLTD9-00038a-QZ
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 13:40:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLTD7-0007r0-U8
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 13:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660066809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pphfNxEk7o6jaM4F2XgvKOuQ/WOcyw9zR8wszX/2tXg=;
 b=FrttE3wv3kn1YRfOWEJf+QDwL375cGw+sB6qoeZlBH9JFTA2dJY2OiCv5VnbiwFyDX6C3V
 PSlmMf0xGZnVU/9C1GNMI2YxQw8AupZPKSosOn0mYenUL0junqDaQnBF7xVX0+HLvixjK+
 bjrJZgZpxYRWnTM9lFLYFgoRQ1amtvs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-LieOX3ZpPLCfmlAK1qjWvA-1; Tue, 09 Aug 2022 13:40:07 -0400
X-MC-Unique: LieOX3ZpPLCfmlAK1qjWvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D7EB8037B3;
 Tue,  9 Aug 2022 17:40:07 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 225AD9457F;
 Tue,  9 Aug 2022 17:40:03 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [PATCH v8 11/12] vdpa: Add virtio-net mac address via CVQ at start
Date: Tue,  9 Aug 2022 19:39:25 +0200
Message-Id: <20220809173926.1695280-12-eperezma@redhat.com>
In-Reply-To: <20220809173926.1695280-1-eperezma@redhat.com>
References: <20220809173926.1695280-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
v8:
* Delete unneeded copy from device's in buffer.

v6:
* Map and unmap command buffers at the start and end of device usage.

v5:
* Rename s/start/load/
* Use independent NetClientInfo to only add load callback on cvq.
---
 net/vhost-vdpa.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index df85567cff..e775957952 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -363,11 +363,52 @@ static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
     return vhost_svq_poll(svq);
 }
 
+static int vhost_vdpa_net_load(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+    VirtIONet *n;
+    uint64_t features;
+
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    if (!v->shadow_vqs_enabled) {
+        return 0;
+    }
+
+    n = VIRTIO_NET(v->dev->vdev);
+    features = v->dev->vdev->host_features;
+    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
+        const struct virtio_net_ctrl_hdr ctrl = {
+            .class = VIRTIO_NET_CTRL_MAC,
+            .cmd = VIRTIO_NET_CTRL_MAC_ADDR_SET,
+        };
+        char *cursor = s->cvq_cmd_out_buffer;
+        ssize_t dev_written;
+
+        memcpy(cursor, &ctrl, sizeof(ctrl));
+        cursor += sizeof(ctrl);
+        memcpy(cursor, n->mac, sizeof(n->mac));
+        cursor += sizeof(n->mac);
+
+        dev_written = vhost_vdpa_net_cvq_add(s, sizeof(ctrl) + sizeof(n->mac),
+                                             sizeof(virtio_net_ctrl_ack));
+        if (unlikely(dev_written < 0)) {
+            return dev_written;
+        }
+
+        return *((virtio_net_ctrl_ack *)s->cvq_cmd_in_buffer) != VIRTIO_NET_OK;
+    }
+
+    return 0;
+}
+
 static NetClientInfo net_vhost_vdpa_cvq_info = {
     .type = NET_CLIENT_DRIVER_VHOST_VDPA,
     .size = sizeof(VhostVDPAState),
     .receive = vhost_vdpa_receive,
     .start = vhost_vdpa_net_cvq_start,
+    .load = vhost_vdpa_net_load,
     .stop = vhost_vdpa_net_cvq_stop,
     .cleanup = vhost_vdpa_cleanup,
     .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
-- 
2.31.1


