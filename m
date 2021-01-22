Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E350130059E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:38:10 +0100 (CET)
Received: from localhost ([::1]:34246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xZh-0001qt-NW
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:38:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2xX7-0000Ot-6R
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:35:29 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:28841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2xX2-00005s-0z
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:35:28 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-Fojr4eJpOByhEdJzS00jpQ-1; Fri, 22 Jan 2021 09:35:17 -0500
X-MC-Unique: Fojr4eJpOByhEdJzS00jpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 739368066E8;
 Fri, 22 Jan 2021 14:35:16 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C7CA19C59;
 Fri, 22 Jan 2021 14:35:15 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] 9pfs: Convert reclaim list to QSLIST
Date: Fri, 22 Jan 2021 15:35:14 +0100
Message-Id: <20210122143514.215780-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, PDS_OTHER_BAD_TLD=1.997,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Use QSLIST instead of open-coding for a slightly improved readability.

No behavioral change.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/9pfs/9p.c | 17 ++++++++---------
 hw/9pfs/9p.h |  2 +-
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 3864d014b43c..5a6e2c9d3d7f 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -416,7 +416,9 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
 {
     int reclaim_count =3D 0;
     V9fsState *s =3D pdu->s;
-    V9fsFidState *f, *reclaim_list =3D NULL;
+    V9fsFidState *f;
+    QSLIST_HEAD(, V9fsFidState) reclaim_list =3D
+        QSLIST_HEAD_INITIALIZER(reclaim_list);
=20
     QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
         /*
@@ -448,8 +450,7 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
                  * a clunk request won't free this fid
                  */
                 f->ref++;
-                f->rclm_lst =3D reclaim_list;
-                reclaim_list =3D f;
+                QSLIST_INSERT_HEAD(&reclaim_list, f, reclaim_next);
                 f->fs_reclaim.fd =3D f->fs.fd;
                 f->fs.fd =3D -1;
                 reclaim_count++;
@@ -461,8 +462,7 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
                  * a clunk request won't free this fid
                  */
                 f->ref++;
-                f->rclm_lst =3D reclaim_list;
-                reclaim_list =3D f;
+                QSLIST_INSERT_HEAD(&reclaim_list, f, reclaim_next);
                 f->fs_reclaim.dir.stream =3D f->fs.dir.stream;
                 f->fs.dir.stream =3D NULL;
                 reclaim_count++;
@@ -476,15 +476,14 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
      * Now close the fid in reclaim list. Free them if they
      * are already clunked.
      */
-    while (reclaim_list) {
-        f =3D reclaim_list;
-        reclaim_list =3D f->rclm_lst;
+    while (!QSLIST_EMPTY(&reclaim_list)) {
+        f =3D QSLIST_FIRST(&reclaim_list);
+        QSLIST_REMOVE(&reclaim_list, f, V9fsFidState, reclaim_next);
         if (f->fid_type =3D=3D P9_FID_FILE) {
             v9fs_co_close(pdu, &f->fs_reclaim);
         } else if (f->fid_type =3D=3D P9_FID_DIR) {
             v9fs_co_closedir(pdu, &f->fs_reclaim);
         }
-        f->rclm_lst =3D NULL;
         /*
          * Now drop the fid reference, free it
          * if clunked.
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 85fb6930b0ca..00381591ffa2 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -281,7 +281,7 @@ struct V9fsFidState {
     int ref;
     bool clunked;
     QSIMPLEQ_ENTRY(V9fsFidState) next;
-    V9fsFidState *rclm_lst;
+    QSLIST_ENTRY(V9fsFidState) reclaim_next;
 };
=20
 typedef enum AffixType_t {
--=20
2.26.2


