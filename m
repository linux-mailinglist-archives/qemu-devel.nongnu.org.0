Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81280431A0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:24:29 +0200 (CEST)
Received: from localhost ([::1]:35472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbBfQ-0000f8-Mm
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45476)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBS4-0007Sv-98
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBS2-0007eF-Pv
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45454)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBS0-0007YS-3K; Wed, 12 Jun 2019 18:10:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A5B2C81E0E;
 Wed, 12 Jun 2019 22:10:32 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32FC7608A6;
 Wed, 12 Jun 2019 22:10:32 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:32 +0200
Message-Id: <20190612221004.2317-11-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 12 Jun 2019 22:10:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 10/42] block: Use CAF in bdrv_is_encrypted()
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

bdrv_is_encrypted() should not only check the BDS's backing child, but
any filtered child: If a filter's child is encrypted, the filter node
itself naturally is encrypted, too.  Furthermore, we need to recurse
down the chain.

(CAF means child access function.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 45882a3470..567a0f82c8 100644
--- a/block.c
+++ b/block.c
@@ -4574,10 +4574,14 @@ bool bdrv_is_sg(BlockDriverState *bs)
=20
 bool bdrv_is_encrypted(BlockDriverState *bs)
 {
-    if (bs->backing && bs->backing->bs->encrypted) {
+    BlockDriverState *filtered =3D bdrv_filtered_bs(bs);
+    if (bs->encrypted) {
         return true;
     }
-    return bs->encrypted;
+    if (filtered && bdrv_is_encrypted(filtered)) {
+        return true;
+    }
+    return false;
 }
=20
 const char *bdrv_get_format_name(BlockDriverState *bs)
--=20
2.21.0


