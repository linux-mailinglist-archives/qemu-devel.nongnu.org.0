Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F24DB962
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 23:58:04 +0200 (CEST)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLDmV-0000Uz-Ae
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 17:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60877)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iLDjS-0006mU-LP
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 17:54:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iLDjR-0002GQ-Dz
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 17:54:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38898)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iLDjO-0002DE-2s; Thu, 17 Oct 2019 17:54:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 519243090FED;
 Thu, 17 Oct 2019 21:54:49 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-173.bos.redhat.com [10.18.17.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEC985DE5B;
 Thu, 17 Oct 2019 21:54:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, jsnow@redhat.com,
 qemu-devel@nongnu.org
Subject: [PULL v3 01/19] util/hbitmap: strict hbitmap_reset
Date: Thu, 17 Oct 2019 17:54:18 -0400
Message-Id: <20191017215436.14252-2-jsnow@redhat.com>
In-Reply-To: <20191017215436.14252-1-jsnow@redhat.com>
References: <20191017215436.14252-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 17 Oct 2019 21:54:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

hbitmap_reset has an unobvious property: it rounds requested region up.
It may provoke bugs, like in recently fixed write-blocking mode of
mirror: user calls reset on unaligned region, not keeping in mind that
there are possible unrelated dirty bytes, covered by rounded-up region
and information of this unrelated "dirtiness" will be lost.

Make hbitmap_reset strict: assert that arguments are aligned, allowing
only one exception when @start + @count =3D=3D hb->orig_size. It's needed
to comfort users of hbitmap_next_dirty_area, which cares about
hb->orig_size.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20190806152611.280389-1-vsementsov@virtuozzo.com>
[Maintainer edit: Max's suggestions from on-list. --js]
[Maintainer edit: Eric's suggestion for aligned macro. --js]
Signed-off-by: John Snow <jsnow@redhat.com>
---
 include/qemu/hbitmap.h | 5 +++++
 tests/test-hbitmap.c   | 2 +-
 util/hbitmap.c         | 4 ++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index 4afbe6292e..1bf944ca3d 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -132,6 +132,11 @@ void hbitmap_set(HBitmap *hb, uint64_t start, uint64=
_t count);
  * @count: Number of bits to reset.
  *
  * Reset a consecutive range of bits in an HBitmap.
+ * @start and @count must be aligned to bitmap granularity. The only exc=
eption
+ * is resetting the tail of the bitmap: @count may be equal to hb->orig_=
size -
+ * @start, in this case @count may be not aligned. The sum of @start + @=
count is
+ * allowed to be greater than hb->orig_size, but only if @start < hb->or=
ig_size
+ * and @start + @count =3D ALIGN_UP(hb->orig_size, granularity).
  */
 void hbitmap_reset(HBitmap *hb, uint64_t start, uint64_t count);
=20
diff --git a/tests/test-hbitmap.c b/tests/test-hbitmap.c
index eed5d288cb..e1f867085f 100644
--- a/tests/test-hbitmap.c
+++ b/tests/test-hbitmap.c
@@ -423,7 +423,7 @@ static void test_hbitmap_granularity(TestHBitmapData =
*data,
     hbitmap_test_check(data, 0);
     hbitmap_test_set(data, 0, 3);
     g_assert_cmpint(hbitmap_count(data->hb), =3D=3D, 4);
-    hbitmap_test_reset(data, 0, 1);
+    hbitmap_test_reset(data, 0, 2);
     g_assert_cmpint(hbitmap_count(data->hb), =3D=3D, 2);
 }
=20
diff --git a/util/hbitmap.c b/util/hbitmap.c
index fd44c897ab..66db87c6ff 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -476,6 +476,10 @@ void hbitmap_reset(HBitmap *hb, uint64_t start, uint=
64_t count)
     /* Compute range in the last layer.  */
     uint64_t first;
     uint64_t last =3D start + count - 1;
+    uint64_t gran =3D 1ULL << hb->granularity;
+
+    assert(QEMU_IS_ALIGNED(start, gran));
+    assert(QEMU_IS_ALIGNED(count, gran) || (start + count =3D=3D hb->ori=
g_size));
=20
     trace_hbitmap_reset(hb, start, count,
                         start >> hb->granularity, last >> hb->granularit=
y);
--=20
2.21.0


