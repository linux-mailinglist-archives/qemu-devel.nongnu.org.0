Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C6A9F071
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 18:40:20 +0200 (CEST)
Received: from localhost ([::1]:54021 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2eW2-00082w-WD
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 12:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i2eQq-0003YP-8r
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:34:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i2eQp-0000Hm-3f
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:34:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38498)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i2eQm-0000GX-L0; Tue, 27 Aug 2019 12:34:52 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E0CE0807062;
 Tue, 27 Aug 2019 16:34:51 +0000 (UTC)
Received: from localhost (unknown [10.40.205.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74ADC19D7A;
 Tue, 27 Aug 2019 16:34:51 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 27 Aug 2019 18:34:37 +0200
Message-Id: <20190827163439.16686-5-mreitz@redhat.com>
In-Reply-To: <20190827163439.16686-1-mreitz@redhat.com>
References: <20190827163439.16686-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Tue, 27 Aug 2019 16:34:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/6] curl: Report only ready sockets
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of reporting all sockets to cURL, only report the one that has
caused curl_multi_do_locked() to be called.  This lets us get rid of the
QLIST_FOREACH_SAFE() list, which was actually wrong: SAFE foreaches are
only safe when the current element is removed in each iteration.  If it
possible for the list to be concurrently modified, we cannot guarantee
that only the current element will be removed.  Therefore, we must not
use QLIST_FOREACH_SAFE() here.

Fixes: ff5ca1664af85b24a4180d595ea6873fd3deac57
Cc: qemu-stable@nongnu.org
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/curl.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 05f77a38c2..bc70f39fcb 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -394,24 +394,19 @@ static void curl_multi_check_completion(BDRVCURLSta=
te *s)
 }
=20
 /* Called with s->mutex held.  */
-static void curl_multi_do_locked(CURLSocket *ready_socket)
+static void curl_multi_do_locked(CURLSocket *socket)
 {
-    CURLSocket *socket, *next_socket;
-    CURLState *s =3D socket->state;
+    BDRVCURLState *s =3D socket->state->s;
     int running;
     int r;
=20
-    if (!s->s->multi) {
+    if (!s->multi) {
         return;
     }
=20
-    /* Need to use _SAFE because curl_multi_socket_action() may trigger
-     * curl_sock_cb() which might modify this list */
-    QLIST_FOREACH_SAFE(socket, &s->sockets, next, next_socket) {
-        do {
-            r =3D curl_multi_socket_action(s->s->multi, socket->fd, 0, &=
running);
-        } while (r =3D=3D CURLM_CALL_MULTI_PERFORM);
-    }
+    do {
+        r =3D curl_multi_socket_action(s->multi, socket->fd, 0, &running=
);
+    } while (r =3D=3D CURLM_CALL_MULTI_PERFORM);
 }
=20
 static void curl_multi_do(void *arg)
--=20
2.21.0


