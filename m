Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0826F221
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Jul 2019 09:16:28 +0200 (CEST)
Received: from localhost ([::1]:54886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hp655-0002yI-EQ
	for lists+qemu-devel@lfdr.de; Sun, 21 Jul 2019 03:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41229)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <lizhengui@huawei.com>) id 1hp64r-0002Vd-Dt
 for qemu-devel@nongnu.org; Sun, 21 Jul 2019 03:16:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lizhengui@huawei.com>) id 1hp64q-0007ab-AW
 for qemu-devel@nongnu.org; Sun, 21 Jul 2019 03:16:13 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:59770 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lizhengui@huawei.com>)
 id 1hp64n-0007Ax-Lj; Sun, 21 Jul 2019 03:16:09 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1EFBDB7F0E40565C1B36;
 Sun, 21 Jul 2019 15:15:53 +0800 (CST)
Received: from HGHY1l002846723.china.huawei.com (10.177.251.193) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Sun, 21 Jul 2019 15:15:46 +0800
From: l00284672 <lizhengui@huawei.com>
To: <pbonzini@redhat.com>, <kwolf@redhat.com>
Date: Sun, 21 Jul 2019 15:12:58 +0800
Message-ID: <1563693178-23328-1-git-send-email-lizhengui@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.177.251.193]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-devel] [PATCH] virtio-scsi: fixed virtio_scsi_ctx_check
 failed when detaching scsi disk
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
Cc: lizhengui@huawei.com, qemu-block@nongnu.org, eric.fangyi@huawei.com,
 qemu-devel@nongnu.org, jiangyiwen@huawei.com, wangjie88@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit a6f230c move blockbackend back to main AioContext on unplug. It se=
t the AioContext of
SCSIDevice to the main AioContex, but s->ctx is still the iothread AioCon=
tex=EF=BC=88if the scsi controller
is configure with iothread=EF=BC=89. So if there are having in-flight req=
uests during unplug, a failing assertion
happend. The bt is below:
(gdb) bt
#0  0x0000ffff86aacbd0 in raise () from /lib64/libc.so.6
#1  0x0000ffff86aadf7c in abort () from /lib64/libc.so.6
#2  0x0000ffff86aa6124 in __assert_fail_base () from /lib64/libc.so.6
#3  0x0000ffff86aa61a4 in __assert_fail () from /lib64/libc.so.6
#4  0x0000000000529118 in virtio_scsi_ctx_check (d=3D<optimized out>, s=3D=
<optimized out>, s=3D<optimized out>) at /home/qemu-4.0.0/hw/scsi/virtio-=
scsi.c:246
#5  0x0000000000529ec4 in virtio_scsi_handle_cmd_req_prepare (s=3D0x2779e=
c00, req=3D0xffff740397d0) at /home/qemu-4.0.0/hw/scsi/virtio-scsi.c:559
#6  0x000000000052a228 in virtio_scsi_handle_cmd_vq (s=3D0x2779ec00, vq=3D=
0xffff7c6d7110) at /home/qemu-4.0.0/hw/scsi/virtio-scsi.c:603
#7  0x000000000052afa8 in virtio_scsi_data_plane_handle_cmd (vdev=3D<opti=
mized out>, vq=3D0xffff7c6d7110) at /home/qemu-4.0.0/hw/scsi/virtio-scsi-=
dataplane.c:59
#8  0x000000000054d94c in virtio_queue_host_notifier_aio_poll (opaque=3D<=
optimized out>) at /home/qemu-4.0.0/hw/virtio/virtio.c:2452

assert(blk_get_aio_context(d->conf.blk) =3D=3D s->ctx) failed.

To avoid assertion failed,  moving the "if" after qdev_simple_device_unpl=
ug_cb.

In addition, to avoid another qemu crash below, add aio_disable_external =
before
qdev_simple_device_unplug_cb, which disable the further processing of ext=
ernal clients
when doing qdev_simple_device_unplug_cb.
(gdb) bt
#0  scsi_req_unref (req=3D0xffff6802c6f0) at hw/scsi/scsi-bus.c:1283
#1  0x00000000005294a4 in virtio_scsi_handle_cmd_req_submit (req=3D<optim=
ized out>,
    s=3D<optimized out>) at /home/qemu-4.0.0/hw/scsi/virtio-scsi.c:589
#2  0x000000000052a2a8 in virtio_scsi_handle_cmd_vq (s=3Ds@entry=3D0x9c90=
e90,
    vq=3Dvq@entry=3D0xffff7c05f110) at /home/qemu-4.0.0/hw/scsi/virtio-sc=
si.c:625
#3  0x000000000052afd8 in virtio_scsi_data_plane_handle_cmd (vdev=3D<opti=
mized out>,
    vq=3D0xffff7c05f110) at /home/qemu-4.0.0/hw/scsi/virtio-scsi-dataplan=
e.c:60
#4  0x000000000054d97c in virtio_queue_host_notifier_aio_poll (opaque=3D<=
optimized out>)
    at /home/qemu-4.0.0/hw/virtio/virtio.c:2447
#5  0x00000000009b204c in run_poll_handlers_once (ctx=3Dctx@entry=3D0x6ef=
ea40,
    timeout=3Dtimeout@entry=3D0xffff7d7f7308) at util/aio-posix.c:521
#6  0x00000000009b2b64 in run_poll_handlers (ctx=3Dctx@entry=3D0x6efea40,
    max_ns=3Dmax_ns@entry=3D4000, timeout=3Dtimeout@entry=3D0xffff7d7f730=
8) at util/aio-posix.c:559
#7  0x00000000009b2ca0 in try_poll_mode (ctx=3Dctx@entry=3D0x6efea40, tim=
eout=3D0xffff7d7f7308,
    timeout@entry=3D0xffff7d7f7348) at util/aio-posix.c:594
#8  0x00000000009b31b8 in aio_poll (ctx=3D0x6efea40, blocking=3Dblocking@=
entry=3Dtrue)
    at util/aio-posix.c:636
#9  0x00000000006973cc in iothread_run (opaque=3D0x6ebd800) at iothread.c=
:75
#10 0x00000000009b592c in qemu_thread_start (args=3D0x6efef60) at util/qe=
mu-thread-posix.c:502
#11 0x0000ffff8057f8bc in start_thread () from /lib64/libpthread.so.0
#12 0x0000ffff804e5f8c in thread_start () from /lib64/libc.so.6
(gdb) p bus
$1 =3D (SCSIBus *) 0x0
---
 hw/scsi/virtio-scsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 839f120..79e555f 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -837,13 +837,15 @@ static void virtio_scsi_hotunplug(HotplugHandler *h=
otplug_dev, DeviceState *dev,
         virtio_scsi_release(s);
     }
=20
+    aio_disable_external(s->ctx);
+    qdev_simple_device_unplug_cb(hotplug_dev, dev, errp);
+    aio_enable_external(s->ctx);
+
     if (s->ctx) {
         virtio_scsi_acquire(s);
         blk_set_aio_context(sd->conf.blk, qemu_get_aio_context());
         virtio_scsi_release(s);
     }
-
-    qdev_simple_device_unplug_cb(hotplug_dev, dev, errp);
 }
=20
 static struct SCSIBusInfo virtio_scsi_scsi_info =3D {
--=20
2.7.2.windows.1



