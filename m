Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E617C40D515
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 10:51:48 +0200 (CEST)
Received: from localhost ([::1]:60820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQn7U-0002IF-03
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 04:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmyN-0006Hp-24
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:42:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmyK-0005Dj-VM
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631781740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KR5b2ReeX11MFXGPtz6M0FxMB5Scw4Jcz/8eoKEkbKA=;
 b=g5h4PPZZ9zOw7yQOgO77eHiJ298sOGjitUh92Y3G/BpxDf6/W4EYkKFvxnf1l7IUICd68h
 97FDKAepP7552GymDVA+j0rmEyzRr/B99fgRtldhCgg2d1EZyoU8FS/iAksYrNPxHuZ6DR
 weSgWFIAv/HcgpSqxr+w3drQpvElhs0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-4Vxk5OxdMuirUGMIIqySow-1; Thu, 16 Sep 2021 04:42:19 -0400
X-MC-Unique: 4Vxk5OxdMuirUGMIIqySow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E3DC802934
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:42:18 +0000 (UTC)
Received: from localhost (unknown [10.39.192.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B51895D9CA;
 Thu, 16 Sep 2021 08:42:10 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v4 10/12] virtiofsd: Add inodes_by_handle hash table
Date: Thu, 16 Sep 2021 10:40:43 +0200
Message-Id: <20210916084045.31684-11-hreitz@redhat.com>
In-Reply-To: <20210916084045.31684-1-hreitz@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, lo_inode.fhandle is always NULL and so always keep an O_PATH
FD in lo_inode.fd.  Therefore, when the respective inode is unlinked,
its inode ID will remain in use until we drop our lo_inode (and
lo_inode_put() thus closes the FD).  Therefore, lo_find() can safely use
the inode ID as an lo_inode key, because any inode with an inode ID we
find in lo_data.inodes (on the same filesystem) must be the exact same
file.

This will change when we start setting lo_inode.fhandle so we do not
have to keep an O_PATH FD open.  Then, unlinking such an inode will
immediately remove it, so its ID can then be reused by newly created
files, even while the lo_inode object is still there[1].

So creating a new file can then reuse the old file's inode ID, and
looking up the new file would lead to us finding the old file's
lo_inode, which is not ideal.

Luckily, just as file handles cause this problem, they also solve it:  A
file handle contains a generation ID, which changes when an inode ID is
reused, so the new file can be distinguished from the old one.  So all
we need to do is to add a second map besides lo_data.inodes that maps
file handles to lo_inodes, namely lo_data.inodes_by_handle.  For
clarity, lo_data.inodes is renamed to lo_data.inodes_by_ids.

Unfortunately, we cannot rely on being able to generate file handles
every time.  Therefore, we still enter every lo_inode object into
inodes_by_ids, but having an entry in inodes_by_handle is optional.  A
potential inodes_by_handle entry then has precedence, the inodes_by_ids
entry is just a fallback.

Note that we do not generate lo_fhandle objects yet, and so we also do
not enter anything into the inodes_by_handle map yet.  Also, all lookups
skip that map.  We might manually create file handles with some code
that is immediately removed by the next patch again, but that would
break the assumption in lo_find() that every lo_inode with a non-NULL
.fhandle must have an entry in inodes_by_handle and vice versa.  So we
leave actually using the inodes_by_handle map for the next patch.

[1] If some application in the guest still has the file open, there is
going to be a corresponding FD mapping in lo_data.fd_map.  In such a
case, the inode will only go away once every application in the guest
has closed it.  The problem described only applies to cases where the
guest does not have the file open, and it is just in the dentry cache,
basically.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 81 +++++++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 16 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index bd8fc922ea..b7d6aa7f9d 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -186,7 +186,8 @@ struct lo_data {
     int announce_submounts;
     bool use_statx;
     struct lo_inode root;
-    GHashTable *inodes; /* protected by lo->mutex */
+    GHashTable *inodes_by_ids; /* protected by lo->mutex */
+    GHashTable *inodes_by_handle; /* protected by lo->mutex */
     struct lo_map ino_map; /* protected by lo->mutex */
     struct lo_map dirp_map; /* protected by lo->mutex */
     struct lo_map fd_map; /* protected by lo->mutex */
@@ -275,8 +276,9 @@ static struct {
 /* That we loaded cap-ng in the current thread from the saved */
 static __thread bool cap_loaded = 0;
 
-static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
-                                uint64_t mnt_id);
+static struct lo_inode *lo_find(struct lo_data *lo,
+                                const struct lo_fhandle *fhandle,
+                                struct stat *st, uint64_t mnt_id);
 static int xattr_map_client(const struct lo_data *lo, const char *client_name,
                             char **out_name);
 
@@ -1143,18 +1145,40 @@ out_err:
     fuse_reply_err(req, saverr);
 }
 
-static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
-                                uint64_t mnt_id)
+static struct lo_inode *lo_find(struct lo_data *lo,
+                                const struct lo_fhandle *fhandle,
+                                struct stat *st, uint64_t mnt_id)
 {
-    struct lo_inode *p;
-    struct lo_key key = {
+    struct lo_inode *p = NULL;
+    struct lo_key ids_key = {
         .ino = st->st_ino,
         .dev = st->st_dev,
         .mnt_id = mnt_id,
     };
 
     pthread_mutex_lock(&lo->mutex);
-    p = g_hash_table_lookup(lo->inodes, &key);
+    if (fhandle) {
+        p = g_hash_table_lookup(lo->inodes_by_handle, fhandle);
+    }
+    if (!p) {
+        p = g_hash_table_lookup(lo->inodes_by_ids, &ids_key);
+        /*
+         * When we had to fall back to looking up an inode by its
+         * inode ID, ensure that we hit an entry that has a valid file
+         * descriptor.  Having an FD open means that the inode cannot
+         * really be deleted until the FD is closed, so that the inode
+         * ID remains valid until we evict our lo_inode.
+         * With no FD open (and just a file handle), the inode can be
+         * deleted while we still have our lo_inode, and so the inode
+         * ID may be reused by a completely different new inode.  We
+         * then must look up the lo_inode by file handle, because this
+         * handle contains a generation ID to differentiate between
+         * the old and the new inode.
+         */
+        if (p && p->fd == -1) {
+            p = NULL;
+        }
+    }
     if (p) {
         assert(p->nlookup > 0);
         p->nlookup++;
@@ -1294,7 +1318,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
         e->attr_flags |= FUSE_ATTR_SUBMOUNT;
     }
 
-    inode = lo_find(lo, &e->attr, mnt_id);
+    inode = lo_find(lo, NULL, &e->attr, mnt_id);
     if (inode) {
         close(newfd);
     } else {
@@ -1324,7 +1348,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
         }
         pthread_mutex_lock(&lo->mutex);
         inode->fuse_ino = lo_add_inode_mapping(req, inode);
-        g_hash_table_insert(lo->inodes, &inode->key, inode);
+        g_hash_table_insert(lo->inodes_by_ids, &inode->key, inode);
         pthread_mutex_unlock(&lo->mutex);
     }
     e->ino = inode->fuse_ino;
@@ -1690,7 +1714,7 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
         goto out;
     }
 
-    inode = lo_find(lo, &attr, mnt_id);
+    inode = lo_find(lo, NULL, &attr, mnt_id);
 
 out:
     lo_inode_put(lo, &dir);
@@ -1857,7 +1881,7 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
     inode->nlookup -= n;
     if (!inode->nlookup) {
         lo_map_remove(&lo->ino_map, inode->fuse_ino);
-        g_hash_table_remove(lo->inodes, &inode->key);
+        g_hash_table_remove(lo->inodes_by_ids, &inode->key);
         if (lo->posix_lock) {
             if (g_hash_table_size(inode->posix_locks)) {
                 fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
@@ -3700,7 +3724,7 @@ static void lo_destroy(void *userdata)
         GHashTableIter iter;
         gpointer key, value;
 
-        g_hash_table_iter_init(&iter, lo->inodes);
+        g_hash_table_iter_init(&iter, lo->inodes_by_ids);
         if (!g_hash_table_iter_next(&iter, &key, &value)) {
             break;
         }
@@ -4264,10 +4288,34 @@ static gboolean lo_key_equal(gconstpointer a, gconstpointer b)
     return la->ino == lb->ino && la->dev == lb->dev && la->mnt_id == lb->mnt_id;
 }
 
+static guint lo_fhandle_hash(gconstpointer key)
+{
+    const struct lo_fhandle *fh = key;
+    guint hash;
+    size_t i;
+
+    /* Basically g_str_hash() */
+    hash = 5381;
+    for (i = 0; i < sizeof(fh->padding); i++) {
+        hash += hash * 33 + (unsigned char)fh->padding[i];
+    }
+    hash += hash * 33 + fh->mount_id;
+
+    return hash;
+}
+
+static gboolean lo_fhandle_equal(gconstpointer a, gconstpointer b)
+{
+    return !memcmp(a, b, sizeof(struct lo_fhandle));
+}
+
 static void fuse_lo_data_cleanup(struct lo_data *lo)
 {
-    if (lo->inodes) {
-        g_hash_table_destroy(lo->inodes);
+    if (lo->inodes_by_ids) {
+        g_hash_table_destroy(lo->inodes_by_ids);
+    }
+    if (lo->inodes_by_handle) {
+        g_hash_table_destroy(lo->inodes_by_handle);
     }
 
     if (lo->root.posix_locks) {
@@ -4324,7 +4372,8 @@ int main(int argc, char *argv[])
     qemu_init_exec_dir(argv[0]);
 
     pthread_mutex_init(&lo.mutex, NULL);
-    lo.inodes = g_hash_table_new(lo_key_hash, lo_key_equal);
+    lo.inodes_by_ids = g_hash_table_new(lo_key_hash, lo_key_equal);
+    lo.inodes_by_handle = g_hash_table_new(lo_fhandle_hash, lo_fhandle_equal);
     lo.root.fd = -1;
     lo.root.fuse_ino = FUSE_ROOT_ID;
     lo.cache = CACHE_AUTO;
-- 
2.31.1


