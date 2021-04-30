Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C9436FAE8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:51:26 +0200 (CEST)
Received: from localhost ([::1]:46830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSc9-0004h5-5F
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRV-0000SZ-Dp
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRT-0001L9-JO
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VuFpGqKJ7y13aOr+sF6JhBiOaHNOzSXfGJS+bPt23so=;
 b=LKniDc1WpMp3xJkL/UrJ/N3uvbJa/Ygdd4oJZ2jyfkWeC7/+vqJzI/R2iJOa6OVuCce6pz
 t+KLbcpBN3eWfWrdx9knoFZYuR34gwpkoOlBYH6D23vqwEJUiQxKWmvyNwZaheqLFelKab
 iZnZtW/nQ5MYqgDSGQ+3P50rllMWRno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-caGbIhWYM_ebGw3HygJA_g-1; Fri, 30 Apr 2021 07:36:17 -0400
X-MC-Unique: caGbIhWYM_ebGw3HygJA_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45227501F3;
 Fri, 30 Apr 2021 11:36:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 267517013C;
 Fri, 30 Apr 2021 11:36:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5E2911800612; Fri, 30 Apr 2021 13:35:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/16] virtio-gpu: use class function for ctrl queue
 handlers
Date: Fri, 30 Apr 2021 13:35:36 +0200
Message-Id: <20210430113547.1816178-6-kraxel@redhat.com>
In-Reply-To: <20210430113547.1816178-1-kraxel@redhat.com>
References: <20210430113547.1816178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, tina.zhang@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>, vivek.kasireddy@intel.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  8 +++++++-
 hw/display/virtio-gpu.c        | 12 +++++++++---
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index a7b7d78310ea..380aa7dd6322 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -29,7 +29,7 @@ OBJECT_DECLARE_TYPE(VirtIOGPUBase, VirtIOGPUBaseClass,
                     VIRTIO_GPU_BASE)
 
 #define TYPE_VIRTIO_GPU "virtio-gpu-device"
-OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPU, VIRTIO_GPU)
+OBJECT_DECLARE_TYPE(VirtIOGPU, VirtIOGPUClass, VIRTIO_GPU)
 
 #define TYPE_VIRTIO_GPU_GL "virtio-gpu-gl-device"
 OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPUGL, VIRTIO_GPU_GL)
@@ -166,6 +166,12 @@ struct VirtIOGPU {
     } stats;
 };
 
+struct VirtIOGPUClass {
+    VirtIOGPUBaseClass parent;
+
+    void (*handle_ctrl)(VirtIODevice *vdev, VirtQueue *vq);
+};
+
 struct VirtIOGPUGL {
     struct VirtIOGPU parent_obj;
 };
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 68286f75a01a..39ef22b7c08d 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -893,7 +893,9 @@ static void virtio_gpu_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 static void virtio_gpu_ctrl_bh(void *opaque)
 {
     VirtIOGPU *g = opaque;
-    virtio_gpu_handle_ctrl(&g->parent_obj.parent_obj, g->ctrl_vq);
+    VirtIOGPUClass *vgc = VIRTIO_GPU_GET_CLASS(g);
+
+    vgc->handle_ctrl(&g->parent_obj.parent_obj, g->ctrl_vq);
 }
 
 static void virtio_gpu_handle_cursor(VirtIODevice *vdev, VirtQueue *vq)
@@ -1210,9 +1212,12 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
-    VirtIOGPUBaseClass *vgc = VIRTIO_GPU_BASE_CLASS(klass);
+    VirtIOGPUBaseClass *vbc = VIRTIO_GPU_BASE_CLASS(klass);
+    VirtIOGPUClass *vgc = VIRTIO_GPU_CLASS(klass);
+
+    vbc->gl_flushed = virtio_gpu_gl_flushed;
+    vgc->handle_ctrl = virtio_gpu_handle_ctrl;
 
-    vgc->gl_flushed = virtio_gpu_gl_flushed;
     vdc->realize = virtio_gpu_device_realize;
     vdc->reset = virtio_gpu_reset;
     vdc->get_config = virtio_gpu_get_config;
@@ -1226,6 +1231,7 @@ static const TypeInfo virtio_gpu_info = {
     .name = TYPE_VIRTIO_GPU,
     .parent = TYPE_VIRTIO_GPU_BASE,
     .instance_size = sizeof(VirtIOGPU),
+    .class_size = sizeof(VirtIOGPUClass),
     .class_init = virtio_gpu_class_init,
 };
 
-- 
2.30.2


