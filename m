Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B54016B32D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 22:52:13 +0100 (CET)
Received: from localhost ([::1]:44576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Le8-0007mk-68
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 16:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53792)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Ksa-0000sQ-NK
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:03:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KsZ-0008NL-J5
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:03:04 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20204
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KsZ-0008Mh-FK
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XVZvi/YHzEh7ylVqPr697ez8p22nG0yVmTeif46TOmw=;
 b=LOcpmxI4gKqqhkmNheMcNGBzbQiq0OcfMlLyG8pBvi1JQpO2BflwkHfjzocD8+e4gV9LDb
 syXWrS2QFjOeqrvAqhHfOlYH7NO/FnP4zyXDudUH0KYpwXKSBzgIHapS++mudlV1QmteT9
 WMyyDC4gPDf/qtX/RPnrowIQu2hXsAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-v-AiIWesPt2X2quRXpPcbw-1; Mon, 24 Feb 2020 16:03:01 -0500
X-MC-Unique: v-AiIWesPt2X2quRXpPcbw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9C21801E6C;
 Mon, 24 Feb 2020 21:02:56 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CEBA5C21B;
 Mon, 24 Feb 2020 21:02:42 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH RESEND v2 31/32] hw/net/milkymist-minimac2: Let devices
 own the MemoryRegion they create
Date: Mon, 24 Feb 2020 21:55:32 +0100
Message-Id: <20200224205533.23798-32-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid orphan memory regions being added in the /unattached QOM
container.

Note this change break the migration of the LM32 milkymist machine.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/net/milkymist-minimac2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index 1ba01754ee..9582b5f8a3 100644
--- a/hw/net/milkymist-minimac2.c
+++ b/hw/net/milkymist-minimac2.c
@@ -473,9 +473,9 @@ static void milkymist_minimac2_realize(DeviceState *dev=
, Error **errp)
     sysbus_init_mmio(sbd, &s->regs_region);
=20
     /* register buffers memory */
-    memory_region_init_ram_nomigrate(&s->buffers, OBJECT(dev), "milkymist-=
minimac2.buffers",
+    memory_region_init_ram(&s->buffers, OBJECT(dev),
+                           "milkymist-minimac2.buffers",
                            buffers_size, &error_fatal);
-    vmstate_register_ram_global(&s->buffers);
     s->rx0_buf =3D memory_region_get_ram_ptr(&s->buffers);
     s->rx1_buf =3D s->rx0_buf + MINIMAC2_BUFFER_SIZE;
     s->tx_buf =3D s->rx1_buf + MINIMAC2_BUFFER_SIZE;
@@ -506,8 +506,8 @@ static const VMStateDescription vmstate_milkymist_minim=
ac2_mdio =3D {
=20
 static const VMStateDescription vmstate_milkymist_minimac2 =3D {
     .name =3D "milkymist-minimac2",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, MilkymistMinimac2State, R_MAX),
         VMSTATE_UINT16_ARRAY(phy_regs, MilkymistMinimac2State, R_PHY_MAX),
--=20
2.21.1


