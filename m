Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4495146949
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 14:38:49 +0100 (CET)
Received: from localhost ([::1]:57142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuch6-0006Pk-Dc
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 08:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iub9C-0002XX-DR
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iub9A-0005Fx-LE
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:42 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35744
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iub9A-0005Ew-Gz
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ql3iZhOCDYYWCFp4jJc0tlyutsrGTcwOVUXiZ06+mF4=;
 b=RfVfTJtcBpatHOmHEUPUmlhJoJnk9t0tTiY3vjjCBOitVkAgbkwDHeoHztuR3Mf30JZqfl
 KbPv2QZvhj7CSVSP4zOLCWoGzj0t/jaQ+xaOSjYomqjSeemRMlO2TLrQ9ua6s7+1ckRo/7
 HCq9LKg6iFIT73aijZK0VKG0+rnLvtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-ZxFfzzvmPSaAJezu38kmVA-1; Thu, 23 Jan 2020 06:59:35 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D3F3107ACC4
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:59:34 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B87BC85750;
 Thu, 23 Jan 2020 11:59:33 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 040/111] virtiofsd: validate path components
Date: Thu, 23 Jan 2020 11:57:30 +0000
Message-Id: <20200123115841.138849-41-dgilbert@redhat.com>
In-Reply-To: <20200123115841.138849-1-dgilbert@redhat.com>
References: <20200123115841.138849-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: ZxFfzzvmPSaAJezu38kmVA-1
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

Several FUSE requests contain single path components.  A correct FUSE
client sends well-formed path components but there is currently no input
validation in case something went wrong or the client is malicious.

Refuse ".", "..", and paths containing '/' when we expect a path
component.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 59 ++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 6 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index ac380efcb1..e375406160 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -133,6 +133,21 @@ static void unref_inode(struct lo_data *lo, struct lo_=
inode *inode, uint64_t n);
=20
 static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st);
=20
+static int is_dot_or_dotdot(const char *name)
+{
+    return name[0] =3D=3D '.' &&
+           (name[1] =3D=3D '\0' || (name[1] =3D=3D '.' && name[2] =3D=3D '=
\0'));
+}
+
+/* Is `path` a single path component that is not "." or ".."? */
+static int is_safe_path_component(const char *path)
+{
+    if (strchr(path, '/')) {
+        return 0;
+    }
+
+    return !is_dot_or_dotdot(path);
+}
=20
 static struct lo_data *lo_data(fuse_req_t req)
 {
@@ -681,6 +696,15 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t paren=
t, const char *name)
                  parent, name);
     }
=20
+    /*
+     * Don't use is_safe_path_component(), allow "." and ".." for NFS expo=
rt
+     * support.
+     */
+    if (strchr(name, '/')) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
     err =3D lo_do_lookup(req, parent, name, &e);
     if (err) {
         fuse_reply_err(req, err);
@@ -762,6 +786,11 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_=
t parent,
     struct fuse_entry_param e;
     struct lo_cred old =3D {};
=20
+    if (!is_safe_path_component(name)) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
     dir =3D lo_inode(req, parent);
     if (!dir) {
         fuse_reply_err(req, EBADF);
@@ -863,6 +892,11 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, fu=
se_ino_t parent,
     struct fuse_entry_param e;
     int saverr;
=20
+    if (!is_safe_path_component(name)) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
     inode =3D lo_inode(req, ino);
     if (!inode) {
         fuse_reply_err(req, EBADF);
@@ -904,6 +938,10 @@ out_err:
 static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
 {
     int res;
+    if (!is_safe_path_component(name)) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
=20
     res =3D unlinkat(lo_fd(req, parent), name, AT_REMOVEDIR);
=20
@@ -916,6 +954,11 @@ static void lo_rename(fuse_req_t req, fuse_ino_t paren=
t, const char *name,
 {
     int res;
=20
+    if (!is_safe_path_component(name) || !is_safe_path_component(newname))=
 {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
     if (flags) {
         fuse_reply_err(req, EINVAL);
         return;
@@ -930,6 +973,11 @@ static void lo_unlink(fuse_req_t req, fuse_ino_t paren=
t, const char *name)
 {
     int res;
=20
+    if (!is_safe_path_component(name)) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
     res =3D unlinkat(lo_fd(req, parent), name, 0);
=20
     fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
@@ -1093,12 +1141,6 @@ out_err:
     fuse_reply_err(req, error);
 }
=20
-static int is_dot_or_dotdot(const char *name)
-{
-    return name[0] =3D=3D '.' &&
-           (name[1] =3D=3D '\0' || (name[1] =3D=3D '.' && name[2] =3D=3D '=
\0'));
-}
-
 static void lo_do_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
                           off_t offset, struct fuse_file_info *fi, int plu=
s)
 {
@@ -1248,6 +1290,11 @@ static void lo_create(fuse_req_t req, fuse_ino_t par=
ent, const char *name,
                  parent, name);
     }
=20
+    if (!is_safe_path_component(name)) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
     err =3D lo_change_cred(req, &old);
     if (err) {
         goto out;
--=20
2.24.1


