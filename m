Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1C33DBB87
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 17:05:44 +0200 (CEST)
Received: from localhost ([::1]:55850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9U52-0000Ia-08
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 11:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m9U2H-0005sS-OL
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m9U2F-0007sK-Mk
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627657371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z5wooyjG0Iq3OHLEBZ67TxDToG5rsd2A4o6LIUKZpvY=;
 b=VUR9wmq8+e66GSt+tP29xR6qi8nPM+2PCbaFaufSqXqINzTO6UdU8XSk4wldKdd/vJhyLd
 5UZnak6HD5+zTs3jLV3s1hUcKjBQ/CmUroWRRLN6qIFcTzQVyw2VkUfKkfn1gXlCGYl37x
 WZhgXDnLog0gZPpm+ry6ZFNSajrDeAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-1OprWJ-sMWq1Jnc5lb_gFA-1; Fri, 30 Jul 2021 11:02:49 -0400
X-MC-Unique: 1OprWJ-sMWq1Jnc5lb_gFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCB85180FCD1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 15:02:48 +0000 (UTC)
Received: from localhost (unknown [10.39.193.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F9C65D9CA;
 Fri, 30 Jul 2021 15:02:40 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v3 08/10] virtiofsd: Add inodes_by_handle hash table
Date: Fri, 30 Jul 2021 17:01:32 +0200
Message-Id: <20210730150134.216126-9-mreitz@redhat.com>
In-Reply-To: <20210730150134.216126-1-mreitz@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Max Reitz <mreitz@redhat.com>
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

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 81 +++++++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 16 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 487448d666..f9d8b2f134 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -180,7 +180,8 @@ struct lo_data {
     int announce_submounts;
     bool use_statx;
     struct lo_inode root;
-    GHashTable *inodes; /* protected by lo->mutex */
+    GHashTable *inodes_by_ids; /* protected by lo->mutex */
+    GHashTable *inodes_by_handle; /* protected by lo->mutex */
     struct lo_map ino_map; /* protected by lo->mutex */
     struct lo_map dirp_map; /* protected by lo->mutex */
     struct lo_map fd_map; /* protected by lo->mutex */
@@ -263,8 +264,9 @@ static struct {
 /* That we loaded cap-ng in the current thread from the saved */
 static __thread bool cap_loaded = 0;
 
-static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
-                                uint64_t mnt_id);
+static struct lo_inode *lo_find(struct lo_data *lo,
+                                const struct lo_fhandle *fhandle,
+                                struct stat *st, uint64_t mnt_id);
 static int xattr_map_client(const struct lo_data *lo, const char *client_name,
                             char **out_name);
 
@@ -1064,18 +1066,40 @@ out_err:
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
@@ -1215,7 +1239,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
         e->attr_flags |= FUSE_ATTR_SUBMOUNT;
     }
 
-    inode = lo_find(lo, &e->attr, mnt_id);
+    inode = lo_find(lo, NULL, &e->attr, mnt_id);
     if (inode) {
         close(newfd);
     } else {
@@ -1245,7 +1269,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
         }
         pthread_mutex_lock(&lo->mutex);
         inode->fuse_ino = lo_add_inode_mapping(req, inode);
-        g_hash_table_insert(lo->inodes, &inode->key, inode);
+        g_hash_table_insert(lo->inodes_by_ids, &inode->key, inode);
         pthread_mutex_unlock(&lo->mutex);
     }
     e->ino = inode->fuse_ino;
@@ -1609,7 +1633,7 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
         goto out;
     }
 
-    inode = lo_find(lo, &attr, mnt_id);
+    inode = lo_find(lo, NULL, &attr, mnt_id);
 
 out:
     lo_inode_put(lo, &dir);
@@ -1776,7 +1800,7 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
     inode->nlookup -= n;
     if (!inode->nlookup) {
         lo_map_remove(&lo->ino_map, inode->fuse_ino);
-        g_hash_table_remove(lo->inodes, &inode->key);
+        g_hash_table_remove(lo->inodes_by_ids, &inode->key);
         if (lo->posix_lock) {
             if (g_hash_table_size(inode->posix_locks)) {
                 fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
@@ -3603,7 +3627,7 @@ static void lo_destroy(void *userdata)
         GHashTableIter iter;
         gpointer key, value;
 
-        g_hash_table_iter_init(&iter, lo->inodes);
+        g_hash_table_iter_init(&iter, lo->inodes_by_ids);
         if (!g_hash_table_iter_next(&iter, &key, &value)) {
             break;
         }
@@ -4129,10 +4153,34 @@ static gboolean lo_key_equal(gconstpointer a, gconstpointer b)
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
+    if (lo->inodes_by_ids) {
+        g_hash_table_destroy(lo->inodes_by_handle);
     }
 
     if (lo->root.posix_locks) {
@@ -4189,7 +4237,8 @@ int main(int argc, char *argv[])
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


