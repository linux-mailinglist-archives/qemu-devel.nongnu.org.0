Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F798BE3B5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 19:47:52 +0200 (CEST)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDBOI-0004gB-PH
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 13:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53404)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iDBL4-0002zF-Ox
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 13:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iDBL3-00038n-GF
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 13:44:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51046)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1iDBL1-00036x-6j; Wed, 25 Sep 2019 13:44:27 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7BE0285539;
 Wed, 25 Sep 2019 17:44:25 +0000 (UTC)
Received: from localhost (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AC5961F40;
 Wed, 25 Sep 2019 17:44:16 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] virtio-blk: schedule virtio_notify_config to run on main
 context
Date: Wed, 25 Sep 2019 18:44:00 +0100
Message-Id: <20190925174400.8578-3-stefanha@redhat.com>
In-Reply-To: <20190925174400.8578-1-stefanha@redhat.com>
References: <20190925174400.8578-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 25 Sep 2019 17:44:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergio Lopez <slp@redhat.com>

virtio_notify_config() needs to acquire the global mutex, which isn't
allowed from an iothread, and may lead to a deadlock like this:

 - main thead
  * Has acquired: qemu_global_mutex.
  * Is trying the acquire: iothread AioContext lock via
    AIO_WAIT_WHILE (after aio_poll).

 - iothread
  * Has acquired: AioContext lock.
  * Is trying to acquire: qemu_global_mutex (via
    virtio_notify_config->prepare_mmio_access).

If virtio_blk_resize() is called from an iothread, schedule
virtio_notify_config() to be run in the main context BH.

[Removed unnecessary newline as suggested by Kevin Wolf
<kwolf@redhat.com>.
--Stefan]

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-id: 20190916112411.21636-1-slp@redhat.com
Message-Id: <20190916112411.21636-1-slp@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/block/virtio-blk.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 18851601cb..ed2ddebd2b 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -16,6 +16,7 @@
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
+#include "qemu/main-loop.h"
 #include "trace.h"
 #include "hw/block/block.h"
 #include "hw/qdev-properties.h"
@@ -1086,11 +1087,24 @@ static int virtio_blk_load_device(VirtIODevice *v=
dev, QEMUFile *f,
     return 0;
 }
=20
+static void virtio_resize_cb(void *opaque)
+{
+    VirtIODevice *vdev =3D opaque;
+
+    assert(qemu_get_current_aio_context() =3D=3D qemu_get_aio_context())=
;
+    virtio_notify_config(vdev);
+}
+
 static void virtio_blk_resize(void *opaque)
 {
     VirtIODevice *vdev =3D VIRTIO_DEVICE(opaque);
=20
-    virtio_notify_config(vdev);
+    /*
+     * virtio_notify_config() needs to acquire the global mutex,
+     * so it can't be called from an iothread. Instead, schedule
+     * it to be run in the main context BH.
+     */
+    aio_bh_schedule_oneshot(qemu_get_aio_context(), virtio_resize_cb, vd=
ev);
 }
=20
 static const BlockDevOps virtio_block_ops =3D {
--=20
2.21.0


