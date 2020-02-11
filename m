Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DF41591A7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 15:15:21 +0100 (CET)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1WJs-0003xx-CM
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 09:15:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48339)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j1WJ2-0003Qj-1p
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:14:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j1WJ0-0002P6-JL
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:14:27 -0500
Received: from relay.sw.ru ([185.231.240.75]:44576)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j1WJ0-0002Mf-Cf; Tue, 11 Feb 2020 09:14:26 -0500
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j1WIp-0008Te-RJ; Tue, 11 Feb 2020 17:14:15 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] virtio: increase virtuqueue size for virtio-scsi and
 virtio-blk
Date: Tue, 11 Feb 2020 17:14:14 +0300
Message-Id: <20200211141414.12149-1-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The goal is to reduce the amount of requests issued by a guest on
1M reads/writes. This rises the performance up to 4% on that kind of
disk access pattern.

The maximum chunk size to be used for the guest disk accessing is
limited with seg_max parameter, which represents the max amount of
pices in the scatter-geather list in one guest disk request.

Since seg_max is virqueue_size dependent, increasing the virtqueue
size increases seg_max, which, in turn, increases the maximum size
of data to be read/write from a guest disk.

More details in the original problem statment:
https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg03721.html

Suggested-by: Denis V. Lunev <den@openvz.org>
Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 hw/block/virtio-blk.c | 4 ++--
 hw/core/machine.c     | 2 ++
 hw/scsi/virtio-scsi.c | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 09f46ed85f..6df3a7a6df 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -914,7 +914,7 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
     memset(&blkcfg, 0, sizeof(blkcfg));
     virtio_stq_p(vdev, &blkcfg.capacity, capacity);
     virtio_stl_p(vdev, &blkcfg.seg_max,
-                 s->conf.seg_max_adjust ? s->conf.queue_size - 2 : 128 - 2);
+                 s->conf.seg_max_adjust ? s->conf.queue_size - 2 : 256 - 2);
     virtio_stw_p(vdev, &blkcfg.geometry.cylinders, conf->cyls);
     virtio_stl_p(vdev, &blkcfg.blk_size, blk_size);
     virtio_stw_p(vdev, &blkcfg.min_io_size, conf->min_io_size / blk_size);
@@ -1272,7 +1272,7 @@ static Property virtio_blk_properties[] = {
     DEFINE_PROP_BIT("request-merging", VirtIOBlock, conf.request_merging, 0,
                     true),
     DEFINE_PROP_UINT16("num-queues", VirtIOBlock, conf.num_queues, 1),
-    DEFINE_PROP_UINT16("queue-size", VirtIOBlock, conf.queue_size, 128),
+    DEFINE_PROP_UINT16("queue-size", VirtIOBlock, conf.queue_size, 256),
     DEFINE_PROP_BOOL("seg-max-adjust", VirtIOBlock, conf.seg_max_adjust, true),
     DEFINE_PROP_LINK("iothread", VirtIOBlock, conf.iothread, TYPE_IOTHREAD,
                      IOThread *),
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 2501b540ec..3427d6cf4c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -28,6 +28,8 @@
 #include "hw/mem/nvdimm.h"
 
 GlobalProperty hw_compat_4_2[] = {
+    { "virtio-blk-device", "queue-size", "128"},
+    { "virtio-scsi-device", "virtqueue_size", "128"},
     { "virtio-blk-device", "x-enable-wce-if-config-wce", "off" },
     { "virtio-blk-device", "seg-max-adjust", "off"},
     { "virtio-scsi-device", "seg_max_adjust", "off"},
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 3b61563609..b38f50a429 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -660,7 +660,7 @@ static void virtio_scsi_get_config(VirtIODevice *vdev,
 
     virtio_stl_p(vdev, &scsiconf->num_queues, s->conf.num_queues);
     virtio_stl_p(vdev, &scsiconf->seg_max,
-                 s->conf.seg_max_adjust ? s->conf.virtqueue_size - 2 : 128 - 2);
+                 s->conf.seg_max_adjust ? s->conf.virtqueue_size - 2 : 256 - 2);
     virtio_stl_p(vdev, &scsiconf->max_sectors, s->conf.max_sectors);
     virtio_stl_p(vdev, &scsiconf->cmd_per_lun, s->conf.cmd_per_lun);
     virtio_stl_p(vdev, &scsiconf->event_info_size, sizeof(VirtIOSCSIEvent));
@@ -965,7 +965,7 @@ static void virtio_scsi_device_unrealize(DeviceState *dev, Error **errp)
 static Property virtio_scsi_properties[] = {
     DEFINE_PROP_UINT32("num_queues", VirtIOSCSI, parent_obj.conf.num_queues, 1),
     DEFINE_PROP_UINT32("virtqueue_size", VirtIOSCSI,
-                                         parent_obj.conf.virtqueue_size, 128),
+                                         parent_obj.conf.virtqueue_size, 256),
     DEFINE_PROP_BOOL("seg_max_adjust", VirtIOSCSI,
                       parent_obj.conf.seg_max_adjust, true),
     DEFINE_PROP_UINT32("max_sectors", VirtIOSCSI, parent_obj.conf.max_sectors,
-- 
2.17.0


