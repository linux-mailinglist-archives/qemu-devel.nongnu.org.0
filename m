Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D47A14718A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:13:27 +0100 (CET)
Received: from localhost ([::1]:35392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuhuv-0007YV-Mi
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:13:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufel-0005xr-PV
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufej-0008Al-RY
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55639
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufej-0008AC-On
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SS8/Hoivqb5xN70xcmEVb9n/1AGWeZGsFBcy+kDz9cE=;
 b=guOEzbT6qvGOkm6P/d9K09CKEjCinLaxXY0mEa7l3msJUBfBB9TgvgbwTItZsgiwc/wcOj
 IgoaYHUhzgCDKKe00ZMvxH3qiUBssl2FI1cscrePfmltXEDQpPZOGsma+WEYK+eUFiDE8a
 nnaIueVSUEpyDq1ItdwKzNR8TKFejeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-Vpcp6Z0ePbuwb05aWpInhw-1; Thu, 23 Jan 2020 11:48:31 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 038039277F
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:48:31 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5229E28991;
 Thu, 23 Jan 2020 16:48:30 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 085/108] virtiofsd: Support remote posix locks
Date: Thu, 23 Jan 2020 16:46:07 +0000
Message-Id: <20200123164630.91498-86-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Vpcp6Z0ePbuwb05aWpInhw-1
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

From: Vivek Goyal <vgoyal@redhat.com>

Doing posix locks with-in guest kernel are not sufficient if a file/dir
is being shared by multiple guests. So we need the notion of daemon doing
the locks which are visible to rest of the guests.

Given posix locks are per process, one can not call posix lock API on host,
otherwise bunch of basic posix locks properties are broken. For example,
If two processes (A and B) in guest open the file and take locks on differe=
nt
sections of file, if one of the processes closes the fd, it will close
fd on virtiofsd and all posix locks on file will go away. This means if
process A closes the fd, then locks of process B will go away too.

Similar other problems exist too.

This patch set tries to emulate posix locks while using open file
description locks provided on Linux.

Daemon provides two options (-o posix_lock, -o no_posix_lock) to enable
or disable posix locking in daemon. By default it is enabled.

There are few issues though.

- GETLK() returns pid of process holding lock. As we are emulating locks
  using OFD, and these locks are not per process and don't return pid
  of process, so GETLK() in guest does not reuturn process pid.

- As of now only F_SETLK is supported and not F_SETLKW. We can't block
  the thread in virtiofsd for arbitrary long duration as there is only
  one thread serving the queue. That means unlock request will not make
  it to daemon and F_SETLKW will block infinitely and bring virtio-fs
  to a halt. This is a solvable problem though and will require significant
  changes in virtiofsd and kernel. Left as a TODO item for now.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Reviewed-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/helper.c         |   3 +
 tools/virtiofsd/passthrough_ll.c | 189 +++++++++++++++++++++++++++++++
 2 files changed, 192 insertions(+)

diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index 567202444a..33749bfcb7 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -156,6 +156,9 @@ void fuse_cmdline_help(void)
            "                               allowed (default: 10)\n"
            "    -o norace                  disable racy fallback\n"
            "                               default: false\n"
+           "    -o posix_lock|no_posix_lock\n"
+           "                               enable/disable remote posix loc=
k\n"
+           "                               default: posix_lock\n"
            "    -o readdirplus|no_readdirplus\n"
            "                               enable/disable readirplus\n"
            "                               default: readdirplus except wit=
h "
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 05b5f898db..9414935b52 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -67,6 +67,12 @@
 #include "passthrough_helpers.h"
 #include "seccomp.h"
=20
+/* Keep track of inode posix locks for each owner. */
+struct lo_inode_plock {
+    uint64_t lock_owner;
+    int fd; /* fd for OFD locks */
+};
+
 struct lo_map_elem {
     union {
         struct lo_inode *inode;
@@ -95,6 +101,8 @@ struct lo_inode {
     struct lo_key key;
     uint64_t refcount; /* protected by lo->mutex */
     fuse_ino_t fuse_ino;
+    pthread_mutex_t plock_mutex;
+    GHashTable *posix_locks; /* protected by lo_inode->plock_mutex */
 };
=20
 struct lo_cred {
@@ -114,6 +122,7 @@ struct lo_data {
     int norace;
     int writeback;
     int flock;
+    int posix_lock;
     int xattr;
     char *source;
     double timeout;
@@ -137,6 +146,8 @@ static const struct fuse_opt lo_opts[] =3D {
     { "source=3D%s", offsetof(struct lo_data, source), 0 },
     { "flock", offsetof(struct lo_data, flock), 1 },
     { "no_flock", offsetof(struct lo_data, flock), 0 },
+    { "posix_lock", offsetof(struct lo_data, posix_lock), 1 },
+    { "no_posix_lock", offsetof(struct lo_data, posix_lock), 0 },
     { "xattr", offsetof(struct lo_data, xattr), 1 },
     { "no_xattr", offsetof(struct lo_data, xattr), 0 },
     { "timeout=3D%lf", offsetof(struct lo_data, timeout), 0 },
@@ -485,6 +496,17 @@ static void lo_init(void *userdata, struct fuse_conn_i=
nfo *conn)
         fuse_log(FUSE_LOG_DEBUG, "lo_init: activating flock locks\n");
         conn->want |=3D FUSE_CAP_FLOCK_LOCKS;
     }
+
+    if (conn->capable & FUSE_CAP_POSIX_LOCKS) {
+        if (lo->posix_lock) {
+            fuse_log(FUSE_LOG_DEBUG, "lo_init: activating posix locks\n");
+            conn->want |=3D FUSE_CAP_POSIX_LOCKS;
+        } else {
+            fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling posix locks\n");
+            conn->want &=3D ~FUSE_CAP_POSIX_LOCKS;
+        }
+    }
+
     if ((lo->cache =3D=3D CACHE_NONE && !lo->readdirplus_set) ||
         lo->readdirplus_clear) {
         fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling readdirplus\n");
@@ -772,6 +794,19 @@ static struct lo_inode *lo_find(struct lo_data *lo, st=
ruct stat *st)
     return p;
 }
=20
+/* value_destroy_func for posix_locks GHashTable */
+static void posix_locks_value_destroy(gpointer data)
+{
+    struct lo_inode_plock *plock =3D data;
+
+    /*
+     * We had used open() for locks and had only one fd. So
+     * closing this fd should release all OFD locks.
+     */
+    close(plock->fd);
+    free(plock);
+}
+
 static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *nam=
e,
                         struct fuse_entry_param *e)
 {
@@ -825,6 +860,9 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t pare=
nt, const char *name,
         newfd =3D -1;
         inode->key.ino =3D e->attr.st_ino;
         inode->key.dev =3D e->attr.st_dev;
+        pthread_mutex_init(&inode->plock_mutex, NULL);
+        inode->posix_locks =3D g_hash_table_new_full(
+            g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy=
);
=20
         pthread_mutex_lock(&lo->mutex);
         inode->fuse_ino =3D lo_add_inode_mapping(req, inode);
@@ -1160,6 +1198,11 @@ static void unref_inode_lolocked(struct lo_data *lo,=
 struct lo_inode *inode,
     if (!inode->refcount) {
         lo_map_remove(&lo->ino_map, inode->fuse_ino);
         g_hash_table_remove(lo->inodes, &inode->key);
+        if (g_hash_table_size(inode->posix_locks)) {
+            fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
+        }
+        g_hash_table_destroy(inode->posix_locks);
+        pthread_mutex_destroy(&inode->plock_mutex);
         pthread_mutex_unlock(&lo->mutex);
         close(inode->fd);
         free(inode);
@@ -1516,6 +1559,136 @@ out:
     }
 }
=20
+/* Should be called with inode->plock_mutex held */
+static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
+                                                      struct lo_inode *ino=
de,
+                                                      uint64_t lock_owner,
+                                                      pid_t pid, int *err)
+{
+    struct lo_inode_plock *plock;
+    char procname[64];
+    int fd;
+
+    plock =3D
+        g_hash_table_lookup(inode->posix_locks, GUINT_TO_POINTER(lock_owne=
r));
+
+    if (plock) {
+        return plock;
+    }
+
+    plock =3D malloc(sizeof(struct lo_inode_plock));
+    if (!plock) {
+        *err =3D ENOMEM;
+        return NULL;
+    }
+
+    /* Open another instance of file which can be used for ofd locks. */
+    sprintf(procname, "%i", inode->fd);
+
+    /* TODO: What if file is not writable? */
+    fd =3D openat(lo->proc_self_fd, procname, O_RDWR);
+    if (fd =3D=3D -1) {
+        *err =3D errno;
+        free(plock);
+        return NULL;
+    }
+
+    plock->lock_owner =3D lock_owner;
+    plock->fd =3D fd;
+    g_hash_table_insert(inode->posix_locks, GUINT_TO_POINTER(plock->lock_o=
wner),
+                        plock);
+    return plock;
+}
+
+static void lo_getlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info=
 *fi,
+                     struct flock *lock)
+{
+    struct lo_data *lo =3D lo_data(req);
+    struct lo_inode *inode;
+    struct lo_inode_plock *plock;
+    int ret, saverr =3D 0;
+
+    fuse_log(FUSE_LOG_DEBUG,
+             "lo_getlk(ino=3D%" PRIu64 ", flags=3D%d)"
+             " owner=3D0x%lx, l_type=3D%d l_start=3D0x%lx"
+             " l_len=3D0x%lx\n",
+             ino, fi->flags, fi->lock_owner, lock->l_type, lock->l_start,
+             lock->l_len);
+
+    inode =3D lo_inode(req, ino);
+    if (!inode) {
+        fuse_reply_err(req, EBADF);
+        return;
+    }
+
+    pthread_mutex_lock(&inode->plock_mutex);
+    plock =3D
+        lookup_create_plock_ctx(lo, inode, fi->lock_owner, lock->l_pid, &r=
et);
+    if (!plock) {
+        pthread_mutex_unlock(&inode->plock_mutex);
+        fuse_reply_err(req, ret);
+        return;
+    }
+
+    ret =3D fcntl(plock->fd, F_OFD_GETLK, lock);
+    if (ret =3D=3D -1) {
+        saverr =3D errno;
+    }
+    pthread_mutex_unlock(&inode->plock_mutex);
+
+    if (saverr) {
+        fuse_reply_err(req, saverr);
+    } else {
+        fuse_reply_lock(req, lock);
+    }
+}
+
+static void lo_setlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info=
 *fi,
+                     struct flock *lock, int sleep)
+{
+    struct lo_data *lo =3D lo_data(req);
+    struct lo_inode *inode;
+    struct lo_inode_plock *plock;
+    int ret, saverr =3D 0;
+
+    fuse_log(FUSE_LOG_DEBUG,
+             "lo_setlk(ino=3D%" PRIu64 ", flags=3D%d)"
+             " cmd=3D%d pid=3D%d owner=3D0x%lx sleep=3D%d l_whence=3D%d"
+             " l_start=3D0x%lx l_len=3D0x%lx\n",
+             ino, fi->flags, lock->l_type, lock->l_pid, fi->lock_owner, sl=
eep,
+             lock->l_whence, lock->l_start, lock->l_len);
+
+    if (sleep) {
+        fuse_reply_err(req, EOPNOTSUPP);
+        return;
+    }
+
+    inode =3D lo_inode(req, ino);
+    if (!inode) {
+        fuse_reply_err(req, EBADF);
+        return;
+    }
+
+    pthread_mutex_lock(&inode->plock_mutex);
+    plock =3D
+        lookup_create_plock_ctx(lo, inode, fi->lock_owner, lock->l_pid, &r=
et);
+
+    if (!plock) {
+        pthread_mutex_unlock(&inode->plock_mutex);
+        fuse_reply_err(req, ret);
+        return;
+    }
+
+    /* TODO: Is it alright to modify flock? */
+    lock->l_pid =3D 0;
+    ret =3D fcntl(plock->fd, F_OFD_SETLK, lock);
+    if (ret =3D=3D -1) {
+        saverr =3D errno;
+    }
+    pthread_mutex_unlock(&inode->plock_mutex);
+    fuse_reply_err(req, saverr);
+}
+
 static void lo_fsyncdir(fuse_req_t req, fuse_ino_t ino, int datasync,
                         struct fuse_file_info *fi)
 {
@@ -1617,6 +1790,19 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino,=
 struct fuse_file_info *fi)
 {
     int res;
     (void)ino;
+    struct lo_inode *inode;
+
+    inode =3D lo_inode(req, ino);
+    if (!inode) {
+        fuse_reply_err(req, EBADF);
+        return;
+    }
+
+    /* An fd is going away. Cleanup associated posix locks */
+    pthread_mutex_lock(&inode->plock_mutex);
+    g_hash_table_remove(inode->posix_locks, GUINT_TO_POINTER(fi->lock_owne=
r));
+    pthread_mutex_unlock(&inode->plock_mutex);
+
     res =3D close(dup(lo_fi_fd(req, fi)));
     fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
 }
@@ -2080,6 +2266,8 @@ static struct fuse_lowlevel_ops lo_oper =3D {
     .releasedir =3D lo_releasedir,
     .fsyncdir =3D lo_fsyncdir,
     .create =3D lo_create,
+    .getlk =3D lo_getlk,
+    .setlk =3D lo_setlk,
     .open =3D lo_open,
     .release =3D lo_release,
     .flush =3D lo_flush,
@@ -2434,6 +2622,7 @@ int main(int argc, char *argv[])
     struct lo_data lo =3D {
         .debug =3D 0,
         .writeback =3D 0,
+        .posix_lock =3D 1,
         .proc_self_fd =3D -1,
     };
     struct lo_map_elem *root_elem;
--=20
2.24.1


