Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151AC18A46
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 15:06:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54287 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOikh-0000NK-6Y
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 09:06:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hOiiW-0007YL-Sx
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:04:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hOiiV-0007Z5-Mf
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:04:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hOiiV-0007Qb-G7
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:04:07 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52B7681F12
	for <qemu-devel@nongnu.org>; Thu,  9 May 2019 13:03:58 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-116-227.ams2.redhat.com
	[10.36.116.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1424960F8A;
	Thu,  9 May 2019 13:03:56 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  9 May 2019 15:03:45 +0200
Message-Id: <20190509130345.227526-5-sgarzare@redhat.com>
In-Reply-To: <20190509130345.227526-1-sgarzare@redhat.com>
References: <20190509130345.227526-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 09 May 2019 13:03:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 4/4] net: remove unused get_str_sep()
 function
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
Cc: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the get_str_sep() function is no longer used in
net/net.c, we can remove it.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/net.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/net/net.c b/net/net.c
index 570e093c4f..52496caca5 100644
--- a/net/net.c
+++ b/net/net.c
@@ -63,26 +63,6 @@ static QTAILQ_HEAD(, NetClientState) net_clients;
 /***********************************************************/
 /* network device redirectors */
=20
-static int get_str_sep(char *buf, int buf_size, const char **pp, int sep=
)
-{
-    const char *p, *p1;
-    int len;
-    p =3D *pp;
-    p1 =3D strchr(p, sep);
-    if (!p1)
-        return -1;
-    len =3D p1 - p;
-    p1++;
-    if (buf_size > 0) {
-        if (len > buf_size - 1)
-            len =3D buf_size - 1;
-        memcpy(buf, p, len);
-        buf[len] =3D '\0';
-    }
-    *pp =3D p1;
-    return 0;
-}
-
 int parse_host_port(struct sockaddr_in *saddr, const char *str,
                     Error **errp)
 {
--=20
2.20.1


