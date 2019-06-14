Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB77460C8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 16:31:22 +0200 (CEST)
Received: from localhost ([::1]:52088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbnEf-0003Lb-TR
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 10:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47006)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbmSu-000285-Rl
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:42:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbmSt-0006fC-3R
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:42:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60680)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbmSf-0006ED-24; Fri, 14 Jun 2019 09:41:47 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A0FCD30BBE9C;
 Fri, 14 Jun 2019 13:41:10 +0000 (UTC)
Received: from localhost (unknown [10.40.205.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA7912D26D;
 Fri, 14 Jun 2019 13:41:08 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 14 Jun 2019 15:40:18 +0200
Message-Id: <20190614134021.32486-18-mreitz@redhat.com>
In-Reply-To: <20190614134021.32486-1-mreitz@redhat.com>
References: <20190614134021.32486-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 14 Jun 2019 13:41:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 17/20] blkdebug: Add "none" event
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

Together with @iotypes and @sector, this can be used to trap e.g. the
first read or write access to a certain sector without having to know
what happens internally in the block layer, i.e. which "real" events
happen right before such an access.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20190507203508.18026-5-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json | 4 +++-
 block/blkdebug.c     | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 34617a2c7a..60f903afa3 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3244,6 +3244,8 @@
 #
 # @cluster_alloc_space: an allocation of file space for a cluster (since=
 4.1)
 #
+# @none: triggers once at creation of the blkdebug node (since 4.1)
+#
 # Since: 2.9
 ##
 { 'enum': 'BlkdebugEvent', 'prefix': 'BLKDBG',
@@ -3262,7 +3264,7 @@
             'pwritev_rmw_tail', 'pwritev_rmw_after_tail', 'pwritev',
             'pwritev_zero', 'pwritev_done', 'empty_image_prepare',
             'l1_shrink_write_table', 'l1_shrink_free_l2_clusters',
-            'cor_write', 'cluster_alloc_space'] }
+            'cor_write', 'cluster_alloc_space', 'none'] }
=20
 ##
 # @BlkdebugIOType:
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 3f3ec11230..1663ed25af 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -491,6 +491,8 @@ static int blkdebug_open(BlockDriverState *bs, QDict =
*options, int flags,
         goto out;
     }
=20
+    bdrv_debug_event(bs, BLKDBG_NONE);
+
     ret =3D 0;
 out:
     if (ret < 0) {
--=20
2.21.0


