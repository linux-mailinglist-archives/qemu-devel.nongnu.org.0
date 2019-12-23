Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D23A12966A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 14:19:21 +0100 (CET)
Received: from localhost ([::1]:56868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijNcF-0004n9-Qb
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 08:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41361)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1ijNbY-0004LJ-SE
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 08:18:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1ijNbX-00051y-Ln
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 08:18:36 -0500
Received: from relay.sw.ru ([185.231.240.75]:52930)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1ijNbX-0004xu-Ec
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 08:18:35 -0500
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1ijNbP-0003NG-8b; Mon, 23 Dec 2019 16:18:27 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] virtio: stregthen virtqueue size invariants
Date: Mon, 23 Dec 2019 16:18:20 +0300
Message-Id: <20191223131820.19300-1-dplotnikov@virtuozzo.com>
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1. virtqueue_size is a power of 2
2. virtqueue_size > 2, since seg_max is virtqueue_size - 2

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 hw/virtio/virtio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 04716b5f6c..e3ab69061e 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2166,7 +2166,8 @@ void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
      */
     if (!!num != !!vdev->vq[n].vring.num ||
         num > VIRTQUEUE_MAX_SIZE ||
-        num < 0) {
+        num < 2 ||
+        !is_power_of_2(num)) {
         return;
     }
     vdev->vq[n].vring.num = num;
-- 
2.17.0


