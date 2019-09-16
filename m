Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD34B3D57
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 17:12:51 +0200 (CEST)
Received: from localhost ([::1]:35754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9sgM-0003MY-Il
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 11:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51035)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i9ruN-00039J-LD
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:23:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i9ruM-0000mP-E6
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:23:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37944)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i9ruJ-0000jg-Bt; Mon, 16 Sep 2019 10:23:11 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A8B123071D50;
 Mon, 16 Sep 2019 14:23:10 +0000 (UTC)
Received: from localhost (unknown [10.40.205.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FCB1600F8;
 Mon, 16 Sep 2019 14:23:10 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 16 Sep 2019 16:22:37 +0200
Message-Id: <20190916142246.31474-8-mreitz@redhat.com>
In-Reply-To: <20190916142246.31474-1-mreitz@redhat.com>
References: <20190916142246.31474-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 16 Sep 2019 14:23:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 07/16] curl: Keep *socket until the end of
 curl_sock_cb()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This does not really change anything, but it makes the code a bit easier
to follow once we use @socket as the opaque pointer for
aio_set_fd_handler().

Cc: qemu-stable@nongnu.org
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190910124136.10565-3-mreitz@redhat.com
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/curl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 92dc2f630e..95d7b77dc0 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -172,10 +172,6 @@ static int curl_sock_cb(CURL *curl, curl_socket_t fd=
, int action,
=20
     QLIST_FOREACH(socket, &state->sockets, next) {
         if (socket->fd =3D=3D fd) {
-            if (action =3D=3D CURL_POLL_REMOVE) {
-                QLIST_REMOVE(socket, next);
-                g_free(socket);
-            }
             break;
         }
     }
@@ -185,7 +181,6 @@ static int curl_sock_cb(CURL *curl, curl_socket_t fd,=
 int action,
         socket->state =3D state;
         QLIST_INSERT_HEAD(&state->sockets, socket, next);
     }
-    socket =3D NULL;
=20
     trace_curl_sock_cb(action, (int)fd);
     switch (action) {
@@ -207,6 +202,11 @@ static int curl_sock_cb(CURL *curl, curl_socket_t fd=
, int action,
             break;
     }
=20
+    if (action =3D=3D CURL_POLL_REMOVE) {
+        QLIST_REMOVE(socket, next);
+        g_free(socket);
+    }
+
     return 0;
 }
=20
--=20
2.21.0


