Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9DCB10B8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 16:09:25 +0200 (CEST)
Received: from localhost ([::1]:34892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Pml-0000kz-H6
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 10:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39294)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i8PQv-0002ys-V1
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:46:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i8PQu-0001VI-U8
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:46:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47994)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i8PQr-0001Ss-IS; Thu, 12 Sep 2019 09:46:45 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 82E9210DCC97;
 Thu, 12 Sep 2019 13:46:44 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-179.ams2.redhat.com
 [10.36.116.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E721C600C4;
 Thu, 12 Sep 2019 13:46:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 12 Sep 2019 15:45:55 +0200
Message-Id: <20190912134604.22019-14-kwolf@redhat.com>
In-Reply-To: <20190912134604.22019-1-kwolf@redhat.com>
References: <20190912134604.22019-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 12 Sep 2019 13:46:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 13/22] block/nfs: add support for nfs_umount
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

From: Peter Lieven <pl@kamp.de>

libnfs recently added support for unmounting. Add support
in Qemu too.

Signed-off-by: Peter Lieven <pl@kamp.de>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/nfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/nfs.c b/block/nfs.c
index 0ec50953e4..9d30963fd8 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -1,7 +1,7 @@
 /*
  * QEMU Block driver for native access to files on NFS shares
  *
- * Copyright (c) 2014-2017 Peter Lieven <pl@kamp.de>
+ * Copyright (c) 2014-2019 Peter Lieven <pl@kamp.de>
  *
  * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
  * of this software and associated documentation files (the "Software"),=
 to deal
@@ -394,6 +394,9 @@ static void nfs_client_close(NFSClient *client)
             nfs_close(client->context, client->fh);
             client->fh =3D NULL;
         }
+#ifdef LIBNFS_FEATURE_UMOUNT
+        nfs_umount(client->context);
+#endif
         aio_set_fd_handler(client->aio_context, nfs_get_fd(client->conte=
xt),
                            false, NULL, NULL, NULL, NULL);
         nfs_destroy_context(client->context);
--=20
2.20.1


