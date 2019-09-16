Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CFCB3D9D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 17:26:27 +0200 (CEST)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9stV-0007ZI-Tv
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 11:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i9rug-0003YU-U7
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:23:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i9ruf-0000wO-Fb
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:23:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45478)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i9ruc-0000tC-D7; Mon, 16 Sep 2019 10:23:30 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A6ABE10C093C;
 Mon, 16 Sep 2019 14:23:29 +0000 (UTC)
Received: from localhost (unknown [10.40.205.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 252FB600C1;
 Mon, 16 Sep 2019 14:23:28 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 16 Sep 2019 16:22:43 +0200
Message-Id: <20190916142246.31474-14-mreitz@redhat.com>
In-Reply-To: <20190916142246.31474-1-mreitz@redhat.com>
References: <20190916142246.31474-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Mon, 16 Sep 2019 14:23:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 13/16] blockjob: update nodes head while
 removing all bdrv
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

From: Sergio Lopez <slp@redhat.com>

block_job_remove_all_bdrv() iterates through job->nodes, calling
bdrv_root_unref_child() for each entry. The call to the latter may
reach child_job_[can_]set_aio_ctx(), which will also attempt to
traverse job->nodes, potentially finding entries that where freed
on previous iterations.

To avoid this situation, update job->nodes head on each iteration to
ensure that already freed entries are no longer linked to the list.

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1746631
Signed-off-by: Sergio Lopez <slp@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190911100316.32282-1-mreitz@redhat.com
Reviewed-by: Sergio Lopez <slp@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 blockjob.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index 2abed0f551..c6e20e2fcd 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -175,14 +175,23 @@ static const BdrvChildRole child_job =3D {
=20
 void block_job_remove_all_bdrv(BlockJob *job)
 {
-    GSList *l;
-    for (l =3D job->nodes; l; l =3D l->next) {
+    /*
+     * bdrv_root_unref_child() may reach child_job_[can_]set_aio_ctx(),
+     * which will also traverse job->nodes, so consume the list one by
+     * one to make sure that such a concurrent access does not attempt
+     * to process an already freed BdrvChild.
+     */
+    while (job->nodes) {
+        GSList *l =3D job->nodes;
         BdrvChild *c =3D l->data;
+
+        job->nodes =3D l->next;
+
         bdrv_op_unblock_all(c->bs, job->blocker);
         bdrv_root_unref_child(c);
+
+        g_slist_free_1(l);
     }
-    g_slist_free(job->nodes);
-    job->nodes =3D NULL;
 }
=20
 bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs)
--=20
2.21.0


