Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A0C1403FC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 07:28:12 +0100 (CET)
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isL74-0005Xq-TB
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 01:28:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52098)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1isL6K-00057j-9h
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 01:27:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1isL6E-0001wl-CC
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 01:27:20 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:49445
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1isL6D-0001vx-V1
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 01:27:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579242436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UKaYz/ReVYv9MGyCPnCg7PeI2JPlrAdQLTEbLiYBHSA=;
 b=Pt9nwSLqlbVlzr35mm8+yIoUNYULcWheou1jTM0m9KuJmawggk5TGkCTQ+5SfKSzFZNAwy
 W89lDGxiZJMpTnuz/zEd7S26qGnzDdgdCIZNd/wV4rUNfRcbHvDLhxTl3ligQUAN8hEYtl
 Xck8BnYDfq0jPn81LITCVdBOPR6dntY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-3sVii1fDOz67eSCiKP_LMg-1; Fri, 17 Jan 2020 01:27:15 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 003DBDB21;
 Fri, 17 Jan 2020 06:27:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39B0C61069;
 Fri, 17 Jan 2020 06:27:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4B7B74918; Fri, 17 Jan 2020 07:27:10 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] uas: fix super speed bMaxPacketSize0
Date: Fri, 17 Jan 2020 07:27:10 +0100
Message-Id: <20200117062710.25102-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 3sVii1fDOz67eSCiKP_LMg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: fys@fysnet.net, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For usb2 bMaxPacketSize0 is "n", for usb3 it is "1 << n",
so it must be 9 not 64 ...

Reported-by: fys@fysnet.net
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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


