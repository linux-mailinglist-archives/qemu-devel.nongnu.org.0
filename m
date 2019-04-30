Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ED3FD64
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 18:03:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLVE7-00079j-0O
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 12:03:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hLUv2-0008EC-EH
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 11:43:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hLUv1-0002Fu-GN
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 11:43:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50362)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hLUuz-0002Dw-6X; Tue, 30 Apr 2019 11:43:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FDFEC05D3F9;
	Tue, 30 Apr 2019 15:43:40 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A24C4C7;
	Tue, 30 Apr 2019 15:43:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 30 Apr 2019 17:42:42 +0200
Message-Id: <20190430154244.30083-26-kwolf@redhat.com>
In-Reply-To: <20190430154244.30083-1-kwolf@redhat.com>
References: <20190430154244.30083-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 30 Apr 2019 15:43:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 25/27] commit: Make base read-only if there is
 an early failure
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

From: Alberto Garcia <berto@igalia.com>

You can reproduce this by passing an invalid filter-node-name (like
"1234") to block-commit. In this case the base image is put in
read-write mode but is never reset back to read-only.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/commit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/commit.c b/block/commit.c
index 08204fa6f8..27537d995b 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -383,6 +383,9 @@ fail:
     if (s->top) {
         blk_unref(s->top);
     }
+    if (s->base_read_only) {
+        bdrv_reopen_set_read_only(base, true, NULL);
+    }
     job_early_fail(&s->common.job);
     /* commit_top_bs has to be replaced after deleting the block job,
      * otherwise this would fail because of lack of permissions. */
--=20
2.20.1


