Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F88431B1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:38:42 +0200 (CEST)
Received: from localhost ([::1]:35566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbBtB-000603-Kw
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45475)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBS4-0007Ss-6i
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBS3-0007eQ-0b
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32832)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBS0-0007T7-65; Wed, 12 Jun 2019 18:10:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 156303082126;
 Wed, 12 Jun 2019 22:10:25 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9937E64036;
 Wed, 12 Jun 2019 22:10:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:29 +0200
Message-Id: <20190612221004.2317-8-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 12 Jun 2019 22:10:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 07/42] block: *filtered_cow_child() for
 *has_zero_init()
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

bdrv_has_zero_init() and the related bdrv_unallocated_blocks_are_zero()
should use bdrv_filtered_cow_child() if they want to check whether the
given BDS has a COW backing file.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index be18130944..64d6190984 100644
--- a/block.c
+++ b/block.c
@@ -4933,7 +4933,7 @@ int bdrv_has_zero_init(BlockDriverState *bs)
=20
     /* If BS is a copy on write image, it is initialized to
        the contents of the base image, which may not be zeroes.  */
-    if (bs->backing) {
+    if (bdrv_filtered_cow_child(bs)) {
         return 0;
     }
     if (bs->drv->bdrv_has_zero_init) {
@@ -4951,7 +4951,7 @@ bool bdrv_unallocated_blocks_are_zero(BlockDriverSt=
ate *bs)
 {
     BlockDriverInfo bdi;
=20
-    if (bs->backing) {
+    if (bdrv_filtered_cow_child(bs)) {
         return false;
     }
=20
--=20
2.21.0


