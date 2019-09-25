Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D173BE3B7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 19:48:16 +0200 (CEST)
Received: from localhost ([::1]:55504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDBOh-0004yC-9T
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 13:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iDBKt-0002jC-4F
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 13:44:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iDBKs-000330-7Q
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 13:44:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50246)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1iDBKq-000319-73; Wed, 25 Sep 2019 13:44:16 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 41F08210A;
 Wed, 25 Sep 2019 17:44:15 +0000 (UTC)
Received: from localhost (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7443B61F24;
 Wed, 25 Sep 2019 17:44:08 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] util/ioc.c: try to reassure Coverity about
 qemu_iovec_init_extended
Date: Wed, 25 Sep 2019 18:43:59 +0100
Message-Id: <20190925174400.8578-2-stefanha@redhat.com>
In-Reply-To: <20190925174400.8578-1-stefanha@redhat.com>
References: <20190925174400.8578-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 25 Sep 2019 17:44:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Make it more obvious, that filling qiov corresponds to qiov allocation,
which in turn corresponds to total_niov calculation, based on mid_niov
(not mid_len). Still add an assertion to show that there should be no
difference.

Reported-by: Coverity (CID 1405302)
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20190910090310.14032-1-vsementsov@virtuozzo.com
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20190910090310.14032-1-vsementsov@virtuozzo.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/iov.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/iov.c b/util/iov.c
index 5059e10431..a4689ff3c9 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -446,7 +446,8 @@ void qemu_iovec_init_extended(
         p++;
     }
=20
-    if (mid_len) {
+    assert(!mid_niov =3D=3D !mid_len);
+    if (mid_niov) {
         memcpy(p, mid_iov, mid_niov * sizeof(*p));
         p[0].iov_base =3D (uint8_t *)p[0].iov_base + mid_head;
         p[0].iov_len -=3D mid_head;
--=20
2.21.0


