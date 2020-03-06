Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A935617B484
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 03:36:01 +0100 (CET)
Received: from localhost ([::1]:58790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jA2qG-0006EG-Io
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 21:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49976)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jA2pP-0005hc-T0
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 21:35:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1jA2pO-00005V-HS
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 21:35:07 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3185 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1jA2pO-0008Qj-6z
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 21:35:06 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 337FE1B246B4C60AD2D9;
 Fri,  6 Mar 2020 10:35:00 +0800 (CST)
Received: from localhost.huawei.com (10.175.104.216) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 6 Mar 2020 10:34:49 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <lvivier@redhat.com>, <amit@kernel.org>, <mst@redhat.com>,
 <marcandre.lureau@redhat.com>, <pbonzini@redhat.com>
Subject: [PATCH v2] virtio-serial-bus: do cleanup on the error path in
 realize() to avoid memleaks
Date: Fri, 6 Mar 2020 10:50:30 +0800
Message-ID: <20200306025030.28824-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
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
Cc: zhang.zhanghailiang@huawei.com, Pan Nengyuan <pannengyuan@huawei.com>,
 qemu-devel@nongnu.org, euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

port->bh forgot to delete on the error path, this patch add it to fix memleaks. It's easy to reproduce as follow(add a same nr port):
    {'execute': 'device_add', 'arguments': {'id': 'virtio_serial_pci0', 'driver': 'virtio-serial-pci', 'bus': 'pci.0', 'addr': '0x5'}, 'id': 'yVkZcGgV'}
    {'execute': 'device_add', 'arguments': {'id': 'port1', 'driver': 'virtserialport', 'name': 'port1', 'chardev': 'channel1', 'bus': 'virtio_serial_pci0.0', 'nr': 1}, 'id': '3dXdUgJA'}
    {'execute': 'device_add', 'arguments': {'id': 'port2', 'driver': 'virtserialport', 'name': 'port2', 'chardev': 'channel2', 'bus': 'virtio_serial_pci0.0', 'nr': 1}, 'id': 'qLzcCkob'}
    {'execute': 'device_add', 'arguments': {'id': 'port2', 'driver': 'virtserialport', 'name': 'port2', 'chardev': 'channel2', 'bus': 'virtio_serial_pci0.0', 'nr': 2}, 'id': 'qLzcCkob'}

The leak stack:
Direct leak of 40 byte(s) in 1 object(s) allocated from:
    #0 0x7f04a8008ae8 in __interceptor_malloc (/lib64/libasan.so.5+0xefae8)
    #1 0x7f04a73cf1d5 in g_malloc (/lib64/libglib-2.0.so.0+0x531d5)
    #2 0x56273eaee484 in aio_bh_new /mnt/sdb/backup/qemu/util/async.c:125
    #3 0x56273eafe9a8 in qemu_bh_new /mnt/sdb/backup/qemu/util/main-loop.c:532
    #4 0x56273d52e62e in virtser_port_device_realize /mnt/sdb/backup/qemu/hw/char/virtio-serial-bus.c:946
    #5 0x56273dcc5040 in device_set_realized /mnt/sdb/backup/qemu/hw/core/qdev.c:891
    #6 0x56273e5ebbce in property_set_bool /mnt/sdb/backup/qemu/qom/object.c:2238
    #7 0x56273e5e5a9c in object_property_set /mnt/sdb/backup/qemu/qom/object.c:1324
    #8 0x56273e5ef5f8 in object_property_set_qobject /mnt/sdb/backup/qemu/qom/qom-qobject.c:26
    #9 0x56273e5e5e6a in object_property_set_bool /mnt/sdb/backup/qemu/qom/object.c:1390
    #10 0x56273daa40de in qdev_device_add /mnt/sdb/backup/qemu/qdev-monitor.c:680
    #11 0x56273daa53e9 in qmp_device_add /mnt/sdb/backup/qemu/qdev-monitor.c:805

Fixes: 199646d81522509ac2dba6d28c31e8c7d807bc93
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
v1->v2:
- simply create port->bh last in virtser_port_device_realize() to fix memleaks.(Suggested by Markus Armbruster)
---
 hw/char/virtio-serial-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 941ed5aca9..99a65bab7f 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -943,7 +943,6 @@ static void virtser_port_device_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
 
     port->vser = bus->vser;
-    port->bh = qemu_bh_new(flush_queued_data_bh, port);
 
     assert(vsc->have_data);
 
@@ -992,6 +991,7 @@ static void virtser_port_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    port->bh = qemu_bh_new(flush_queued_data_bh, port);
     port->elem = NULL;
 }
 
-- 
2.18.2


