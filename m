Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B1439BD91
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:48:14 +0200 (CEST)
Received: from localhost ([::1]:46976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCzV-0005Dq-C6
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lpCTI-0007U6-NB
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:14:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lpCTE-00048M-IB
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622823291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LyVDru5WoJAQqOL7DugSQwA6Kif+/fn3qwq3l8rtPCo=;
 b=Y70rZZJuy4hHOoX4hpsqWxgdZ1zLYH/4XYcTAjOjvb99DtUXK6mUW8xKtLfkEcqZwn2eYj
 xEY2c+He+9Kj+ZSf8w6dDom2ehL9oDcISPh8Ixrm72h7TkcnNhP5TwTL7kD/Xy5Ahs18JQ
 jBz5/jiHncKVVrwDlgd5KeXKJYZQ3OE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-Pg0UtfAeMxOLTJ6om2pEWA-1; Fri, 04 Jun 2021 12:14:49 -0400
X-MC-Unique: Pg0UtfAeMxOLTJ6om2pEWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2F648049CB
 for <qemu-devel@nongnu.org>; Fri,  4 Jun 2021 16:14:48 +0000 (UTC)
Received: from localhost (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE93810023AC;
 Fri,  4 Jun 2021 16:14:41 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 6/9] virtiofsd: Add lo_inode.fhandle
Date: Fri,  4 Jun 2021 18:13:34 +0200
Message-Id: <20210604161337.16048-7-mreitz@redhat.com>
In-Reply-To: <20210604161337.16048-1-mreitz@redhat.com>
References: <20210604161337.16048-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This new field is an alternative to lo_inode.fd: Either of the two must
be set.  In case an O_PATH FD is needed for some lo_inode, it is either
taken from lo_inode.fd, if valid, or a temporary FD is opened with
open_by_handle_at().

Using a file handle instead of an FD has the advantage of keeping the
number of open file descriptors low.

Because open_by_handle_at() requires a mount FD (i.e. a non-O_PATH FD
opened on the filesystem to which the file handle refers), but every
lo_fhandle only has a mount ID (as returned by name_to_handle_at()), we
keep a hash map of such FDs in mount_fds (mapping ID to FD).
get_file_handle(), which is added by a later patch, will ensure that
every mount ID for which we have generated a handle has a corresponding
entry in mount_fds.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c      | 116 ++++++++++++++++++++++----
 tools/virtiofsd/passthrough_seccomp.c |   1 +
 2 files changed, 102 insertions(+), 15 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 3014e8baf8..e665575401 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -88,8 +88,25 @@ struct lo_key {
     uint64_t mnt_id;
 };
 
+struct lo_fhandle {
+    union {
+        struct file_handle handle;
+        char padding[sizeof(struct file_handle) + MAX_HANDLE_SZ];
+    };
+    int mount_id;
+};
+
+/* Maps mount IDs to an FD that we can pass to open_by_handle_at() */
+static GHashTable *mount_fds;
+pthread_rwlock_t mount_fds_lock = PTHREAD_RWLOCK_INITIALIZER;
+
 struct lo_inode {
+    /*
+     * Either of fd or fhandle must be set (i.e. >= 0 or non-NULL,
+     * respectively).
+     */
     int fd;
+    struct lo_fhandle *fhandle;
 
     /*
      * Atomic reference count for this object.  The nlookup field holds a
@@ -296,6 +313,44 @@ static int temp_fd_steal(TempFd *temp_fd)
     }
 }
 
+/**
+ * Open the given file handle with the given flags.
+ *
+ * The mount FD to pass to open_by_handle_at() is taken from the
+ * mount_fds hash map.
+ *
+ * On error, return -errno.
+ */
+static int open_file_handle(const struct lo_fhandle *fh, int flags)
+{
+    gpointer mount_fd_ptr;
+    int mount_fd;
+    bool found;
+    int ret;
+
+    ret = pthread_rwlock_rdlock(&mount_fds_lock);
+    if (ret) {
+        return -ret;
+    }
+
+    /* mount_fd == 0 is valid, so we need lookup_extended */
+    found = g_hash_table_lookup_extended(mount_fds,
+                                         GINT_TO_POINTER(fh->mount_id),
+                                         NULL, &mount_fd_ptr);
+    pthread_rwlock_unlock(&mount_fds_lock);
+    if (!found) {
+        return -EINVAL;
+    }
+    mount_fd = GPOINTER_TO_INT(mount_fd_ptr);
+
+    ret = open_by_handle_at(mount_fd, (struct file_handle *)&fh->handle, flags);
+    if (ret < 0) {
+        return -errno;
+    }
+
+    return ret;
+}
+
 /*
  * Load capng's state from our saved state if the current thread
  * hadn't previously been loaded.
@@ -602,7 +657,11 @@ static void lo_inode_put(struct lo_data *lo, struct lo_inode **inodep)
     *inodep = NULL;
 
     if (g_atomic_int_dec_and_test(&inode->refcount)) {
-        close(inode->fd);
+        if (inode->fd >= 0) {
+            close(inode->fd);
+        } else {
+            g_free(inode->fhandle);
+        }
         free(inode);
     }
 }
@@ -629,10 +688,25 @@ static struct lo_inode *lo_inode(fuse_req_t req, fuse_ino_t ino)
 
 static int lo_inode_fd(const struct lo_inode *inode, TempFd *tfd)
 {
-    *tfd = (TempFd) {
-        .fd = inode->fd,
-        .owned = false,
-    };
+    if (inode->fd >= 0) {
+        *tfd = (TempFd) {
+            .fd = inode->fd,
+            .owned = false,
+        };
+    } else {
+        int fd;
+
+        assert(inode->fhandle != NULL);
+        fd = open_file_handle(inode->fhandle, O_PATH);
+        if (fd < 0) {
+            return -errno;
+        }
+
+        *tfd = (TempFd) {
+            .fd = fd,
+            .owned = true,
+        };
+    }
 
     return 0;
 }
@@ -672,22 +746,32 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino, TempFd *tfd)
 static int lo_inode_open(const struct lo_data *lo, const struct lo_inode *inode,
                          int open_flags, TempFd *tfd)
 {
-    g_autofree char *fd_str = g_strdup_printf("%d", inode->fd);
+    g_autofree char *fd_str = NULL;
     int fd;
 
     if (!S_ISREG(inode->filetype) && !S_ISDIR(inode->filetype)) {
         return -EBADF;
     }
 
-    /*
-     * The file is a symlink so O_NOFOLLOW must be ignored. We checked earlier
-     * that the inode is not a special file but if an external process races
-     * with us then symlinks are traversed here. It is not possible to escape
-     * the shared directory since it is mounted as "/" though.
-     */
-    fd = openat(lo->proc_self_fd, fd_str, open_flags & ~O_NOFOLLOW);
-    if (fd < 0) {
-        return -errno;
+    if (inode->fd >= 0) {
+        /*
+         * The file is a symlink so O_NOFOLLOW must be ignored. We checked
+         * earlier that the inode is not a special file but if an external
+         * process races with us then symlinks are traversed here. It is not
+         * possible to escape the shared directory since it is mounted as "/"
+         * though.
+         */
+        fd_str = g_strdup_printf("%d", inode->fd);
+        fd = openat(lo->proc_self_fd, fd_str, open_flags & ~O_NOFOLLOW);
+        if (fd < 0) {
+            return -errno;
+        }
+    } else {
+        assert(inode->fhandle != NULL);
+        fd = open_file_handle(inode->fhandle, open_flags);
+        if (fd < 0) {
+            return fd;
+        }
     }
 
     *tfd = (TempFd) {
@@ -3911,6 +3995,8 @@ int main(int argc, char *argv[])
     lo.root.fuse_ino = FUSE_ROOT_ID;
     lo.cache = CACHE_AUTO;
 
+    mount_fds = g_hash_table_new(NULL, NULL);
+
     /*
      * Set up the ino map like this:
      * [0] Reserved (will not be used)
diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
index 62441cfcdb..e948f25ac1 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -77,6 +77,7 @@ static const int syscall_allowlist[] = {
     SCMP_SYS(statx),
     SCMP_SYS(open),
     SCMP_SYS(openat),
+    SCMP_SYS(open_by_handle_at),
     SCMP_SYS(ppoll),
     SCMP_SYS(prctl), /* TODO restrict to just PR_SET_NAME? */
     SCMP_SYS(preadv),
-- 
2.31.1


