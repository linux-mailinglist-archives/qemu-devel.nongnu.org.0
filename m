Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994834CC38C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:17:09 +0100 (CET)
Received: from localhost ([::1]:42010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPp4e-0002hZ-N5
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:17:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nPp2G-000190-Ay
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:14:40 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:51910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nPp2E-0005gG-Tj
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:14:40 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-RP4qCkwiPnqSsx3WHiW62Q-1; Thu, 03 Mar 2022 12:14:34 -0500
X-MC-Unique: RP4qCkwiPnqSsx3WHiW62Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 925EA1854E21;
 Thu,  3 Mar 2022 17:14:33 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.193.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A57986B83;
 Thu,  3 Mar 2022 17:14:00 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] virtiofsd: Track submounts
Date: Thu,  3 Mar 2022 18:13:22 +0100
Message-Id: <20220303171323.580712-2-groug@kaod.org>
In-Reply-To: <20220303171323.580712-1-groug@kaod.org>
References: <20220303171323.580712-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: German Maglione <gmaglione@redhat.com>,
 Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the server doesn't announce submounts to the client, it needs to
track them internally to properly support FUSE_SYNCFS. lo_do_lookup()
already knows how to detect them : it is a directory with a different
device ID or mount ID than its parent. Use the same logic and put
submount inodes into a dedicated hash : this will allow to iterate
on them in lo_syncfs().

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tools/virtiofsd/passthrough_ll.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index dfa2fc250d64..177e4b46c1bb 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -165,6 +165,7 @@ struct lo_data {
     bool use_statx;
     struct lo_inode root;
     GHashTable *inodes; /* protected by lo->mutex */
+    GHashTable *submounts; /* protected by lo->mutex */
     struct lo_map ino_map; /* protected by lo->mutex */
     struct lo_map dirp_map; /* protected by lo->mutex */
     struct lo_map fd_map; /* protected by lo->mutex */
@@ -1104,6 +1105,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t pa=
rent, const char *name,
     struct lo_data *lo =3D lo_data(req);
     struct lo_inode *inode =3D NULL;
     struct lo_inode *dir =3D lo_inode(req, parent);
+    bool is_submount;
=20
     if (inodep) {
         *inodep =3D NULL; /* in case there is an error */
@@ -1138,8 +1140,10 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t p=
arent, const char *name,
         goto out_err;
     }
=20
-    if (S_ISDIR(e->attr.st_mode) && lo->announce_submounts &&
-        (e->attr.st_dev !=3D dir->key.dev || mnt_id !=3D dir->key.mnt_id))=
 {
+    is_submount =3D S_ISDIR(e->attr.st_mode) &&
+        (e->attr.st_dev !=3D dir->key.dev || mnt_id !=3D dir->key.mnt_id);
+
+    if (is_submount && lo->announce_submounts) {
         e->attr_flags |=3D FUSE_ATTR_SUBMOUNT;
     }
=20
@@ -1174,6 +1178,9 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t pa=
rent, const char *name,
         pthread_mutex_lock(&lo->mutex);
         inode->fuse_ino =3D lo_add_inode_mapping(req, inode);
         g_hash_table_insert(lo->inodes, &inode->key, inode);
+        if (is_submount && !lo->announce_submounts) {
+            g_hash_table_insert(lo->submounts, &inode->key, inode);
+        }
         pthread_mutex_unlock(&lo->mutex);
     }
     e->ino =3D inode->fuse_ino;
@@ -1187,8 +1194,9 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t pa=
rent, const char *name,
=20
     lo_inode_put(lo, &dir);
=20
-    fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli\n", (unsigned long long)pa=
rent,
-             name, (unsigned long long)e->ino);
+    fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli%s\n",
+             (unsigned long long) parent, name, (unsigned long long) e->in=
o,
+             is_submount ? " (submount)" : "");
=20
     return 0;
=20
@@ -1745,6 +1753,9 @@ static void unref_inode(struct lo_data *lo, struct lo=
_inode *inode, uint64_t n)
     if (!inode->nlookup) {
         lo_map_remove(&lo->ino_map, inode->fuse_ino);
         g_hash_table_remove(lo->inodes, &inode->key);
+        if (!lo->announce_submounts) {
+            g_hash_table_remove(lo->submounts, &inode->key);
+        }
         if (lo->posix_lock) {
             if (g_hash_table_size(inode->posix_locks)) {
                 fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
@@ -4297,6 +4308,10 @@ static gboolean lo_key_equal(gconstpointer a, gconst=
pointer b)
=20
 static void fuse_lo_data_cleanup(struct lo_data *lo)
 {
+    if (lo->submounts) {
+        g_hash_table_destroy(lo->submounts);
+    }
+
     if (lo->inodes) {
         g_hash_table_destroy(lo->inodes);
     }
@@ -4364,6 +4379,7 @@ int main(int argc, char *argv[])
=20
     pthread_mutex_init(&lo.mutex, NULL);
     lo.inodes =3D g_hash_table_new(lo_key_hash, lo_key_equal);
+    lo.submounts =3D g_hash_table_new(lo_key_hash, lo_key_equal);
     lo.root.fd =3D -1;
     lo.root.fuse_ino =3D FUSE_ROOT_ID;
     lo.cache =3D CACHE_AUTO;
--=20
2.34.1


