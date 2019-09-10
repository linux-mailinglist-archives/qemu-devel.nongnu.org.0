Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE04AEC5A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 15:53:08 +0200 (CEST)
Received: from localhost ([::1]:40010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7gZu-0000jv-UN
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 09:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43600)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1i7gTw-0005UN-Tb
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 09:46:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1i7gTv-0003Gw-EF
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 09:46:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44192)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>)
 id 1i7gTt-0003Fs-6T; Tue, 10 Sep 2019 09:46:53 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 730AC58;
 Tue, 10 Sep 2019 13:46:52 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 803FE60BE2;
 Tue, 10 Sep 2019 13:46:39 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 10 Sep 2019 15:36:13 +0200
Message-Id: <20190910133611.149421-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 10 Sep 2019 13:46:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] blockjob: update nodes head while removing
 all bdrv
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 Sergio Lopez <slp@redhat.com>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

block_job_remove_all_bdrv() iterates through job->nodes, calling
bdrv_root_unref_child() for each entry. The call to the latter may
reach child_job_[can_]set_aio_ctx(), which will also attempt to
traverse job->nodes, potentially finding entries that where freed
on previous iterations.

To avoid this situation, update job->nodes head on each iteration to
ensure that already freed entries are no longer linked to the list.

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1746631
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
Changelog

v2:
 - Avoid leaking job->nodes (thanks Max Reitz)
---
 blockjob.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
---
diff --git a/blockjob.c b/blockjob.c
index 6e32d1a0c0..ffda6dd1e4 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -187,13 +187,21 @@ static const BdrvChildRole child_job =3D {
=20
 void block_job_remove_all_bdrv(BlockJob *job)
 {
-    GSList *l;
+    GSList *l, *orig_nodes;
+
+    orig_nodes =3D job->nodes;
     for (l =3D job->nodes; l; l =3D l->next) {
         BdrvChild *c =3D l->data;
         bdrv_op_unblock_all(c->bs, job->blocker);
         bdrv_root_unref_child(c);
+        /*
+         * The call above may reach child_job_[can_]set_aio_ctx(), which=
 will
+         * also traverse job->nodes, so update the head here to make sur=
e it
+         * doesn't attempt to process an already freed BdrvChild.
+         */
+        job->nodes =3D l->next;
     }
-    g_slist_free(job->nodes);
+    g_slist_free(orig_nodes);
     job->nodes =3D NULL;
 }
=20
--=20
2.21.0


