Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520018BE93
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 18:44:56 +0100 (CET)
Received: from localhost ([::1]:41184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEzDz-0004mW-84
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 13:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37642)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ppandit@redhat.com>) id 1jEzCv-0003xX-JJ
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 13:43:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1jEzCu-0006UZ-CE
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 13:43:49 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:34942)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1jEzCu-0006UD-8D
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 13:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584639827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4HbV0cQ9P9Xo7EHZ8Az+BhnhBarlR3zlQZ8FTdALk2k=;
 b=Rby+RffMmZuKVRh3iWQfZpFTvx0VLPBhCIbP8XIbb/dxjyL+Brx5EglpwbZOqGy6w5XJAE
 o4YAhC6da9NBBIELmF2n+m5MYqtnXKMPveFX6e63u9nzgrzoOsfdmFk0K/+3YIQWtMPHex
 nXoapNPe2RCXWkYYyGPu7pXUMmKnyXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-HasEiZ25PT2_iWJlodoXig-1; Thu, 19 Mar 2020 13:43:43 -0400
X-MC-Unique: HasEiZ25PT2_iWJlodoXig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA789800D5B;
 Thu, 19 Mar 2020 17:43:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A029B21ECB;
 Thu, 19 Mar 2020 17:43:27 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: [PATCH v5 2/3] net: tulip: add .can_receive routine
Date: Thu, 19 Mar 2020 23:10:49 +0530
Message-Id: <20200319174050.759794-3-ppandit@redhat.com>
In-Reply-To: <20200319174050.759794-1-ppandit@redhat.com>
References: <20200319174050.759794-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, Sven Schnelle <svens@stackframe.org>,
 Qemu Developers <qemu-devel@nongnu.org>, Li Qiang <pangpei.lq@antfin.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Ziming Zhang <ezrakiez@gmail.com>
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

Update v5: fix a typo in commit log message
  -> https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg06209.html

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
2.25.1


