Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B8C7C877
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 18:22:07 +0200 (CEST)
Received: from localhost ([::1]:42546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsrMc-00031H-Bt
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 12:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41121)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hsrBK-00060p-Qp
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:10:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hsrBJ-0001sq-UP
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:10:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47746)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hsrBH-0001oe-V7
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:10:25 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 832D130832DC;
 Wed, 31 Jul 2019 16:10:22 +0000 (UTC)
Received: from localhost (ovpn-117-27.ams2.redhat.com [10.36.117.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9F7560C05;
 Wed, 31 Jul 2019 16:10:14 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: virtio-fs@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 17:10:02 +0100
Message-Id: <20190731161006.9447-2-stefanha@redhat.com>
In-Reply-To: <20190731161006.9447-1-stefanha@redhat.com>
References: <20190731161006.9447-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 31 Jul 2019 16:10:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/5] virtiofsd: take lo->mutex around
 lo_add_fd_mapping()
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

The lo_add_fd_mapping() function assumes lo->mutex is held, so we should
acquire it.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/virtiofsd/passthrough_ll.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passt=
hrough_ll.c
index 65b7352c95..417a104218 100644
--- a/contrib/virtiofsd/passthrough_ll.c
+++ b/contrib/virtiofsd/passthrough_ll.c
@@ -1555,7 +1555,9 @@ static void lo_create(fuse_req_t req, fuse_ino_t pa=
rent, const char *name,
=20
 		update_version(lo, lo_inode(req, parent));
=20
+		pthread_mutex_lock(&lo->mutex);
 		fh =3D lo_add_fd_mapping(req, fd);
+		pthread_mutex_unlock(&lo->mutex);
 		if (fh =3D=3D -1) {
 			close(fd);
 			fuse_reply_err(req, ENOMEM);
@@ -1760,7 +1762,9 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino,=
 struct fuse_file_info *fi)
 	if (fd =3D=3D -1)
 		return (void) fuse_reply_err(req, errno);
=20
+	pthread_mutex_lock(&lo->mutex);
 	fh =3D lo_add_fd_mapping(req, fd);
+	pthread_mutex_unlock(&lo->mutex);
 	if (fh =3D=3D -1) {
 		close(fd);
 		fuse_reply_err(req, ENOMEM);
--=20
2.21.0


