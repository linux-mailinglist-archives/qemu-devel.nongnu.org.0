Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221D1627F9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 15:19:23 +0100 (CET)
Received: from localhost ([::1]:35958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j43ic-0004dO-Aw
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 09:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53333)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j43YB-0008Bd-Q5
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j43YA-0001ie-LW
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:35 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51894
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j43YA-0001iE-Fg
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582034914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KRfSujtQOYNUclTzVV9uUM4sxDZadTzkWyicnw0cP7Q=;
 b=OQODxcnGfnDhErAuIT5WA3o4BxPjKSPF9IEDzA/VJAaT7UwSVP5nNcqCgcFfSNjiJgijWw
 U8OclmUm0dr60GzpE6/9tQ4J/S+2NNa0SyFro5TifpO2hvoSmmFPI7sYosfysul4uWgRjZ
 B5I9HL3gXgpnFRxOhMun7QK7Ze/HMxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-l5cMeG3OPtqubR28LeZ-vQ-1; Tue, 18 Feb 2020 09:08:31 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8215EDB61;
 Tue, 18 Feb 2020 14:08:30 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-181.ams2.redhat.com
 [10.36.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C49519E9C;
 Tue, 18 Feb 2020 14:08:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 29/36] quorum: Stop marking it as a filter
Date: Tue, 18 Feb 2020 15:07:15 +0100
Message-Id: <20200218140722.23876-30-kwolf@redhat.com>
In-Reply-To: <20200218140722.23876-1-kwolf@redhat.com>
References: <20200218140722.23876-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: l5cMeG3OPtqubR28LeZ-vQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

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
Message-Id: <20200218103454.296704-13-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/quorum.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/quorum.c b/block/quorum.c
index f57b0402d9..6d7a56bd93 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -1198,7 +1198,6 @@ static BlockDriver bdrv_quorum =3D {
=20
     .bdrv_child_perm                    =3D quorum_child_perm,
=20
-    .is_filter                          =3D true,
     .bdrv_recurse_can_replace           =3D quorum_recurse_can_replace,
=20
     .strong_runtime_opts                =3D quorum_strong_runtime_opts,
--=20
2.20.1


