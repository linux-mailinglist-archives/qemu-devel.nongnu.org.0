Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442ED1754D2
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 08:48:46 +0100 (CET)
Received: from localhost ([::1]:56078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8foj-00005N-90
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 02:48:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j8fhF-0003rq-Ue
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:41:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j8fhE-0003Ue-Vw
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:41:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41216
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j8fhE-0003US-S7
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583134860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fq233vp5w5aZrfj8fLdkUXIRg6LJGgiJqm59yH0KHgM=;
 b=cFujHfCz7pSVeDWlsr4MZzNYWtEOJ/RgZcFUjdNyRhTZc+UO/RgQfPvnL84AgnWW6InMtb
 ubLA8LTy4VUBBV9wqJFtijb9dYS7DBX2jmj14XnsIByRP6HylpOyPBBJNcZEnAMQSJkzvk
 /lnwctuaWot68sM/FLL8QHbJEoyJkIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-PrPTAb6AOUORCHCBz_6wGg-1; Mon, 02 Mar 2020 02:40:56 -0500
X-MC-Unique: PrPTAb6AOUORCHCBz_6wGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4515F18FE861;
 Mon,  2 Mar 2020 07:40:55 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-58.pek2.redhat.com
 [10.72.12.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B197060BF3;
 Mon,  2 Mar 2020 07:40:51 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 06/23] dp8393x: Clear RRRA command register bit only when
 appropriate
Date: Mon,  2 Mar 2020 15:40:19 +0800
Message-Id: <1583134836-23991-7-git-send-email-jasowang@redhat.com>
In-Reply-To: <1583134836-23991-1-git-send-email-jasowang@redhat.com>
References: <1583134836-23991-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Finn Thain <fthain@telegraphics.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Finn Thain <fthain@telegraphics.com.au>

It doesn't make sense to clear the command register bit unless the
command was actually issued.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/dp8393x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 9604623..b5a9c6a 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -352,9 +352,6 @@ static void dp8393x_do_read_rra(dp8393xState *s)
         s->regs[SONIC_ISR] |=3D SONIC_ISR_RBE;
         dp8393x_update_irq(s);
     }
-
-    /* Done */
-    s->regs[SONIC_CR] &=3D ~SONIC_CR_RRRA;
 }
=20
 static void dp8393x_do_software_reset(dp8393xState *s)
@@ -565,8 +562,10 @@ static void dp8393x_do_command(dp8393xState *s, uint16=
_t command)
         dp8393x_do_start_timer(s);
     if (command & SONIC_CR_RST)
         dp8393x_do_software_reset(s);
-    if (command & SONIC_CR_RRRA)
+    if (command & SONIC_CR_RRRA) {
         dp8393x_do_read_rra(s);
+        s->regs[SONIC_CR] &=3D ~SONIC_CR_RRRA;
+    }
     if (command & SONIC_CR_LCAM)
         dp8393x_do_load_cam(s);
 }
--=20
2.5.0


