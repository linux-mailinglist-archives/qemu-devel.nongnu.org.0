Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E6B125E7F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 11:06:16 +0100 (CET)
Received: from localhost ([::1]:38088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihshC-000500-Qt
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 05:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39085)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ihsf4-0002g0-DN
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:04:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ihsf2-0007vx-Rl
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:04:02 -0500
Received: from relay.sw.ru ([185.231.240.75]:57604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ihsev-0007Y7-Jf; Thu, 19 Dec 2019 05:03:53 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ihser-0004j2-Ef; Thu, 19 Dec 2019 13:03:49 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 01/10] hbitmap: assert that we don't create bitmap larger
 than INT64_MAX
Date: Thu, 19 Dec 2019 13:03:39 +0300
Message-Id: <20191219100348.24827-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219100348.24827-1-vsementsov@virtuozzo.com>
References: <20191219100348.24827-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have APIs which returns signed int64_t, to be able to return error.
Therefore we can't handle bitmaps with absolute size larger than
(INT64_MAX+1). Still, keep maximum to be INT64_MAX which is a bit
safer.

Note, that bitmaps are used to represent disk images, which can't
exceed INT64_MAX anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 util/hbitmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/util/hbitmap.c b/util/hbitmap.c
index 242c6e519c..7f9b3e0cd7 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -716,6 +716,7 @@ HBitmap *hbitmap_alloc(uint64_t size, int granularity)
     HBitmap *hb = g_new0(struct HBitmap, 1);
     unsigned i;
 
+    assert(size <= INT64_MAX);
     hb->orig_size = size;
 
     assert(granularity >= 0 && granularity < 64);
@@ -746,6 +747,7 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size)
     uint64_t num_elements = size;
     uint64_t old;
 
+    assert(size <= INT64_MAX);
     hb->orig_size = size;
 
     /* Size comes in as logical elements, adjust for granularity. */
-- 
2.21.0


