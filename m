Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2160E1164F4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 03:05:52 +0100 (CET)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ie8Qp-0007ys-7L
	for lists+qemu-devel@lfdr.de; Sun, 08 Dec 2019 21:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53205)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ie8MH-0004IP-T8
 for qemu-devel@nongnu.org; Sun, 08 Dec 2019 21:01:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ie8Ly-00085C-Ct
 for qemu-devel@nongnu.org; Sun, 08 Dec 2019 21:00:54 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2217 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ie8Lw-0007zh-7N
 for qemu-devel@nongnu.org; Sun, 08 Dec 2019 21:00:50 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 90F34C99B42DC8C01274;
 Mon,  9 Dec 2019 10:00:41 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Mon, 9 Dec 2019 10:00:32 +0800
From: <pannengyuan@huawei.com>
To: <mst@redhat.com>
Subject: [PATCH v3 3/3] virtio-serial-bus: fix memory leak while attach
 virtio-serial-bus
Date: Mon, 9 Dec 2019 10:00:10 +0800
Message-ID: <1575856810-9388-4-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
In-Reply-To: <1575856810-9388-1-git-send-email-pannengyuan@huawei.com>
References: <1575856810-9388-1-git-send-email-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: liyiting@huawei.com, Laurent Vivier <lvivier@redhat.com>,
 zhang.zhanghailiang@huawei.com, Amit Shah <amit@kernel.org>,
 Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

ivqs/ovqs/c_ivq/c_ovq forgot to cleanup in
virtio_serial_device_unrealize, the memory leak stack is as below:

Direct leak of 1290240 byte(s) in 180 object(s) allocated from:
    #0 0x7fc9bfc27560 in calloc (/usr/lib64/libasan.so.3+0xc7560)
    #1 0x7fc9bed6f015 in g_malloc0 (/usr/lib64/libglib-2.0.so.0+0x50015)
    #2 0x5650e02b83e7 in virtio_add_queue hw/virtio/virtio.c:2327
    #3 0x5650e02847b5 in virtio_serial_device_realize hw/char/virtio-seri=
al-bus.c:1089
    #4 0x5650e02b56a7 in virtio_device_realize hw/virtio/virtio.c:3504
    #5 0x5650e03bf031 in device_set_realized hw/core/qdev.c:876
    #6 0x5650e0531efd in property_set_bool qom/object.c:2080
    #7 0x5650e053650e in object_property_set_qobject qom/qom-qobject.c:26
    #8 0x5650e0533e14 in object_property_set_bool qom/object.c:1338
    #9 0x5650e04c0e37 in virtio_pci_realize hw/virtio/virtio-pci.c:1801

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Amit Shah <amit@kernel.org>
Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
Changes v2 to v1:
- use virtio_delete_queue to cleanup vq through a vq pointer (suggested b=
y
  Michael S. Tsirkin)
Changes v3 to v1:
- change virtio_delete_queue to virtio_queue_cleanup.
---
 hw/char/virtio-serial-bus.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 3325904..f63dc46 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -1126,9 +1126,17 @@ static void virtio_serial_device_unrealize(DeviceS=
tate *dev, Error **errp)
 {
     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
     VirtIOSerial *vser =3D VIRTIO_SERIAL(dev);
+    int i;
=20
     QLIST_REMOVE(vser, next);
=20
+    virtio_queue_cleanup(vser->c_ivq);
+    virtio_queue_cleanup(vser->c_ovq);
+    for (i =3D 0; i < vser->bus.max_nr_ports; i++) {
+        virtio_queue_cleanup(vser->ivqs[i]);
+        virtio_queue_cleanup(vser->ovqs[i]);
+    }
+
     g_free(vser->ivqs);
     g_free(vser->ovqs);
     g_free(vser->ports_map);
--=20
2.7.2.windows.1



