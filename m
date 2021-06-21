Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D053AE25D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:26:04 +0200 (CEST)
Received: from localhost ([::1]:54456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBVb-0005m8-9j
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvBNY-0002eC-Ht
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:17:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvBNW-0001Gc-Ke
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:17:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624249062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shcEXG3gu+2T2oEHp3T22USBb3RsSFNwczPeKopqVKA=;
 b=HhBrZtIRM8tTbo5y8xbjVOaLlEbqmm93dWWXrD/7xPElqFNHgENKE7ArntstXK8OXVfhvM
 CvXJyVRm5fI3EecGG+aKysLE8TzU1Kv4vmTI1OZ8i1Ofy/u5YU+zk86Q26ajGZCHRO1yGa
 Cyldv9VYJpGLV49zYfy/J3Urv5G6YxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-OO3SrMQgMvqn7VnMxq3ACQ-1; Mon, 21 Jun 2021 00:17:40 -0400
X-MC-Unique: OO3SrMQgMvqn7VnMxq3ACQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 742E81084F58;
 Mon, 21 Jun 2021 04:17:39 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-217.pek2.redhat.com
 [10.72.12.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE51960877;
 Mon, 21 Jun 2021 04:17:33 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 11/18] vhost-vdpa: classify one time request
Date: Mon, 21 Jun 2021 12:16:43 +0800
Message-Id: <20210621041650.5826-12-jasowang@redhat.com>
In-Reply-To: <20210621041650.5826-1-jasowang@redhat.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: eperezma@redhat.com, elic@nvidia.com, lingshan.zhu@intel.com,
 lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vhost-vdpa uses one device multiqueue queue (pairs) model. So we need
to classify the one time request (e.g SET_OWNER) and make sure those
request were only called once per device.

This is used for multiqueue support.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c         | 51 ++++++++++++++++++++++++++++++++--
 include/hw/virtio/vhost-vdpa.h |  1 +
 2 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 61ba313331..397f47bc11 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -265,6 +265,13 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
     vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
 }
 
+static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
+{
+    struct vhost_vdpa *v = dev->opaque;
+
+    return v->index != 0;
+}
+
 static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
 {
     struct vhost_vdpa *v;
@@ -277,6 +284,10 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
     v->listener = vhost_vdpa_memory_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
 
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
     vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                VIRTIO_CONFIG_S_DRIVER);
 
@@ -387,6 +398,10 @@ static int vhost_vdpa_memslots_limit(struct vhost_dev *dev)
 static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
                                     struct vhost_memory *mem)
 {
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
     trace_vhost_vdpa_set_mem_table(dev, mem->nregions, mem->padding);
     if (trace_event_get_state_backends(TRACE_VHOST_VDPA_SET_MEM_TABLE) &&
         trace_event_get_state_backends(TRACE_VHOST_VDPA_DUMP_REGIONS)) {
@@ -410,6 +425,11 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
                                    uint64_t features)
 {
     int ret;
+
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
     trace_vhost_vdpa_set_features(dev, features);
     ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
     uint8_t status = 0;
@@ -429,6 +449,10 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
         0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
     int r;
 
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
     if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
         return 0;
     }
@@ -458,6 +482,10 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
     int ret;
     uint8_t status = 0;
 
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
     trace_vhost_vdpa_reset_device(dev, status);
     return ret;
@@ -545,11 +573,21 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 {
     struct vhost_vdpa *v = dev->opaque;
     trace_vhost_vdpa_dev_start(dev, started);
+
     if (started) {
-        uint8_t status = 0;
-        memory_listener_register(&v->listener, &address_space_memory);
         vhost_vdpa_host_notifiers_init(dev);
         vhost_vdpa_set_vring_ready(dev);
+    } else {
+        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
+    }
+
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
+    if (started) {
+        uint8_t status = 0;
+        memory_listener_register(&v->listener, &address_space_memory);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
         vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
 
@@ -558,7 +596,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_reset_device(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                    VIRTIO_CONFIG_S_DRIVER);
-        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
         memory_listener_unregister(&v->listener);
 
         return 0;
@@ -568,6 +605,10 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
                                      struct vhost_log *log)
 {
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
     trace_vhost_vdpa_set_log_base(dev, base, log->size, log->refcnt, log->fd,
                                   log->log);
     return vhost_vdpa_call(dev, VHOST_SET_LOG_BASE, &base);
@@ -633,6 +674,10 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
 
 static int vhost_vdpa_set_owner(struct vhost_dev *dev)
 {
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
     trace_vhost_vdpa_set_owner(dev);
     return vhost_vdpa_call(dev, VHOST_SET_OWNER, NULL);
 }
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 9188226d8b..e98e327f12 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -21,6 +21,7 @@ typedef struct VhostVDPAHostNotifier {
 
 typedef struct vhost_vdpa {
     int device_fd;
+    int index;
     uint32_t msg_type;
     MemoryListener listener;
     struct vhost_dev *dev;
-- 
2.25.1


