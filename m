Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7995EF10
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 00:15:01 +0200 (CEST)
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hinWm-0002DW-EG
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 18:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46152)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hinEp-0005bH-Sv
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:56:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hinEo-00042b-Th
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:56:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35538)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hinEl-0003yB-Pf; Wed, 03 Jul 2019 17:56:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 43FE53084242;
 Wed,  3 Jul 2019 21:56:21 +0000 (UTC)
Received: from probe.redhat.com (ovpn-123-117.rdu2.redhat.com [10.10.123.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15D195235E;
 Wed,  3 Jul 2019 21:56:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 17:55:31 -0400
Message-Id: <20190703215542.16123-8-jsnow@redhat.com>
In-Reply-To: <20190703215542.16123-1-jsnow@redhat.com>
References: <20190703215542.16123-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 03 Jul 2019 21:56:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 07/18] hbitmap: Fix merge when b is empty,
 and result is not an alias of a
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 vsementsov@virtuozzo.com, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nobody calls the function like this currently, but we neither prohibit
or cope with this behavior. I decided to make the function cope with it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 util/hbitmap.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/util/hbitmap.c b/util/hbitmap.c
index 7905212a8b..3b6acae42b 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -781,8 +781,9 @@ bool hbitmap_can_merge(const HBitmap *a, const HBitma=
p *b)
 }
=20
 /**
- * Given HBitmaps A and B, let A :=3D A (BITOR) B.
- * Bitmap B will not be modified.
+ * Given HBitmaps A and B, let R :=3D A (BITOR) B.
+ * Bitmaps A and B will not be modified,
+ *     except when bitmap R is an alias of A or B.
  *
  * @return true if the merge was successful,
  *         false if it was not attempted.
@@ -797,7 +798,13 @@ bool hbitmap_merge(const HBitmap *a, const HBitmap *=
b, HBitmap *result)
     }
     assert(hbitmap_can_merge(b, result));
=20
-    if (hbitmap_count(b) =3D=3D 0) {
+    if ((!hbitmap_count(a) && result =3D=3D b) ||
+        (!hbitmap_count(b) && result =3D=3D a)) {
+        return true;
+    }
+
+    if (!hbitmap_count(a) && !hbitmap_count(b)) {
+        hbitmap_reset_all(result);
         return true;
     }
=20
--=20
2.21.0


