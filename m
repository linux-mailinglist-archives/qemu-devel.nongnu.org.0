Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CF6389431
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:55:12 +0200 (CEST)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPTT-0002Gb-F2
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP7T-0007Ki-Nt
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP7Q-0006AC-UZ
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1i1NEzjfpXbKffh1W/jtWwyo2lcMMIpkTS0taNvfQeE=;
 b=TAWpo8zbX0QN16fp+NN1KBIWjrFecDDTHg9mRgI9i81rQkrihKX9ZyADbMCc4FhTu1Rzcm
 594IfzLFIJTJyYSAKEvmElh79NT9/3xroS7gLRRxp24l/w6ZjOc0bVNlLnBcuwTq0YwRBP
 yIh593zU6L0sHLNv+jtkMXN8XHjRGpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-74_U5WOZOrqi5la8NF6WbA-1; Wed, 19 May 2021 12:32:22 -0400
X-MC-Unique: 74_U5WOZOrqi5la8NF6WbA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BE64107ACCA;
 Wed, 19 May 2021 16:32:21 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCC225D6AC;
 Wed, 19 May 2021 16:32:13 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 26/29] vhost: Map in vdpa-dev
Date: Wed, 19 May 2021 18:29:00 +0200
Message-Id: <20210519162903.1172366-27-eperezma@redhat.com>
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

Use and export vhost-vpda functions directly. In the final version,
these methods needs to be exposed through VhostOps, or vhost-vdpa
backend needs to be adapted to work with vhost_send_device_iotlb_msg
in case its custom iommu is disabled.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-backend.h |  4 ++++
 hw/virtio/vhost-vdpa.c            |  2 +-
 hw/virtio/vhost.c                 | 18 ++++++++++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index f8eed2ace5..9d88074e4d 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -203,4 +203,8 @@ int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
 
 int vhost_user_gpu_set_socket(struct vhost_dev *dev, int fd);
 
+struct vhost_vdpa;
+int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
+                              void *vaddr, bool readonly);
+
 #endif /* VHOST_BACKEND_H */
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 9e7a0ce5e0..c742e6944e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -36,7 +36,7 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
            section->offset_within_address_space & (1ULL << 63);
 }
 
-static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
+int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
                               void *vaddr, bool readonly)
 {
     struct vhost_msg_v2 msg = {};
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 4339b899ea..286863ad42 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1314,9 +1314,19 @@ static bool vhost_shadow_vq_start_store_sections(struct vhost_dev *dev)
             r = vhost_iova_tree_insert(&dev->iova_map, &region);
         }
         assert(r == VHOST_DMA_MAP_OK);
+        r = vhost_vdpa_dma_map(dev->opaque, region.iova, region_size,
+                               (void *)dev->mem->regions[idx].userspace_addr,
+                               false);
+        if (r != 0) {
+            goto fail;
+        }
     }
 
     return true;
+
+fail:
+    assert(0);
+    return false;
 }
 
 /*
@@ -1377,6 +1387,14 @@ static bool vhost_sw_live_migration_start_vq(struct vhost_dev *dev,
     }
 
     vhost_virtqueue_stop(dev, dev->vdev, &dev->vqs[idx], dev->vq_index + idx);
+    /* TODO: Why cannot make this read only? */
+    r = vhost_vdpa_dma_map(dev->opaque, addr.desc_user_addr, driver_region.size,
+                           (void *)driver_region.translated_addr, false);
+    assert(r == 0);
+    r = vhost_vdpa_dma_map(dev->opaque, addr.used_user_addr, device_region.size,
+                           (void *)device_region.translated_addr, false);
+    assert(r == 0);
+
     ok = vhost_shadow_vq_start(dev, idx, dev->shadow_vqs[idx]);
     if (unlikely(!ok)) {
         return false;
-- 
2.27.0


