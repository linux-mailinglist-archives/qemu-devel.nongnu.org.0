Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA0BE54FF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 22:19:32 +0200 (CEST)
Received: from localhost ([::1]:35864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO63X-0004Iq-RC
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 16:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55823)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iO571-00034H-C1
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 15:19:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iO570-0003yD-0s
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 15:19:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30954
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iO56z-0003xv-TX
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 15:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572031141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1xAy7r308A1eQ7rHywpoy93TJ0OhGHAvpDf8lF/0aAA=;
 b=fSeMiAerPIeFRwLASYa3Cftjwg6LBTP7+CpUsq6qBatUl2S+UdYsyyJ8LISuPb9TcqLEip
 FsmXKyZOodWktJQ6fMYNPf5w3NuymOCzPdlR5Dzu1wN3D9NlgMWmyzKuWPCncOggbi1jcp
 m+o+8+VT3We1GNLOGgBH5BFa0028Q6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-wlOHQ5iOME-02EYr7QgJBA-1; Fri, 25 Oct 2019 15:18:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9ACB1800DFB;
 Fri, 25 Oct 2019 19:18:56 +0000 (UTC)
Received: from localhost (ovpn-116-78.ams2.redhat.com [10.36.116.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7904460600;
 Fri, 25 Oct 2019 19:18:48 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] virtio-blk: Add blk_drain() to
 virtio_blk_device_unrealize()
Date: Fri, 25 Oct 2019 21:18:38 +0200
Message-Id: <20191025191839.1215-2-stefanha@redhat.com>
In-Reply-To: <20191025191839.1215-1-stefanha@redhat.com>
References: <20191025191839.1215-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: wlOHQ5iOME-02EYr7QgJBA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julia Suvorova <jusual@redhat.com>

QEMU does not wait for completed I/O requests, assuming that the guest
driver will reset the device before calling unrealize(). This does not
happen on Windows, and QEMU crashes in virtio_notify(), getting the
result of a completed I/O request on hot-unplugged device.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20191018142856.31870-1-jusual@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/block/virtio-blk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index ed2ddebd2b..14e9f85b8b 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1207,6 +1207,7 @@ static void virtio_blk_device_unrealize(DeviceState *=
dev, Error **errp)
     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
     VirtIOBlock *s =3D VIRTIO_BLK(dev);
=20
+    blk_drain(s->blk);
     virtio_blk_data_plane_destroy(s->dataplane);
     s->dataplane =3D NULL;
     qemu_del_vm_change_state_handler(s->change);
--=20
2.21.0


