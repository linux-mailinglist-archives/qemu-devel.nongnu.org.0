Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7F6AE8DE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 13:09:03 +0200 (CEST)
Received: from localhost ([::1]:38068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7e18-0004xv-Bg
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 07:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1i7e05-00048D-9j
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 07:07:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1i7e04-0006qc-4Z
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 07:07:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51514)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>)
 id 1i7e01-0006oX-Sk; Tue, 10 Sep 2019 07:07:53 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8BA4B3076BC1;
 Tue, 10 Sep 2019 11:07:52 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFA8F5D6B2;
 Tue, 10 Sep 2019 11:07:45 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 10 Sep 2019 13:07:25 +0200
Message-Id: <20190910110725.141014-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 10 Sep 2019 11:07:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] blockjob: update nodes head while removing all
 bdrv
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
 blockjob.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/blockjob.c b/blockjob.c
index 6e32d1a0c0..7b1551d981 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -192,6 +192,12 @@ void block_job_remove_all_bdrv(BlockJob *job)
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
     g_slist_free(job->nodes);
     job->nodes =3D NULL;
--=20
2.21.0


