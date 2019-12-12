Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DAA11D2C6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 17:52:46 +0100 (CET)
Received: from localhost ([::1]:34250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifRhk-0001Xz-VZ
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 11:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44332)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ifRV5-0005B4-LY
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:39:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ifRV3-0001F3-HS
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:39:38 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33631
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ifRV3-0001Do-DR
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576168776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAOkraYcNU4vIp0Hpwug4d3O3OgIjnp8rJoalwLKDLU=;
 b=djI9oY9SGNksC7iENL/gJIkdFZ+4Tia3yM5FH+X/vnb9GAWxu0V14akJJcvWwaaOcdWsUL
 uizwcYxt5azo1OkpSLHnn33jmgWs9w73O8AA/yYeFwnNOlormXFlhbKqrXpJGCP0SpIyI+
 1H/xq1GNIq0EdQlhV6hN/ctgrnrzC4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-ZiahSBfmPK2PMn-85sW1nQ-1; Thu, 12 Dec 2019 11:39:35 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BF31189CD02
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 16:39:34 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-226.ams2.redhat.com
 [10.36.116.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92FFB60BE1;
 Thu, 12 Dec 2019 16:39:33 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com,
	vgoyal@redhat.com
Subject: [PATCH 013/104] virtiofsd: Make fsync work even if only inode is
 passed in
Date: Thu, 12 Dec 2019 16:37:33 +0000
Message-Id: <20191212163904.159893-14-dgilbert@redhat.com>
In-Reply-To: <20191212163904.159893-1-dgilbert@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ZiahSBfmPK2PMn-85sW1nQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

If caller has not sent file handle in request, then using inode, retrieve
the fd opened using O_PATH and use that to open file again and issue
fsync. This will be needed when dax_flush() calls fsync. At that time
we only have inode information (and not file).

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c  |  6 +++++-
 tools/virtiofsd/passthrough_ll.c | 28 ++++++++++++++++++++++++++--
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index f4bd303a7a..167701b453 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1077,7 +1077,11 @@ static void do_fsync(fuse_req_t req, fuse_ino_t node=
id, const void *inarg)
     fi.fh =3D arg->fh;
=20
     if (req->se->op.fsync) {
-        req->se->op.fsync(req, nodeid, datasync, &fi);
+        if (fi.fh =3D=3D (uint64_t)-1) {
+            req->se->op.fsync(req, nodeid, datasync, NULL);
+        } else {
+            req->se->op.fsync(req, nodeid, datasync, &fi);
+        }
     } else {
         fuse_reply_err(req, ENOSYS);
     }
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 0e543353a4..cd6a0f4409 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -903,10 +903,34 @@ static void lo_fsync(fuse_req_t req, fuse_ino_t ino, =
int datasync,
 {
     int res;
     (void)ino;
+    int fd;
+    char *buf;
+
+    fuse_log(FUSE_LOG_DEBUG, "lo_fsync(ino=3D%" PRIu64 ", fi=3D0x%p)\n", i=
no,
+             (void *)fi);
+
+    if (!fi) {
+        res =3D asprintf(&buf, "/proc/self/fd/%i", lo_fd(req, ino));
+        if (res =3D=3D -1) {
+            return (void)fuse_reply_err(req, errno);
+        }
+
+        fd =3D open(buf, O_RDWR);
+        free(buf);
+        if (fd =3D=3D -1) {
+            return (void)fuse_reply_err(req, errno);
+        }
+    } else {
+        fd =3D fi->fh;
+    }
+
     if (datasync) {
-        res =3D fdatasync(fi->fh);
+        res =3D fdatasync(fd);
     } else {
-        res =3D fsync(fi->fh);
+        res =3D fsync(fd);
+    }
+    if (!fi) {
+        close(fd);
     }
     fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
 }
--=20
2.23.0


