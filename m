Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5EF14CC1F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 15:09:47 +0100 (CET)
Received: from localhost ([::1]:47064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwo2M-0005Jl-NQ
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 09:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iwo09-0001Kt-JW
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 09:07:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iwo08-0001Ct-DF
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 09:07:29 -0500
Received: from relay.sw.ru ([185.231.240.75]:53604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iwo08-00013Q-68; Wed, 29 Jan 2020 09:07:28 -0500
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iwnzt-0003j6-4s; Wed, 29 Jan 2020 17:07:13 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/4] virtio: increase virtuqueue size for virtio-scsi and
 virtio-blk
Date: Wed, 29 Jan 2020 17:07:00 +0300
Message-Id: <20200129140702.5411-3-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200129140702.5411-1-dplotnikov@virtuozzo.com>
References: <20200129140702.5411-1-dplotnikov@virtuozzo.com>
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 stefanha@redhat.com, mreitz@redhat.com, pbonzini@redhat.com, den@virtuozzo.com
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
of data to be read/write from guest disk.

More details in the original problem statment:
https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg03721.html

Suggested-by: Denis V. Lunev <den@openvz.org>
Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 hw/core/machine.c          | 3 +++
 include/hw/virtio/virtio.h | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 3e288bfceb..8bc401d8b7 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -28,6 +28,9 @@
 #include "hw/mem/nvdimm.h"
 
 GlobalProperty hw_compat_4_2[] = {
+    { "virtio-blk-device", "queue-size", "128"},
+    { "virtio-scsi-device", "virtqueue_size", "128"},
+    { "vhost-blk-device", "virtqueue_size", "128"},
     { "virtio-blk-device", "x-enable-wce-if-config-wce", "off" },
     { "virtio-blk-device", "seg-max-adjust", "off"},
     { "virtio-scsi-device", "seg_max_adjust", "off"},
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index a66ea2368b..16d540e390 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -48,7 +48,7 @@ size_t virtio_feature_get_config_size(VirtIOFeature *features,
 typedef struct VirtQueue VirtQueue;
 
 #define VIRTQUEUE_MAX_SIZE 1024
-#define VIRTQUEUE_DEFAULT_SIZE 128
+#define VIRTQUEUE_DEFAULT_SIZE 256
 
 typedef struct VirtQueueElement
 {
-- 
2.17.0


