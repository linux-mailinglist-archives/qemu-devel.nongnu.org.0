Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FC22A2FC3
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 17:26:39 +0100 (CET)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZcfG-0005wx-3W
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 11:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kZcYq-0007ev-Cn
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 11:20:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kZcYn-0007ZI-N0
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 11:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604333997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=np1wcj3Xrtf2RFaeSPyrqu5vbK7YYOVbRAU+EJELevE=;
 b=hB+7cjHrN18eQGkdtm4egpN8isPqG2yX86EiN13QgmdAV6Dvmfta+vs27OQtgdkToS1vDC
 gsMZGlmbRYFAcmh08zHg0C7+f8gvZ70/KGJWYo9LV5E3pYMfWKwR1hfiO5zEEFRUfebLxN
 MFPje9sSHpGDyCSLt9Im4PvkuE9NGSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-mT3p98M8OEi-mp5nmZDtbA-1; Mon, 02 Nov 2020 11:19:52 -0500
X-MC-Unique: mT3p98M8OEi-mp5nmZDtbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8A968030CE
 for <qemu-devel@nongnu.org>; Mon,  2 Nov 2020 16:19:44 +0000 (UTC)
Received: from localhost (unknown [10.40.194.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EEE55D9D2;
 Mon,  2 Nov 2020 16:19:43 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] virtiofsd: Add mount ID to the lo_inode key
Date: Mon,  2 Nov 2020 17:18:56 +0100
Message-Id: <20201102161859.156603-5-mreitz@redhat.com>
In-Reply-To: <20201102161859.156603-1-mreitz@redhat.com>
References: <20201102161859.156603-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 01:33:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Miklos Szeredi <mszeredi@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using st_dev is not sufficient to uniquely identify a mount: You can
mount the same device twice, but those are still separate trees, and
e.g. by mounting something else inside one of them, they may differ.

Using statx(), we can get a mount ID that uniquely identifies a mount.
If that is available, add it to the lo_inode key.

Most of this patch is taken from Miklos's mail here:
https://marc.info/?l=fuse-devel&m=160062521827983
(virtiofsd-use-mount-id.patch attachment)

Suggested-by: Miklos Szeredi <mszeredi@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c      | 95 ++++++++++++++++++++++++---
 tools/virtiofsd/passthrough_seccomp.c |  1 +
 2 files changed, 86 insertions(+), 10 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index a0beb986f3..34d107975f 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -94,6 +94,7 @@ struct lo_map {
 struct lo_key {
     ino_t ino;
     dev_t dev;
+    uint64_t mnt_id;
 };
 
 struct lo_inode {
@@ -166,6 +167,7 @@ struct lo_data {
     int readdirplus_set;
     int readdirplus_clear;
     int allow_direct_io;
+    bool use_statx;
     struct lo_inode root;
     GHashTable *inodes; /* protected by lo->mutex */
     struct lo_map ino_map; /* protected by lo->mutex */
@@ -219,7 +221,8 @@ static struct {
 /* That we loaded cap-ng in the current thread from the saved */
 static __thread bool cap_loaded = 0;
 
-static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st);
+static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
+                                uint64_t mnt_id);
 
 static int is_dot_or_dotdot(const char *name)
 {
@@ -741,12 +744,14 @@ out_err:
     fuse_reply_err(req, saverr);
 }
 
-static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st)
+static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
+                                uint64_t mnt_id)
 {
     struct lo_inode *p;
     struct lo_key key = {
         .ino = st->st_ino,
         .dev = st->st_dev,
+        .mnt_id = mnt_id,
     };
 
     pthread_mutex_lock(&lo->mutex);
@@ -774,6 +779,60 @@ static void posix_locks_value_destroy(gpointer data)
     free(plock);
 }
 
+static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
+                    struct stat *statbuf, int flags, uint64_t *mnt_id)
+{
+    int res;
+
+#if defined(CONFIG_STATX) && defined(STATX_MNT_ID)
+    if (lo->use_statx) {
+        struct statx statxbuf;
+
+        res = statx(dirfd, pathname, flags, STATX_BASIC_STATS | STATX_MNT_ID,
+                    &statxbuf);
+        if (!res) {
+            memset(statbuf, 0, sizeof(*statbuf));
+            statbuf->st_dev = makedev(statxbuf.stx_dev_major,
+                                      statxbuf.stx_dev_minor);
+            statbuf->st_ino = statxbuf.stx_ino;
+            statbuf->st_mode = statxbuf.stx_mode;
+            statbuf->st_nlink = statxbuf.stx_nlink;
+            statbuf->st_uid = statxbuf.stx_uid;
+            statbuf->st_gid = statxbuf.stx_gid;
+            statbuf->st_rdev = makedev(statxbuf.stx_rdev_major,
+                                       statxbuf.stx_rdev_minor);
+            statbuf->st_size = statxbuf.stx_size;
+            statbuf->st_blksize = statxbuf.stx_blksize;
+            statbuf->st_blocks = statxbuf.stx_blocks;
+            statbuf->st_atim.tv_sec = statxbuf.stx_atime.tv_sec;
+            statbuf->st_atim.tv_nsec = statxbuf.stx_atime.tv_nsec;
+            statbuf->st_mtim.tv_sec = statxbuf.stx_mtime.tv_sec;
+            statbuf->st_mtim.tv_nsec = statxbuf.stx_mtime.tv_nsec;
+            statbuf->st_ctim.tv_sec = statxbuf.stx_ctime.tv_sec;
+            statbuf->st_ctim.tv_nsec = statxbuf.stx_ctime.tv_nsec;
+
+            if (statxbuf.stx_mask & STATX_MNT_ID) {
+                *mnt_id = statxbuf.stx_mnt_id;
+            } else {
+                *mnt_id = 0;
+            }
+            return 0;
+        } else if (errno != ENOSYS) {
+            return -1;
+        }
+        lo->use_statx = false;
+        /* fallback */
+    }
+#endif
+    res = fstatat(dirfd, pathname, statbuf, flags);
+    if (res == -1) {
+        return -1;
+    }
+    *mnt_id = 0;
+
+    return 0;
+}
+
 /*
  * Increments nlookup and caller must release refcount using
  * lo_inode_put(&parent).
@@ -784,6 +843,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
     int newfd;
     int res;
     int saverr;
+    uint64_t mnt_id;
     struct lo_data *lo = lo_data(req);
     struct lo_inode *inode = NULL;
     struct lo_inode *dir = lo_inode(req, parent);
@@ -811,12 +871,13 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
         goto out_err;
     }
 
-    res = fstatat(newfd, "", &e->attr, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
+    res = do_statx(lo, newfd, "", &e->attr, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW,
+                   &mnt_id);
     if (res == -1) {
         goto out_err;
     }
 
-    inode = lo_find(lo, &e->attr);
+    inode = lo_find(lo, &e->attr, mnt_id);
     if (inode) {
         close(newfd);
     } else {
@@ -838,6 +899,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
         inode->fd = newfd;
         inode->key.ino = e->attr.st_ino;
         inode->key.dev = e->attr.st_dev;
+        inode->key.mnt_id = mnt_id;
         pthread_mutex_init(&inode->plock_mutex, NULL);
         inode->posix_locks = g_hash_table_new_full(
             g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
@@ -1090,15 +1152,23 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
                                     const char *name)
 {
     int res;
+    uint64_t mnt_id;
     struct stat attr;
+    struct lo_data *lo = lo_data(req);
+    struct lo_inode *dir = lo_inode(req, parent);
 
-    res = fstatat(lo_fd(req, parent), name, &attr,
-                  AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
+    if (!dir) {
+        return NULL;
+    }
+
+    res = do_statx(lo, dir->fd, name, &attr,
+                   AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);
+    lo_inode_put(lo, &dir);
     if (res == -1) {
         return NULL;
     }
 
-    return lo_find(lo_data(req), &attr);
+    return lo_find(lo, &attr, mnt_id);
 }
 
 static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
@@ -3266,6 +3336,7 @@ static void setup_root(struct lo_data *lo, struct lo_inode *root)
 {
     int fd, res;
     struct stat stat;
+    uint64_t mnt_id;
 
     fd = open("/", O_PATH);
     if (fd == -1) {
@@ -3273,7 +3344,8 @@ static void setup_root(struct lo_data *lo, struct lo_inode *root)
         exit(1);
     }
 
-    res = fstatat(fd, "", &stat, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
+    res = do_statx(lo, fd, "", &stat, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW,
+                   &mnt_id);
     if (res == -1) {
         fuse_log(FUSE_LOG_ERR, "fstatat(%s): %m\n", lo->source);
         exit(1);
@@ -3283,6 +3355,7 @@ static void setup_root(struct lo_data *lo, struct lo_inode *root)
     root->fd = fd;
     root->key.ino = stat.st_ino;
     root->key.dev = stat.st_dev;
+    root->key.mnt_id = mnt_id;
     root->nlookup = 2;
     g_atomic_int_set(&root->refcount, 2);
 }
@@ -3291,7 +3364,7 @@ static guint lo_key_hash(gconstpointer key)
 {
     const struct lo_key *lkey = key;
 
-    return (guint)lkey->ino + (guint)lkey->dev;
+    return (guint)lkey->ino + (guint)lkey->dev + (guint)lkey->mnt_id;
 }
 
 static gboolean lo_key_equal(gconstpointer a, gconstpointer b)
@@ -3299,7 +3372,7 @@ static gboolean lo_key_equal(gconstpointer a, gconstpointer b)
     const struct lo_key *la = a;
     const struct lo_key *lb = b;
 
-    return la->ino == lb->ino && la->dev == lb->dev;
+    return la->ino == lb->ino && la->dev == lb->dev && la->mnt_id == lb->mnt_id;
 }
 
 static void fuse_lo_data_cleanup(struct lo_data *lo)
@@ -3445,6 +3518,8 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
+    lo.use_statx = true;
+
     se = fuse_session_new(&args, &lo_oper, sizeof(lo_oper), &lo);
     if (se == NULL) {
         goto err_out1;
diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
index eb9af8265f..751e15fa39 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -76,6 +76,7 @@ static const int syscall_whitelist[] = {
     SCMP_SYS(mremap),
     SCMP_SYS(munmap),
     SCMP_SYS(newfstatat),
+    SCMP_SYS(statx),
     SCMP_SYS(open),
     SCMP_SYS(openat),
     SCMP_SYS(ppoll),
-- 
2.26.2


