Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29A6357FC4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:46:32 +0200 (CEST)
Received: from localhost ([::1]:34460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURF9-00048O-U5
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lUR7c-0006dG-Ue
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:38:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lUR7a-0004L1-Ol
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617874722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UL3R7GXkmABb4jQovcZo9CLNzO+V++NsFPsFRSgDL+c=;
 b=R4ZkHsuGOEjEGePJX6Z8q5Odm1iua8xpvEilm3mC5HH3/eB+wrarsezy7tuGRQ32/Or1/L
 fJrbyeLLYSyJ5tabhio334QXtIYcLAKGlsZwp5PV2tQCasiH+OVbuePjoqIMCFoavdncG2
 dcZ44Lv0uqU3QyMHOk7dwkpafRZd1f8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-qcxFtmssOImTEGUDjK3jew-1; Thu, 08 Apr 2021 05:38:41 -0400
X-MC-Unique: qcxFtmssOImTEGUDjK3jew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F6FA107ACCD
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 09:38:40 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-72.pek2.redhat.com [10.72.13.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91AB95D9DC;
 Thu,  8 Apr 2021 09:38:36 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v5 2/6] vhost: add new call back function for config interrupt
Date: Thu,  8 Apr 2021 17:38:20 +0800
Message-Id: <20210408093824.14985-3-lulu@redhat.com>
In-Reply-To: <20210408093824.14985-1-lulu@redhat.com>
References: <20210408093824.14985-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

to support configure interrupt, we need to
Add new call back function for config interrupt.
now this call back function only used in vhost-vdpa driver

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/trace-events            | 2 ++
 hw/virtio/vhost-vdpa.c            | 7 +++++++
 include/hw/virtio/vhost-backend.h | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 2060a144a2..6710835b46 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -52,6 +52,8 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
 vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
 vhost_vdpa_set_owner(void *dev) "dev: %p"
 vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
+vhost_vdpa_set_config_call(void *dev, int *fd)"dev: %p fd: %p"
+
 
 # virtio.c
 virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 01d2101d09..9ba2a2bed4 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -545,6 +545,12 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
     trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
     return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
 }
+static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
+                                       int *fd)
+{
+    trace_vhost_vdpa_set_config_call(dev, fd);
+    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, fd);
+}
 
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
                                      uint64_t *features)
@@ -611,4 +617,5 @@ const VhostOps vdpa_ops = {
         .vhost_get_device_id = vhost_vdpa_get_device_id,
         .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
         .vhost_force_iommu = vhost_vdpa_force_iommu,
+        .vhost_set_config_call = vhost_vdpa_set_config_call,
 };
diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 8a6f8e2a7a..adaf6982d2 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -125,6 +125,8 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
 
 typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
 
+typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
+                                       int *fd);
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -170,6 +172,7 @@ typedef struct VhostOps {
     vhost_vq_get_addr_op  vhost_vq_get_addr;
     vhost_get_device_id_op vhost_get_device_id;
     vhost_force_iommu_op vhost_force_iommu;
+    vhost_set_config_call_op vhost_set_config_call;
 } VhostOps;
 
 extern const VhostOps user_ops;
-- 
2.21.3


