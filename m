Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351316C5A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 22:40:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hO6tI-0001Vl-Ob
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 16:40:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hO6oS-0005KJ-1U
	for qemu-devel@nongnu.org; Tue, 07 May 2019 16:35:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hO6oP-0003zt-P0
	for qemu-devel@nongnu.org; Tue, 07 May 2019 16:35:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34972)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hO6oK-0003h9-V1; Tue, 07 May 2019 16:35:37 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16E075277B;
	Tue,  7 May 2019 20:35:25 +0000 (UTC)
Received: from localhost (unknown [10.40.205.217])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80D7D5C6CE;
	Tue,  7 May 2019 20:35:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue,  7 May 2019 22:35:06 +0200
Message-Id: <20190507203508.18026-6-mreitz@redhat.com>
In-Reply-To: <20190507203508.18026-1-mreitz@redhat.com>
References: <20190507203508.18026-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 07 May 2019 20:35:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 5/7] blkdebug: Inject errors on
 .bdrv_co_block_status()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json | 5 ++++-
 block/blkdebug.c     | 8 ++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 54c927f1ad..028e4d6e02 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3252,10 +3252,13 @@
 #
 # @flush: .bdrv_co_flush_to_disk()
 #
+# @block-status: .bdrv_co_block_status()
+#
 # Since: 4.1
 ##
 { 'enum': 'BlkdebugIOType', 'prefix': 'BLKDEBUG_IO_TYPE',
-  'data': [ 'read', 'write', 'write-zeroes', 'discard', 'flush' ] }
+  'data': [ 'read', 'write', 'write-zeroes', 'discard', 'flush',
+            'block-status' ] }
=20
 ##
 # @BlkdebugInjectErrorOptions:
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 1663ed25af..5ae96c52b0 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -670,7 +670,15 @@ static int coroutine_fn blkdebug_co_block_status(Blo=
ckDriverState *bs,
                                                  int64_t *map,
                                                  BlockDriverState **file=
)
 {
+    int err;
+
     assert(QEMU_IS_ALIGNED(offset | bytes, bs->bl.request_alignment));
+
+    err =3D rule_check(bs, offset, bytes, BLKDEBUG_IO_TYPE_BLOCK_STATUS)=
;
+    if (err) {
+        return err;
+    }
+
     return bdrv_co_block_status_from_file(bs, want_zero, offset, bytes,
                                           pnum, map, file);
 }
--=20
2.20.1


