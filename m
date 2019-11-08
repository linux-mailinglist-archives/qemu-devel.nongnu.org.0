Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236C2F4D7A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 14:45:56 +0100 (CET)
Received: from localhost ([::1]:54580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT4aI-0005IM-72
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 08:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58382)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iT4Xm-0003B9-0C
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 08:43:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iT4Xk-0002Wr-JG
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 08:43:17 -0500
Received: from relay.sw.ru ([185.231.240.75]:35426)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iT4Xk-0002TS-Ba; Fri, 08 Nov 2019 08:43:16 -0500
Received: from [10.94.4.71] (helo=dptest2.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iT4Xh-0003uX-7k; Fri, 08 Nov 2019 16:43:13 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] virtio: make seg_max virtqueue size dependent
Date: Fri,  8 Nov 2019 16:42:49 +0300
Message-Id: <20191108134249.19004-2-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20191108134249.19004-1-dplotnikov@virtuozzo.com>
References: <20191108134249.19004-1-dplotnikov@virtuozzo.com>
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
Cc: den@virtuozzo.com, stefanha@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

seg_max has a restriction to be less or equal to virtqueue size
according to Virtio 1.0 specification

Although seg_max can't be set directly, it's worth to express this
dependancy directly in the code for sanity purpose.

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 hw/block/virtio-blk.c | 2 +-
 hw/scsi/virtio-scsi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 06e57a4d39..21530304cf 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -903,7 +903,7 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
     blk_get_geometry(s->blk, &capacity);
     memset(&blkcfg, 0, sizeof(blkcfg));
     virtio_stq_p(vdev, &blkcfg.capacity, capacity);
-    virtio_stl_p(vdev, &blkcfg.seg_max, 128 - 2);
+    virtio_stl_p(vdev, &blkcfg.seg_max, s->conf.queue_size - 2);
     virtio_stw_p(vdev, &blkcfg.geometry.cylinders, conf->cyls);
     virtio_stl_p(vdev, &blkcfg.blk_size, blk_size);
     virtio_stw_p(vdev, &blkcfg.min_io_size, conf->min_io_size / blk_size);
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 839f120256..f7e5533cd5 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -650,7 +650,7 @@ static void virtio_scsi_get_config(VirtIODevice *vdev,
     VirtIOSCSICommon *s = VIRTIO_SCSI_COMMON(vdev);
 
     virtio_stl_p(vdev, &scsiconf->num_queues, s->conf.num_queues);
-    virtio_stl_p(vdev, &scsiconf->seg_max, 128 - 2);
+    virtio_stl_p(vdev, &scsiconf->seg_max, s->conf.virtqueue_size - 2);
     virtio_stl_p(vdev, &scsiconf->max_sectors, s->conf.max_sectors);
     virtio_stl_p(vdev, &scsiconf->cmd_per_lun, s->conf.cmd_per_lun);
     virtio_stl_p(vdev, &scsiconf->event_info_size, sizeof(VirtIOSCSIEvent));
-- 
2.17.0


