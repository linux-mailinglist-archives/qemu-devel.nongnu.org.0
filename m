Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC8B143F56
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 15:22:20 +0100 (CET)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ituQ6-0000uT-Rf
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 09:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsiQ-00047L-Ul
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:33:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsiN-00055q-3P
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:33:06 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:38492
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsiM-00055m-Um
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VaMuJQ0kEqF+Mn8YbHpGchU2mMcZGwcQFfJqCMKUjBY=;
 b=M5m6s3Jvylg2NSR83KprmJGetEmR2UtLfEwc/lRAE2jVITCaXsEPEMqF58H00Zcl3Ir8au
 DWm8ScUShmJ+is0Ry+Qhl0qVco8ivyLUEeya++E2YTRLOhUCZaoCIrnF3Vif96mU6waK7L
 cdvukopavUG1UD9ui+w6nzfNcV3xYe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-FYKC2diNNCmf8XtOlb-Pyg-1; Tue, 21 Jan 2020 07:33:00 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E6771005510;
 Tue, 21 Jan 2020 12:32:59 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57C0F60BE0;
 Tue, 21 Jan 2020 12:32:52 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 106/109] virtiofsd: Convert lo_destroy to take the
 lo->mutex lock itself
Date: Tue, 21 Jan 2020 12:24:30 +0000
Message-Id: <20200121122433.50803-107-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: FYKC2diNNCmf8XtOlb-Pyg-1
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

lo_destroy was relying on some implicit knowledge of the locking;
we can avoid this if we create an unref_inode that doesn't take
the lock and then grab it for the whole of the lo_destroy.

Suggested-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 4c656b4a60..3c450c15b4 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1344,14 +1344,13 @@ static void lo_unlink(fuse_req_t req, fuse_ino_t pa=
rent, const char *name)
     lo_inode_put(lo, &inode);
 }
=20
-static void unref_inode_lolocked(struct lo_data *lo, struct lo_inode *inod=
e,
-                                 uint64_t n)
+/* To be called with lo->mutex held */
+static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64=
_t n)
 {
     if (!inode) {
         return;
     }
=20
-    pthread_mutex_lock(&lo->mutex);
     assert(inode->nlookup >=3D n);
     inode->nlookup -=3D n;
     if (!inode->nlookup) {
@@ -1362,15 +1361,24 @@ static void unref_inode_lolocked(struct lo_data *lo=
, struct lo_inode *inode,
         }
         g_hash_table_destroy(inode->posix_locks);
         pthread_mutex_destroy(&inode->plock_mutex);
-        pthread_mutex_unlock(&lo->mutex);
=20
         /* Drop our refcount from lo_do_lookup() */
         lo_inode_put(lo, &inode);
-    } else {
-        pthread_mutex_unlock(&lo->mutex);
     }
 }
=20
+static void unref_inode_lolocked(struct lo_data *lo, struct lo_inode *inod=
e,
+                                 uint64_t n)
+{
+    if (!inode) {
+        return;
+    }
+
+    pthread_mutex_lock(&lo->mutex);
+    unref_inode(lo, inode, n);
+    pthread_mutex_unlock(&lo->mutex);
+}
+
 static void lo_forget_one(fuse_req_t req, fuse_ino_t ino, uint64_t nlookup=
)
 {
     struct lo_data *lo =3D lo_data(req);
@@ -2458,13 +2466,7 @@ static void lo_destroy(void *userdata)
 {
     struct lo_data *lo =3D (struct lo_data *)userdata;
=20
-    /*
-     * Normally lo->mutex must be taken when traversing lo->inodes but
-     * lo_destroy() is a serialized request so no races are possible here.
-     *
-     * In addition, we cannot acquire lo->mutex since unref_inode() takes =
it
-     * too and this would result in a recursive lock.
-     */
+    pthread_mutex_lock(&lo->mutex);
     while (true) {
         GHashTableIter iter;
         gpointer key, value;
@@ -2475,8 +2477,9 @@ static void lo_destroy(void *userdata)
         }
=20
         struct lo_inode *inode =3D value;
-        unref_inode_lolocked(lo, inode, inode->nlookup);
+        unref_inode(lo, inode, inode->nlookup);
     }
+    pthread_mutex_unlock(&lo->mutex);
 }
=20
 static struct fuse_lowlevel_ops lo_oper =3D {
--=20
2.24.1


