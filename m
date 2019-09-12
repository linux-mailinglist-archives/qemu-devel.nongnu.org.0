Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7DDB1091
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 16:02:24 +0200 (CEST)
Received: from localhost ([::1]:34816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Pfy-0000yi-Km
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 10:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i8PQf-0002hH-Cv
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:46:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i8PQe-0001Ll-9p
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:46:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60510)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i8PQc-0001K1-5G; Thu, 12 Sep 2019 09:46:30 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6DD51300B912;
 Thu, 12 Sep 2019 13:46:29 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-179.ams2.redhat.com
 [10.36.116.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F781600C4;
 Thu, 12 Sep 2019 13:46:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 12 Sep 2019 15:45:49 +0200
Message-Id: <20190912134604.22019-8-kwolf@redhat.com>
In-Reply-To: <20190912134604.22019-1-kwolf@redhat.com>
References: <20190912134604.22019-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 12 Sep 2019 13:46:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 07/22] vpc: Return 0 from vpc_co_create() on
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

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
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.20.1


