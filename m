Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006747C853
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 18:15:30 +0200 (CEST)
Received: from localhost ([::1]:42412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsrGE-0004zx-25
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 12:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41178)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hsrBY-0006Vm-9n
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:10:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hsrBW-0001wN-Fc
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:10:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52676)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hsrBW-0001wH-AU
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:10:38 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1FD78796ED;
 Wed, 31 Jul 2019 16:10:37 +0000 (UTC)
Received: from localhost (ovpn-117-27.ams2.redhat.com [10.36.117.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 593E25D6A7;
 Wed, 31 Jul 2019 16:10:31 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: virtio-fs@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 17:10:05 +0100
Message-Id: <20190731161006.9447-5-stefanha@redhat.com>
In-Reply-To: <20190731161006.9447-1-stefanha@redhat.com>
References: <20190731161006.9447-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 31 Jul 2019 16:10:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/5] virtiofsd: fix inode nlookup leaks
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
Cc: Liu Bo <bo.liu@linux.alibaba.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

utimensat_empty() and linkat_empty_nofollow() must unref the parent
directory inode that was obtained from lo_parent_and_name().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/virtiofsd/passthrough_ll.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passt=
hrough_ll.c
index 135123366a..125e9d9f96 100644
--- a/contrib/virtiofsd/passthrough_ll.c
+++ b/contrib/virtiofsd/passthrough_ll.c
@@ -567,8 +567,10 @@ static int utimensat_empty(struct lo_data *lo, struc=
t lo_inode *inode,
=20
 fallback:
 	res =3D lo_parent_and_name(lo, inode, path, &parent);
-	if (res !=3D -1)
+	if (res !=3D -1) {
 		res =3D utimensat(parent->fd, path, tv, AT_SYMLINK_NOFOLLOW);
+		unref_inode(lo, parent, 1);
+	}
=20
 	return res;
 }
@@ -1024,8 +1026,10 @@ static int linkat_empty_nofollow(struct lo_data *l=
o, struct lo_inode *inode,
=20
 fallback:
 	res =3D lo_parent_and_name(lo, inode, path, &parent);
-	if (res !=3D -1)
+	if (res !=3D -1) {
 		res =3D linkat(parent->fd, path, dfd, name, 0);
+		unref_inode(lo, parent, 1);
+	}
=20
 	return res;
 }
--=20
2.21.0


