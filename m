Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1706CB1BE1
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 13:00:40 +0200 (CEST)
Received: from localhost ([::1]:42404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8jJf-0003qH-5k
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 07:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40975)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1i8jHx-0002Ow-IE
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:58:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1i8jHv-0002gg-Lm
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:58:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44138)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>)
 id 1i8jHt-0002f8-34; Fri, 13 Sep 2019 06:58:49 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6D3E010CC1E2;
 Fri, 13 Sep 2019 10:58:48 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43CA760C57;
 Fri, 13 Sep 2019 10:58:39 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 13 Sep 2019 12:56:27 +0200
Message-Id: <20190913105626.22353-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Fri, 13 Sep 2019 10:58:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] virtio-blk: schedule virtio_notify_config
 to run on main context
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
Cc: kwolf@redhat.com, Sergio Lopez <slp@redhat.com>, mst@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
Changelog

v2:
 - Use aio_bh_schedule_oneshot instead of scheduling a coroutine
   (thanks Kevin Wolf).
 - Switch from RFC to v2 patch.
---
 hw/block/virtio-blk.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 18851601cb..669dc60f5b 100644
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
@@ -1086,11 +1087,29 @@ static int virtio_blk_load_device(VirtIODevice *v=
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
+    if (qemu_get_current_aio_context() !=3D qemu_get_aio_context()) {
+        /*
+         * virtio_notify_config() needs to acquire the global mutex,
+         * so it can't be called from an iothread. Instead, schedule
+         * it to be run in the main context BH.
+         */
+        aio_bh_schedule_oneshot(qemu_get_aio_context(),
+                                virtio_resize_cb, vdev);
+    } else {
+        virtio_notify_config(vdev);
+    }
 }
=20
 static const BlockDevOps virtio_block_ops =3D {
--=20
2.21.0


