Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57C7655A0B
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 12:50:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p931i-0003D9-Na; Sat, 24 Dec 2022 06:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p931d-0003Ce-MD
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 06:49:13 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p931b-0008J7-2B
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 06:49:13 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NfMjr1FSWz16LdP;
 Sat, 24 Dec 2022 19:47:44 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Sat, 24 Dec 2022 19:48:54 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 <eperezma@redhat.com>, Longpeng <longpeng2@huawei.com>
Subject: [PATCH 1/2] vdpa-dev: get iova range explicitly
Date: Sat, 24 Dec 2022 19:48:47 +0800
Message-ID: <20221224114848.3062-2-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20221224114848.3062-1-longpeng2@huawei.com>
References: <20221224114848.3062-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Longpeng <longpeng2@huawei.com>

In commit a585fad26b ("vdpa: request iova_range only once") we remove
GET_IOVA_RANGE form vhost_vdpa_init, the generic vdpa device will start
without iova_range populated, so the device won't work. Let's call
GET_IOVA_RANGE ioctl explicitly.

Fixes: a585fad26b2e6ccc ("vdpa: request iova_range only once")
Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/vdpa-dev.c           | 9 +++++++++
 hw/virtio/vhost-vdpa.c         | 7 +++++++
 include/hw/virtio/vhost-vdpa.h | 2 ++
 net/vhost-vdpa.c               | 8 --------
 4 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
index db6ba61152..01b41eb0f1 100644
--- a/hw/virtio/vdpa-dev.c
+++ b/hw/virtio/vdpa-dev.c
@@ -53,6 +53,7 @@ static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VhostVdpaDevice *v = VHOST_VDPA_DEVICE(vdev);
+    struct vhost_vdpa_iova_range iova_range;
     uint16_t max_queue_size;
     struct vhost_virtqueue *vqs;
     int i, ret;
@@ -108,6 +109,14 @@ static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
     v->dev.backend_features = 0;
     v->started = false;
 
+    ret = vhost_vdpa_get_iova_range(v->vhostfd, &iova_range);
+    if (ret < 0) {
+        error_setg(errp, "vhost-vdpa-device: get iova range failed: %s",
+                   strerror(-ret));
+        goto free_vqs;
+    }
+    v->vdpa.iova_range = iova_range;
+
     ret = vhost_dev_init(&v->dev, &v->vdpa, VHOST_BACKEND_TYPE_VDPA, 0, NULL);
     if (ret < 0) {
         error_setg(errp, "vhost-vdpa-device: vhost initialization failed: %s",
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 870265188a..109a2ee3bf 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -378,6 +378,13 @@ static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
     return 0;
 }
 
+int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range)
+{
+    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
+
+    return ret < 0 ? -errno : 0;
+}
+
 /*
  * The use of this function is for requests that only need to be
  * applied once. Typically such request occurs at the beginning
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 45b969a311..7997f09a8d 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -51,6 +51,8 @@ typedef struct vhost_vdpa {
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
 
+int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range);
+
 int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
                        hwaddr size, void *vaddr, bool readonly);
 int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index d36664f33a..ffdc435d19 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -702,14 +702,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     return nc;
 }
 
-static int vhost_vdpa_get_iova_range(int fd,
-                                     struct vhost_vdpa_iova_range *iova_range)
-{
-    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
-
-    return ret < 0 ? -errno : 0;
-}
-
 static int vhost_vdpa_get_features(int fd, uint64_t *features, Error **errp)
 {
     int ret = ioctl(fd, VHOST_GET_FEATURES, features);
-- 
2.23.0


