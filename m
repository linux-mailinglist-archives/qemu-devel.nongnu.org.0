Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7248DC75F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 16:31:15 +0200 (CEST)
Received: from localhost ([::1]:40924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLTHe-0007bN-Ua
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 10:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32995)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jusual@redhat.com>) id 1iLTFq-0006YC-Kz
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 10:29:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jusual@redhat.com>) id 1iLTFp-0001pD-K2
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 10:29:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48542)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jusual@redhat.com>) id 1iLTFp-0001oj-EZ
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 10:29:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0969518C4287
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 14:29:20 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-204-99.brq.redhat.com
 [10.40.204.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A76D600C4;
 Fri, 18 Oct 2019 14:29:05 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio-blk: Add blk_drain() to virtio_blk_device_unrealize()
Date: Fri, 18 Oct 2019 16:28:56 +0200
Message-Id: <20191018142856.31870-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 18 Oct 2019 14:29:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU does not wait for completed I/O requests, assuming that the guest
driver will reset the device before calling unrealize(). This does not
happen on Windows, and QEMU crashes in virtio_notify(), getting the
result of a completed I/O request on hot-unplugged device.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 hw/block/virtio-blk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index ed2ddebd2b..14e9f85b8b 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1207,6 +1207,7 @@ static void virtio_blk_device_unrealize(DeviceState=
 *dev, Error **errp)
     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
     VirtIOBlock *s =3D VIRTIO_BLK(dev);
=20
+    blk_drain(s->blk);
     virtio_blk_data_plane_destroy(s->dataplane);
     s->dataplane =3D NULL;
     qemu_del_vm_change_state_handler(s->change);
--=20
2.21.0


