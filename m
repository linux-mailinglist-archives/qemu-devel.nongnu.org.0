Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D49B187D70
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 10:52:20 +0100 (CET)
Received: from localhost ([::1]:55242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE8tX-0007Rd-Aa
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 05:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jE8sI-0005oA-C4
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 05:51:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1jE8sD-0004k0-KR
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 05:51:02 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:32755)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1jE8sD-0004iy-GT
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 05:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584438657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ps2X/VA5xqFwtlTlvRKCA4P0jgcwtIx4fu8RvAmrg3w=;
 b=BilLykQ6c8QrS2t1Mh343Nny6WHr10uLiR8ZjFA3+/Z3UZ/yUOaPJHgSDFmupZBoDUv0f/
 cE+INfzUv9SImlEBXIaR+KOvEjJEVOvnGBylnoZfAaI4W/Uiz4U7hQZzb+4XFMBL3/NTqo
 g7ZiospQWhH0m89grh85rL+QQ1q0EVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-AiylvWGePB6b6gnxXAo0Ow-1; Tue, 17 Mar 2020 05:50:54 -0400
X-MC-Unique: AiylvWGePB6b6gnxXAo0Ow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCF20800D5A;
 Tue, 17 Mar 2020 09:50:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D35160BE0;
 Tue, 17 Mar 2020 09:50:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 123A72049D; Tue, 17 Mar 2020 10:50:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] usb-serial: Increase receive buffer to 496
Date: Tue, 17 Mar 2020 10:50:48 +0100
Message-Id: <20200317095049.28486-4-kraxel@redhat.com>
In-Reply-To: <20200317095049.28486-1-kraxel@redhat.com>
References: <20200317095049.28486-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Andryuk <jandryuk@gmail.com>

A FTDI USB adapter on an xHCI controller can send 512 byte USB packets.
These are 8 * ( 2 bytes header + 62 bytes data).  A 384 byte receive
buffer is insufficient to fill a 512 byte packet, so bump the receive
size to 496 ( 512 - 2 * 8 ).

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-id: 20200316174610.115820-4-jandryuk@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index ec091b6a366c..77b964588b5f 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -29,7 +29,7 @@ do { printf("usb-serial: " fmt , ## __VA_ARGS__); } while=
 (0)
 #define DPRINTF(fmt, ...) do {} while(0)
 #endif
=20
-#define RECV_BUF 384
+#define RECV_BUF (512 - (2 * 8))
=20
 /* Commands */
 #define FTDI_RESET=09=090
--=20
2.18.2


