Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A549B8F3AD
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 20:39:23 +0200 (CEST)
Received: from localhost ([::1]:46144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyKeg-0001T1-Hc
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 14:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37530)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1hyKXA-0002zi-AR
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 14:31:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hyKX7-0001wz-Ta
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 14:31:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50638)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hyKX1-0001iB-I1; Thu, 15 Aug 2019 14:31:27 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BA2DC300442C;
 Thu, 15 Aug 2019 18:31:25 +0000 (UTC)
Received: from blue.redhat.com (ovpn-117-22.phx2.redhat.com [10.3.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39970600CD;
 Thu, 15 Aug 2019 18:31:25 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Aug 2019 13:30:38 -0500
Message-Id: <20190815183039.4264-9-eblake@redhat.com>
In-Reply-To: <20190815183039.4264-1-eblake@redhat.com>
References: <20190815183039.4264-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 15 Aug 2019 18:31:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 8/9] block/nbd: add cmdline and qapi parameter
 reconnect-delay
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reconnect will be implemented in the following commit, so for now,
in semantics below, disconnect itself is a "serious error".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20190618114328.55249-5-vsementsov@virtuozzo.com>
[eblake: slipped from 4.1 to 4.2]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qapi/block-core.json | 11 ++++++++++-
 block/nbd.c          | 16 +++++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 0d43d4f37c1a..f1e7701fbea9 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3860,13 +3860,22 @@
 #                  traditional "base:allocation" block status (see
 #                  NBD_OPT_LIST_META_CONTEXT in the NBD protocol) (since=
 3.0)
 #
+# @reconnect-delay: On an unexpected disconnect, the nbd client tries to
+#                   connect again until succeeding or encountering a ser=
ious
+#                   error.  During the first @reconnect-delay seconds, a=
ll
+#                   requests are paused and will be rerun on a successfu=
l
+#                   reconnect. After that time, any delayed requests and=
 all
+#                   future requests before a successful reconnect will
+#                   immediately fail. Default 0 (Since 4.2)
+#
 # Since: 2.9
 ##
 { 'struct': 'BlockdevOptionsNbd',
   'data': { 'server': 'SocketAddress',
             '*export': 'str',
             '*tls-creds': 'str',
-            '*x-dirty-bitmap': 'str' } }
+            '*x-dirty-bitmap': 'str',
+            '*reconnect-delay': 'uint32' } }

 ##
 # @BlockdevOptionsRaw:
diff --git a/block/nbd.c b/block/nbd.c
index d03b00fc30b0..de2a26097bf9 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1275,6 +1275,7 @@ static int nbd_client_init(BlockDriverState *bs,
                            QCryptoTLSCreds *tlscreds,
                            const char *hostname,
                            const char *x_dirty_bitmap,
+                           uint32_t reconnect_delay,
                            Error **errp)
 {
     int ret;
@@ -1600,6 +1601,17 @@ static QemuOptsList nbd_runtime_opts =3D {
             .help =3D "experimental: expose named dirty bitmap in place =
of "
                     "block status",
         },
+        {
+            .name =3D "reconnect-delay",
+            .type =3D QEMU_OPT_NUMBER,
+            .help =3D "On an unexpected disconnect, the nbd client tries=
 to "
+                    "connect again until succeeding or encountering a se=
rious "
+                    "error.  During the first @reconnect-delay seconds, =
all "
+                    "requests are paused and will be rerun on a successf=
ul "
+                    "reconnect. After that time, any delayed requests an=
d all "
+                    "future requests before a successful reconnect will =
"
+                    "immediately fail. Default 0",
+        },
         { /* end of list */ }
     },
 };
@@ -1651,7 +1663,9 @@ static int nbd_open(BlockDriverState *bs, QDict *op=
tions, int flags,

     /* NBD handshake */
     ret =3D nbd_client_init(bs, s->saddr, s->export, tlscreds, hostname,
-                          qemu_opt_get(opts, "x-dirty-bitmap"), errp);
+                          qemu_opt_get(opts, "x-dirty-bitmap"),
+                          qemu_opt_get_number(opts, "reconnect-delay", 0=
),
+                          errp);

  error:
     if (tlscreds) {
--=20
2.20.1


