Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7A32CFC5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 21:50:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVi6i-00082B-MQ
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 15:50:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hVhpN-0002bR-A1
	for qemu-devel@nongnu.org; Tue, 28 May 2019 15:32:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hVhpM-0002sv-3b
	for qemu-devel@nongnu.org; Tue, 28 May 2019 15:32:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23536)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hVhpH-00018f-5d; Tue, 28 May 2019 15:31:59 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4ECB81E05;
	Tue, 28 May 2019 19:29:48 +0000 (UTC)
Received: from localhost (unknown [10.40.205.223])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BE9F5D71A;
	Tue, 28 May 2019 19:29:48 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 28 May 2019 21:28:46 +0200
Message-Id: <20190528192847.2730-21-mreitz@redhat.com>
In-Reply-To: <20190528192847.2730-1-mreitz@redhat.com>
References: <20190528192847.2730-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 28 May 2019 19:29:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 20/21] qcow2-bitmap: initialize bitmap directory
 alignment
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Valgrind detects multiple issues in QEMU iotests when the memory is
used without being initialized. Valgrind may dump lots of unnecessary
reports what makes the memory issue analysis harder. Particularly,
that is true for the aligned bitmap directory and can be seen while
running the iotest #169. Padding the aligned space with zeros eases
the pain.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Message-id: 1558961521-131620-1-git-send-email-andrey.shinkevich@virtuozz=
o.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 640da68ce1..b2487101ed 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -753,7 +753,7 @@ static int bitmap_list_store(BlockDriverState *bs, Qc=
ow2BitmapList *bm_list,
         dir_offset =3D *offset;
     }
=20
-    dir =3D g_try_malloc(dir_size);
+    dir =3D g_try_malloc0(dir_size);
     if (dir =3D=3D NULL) {
         return -ENOMEM;
     }
--=20
2.21.0


