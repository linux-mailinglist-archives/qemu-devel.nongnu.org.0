Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528A011D4BD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 19:00:28 +0100 (CET)
Received: from localhost ([::1]:35140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifSlG-00053w-KP
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 13:00:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35784)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ifRWv-0007dq-Po
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:41:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ifRWu-0004bG-G5
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:41:33 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57574
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ifRWu-0004a5-Bn
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:41:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576168891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DTKt64nmXmaYbPkNGoOTJq9dX/ls4SiUD1uWBfYfaA0=;
 b=JbTQ1fMqY6F/CNp4171PbwRAczis8lt9FkgKoHQbRfkf7IdG7iEzXPvhcBi3b+oos+sgQa
 TmVpGHKwq0ccFvjDPqfE+1ZvzybyCbnrIPjXbGmJwvS4ctNF1+qegpnZosGG0yj/ySh1bS
 FLd8b4YUMU29lG3Z752F+LM53nWZymI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-ZocUZrO0OA2mnCVl7jWiXQ-1; Thu, 12 Dec 2019 11:41:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC26C801E7E
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 16:41:27 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-226.ams2.redhat.com
 [10.36.116.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE1D160BE1;
 Thu, 12 Dec 2019 16:41:26 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com,
	vgoyal@redhat.com
Subject: [PATCH 088/104] virtiofsd: make lo_release() atomic
Date: Thu, 12 Dec 2019 16:38:48 +0000
Message-Id: <20191212163904.159893-89-dgilbert@redhat.com>
In-Reply-To: <20191212163904.159893-1-dgilbert@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ZocUZrO0OA2mnCVl7jWiXQ-1
X-Mimecast-Spam-Score: 0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Hold the lock across both lo_map_get() and lo_map_remove() to prevent
races between two FUSE_RELEASE requests.  In this case I don't see a
serious bug but it's safer to do things atomically.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index fc79d5ac43..eadd568435 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1805,14 +1805,18 @@ static void lo_release(fuse_req_t req, fuse_ino_t i=
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
2.23.0


