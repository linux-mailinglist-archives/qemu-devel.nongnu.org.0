Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93AD140A1
	for <lists+qemu-devel@lfdr.de>; Sun,  5 May 2019 17:31:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNJ6q-000150-QL
	for lists+qemu-devel@lfdr.de; Sun, 05 May 2019 11:31:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNJ4T-0008Ll-Jp
	for qemu-devel@nongnu.org; Sun, 05 May 2019 11:28:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNJ4S-0003QY-Nv
	for qemu-devel@nongnu.org; Sun, 05 May 2019 11:28:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56662)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hNJ4S-0003Q1-Hk; Sun, 05 May 2019 11:28:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9370036893;
	Sun,  5 May 2019 15:28:55 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F97A60C18;
	Sun,  5 May 2019 15:28:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Artyom Tarasenko <atar4qemu@gmail.com>, qemu-devel@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Sun,  5 May 2019 17:28:37 +0200
Message-Id: <20190505152839.18650-2-philmd@redhat.com>
In-Reply-To: <20190505152839.18650-1-philmd@redhat.com>
References: <20190505152839.18650-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Sun, 05 May 2019 15:28:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/3] hw/ppc/prep: use TYPE_MC146818_RTC instead
 of a hardcoded string
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
Cc: qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/prep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index b7f459d4754..ebee3211480 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -601,7 +601,7 @@ static int prep_set_cmos_checksum(DeviceState *dev, v=
oid *opaque)
     uint16_t checksum =3D *(uint16_t *)opaque;
     ISADevice *rtc;
=20
-    if (object_dynamic_cast(OBJECT(dev), "mc146818rtc")) {
+    if (object_dynamic_cast(OBJECT(dev), TYPE_MC146818_RTC)) {
         rtc =3D ISA_DEVICE(dev);
         rtc_set_memory(rtc, 0x2e, checksum & 0xff);
         rtc_set_memory(rtc, 0x3e, checksum & 0xff);
--=20
2.20.1


