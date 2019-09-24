Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF437BCC9C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 18:41:48 +0200 (CEST)
Received: from localhost ([::1]:48248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCnsp-0002XE-HK
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 12:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <amorenoz@redhat.com>) id 1iCnYf-00005n-I0
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 12:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <amorenoz@redhat.com>) id 1iCnYc-0007u5-Pk
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 12:20:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57400)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <amorenoz@redhat.com>) id 1iCnYc-0007s5-KL
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 12:20:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 316D2C049E36;
 Tue, 24 Sep 2019 16:20:52 +0000 (UTC)
Received: from amorenoz.users.ipa.redhat.com (ovpn-117-80.ams2.redhat.com
 [10.36.117.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 330BA66A00;
 Tue, 24 Sep 2019 16:20:48 +0000 (UTC)
From: Adrian Moreno <amorenoz@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] vhost-user: save features if the char dev is closed
Date: Tue, 24 Sep 2019 18:20:44 +0200
Message-Id: <20190924162044.11414-1-amorenoz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 24 Sep 2019 16:20:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: ddstreet@canonical.com, jasowang@redhat.com,
 Adrian Moreno <amorenoz@redhat.com>, Pei Zhang <pezhang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That way the state can be correctly restored when the device is opened
again. This might happen if the backend is restarted.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1738768
Reported-by: Pei Zhang <pezhang@redhat.com>
Fixes: 6ab79a20af3a (do not call vhost_net_cleanup() on running net from =
char user event)
Cc: ddstreet@canonical.com
Cc: Michael S. Tsirkin <mst@redhat.com>

Signed-off-by: Adrian Moreno <amorenoz@redhat.com>
---
 net/vhost-user.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/vhost-user.c b/net/vhost-user.c
index 51921de443..014199d600 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -235,6 +235,10 @@ static void chr_closed_bh(void *opaque)
=20
     s =3D DO_UPCAST(NetVhostUserState, nc, ncs[0]);
=20
+    if (s->vhost_net) {
+        s->acked_features =3D vhost_net_get_acked_features(s->vhost_net)=
;
+    }
+
     qmp_set_link(name, false, &err);
=20
     qemu_chr_fe_set_handlers(&s->chr, NULL, NULL, net_vhost_user_event,
--=20
2.21.0


