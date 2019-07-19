Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D59C6E7F5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 17:27:02 +0200 (CEST)
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoUmj-0005KE-Iu
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 11:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60096)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hoUmY-0004vT-1b
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:26:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hoUmU-0004Vd-Bh
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:26:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40185)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hoUmF-0002PC-2P; Fri, 19 Jul 2019 11:26:34 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 936BE30B9912;
 Fri, 19 Jul 2019 15:03:19 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-46.phx2.redhat.com [10.3.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED3BA1001B14;
 Fri, 19 Jul 2019 15:03:18 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 19 Jul 2019 10:03:13 -0500
Message-Id: <20190719150313.29198-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 19 Jul 2019 15:03:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] nbd: Initialize reply on failure
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
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've had two separate reports of a caller running into use of
uninitialized data if s->quit is set (one detected by gcc -O3, another
by valgrind), due to checking 'nbd_reply_is_simple(reply) || s->quit'
in the wrong order. Rather than chasing down which callers need to
pre-initialize reply, it's easier to guarantee that reply will always
be set by nbd_co_receive_one_chunk() even on failure.

Reported-by: Thomas Huth <thuth@redhat.com>
Reported-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---

Replaces: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg04477.=
html
Replaces: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg03712.=
html

 block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/nbd.c b/block/nbd.c
index 8d565cc624ec..f751a8e633e5 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -640,6 +640,7 @@ static coroutine_fn int nbd_co_receive_one_chunk(
                                           request_ret, qiov, payload, er=
rp);

     if (ret < 0) {
+        memset(reply, 0, sizeof *reply);
         s->quit =3D true;
     } else {
         /* For assert at loop start in nbd_connection_entry */
--=20
2.20.1


