Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610E414E538
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 22:58:41 +0100 (CET)
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixHpg-00020p-EY
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 16:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33608)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ixHcj-0005CX-IO
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:45:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ixHci-0004q7-Ad
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:45:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36115
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ixHci-0004lW-4E
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580420714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8yL8mul3nLGCwjVN50zJzmxvwvWKZK3WhaZ6AhhD88=;
 b=Xs9hKt9RYuI8HLWMBvxM6NjqaS5p2+8CYUK3TAJlBiXdIgHuDgaw7p5WOGRuSL85sMMUzq
 KApaggxfXrHvwHt6BVmaZMaTEr8o6U5BoRMsTQftkdu1BWNzVSSNITa690Ag71G9ko68JP
 HMHEltQX3AOGpjamLvBrOrug0TcmVs0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-A1dKH2CYNDyYTe-Hdt8tYQ-1; Thu, 30 Jan 2020 16:45:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2C4A801E78;
 Thu, 30 Jan 2020 21:45:08 +0000 (UTC)
Received: from localhost (ovpn-204-145.brq.redhat.com [10.40.204.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 391C587B2C;
 Thu, 30 Jan 2020 21:45:08 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 14/21] quorum: Stop marking it as a filter
Date: Thu, 30 Jan 2020 22:44:24 +0100
Message-Id: <20200130214431.333510-15-mreitz@redhat.com>
In-Reply-To: <20200130214431.333510-1-mreitz@redhat.com>
References: <20200130214431.333510-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: A1dKH2CYNDyYTe-Hdt8tYQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quorum is not a filter, for example because it cannot guarantee which of
its children will serve the next request.  Thus, any of its children may
differ from the data visible to quorum's parents.

We have other filters with multiple children, but they differ in this
aspect:

- blkverify quits the whole qemu process if its children differ.  As
  such, we can always skip it when we want to skip it (as a filter node)
  by going to any of its children.  Both have the same data.

- replication generally serves requests from bs->file, so this is its
  only actually filtered child.

- Block job filters currently only have one child, but they will
  probably get more children in the future.  Still, they will always
  have only one actually filtered child.

Having "filters" as a dedicated node category only makes sense if you
can skip them by going to a one fixed child that always shows the same
data as the filter node.  Quorum cannot fulfill this, so it is not a
filter.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/quorum.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/quorum.c b/block/quorum.c
index 476def878d..d85db88dbb 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -1234,7 +1234,6 @@ static BlockDriver bdrv_quorum =3D {
=20
     .bdrv_child_perm                    =3D quorum_child_perm,
=20
-    .is_filter                          =3D true,
     .bdrv_recurse_can_replace           =3D quorum_recurse_can_replace,
=20
     .strong_runtime_opts                =3D quorum_strong_runtime_opts,
--=20
2.24.1


