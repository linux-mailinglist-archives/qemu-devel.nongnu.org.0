Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB86346086
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 16:21:46 +0200 (CEST)
Received: from localhost ([::1]:51988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbn5O-0002z4-1q
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 10:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46711)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbmS3-0001wL-Mo
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:41:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbmS2-0006AA-8l
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:41:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57080)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbmRw-00064u-5k; Fri, 14 Jun 2019 09:41:00 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 61E3E81DFE;
 Fri, 14 Jun 2019 13:40:59 +0000 (UTC)
Received: from localhost (unknown [10.40.205.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B52217983;
 Fri, 14 Jun 2019 13:40:57 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 14 Jun 2019 15:40:14 +0200
Message-Id: <20190614134021.32486-14-mreitz@redhat.com>
In-Reply-To: <20190614134021.32486-1-mreitz@redhat.com>
References: <20190614134021.32486-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 14 Jun 2019 13:40:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 13/20] blockdev: Overlays are not snapshots
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

There are error messages which refer to an overlay node as the snapshot.
That is wrong, those are two different things.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20190603202236.1342-3-mreitz@redhat.com
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 blockdev.c                 | 10 +++++-----
 tests/qemu-iotests/085.out | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index fdafa173cc..b5c0fd3c49 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1608,13 +1608,13 @@ static void external_snapshot_prepare(BlkActionSt=
ate *common,
             s->has_snapshot_node_name ? s->snapshot_node_name : NULL;
=20
         if (node_name && !snapshot_node_name) {
-            error_setg(errp, "New snapshot node name missing");
+            error_setg(errp, "New overlay node name missing");
             goto out;
         }
=20
         if (snapshot_node_name &&
             bdrv_lookup_bs(snapshot_node_name, snapshot_node_name, NULL)=
) {
-            error_setg(errp, "New snapshot node name already in use");
+            error_setg(errp, "New overlay node name already in use");
             goto out;
         }
=20
@@ -1656,7 +1656,7 @@ static void external_snapshot_prepare(BlkActionStat=
e *common,
     }
=20
     if (bdrv_has_blk(state->new_bs)) {
-        error_setg(errp, "The snapshot is already in use");
+        error_setg(errp, "The overlay is already in use");
         goto out;
     }
=20
@@ -1666,12 +1666,12 @@ static void external_snapshot_prepare(BlkActionSt=
ate *common,
     }
=20
     if (state->new_bs->backing !=3D NULL) {
-        error_setg(errp, "The snapshot already has a backing image");
+        error_setg(errp, "The overlay already has a backing image");
         goto out;
     }
=20
     if (!state->new_bs->drv->supports_backing) {
-        error_setg(errp, "The snapshot does not support backing images")=
;
+        error_setg(errp, "The overlay does not support backing images");
         goto out;
     }
=20
diff --git a/tests/qemu-iotests/085.out b/tests/qemu-iotests/085.out
index 6edf107f55..2a5f256cd3 100644
--- a/tests/qemu-iotests/085.out
+++ b/tests/qemu-iotests/085.out
@@ -64,13 +64,13 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1=
34217728 backing_file=3DTEST_DIR/
=20
 =3D=3D=3D Invalid command - cannot create a snapshot using a file BDS =3D=
=3D=3D
=20
-{"error": {"class": "GenericError", "desc": "The snapshot does not suppo=
rt backing images"}}
+{"error": {"class": "GenericError", "desc": "The overlay does not suppor=
t backing images"}}
=20
 =3D=3D=3D Invalid command - snapshot node used as active layer =3D=3D=3D
=20
-{"error": {"class": "GenericError", "desc": "The snapshot is already in =
use"}}
-{"error": {"class": "GenericError", "desc": "The snapshot is already in =
use"}}
-{"error": {"class": "GenericError", "desc": "The snapshot is already in =
use"}}
+{"error": {"class": "GenericError", "desc": "The overlay is already in u=
se"}}
+{"error": {"class": "GenericError", "desc": "The overlay is already in u=
se"}}
+{"error": {"class": "GenericError", "desc": "The overlay is already in u=
se"}}
=20
 =3D=3D=3D Invalid command - snapshot node used as backing hd =3D=3D=3D
=20
@@ -81,7 +81,7 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134=
217728 backing_file=3DTEST_DIR/
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D134217728
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3DTEST_DIR/t.IMGFMT.base
 {"return": {}}
-{"error": {"class": "GenericError", "desc": "The snapshot already has a =
backing image"}}
+{"error": {"class": "GenericError", "desc": "The overlay already has a b=
acking image"}}
=20
 =3D=3D=3D Invalid command - The node does not exist =3D=3D=3D
=20
--=20
2.21.0


