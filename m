Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A408E10F4A1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 02:47:06 +0100 (CET)
Received: from localhost ([::1]:46646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibxHN-00028M-7c
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 20:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ibxG3-0001Jm-7v
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 20:45:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ibxFw-0005mC-Jb
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 20:45:39 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2270 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ibxFw-0005TO-1a
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 20:45:36 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id CDF67252FDA05411EEDC;
 Tue,  3 Dec 2019 09:45:24 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Dec 2019 09:45:17 +0800
From: <pannengyuan@huawei.com>
To: <mst@redhat.com>
Subject: [PATCH] virtio-balloon: fix memory leak while attach virtio-balloon
 device
Date: Tue, 3 Dec 2019 09:44:19 +0800
Message-ID: <1575337459-34864-1-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
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
Cc: liyiting@huawei.com, kuhn.chenqun@huawei.com,
 PanNengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: PanNengyuan <pannengyuan@huawei.com>

ivq/dvq/svq/free_page_vq is forgot to cleanup in
virtio_balloon_device_unrealize, the memory leak stack is as follow:

Direct leak of 14336 byte(s) in 2 object(s) allocated from:
    #0 0x7f99fd9d8560 in calloc (/usr/lib64/libasan.so.3+0xc7560)
    #1 0x7f99fcb20015 in g_malloc0 (/usr/lib64/libglib-2.0.so.0+0x50015)
    #2 0x557d90638437 in virtio_add_queue /mnt/sdb/qemu-4.2.0-rc0/hw/virtio/virtio.c:2327
    #3 0x557d9064401d in virtio_balloon_device_realize /mnt/sdb/qemu-4.2.0-rc0/hw/virtio/virtio-balloon.c:793
    #4 0x557d906356f7 in virtio_device_realize /mnt/sdb/qemu-4.2.0-rc0/hw/virtio/virtio.c:3504
    #5 0x557d9073f081 in device_set_realized /mnt/sdb/qemu-4.2.0-rc0/hw/core/qdev.c:876
    #6 0x557d908b1f4d in property_set_bool /mnt/sdb/qemu-4.2.0-rc0/qom/object.c:2080
    #7 0x557d908b655e in object_property_set_qobject /mnt/sdb/qemu-4.2.0-rc0/qom/qom-qobject.c:26

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: PanNengyuan <pannengyuan@huawei.com>
---
 hw/virtio/virtio-balloon.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 40b04f5..5329c65 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -831,6 +831,13 @@ static void virtio_balloon_device_unrealize(DeviceState *dev, Error **errp)
     }
     balloon_stats_destroy_timer(s);
     qemu_remove_balloon_handler(s);
+
+    virtio_del_queue(vdev, 0);
+    virtio_del_queue(vdev, 1);
+    virtio_del_queue(vdev, 2);
+    if (s->free_page_vq) {
+        virtio_del_queue(vdev, 3);
+    }
     virtio_cleanup(vdev);
 }
 
-- 
2.7.2.windows.1



