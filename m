Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D076143DB7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:12:36 +0100 (CET)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittKc-00039K-Q7
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsgK-0002Uj-5q
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:31:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsgG-0004JZ-8Y
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:30:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51729
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsgG-0004JT-4j
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wj8UEs6JMjVfCRf2HR8IZa1RAVwdzi082hH4q47bEMY=;
 b=AnRkVrTL5WTW1CSDlhttRCBEdKp/gRegk6Fsqo3zindTY6PXoXy90kIt4LNHejFjrEasVn
 UBjcPBNGwStCEuc/6FftYEOhAC9Cad1FlY969HG9m3qBGZsCgXcpwXh1uolm+1wvrwzrAa
 armdlpGFe7o37bxkYzpDfMvcnT6XDIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-_Juvpd3bOcqcO6QN0yRwyg-1; Tue, 21 Jan 2020 07:30:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66B86107ACCC;
 Tue, 21 Jan 2020 12:30:48 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9850C60C81;
 Tue, 21 Jan 2020 12:30:46 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 071/109] virtiofsd: rename unref_inode() to
 unref_inode_lolocked()
Date: Tue, 21 Jan 2020 12:23:55 +0000
Message-Id: <20200121122433.50803-72-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: _Juvpd3bOcqcO6QN0yRwyg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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

From: Miklos Szeredi <mszeredi@redhat.com>

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index b15633a044..57be7cf007 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -148,8 +148,8 @@ static const struct fuse_opt lo_opts[] =3D {
 };
 static bool use_syslog =3D false;
 static int current_log_level;
-
-static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64=
_t n);
+static void unref_inode_lolocked(struct lo_data *lo, struct lo_inode *inod=
e,
+                                 uint64_t n);
=20
 static struct {
     pthread_mutex_t mutex;
@@ -586,7 +586,7 @@ retry:
     return 0;
=20
 fail_unref:
-    unref_inode(lo, p, 1);
+    unref_inode_lolocked(lo, p, 1);
 fail:
     if (retries) {
         retries--;
@@ -624,7 +624,7 @@ fallback:
     res =3D lo_parent_and_name(lo, inode, path, &parent);
     if (res !=3D -1) {
         res =3D utimensat(parent->fd, path, tv, AT_SYMLINK_NOFOLLOW);
-        unref_inode(lo, parent, 1);
+        unref_inode_lolocked(lo, parent, 1);
     }
=20
     return res;
@@ -1027,7 +1027,7 @@ fallback:
     res =3D lo_parent_and_name(lo, inode, path, &parent);
     if (res !=3D -1) {
         res =3D linkat(parent->fd, path, dfd, name, 0);
-        unref_inode(lo, parent, 1);
+        unref_inode_lolocked(lo, parent, 1);
     }
=20
     return res;
@@ -1141,7 +1141,8 @@ static void lo_unlink(fuse_req_t req, fuse_ino_t pare=
nt, const char *name)
     fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
 }
=20
-static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64=
_t n)
+static void unref_inode_lolocked(struct lo_data *lo, struct lo_inode *inod=
e,
+                                 uint64_t n)
 {
     if (!inode) {
         return;
@@ -1181,7 +1182,7 @@ static void lo_forget_one(fuse_req_t req, fuse_ino_t =
ino, uint64_t nlookup)
              (unsigned long long)ino, (unsigned long long)inode->refcount,
              (unsigned long long)nlookup);
=20
-    unref_inode(lo, inode, nlookup);
+    unref_inode_lolocked(lo, inode, nlookup);
 }
=20
 static void lo_forget(fuse_req_t req, fuse_ino_t ino, uint64_t nlookup)
--=20
2.24.1


