Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01EB140480
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 08:38:24 +0100 (CET)
Received: from localhost ([::1]:53546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isMD1-0008Em-GK
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 02:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60506)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1isMC7-0007aT-Mo
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 02:37:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1isMC3-0008WD-MA
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 02:37:27 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51332
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1isMC3-0008VZ-Ii
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 02:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579246642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MY50L+/Lb6ow1jVg56Yso0jhVLvLRD5qVST/+qva3O4=;
 b=LPtD9I3iq9cF7GhzYTVdNvIuSl8n2W1KqO2+6aOMPLa4w8ljR17dg/+7RKWwCx5kZ6J9+/
 38sIxDHiRZSip1tITnad5JVo4W7YSoYicixriOmt8/0jW0WoU5vg3FHMfv72/XTk2YlYrv
 ixMiifJlEvj/xCMBXvD57VVRPIoeOM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-L1Qitxu6Mha8QUlZvo4-KA-1; Fri, 17 Jan 2020 02:37:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 580B81800D4F;
 Fri, 17 Jan 2020 07:37:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7554C60C63;
 Fri, 17 Jan 2020 07:37:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 209BF97C2; Fri, 17 Jan 2020 08:37:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] uas: fix super speed bMaxPacketSize0
Date: Fri, 17 Jan 2020 08:37:16 +0100
Message-Id: <20200117073716.31335-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: L1Qitxu6Mha8QUlZvo4-KA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: fys@fysnet.net, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For usb2 bMaxPacketSize0 is "n", for usb3 it is "1 << n",
so it must be 9 not 64 ...

rom "Universal Serial Bus 3.1 Specification":

   If the device is operating at Gen X speed, the bMaxPacketSize0
   field shall be set to 09H indicating a 512-byte maximum packet.
   An Enhanced SuperSpeed device shall not support any other maximum
   packet sizes for the default control pipe (endpoint 0) control
   endpoint.

We now announce a 512-byte maximum packet.

Fixes: 89a453d4a5c ("uas-uas: usb3 streams")
Reported-by: Benjamin David Lunt <fys@fysnet.net>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/usb/dev-uas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index 6d6d1073b907..1bc4dd4fafb8 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -303,7 +303,7 @@ static const USBDescDevice desc_device_high =3D {
=20
 static const USBDescDevice desc_device_super =3D {
     .bcdUSB                        =3D 0x0300,
-    .bMaxPacketSize0               =3D 64,
+    .bMaxPacketSize0               =3D 9,
     .bNumConfigurations            =3D 1,
     .confs =3D (USBDescConfig[]) {
         {
--=20
2.18.1


