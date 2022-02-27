Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF3B4C5BE0
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 15:05:51 +0100 (CET)
Received: from localhost ([::1]:45918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOKBK-0006r5-9H
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 09:05:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nOJv2-0001th-KG
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 08:49:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nOJuz-0000bJ-R2
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 08:49:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645969736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZwSvfvf+PfM41yYEF6LnsJKI3iZ4HmKEcLHxWMmJlM=;
 b=WGTFzOJ+MCnN3U7VKIkOv3kKfnedZ5O1SO+Xns1rMNlDb+nzB9ZO903yZNktH5Z7i6b7Mx
 tjgatAldKiKXRX/svCtPeJ5DkFQ6L4NHYvcuwc7Rbdkb9NcjSAHSzaq7pUKzuOzVOcsa4r
 HVQy9qn4q8NbWGDW0Gl+PJiKOagivXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-y3VWtxKHP02RVwwCY40q7A-1; Sun, 27 Feb 2022 08:48:53 -0500
X-MC-Unique: y3VWtxKHP02RVwwCY40q7A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4530100C610;
 Sun, 27 Feb 2022 13:48:51 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5396B84977;
 Sun, 27 Feb 2022 13:48:46 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/14] vdpa: Expose VHOST_F_LOG_ALL on SVQ
Date: Sun, 27 Feb 2022 14:41:10 +0100
Message-Id: <20220227134111.3254066-14-eperezma@redhat.com>
In-Reply-To: <20220227134111.3254066-1-eperezma@redhat.com>
References: <20220227134111.3254066-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, virtualization@lists.linux-foundation.org,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SVQ is able to log the dirty bits by itself, so let's use it to not
block migration.

Also, ignore set and clear of VHOST_F_LOG_ALL on set_features if SVQ is
enabled. Even if the device supports it, the reports would be nonsense
because SVQ memory is in the qemu region.

The log region is still allocated. Future changes might skip that, but
this series is already long enough.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  1 +
 hw/virtio/vhost-vdpa.c         | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index ee8e939ad0..a29dbb3f53 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -30,6 +30,7 @@ typedef struct vhost_vdpa {
     bool iotlb_batch_begin_sent;
     MemoryListener listener;
     struct vhost_vdpa_iova_range iova_range;
+    uint64_t acked_features;
     bool shadow_vqs_enabled;
     /* IOVA mapping used by the Shadow Virtqueue */
     VhostIOVATree *iova_tree;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index f7ac62d0d6..58007255fd 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -630,6 +630,7 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
     }
 
     if (v->shadow_vqs_enabled) {
+        /* We must not ack _F_LOG if SVQ is enabled */
         uint64_t features_ok = features;
         bool ok;
 
@@ -640,6 +641,18 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
                 PRIx64", ok: 0x%"PRIx64, features, features_ok);
             return -EINVAL;
         }
+
+        if ((v->acked_features ^ features) == BIT_ULL(VHOST_F_LOG_ALL)) {
+            /*
+             * QEMU is just trying to enable or disable logging. SVQ handles
+             * this sepparately, so no need to forward this.
+             */
+            v->acked_features = features;
+            return 0;
+        }
+
+        v->acked_features = features;
+        features &= ~BIT_ULL(VHOST_F_LOG_ALL);
     }
 
     trace_vhost_vdpa_set_features(dev, features);
@@ -1245,6 +1258,9 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
     if (ret == 0 && v->shadow_vqs_enabled) {
         /* Filter only features that SVQ can offer to guest */
         vhost_svq_valid_features(features);
+
+        /* Add SVQ logging capabilities */
+        *features |= BIT_ULL(VHOST_F_LOG_ALL);
     }
 
     return ret;
-- 
2.27.0


