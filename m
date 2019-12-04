Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16201123A8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 08:47:35 +0100 (CET)
Received: from localhost ([::1]:34926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icPNl-0006A3-GN
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 02:47:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42087)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1icPAB-0001hF-6i
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 02:33:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1icPA9-00018x-55
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 02:33:30 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:55858 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1icPA7-000152-3l
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 02:33:28 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C38097AC94EA251886D2;
 Wed,  4 Dec 2019 15:33:20 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Dec 2019 15:33:14 +0800
From: <pannengyuan@huawei.com>
To: <mst@redhat.com>
Subject: [PATCH v2 1/3] virtio: add ability to delete vq through a pointer
Date: Wed, 4 Dec 2019 15:31:54 +0800
Message-ID: <1575444716-17632-1-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: liyiting@huawei.com, kuhn.chenqun@huawei.com,
 Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

Devices tend to maintain vq pointers, allow deleting them trough a vq pointer.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
Changes v2 to v1:
- add a new function virtio_delete_queue to cleanup vq through a vq pointer
---
 hw/virtio/virtio.c         | 16 +++++++++++-----
 include/hw/virtio/virtio.h |  2 ++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 04716b5..6de3cfd 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2330,17 +2330,23 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
     return &vdev->vq[i];
 }
 
+void virtio_delete_queue(VirtQueue *vq)
+{
+    vq->vring.num = 0;
+    vq->vring.num_default = 0;
+    vq->handle_output = NULL;
+    vq->handle_aio_output = NULL;
+    g_free(vq->used_elems);
+    vq->used_elems = NULL;
+}
+
 void virtio_del_queue(VirtIODevice *vdev, int n)
 {
     if (n < 0 || n >= VIRTIO_QUEUE_MAX) {
         abort();
     }
 
-    vdev->vq[n].vring.num = 0;
-    vdev->vq[n].vring.num_default = 0;
-    vdev->vq[n].handle_output = NULL;
-    vdev->vq[n].handle_aio_output = NULL;
-    g_free(vdev->vq[n].used_elems);
+    virtio_delete_queue(&vdev->vq[n]);
 }
 
 static void virtio_set_isr(VirtIODevice *vdev, int value)
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index c32a815..e18756d 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -183,6 +183,8 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
 
 void virtio_del_queue(VirtIODevice *vdev, int n);
 
+void virtio_delete_queue(VirtQueue *vq);
+
 void virtqueue_push(VirtQueue *vq, const VirtQueueElement *elem,
                     unsigned int len);
 void virtqueue_flush(VirtQueue *vq, unsigned int count);
-- 
2.7.2.windows.1



