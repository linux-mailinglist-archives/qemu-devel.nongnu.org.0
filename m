Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567A9143DF3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:23:11 +0100 (CET)
Received: from localhost ([::1]:53746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittUr-00073l-2k
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itshg-0003LP-Vy
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:32:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itshc-0004pK-RG
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:32:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57849
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itshc-0004oX-MZ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:32:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqB9U4jeF9YYFJdQmfFXJrPa1vp8+Mx/03NxxH00DJQ=;
 b=hrYpXLu753/8iH1GREcn/fRUeVW7V64pGpnfqTja3MsCDOTs81liUFvJSWhQ1C3vJPI7Ij
 iVz9eb8G1qHN0ToABWCWynFewJrX716Nw+JtT4Z4rhX1Efiz9ExZgoT+Uu1prQc0TAD/CL
 6RPQ50UO0J09Q66Z/RdJApJnAbokgdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-OaapjSzCO3Cjlr2ihQK3Gw-1; Tue, 21 Jan 2020 07:32:13 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83838801E6D;
 Tue, 21 Jan 2020 12:32:12 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24A7760BE0;
 Tue, 21 Jan 2020 12:32:07 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 094/109] virtiofsd: passthrough_ll: fix refcounting on
 remove/rename
Date: Tue, 21 Jan 2020 12:24:18 +0000
Message-Id: <20200121122433.50803-95-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: OaapjSzCO3Cjlr2ihQK3Gw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 tools/virtiofsd/passthrough_ll.c | 50 +++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 9f37829824..0dc3011919 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1140,17 +1140,42 @@ out_err:
     fuse_reply_err(req, saverr);
 }
=20
+static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
+                                    const char *name)
+{
+    int res;
+    struct stat attr;
+
+    res =3D fstatat(lo_fd(req, parent), name, &attr,
+                  AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
+    if (res =3D=3D -1) {
+        return NULL;
+    }
+
+    return lo_find(lo_data(req), &attr);
+}
+
 static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
 {
     int res;
+    struct lo_inode *inode;
+    struct lo_data *lo =3D lo_data(req);
+
     if (!is_safe_path_component(name)) {
         fuse_reply_err(req, EINVAL);
         return;
     }
=20
+    inode =3D lookup_name(req, parent, name);
+    if (!inode) {
+        fuse_reply_err(req, EIO);
+        return;
+    }
+
     res =3D unlinkat(lo_fd(req, parent), name, AT_REMOVEDIR);
=20
     fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
+    unref_inode_lolocked(lo, inode, 1);
 }
=20
 static void lo_rename(fuse_req_t req, fuse_ino_t parent, const char *name,
@@ -1158,12 +1183,23 @@ static void lo_rename(fuse_req_t req, fuse_ino_t pa=
rent, const char *name,
                       unsigned int flags)
 {
     int res;
+    struct lo_inode *oldinode;
+    struct lo_inode *newinode;
+    struct lo_data *lo =3D lo_data(req);
=20
     if (!is_safe_path_component(name) || !is_safe_path_component(newname))=
 {
         fuse_reply_err(req, EINVAL);
         return;
     }
=20
+    oldinode =3D lookup_name(req, parent, name);
+    newinode =3D lookup_name(req, newparent, newname);
+
+    if (!oldinode) {
+        fuse_reply_err(req, EIO);
+        goto out;
+    }
+
     if (flags) {
 #ifndef SYS_renameat2
         fuse_reply_err(req, EINVAL);
@@ -1176,26 +1212,38 @@ static void lo_rename(fuse_req_t req, fuse_ino_t pa=
rent, const char *name,
             fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
         }
 #endif
-        return;
+        goto out;
     }
=20
     res =3D renameat(lo_fd(req, parent), name, lo_fd(req, newparent), newn=
ame);
=20
     fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
+out:
+    unref_inode_lolocked(lo, oldinode, 1);
+    unref_inode_lolocked(lo, newinode, 1);
 }
=20
 static void lo_unlink(fuse_req_t req, fuse_ino_t parent, const char *name)
 {
     int res;
+    struct lo_inode *inode;
+    struct lo_data *lo =3D lo_data(req);
=20
     if (!is_safe_path_component(name)) {
         fuse_reply_err(req, EINVAL);
         return;
     }
=20
+    inode =3D lookup_name(req, parent, name);
+    if (!inode) {
+        fuse_reply_err(req, EIO);
+        return;
+    }
+
     res =3D unlinkat(lo_fd(req, parent), name, 0);
=20
     fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
+    unref_inode_lolocked(lo, inode, 1);
 }
=20
 static void unref_inode_lolocked(struct lo_data *lo, struct lo_inode *inod=
e,
--=20
2.24.1


