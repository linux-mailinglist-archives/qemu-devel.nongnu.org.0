Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C5E2FF307
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:17:24 +0100 (CET)
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2eWJ-0005Iv-JE
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2eUM-0004Uk-Bm
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:15:23 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:45802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2eUI-0008HE-VL
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:15:21 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-d21QDsZxNLSg_rSld7_aIw-1; Thu, 21 Jan 2021 13:15:13 -0500
X-MC-Unique: d21QDsZxNLSg_rSld7_aIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AD34100C608;
 Thu, 21 Jan 2021 18:15:12 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D1406EF45;
 Thu, 21 Jan 2021 18:15:10 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] 9pfs: Improve unreclaim loop
Date: Thu, 21 Jan 2021 19:15:10 +0100
Message-Id: <20210121181510.1459390-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a fid was actually re-opened by v9fs_reopen_fid(), we re-traverse the
fid list from the head in case some other request created a fid that
needs to be marked unreclaimable as well (ie. the client opened a new
handle on the path that is being unlinked). This is suboptimal since
most if not all fids that require it have likely been taken care of
already.

This is mostly the result of new fids being added to the head of the
list. Since the list is now a QSIMPLEQ, add new fids at the end instead
to avoid the need to rewind. Take a reference on the fid to ensure it
doesn't go away during v9fs_reopen_fid() and that it can be safely
passed to QSIMPLEQ_NEXT() afterwards. Since the associated put_fid()
can also yield, same is done with the next fid. So the logic here is
to get a reference on a fid and only put it back during the next
iteration after we could get a reference on the next fid.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
v2: - fix typos in changelog
    - drop bogus assert()
---
 hw/9pfs/9p.c | 46 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index b65f320e6518..3864d014b43c 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -311,7 +311,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t fi=
d)
      * reclaim won't close the file descriptor
      */
     f->flags |=3D FID_REFERENCED;
-    QSIMPLEQ_INSERT_HEAD(&s->fid_list, f, next);
+    QSIMPLEQ_INSERT_TAIL(&s->fid_list, f, next);
=20
     v9fs_readdir_init(s->proto_version, &f->fs.dir);
     v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
@@ -497,32 +497,50 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fs=
PDU *pdu, V9fsPath *path)
 {
     int err;
     V9fsState *s =3D pdu->s;
-    V9fsFidState *fidp;
+    V9fsFidState *fidp, *fidp_next;
=20
-again:
-    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
-        if (fidp->path.size !=3D path->size) {
-            continue;
-        }
-        if (!memcmp(fidp->path.data, path->data, path->size)) {
+    fidp =3D QSIMPLEQ_FIRST(&s->fid_list);
+    if (!fidp) {
+        return 0;
+    }
+
+    /*
+     * v9fs_reopen_fid() can yield : a reference on the fid must be held
+     * to ensure its pointer remains valid and we can safely pass it to
+     * QSIMPLEQ_NEXT(). The corresponding put_fid() can also yield so
+     * we must keep a reference on the next fid as well. So the logic here
+     * is to get a reference on a fid and only put it back during the next
+     * iteration after we could get a reference on the next fid. Start wit=
h
+     * the first one.
+     */
+    for (fidp->ref++; fidp; fidp =3D fidp_next) {
+        if (fidp->path.size =3D=3D path->size &&
+            !memcmp(fidp->path.data, path->data, path->size)) {
             /* Mark the fid non reclaimable. */
             fidp->flags |=3D FID_NON_RECLAIMABLE;
=20
             /* reopen the file/dir if already closed */
             err =3D v9fs_reopen_fid(pdu, fidp);
             if (err < 0) {
+                put_fid(pdu, fidp);
                 return err;
             }
+        }
+
+        fidp_next =3D QSIMPLEQ_NEXT(fidp, next);
+
+        if (fidp_next) {
             /*
-             * Go back to head of fid list because
-             * the list could have got updated when
-             * switched to the worker thread
+             * Ensure the next fid survives a potential clunk request duri=
ng
+             * put_fid() below and v9fs_reopen_fid() in the next iteration=
.
              */
-            if (err =3D=3D 0) {
-                goto again;
-            }
+            fidp_next->ref++;
         }
+
+        /* We're done with this fid */
+        put_fid(pdu, fidp);
     }
+
     return 0;
 }
=20
--=20
2.26.2


