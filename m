Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28A687FB6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 18:21:50 +0200 (CEST)
Received: from localhost ([::1]:60930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw7eH-0008Uv-V9
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 12:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57327)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hw7Xj-0002P6-Q5
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 12:15:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hw7Xi-0004JR-Oj
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 12:15:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44832)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hw7Xg-0004I5-Hk; Fri, 09 Aug 2019 12:15:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D62ED30BE7DB;
 Fri,  9 Aug 2019 16:14:59 +0000 (UTC)
Received: from localhost (unknown [10.40.205.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D58C600CD;
 Fri,  9 Aug 2019 16:14:59 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri,  9 Aug 2019 18:13:47 +0200
Message-Id: <20190809161407.11920-23-mreitz@redhat.com>
In-Reply-To: <20190809161407.11920-1-mreitz@redhat.com>
References: <20190809161407.11920-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 09 Aug 2019 16:14:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 22/42] block: Fix
 bdrv_get_allocated_file_size's fallback
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the driver does not implement bdrv_get_allocated_file_size(), we
should fall back to cumulating the allocated size of all non-COW
children instead of just bs->file.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 1070aa1ba9..6e1ddab056 100644
--- a/block.c
+++ b/block.c
@@ -4650,9 +4650,27 @@ int64_t bdrv_get_allocated_file_size(BlockDriverSt=
ate *bs)
     if (drv->bdrv_get_allocated_file_size) {
         return drv->bdrv_get_allocated_file_size(bs);
     }
-    if (bs->file) {
-        return bdrv_get_allocated_file_size(bs->file->bs);
+
+    if (!QLIST_EMPTY(&bs->children)) {
+        BdrvChild *child;
+        int64_t child_size, total_size =3D 0;
+
+        QLIST_FOREACH(child, &bs->children, next) {
+            if (child =3D=3D bdrv_filtered_cow_child(bs)) {
+                /* Ignore COW backing files */
+                continue;
+            }
+
+            child_size =3D bdrv_get_allocated_file_size(child->bs);
+            if (child_size < 0) {
+                return child_size;
+            }
+            total_size +=3D child_size;
+        }
+
+        return total_size;
     }
+
     return -ENOTSUP;
 }
=20
--=20
2.21.0


