Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C72818AD
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 14:02:12 +0200 (CEST)
Received: from localhost ([::1]:53344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hubgp-0002ht-Ev
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 08:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40180)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hubgC-0002Dh-Um
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 08:01:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hubgB-0008PS-Fv
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 08:01:32 -0400
Received: from relay.sw.ru ([185.231.240.75]:50848)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hubg5-0008Iv-75; Mon, 05 Aug 2019 08:01:25 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hubg0-0006Fe-Nw; Mon, 05 Aug 2019 15:01:21 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Mon,  5 Aug 2019 15:01:20 +0300
Message-Id: <20190805120120.23585-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH for-4.1] util/hbitmap: update orig_size on
 truncate
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this, hbitmap_next_zero and hbitmap_next_dirty_area are broken
after truncate. So, orig_size is broken since it's introduction in
76d570dc495c56bb.

Fixes: 76d570dc495c56bb
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi!

Here is one more hbitmap bug I noticed. It's my fault, I'm sorry :(
Broken in 4.0, but if we are already going to fix in 4.1 some things
around it, it's a small meaningful addition.

Users of broken API are incremental backup, sync mirror (but it may not
be broken, if truncates not allowed during mirror, are they?), bitmap
export through NBD.

 util/hbitmap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/util/hbitmap.c b/util/hbitmap.c
index 7905212a8b..bcc0acdc6a 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -53,7 +53,9 @@
  */
 
 struct HBitmap {
-    /* Size of the bitmap, as requested in hbitmap_alloc. */
+    /*
+     * Size of the bitmap, as requested in hbitmap_alloc or in hbitmap_truncate.
+     */
     uint64_t orig_size;
 
     /* Number of total bits in the bottom level.  */
@@ -732,6 +734,8 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size)
     uint64_t num_elements = size;
     uint64_t old;
 
+    hb->orig_size = size;
+
     /* Size comes in as logical elements, adjust for granularity. */
     size = (size + (1ULL << hb->granularity) - 1) >> hb->granularity;
     assert(size <= ((uint64_t)1 << HBITMAP_LOG_MAX_SIZE));
-- 
2.18.0


