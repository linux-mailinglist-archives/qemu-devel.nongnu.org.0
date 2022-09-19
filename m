Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EFE5BD562
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 21:52:47 +0200 (CEST)
Received: from localhost ([::1]:38358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaMow-0006KG-9A
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 15:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oaMlQ-00018v-PZ
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 15:49:09 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:58308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oaMlN-0001DD-B3
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 15:49:07 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id AE4032E11CC;
 Mon, 19 Sep 2022 22:48:55 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b505::1:12])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 EwoX08on8s-mrPiAAr3; Mon, 19 Sep 2022 22:48:54 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663616934; bh=15nz29WN/AD0GcNOCMGKgP/LBa0eY4bvyzxlv94LplM=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=bcpwN93BsPRhJ6pJaa4FkZoSoiox1OXIQNYGBpL5sqMj3WGGytHx+8G9dY/GGrBf8
 bUkWBgb614rj86sPSxLNA9cl2B0HAlmYV/09DhoQR9xGEwCDRvEV5O1971wXDzsX6z
 /BtvUhtQK537LhaMbvOvgS2oKJgWu4/R7TvBnqbY=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, mst@redhat.com,
 rvkagan@yandex-team.ru, yc-core@yandex-team.ru, vsementsov@yandex-team.ru
Subject: [PATCH] virtio: add VIRTQUEUE_ERROR QAPI event
Date: Mon, 19 Sep 2022 22:48:05 +0300
Message-Id: <20220919194805.195952-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For now we only log the vhost device error, when virtqueue is actually
stopped. Let's add a QAPI event, which makes possible:

 - collect statistics of such errors
 - make immediate actions: take coredums or do some other debugging

The event could be reused for some other virtqueue problems (not only
for vhost devices) in future. For this it gets a generic name and
structure.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/virtio/vhost.c | 12 +++++++++---
 qapi/qdev.json    | 25 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index f758f177bb..caa81f2ace 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -15,6 +15,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-events-qdev.h"
 #include "hw/virtio/vhost.h"
 #include "qemu/atomic.h"
 #include "qemu/range.h"
@@ -1287,11 +1288,16 @@ static void vhost_virtqueue_error_notifier(EventNotifier *n)
     struct vhost_virtqueue *vq = container_of(n, struct vhost_virtqueue,
                                               error_notifier);
     struct vhost_dev *dev = vq->dev;
-    int index = vq - dev->vqs;
 
     if (event_notifier_test_and_clear(n) && dev->vdev) {
-        VHOST_OPS_DEBUG(-EINVAL,  "vhost vring error in virtqueue %d",
-                        dev->vq_index + index);
+        int ind = vq - dev->vqs + dev->vq_index;
+        DeviceState *ds = &dev->vdev->parent_obj;
+
+        VHOST_OPS_DEBUG(-EINVAL,  "vhost vring error in virtqueue %d", ind);
+        qapi_event_send_virtqueue_error(!!ds->id, ds->id, ds->canonical_path,
+                                        ind, VIRTQUEUE_ERROR_VHOST_VRING_ERR,
+                                        "vhost reported failure through vring "
+                                        "error fd");
     }
 }
 
diff --git a/qapi/qdev.json b/qapi/qdev.json
index 2708fb4e99..b7c2669c2c 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -158,3 +158,28 @@
 ##
 { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
   'data': { '*device': 'str', 'path': 'str' } }
+
+##
+# @VirtqueueError:
+#
+# Since: 7.2
+##
+{ 'enum': 'VirtqueueError',
+  'data': [ 'vhost-vring-err' ] }
+
+##
+# @VIRTQUEUE_ERROR:
+#
+# Emitted when a device virtqueue fails in runtime.
+#
+# @device: the device's ID if it has one
+# @path: the device's QOM path
+# @virtqueue: virtqueue index
+# @error: error identifier
+# @description: human readable description
+#
+# Since: 7.2
+##
+{ 'event': 'VIRTQUEUE_ERROR',
+ 'data': { '*device': 'str', 'path': 'str', 'virtqueue': 'int',
+            'error': 'VirtqueueError', 'description': 'str'} }
-- 
2.25.1


