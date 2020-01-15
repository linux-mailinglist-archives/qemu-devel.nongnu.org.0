Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CE313B988
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 07:27:02 +0100 (CET)
Received: from localhost ([::1]:50078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irc8r-0004i6-5x
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 01:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1irc81-0004HY-1S
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 01:26:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1irc7x-0007iR-Aq
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 01:26:08 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2732 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1irc7x-0007db-0O
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 01:26:05 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CD624223B774D6192C4B;
 Wed, 15 Jan 2020 14:25:59 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Wed, 15 Jan 2020 14:25:52 +0800
From: <pannengyuan@huawei.com>
To: <mst@redhat.com>
Subject: [PATCH v2] vhost-vsock: delete vqs in vhost_vsock_unrealize to avoid
 memleaks
Date: Wed, 15 Jan 2020 14:25:35 +0800
Message-ID: <20200115062535.50644-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: Euler Robot <euler.robot@huawei.com>, Pan Nengyuan <pannengyuan@huawei.com>,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

Receive/transmit/event vqs forgot to cleanup in vhost_vsock_unrealize. Th=
is
patch save receive/transmit vq pointer in realize() and cleanup vqs
through those vq pointers in unrealize(). The leak stack is as follow:

Direct leak of 21504 byte(s) in 3 object(s) allocated from:
  #0 0x7f86a1356970 (/lib64/libasan.so.5+0xef970)  ??:?
  #1 0x7f86a09aa49d (/lib64/libglib-2.0.so.0+0x5249d)  ??:?
  #2 0x5604852f85ca (./x86_64-softmmu/qemu-system-x86_64+0x2c3e5ca)  /mnt=
/sdb/qemu/hw/virtio/virtio.c:2333
  #3 0x560485356208 (./x86_64-softmmu/qemu-system-x86_64+0x2c9c208)  /mnt=
/sdb/qemu/hw/virtio/vhost-vsock.c:339
  #4 0x560485305a17 (./x86_64-softmmu/qemu-system-x86_64+0x2c4ba17)  /mnt=
/sdb/qemu/hw/virtio/virtio.c:3531
  #5 0x5604858e6b65 (./x86_64-softmmu/qemu-system-x86_64+0x322cb65)  /mnt=
/sdb/qemu/hw/core/qdev.c:865
  #6 0x5604861e6c41 (./x86_64-softmmu/qemu-system-x86_64+0x3b2cc41)  /mnt=
/sdb/qemu/qom/object.c:2102

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
Changes V2 to V1:
- delete virtqueues after vhost cleanup to avoid use-after-free
- aslo delete virtqueues in the error path of realize()
---
 hw/virtio/vhost-vsock.c         | 12 ++++++++++--
 include/hw/virtio/vhost-vsock.h |  2 ++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index f5744363a8..b6cee479bb 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -335,8 +335,10 @@ static void vhost_vsock_device_realize(DeviceState *=
dev, Error **errp)
                 sizeof(struct virtio_vsock_config));
=20
     /* Receive and transmit queues belong to vhost */
-    virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE, vhost_vsock_handle_ou=
tput);
-    virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE, vhost_vsock_handle_ou=
tput);
+    vsock->recv_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
+                                      vhost_vsock_handle_output);
+    vsock->trans_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
+                                       vhost_vsock_handle_output);
=20
     /* The event queue belongs to QEMU */
     vsock->event_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
@@ -363,6 +365,9 @@ static void vhost_vsock_device_realize(DeviceState *d=
ev, Error **errp)
 err_vhost_dev:
     vhost_dev_cleanup(&vsock->vhost_dev);
 err_virtio:
+    virtio_delete_queue(vsock->recv_vq);
+    virtio_delete_queue(vsock->trans_vq);
+    virtio_delete_queue(vsock->event_vq);
     virtio_cleanup(vdev);
     close(vhostfd);
     return;
@@ -379,6 +384,9 @@ static void vhost_vsock_device_unrealize(DeviceState =
*dev, Error **errp)
     vhost_vsock_set_status(vdev, 0);
=20
     vhost_dev_cleanup(&vsock->vhost_dev);
+    virtio_delete_queue(vsock->recv_vq);
+    virtio_delete_queue(vsock->trans_vq);
+    virtio_delete_queue(vsock->event_vq);
     virtio_cleanup(vdev);
 }
=20
diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vs=
ock.h
index d509d67c4a..bc5a988ee5 100644
--- a/include/hw/virtio/vhost-vsock.h
+++ b/include/hw/virtio/vhost-vsock.h
@@ -33,6 +33,8 @@ typedef struct {
     struct vhost_virtqueue vhost_vqs[2];
     struct vhost_dev vhost_dev;
     VirtQueue *event_vq;
+    VirtQueue *recv_vq;
+    VirtQueue *trans_vq;
     QEMUTimer *post_load_timer;
=20
     /*< public >*/
--=20
2.21.0.windows.1



