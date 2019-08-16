Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB9E8FF3A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 11:44:01 +0200 (CEST)
Received: from localhost ([::1]:52554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyYm8-0000gn-9e
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 05:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1hyYdL-0008LU-PI
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 05:34:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hyYdK-0003cC-MO
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 05:34:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12048)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hyYdI-0003Yy-1z; Fri, 16 Aug 2019 05:34:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6266630842A9;
 Fri, 16 Aug 2019 09:34:51 +0000 (UTC)
Received: from localhost.localdomain.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DE4A5C1B2;
 Fri, 16 Aug 2019 09:34:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 16 Aug 2019 11:34:30 +0200
Message-Id: <20190816093439.14262-8-kwolf@redhat.com>
In-Reply-To: <20190816093439.14262-1-kwolf@redhat.com>
References: <20190816093439.14262-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 16 Aug 2019 09:34:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 07/16] block: Keep subtree drained in
 drop_intermediate
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

bdrv_drop_intermediate() calls BdrvChildRole.update_filename().  That
may poll, thus changing the graph, which potentially breaks the
QLIST_FOREACH_SAFE() loop.

Just keep the whole subtree drained.  This is probably the right thing
to do anyway (dropping nodes while the subtree is not drained seems
wrong).

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block.c b/block.c
index 6db8ecd62b..df3407934b 100644
--- a/block.c
+++ b/block.c
@@ -4491,6 +4491,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, B=
lockDriverState *base,
     int ret =3D -EIO;
=20
     bdrv_ref(top);
+    bdrv_subtree_drained_begin(top);
=20
     if (!top->drv || !base->drv) {
         goto exit;
@@ -4562,6 +4563,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, B=
lockDriverState *base,
=20
     ret =3D 0;
 exit:
+    bdrv_subtree_drained_end(top);
     bdrv_unref(top);
     return ret;
 }
--=20
2.20.1


