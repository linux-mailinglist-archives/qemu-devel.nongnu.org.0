Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5A7FD4A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 17:55:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLV6h-0000Xh-Bx
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 11:55:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hLUup-000807-O2
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 11:43:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hLUun-00023g-8Q
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 11:43:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45850)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hLUuX-0001qU-Hn; Tue, 30 Apr 2019 11:43:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC0755D608;
	Tue, 30 Apr 2019 15:43:12 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 999DB17106;
	Tue, 30 Apr 2019 15:43:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 30 Apr 2019 17:42:27 +0200
Message-Id: <20190430154244.30083-11-kwolf@redhat.com>
In-Reply-To: <20190430154244.30083-1-kwolf@redhat.com>
References: <20190430154244.30083-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 30 Apr 2019 15:43:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 10/27] qcow2: Add errp to preallocate_co()
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We'll add a bdrv_co_truncate() call in the next patch which can return
an Error that we don't want to discard. So add an errp parameter to
preallocate_co().

Cc: qemu-stable@nongnu.org
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index dfac74c264..b4f9f5a240 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2721,7 +2721,7 @@ static int qcow2_set_up_encryption(BlockDriverState=
 *bs,
  * Returns: 0 on success, -errno on failure.
  */
 static int coroutine_fn preallocate_co(BlockDriverState *bs, uint64_t of=
fset,
-                                       uint64_t new_length)
+                                       uint64_t new_length, Error **errp=
)
 {
     BDRVQcow2State *s =3D bs->opaque;
     uint64_t bytes;
@@ -2738,6 +2738,7 @@ static int coroutine_fn preallocate_co(BlockDriverS=
tate *bs, uint64_t offset,
         ret =3D qcow2_alloc_cluster_offset(bs, offset, &cur_bytes,
                                          &host_offset, &meta);
         if (ret < 0) {
+            error_setg_errno(errp, -ret, "Allocating clusters failed");
             return ret;
         }
=20
@@ -2746,6 +2747,7 @@ static int coroutine_fn preallocate_co(BlockDriverS=
tate *bs, uint64_t offset,
=20
             ret =3D qcow2_alloc_cluster_link_l2(bs, meta);
             if (ret < 0) {
+                error_setg_errno(errp, -ret, "Mapping clusters failed");
                 qcow2_free_any_clusters(bs, meta->alloc_offset,
                                         meta->nb_clusters, QCOW2_DISCARD=
_NEVER);
                 return ret;
@@ -2775,6 +2777,7 @@ static int coroutine_fn preallocate_co(BlockDriverS=
tate *bs, uint64_t offset,
         ret =3D bdrv_pwrite(s->data_file, (host_offset + cur_bytes) - 1,
                           &data, 1);
         if (ret < 0) {
+            error_setg_errno(errp, -ret, "Writing to EOF failed");
             return ret;
         }
     }
@@ -3748,9 +3751,8 @@ static int coroutine_fn qcow2_co_truncate(BlockDriv=
erState *bs, int64_t offset,
         break;
=20
     case PREALLOC_MODE_METADATA:
-        ret =3D preallocate_co(bs, old_length, offset);
+        ret =3D preallocate_co(bs, old_length, offset, errp);
         if (ret < 0) {
-            error_setg_errno(errp, -ret, "Preallocation failed");
             goto fail;
         }
         break;
@@ -3766,9 +3768,8 @@ static int coroutine_fn qcow2_co_truncate(BlockDriv=
erState *bs, int64_t offset,
         /* With a data file, preallocation means just allocating the met=
adata
          * and forwarding the truncate request to the data file */
         if (has_data_file(bs)) {
-            ret =3D preallocate_co(bs, old_length, offset);
+            ret =3D preallocate_co(bs, old_length, offset, errp);
             if (ret < 0) {
-                error_setg_errno(errp, -ret, "Preallocation failed");
                 goto fail;
             }
             break;
--=20
2.20.1


