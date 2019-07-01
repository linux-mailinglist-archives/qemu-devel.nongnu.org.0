Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA7524017
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 20:12:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39987 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSmmK-0005yZ-AD
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 14:12:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hSml0-0004iD-1v
	for qemu-devel@nongnu.org; Mon, 20 May 2019 14:11:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hSmkx-0003YX-Uf
	for qemu-devel@nongnu.org; Mon, 20 May 2019 14:11:29 -0400
Received: from 4.mo178.mail-out.ovh.net ([46.105.49.171]:34364)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hSmkw-0003XB-SP
	for qemu-devel@nongnu.org; Mon, 20 May 2019 14:11:27 -0400
Received: from player750.ha.ovh.net (unknown [10.109.159.35])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id A5C4B67D50
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 20:11:23 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id 49B41610F68A;
	Mon, 20 May 2019 18:11:15 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Jason Wang <jasowang@redhat.com>
Date: Mon, 20 May 2019 20:11:11 +0200
Message-Id: <20190520181111.20407-1-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17134789207616162815
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddtkedguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.49.171
Subject: [Qemu-devel] [PATCH] ftgmac100: do not link to netdev
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Wim Vervoorn <wvervoorn@eltan.com>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qdev_set_nic_properties() is already used in the Aspeed SoC level to
bind the ftgmac100 device to the netdev.

This is fixing support for multiple net devices.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 790430346b51..d9986c6baa92 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -1016,8 +1016,6 @@ static void ftgmac100_realize(DeviceState *dev, Err=
or **errp)
     sysbus_init_irq(sbd, &s->irq);
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
=20
-    s->conf.peers.ncs[0] =3D nd_table[0].netdev;
-
     s->nic =3D qemu_new_nic(&net_ftgmac100_info, &s->conf,
                           object_get_typename(OBJECT(dev)), DEVICE(dev)-=
>id,
                           s);
--=20
2.20.1


