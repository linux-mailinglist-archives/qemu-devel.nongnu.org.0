Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E3B6030B3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 18:23:19 +0200 (CEST)
Received: from localhost ([::1]:58832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okpMg-0007xL-UZ
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 12:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1okoul-0003ji-Fd
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1okouj-0003zq-3J
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666108432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqZNLycroWZRRghflpj8b3f5PiIH+DRSFRJ6onyN3Hg=;
 b=URggfz9hPV8tMYqEwnenn073VtEYPC6nOgL7K3mxbBKySyFPJSQjbZi9otpP22hm8mn5e+
 rIdJRPeiAsQH6UaIBiApS4DtXAqY7zNol1vrZGW/4J+TxXBc14OS+/Hejt30MdjNDsU1vu
 rA2rnr52C3wWYPmyyUDIsLwHW023Vao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-HumjDZSGM1KddkluOcWBTg-1; Tue, 18 Oct 2022 11:53:47 -0400
X-MC-Unique: HumjDZSGM1KddkluOcWBTg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCA98185A7AF;
 Tue, 18 Oct 2022 15:53:39 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D082B215CDD6;
 Tue, 18 Oct 2022 15:53:31 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH 1/5] vdpa: Save emulated features list in vhost_vdpa
Date: Tue, 18 Oct 2022 17:53:17 +0200
Message-Id: <20221018155321.145135-2-eperezma@redhat.com>
In-Reply-To: <20221018155321.145135-1-eperezma@redhat.com>
References: <20221018155321.145135-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index 4bc3fd01a8..787e34ed99 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -600,6 +600,10 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
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


