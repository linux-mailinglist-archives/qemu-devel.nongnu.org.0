Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E641562068
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 16:23:46 +0200 (CEST)
Received: from localhost ([::1]:42158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkUYU-0006aX-50
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 10:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39912)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hkUTc-0001qK-TR
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 10:18:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hkUTb-0008VA-OW
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 10:18:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47568)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hkUTY-0008LM-Be; Mon, 08 Jul 2019 10:18:40 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A1B902E95BE;
 Mon,  8 Jul 2019 14:18:34 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-204.ams2.redhat.com
 [10.36.116.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 143B751DFA;
 Mon,  8 Jul 2019 14:18:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon,  8 Jul 2019 16:18:10 +0200
Message-Id: <20190708141812.3974-5-kwolf@redhat.com>
In-Reply-To: <20190708141812.3974-1-kwolf@redhat.com>
References: <20190708141812.3974-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Mon, 08 Jul 2019 14:18:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/6] block/qcow: Improve error when opening
 qcow2 files as qcow
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

From: John Snow <jsnow@redhat.com>

Reported-by: radmehrsaeed7@gmail.com
Fixes: https://bugs.launchpad.net/bugs/1832914
Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/block/qcow.c b/block/qcow.c
index 6dee5bb792..5bdf72ba33 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -156,7 +156,12 @@ static int qcow_open(BlockDriverState *bs, QDict *op=
tions, int flags,
         goto fail;
     }
     if (header.version !=3D QCOW_VERSION) {
-        error_setg(errp, "Unsupported qcow version %" PRIu32, header.ver=
sion);
+        error_setg(errp, "qcow (v%d) does not support qcow version %" PR=
Iu32,
+                   QCOW_VERSION, header.version);
+        if (header.version =3D=3D 2 || header.version =3D=3D 3) {
+            error_append_hint(errp, "Try the 'qcow2' driver instead.\n")=
;
+        }
+
         ret =3D -ENOTSUP;
         goto fail;
     }
--=20
2.20.1


