Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E71C177483
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 11:51:08 +0100 (CET)
Received: from localhost ([::1]:45312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j958l-0005kv-9f
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 05:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59213)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ppandit@redhat.com>) id 1j957g-0004Ip-D6
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:50:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1j957f-0004HT-5j
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:50:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37307
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1j957f-0004H9-2Q
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583232598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+TlfrilbRfne+z8GeafTqYFZOfWGvku6sWK+MuQCqo=;
 b=ddk+dOW4uPA+l8q1C+B/P68evafsMw9UbwSzfDLkGOKEhPxKdKL6efibJlpj/3ytHU2gBu
 dl9GdYB2uul0K0W0wXlsT12bOEoWJjJRfSspB+6Fx7bQO71jRLInFHeiKnGwkyM6ENjndO
 bVCSsAgUvfsxrCFAXQ/GEinKgg0MzMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-Zp1wx_fSNpy8tnh7gZsb7Q-1; Tue, 03 Mar 2020 05:49:56 -0500
X-MC-Unique: Zp1wx_fSNpy8tnh7gZsb7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DDD5800053;
 Tue,  3 Mar 2020 10:49:55 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-177.sin2.redhat.com
 [10.67.116.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99A1B5C1D6;
 Tue,  3 Mar 2020 10:49:52 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: [PATCH v3 2/2] net: tulip: add .can_recieve routine
Date: Tue,  3 Mar 2020 16:17:24 +0530
Message-Id: <20200303104724.233375-3-ppandit@redhat.com>
In-Reply-To: <20200303104724.233375-1-ppandit@redhat.com>
References: <20200303104724.233375-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Li Qiang <pangpei.lq@antfin.com>, Sven Schnelle <svens@stackframe.org>,
 Qemu Developers <qemu-devel@nongnu.org>, Ziming Zhang <ezrakiez@gmail.com>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Define .can_receive routine to do sanity checks before receiving
packet data.

Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/net/tulip.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

Update v3: define .can_receive routine
  -> https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg06275.html

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index fbe40095da..757f12c710 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -229,6 +229,18 @@ static bool tulip_filter_address(TULIPState *s, const =
uint8_t *addr)
     return ret;
 }
=20
+static int
+tulip_can_receive(NetClientState *nc)
+{
+    TULIPState *s =3D qemu_get_nic_opaque(nc);
+
+    if (s->rx_frame_len || tulip_rx_stopped(s)) {
+        return false;
+    }
+
+    return true;
+}
+
 static ssize_t tulip_receive(TULIPState *s, const uint8_t *buf, size_t siz=
e)
 {
     struct tulip_descriptor desc;
@@ -236,7 +248,7 @@ static ssize_t tulip_receive(TULIPState *s, const uint8=
_t *buf, size_t size)
     trace_tulip_receive(buf, size);
=20
     if (size < 14 || size > sizeof(s->rx_frame) - 4
-        || s->rx_frame_len || tulip_rx_stopped(s)) {
+        || !tulip_can_receive(s->nic->ncs)) {
         return 0;
     }
=20
@@ -288,6 +300,7 @@ static NetClientInfo net_tulip_info =3D {
     .type =3D NET_CLIENT_DRIVER_NIC,
     .size =3D sizeof(NICState),
     .receive =3D tulip_receive_nc,
+    .can_receive =3D tulip_can_receive,
 };
=20
 static const char *tulip_reg_name(const hwaddr addr)
--=20
2.24.1


