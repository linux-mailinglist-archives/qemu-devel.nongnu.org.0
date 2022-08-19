Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F6D59A2E5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:30:05 +0200 (CEST)
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5oq-0002dN-8R
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5NP-0008Fe-LX
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:02:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5NO-0001xS-0E
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660928500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lE37OUe80YU3vl4bIdaA1+zb2chy3UuHKhHQZk/vNVk=;
 b=LJpl+R7uJ54RRQ8JYAiurVgzaZVYbIMMv0TVJ/v2q6IT5yG9ztlYvpl6SfHg45dakqQEJ9
 GTWX0SshmF3NHQvl73A0+gmpADcBDpn8FRLXYmFkVc0d9VpKLTUDZlJic2WKfK7/hRnR19
 30ktrqUioDUCSJG0xH9XTEoiGi4hZtA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-eib21QcwNGCgS4c5SE40gg-1; Fri, 19 Aug 2022 13:01:36 -0400
X-MC-Unique: eib21QcwNGCgS4c5SE40gg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 010AD3C025B4;
 Fri, 19 Aug 2022 17:01:36 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E94D40D2827;
 Fri, 19 Aug 2022 17:01:33 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v9 11/12] vdpa: Add virtio-net mac address via CVQ at start
Date: Fri, 19 Aug 2022 19:00:47 +0200
Message-Id: <20220819170048.3593487-12-eperezma@redhat.com>
In-Reply-To: <20220819170048.3593487-1-eperezma@redhat.com>
References: <20220819170048.3593487-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

This is needed so the destination vdpa device see the same state a the
guest set in the source.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v9:
* Use guest acked features instead of device's.
* Constify vhost_vdpa and VirtIONet variables.
* Delete unneeded increment of cursor.

v8:
* Delete unneeded copy from device's in buffer.

v6:
* Map and unmap command buffers at the start and end of device usage.

v5:
* Rename s/start/load/
* Use independent NetClientInfo to only add load callback on cvq.
---
 net/vhost-vdpa.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index ebf76d1034..8fad31a5fd 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -363,11 +363,51 @@ static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
     return vhost_svq_poll(svq);
 }
 
+static int vhost_vdpa_net_load(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    const struct vhost_vdpa *v = &s->vhost_vdpa;
+    const VirtIONet *n;
+    uint64_t features;
+
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    if (!v->shadow_vqs_enabled) {
+        return 0;
+    }
+
+    n = VIRTIO_NET(v->dev->vdev);
+    features = n->parent_obj.guest_features;
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


