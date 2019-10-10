Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591D4D2913
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 14:15:38 +0200 (CEST)
Received: from localhost ([::1]:37000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIXM1-0007WI-3H
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 08:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51841)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iIWr5-0006cb-Jq
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:43:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iIWr3-0008Cu-Qu
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:43:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49946)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iIWqy-0008BE-7n; Thu, 10 Oct 2019 07:43:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6F8A619D369;
 Thu, 10 Oct 2019 11:43:31 +0000 (UTC)
Received: from localhost (unknown [10.36.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1355860A9F;
 Thu, 10 Oct 2019 11:43:30 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/36] block: teach bdrv_debug_breakpoint skip filters with
 backing
Date: Thu, 10 Oct 2019 13:42:37 +0200
Message-Id: <20191010114300.7746-14-mreitz@redhat.com>
In-Reply-To: <20191010114300.7746-1-mreitz@redhat.com>
References: <20191010114300.7746-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 10 Oct 2019 11:43:31 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Teach bdrv_debug_breakpoint and bdrv_debug_remove_breakpoint skip
filters with backing. This is needed to implement and use in backup job
it's own backup_top filter driver (like mirror already has one), and
without this improvement, breakpoint removal will fail at least in 55
iotest.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190920142056.12778-9-vsementsov@virtuozzo.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/block.c b/block.c
index 5944124845..1c7c199849 100644
--- a/block.c
+++ b/block.c
@@ -5164,14 +5164,35 @@ void bdrv_debug_event(BlockDriverState *bs, Blkde=
bugEvent event)
     bs->drv->bdrv_debug_event(bs, event);
 }
=20
-int bdrv_debug_breakpoint(BlockDriverState *bs, const char *event,
-                          const char *tag)
+static BlockDriverState *bdrv_find_debug_node(BlockDriverState *bs)
 {
     while (bs && bs->drv && !bs->drv->bdrv_debug_breakpoint) {
-        bs =3D bs->file ? bs->file->bs : NULL;
+        if (bs->file) {
+            bs =3D bs->file->bs;
+            continue;
+        }
+
+        if (bs->drv->is_filter && bs->backing) {
+            bs =3D bs->backing->bs;
+            continue;
+        }
+
+        break;
     }
=20
     if (bs && bs->drv && bs->drv->bdrv_debug_breakpoint) {
+        assert(bs->drv->bdrv_debug_remove_breakpoint);
+        return bs;
+    }
+
+    return NULL;
+}
+
+int bdrv_debug_breakpoint(BlockDriverState *bs, const char *event,
+                          const char *tag)
+{
+    bs =3D bdrv_find_debug_node(bs);
+    if (bs) {
         return bs->drv->bdrv_debug_breakpoint(bs, event, tag);
     }
=20
@@ -5180,11 +5201,8 @@ int bdrv_debug_breakpoint(BlockDriverState *bs, co=
nst char *event,
=20
 int bdrv_debug_remove_breakpoint(BlockDriverState *bs, const char *tag)
 {
-    while (bs && bs->drv && !bs->drv->bdrv_debug_remove_breakpoint) {
-        bs =3D bs->file ? bs->file->bs : NULL;
-    }
-
-    if (bs && bs->drv && bs->drv->bdrv_debug_remove_breakpoint) {
+    bs =3D bdrv_find_debug_node(bs);
+    if (bs) {
         return bs->drv->bdrv_debug_remove_breakpoint(bs, tag);
     }
=20
--=20
2.21.0


