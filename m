Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1A34A6AB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 18:20:40 +0200 (CEST)
Received: from localhost ([::1]:59454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdGqd-0005Z9-BZ
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 12:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56153)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hdFxe-0008BN-8V
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 11:23:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hdFxa-0000rh-Tk
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 11:23:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38696)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hdFxR-0000f6-0o; Tue, 18 Jun 2019 11:23:37 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6D281883D7;
 Tue, 18 Jun 2019 15:23:32 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-185.ams2.redhat.com
 [10.36.116.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C83419492;
 Tue, 18 Jun 2019 15:23:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 18 Jun 2019 17:23:11 +0200
Message-Id: <20190618152318.24953-8-kwolf@redhat.com>
In-Reply-To: <20190618152318.24953-1-kwolf@redhat.com>
References: <20190618152318.24953-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 18 Jun 2019 15:23:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 07/14] block: Add bdrv_child_refresh_perms()
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

If a block node uses bdrv_child_try_set_perm() to change the permission
it takes on its child, the result may be very short-lived.  If anything
makes the block layer recalculate the permissions internally, it will
invoke the node driver's .bdrv_child_perm() implementation.  The
permission/shared permissions masks that returns will then override the
values previously passed to bdrv_child_try_set_perm().

If drivers want a child edge to have specific values for the
permissions/shared permissions mask, it must return them in
.bdrv_child_perm().  Consequentially, there is no need for them to pass
the same values to bdrv_child_try_set_perm() then: It is better to have
a function that invokes .bdrv_child_perm() and calls
bdrv_child_try_set_perm() with the result.  This patch adds such a
function under the name of bdrv_child_refresh_perms().

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int.h | 15 +++++++++++++++
 block.c                   | 12 ++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index a498c2670b..d6415b53c1 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1165,9 +1165,24 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState=
 *child_bs,
                                   void *opaque, Error **errp);
 void bdrv_root_unref_child(BdrvChild *child);
=20
+/**
+ * Sets a BdrvChild's permissions.  Avoid if the parent is a BDS; use
+ * bdrv_child_refresh_perms() instead and make the parent's
+ * .bdrv_child_perm() implementation return the correct values.
+ */
 int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared=
,
                             Error **errp);
=20
+/**
+ * Calls bs->drv->bdrv_child_perm() and updates the child's permission
+ * masks with the result.
+ * Drivers should invoke this function whenever an event occurs that
+ * makes their .bdrv_child_perm() implementation return different
+ * values than before, but which will not result in the block layer
+ * automatically refreshing the permissions.
+ */
+int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error *=
*errp);
+
 /* Default implementation for BlockDriver.bdrv_child_perm() that can be =
used by
  * block filters: Forward CONSISTENT_READ, WRITE, WRITE_UNCHANGED and RE=
SIZE to
  * all children */
diff --git a/block.c b/block.c
index ceb2ea23c5..013369851b 100644
--- a/block.c
+++ b/block.c
@@ -2083,6 +2083,18 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t=
 perm, uint64_t shared,
     return 0;
 }
=20
+int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error *=
*errp)
+{
+    uint64_t parent_perms, parent_shared;
+    uint64_t perms, shared;
+
+    bdrv_get_cumulative_perm(bs, &parent_perms, &parent_shared);
+    bdrv_child_perm(bs, c->bs, c, c->role, NULL, parent_perms, parent_sh=
ared,
+                    &perms, &shared);
+
+    return bdrv_child_try_set_perm(c, perms, shared, errp);
+}
+
 void bdrv_filter_default_perms(BlockDriverState *bs, BdrvChild *c,
                                const BdrvChildRole *role,
                                BlockReopenQueue *reopen_queue,
--=20
2.20.1


