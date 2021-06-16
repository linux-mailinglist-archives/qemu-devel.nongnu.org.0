Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCDF3AA589
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:47:25 +0200 (CEST)
Received: from localhost ([::1]:60886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcRY-0005MW-Kb
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iangelak@redhat.com>)
 id 1ltbOG-00032r-V1
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:39:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iangelak@redhat.com>)
 id 1ltbOD-0000Sj-4T
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623872390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3hdiajH6QTmvgtgUAK6x5BiWcOL/cOc5zTfyqjiPLaA=;
 b=ce8wHlr0oEFUSwFg8GIbI4hoeTZmXycmIAv7V32ZtwuYpraw8A6cYte06mqPBEswWBAjXB
 FHJ+lMc6O8Ze4B10YMbO0jJCHJI5kxCxXu6dW+eRHM+1RGcY5YlNyvx8NbJqnvnreXOh3q
 dk2l/BWivThwhpm9Dv/vS76GMYSqAoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-maJoKjJzONyIXyeLrTP-tw-1; Wed, 16 Jun 2021 15:39:48 -0400
X-MC-Unique: maJoKjJzONyIXyeLrTP-tw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 017061923764
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 19:39:48 +0000 (UTC)
Received: from iangelak.remote.csb (ovpn-113-44.rdu2.redhat.com [10.10.113.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BAC360BF1;
 Wed, 16 Jun 2021 19:39:47 +0000 (UTC)
From: Ioannis Angelakopoulos <iangelak@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 1/6] virtiofsd: Release file locks using F_UNLCK
Date: Wed, 16 Jun 2021 15:39:16 -0400
Message-Id: <20210616193921.608720-2-iangelak@redhat.com>
In-Reply-To: <20210616193921.608720-1-iangelak@redhat.com>
References: <20210616193921.608720-1-iangelak@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=iangelak@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=iangelak@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Jun 2021 16:41:47 -0400
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
Cc: iangelak@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

We are emulating posix locks for guest using open file description locks
in virtiofsd. When any of the fd is closed in guest, we find associated
OFD lock fd (if there is one) and close it to release all the locks.

Assumption here is that there is no other thread using lo_inode_plock
structure or plock->fd, hence it is safe to do so.

But now we are about to introduce blocking variant of locks (SETLKW),
and that means we might be waiting to a lock to be available and
using plock->fd. And that means there are still users of plock
structure.

So release locks using fcntl(SETLK, F_UNLCK) instead and plock will
be freed later.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 49c21fd855..f2fa9d95bb 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -968,6 +968,14 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
     return 0;
 }
 
+static void posix_locks_value_destroy(gpointer data)
+{
+    struct lo_inode_plock *plock = data;
+
+    close(plock->fd);
+    free(plock);
+}
+
 /*
  * Increments nlookup on the inode on success. unref_inode_lolocked() must be
  * called eventually to decrement nlookup again. If inodep is non-NULL, the
@@ -1473,9 +1481,6 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
         lo_map_remove(&lo->ino_map, inode->fuse_ino);
         g_hash_table_remove(lo->inodes, &inode->key);
         if (lo->posix_lock) {
-            if (g_hash_table_size(inode->posix_locks)) {
-                fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
-            }
             g_hash_table_destroy(inode->posix_locks);
             pthread_mutex_destroy(&inode->plock_mutex);
         }
@@ -1974,6 +1979,9 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
     plock =
         g_hash_table_lookup(inode->posix_locks, GUINT_TO_POINTER(lock_owner));
 
+    fuse_log(FUSE_LOG_DEBUG, "lookup_create_plock_ctx():"
+             " Inserted element in posix_locks hash table"
+             " with value pointer %p\n", plock);
     if (plock) {
         return plock;
     }
@@ -2182,6 +2190,8 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
     (void)ino;
     struct lo_inode *inode;
     struct lo_data *lo = lo_data(req);
+    struct lo_inode_plock *plock;
+    struct flock flock;
 
     inode = lo_inode(req, ino);
     if (!inode) {
@@ -2198,8 +2208,22 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
     /* An fd is going away. Cleanup associated posix locks */
     if (lo->posix_lock) {
         pthread_mutex_lock(&inode->plock_mutex);
-        g_hash_table_remove(inode->posix_locks,
+        plock = g_hash_table_lookup(inode->posix_locks,
             GUINT_TO_POINTER(fi->lock_owner));
+
+        if (plock) {
+            /*
+             * An fd is being closed. For posix locks, this means
+             * drop all the associated locks.
+             */
+            memset(&flock, 0, sizeof(struct flock));
+            flock.l_type = F_UNLCK;
+            flock.l_whence = SEEK_SET;
+            /* Unlock whole file */
+            flock.l_start = flock.l_len = 0;
+            fcntl(plock->fd, F_OFD_SETLK, &flock);
+        }
+
         pthread_mutex_unlock(&inode->plock_mutex);
     }
     res = close(dup(lo_fi_fd(req, fi)));
-- 
2.27.0


