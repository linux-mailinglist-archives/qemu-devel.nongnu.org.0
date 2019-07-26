Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E76376198
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 11:12:35 +0200 (CEST)
Received: from localhost ([::1]:37614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqwHA-00005c-NV
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 05:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60706)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hqwGG-0004l7-IM
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:11:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hqwGB-0005Ap-EJ
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:11:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37012)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hqwGB-0004zg-7K
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:11:31 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 19B14B2CD
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 09:11:28 +0000 (UTC)
Received: from localhost (ovpn-117-212.ams2.redhat.com [10.36.117.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A048360C18;
 Fri, 26 Jul 2019 09:11:27 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: virtio-fs@redhat.com,
	qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 10:11:02 +0100
Message-Id: <20190726091103.23503-5-stefanha@redhat.com>
In-Reply-To: <20190726091103.23503-1-stefanha@redhat.com>
References: <20190726091103.23503-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 26 Jul 2019 09:11:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/5] virtiofsd: drop lo_dirp->fd field
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fdopendir(3) takes ownership of the file descriptor.  The presence of
the lo_dirp->fd field could lead to someone incorrectly adding a
close(d->fd) cleanup call in the future.

Do not store the file descriptor in struct lo_dirp since it is unused.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/virtiofsd/passthrough_ll.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passt=
hrough_ll.c
index c1500e092d..ad3abdd532 100644
--- a/contrib/virtiofsd/passthrough_ll.c
+++ b/contrib/virtiofsd/passthrough_ll.c
@@ -1293,7 +1293,6 @@ static void lo_readlink(fuse_req_t req, fuse_ino_t =
ino)
 }
=20
 struct lo_dirp {
-	int fd;
 	DIR *dp;
 	struct dirent *entry;
 	off_t offset;
@@ -1319,16 +1318,17 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t=
 ino, struct fuse_file_info *fi
 	struct lo_data *lo =3D lo_data(req);
 	struct lo_dirp *d;
 	ssize_t fh;
+	int fd =3D -1;
=20
 	d =3D calloc(1, sizeof(struct lo_dirp));
 	if (d =3D=3D NULL)
 		goto out_err;
=20
-	d->fd =3D openat(lo_fd(req, ino), ".", O_RDONLY);
-	if (d->fd =3D=3D -1)
+	fd =3D openat(lo_fd(req, ino), ".", O_RDONLY);
+	if (fd =3D=3D -1)
 		goto out_errno;
=20
-	d->dp =3D fdopendir(d->fd);
+	d->dp =3D fdopendir(fd);
 	if (d->dp =3D=3D NULL)
 		goto out_errno;
=20
@@ -1348,11 +1348,12 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t=
 ino, struct fuse_file_info *fi
 out_errno:
 	error =3D errno;
 out_err:
+	if (fd !=3D -1) {
+		close(fd);
+	}
 	if (d) {
 		if (d->dp)
 			closedir(d->dp);
-		if (d->fd !=3D -1)
-			close(d->fd);
 		free(d);
 	}
 	fuse_reply_err(req, error);
--=20
2.21.0


