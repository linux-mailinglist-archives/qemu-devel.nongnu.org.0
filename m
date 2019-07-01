Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63D3154A2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 21:50:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNjdO-0005gG-2v
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 15:50:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hNjb6-0004aw-KK
	for qemu-devel@nongnu.org; Mon, 06 May 2019 15:48:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hNjb5-00026g-OP
	for qemu-devel@nongnu.org; Mon, 06 May 2019 15:48:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56520)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hNjb1-00024Q-VC; Mon, 06 May 2019 15:48:20 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D93A3086235;
	Mon,  6 May 2019 19:48:19 +0000 (UTC)
Received: from localhost (ovpn-204-185.brq.redhat.com [10.40.204.185])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 745F418AA2;
	Mon,  6 May 2019 19:48:16 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon,  6 May 2019 21:47:50 +0200
Message-Id: <20190506194753.12464-5-mreitz@redhat.com>
In-Reply-To: <20190506194753.12464-1-mreitz@redhat.com>
References: <20190506194753.12464-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 06 May 2019 19:48:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/7] block/commit: Drop
 bdrv_child_try_set_perm()
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit_top_bs never requests or unshares any permissions.  There is no
reason to make this so explicit here.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/commit.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/block/commit.c b/block/commit.c
index 14e5bb394c..44b3083b84 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -110,8 +110,6 @@ static void commit_abort(Job *job)
      * XXX Can (or should) we somehow keep 'consistent read' blocked eve=
n
      * after the failed/cancelled commit job is gone? If we already wrot=
e
      * something to base, the intermediate images aren't valid any more.=
 */
-    bdrv_child_try_set_perm(s->commit_top_bs->backing, 0, BLK_PERM_ALL,
-                            &error_abort);
     bdrv_replace_node(s->commit_top_bs, backing_bs(s->commit_top_bs),
                       &error_abort);
=20
--=20
2.20.1


