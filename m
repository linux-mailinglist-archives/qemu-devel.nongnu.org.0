Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF2310E976
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 12:18:10 +0100 (CET)
Received: from localhost ([::1]:34206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibjiT-0004FO-2d
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 06:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41190)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ibjgU-0003Fy-KW
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 06:16:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ibjgT-0000IE-Bw
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 06:16:06 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:50860 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ibjgS-0000Gk-WD
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 06:16:05 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8BD4CBE6F78E38C4A1BD;
 Mon,  2 Dec 2019 19:15:59 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Mon, 2 Dec 2019 19:15:51 +0800
From: <pannengyuan@huawei.com>
To: <mst@redhat.com>, <lvivier@redhat.com>, <amit@kernel.org>,
 <marcandre.lureau@redhat.com>, <pbonzini@redhat.com>
Subject: [PATCH] virtio-serial-bus: fix memory leak while attach
 virtio-serial-bus
Date: Mon, 2 Dec 2019 19:15:43 +0800
Message-ID: <1575285343-21864-1-git-send-email-pannengyuan@huawei.com>
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
 PanNengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: PanNengyuan <pannengyuan@huawei.com>

ivqs/ovqs/c_ivq/c_ovq is forgot to cleanup in
virtio_serial_device_unrealize, the memory leak stack is as bellow:

Direct leak of 1290240 byte(s) in 180 object(s) allocated from:
    #0 0x7fc9bfc27560 in calloc (/usr/lib64/libasan.so.3+0xc7560)
    #1 0x7fc9bed6f015 in g_malloc0 (/usr/lib64/libglib-2.0.so.0+0x50015)
    #2 0x5650e02b83e7 in virtio_add_queue /mnt/sdb/qemu-4.2.0-rc0/hw/virtio/virtio.c:2327
    #3 0x5650e02847b5 in virtio_serial_device_realize /mnt/sdb/qemu-4.2.0-rc0/hw/char/virtio-serial-bus.c:1089
    #4 0x5650e02b56a7 in virtio_device_realize /mnt/sdb/qemu-4.2.0-rc0/hw/virtio/virtio.c:3504
    #5 0x5650e03bf031 in device_set_realized /mnt/sdb/qemu-4.2.0-rc0/hw/core/qdev.c:876
    #6 0x5650e0531efd in property_set_bool /mnt/sdb/qemu-4.2.0-rc0/qom/object.c:2080
    #7 0x5650e053650e in object_property_set_qobject /mnt/sdb/qemu-4.2.0-rc0/qom/qom-qobject.c:26
    #8 0x5650e0533e14 in object_property_set_bool /mnt/sdb/qemu-4.2.0-rc0/qom/object.c:1338
    #9 0x5650e04c0e37 in virtio_pci_realize /mnt/sdb/qemu-4.2.0-rc0/hw/virtio/virtio-pci.c:1801

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: PanNengyuan <pannengyuan@huawei.com>
---
 hw/char/virtio-serial-bus.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 3325904..da9019a 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -1126,9 +1126,15 @@ static void virtio_serial_device_unrealize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOSerial *vser = VIRTIO_SERIAL(dev);
+    int i;
 
     QLIST_REMOVE(vser, next);
 
+    for (i = 0; i <= vser->bus.max_nr_ports; i++) {
+        virtio_del_queue(vdev, 2 * i);
+        virtio_del_queue(vdev, 2 * i + 1);
+    }
+
     g_free(vser->ivqs);
     g_free(vser->ovqs);
     g_free(vser->ports_map);
-- 
2.7.2.windows.1



