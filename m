Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F348C104FD9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 10:58:26 +0100 (CET)
Received: from localhost ([::1]:38052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXjED-00050N-BJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 04:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38820)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iXjD0-00045m-WE
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 04:57:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iXjCz-0000DU-DF
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 04:57:06 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50608
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iXjCz-0000DC-AA
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 04:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574330224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jaF6EKSozvpNDluFR9QsaJF9Ywd4hX4kYChb+dYWlro=;
 b=JopX0Tw5qX/nHe+UjC5ZqOnFJCfTK35Nwr8brcpccjCxKms8WpG9ZLPu16h5igjIOeZYBw
 FXwH0MGHy+95Y+F+cMEQkWnEH7fOqV968j8ow3XzkshX+Gf3F6B/8h4NDNubLxER9o/Fnb
 YF3ejyOZ/IGd8s43hpWSduN9QlHPfhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-Qm9gsa8oNl2-FRO8U0I7ig-1; Thu, 21 Nov 2019 04:57:03 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65ADC1804976
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 09:57:02 +0000 (UTC)
Received: from localhost (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5198C60556;
 Thu, 21 Nov 2019 09:56:54 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] virtio-input: fix memory leak on unrealize
Date: Thu, 21 Nov 2019 13:56:49 +0400
Message-Id: <20191121095649.25453-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Qm9gsa8oNl2-FRO8U0I7ig-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Spotted by ASAN + minor stylistic change.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---

Michael: can you peek this in your next pullreq? thanks

hw/input/virtio-input.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
index 51617a5885..ec54e46ad6 100644
--- a/hw/input/virtio-input.c
+++ b/hw/input/virtio-input.c
@@ -275,6 +275,7 @@ static void virtio_input_finalize(Object *obj)
=20
     g_free(vinput->queue);
 }
+
 static void virtio_input_device_unrealize(DeviceState *dev, Error **errp)
 {
     VirtIOInputClass *vic =3D VIRTIO_INPUT_GET_CLASS(dev);
@@ -288,6 +289,8 @@ static void virtio_input_device_unrealize(DeviceState *=
dev, Error **errp)
             return;
         }
     }
+    virtio_del_queue(vdev, 0);
+    virtio_del_queue(vdev, 1);
     virtio_cleanup(vdev);
 }
=20
--=20
2.24.0


