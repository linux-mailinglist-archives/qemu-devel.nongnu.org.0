Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBE01A136
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 18:19:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP8Ey-0005U2-KV
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 12:19:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hP8CL-00047u-LQ
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:16:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hP8CK-0008Ev-R9
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:16:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33068)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hP8CI-00089o-FS; Fri, 10 May 2019 12:16:34 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C919D356DE;
	Fri, 10 May 2019 16:16:33 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-183.ams2.redhat.com
	[10.36.116.183])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4950177BC;
	Fri, 10 May 2019 16:16:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 10 May 2019 18:16:00 +0200
Message-Id: <20190510161614.23236-2-kwolf@redhat.com>
In-Reply-To: <20190510161614.23236-1-kwolf@redhat.com>
References: <20190510161614.23236-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 10 May 2019 16:16:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 01/15] block: remove bs from lists before closing
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

From: Anton Kuchin <antonkuchin@yandex-team.ru>

Close involves flush that can be performed asynchronously and bs
must be protected from being referenced before it is deleted.

Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 5c2c6aa761..6999aad446 100644
--- a/block.c
+++ b/block.c
@@ -4082,14 +4082,14 @@ static void bdrv_delete(BlockDriverState *bs)
     assert(bdrv_op_blocker_is_empty(bs));
     assert(!bs->refcnt);
=20
-    bdrv_close(bs);
-
     /* remove from list, if necessary */
     if (bs->node_name[0] !=3D '\0') {
         QTAILQ_REMOVE(&graph_bdrv_states, bs, node_list);
     }
     QTAILQ_REMOVE(&all_bdrv_states, bs, bs_list);
=20
+    bdrv_close(bs);
+
     g_free(bs);
 }
=20
--=20
2.20.1


