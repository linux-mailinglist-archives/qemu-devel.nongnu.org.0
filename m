Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF78F789D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 17:19:13 +0100 (CET)
Received: from localhost ([::1]:54734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUCPH-0001Rr-Qs
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 11:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39211)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iUC9m-0008Kc-Ad
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 11:03:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iUC9l-0002vN-0t
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 11:03:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58454
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iUC9k-0002v3-T2
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 11:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573488188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qakAL0ITihVz+AFdnaqR0YnYpEIqJv3zX+oL+M5cVLU=;
 b=etRQ10uhV6/aTFYvGDwVKrjA7hHt61f0t9M/BL3u/tXICwzULp3nBPys8YQ4N0RIFdVx8z
 1xu9XkCInmxu49WPsc/cCcrCMgbKGVKOzH7uxYOZ2xdAEKLQYgsZsZhcgfYe3sZVchurFV
 6AvcPVrdLhPwWP3bb1T+2TEbzAfjOks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-clmjbh3NOMG4HYONIoknPw-1; Mon, 11 Nov 2019 11:03:04 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6422107ACC4;
 Mon, 11 Nov 2019 16:03:02 +0000 (UTC)
Received: from localhost (ovpn-117-116.ams2.redhat.com [10.36.117.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B359B60904;
 Mon, 11 Nov 2019 16:03:01 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-5.0 v2 14/23] quorum: Stop marking it as a filter
Date: Mon, 11 Nov 2019 17:02:07 +0100
Message-Id: <20191111160216.197086-15-mreitz@redhat.com>
In-Reply-To: <20191111160216.197086-1-mreitz@redhat.com>
References: <20191111160216.197086-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: clmjbh3NOMG4HYONIoknPw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
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
index 1974e2ffa8..8cd13a7b91 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -1237,7 +1237,6 @@ static BlockDriver bdrv_quorum =3D {
=20
     .bdrv_child_perm                    =3D quorum_child_perm,
=20
-    .is_filter                          =3D true,
     .bdrv_recurse_can_replace           =3D quorum_recurse_can_replace,
=20
     .strong_runtime_opts                =3D quorum_strong_runtime_opts,
--=20
2.23.0


