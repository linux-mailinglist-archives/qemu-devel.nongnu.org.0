Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00149389448
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:02:15 +0200 (CEST)
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPaJ-0000zF-0B
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP7r-0007fg-QL
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP7m-0006Gw-SF
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+g8d0jKeRijJXiCoq8EJzNGXAKyOpUZngFpIrBOn7os=;
 b=REuiomhS8ymmMn7XkdeFFVxDZ/SR8sCCIRKd9pIFfqHz4xGidhxveBoI9pppYbmyLLuK86
 JwI7Vy6h79OX88Mq9GtFtKZQpQDXXmUK8s2PB4YB3/nWUpFWTx1SvHR6dQtykhzQvIJy1P
 N2WwVmy6C2Me+QdmwkVPhf5UaoXmVDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-5x9-pw_HObC5X-ENtfFT-A-1; Wed, 19 May 2021 12:32:44 -0400
X-MC-Unique: 5x9-pw_HObC5X-ENtfFT-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F5EA101962A;
 Wed, 19 May 2021 16:32:43 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62DFE5D6AC;
 Wed, 19 May 2021 16:32:40 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 28/29] vhost-vdpa: never map with vDPA listener
Date: Wed, 19 May 2021 18:29:02 +0200
Message-Id: <20210519162903.1172366-29-eperezma@redhat.com>
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit is a workaround that will not go to the final version.

vp_vdpa is not able to reset all IOTLBs, so we force to not to map them
in the first place.

Checkpath detects a few errors because of #if 0 / #endif pairs, but it's
the less intrusive way to comment out all the code we want to skip.
Since this commit is not intended to go to the final series, I left it
that way.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h | 2 +-
 hw/virtio/vhost-vdpa.c         | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 9b81a409da..06afe42ab6 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -17,7 +17,7 @@
 typedef struct vhost_vdpa {
     int device_fd;
     uint32_t msg_type;
-    MemoryListener listener;
+    /* MemoryListener listener; */
     struct vhost_dev *dev;
 } VhostVDPA;
 
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index dfb465be96..30e4e306fb 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -23,6 +23,7 @@
 #include "trace.h"
 #include "qemu-common.h"
 
+#if 0
 static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
@@ -35,6 +36,7 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
             */
            section->offset_within_address_space & (1ULL << 63);
 }
+#endif
 
 int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
                               void *vaddr, bool readonly)
@@ -62,6 +64,7 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
     return ret;
 }
 
+#if 0
 static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
                                 hwaddr size)
 {
@@ -246,6 +249,7 @@ static const MemoryListener vhost_vdpa_memory_listener = {
     .region_add = vhost_vdpa_listener_region_add,
     .region_del = vhost_vdpa_listener_region_del,
 };
+#endif
 
 static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
                              void *arg)
@@ -274,6 +278,7 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
 
 static int vhost_vdpa_enable_custom_iommu(struct vhost_dev *dev, bool enable)
 {
+#if 0
     struct vhost_vdpa *v = dev->opaque;
     hwaddr iova_range_last = dev->iova_range.last;
     if (iova_range_last != (hwaddr)-1) {
@@ -291,6 +296,7 @@ static int vhost_vdpa_enable_custom_iommu(struct vhost_dev *dev, bool enable)
         memory_listener_unregister(&v->listener);
         return vhost_vdpa_dma_unmap(v, dev->iova_range.first, iova_range_last);
     }
+#endif
 
     return 0;
 }
@@ -307,7 +313,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
     dev->opaque =  opaque ;
     vhost_vdpa_call(dev, VHOST_GET_FEATURES, &features);
     dev->backend_features = features;
-    v->listener = vhost_vdpa_memory_listener;
+    /* v->listener = vhost_vdpa_memory_listener; */
     v->msg_type = VHOST_IOTLB_MSG_V2;
 
     vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
-- 
2.27.0


