Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799A4338FFC
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:27:18 +0100 (CET)
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKil3-0008AS-DZ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKiUl-0002oc-EO
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:10:27 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:29353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKiUj-00041j-OK
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:10:27 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-BVLymU5FOtSto8Cp4lqBZA-1; Fri, 12 Mar 2021 09:10:21 -0500
X-MC-Unique: BVLymU5FOtSto8Cp4lqBZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4523DEC1A0;
 Fri, 12 Mar 2021 14:10:19 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5D345D6D7;
 Fri, 12 Mar 2021 14:10:17 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] virtiofsd: Don't allow empty filenames
Date: Fri, 12 Mar 2021 15:10:03 +0100
Message-Id: <20210312141003.819108-4-groug@kaod.org>
In-Reply-To: <20210312141003.819108-1-groug@kaod.org>
References: <20210312141003.819108-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: virtio-fs@redhat.com, Miklos Szeredi <mszeredi@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

POSIX.1-2017 clearly stipulates that empty filenames aren't
allowed ([1] and [2]). Since virtiofsd is supposed to mirror
the host file system hierarchy and the host can be assumed to
be linux, we don't really expect clients to pass requests with
an empty path in it. If they do so anyway, this would eventually
cause an error when trying to create/lookup the actual inode
on the underlying POSIX filesystem. But this could still confuse
some code that wouldn't be ready to cope with this.

Filter out empty names coming from the client at the top level,
so that the rest doesn't have to care about it. This is done
everywhere we already call is_safe_path_component(), but
in a separate helper since the usual error for empty path
names is ENOENT instead of EINVAL.

[1] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap03.htm=
l#tag_03_170
[2] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap04.htm=
l#tag_04_13

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tools/virtiofsd/passthrough_ll.c | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index f63016d35626..bff9dc2cd26d 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -237,6 +237,11 @@ static bool is_safe_path_component(const char *path)
     return !is_dot_or_dotdot(path);
 }
=20
+static bool is_empty(const char *name)
+{
+    return name[0] =3D=3D '\0';
+}
+
 static struct lo_data *lo_data(fuse_req_t req)
 {
     return (struct lo_data *)fuse_req_userdata(req);
@@ -1083,6 +1088,11 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t par=
ent, const char *name)
     fuse_log(FUSE_LOG_DEBUG, "lo_lookup(parent=3D%" PRIu64 ", name=3D%s)\n=
", parent,
              name);
=20
+    if (is_empty(name)) {
+        fuse_reply_err(req, ENOENT);
+        return;
+    }
+
     /*
      * Don't use is_safe_path_component(), allow "." and ".." for NFS expo=
rt
      * support.
@@ -1174,6 +1184,11 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_in=
o_t parent,
     struct fuse_entry_param e;
     struct lo_cred old =3D {};
=20
+    if (is_empty(name)) {
+        fuse_reply_err(req, ENOENT);
+        return;
+    }
+
     if (!is_safe_path_component(name)) {
         fuse_reply_err(req, EINVAL);
         return;
@@ -1246,6 +1261,11 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, =
fuse_ino_t parent,
     char procname[64];
     int saverr;
=20
+    if (is_empty(name)) {
+        fuse_reply_err(req, ENOENT);
+        return;
+    }
+
     if (!is_safe_path_component(name)) {
         fuse_reply_err(req, EINVAL);
         return;
@@ -1323,6 +1343,11 @@ static void lo_rmdir(fuse_req_t req, fuse_ino_t pare=
nt, const char *name)
     struct lo_inode *inode;
     struct lo_data *lo =3D lo_data(req);
=20
+    if (is_empty(name)) {
+        fuse_reply_err(req, ENOENT);
+        return;
+    }
+
     if (!is_safe_path_component(name)) {
         fuse_reply_err(req, EINVAL);
         return;
@@ -1352,6 +1377,11 @@ static void lo_rename(fuse_req_t req, fuse_ino_t par=
ent, const char *name,
     struct lo_inode *newinode =3D NULL;
     struct lo_data *lo =3D lo_data(req);
=20
+    if (is_empty(name) || is_empty(newname)) {
+        fuse_reply_err(req, ENOENT);
+        return;
+    }
+
     if (!is_safe_path_component(name) || !is_safe_path_component(newname))=
 {
         fuse_reply_err(req, EINVAL);
         return;
@@ -1405,6 +1435,11 @@ static void lo_unlink(fuse_req_t req, fuse_ino_t par=
ent, const char *name)
     struct lo_inode *inode;
     struct lo_data *lo =3D lo_data(req);
=20
+    if (is_empty(name)) {
+        fuse_reply_err(req, ENOENT);
+        return;
+    }
+
     if (!is_safe_path_component(name)) {
         fuse_reply_err(req, EINVAL);
         return;
--=20
2.26.2


