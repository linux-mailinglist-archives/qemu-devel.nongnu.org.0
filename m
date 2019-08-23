Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1149B6A2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 21:07:10 +0200 (CEST)
Received: from localhost ([::1]:33066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1Etw-0006tr-BU
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 15:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i1EbD-0004c2-Ca
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:47:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i1EbC-0006bu-Au
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:47:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63410)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i1EbA-0006Wp-5z; Fri, 23 Aug 2019 14:47:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7DE265FD41;
 Fri, 23 Aug 2019 18:47:42 +0000 (UTC)
Received: from localhost (ovpn-204-96.brq.redhat.com [10.40.204.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2F4519C4F;
 Fri, 23 Aug 2019 18:47:39 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 23 Aug 2019 20:47:32 +0200
Message-Id: <20190823184733.18929-2-mreitz@redhat.com>
In-Reply-To: <20190823184733.18929-1-mreitz@redhat.com>
References: <20190823184733.18929-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 23 Aug 2019 18:47:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/2] block: Let blockdev-create return 0 on
 success
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Block drivers should let their .bdrv_co_create() implementation return a
non-negative value to indicate success.  However, jobs should return
exactly 0.  Thus, we need to translate positive return values to 0 in
blockdev_create_run().

Cc: qemu-stable@nongnu.org
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/create.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/create.c b/block/create.c
index 1bd00ed5f8..4b23672e1b 100644
--- a/block/create.c
+++ b/block/create.c
@@ -48,7 +48,8 @@ static int coroutine_fn blockdev_create_run(Job *job, E=
rror **errp)
=20
     qapi_free_BlockdevCreateOptions(s->opts);
=20
-    return ret;
+    /* Jobs must return 0 to indicate success */
+    return ret < 0 ? ret : 0;
 }
=20
 static const JobDriver blockdev_create_job_driver =3D {
--=20
2.21.0


