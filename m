Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048EB143E7D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:47:24 +0100 (CET)
Received: from localhost ([::1]:54086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittsI-0002Xf-7f
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:47:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52710)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itshP-00037H-Bl
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:32:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itshK-0004iU-5S
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:32:03 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59445
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itshJ-0004hy-WA
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:31:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1nK8DajHPxx37EGUnyFJItEZZkZZwLpJ/80iUHnoJhM=;
 b=O5NAyNwFCZKtMCX5Y74dpt/JvwpyEdtJ6K3DGo/Pplf119uhPSPewC05A5gmi9VycKhSmB
 dXptmSiy9AoKHNp7MzwtFPKnUBspgRDtzdrAlOQswvZ+7jJvsCsJpsrbTt6uB5NE9pm3eu
 rR2GZ5RwTKNisY8D8VUsZcaGHjUeQy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-Wp100HFRP4K0Ngrjkq62-g-1; Tue, 21 Jan 2020 07:31:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 761501137844;
 Tue, 21 Jan 2020 12:31:54 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDB5B60BE0;
 Tue, 21 Jan 2020 12:31:52 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 089/109] virtiofsd: make lo_release() atomic
Date: Tue, 21 Jan 2020 12:24:13 +0000
Message-Id: <20200121122433.50803-90-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Wp100HFRP4K0Ngrjkq62-g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Hold the lock across both lo_map_get() and lo_map_remove() to prevent
races between two FUSE_RELEASE requests.  In this case I don't see a
serious bug but it's safer to do things atomically.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index d7386d8a13..c52f7c2c32 100644
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


