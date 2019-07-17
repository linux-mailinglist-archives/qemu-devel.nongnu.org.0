Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324C16C083
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 19:40:04 +0200 (CEST)
Received: from localhost ([::1]:59358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnnuM-0001Nn-W8
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 13:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hnnu9-0000yW-Qz
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 13:39:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hnnu8-0000Tp-HH
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 13:39:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51428)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hnnu6-0000Sh-1c; Wed, 17 Jul 2019 13:39:46 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 59F74C024AF6;
 Wed, 17 Jul 2019 17:39:45 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-203.bos.redhat.com [10.18.17.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB77D19C68;
 Wed, 17 Jul 2019 17:39:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed, 17 Jul 2019 13:39:37 -0400
Message-Id: <20190717173937.18747-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 17 Jul 2019 17:39:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3] qapi: add dirty-bitmaps to
 query-named-block-nodes result
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 libvir-list@redhat.com, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Let's add a possibility to query dirty-bitmaps not only on root nodes.
It is useful when dealing both with snapshots and incremental backups.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
[Added deprecation information. --js]
Signed-off-by: John Snow <jsnow@redhat.com>
---
 block/qapi.c         |  5 +++++
 qapi/block-core.json |  6 +++++-
 qemu-deprecated.texi | 12 ++++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/block/qapi.c b/block/qapi.c
index 917435f022..15f1030264 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -79,6 +79,11 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *=
blk,
         info->backing_file =3D g_strdup(bs->backing_file);
     }
=20
+    if (!QLIST_EMPTY(&bs->dirty_bitmaps)) {
+        info->has_dirty_bitmaps =3D true;
+        info->dirty_bitmaps =3D bdrv_query_dirty_bitmaps(bs);
+    }
+
     info->detect_zeroes =3D bs->detect_zeroes;
=20
     if (blk && blk_get_public(blk)->throttle_group_member.throttle_state=
) {
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 0d43d4f37c..9210ae233d 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -360,6 +360,9 @@
 # @write_threshold: configured write threshold for the device.
 #                   0 if disabled. (Since 2.3)
 #
+# @dirty-bitmaps: dirty bitmaps information (only present if node
+#                 has one or more dirty bitmaps) (Since 4.2)
+#
 # Since: 0.14.0
 #
 ##
@@ -378,7 +381,7 @@
             '*bps_wr_max_length': 'int', '*iops_max_length': 'int',
             '*iops_rd_max_length': 'int', '*iops_wr_max_length': 'int',
             '*iops_size': 'int', '*group': 'str', 'cache': 'BlockdevCach=
eInfo',
-            'write_threshold': 'int' } }
+            'write_threshold': 'int', '*dirty-bitmaps': ['BlockDirtyInfo=
'] } }
=20
 ##
 # @BlockDeviceIoStatus:
@@ -656,6 +659,7 @@
 #
 # @dirty-bitmaps: dirty bitmaps information (only present if the
 #                 driver has one or more dirty bitmaps) (Since 2.0)
+#                 Deprecated in 4.2; see BlockDirtyInfo instead.
 #
 # @io-status: @BlockDeviceIoStatus. Only present if the device
 #             supports it and the VM is configured to stop on errors
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index c90b08d553..6374b66546 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -134,6 +134,18 @@ The ``status'' field of the ``BlockDirtyInfo'' struc=
ture, returned by
 the query-block command is deprecated. Two new boolean fields,
 ``recording'' and ``busy'' effectively replace it.
=20
+@subsection query-block result field dirty-bitmaps (Since 4.2)
+
+The ``dirty-bitmaps`` field of the ``BlockInfo`` structure, returned by
+the query-block command is itself now deprecated. The ``dirty-bitmaps``
+field of the ``BlockDeviceInfo`` struct should be used instead, which is=
 the
+type of the ``inserted`` field in query-block replies, as well as the
+type of array items in query-named-block-nodes.
+
+Since the ``dirty-bitmaps`` field is optionally present in both the old =
and
+new locations, clients must use introspection to learn where to anticipa=
te
+the field if/when it does appear in command output.
+
 @subsection query-cpus (since 2.12.0)
=20
 The ``query-cpus'' command is replaced by the ``query-cpus-fast'' comman=
d.
--=20
2.21.0


