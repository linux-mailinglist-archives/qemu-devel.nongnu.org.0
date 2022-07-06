Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BCE569265
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 21:10:13 +0200 (CEST)
Received: from localhost ([::1]:44720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9APc-000390-Qv
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 15:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xt-0005dI-8q
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xh-0000vR-T9
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TA1ggoOdu7pdIK2Jv/6zj7iqgDenEJo5+cXiRpCBR7U=;
 b=Uec1tHgSyGP/mNxB7bbql1w5EsRnzyt90EHF+QMqgav/4GLhHYUwE69jjBY9mEVAkNRLDh
 foDUw9ldDtjJ4Ezt79QvFnbo9fcqLBv2r6UZFn7etq1dUs4/0Ky2C3VGft6ETFezz1o2eo
 VLIIoOHd9VF8V8KDqEI69yK/mpUvVw0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-NKwkc4F2PlOV2EGfBBIUpw-1; Wed, 06 Jul 2022 14:41:17 -0400
X-MC-Unique: NKwkc4F2PlOV2EGfBBIUpw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AFE7804196;
 Wed,  6 Jul 2022 18:41:16 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAFEE1415116;
 Wed,  6 Jul 2022 18:41:13 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH v9 22/23] vdpa: Inject virtio-net mac address via CVQ at
 start
Date: Wed,  6 Jul 2022 20:40:07 +0200
Message-Id: <20220706184008.1649478-23-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-1-eperezma@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is needed so the destination vdpa device see the same state a the
guest set in the source.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 77d013833f..bb6ac7d96c 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -380,12 +380,59 @@ static int vhost_vdpa_start_control_svq(VhostShadowVirtqueue *svq,
     VhostVDPAState *s = opaque;
     struct vhost_dev *dev = s->vhost_vdpa.dev;
     struct vhost_vdpa *v = dev->opaque;
+    VirtIONet *n = VIRTIO_NET(dev->vdev);
+    uint64_t features = dev->vdev->host_features;
+    size_t num = 0;
     int r;
 
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
 
     r = ioctl(v->device_fd, VHOST_VDPA_SET_VRING_ENABLE, &state);
-    return r < 0 ? -errno : r;
+    if (unlikely(r < 0)) {
+        return -errno;
+    }
+
+    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
+        CVQElement *cvq_elem;
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
+
+        memcpy(mac, n->mac, sizeof(mac));
+        cvq_elem = vhost_vdpa_cvq_alloc_elem(s, ctrl, out, ARRAY_SIZE(out),
+                                             iov_size(out, ARRAY_SIZE(out)),
+                                             NULL);
+        assert(cvq_elem);
+        r = vhost_vdpa_net_cvq_svq_inject(svq, cvq_elem,
+                                          sizeof(ctrl) + sizeof(mac));
+        if (unlikely(r)) {
+            assert(!"Need to test for pending buffers etc");
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
 }
 
 /**
-- 
2.31.1


