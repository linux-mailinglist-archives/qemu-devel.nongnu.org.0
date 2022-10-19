Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C6C604727
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:32:15 +0200 (CEST)
Received: from localhost ([::1]:39788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol9B7-0007qB-VA
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ol8Yh-00060M-JC
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:52:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ol8Ye-0002Gr-QQ
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666183948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ab7dW9paGVspfEgQ6PmFdF3QH0gPQPtXGHDenD+bubo=;
 b=hWBRai7ou2ATqrk7RfF8lDDVehQgzqyxM+9q7DqBxDLMZsYh+HXPmqy/VqMRpUxtDLs8oq
 ZXImmlODW0838pZnTdXod9120/i1t4oBA82mjoqg+8gGwfUBvPsHm/lQMwCphwUMjxGgiC
 8eDqJjTqac5L1uyuK7Jf4BeKmgGMqWg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-WuMrbfaCN9ihBMX2NbPr0A-1; Wed, 19 Oct 2022 08:52:23 -0400
X-MC-Unique: WuMrbfaCN9ihBMX2NbPr0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DA192932480;
 Wed, 19 Oct 2022 12:52:23 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCFFC4081B60;
 Wed, 19 Oct 2022 12:52:20 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>
Subject: [RFC PATCH v2 2/8] vdpa: Save emulated features list in vhost_vdpa
Date: Wed, 19 Oct 2022 14:52:04 +0200
Message-Id: <20221019125210.226291-3-eperezma@redhat.com>
In-Reply-To: <20221019125210.226291-1-eperezma@redhat.com>
References: <20221019125210.226291-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

At this moment only _F_LOG is added there.

However future patches add features that depend on the kind of device.
In particular, only net devices can add VIRTIO_F_GUEST_ANNOUNCE. So
let's allow vhost_vdpa creator to set custom emulated device features.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h | 2 ++
 hw/virtio/vhost-vdpa.c         | 8 ++++----
 net/vhost-vdpa.c               | 4 ++++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 1111d85643..50083e1e3b 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -31,6 +31,8 @@ typedef struct vhost_vdpa {
     bool iotlb_batch_begin_sent;
     MemoryListener listener;
     struct vhost_vdpa_iova_range iova_range;
+    /* VirtIO device features that can be emulated by qemu */
+    uint64_t added_features;
     uint64_t acked_features;
     bool shadow_vqs_enabled;
     /* IOVA mapping used by the Shadow Virtqueue */
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 7468e44b87..ddb5e29288 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -660,8 +660,8 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
 
         v->acked_features = features;
 
-        /* We must not ack _F_LOG if SVQ is enabled */
-        features &= ~BIT_ULL(VHOST_F_LOG_ALL);
+        /* Do not ack features emulated by qemu */
+        features &= ~v->added_features;
     }
 
     trace_vhost_vdpa_set_features(dev, features);
@@ -1244,8 +1244,8 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
     int ret = vhost_vdpa_get_dev_features(dev, features);
 
     if (ret == 0 && v->shadow_vqs_enabled) {
-        /* Add SVQ logging capabilities */
-        *features |= BIT_ULL(VHOST_F_LOG_ALL);
+        /* Add emulated capabilities */
+        *features |= v->added_features;
     }
 
     return ret;
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index eebf29f5c1..3803452800 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -599,6 +599,10 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.index = queue_pair_index;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_tree = iova_tree;
+    if (svq) {
+        /* Add SVQ logging capabilities */
+        s->vhost_vdpa.added_features |= BIT_ULL(VHOST_F_LOG_ALL);
+    }
     if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
                                             vhost_vdpa_net_cvq_cmd_page_len());
-- 
2.31.1


