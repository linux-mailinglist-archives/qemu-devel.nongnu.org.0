Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096451773BD
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 11:17:13 +0100 (CET)
Received: from localhost ([::1]:44756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j94bv-0003Y7-W6
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 05:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j94WF-00082d-MS
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:11:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j94WE-0006F5-J9
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:11:19 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31578
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j94WE-0006Ev-FU
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:11:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583230278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUVMgu3taFrVdtqL+TAAQJ+eS/lDgUc1HJ2Th9oKz08=;
 b=LXzaj7SKH/3d28WA5zEc54+ThdsV24yoIIJZT9D3gZArQijNiYEj9hTuAVq19smWBBVYhx
 jbjr/3tQAxJgLYRE3MRIinKD1bIlAzDWjdQYF6dDjiOAMnKGsCGzZhtbY8zy9PePGg2wUc
 lHQckqctBW8GiZawSRAeAluVgAQEXb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-y58YNuVZOI-_YiLgdDLyKA-1; Tue, 03 Mar 2020 05:11:16 -0500
X-MC-Unique: y58YNuVZOI-_YiLgdDLyKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40275800D50;
 Tue,  3 Mar 2020 10:11:15 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-98.pek2.redhat.com
 [10.72.12.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EC888B745;
 Tue,  3 Mar 2020 10:11:13 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 13/23] dp8393x: Don't reset Silicon Revision register
Date: Tue,  3 Mar 2020 18:10:32 +0800
Message-Id: <1583230242-14597-14-git-send-email-jasowang@redhat.com>
In-Reply-To: <1583230242-14597-1-git-send-email-jasowang@redhat.com>
References: <1583230242-14597-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Finn Thain <fthain@telegraphics.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Finn Thain <fthain@telegraphics.com.au>

The jazzsonic driver in Linux uses the Silicon Revision register value
to probe the chip. The driver fails unless the SR register contains 4.
Unfortunately, reading this register in QEMU usually returns 0 because
the s->regs[] array gets wiped after a software reset.

Fixes: bd8f1ebce4 ("net/dp8393x: fix hardware reset")
Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/dp8393x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index cfbc2ee..c2ac2a1 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -923,6 +923,7 @@ static void dp8393x_reset(DeviceState *dev)
     timer_del(s->watchdog);
=20
     memset(s->regs, 0, sizeof(s->regs));
+    s->regs[SONIC_SR] =3D 0x0004; /* only revision recognized by Linux/mip=
s */
     s->regs[SONIC_CR] =3D SONIC_CR_RST | SONIC_CR_STP | SONIC_CR_RXDIS;
     s->regs[SONIC_DCR] &=3D ~(SONIC_DCR_EXBUS | SONIC_DCR_LBR);
     s->regs[SONIC_RCR] &=3D ~(SONIC_RCR_LB0 | SONIC_RCR_LB1 | SONIC_RCR_BR=
D | SONIC_RCR_RNT);
@@ -975,7 +976,6 @@ static void dp8393x_realize(DeviceState *dev, Error **e=
rrp)
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
=20
     s->watchdog =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, dp8393x_watchdog, s);
-    s->regs[SONIC_SR] =3D 0x0004; /* only revision recognized by Linux */
=20
     memory_region_init_ram(&s->prom, OBJECT(dev),
                            "dp8393x-prom", SONIC_PROM_SIZE, &local_err);
--=20
2.5.0


