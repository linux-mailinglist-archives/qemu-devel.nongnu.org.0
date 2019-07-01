Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8CB23D35
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 18:27:34 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSl8Q-0001D1-2d
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 12:27:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkwo-0008Bs-RS
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:15:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkwn-0003WA-JW
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:15:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42454)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hSkwi-0003Q1-Bm; Mon, 20 May 2019 12:15:30 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B63C3AC2C2;
	Mon, 20 May 2019 16:15:09 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-208.ams2.redhat.com
	[10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9CEC07839E;
	Mon, 20 May 2019 16:15:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 20 May 2019 18:14:33 +0200
Message-Id: <20190520161453.30723-5-kwolf@redhat.com>
In-Reply-To: <20190520161453.30723-1-kwolf@redhat.com>
References: <20190520161453.30723-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 20 May 2019 16:15:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 04/24] qmp: forbid qmp_cont in
 RUN_STATE_FINISH_MIGRATE
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

qmp_cont in RUN_STATE_FINISH_MIGRATE may lead to moving vm to
RUN_STATE_RUNNING, before actual migration finish. So, when migration
thread will try to go to RUN_STATE_POSTMIGRATE, assuming transition
RUN_STATE_FINISH_MIGRATE->RUN_STATE_POSTMIGRATE, it will crash, as
current state is RUN_STATE_RUNNING, and transition
RUN_STATE_RUNNING->RUN_STATE_POSTMIGRATE is forbidden.

Reported-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qmp.c b/qmp.c
index b92d62cd5f..fa1b3c1577 100644
--- a/qmp.c
+++ b/qmp.c
@@ -156,6 +156,9 @@ void qmp_cont(Error **errp)
         return;
     } else if (runstate_check(RUN_STATE_SUSPENDED)) {
         return;
+    } else if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
+        error_setg(errp, "Migration is not finalized yet");
+        return;
     }
=20
     for (blk =3D blk_next(NULL); blk; blk =3D blk_next(blk)) {
--=20
2.20.1


