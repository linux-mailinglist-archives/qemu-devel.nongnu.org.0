Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DE32DE1C3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:07:40 +0100 (CET)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDbn-0008Ub-Ms
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCr-0003V7-Ej
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCp-0004dr-F5
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJ7iN2Wd/TAj11GFc1fQSlLu/L7967OExO8WiNPhE4w=;
 b=E9Pu+yAHxQmFtLkdydn8elqVtUOEIXOQzWKI9Q2xiZl6xpFSjSt1RI9/8L+xOSsAq/ml16
 6KIdFttMY6C3xT24bqkNqiEY79pzC4CPrMNZWb6/LRhg/NXvvxsTCyeqfBFWjsYpWj38kf
 BHpHbd9G5+RVe0X3bcZZrGzV6Cb55Og=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-TzdYQ_PwOh-zB4ShF2BWjw-1; Fri, 18 Dec 2020 05:41:48 -0500
X-MC-Unique: TzdYQ_PwOh-zB4ShF2BWjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F81F9CC23;
 Fri, 18 Dec 2020 10:41:47 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00CE960C15;
 Fri, 18 Dec 2020 10:41:44 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 08/15] virtiofsd: Disable posix_lock hash table if remote locks
 are not enabled
Date: Fri, 18 Dec 2020 10:41:10 +0000
Message-Id: <20201218104117.199096-9-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
References: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

If remote posix locks are not enabled (lo->posix_lock == false), then disable
code paths taken to initialize inode->posix_lock hash table and corresponding
destruction and search etc.

lo_getlk() and lo_setlk() have been modified to return ENOSYS if daemon
does not support posix lock but client still sends a lock/unlock request.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20201207183021.22752-3-vgoyal@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 51 +++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 80e62b1610..4f805cbb82 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -902,10 +902,11 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
         inode->key.ino = e->attr.st_ino;
         inode->key.dev = e->attr.st_dev;
         inode->key.mnt_id = mnt_id;
-        pthread_mutex_init(&inode->plock_mutex, NULL);
-        inode->posix_locks = g_hash_table_new_full(
-            g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
-
+        if (lo->posix_lock) {
+            pthread_mutex_init(&inode->plock_mutex, NULL);
+            inode->posix_locks = g_hash_table_new_full(
+                g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
+        }
         pthread_mutex_lock(&lo->mutex);
         inode->fuse_ino = lo_add_inode_mapping(req, inode);
         g_hash_table_insert(lo->inodes, &inode->key, inode);
@@ -1291,12 +1292,13 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
     if (!inode->nlookup) {
         lo_map_remove(&lo->ino_map, inode->fuse_ino);
         g_hash_table_remove(lo->inodes, &inode->key);
-        if (g_hash_table_size(inode->posix_locks)) {
-            fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
+        if (lo->posix_lock) {
+            if (g_hash_table_size(inode->posix_locks)) {
+                fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
+            }
+            g_hash_table_destroy(inode->posix_locks);
+            pthread_mutex_destroy(&inode->plock_mutex);
         }
-        g_hash_table_destroy(inode->posix_locks);
-        pthread_mutex_destroy(&inode->plock_mutex);
-
         /* Drop our refcount from lo_do_lookup() */
         lo_inode_put(lo, &inode);
     }
@@ -1772,6 +1774,11 @@ static void lo_getlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
              ino, fi->flags, fi->lock_owner, lock->l_type, lock->l_start,
              lock->l_len);
 
+    if (!lo->posix_lock) {
+        fuse_reply_err(req, ENOSYS);
+        return;
+    }
+
     inode = lo_inode(req, ino);
     if (!inode) {
         fuse_reply_err(req, EBADF);
@@ -1817,6 +1824,11 @@ static void lo_setlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
              ino, fi->flags, lock->l_type, lock->l_pid, fi->lock_owner, sleep,
              lock->l_whence, lock->l_start, lock->l_len);
 
+    if (!lo->posix_lock) {
+        fuse_reply_err(req, ENOSYS);
+        return;
+    }
+
     if (sleep) {
         fuse_reply_err(req, EOPNOTSUPP);
         return;
@@ -1941,6 +1953,7 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
     int res;
     (void)ino;
     struct lo_inode *inode;
+    struct lo_data *lo = lo_data(req);
 
     inode = lo_inode(req, ino);
     if (!inode) {
@@ -1949,12 +1962,14 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
     }
 
     /* An fd is going away. Cleanup associated posix locks */
-    pthread_mutex_lock(&inode->plock_mutex);
-    g_hash_table_remove(inode->posix_locks, GUINT_TO_POINTER(fi->lock_owner));
-    pthread_mutex_unlock(&inode->plock_mutex);
-
+    if (lo->posix_lock) {
+        pthread_mutex_lock(&inode->plock_mutex);
+        g_hash_table_remove(inode->posix_locks,
+            GUINT_TO_POINTER(fi->lock_owner));
+        pthread_mutex_unlock(&inode->plock_mutex);
+    }
     res = close(dup(lo_fi_fd(req, fi)));
-    lo_inode_put(lo_data(req), &inode);
+    lo_inode_put(lo, &inode);
     fuse_reply_err(req, res == -1 ? errno : 0);
 }
 
@@ -3380,9 +3395,11 @@ static void setup_root(struct lo_data *lo, struct lo_inode *root)
     root->key.mnt_id = mnt_id;
     root->nlookup = 2;
     g_atomic_int_set(&root->refcount, 2);
-    pthread_mutex_init(&root->plock_mutex, NULL);
-    root->posix_locks = g_hash_table_new_full(
-        g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
+    if (lo->posix_lock) {
+        pthread_mutex_init(&root->plock_mutex, NULL);
+        root->posix_locks = g_hash_table_new_full(
+            g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
+    }
 }
 
 static guint lo_key_hash(gconstpointer key)
-- 
2.29.2


