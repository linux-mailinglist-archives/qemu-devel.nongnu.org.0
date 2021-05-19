Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BD63893F2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:38:25 +0200 (CEST)
Received: from localhost ([::1]:46326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPDE-0000Ku-5E
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP6Z-0005Sk-7n
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:31:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP6X-0005tL-Ds
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2uLkutZRWMTAoyzRaj5p0L8+Fz0EO+Zt2kvFYEu9WJc=;
 b=cSLuIdwrHhJgDVXvIdy/UTXkvmzD64l4BxTttKpurmQN1iM6RWwjNzAFzid77M7dqBK0HE
 f1nefFipIzaHW3zApYWnLj5W3TSiAnluG2LqpIMrNIQcwC7nj4wDEShLm3kGTl1E/SFI7U
 1vtWWoW2kx4M+v8eF0QAIBmvzc6DoEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-Ll5Pzg1bPWek6Db17Ar7Hw-1; Wed, 19 May 2021 12:31:26 -0400
X-MC-Unique: Ll5Pzg1bPWek6Db17Ar7Hw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D09D3180FD6E;
 Wed, 19 May 2021 16:31:24 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB4695D6AC;
 Wed, 19 May 2021 16:31:21 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 16/29] vhost-vdpa: Add vhost_vdpa_enable_custom_iommu
Date: Wed, 19 May 2021 18:28:50 +0200
Message-Id: <20210519162903.1172366-17-eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

Implementation of vhost_ops->enable_custom_iommu

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 74fe92935e..9e7a0ce5e0 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -272,6 +272,29 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
     vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
 }
 
+static int vhost_vdpa_enable_custom_iommu(struct vhost_dev *dev, bool enable)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    hwaddr iova_range_last = dev->iova_range.last;
+    if (iova_range_last != (hwaddr)-1) {
+        iova_range_last++;
+    }
+
+    if (enable) {
+        int r = vhost_vdpa_dma_unmap(v, dev->iova_range.first, iova_range_last);
+        if (r != 0) {
+            error_report("Fail to invalidate device iotlb");
+        }
+
+        memory_listener_register(&v->listener, &address_space_memory);
+    } else {
+        memory_listener_unregister(&v->listener);
+        return vhost_vdpa_dma_unmap(v, dev->iova_range.first, iova_range_last);
+    }
+
+    return 0;
+}
+
 static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
 {
     struct vhost_vdpa *v;
@@ -299,7 +322,7 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
     v = dev->opaque;
     trace_vhost_vdpa_cleanup(dev, v);
-    memory_listener_unregister(&v->listener);
+    vhost_vdpa_enable_custom_iommu(dev, false);
 
     dev->opaque = NULL;
     return 0;
@@ -470,11 +493,10 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
 
 static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 {
-    struct vhost_vdpa *v = dev->opaque;
     trace_vhost_vdpa_dev_start(dev, started);
     if (started) {
         uint8_t status = 0;
-        memory_listener_register(&v->listener, &address_space_memory);
+        vhost_vdpa_enable_custom_iommu(dev, true);
         vhost_vdpa_set_vring_ready(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
         vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
@@ -484,7 +506,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_reset_device(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                    VIRTIO_CONFIG_S_DRIVER);
-        memory_listener_unregister(&v->listener);
+        vhost_vdpa_enable_custom_iommu(dev, false);
 
         return 0;
     }
@@ -628,5 +650,6 @@ const VhostOps vdpa_ops = {
         .vhost_get_device_id = vhost_vdpa_get_device_id,
         .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
         .vhost_force_iommu = vhost_vdpa_force_iommu,
+        .vhost_enable_custom_iommu = vhost_vdpa_enable_custom_iommu,
         .vhost_get_iova_range = vhost_vdpa_get_iova_range,
 };
-- 
2.27.0


