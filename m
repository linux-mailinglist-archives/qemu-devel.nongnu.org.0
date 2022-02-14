Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5164B54F6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:38:49 +0100 (CET)
Received: from localhost ([::1]:58152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdRA-0001zo-Lp
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:38:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nJbu4-0006mD-3D
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:00:32 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:32826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nJbu2-0002QD-6f
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:00:31 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-iYdiRZBtNpmmfswym7P7iA-1; Mon, 14 Feb 2022 09:00:25 -0500
X-MC-Unique: iYdiRZBtNpmmfswym7P7iA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E261189DF42;
 Mon, 14 Feb 2022 14:00:24 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E83266ABB9;
 Mon, 14 Feb 2022 13:59:51 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/3] virtiofsd: Add support for FUSE_SYNCFS request without
 announce_submounts
Date: Mon, 14 Feb 2022 14:58:20 +0100
Message-Id: <20220214135820.43897-4-groug@kaod.org>
In-Reply-To: <20220214135820.43897-1-groug@kaod.org>
References: <20220214135820.43897-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
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
Cc: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds the missing bits to support FUSE_SYNCFS in the case submounts
aren't announced to the client.

Iterate over all inodes and call syncfs() on the ones marked as submounts.
Since syncfs() can block for an indefinite time, we cannot call it with
lo->mutex held as it would prevent the server to process other requests.
This is thus broken down in two steps. First build a list of submounts
with lo->mutex held, drop the mutex and finally process the list. A
reference is taken on the inodes to ensure they don't go away when
lo->mutex is dropped.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tools/virtiofsd/passthrough_ll.c | 38 ++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index e94c4e6f8635..7ce944bfe2a0 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3400,8 +3400,42 @@ static void lo_syncfs(fuse_req_t req, fuse_ino_t ino=
)
         err =3D lo_do_syncfs(lo, inode);
         lo_inode_put(lo, &inode);
     } else {
-        /* Requires the sever to track submounts. Not implemented yet */
-        err =3D ENOSYS;
+        g_autoptr(GSList) submount_list =3D NULL;
+        GSList *elem;
+        GHashTableIter iter;
+        gpointer key, value;
+
+        pthread_mutex_lock(&lo->mutex);
+
+        g_hash_table_iter_init(&iter, lo->inodes);
+        while (g_hash_table_iter_next(&iter, &key, &value)) {
+            struct lo_inode *inode =3D value;
+
+            if (inode->is_submount) {
+                g_atomic_int_inc(&inode->refcount);
+                submount_list =3D g_slist_prepend(submount_list, inode);
+            }
+        }
+
+        pthread_mutex_unlock(&lo->mutex);
+
+        /* The root inode is always present and not tracked in the hash ta=
ble */
+        err =3D lo_do_syncfs(lo, &lo->root);
+
+        for (elem =3D submount_list; elem; elem =3D g_slist_next(elem)) {
+            struct lo_inode *inode =3D elem->data;
+            int r;
+
+            r =3D lo_do_syncfs(lo, inode);
+            if (r) {
+                /*
+                 * Try to sync as much as possible. Only one error can be
+                 * reported to the client though, arbitrarily the last one=
.
+                 */
+                err =3D r;
+            }
+            lo_inode_put(lo, &inode);
+        }
     }
=20
     fuse_reply_err(req, err);
--=20
2.34.1


