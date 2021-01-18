Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421262FA2F1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 15:27:23 +0100 (CET)
Received: from localhost ([::1]:36410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1VV4-0005hL-BU
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 09:27:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l1VR5-00026Y-GH
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:23:17 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:51399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l1VR3-00022k-9U
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:23:15 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-L5Wz6pcjNH2vDZpJ36OAlg-1; Mon, 18 Jan 2021 09:23:07 -0500
X-MC-Unique: L5Wz6pcjNH2vDZpJ36OAlg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38BB6180A09E;
 Mon, 18 Jan 2021 14:23:05 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C7BB60622;
 Mon, 18 Jan 2021 14:23:04 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] 9pfs: Convert V9fsFidState::fid_list to QSIMPLEQ
Date: Mon, 18 Jan 2021 15:22:59 +0100
Message-Id: <20210118142300.801516-3-groug@kaod.org>
In-Reply-To: <20210118142300.801516-1-groug@kaod.org>
References: <20210118142300.801516-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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

The fid_list is currently open-coded. This doesn't seem to serve any
purpose that cannot be met with QEMU's generic lists. Let's go for a
QSIMPLEQ : this will allow to add new fids at the end of the list and
to improve the logic in v9fs_mark_fids_unreclaim().

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/9pfs/9p.c | 41 ++++++++++++++++++-----------------------
 hw/9pfs/9p.h |  4 ++--
 2 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 37c3379b7462..b65f320e6518 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -260,7 +260,7 @@ static V9fsFidState *coroutine_fn get_fid(V9fsPDU *pdu,=
 int32_t fid)
     V9fsFidState *f;
     V9fsState *s =3D pdu->s;
=20
-    for (f =3D s->fid_list; f; f =3D f->next) {
+    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
         BUG_ON(f->clunked);
         if (f->fid =3D=3D fid) {
             /*
@@ -295,7 +295,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t fi=
d)
 {
     V9fsFidState *f;
=20
-    for (f =3D s->fid_list; f; f =3D f->next) {
+    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
         /* If fid is already there return NULL */
         BUG_ON(f->clunked);
         if (f->fid =3D=3D fid) {
@@ -311,8 +311,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t fi=
d)
      * reclaim won't close the file descriptor
      */
     f->flags |=3D FID_REFERENCED;
-    f->next =3D s->fid_list;
-    s->fid_list =3D f;
+    QSIMPLEQ_INSERT_HEAD(&s->fid_list, f, next);
=20
     v9fs_readdir_init(s->proto_version, &f->fs.dir);
     v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
@@ -401,20 +400,16 @@ static int coroutine_fn put_fid(V9fsPDU *pdu, V9fsFid=
State *fidp)
=20
 static V9fsFidState *clunk_fid(V9fsState *s, int32_t fid)
 {
-    V9fsFidState **fidpp, *fidp;
+    V9fsFidState *fidp;
=20
-    for (fidpp =3D &s->fid_list; *fidpp; fidpp =3D &(*fidpp)->next) {
-        if ((*fidpp)->fid =3D=3D fid) {
-            break;
+    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
+        if (fidp->fid =3D=3D fid) {
+            QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
+            fidp->clunked =3D true;
+            return fidp;
         }
     }
-    if (*fidpp =3D=3D NULL) {
-        return NULL;
-    }
-    fidp =3D *fidpp;
-    *fidpp =3D fidp->next;
-    fidp->clunked =3D true;
-    return fidp;
+    return NULL;
 }
=20
 void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
@@ -423,7 +418,7 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
     V9fsState *s =3D pdu->s;
     V9fsFidState *f, *reclaim_list =3D NULL;
=20
-    for (f =3D s->fid_list; f; f =3D f->next) {
+    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
         /*
          * Unlink fids cannot be reclaimed. Check
          * for them and skip them. Also skip fids
@@ -505,7 +500,7 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPD=
U *pdu, V9fsPath *path)
     V9fsFidState *fidp;
=20
 again:
-    for (fidp =3D s->fid_list; fidp; fidp =3D fidp->next) {
+    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
         if (fidp->path.size !=3D path->size) {
             continue;
         }
@@ -537,13 +532,13 @@ static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
     V9fsFidState *fidp;
=20
     /* Free all fids */
-    while (s->fid_list) {
+    while (!QSIMPLEQ_EMPTY(&s->fid_list)) {
         /* Get fid */
-        fidp =3D s->fid_list;
+        fidp =3D QSIMPLEQ_FIRST(&s->fid_list);
         fidp->ref++;
=20
         /* Clunk fid */
-        s->fid_list =3D fidp->next;
+        QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
         fidp->clunked =3D true;
=20
         put_fid(pdu, fidp);
@@ -3121,7 +3116,7 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU =
*pdu, V9fsFidState *fidp,
      * Fixup fid's pointing to the old name to
      * start pointing to the new name
      */
-    for (tfidp =3D s->fid_list; tfidp; tfidp =3D tfidp->next) {
+    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
         if (v9fs_path_is_ancestor(&fidp->path, &tfidp->path)) {
             /* replace the name */
             v9fs_fix_path(&tfidp->path, &new_path, strlen(fidp->path.data)=
);
@@ -3215,7 +3210,7 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU *p=
du, V9fsPath *olddir,
      * Fixup fid's pointing to the old name to
      * start pointing to the new name
      */
-    for (tfidp =3D s->fid_list; tfidp; tfidp =3D tfidp->next) {
+    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
         if (v9fs_path_is_ancestor(&oldpath, &tfidp->path)) {
             /* replace the name */
             v9fs_fix_path(&tfidp->path, &newpath, strlen(oldpath.data));
@@ -4081,7 +4076,7 @@ int v9fs_device_realize_common(V9fsState *s, const V9=
fsTransport *t,
     s->ctx.fmode =3D fse->fmode;
     s->ctx.dmode =3D fse->dmode;
=20
-    s->fid_list =3D NULL;
+    QSIMPLEQ_INIT(&s->fid_list);
     qemu_co_rwlock_init(&s->rename_lock);
=20
     if (s->ops->init(&s->ctx, errp) < 0) {
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 93656323d1d7..85fb6930b0ca 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -280,7 +280,7 @@ struct V9fsFidState {
     uid_t uid;
     int ref;
     bool clunked;
-    V9fsFidState *next;
+    QSIMPLEQ_ENTRY(V9fsFidState) next;
     V9fsFidState *rclm_lst;
 };
=20
@@ -339,7 +339,7 @@ typedef struct {
 struct V9fsState {
     QLIST_HEAD(, V9fsPDU) free_list;
     QLIST_HEAD(, V9fsPDU) active_list;
-    V9fsFidState *fid_list;
+    QSIMPLEQ_HEAD(, V9fsFidState) fid_list;
     FileOperations *ops;
     FsContext ctx;
     char *tag;
--=20
2.26.2


