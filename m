Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A648AA5CC2
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 21:36:52 +0200 (CEST)
Received: from localhost ([::1]:39518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4s8B-00062K-5Y
	for lists+qemu-devel@lfdr.de; Mon, 02 Sep 2019 15:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51188)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i4s4z-00045K-5P
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 15:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i4s4y-0006wP-7s
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 15:33:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54016)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i4s4w-0006ua-4n; Mon, 02 Sep 2019 15:33:30 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7A08E30001EB;
 Mon,  2 Sep 2019 19:33:29 +0000 (UTC)
Received: from localhost (ovpn-204-221.brq.redhat.com [10.40.204.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7C3E10018F9;
 Mon,  2 Sep 2019 19:33:26 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon,  2 Sep 2019 21:33:16 +0200
Message-Id: <20190902193320.32233-2-mreitz@redhat.com>
In-Reply-To: <20190902193320.32233-1-mreitz@redhat.com>
References: <20190902193320.32233-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 02 Sep 2019 19:33:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 1/5] vpc: Return 0 from vpc_co_create() on
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-stable@nongnu.org,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

blockdev_create_run() directly uses .bdrv_co_create()'s return value as
the job's return value.  Jobs must return 0 on success, not just any
nonnegative value.  Therefore, using blockdev-create for VPC images may
currently fail as the vpc driver may return a positive integer.

Because there is no point in returning a positive integer anywhere in
the block layer (all non-negative integers are generally treated as
complete success), we probably do not want to add more such cases.
Therefore, fix this problem by making the vpc driver always return 0 in
case of success.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/vpc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/vpc.c b/block/vpc.c
index b25aab0425..5cd3890780 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -885,6 +885,7 @@ static int create_dynamic_disk(BlockBackend *blk, uin=
t8_t *buf,
         goto fail;
     }
=20
+    ret =3D 0;
  fail:
     return ret;
 }
@@ -908,7 +909,7 @@ static int create_fixed_disk(BlockBackend *blk, uint8=
_t *buf,
         return ret;
     }
=20
-    return ret;
+    return 0;
 }
=20
 static int calculate_rounded_image_size(BlockdevCreateOptionsVpc *vpc_op=
ts,
--=20
2.21.0


