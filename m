Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3653143E7A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:47:16 +0100 (CET)
Received: from localhost ([::1]:54084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittsB-0002Ml-5o
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:47:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsgZ-0002bH-TI
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:31:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsgY-0004PZ-5w
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:31:11 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24007
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsgX-0004P4-Dj
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:31:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gmq+VTb9X4BI7w0va1chHwVtCIz06hc+H1t9fYPxhG0=;
 b=CFFTIbc1311CV9eNDAVJJAOPcNw34L2c/314H+En3osd6tyKD7ytmMzwGAtbKHsfPxZs0i
 NE3B/n/MuhC4ZqsmoQhOwXBHE2MDxqkFfDCp5P6W3UQzFQDhK4Z4k1SwVbn4nG3Z6RobyH
 sx30O4AiTHQODWKTLR4xxpYEwPStzAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-SEA_tU7hPMGTwRfj1AvEiQ-1; Tue, 21 Jan 2020 07:31:06 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CA37DBD9;
 Tue, 21 Jan 2020 12:31:05 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 452E260BE0;
 Tue, 21 Jan 2020 12:31:01 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 075/109] virtiofsd: passthrough_ll: use hashtable
Date: Tue, 21 Jan 2020 12:23:59 +0000
Message-Id: <20200121122433.50803-76-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: SEA_tU7hPMGTwRfj1AvEiQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miklos Szeredi <mszeredi@redhat.com>

Improve performance of inode lookup by using a hash table.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Liu Bo <bo.liu@linux.alibaba.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 81 ++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 36 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 528820aa71..e0f76b37b7 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -84,13 +84,15 @@ struct lo_map {
     ssize_t freelist;
 };
=20
+struct lo_key {
+    ino_t ino;
+    dev_t dev;
+};
+
 struct lo_inode {
-    struct lo_inode *next; /* protected by lo->mutex */
-    struct lo_inode *prev; /* protected by lo->mutex */
     int fd;
     bool is_symlink;
-    ino_t ino;
-    dev_t dev;
+    struct lo_key key;
     uint64_t refcount; /* protected by lo->mutex */
     fuse_ino_t fuse_ino;
 };
@@ -119,7 +121,8 @@ struct lo_data {
     int timeout_set;
     int readdirplus_set;
     int readdirplus_clear;
-    struct lo_inode root; /* protected by lo->mutex */
+    struct lo_inode root;
+    GHashTable *inodes; /* protected by lo->mutex */
     struct lo_map ino_map; /* protected by lo->mutex */
     struct lo_map dirp_map; /* protected by lo->mutex */
     struct lo_map fd_map; /* protected by lo->mutex */
@@ -573,7 +576,7 @@ retry:
         }
         goto fail_unref;
     }
-    if (stat.st_dev !=3D inode->dev || stat.st_ino !=3D inode->ino) {
+    if (stat.st_dev !=3D inode->key.dev || stat.st_ino !=3D inode->key.ino=
) {
         if (!retries) {
             fuse_log(FUSE_LOG_WARNING,
                      "%s: failed to match last\n", __func__);
@@ -753,19 +756,20 @@ out_err:
 static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st)
 {
     struct lo_inode *p;
-    struct lo_inode *ret =3D NULL;
+    struct lo_key key =3D {
+        .ino =3D st->st_ino,
+        .dev =3D st->st_dev,
+    };
=20
     pthread_mutex_lock(&lo->mutex);
-    for (p =3D lo->root.next; p !=3D &lo->root; p =3D p->next) {
-        if (p->ino =3D=3D st->st_ino && p->dev =3D=3D st->st_dev) {
-            assert(p->refcount > 0);
-            ret =3D p;
-            ret->refcount++;
-            break;
-        }
+    p =3D g_hash_table_lookup(lo->inodes, &key);
+    if (p) {
+        assert(p->refcount > 0);
+        p->refcount++;
     }
     pthread_mutex_unlock(&lo->mutex);
-    return ret;
+
+    return p;
 }
=20
 static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *nam=
e,
@@ -810,8 +814,6 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t pare=
nt, const char *name,
         close(newfd);
         newfd =3D -1;
     } else {
-        struct lo_inode *prev, *next;
-
         saverr =3D ENOMEM;
         inode =3D calloc(1, sizeof(struct lo_inode));
         if (!inode) {
@@ -822,17 +824,12 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t pa=
rent, const char *name,
         inode->refcount =3D 1;
         inode->fd =3D newfd;
         newfd =3D -1;
-        inode->ino =3D e->attr.st_ino;
-        inode->dev =3D e->attr.st_dev;
+        inode->key.ino =3D e->attr.st_ino;
+        inode->key.dev =3D e->attr.st_dev;
=20
         pthread_mutex_lock(&lo->mutex);
         inode->fuse_ino =3D lo_add_inode_mapping(req, inode);
-        prev =3D &lo->root;
-        next =3D prev->next;
-        next->prev =3D inode;
-        inode->next =3D next;
-        inode->prev =3D prev;
-        prev->next =3D inode;
+        g_hash_table_insert(lo->inodes, &inode->key, inode);
         pthread_mutex_unlock(&lo->mutex);
     }
     e->ino =3D inode->fuse_ino;
@@ -1162,14 +1159,8 @@ static void unref_inode_lolocked(struct lo_data *lo,=
 struct lo_inode *inode,
     assert(inode->refcount >=3D n);
     inode->refcount -=3D n;
     if (!inode->refcount) {
-        struct lo_inode *prev, *next;
-
-        prev =3D inode->prev;
-        next =3D inode->next;
-        next->prev =3D prev;
-        prev->next =3D next;
-
         lo_map_remove(&lo->ino_map, inode->fuse_ino);
+        g_hash_table_remove(lo->inodes, &inode->key);
         pthread_mutex_unlock(&lo->mutex);
         close(inode->fd);
         free(inode);
@@ -1369,7 +1360,7 @@ static void lo_do_readdir(fuse_req_t req, fuse_ino_t =
ino, size_t size,
=20
         /* Hide root's parent directory */
         if (dinode =3D=3D &lo->root && strcmp(name, "..") =3D=3D 0) {
-            e.attr.st_ino =3D lo->root.ino;
+            e.attr.st_ino =3D lo->root.key.ino;
             e.attr.st_mode =3D DT_DIR << 12;
         }
=20
@@ -2370,11 +2361,26 @@ static void setup_root(struct lo_data *lo, struct l=
o_inode *root)
=20
     root->is_symlink =3D false;
     root->fd =3D fd;
-    root->ino =3D stat.st_ino;
-    root->dev =3D stat.st_dev;
+    root->key.ino =3D stat.st_ino;
+    root->key.dev =3D stat.st_dev;
     root->refcount =3D 2;
 }
=20
+static guint lo_key_hash(gconstpointer key)
+{
+    const struct lo_key *lkey =3D key;
+
+    return (guint)lkey->ino + (guint)lkey->dev;
+}
+
+static gboolean lo_key_equal(gconstpointer a, gconstpointer b)
+{
+    const struct lo_key *la =3D a;
+    const struct lo_key *lb =3D b;
+
+    return la->ino =3D=3D lb->ino && la->dev =3D=3D lb->dev;
+}
+
 int main(int argc, char *argv[])
 {
     struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
@@ -2392,7 +2398,7 @@ int main(int argc, char *argv[])
     umask(0);
=20
     pthread_mutex_init(&lo.mutex, NULL);
-    lo.root.next =3D lo.root.prev =3D &lo.root;
+    lo.inodes =3D g_hash_table_new(lo_key_hash, lo_key_equal);
     lo.root.fd =3D -1;
     lo.root.fuse_ino =3D FUSE_ROOT_ID;
     lo.cache =3D CACHE_AUTO;
@@ -2522,6 +2528,9 @@ err_out2:
 err_out1:
     fuse_opt_free_args(&args);
=20
+    if (lo.inodes) {
+        g_hash_table_destroy(lo.inodes);
+    }
     lo_map_destroy(&lo.fd_map);
     lo_map_destroy(&lo.dirp_map);
     lo_map_destroy(&lo.ino_map);
--=20
2.24.1


