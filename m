Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3FB107B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 15:56:16 +0200 (CEST)
Received: from localhost ([::1]:34750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Pa2-0004NA-Jg
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 09:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39092)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i8PQd-0002fI-QL
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:46:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i8PQc-0001Kr-Sj
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:46:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45478)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i8PQa-0001J4-K6; Thu, 12 Sep 2019 09:46:28 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C84A081DE0;
 Thu, 12 Sep 2019 13:46:27 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-179.ams2.redhat.com
 [10.36.116.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F722601B6;
 Thu, 12 Sep 2019 13:46:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 12 Sep 2019 15:45:48 +0200
Message-Id: <20190912134604.22019-7-kwolf@redhat.com>
In-Reply-To: <20190912134604.22019-1-kwolf@redhat.com>
References: <20190912134604.22019-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 12 Sep 2019 13:46:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 06/22] file-posix: Fix has_write_zeroes after
 NO_FALLBACK
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If QEMU_AIO_NO_FALLBACK is given, we always return failure and don't
even try to use the BLKZEROOUT ioctl. In this failure case, we shouldn't
disable has_write_zeroes because we didn't learn anything about the
ioctl. The next request might not set QEMU_AIO_NO_FALLBACK and we can
still use the ioctl then.

Fixes: 738301e1175
Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/file-posix.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index f683a36c8a..f12c06de2d 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1502,12 +1502,12 @@ static ssize_t handle_aiocb_write_zeroes_block(Ra=
wPosixAIOData *aiocb)
         } while (errno =3D=3D EINTR);
=20
         ret =3D translate_err(-errno);
+        if (ret =3D=3D -ENOTSUP) {
+            s->has_write_zeroes =3D false;
+        }
     }
 #endif
=20
-    if (ret =3D=3D -ENOTSUP) {
-        s->has_write_zeroes =3D false;
-    }
     return ret;
 }
=20
--=20
2.20.1


