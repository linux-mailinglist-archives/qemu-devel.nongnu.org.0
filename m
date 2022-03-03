Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7D94CC38D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:18:05 +0100 (CET)
Received: from localhost ([::1]:44276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPp5Y-0004Ll-0v
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:18:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nPp36-0002Ae-5r
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:15:32 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:40075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nPp34-0005wT-M0
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:15:31 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-iu8ILS2SM8aVATOpf9ctQQ-1; Thu, 03 Mar 2022 12:15:26 -0500
X-MC-Unique: iu8ILS2SM8aVATOpf9ctQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A245B1006AA6;
 Thu,  3 Mar 2022 17:15:25 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.193.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E56C186B83;
 Thu,  3 Mar 2022 17:14:33 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] virtiofsd: Support FUSE_SYNCFS on unannounced submounts
Date: Thu,  3 Mar 2022 18:13:23 +0100
Message-Id: <20220303171323.580712-3-groug@kaod.org>
In-Reply-To: <20220303171323.580712-1-groug@kaod.org>
References: <20220303171323.580712-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

This adds the missing bits to support FUSE_SYNCFS in the case submounts
aren't announced to the client.

Iterate over all submounts and call syncfs() on them. Since syncfs() can
block for an indefinite time, we cannot call it with lo->mutex held as
it would prevent the server to process other requests. Generate a list
of submounts with lo->mutex held and bump their reference count to
ensure they don't vanish when lo->mutex is dropped.

Each individual call to syncfs() can legitimately fail. Try to flush
as much as possible anyway. A single error will be returned to the
client so that it knows that the flush didn't fully succeed.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tools/virtiofsd/passthrough_ll.c | 37 ++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 177e4b46c1bb..628ae0e9589d 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3746,9 +3746,42 @@ static void lo_syncfs(fuse_req_t req, fuse_ino_t ino=
)
=20
     /*
      * If submounts aren't announced, the client only sends a request to
-     * sync the root inode. TODO: Track submounts internally and iterate
-     * over them as well.
+     * sync the root inode. Iterate over the known submounts to sync them
+     * as well.
      */
+    if (!lo->announce_submounts) {
+        g_autoptr(GSList) submount_list =3D NULL;
+        GSList *elem;
+        GHashTableIter iter;
+        gpointer key, value;
+
+        pthread_mutex_lock(&lo->mutex);
+
+        g_hash_table_iter_init(&iter, lo->submounts);
+        while (g_hash_table_iter_next(&iter, &key, &value)) {
+            struct lo_inode *inode =3D value;
+
+            g_atomic_int_inc(&inode->refcount);
+            submount_list =3D g_slist_prepend(submount_list, inode);
+        }
+
+        pthread_mutex_unlock(&lo->mutex);
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
+    }
=20
     fuse_reply_err(req, err);
 }
--=20
2.34.1


