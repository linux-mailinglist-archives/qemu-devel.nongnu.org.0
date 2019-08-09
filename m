Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEE787FC6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 18:24:05 +0200 (CEST)
Received: from localhost ([::1]:60968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw7gS-00058s-HE
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 12:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57599)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hw7Y8-0003lC-35
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 12:15:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hw7Y7-0004bq-62
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 12:15:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60493)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hw7Y5-0004af-3O; Fri, 09 Aug 2019 12:15:25 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6E27F3081CFE;
 Fri,  9 Aug 2019 16:15:24 +0000 (UTC)
Received: from localhost (unknown [10.40.205.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 092637E4E;
 Fri,  9 Aug 2019 16:15:23 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri,  9 Aug 2019 18:13:56 +0200
Message-Id: <20190809161407.11920-32-mreitz@redhat.com>
In-Reply-To: <20190809161407.11920-1-mreitz@redhat.com>
References: <20190809161407.11920-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 09 Aug 2019 16:15:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 31/42] block: Drop backing_bs()
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

We want to make it explicit where bs->backing is used, and we have done
so.  The old role of backing_bs() is now effectively taken by
bdrv_filtered_cow_bs().

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 5bec3361fd..786801c32f 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -932,11 +932,6 @@ typedef enum BlockMirrorBackingMode {
     MIRROR_LEAVE_BACKING_CHAIN,
 } BlockMirrorBackingMode;
=20
-static inline BlockDriverState *backing_bs(BlockDriverState *bs)
-{
-    return bs->backing ? bs->backing->bs : NULL;
-}
-
=20
 /* Essential block drivers which must always be statically linked into q=
emu, and
  * which therefore can be accessed without using bdrv_find_format() */
--=20
2.21.0


