Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC6552DDCC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 21:27:57 +0200 (CEST)
Received: from localhost ([::1]:48586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrloS-0000w1-7r
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 15:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlb2-0005fD-2f
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:14:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlaz-0006Rd-Re
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652987641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAexm7b2Cs4jUq28oY1VpULrfRFl6S2JEkKMgFXH7f4=;
 b=REV5fKlrGlzo1Xc+9OELgMdGbkFKo97WY2zcYgSALBnCtbedV56WHicp14PPOvhegTNo0d
 jA/PDI44YxEvn93l4i4cBilcKEY4KNFbRv1hkx5aas0OEMaueRZ6hO/fm8YcOl4o0bA1bF
 yH+3J9E68AnylaUjmNAjgvyCSfU8XJg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-nOaSx4UgPzW9YcdemDnJrQ-1; Thu, 19 May 2022 15:13:57 -0400
X-MC-Unique: nOaSx4UgPzW9YcdemDnJrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BD84185A794;
 Thu, 19 May 2022 19:13:57 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A78D72026D6A;
 Thu, 19 May 2022 19:13:54 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Subject: [RFC PATCH v8 16/21] vdpa: Add vhost_vdpa_start_control_svq
Date: Thu, 19 May 2022 21:13:01 +0200
Message-Id: <20220519191306.821774-17-eperezma@redhat.com>
In-Reply-To: <20220519191306.821774-1-eperezma@redhat.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

As a first step we only enable CVQ first than others. Future patches add
state restore.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 174fec5e77..a66f73ff63 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -188,6 +188,66 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
+static int vhost_vdpa_start_control_svq(VhostShadowVirtqueue *svq,
+                                        struct vhost_dev *dev)
+{
+    struct vhost_vring_state state = {
+        .index = virtio_get_queue_index(svq->vq),
+        .num = 1,
+    };
+    struct vhost_vdpa *v = dev->opaque;
+    VirtIONet *n = VIRTIO_NET(dev->vdev);
+    uint64_t features = dev->vdev->host_features;
+    int r;
+    size_t num = 0;
+
+    assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
+
+    r = ioctl(v->device_fd, VHOST_VDPA_SET_VRING_ENABLE, &state);
+    if (r < 0) {
+        return -errno;
+    }
+
+    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
+        const struct virtio_net_ctrl_hdr ctrl = {
+            .class = VIRTIO_NET_CTRL_MAC,
+            .cmd = VIRTIO_NET_CTRL_MAC_ADDR_SET,
+        };
+        uint8_t mac[6];
+        virtio_net_ctrl_ack ack;
+        const struct iovec data[] = {
+            {
+                .iov_base = (void *)&ctrl,
+                .iov_len = sizeof(ctrl),
+            },{
+                .iov_base = mac,
+                .iov_len = sizeof(mac),
+            },{
+                .iov_base = &ack,
+                .iov_len = sizeof(ack),
+            }
+        };
+
+        memcpy(mac, n->mac, sizeof(mac));
+        r = vhost_svq_inject(svq, data, 2, 1);
+        if (unlikely(r)) {
+            return r;
+        }
+        num++;
+    }
+
+    while (num) {
+        /*
+         * We can call vhost_svq_poll here because BQL protects calls to run.
+         */
+        size_t used = vhost_svq_poll(svq);
+        assert(used <= num);
+        num -= used;
+    }
+
+    return 0;
+}
+
 static void vhost_vdpa_net_handle_ctrl(VirtIODevice *vdev,
                                        const VirtQueueElement *elem)
 {
@@ -226,6 +286,7 @@ static void vhost_vdpa_net_handle_ctrl(VirtIODevice *vdev,
 
 static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
     .used_elem_handler = vhost_vdpa_net_handle_ctrl,
+    .start = vhost_vdpa_start_control_svq,
 };
 
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
-- 
2.27.0


