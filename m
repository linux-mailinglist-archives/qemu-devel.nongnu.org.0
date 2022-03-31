Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C702D4EE05D
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:27:07 +0200 (CEST)
Received: from localhost ([::1]:45470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzVi-0007Lx-U4
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:27:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZzAN-00057B-5f
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:05:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZzAL-0007Ra-J9
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648749901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwMJrXbjBoQvBEMEY7wL0UMJ13pv00ab4vGSzMsAE6A=;
 b=WOhP22ZNFm5bYYXvaWQuKHxlBRykNqE2Aayhc3+OroxZE/QaB9FwlTqjObQU+MmYX1el8c
 ssMKYwk6hyvGzEiLzybtYxPD68FZGeEu2jm44U8ZhTs4Rvxk+kFQWF8kl2JSGLHrqbR6nI
 APMXzzQ+3FZOab6Y9y/cLOVVht9WEyM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-cWLxDa1VM6yQ08boQnpi5w-1; Thu, 31 Mar 2022 14:04:59 -0400
X-MC-Unique: cWLxDa1VM6yQ08boQnpi5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B056805A30;
 Thu, 31 Mar 2022 18:04:59 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E17C040CF8EB;
 Thu, 31 Mar 2022 18:04:56 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 17/20] vdpa: Add vhost_vdpa_start_control_svq
Date: Thu, 31 Mar 2022 20:04:07 +0200
Message-Id: <20220331180410.531837-18-eperezma@redhat.com>
In-Reply-To: <20220331180410.531837-1-eperezma@redhat.com>
References: <20220331180410.531837-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Peter Xu <peterx@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will send CVQ commands in the destination machine, seting up
everything o there is no guest-visible change.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 585d2f60f8..6dc0ae8614 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -205,10 +205,73 @@ static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
     return 0;
 }
 
+static bool vhost_vdpa_start_control_svq(VhostShadowVirtqueue *svq,
+                                         VirtIODevice *vdev)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+    uint64_t features = vdev->host_features;
+
+    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
+        const struct virtio_net_ctrl_hdr ctrl = {
+            .class = VIRTIO_NET_CTRL_MAC,
+            .cmd = VIRTIO_NET_CTRL_MAC_ADDR_SET,
+        };
+        uint8_t mac[6];
+        const struct iovec data[] = {
+            {
+                .iov_base = (void *)&ctrl,
+                .iov_len = sizeof(ctrl),
+            },{
+                .iov_base = mac,
+                .iov_len = sizeof(mac),
+            },{
+                .iov_base = NULL,
+                .iov_len = sizeof(virtio_net_ctrl_ack),
+            }
+        };
+        bool ret;
+
+        /* TODO: Only best effort? */
+        memcpy(mac, n->mac, sizeof(mac));
+        ret = vhost_svq_inject(svq, data, 2, 1);
+        if (!ret) {
+            return false;
+        }
+    }
+
+    return true;
+}
+
+static void vhost_vdpa_start(NetClientState *nc)
+{
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+    struct vhost_dev *dev = &s->vhost_net->dev;
+    VhostShadowVirtqueue *svq;
+
+    if (nc->is_datapath) {
+        /* This is not the cvq dev */
+        return;
+    }
+
+    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
+        return;
+    }
+
+    if (!v->shadow_vqs_enabled) {
+        return;
+    }
+
+    svq = g_ptr_array_index(v->shadow_vqs, 0);
+    vhost_vdpa_start_control_svq(svq, dev->vdev);
+}
+
 static NetClientInfo net_vhost_vdpa_info = {
         .type = NET_CLIENT_DRIVER_VHOST_VDPA,
         .size = sizeof(VhostVDPAState),
         .receive = vhost_vdpa_receive,
+        .start = vhost_vdpa_start,
         .cleanup = vhost_vdpa_cleanup,
         .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
         .has_ufo = vhost_vdpa_has_ufo,
-- 
2.27.0


