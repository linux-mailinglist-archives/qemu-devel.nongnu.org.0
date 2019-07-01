Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2D431AA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:31:08 +0200 (CEST)
Received: from localhost ([::1]:35520 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbBlr-0008Bu-DK
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45893)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBSX-00083b-7U
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:11:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBSV-0007wY-SH
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:11:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47212)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBSR-0007sv-Co; Wed, 12 Jun 2019 18:11:03 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 258DC307D93E;
 Wed, 12 Jun 2019 22:11:01 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27F1F60476;
 Wed, 12 Jun 2019 22:10:59 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:43 +0200
Message-Id: <20190612221004.2317-22-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 12 Jun 2019 22:11:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 21/42] block: Use CAFs for debug breakpoints
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

When looking for a blkdebug node (which implements debug breakpoints),
use bdrv_primary_bs() to iterate through the graph, because that is
where a blkdebug node would be.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 797bec0326..11b7ba8cf6 100644
--- a/block.c
+++ b/block.c
@@ -5097,7 +5097,7 @@ int bdrv_debug_breakpoint(BlockDriverState *bs, con=
st char *event,
                           const char *tag)
 {
     while (bs && bs->drv && !bs->drv->bdrv_debug_breakpoint) {
-        bs =3D bs->file ? bs->file->bs : NULL;
+        bs =3D bdrv_primary_bs(bs);
     }
=20
     if (bs && bs->drv && bs->drv->bdrv_debug_breakpoint) {
@@ -5110,7 +5110,7 @@ int bdrv_debug_breakpoint(BlockDriverState *bs, con=
st char *event,
 int bdrv_debug_remove_breakpoint(BlockDriverState *bs, const char *tag)
 {
     while (bs && bs->drv && !bs->drv->bdrv_debug_remove_breakpoint) {
-        bs =3D bs->file ? bs->file->bs : NULL;
+        bs =3D bdrv_primary_bs(bs);
     }
=20
     if (bs && bs->drv && bs->drv->bdrv_debug_remove_breakpoint) {
@@ -5123,7 +5123,7 @@ int bdrv_debug_remove_breakpoint(BlockDriverState *=
bs, const char *tag)
 int bdrv_debug_resume(BlockDriverState *bs, const char *tag)
 {
     while (bs && (!bs->drv || !bs->drv->bdrv_debug_resume)) {
-        bs =3D bs->file ? bs->file->bs : NULL;
+        bs =3D bdrv_primary_bs(bs);
     }
=20
     if (bs && bs->drv && bs->drv->bdrv_debug_resume) {
@@ -5136,7 +5136,7 @@ int bdrv_debug_resume(BlockDriverState *bs, const c=
har *tag)
 bool bdrv_debug_is_suspended(BlockDriverState *bs, const char *tag)
 {
     while (bs && bs->drv && !bs->drv->bdrv_debug_is_suspended) {
-        bs =3D bs->file ? bs->file->bs : NULL;
+        bs =3D bdrv_primary_bs(bs);
     }
=20
     if (bs && bs->drv && bs->drv->bdrv_debug_is_suspended) {
--=20
2.21.0


