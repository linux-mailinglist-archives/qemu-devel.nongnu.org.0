Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7CB14725C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 21:07:09 +0100 (CET)
Received: from localhost ([::1]:32958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuiku-00029i-RO
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 15:07:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufen-00060Q-Ku
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufem-0008I4-IG
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:37 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26291
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufem-0008HX-Fd
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+lsqLvEJ0+MjVyMcNzat6sKkhsnsZbPamB7jAxb+Nw=;
 b=MRW+Rx6bOirBI0cV3J3FTBjns3uWSKv/04+TUf1oNVhnbddxQjQM3YuSKrfdjPbyah5chP
 aG0yOXn2YqCt3wrF+/hN4/C9tWjgUPUYvfXmKZ6Q4CM4+528jbxTgeoOXBor7P63KwJAg+
 t0TbfCAuAsOofumlplX4HVFmEdCmtPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-fmt1MvxHNxiWjr3tcuhqig-1; Thu, 23 Jan 2020 11:48:34 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1F3B803A41
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:48:33 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48B9619C69;
 Thu, 23 Jan 2020 16:48:33 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 088/108] virtiofsd: make lo_release() atomic
Date: Thu, 23 Jan 2020 16:46:10 +0000
Message-Id: <20200123164630.91498-89-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: fmt1MvxHNxiWjr3tcuhqig-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Hold the lock across both lo_map_get() and lo_map_remove() to prevent
races between two FUSE_RELEASE requests.  In this case I don't see a
serious bug but it's safer to do things atomically.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 9414935b52..690edbc4c5 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1772,14 +1772,18 @@ static void lo_release(fuse_req_t req, fuse_ino_t i=
no,
                        struct fuse_file_info *fi)
 {
     struct lo_data *lo =3D lo_data(req);
-    int fd;
+    struct lo_map_elem *elem;
+    int fd =3D -1;
=20
     (void)ino;
=20
-    fd =3D lo_fi_fd(req, fi);
-
     pthread_mutex_lock(&lo->mutex);
-    lo_map_remove(&lo->fd_map, fi->fh);
+    elem =3D lo_map_get(&lo->fd_map, fi->fh);
+    if (elem) {
+        fd =3D elem->fd;
+        elem =3D NULL;
+        lo_map_remove(&lo->fd_map, fi->fh);
+    }
     pthread_mutex_unlock(&lo->mutex);
=20
     close(fd);
--=20
2.24.1


