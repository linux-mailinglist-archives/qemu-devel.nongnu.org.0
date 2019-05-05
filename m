Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462AA14243
	for <lists+qemu-devel@lfdr.de>; Sun,  5 May 2019 22:12:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNNVG-00074q-FV
	for lists+qemu-devel@lfdr.de; Sun, 05 May 2019 16:12:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNNPx-0002sy-Mc
	for qemu-devel@nongnu.org; Sun, 05 May 2019 16:07:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNNPu-0006Pa-L0
	for qemu-devel@nongnu.org; Sun, 05 May 2019 16:07:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60770)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hNNPm-0005M5-7l; Sun, 05 May 2019 16:07:15 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67BD9C01EE87;
	Sun,  5 May 2019 20:07:06 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5B3A60851;
	Sun,  5 May 2019 20:06:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Date: Sun,  5 May 2019 22:06:02 +0200
Message-Id: <20190505200602.12412-6-philmd@redhat.com>
In-Reply-To: <20190505200602.12412-1-philmd@redhat.com>
References: <20190505200602.12412-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sun, 05 May 2019 20:07:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 5/5] hw/block/pflash_cfi02: Add the
 DeviceReset() handler
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	qemu-block@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pflash device is a child of TYPE_DEVICE, so it can implement
the DeviceReset handler. Actually it has to implement it, else
on machine reset it might stay in an incoherent state, as it has
been reported in the buglink listed below.

Add the DeviceReset handler and remove its call from the realize()
function.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1678713
Reported-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index f321b74433c..5af367d1563 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -674,6 +674,11 @@ static void pflash_cfi02_realize(DeviceState *dev, E=
rror **errp)
     pfl->cfi_table[0x3c] =3D 0x00;
 }
=20
+static void pflash_cfi02_reset(DeviceState *dev)
+{
+    pflash_reset(PFLASH_CFI02(dev));
+}
+
 static Property pflash_cfi02_properties[] =3D {
     DEFINE_PROP_DRIVE("drive", PFlashCFI02, blk),
     DEFINE_PROP_UINT32("num-blocks", PFlashCFI02, nb_blocs, 0),
@@ -701,6 +706,7 @@ static void pflash_cfi02_class_init(ObjectClass *klas=
s, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
+    dc->reset =3D pflash_cfi02_reset;
     dc->realize =3D pflash_cfi02_realize;
     dc->unrealize =3D pflash_cfi02_unrealize;
     dc->props =3D pflash_cfi02_properties;
--=20
2.20.1


