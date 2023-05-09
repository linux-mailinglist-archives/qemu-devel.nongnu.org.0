Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C346FCA71
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:45:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPWM-0004tT-0t; Tue, 09 May 2023 11:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pwPWH-0004qR-Ag
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:44:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pwPWF-0005Hx-CG
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683647090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uYy98inxzBQIUHrLpLSRQL9BxK94ET1oU3r5s+Z6M7g=;
 b=FDqHMYaqyx3eMiNphjCuyJs0IWAKRNRoCaXuLCZ7FdnOtm64mHZJf/1a4pvZc7pzd2T0if
 DhfrKWcIdxEImscjcl6yM2Zr50XhcRKkh6KSKjoUyWGZgvljwiroUUhMIylr175U0D31Ua
 yCgjHgJqGgW604n3gj/tfDjIctCb77Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-X6A3jvnRM0e3JpG1ooyqEA-1; Tue, 09 May 2023 11:44:46 -0400
X-MC-Unique: X6A3jvnRM0e3JpG1ooyqEA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D15543822DE7;
 Tue,  9 May 2023 15:44:45 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 306DFC15BA0;
 Tue,  9 May 2023 15:44:43 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 longpeng2@huawei.com, Stefano Garzarella <sgarzare@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, alvaro.karsz@solid-run.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Dragos Tatulea <dtatulea@nvidia.com>, Jason Wang <jasowang@redhat.com>,
 si-wei.liu@oracle.com, Shannon Nelson <snelson@pensando.io>,
 Lei Yang <leiyang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH v3 2/5] vdpa: add vhost_vdpa_reset_status_fd
Date: Tue,  9 May 2023 17:44:32 +0200
Message-Id: <20230509154435.1410162-3-eperezma@redhat.com>
In-Reply-To: <20230509154435.1410162-1-eperezma@redhat.com>
References: <20230509154435.1410162-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This allows to reset a vhost-vdpa device from external subsystems like
vhost-net, since it does not have any struct vhost_dev by the time we
need to use it.

It is used in subsequent patches to negotiate features
and probe for CVQ ASID isolation.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  1 +
 hw/virtio/vhost-vdpa.c         | 58 +++++++++++++++++++++++-----------
 2 files changed, 41 insertions(+), 18 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index c278a2a8de..28de7da91e 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -54,6 +54,7 @@ typedef struct vhost_vdpa {
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
 
+void vhost_vdpa_reset_status_fd(int fd);
 int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range);
 
 int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index bbabea18f3..7a2053b8d9 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -335,38 +335,45 @@ static const MemoryListener vhost_vdpa_memory_listener = {
     .region_del = vhost_vdpa_listener_region_del,
 };
 
-static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
-                             void *arg)
+static int vhost_vdpa_dev_fd(const struct vhost_dev *dev)
 {
     struct vhost_vdpa *v = dev->opaque;
-    int fd = v->device_fd;
-    int ret;
 
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
+    return v->device_fd;
+}
+
+static int vhost_vdpa_call_fd(int fd, unsigned long int request, void *arg)
+{
+    int ret = ioctl(fd, request, arg);
 
-    ret = ioctl(fd, request, arg);
     return ret < 0 ? -errno : ret;
 }
 
-static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
+static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
+                           void *arg)
+{
+    return vhost_vdpa_call_fd(vhost_vdpa_dev_fd(dev), request, arg);
+}
+
+static int vhost_vdpa_add_status_fd(int fd, uint8_t status)
 {
     uint8_t s;
     int ret;
 
-    trace_vhost_vdpa_add_status(dev, status);
-    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
+    ret = vhost_vdpa_call_fd(fd, VHOST_VDPA_GET_STATUS, &s);
     if (ret < 0) {
         return ret;
     }
 
     s |= status;
 
-    ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
+    ret = vhost_vdpa_call_fd(fd, VHOST_VDPA_SET_STATUS, &s);
     if (ret < 0) {
         return ret;
     }
 
-    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
+    ret = vhost_vdpa_call_fd(fd, VHOST_VDPA_GET_STATUS, &s);
     if (ret < 0) {
         return ret;
     }
@@ -378,6 +385,12 @@ static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
     return 0;
 }
 
+static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
+{
+    trace_vhost_vdpa_add_status(dev, status);
+    return vhost_vdpa_add_status_fd(vhost_vdpa_dev_fd(dev), status);
+}
+
 int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range)
 {
     int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
@@ -709,16 +722,20 @@ static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
     return ret;
 }
 
+static int vhost_vdpa_reset_device_fd(int fd)
+{
+    uint8_t status = 0;
+
+    return vhost_vdpa_call_fd(fd, VHOST_VDPA_SET_STATUS, &status);
+}
+
 static int vhost_vdpa_reset_device(struct vhost_dev *dev)
 {
     struct vhost_vdpa *v = dev->opaque;
-    int ret;
-    uint8_t status = 0;
 
-    ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
-    trace_vhost_vdpa_reset_device(dev);
     v->suspended = false;
-    return ret;
+    trace_vhost_vdpa_reset_device(dev);
+    return vhost_vdpa_reset_device_fd(vhost_vdpa_dev_fd(dev));
 }
 
 static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
@@ -1170,6 +1187,13 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     return 0;
 }
 
+void vhost_vdpa_reset_status_fd(int fd)
+{
+    vhost_vdpa_reset_device_fd(fd);
+    vhost_vdpa_add_status_fd(fd, VIRTIO_CONFIG_S_ACKNOWLEDGE |
+                                 VIRTIO_CONFIG_S_DRIVER);
+}
+
 static void vhost_vdpa_reset_status(struct vhost_dev *dev)
 {
     struct vhost_vdpa *v = dev->opaque;
@@ -1178,9 +1202,7 @@ static void vhost_vdpa_reset_status(struct vhost_dev *dev)
         return;
     }
 
-    vhost_vdpa_reset_device(dev);
-    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
-                               VIRTIO_CONFIG_S_DRIVER);
+    vhost_vdpa_reset_status_fd(vhost_vdpa_dev_fd(dev));
     memory_listener_unregister(&v->listener);
 }
 
-- 
2.31.1


