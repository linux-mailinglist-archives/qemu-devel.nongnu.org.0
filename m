Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87848147272
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 21:14:50 +0100 (CET)
Received: from localhost ([::1]:33144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuisL-0004Nk-Lg
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 15:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42608)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufey-00069q-Mu
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufew-00007z-35
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23512
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufev-00007Y-WD
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pfYejLp3p2IfBeM0FrCsJccHwHgdomwifKJrQcOxA08=;
 b=PJjrDngJq3yKRLPDkrQyIhA42ZtxOQf7h5PlS+nRDwi5lIe6hPsDZRs5dxKbefcyJMZoj8
 ewq97TlZc/P1F0kdT49mf61s0yJuxY0V9Fvq8YrP6HegD/TZ8HJIPX9rcb67PuEyexiKK6
 GK2jUvHvoVejXjssKPQUiJhmmgoZmRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-OZFG5ZpcMcuFABXJgNhQWw-1; Thu, 23 Jan 2020 11:48:39 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA0CC802C82
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:48:38 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 422D528991;
 Thu, 23 Jan 2020 16:48:38 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 093/108] virtiofsd: introduce inode refcount to prevent
 use-after-free
Date: Thu, 23 Jan 2020 16:46:15 +0000
Message-Id: <20200123164630.91498-94-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: OZFG5ZpcMcuFABXJgNhQWw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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

If thread A is using an inode it must not be deleted by thread B when
processing a FUSE_FORGET request.

The FUSE protocol itself already has a counter called nlookup that is
used in FUSE_FORGET messages.  We cannot trust this counter since the
untrusted client can manipulate it via FUSE_FORGET messages.

Introduce a new refcount to keep inodes alive for the required lifespan.
lo_inode_put() must be called to release a reference.  FUSE's nlookup
counter holds exactly one reference so that the inode stays alive as
long as the client still wants to remember it.

Note that the lo_inode->is_symlink field is moved to avoid creating a
hole in the struct due to struct field alignment.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 169 ++++++++++++++++++++++++++-----
 1 file changed, 146 insertions(+), 23 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index e3a6d6b611..ab1613586e 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -97,7 +97,13 @@ struct lo_key {
=20
 struct lo_inode {
     int fd;
-    bool is_symlink;
+
+    /*
+     * Atomic reference count for this object.  The nlookup field holds a
+     * reference and release it when nlookup reaches 0.
+     */
+    gint refcount;
+
     struct lo_key key;
=20
     /*
@@ -116,6 +122,8 @@ struct lo_inode {
     fuse_ino_t fuse_ino;
     pthread_mutex_t plock_mutex;
     GHashTable *posix_locks; /* protected by lo_inode->plock_mutex */
+
+    bool is_symlink;
 };
=20
 struct lo_cred {
@@ -471,6 +479,23 @@ static ssize_t lo_add_inode_mapping(fuse_req_t req, st=
ruct lo_inode *inode)
     return elem - lo_data(req)->ino_map.elems;
 }
=20
+static void lo_inode_put(struct lo_data *lo, struct lo_inode **inodep)
+{
+    struct lo_inode *inode =3D *inodep;
+
+    if (!inode) {
+        return;
+    }
+
+    *inodep =3D NULL;
+
+    if (g_atomic_int_dec_and_test(&inode->refcount)) {
+        close(inode->fd);
+        free(inode);
+    }
+}
+
+/* Caller must release refcount using lo_inode_put() */
 static struct lo_inode *lo_inode(fuse_req_t req, fuse_ino_t ino)
 {
     struct lo_data *lo =3D lo_data(req);
@@ -478,6 +503,9 @@ static struct lo_inode *lo_inode(fuse_req_t req, fuse_i=
no_t ino)
=20
     pthread_mutex_lock(&lo->mutex);
     elem =3D lo_map_get(&lo->ino_map, ino);
+    if (elem) {
+        g_atomic_int_inc(&elem->inode->refcount);
+    }
     pthread_mutex_unlock(&lo->mutex);
=20
     if (!elem) {
@@ -487,10 +515,23 @@ static struct lo_inode *lo_inode(fuse_req_t req, fuse=
_ino_t ino)
     return elem->inode;
 }
=20
+/*
+ * TODO Remove this helper and force callers to hold an inode refcount unt=
il
+ * they are done with the fd.  This will be done in a later patch to make
+ * review easier.
+ */
 static int lo_fd(fuse_req_t req, fuse_ino_t ino)
 {
     struct lo_inode *inode =3D lo_inode(req, ino);
-    return inode ? inode->fd : -1;
+    int fd;
+
+    if (!inode) {
+        return -1;
+    }
+
+    fd =3D inode->fd;
+    lo_inode_put(lo_data(req), &inode);
+    return fd;
 }
=20
 static void lo_init(void *userdata, struct fuse_conn_info *conn)
@@ -545,6 +586,10 @@ static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
     fuse_reply_attr(req, &buf, lo->timeout);
 }
=20
+/*
+ * Increments parent->nlookup and caller must release refcount using
+ * lo_inode_put(&parent).
+ */
 static int lo_parent_and_name(struct lo_data *lo, struct lo_inode *inode,
                               char path[PATH_MAX], struct lo_inode **paren=
t)
 {
@@ -582,6 +627,7 @@ retry:
         p =3D &lo->root;
         pthread_mutex_lock(&lo->mutex);
         p->nlookup++;
+        g_atomic_int_inc(&p->refcount);
         pthread_mutex_unlock(&lo->mutex);
     } else {
         *last =3D '\0';
@@ -625,6 +671,7 @@ retry:
=20
 fail_unref:
     unref_inode_lolocked(lo, p, 1);
+    lo_inode_put(lo, &p);
 fail:
     if (retries) {
         retries--;
@@ -663,6 +710,7 @@ fallback:
     if (res !=3D -1) {
         res =3D utimensat(parent->fd, path, tv, AT_SYMLINK_NOFOLLOW);
         unref_inode_lolocked(lo, parent, 1);
+        lo_inode_put(lo, &parent);
     }
=20
     return res;
@@ -780,11 +828,13 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino=
, struct stat *attr,
             goto out_err;
         }
     }
+    lo_inode_put(lo, &inode);
=20
     return lo_getattr(req, ino, fi);
=20
 out_err:
     saverr =3D errno;
+    lo_inode_put(lo, &inode);
     fuse_reply_err(req, saverr);
 }
=20
@@ -801,6 +851,7 @@ static struct lo_inode *lo_find(struct lo_data *lo, str=
uct stat *st)
     if (p) {
         assert(p->nlookup > 0);
         p->nlookup++;
+        g_atomic_int_inc(&p->refcount);
     }
     pthread_mutex_unlock(&lo->mutex);
=20
@@ -820,6 +871,10 @@ static void posix_locks_value_destroy(gpointer data)
     free(plock);
 }
=20
+/*
+ * Increments nlookup and caller must release refcount using
+ * lo_inode_put(&parent).
+ */
 static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *nam=
e,
                         struct fuse_entry_param *e)
 {
@@ -827,7 +882,8 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t pare=
nt, const char *name,
     int res;
     int saverr;
     struct lo_data *lo =3D lo_data(req);
-    struct lo_inode *inode, *dir =3D lo_inode(req, parent);
+    struct lo_inode *inode =3D NULL;
+    struct lo_inode *dir =3D lo_inode(req, parent);
=20
     /*
      * name_to_handle_at() and open_by_handle_at() can reach here with fus=
e
@@ -868,6 +924,13 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t par=
ent, const char *name,
         }
=20
         inode->is_symlink =3D S_ISLNK(e->attr.st_mode);
+
+        /*
+         * One for the caller and one for nlookup (released in
+         * unref_inode_lolocked())
+         */
+        g_atomic_int_set(&inode->refcount, 2);
+
         inode->nlookup =3D 1;
         inode->fd =3D newfd;
         newfd =3D -1;
@@ -883,6 +946,8 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t pare=
nt, const char *name,
         pthread_mutex_unlock(&lo->mutex);
     }
     e->ino =3D inode->fuse_ino;
+    lo_inode_put(lo, &inode);
+    lo_inode_put(lo, &dir);
=20
     fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli\n", (unsigned long long)pa=
rent,
              name, (unsigned long long)e->ino);
@@ -894,6 +959,8 @@ out_err:
     if (newfd !=3D -1) {
         close(newfd);
     }
+    lo_inode_put(lo, &inode);
+    lo_inode_put(lo, &dir);
     return saverr;
 }
=20
@@ -991,6 +1058,7 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_=
t parent,
 {
     int res;
     int saverr;
+    struct lo_data *lo =3D lo_data(req);
     struct lo_inode *dir;
     struct fuse_entry_param e;
     struct lo_cred old =3D {};
@@ -1032,9 +1100,11 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_in=
o_t parent,
              name, (unsigned long long)e.ino);
=20
     fuse_reply_entry(req, &e);
+    lo_inode_put(lo, &dir);
     return;
=20
 out:
+    lo_inode_put(lo, &dir);
     fuse_reply_err(req, saverr);
 }
=20
@@ -1085,6 +1155,7 @@ fallback:
     if (res !=3D -1) {
         res =3D linkat(parent->fd, path, dfd, name, 0);
         unref_inode_lolocked(lo, parent, 1);
+        lo_inode_put(lo, &parent);
     }
=20
     return res;
@@ -1095,6 +1166,7 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, f=
use_ino_t parent,
 {
     int res;
     struct lo_data *lo =3D lo_data(req);
+    struct lo_inode *parent_inode;
     struct lo_inode *inode;
     struct fuse_entry_param e;
     int saverr;
@@ -1104,17 +1176,18 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino,=
 fuse_ino_t parent,
         return;
     }
=20
+    parent_inode =3D lo_inode(req, parent);
     inode =3D lo_inode(req, ino);
-    if (!inode) {
-        fuse_reply_err(req, EBADF);
-        return;
+    if (!parent_inode || !inode) {
+        errno =3D EBADF;
+        goto out_err;
     }
=20
     memset(&e, 0, sizeof(struct fuse_entry_param));
     e.attr_timeout =3D lo->timeout;
     e.entry_timeout =3D lo->timeout;
=20
-    res =3D linkat_empty_nofollow(lo, inode, lo_fd(req, parent), name);
+    res =3D linkat_empty_nofollow(lo, inode, parent_inode->fd, name);
     if (res =3D=3D -1) {
         goto out_err;
     }
@@ -1133,13 +1206,18 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino,=
 fuse_ino_t parent,
              name, (unsigned long long)e.ino);
=20
     fuse_reply_entry(req, &e);
+    lo_inode_put(lo, &parent_inode);
+    lo_inode_put(lo, &inode);
     return;
=20
 out_err:
     saverr =3D errno;
+    lo_inode_put(lo, &parent_inode);
+    lo_inode_put(lo, &inode);
     fuse_reply_err(req, saverr);
 }
=20
+/* Increments nlookup and caller must release refcount using lo_inode_put(=
) */
 static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
                                     const char *name)
 {
@@ -1176,6 +1254,7 @@ static void lo_rmdir(fuse_req_t req, fuse_ino_t paren=
t, const char *name)
=20
     fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
     unref_inode_lolocked(lo, inode, 1);
+    lo_inode_put(lo, &inode);
 }
=20
 static void lo_rename(fuse_req_t req, fuse_ino_t parent, const char *name,
@@ -1183,8 +1262,10 @@ static void lo_rename(fuse_req_t req, fuse_ino_t par=
ent, const char *name,
                       unsigned int flags)
 {
     int res;
-    struct lo_inode *oldinode;
-    struct lo_inode *newinode;
+    struct lo_inode *parent_inode;
+    struct lo_inode *newparent_inode;
+    struct lo_inode *oldinode =3D NULL;
+    struct lo_inode *newinode =3D NULL;
     struct lo_data *lo =3D lo_data(req);
=20
     if (!is_safe_path_component(name) || !is_safe_path_component(newname))=
 {
@@ -1192,6 +1273,13 @@ static void lo_rename(fuse_req_t req, fuse_ino_t par=
ent, const char *name,
         return;
     }
=20
+    parent_inode =3D lo_inode(req, parent);
+    newparent_inode =3D lo_inode(req, newparent);
+    if (!parent_inode || !newparent_inode) {
+        fuse_reply_err(req, EBADF);
+        goto out;
+    }
+
     oldinode =3D lookup_name(req, parent, name);
     newinode =3D lookup_name(req, newparent, newname);
=20
@@ -1204,8 +1292,8 @@ static void lo_rename(fuse_req_t req, fuse_ino_t pare=
nt, const char *name,
 #ifndef SYS_renameat2
         fuse_reply_err(req, EINVAL);
 #else
-        res =3D syscall(SYS_renameat2, lo_fd(req, parent), name,
-                       lo_fd(req, newparent), newname, flags);
+        res =3D syscall(SYS_renameat2, parent_inode->fd, name,
+                        newparent_inode->fd, newname, flags);
         if (res =3D=3D -1 && errno =3D=3D ENOSYS) {
             fuse_reply_err(req, EINVAL);
         } else {
@@ -1215,12 +1303,16 @@ static void lo_rename(fuse_req_t req, fuse_ino_t pa=
rent, const char *name,
         goto out;
     }
=20
-    res =3D renameat(lo_fd(req, parent), name, lo_fd(req, newparent), newn=
ame);
+    res =3D renameat(parent_inode->fd, name, newparent_inode->fd, newname)=
;
=20
     fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
 out:
     unref_inode_lolocked(lo, oldinode, 1);
     unref_inode_lolocked(lo, newinode, 1);
+    lo_inode_put(lo, &oldinode);
+    lo_inode_put(lo, &newinode);
+    lo_inode_put(lo, &parent_inode);
+    lo_inode_put(lo, &newparent_inode);
 }
=20
 static void lo_unlink(fuse_req_t req, fuse_ino_t parent, const char *name)
@@ -1244,6 +1336,7 @@ static void lo_unlink(fuse_req_t req, fuse_ino_t pare=
nt, const char *name)
=20
     fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
     unref_inode_lolocked(lo, inode, 1);
+    lo_inode_put(lo, &inode);
 }
=20
 static void unref_inode_lolocked(struct lo_data *lo, struct lo_inode *inod=
e,
@@ -1265,8 +1358,9 @@ static void unref_inode_lolocked(struct lo_data *lo, =
struct lo_inode *inode,
         g_hash_table_destroy(inode->posix_locks);
         pthread_mutex_destroy(&inode->plock_mutex);
         pthread_mutex_unlock(&lo->mutex);
-        close(inode->fd);
-        free(inode);
+
+        /* Drop our refcount from lo_do_lookup() */
+        lo_inode_put(lo, &inode);
     } else {
         pthread_mutex_unlock(&lo->mutex);
     }
@@ -1280,6 +1374,7 @@ static int unref_all_inodes_cb(gpointer key, gpointer=
 value, gpointer user_data)
     inode->nlookup =3D 0;
     lo_map_remove(&lo->ino_map, inode->fuse_ino);
     close(inode->fd);
+    lo_inode_put(lo, &inode); /* Drop our refcount from lo_do_lookup() */
=20
     return TRUE;
 }
@@ -1306,6 +1401,7 @@ static void lo_forget_one(fuse_req_t req, fuse_ino_t =
ino, uint64_t nlookup)
              (unsigned long long)nlookup);
=20
     unref_inode_lolocked(lo, inode, nlookup);
+    lo_inode_put(lo, &inode);
 }
=20
 static void lo_forget(fuse_req_t req, fuse_ino_t ino, uint64_t nlookup)
@@ -1537,6 +1633,7 @@ static void lo_do_readdir(fuse_req_t req, fuse_ino_t =
ino, size_t size,
     err =3D 0;
 error:
     lo_dirp_put(&d);
+    lo_inode_put(lo, &dinode);
=20
     /*
      * If there's an error, we can only signal it if we haven't stored
@@ -1595,6 +1692,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t pare=
nt, const char *name,
 {
     int fd;
     struct lo_data *lo =3D lo_data(req);
+    struct lo_inode *parent_inode;
     struct fuse_entry_param e;
     int err;
     struct lo_cred old =3D {};
@@ -1607,12 +1705,18 @@ static void lo_create(fuse_req_t req, fuse_ino_t pa=
rent, const char *name,
         return;
     }
=20
+    parent_inode =3D lo_inode(req, parent);
+    if (!parent_inode) {
+        fuse_reply_err(req, EBADF);
+        return;
+    }
+
     err =3D lo_change_cred(req, &old);
     if (err) {
         goto out;
     }
=20
-    fd =3D openat(lo_fd(req, parent), name, (fi->flags | O_CREAT) & ~O_NOF=
OLLOW,
+    fd =3D openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOL=
LOW,
                 mode);
     err =3D fd =3D=3D -1 ? errno : 0;
     lo_restore_cred(&old);
@@ -1625,8 +1729,8 @@ static void lo_create(fuse_req_t req, fuse_ino_t pare=
nt, const char *name,
         pthread_mutex_unlock(&lo->mutex);
         if (fh =3D=3D -1) {
             close(fd);
-            fuse_reply_err(req, ENOMEM);
-            return;
+            err =3D ENOMEM;
+            goto out;
         }
=20
         fi->fh =3D fh;
@@ -1639,6 +1743,8 @@ static void lo_create(fuse_req_t req, fuse_ino_t pare=
nt, const char *name,
     }
=20
 out:
+    lo_inode_put(lo, &parent_inode);
+
     if (err) {
         fuse_reply_err(req, err);
     } else {
@@ -1712,16 +1818,18 @@ static void lo_getlk(fuse_req_t req, fuse_ino_t ino=
, struct fuse_file_info *fi,
     plock =3D
         lookup_create_plock_ctx(lo, inode, fi->lock_owner, lock->l_pid, &r=
et);
     if (!plock) {
-        pthread_mutex_unlock(&inode->plock_mutex);
-        fuse_reply_err(req, ret);
-        return;
+        saverr =3D ret;
+        goto out;
     }
=20
     ret =3D fcntl(plock->fd, F_OFD_GETLK, lock);
     if (ret =3D=3D -1) {
         saverr =3D errno;
     }
+
+out:
     pthread_mutex_unlock(&inode->plock_mutex);
+    lo_inode_put(lo, &inode);
=20
     if (saverr) {
         fuse_reply_err(req, saverr);
@@ -1761,9 +1869,8 @@ static void lo_setlk(fuse_req_t req, fuse_ino_t ino, =
struct fuse_file_info *fi,
         lookup_create_plock_ctx(lo, inode, fi->lock_owner, lock->l_pid, &r=
et);
=20
     if (!plock) {
-        pthread_mutex_unlock(&inode->plock_mutex);
-        fuse_reply_err(req, ret);
-        return;
+        saverr =3D ret;
+        goto out;
     }
=20
     /* TODO: Is it alright to modify flock? */
@@ -1772,7 +1879,11 @@ static void lo_setlk(fuse_req_t req, fuse_ino_t ino,=
 struct fuse_file_info *fi,
     if (ret =3D=3D -1) {
         saverr =3D errno;
     }
+
+out:
     pthread_mutex_unlock(&inode->plock_mutex);
+    lo_inode_put(lo, &inode);
+
     fuse_reply_err(req, saverr);
 }
=20
@@ -1898,6 +2009,7 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, =
struct fuse_file_info *fi)
     pthread_mutex_unlock(&inode->plock_mutex);
=20
     res =3D close(dup(lo_fi_fd(req, fi)));
+    lo_inode_put(lo_data(req), &inode);
     fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
 }
=20
@@ -2115,11 +2227,14 @@ out_free:
     if (fd >=3D 0) {
         close(fd);
     }
+
+    lo_inode_put(lo, &inode);
     return;
=20
 out_err:
     saverr =3D errno;
 out:
+    lo_inode_put(lo, &inode);
     fuse_reply_err(req, saverr);
     goto out_free;
 }
@@ -2190,11 +2305,14 @@ out_free:
     if (fd >=3D 0) {
         close(fd);
     }
+
+    lo_inode_put(lo, &inode);
     return;
=20
 out_err:
     saverr =3D errno;
 out:
+    lo_inode_put(lo, &inode);
     fuse_reply_err(req, saverr);
     goto out_free;
 }
@@ -2243,6 +2361,8 @@ out:
     if (fd >=3D 0) {
         close(fd);
     }
+
+    lo_inode_put(lo, &inode);
     fuse_reply_err(req, saverr);
 }
=20
@@ -2289,6 +2409,8 @@ out:
     if (fd >=3D 0) {
         close(fd);
     }
+
+    lo_inode_put(lo, &inode);
     fuse_reply_err(req, saverr);
 }
=20
@@ -2671,6 +2793,7 @@ static void setup_root(struct lo_data *lo, struct lo_=
inode *root)
     root->key.ino =3D stat.st_ino;
     root->key.dev =3D stat.st_dev;
     root->nlookup =3D 2;
+    g_atomic_int_set(&root->refcount, 2);
 }
=20
 static guint lo_key_hash(gconstpointer key)
--=20
2.24.1


