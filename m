Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C25939BE4F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:16:38 +0200 (CEST)
Received: from localhost ([::1]:34632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDQz-0006au-Hi
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lpCTg-0007uG-BB
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:15:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lpCTe-0004Fy-8c
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622823317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aa+rfStaf8w5x2UOeKiIt+pggHRxPjdzsOaBqfTxIzI=;
 b=NEieSl4scMRRV/P34fi3/kB0gCEOvBcKv9nU6OZR8n2cKHbQh4QdG21x1dQo3tZn9Wl04k
 Z+OrrPbEtgzWTQOVP4NbkBLqYynF2mVzI3NqkVTkdOS1JVMAUUB5cldJqsgwsXmOqM+LQk
 YPpXuaA/HAKUgYzAj/cj9RgkAiWbwIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-ZqN_8vCzOOO2f9k_X6oyvw-1; Fri, 04 Jun 2021 12:15:15 -0400
X-MC-Unique: ZqN_8vCzOOO2f9k_X6oyvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0824DF8A0
 for <qemu-devel@nongnu.org>; Fri,  4 Jun 2021 16:15:14 +0000 (UTC)
Received: from localhost (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27B1939A66;
 Fri,  4 Jun 2021 16:15:08 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 9/9] virtiofsd: Add lazy lo_do_find()
Date: Fri,  4 Jun 2021 18:13:37 +0200
Message-Id: <20210604161337.16048-10-mreitz@redhat.com>
In-Reply-To: <20210604161337.16048-1-mreitz@redhat.com>
References: <20210604161337.16048-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
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

lo_find() right now takes two lookup keys for two maps, namely the file
handle for inodes_by_handle and the statx information for inodes_by_ids.
However, we only need the statx information if looking up the inode by
the file handle failed.

There are two callers of lo_find(): The first one, lo_do_lookup(), has
both keys anyway, so passing them does not incur any additional cost.
The second one, lookup_name(), though, needs to explicitly invoke
name_to_handle_at() (through get_file_handle()) and statx() (through
do_statx()).  We need to try to get a file handle as the primary key, so
we cannot get rid of get_file_handle(), but we only need the statx
information if looking up an inode by handle failed; so we can defer
that until the lookup has indeed failed.

To this end, replace lo_find()'s st/mnt_id parameters by a get_ids()
closure that is invoked to fill the lo_key struct if necessary.

Also, lo_find() is renamed to lo_do_find(), so we can add a new
lo_find() wrapper whose closure just initializes the lo_key from the
st/mnt_id parameters, just like the old lo_find() did.

lookup_name() directly calls lo_do_find() now and passes its own
closure, which performs the do_statx() call.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 93 ++++++++++++++++++++++++++------
 1 file changed, 76 insertions(+), 17 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index d01f9d3a59..ef10a3ace6 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1141,22 +1141,23 @@ out_err:
     fuse_reply_err(req, saverr);
 }
 
-static struct lo_inode *lo_find(struct lo_data *lo,
-                                const struct lo_fhandle *fhandle,
-                                struct stat *st, uint64_t mnt_id)
+/*
+ * get_ids() will be called to get the key for lo->inodes_by_ids if
+ * the lookup by file handle has failed.
+ */
+static struct lo_inode *lo_do_find(struct lo_data *lo,
+    const struct lo_fhandle *fhandle,
+    int (*get_ids)(struct lo_key *, const void *),
+    const void *get_ids_opaque)
 {
     struct lo_inode *p = NULL;
-    struct lo_key ids_key = {
-        .ino = st->st_ino,
-        .dev = st->st_dev,
-        .mnt_id = mnt_id,
-    };
+    struct lo_key ids_key;
 
     pthread_mutex_lock(&lo->mutex);
     if (fhandle) {
         p = g_hash_table_lookup(lo->inodes_by_handle, fhandle);
     }
-    if (!p) {
+    if (!p && get_ids(&ids_key, get_ids_opaque) == 0) {
         p = g_hash_table_lookup(lo->inodes_by_ids, &ids_key);
         /*
          * When we had to fall back to looking up an inode by its IDs,
@@ -1184,6 +1185,36 @@ static struct lo_inode *lo_find(struct lo_data *lo,
     return p;
 }
 
+struct lo_find_get_ids_key_opaque {
+    const struct stat *st;
+    uint64_t mnt_id;
+};
+
+static int lo_find_get_ids_key(struct lo_key *ids_key, const void *opaque)
+{
+    const struct lo_find_get_ids_key_opaque *stat_info = opaque;
+
+    *ids_key = (struct lo_key){
+        .ino = stat_info->st->st_ino,
+        .dev = stat_info->st->st_dev,
+        .mnt_id = stat_info->mnt_id,
+    };
+
+    return 0;
+}
+
+static struct lo_inode *lo_find(struct lo_data *lo,
+                                const struct lo_fhandle *fhandle,
+                                struct stat *st, uint64_t mnt_id)
+{
+    const struct lo_find_get_ids_key_opaque stat_info = {
+        .st = st,
+        .mnt_id = mnt_id,
+    };
+
+    return lo_do_find(lo, fhandle, lo_find_get_ids_key, &stat_info);
+}
+
 /* value_destroy_func for posix_locks GHashTable */
 static void posix_locks_value_destroy(gpointer data)
 {
@@ -1655,14 +1686,41 @@ out_err:
     fuse_reply_err(req, saverr);
 }
 
+struct lookup_name_get_ids_key_opaque {
+    struct lo_data *lo;
+    int parent_fd;
+    const char *name;
+};
+
+static int lookup_name_get_ids_key(struct lo_key *ids_key, const void *opaque)
+{
+    const struct lookup_name_get_ids_key_opaque *stat_params = opaque;
+    uint64_t mnt_id;
+    struct stat attr;
+    int res;
+
+    res = do_statx(stat_params->lo, stat_params->parent_fd, stat_params->name,
+                   &attr, AT_SYMLINK_NOFOLLOW, &mnt_id);
+    if (res < 0) {
+        return -errno;
+    }
+
+    *ids_key = (struct lo_key){
+        .ino = attr.st_ino,
+        .dev = attr.st_dev,
+        .mnt_id = mnt_id,
+    };
+
+    return 0;
+}
+
 /* Increments nlookup and caller must release refcount using lo_inode_put() */
 static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
                                     const char *name)
 {
     g_auto(TempFd) dir_fd = TEMP_FD_INIT;
     int res;
-    uint64_t mnt_id;
-    struct stat attr;
+    struct lookup_name_get_ids_key_opaque stat_params;
     struct lo_fhandle *fh;
     struct lo_data *lo = lo_data(req);
     struct lo_inode *dir = lo_inode(req, parent);
@@ -1680,13 +1738,14 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
     fh = get_file_handle(lo, dir_fd.fd, name);
     /* Ignore errors, this is just an optional key for the lookup */
 
-    res = do_statx(lo, dir_fd.fd, name, &attr, AT_SYMLINK_NOFOLLOW, &mnt_id);
-    lo_inode_put(lo, &dir);
-    if (res == -1) {
-        return NULL;
-    }
+    stat_params = (struct lookup_name_get_ids_key_opaque){
+        .lo = lo,
+        .parent_fd = dir_fd.fd,
+        .name = name,
+    };
 
-    inode = lo_find(lo, fh, &attr, mnt_id);
+    inode = lo_do_find(lo, fh, lookup_name_get_ids_key, &stat_params);
+    lo_inode_put(lo, &dir);
     g_free(fh);
 
     return inode;
-- 
2.31.1


