Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14415294074
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 18:26:15 +0200 (CEST)
Received: from localhost ([::1]:35992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUuSk-0001oI-47
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 12:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kUuCk-0004Kq-CD
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 12:09:42 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:57366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kUuCi-0005Ot-Q4
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 12:09:42 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-oNV32s7MM6CmYN8HBg_5MA-1; Tue, 20 Oct 2020 12:09:37 -0400
X-MC-Unique: oNV32s7MM6CmYN8HBg_5MA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42ABF8049D3;
 Tue, 20 Oct 2020 16:09:36 +0000 (UTC)
Received: from bahia.lan (ovpn-115-53.ams2.redhat.com [10.36.115.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 674131002C0E;
 Tue, 20 Oct 2020 16:09:35 +0000 (UTC)
Subject: [PATCH v2 4/5] tests/9pfs: Factor out do_attach() helper
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 20 Oct 2020 18:09:34 +0200
Message-ID: <160321017450.266767.17377192504263871186.stgit@bahia.lan>
In-Reply-To: <160320977352.266767.5622969302437522296.stgit@bahia.lan>
References: <160320977352.266767.5622969302437522296.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 11:11:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fs_attach() is a top level test function. Factor out the reusable
code to a separate helper instead of hijacking it in other tests.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tests/qtest/virtio-9p-test.c |   28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index cc52ae9a77b3..3c187cdc08b7 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -589,10 +589,8 @@ static void fs_version(void *obj, void *data, QGuestAl=
locator *t_alloc)
     do_version(obj);
 }
=20
-static void fs_attach(void *obj, void *data, QGuestAllocator *t_alloc)
+static void do_attach(QVirtio9P *v9p)
 {
-    QVirtio9P *v9p =3D obj;
-    alloc =3D t_alloc;
     P9Req *req;
=20
     do_version(v9p);
@@ -601,6 +599,12 @@ static void fs_attach(void *obj, void *data, QGuestAll=
ocator *t_alloc)
     v9fs_rattach(req, NULL);
 }
=20
+static void fs_attach(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    alloc =3D t_alloc;
+    do_attach(obj);
+}
+
 static void fs_walk(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p =3D obj;
@@ -615,7 +619,7 @@ static void fs_walk(void *obj, void *data, QGuestAlloca=
tor *t_alloc)
         wnames[i] =3D g_strdup_printf(QTEST_V9FS_SYNTH_WALK_FILE, i);
     }
=20
-    fs_attach(v9p, NULL, t_alloc);
+    do_attach(v9p);
     req =3D v9fs_twalk(v9p, 0, 1, P9_MAXWELEM, wnames, 0);
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, &nwqid, &wqid);
@@ -684,7 +688,7 @@ static void fs_readdir(void *obj, void *data, QGuestAll=
ocator *t_alloc)
     struct V9fsDirent *entries =3D NULL;
     P9Req *req;
=20
-    fs_attach(v9p, NULL, t_alloc);
+    do_attach(v9p);
     req =3D v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, &nqid, NULL);
@@ -738,7 +742,7 @@ static void do_readdir_split(QVirtio9P *v9p, uint32_t c=
ount)
     int fid;
     uint64_t offset;
=20
-    fs_attach(v9p, NULL, t_alloc);
+    do_attach(v9p);
=20
     fid =3D 1;
     offset =3D 0;
@@ -814,7 +818,7 @@ static void fs_walk_no_slash(void *obj, void *data, QGu=
estAllocator *t_alloc)
     P9Req *req;
     uint32_t err;
=20
-    fs_attach(v9p, NULL, t_alloc);
+    do_attach(v9p);
     req =3D v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rlerror(req, &err);
@@ -854,7 +858,7 @@ static void fs_lopen(void *obj, void *data, QGuestAlloc=
ator *t_alloc)
     char *const wnames[] =3D { g_strdup(QTEST_V9FS_SYNTH_LOPEN_FILE) };
     P9Req *req;
=20
-    fs_attach(v9p, NULL, t_alloc);
+    do_attach(v9p);
     req =3D v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, NULL, NULL);
@@ -876,7 +880,7 @@ static void fs_write(void *obj, void *data, QGuestAlloc=
ator *t_alloc)
     uint32_t count;
     P9Req *req;
=20
-    fs_attach(v9p, NULL, t_alloc);
+    do_attach(v9p);
     req =3D v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, NULL, NULL);
@@ -903,7 +907,7 @@ static void fs_flush_success(void *obj, void *data, QGu=
estAllocator *t_alloc)
     uint32_t reply_len;
     uint8_t should_block;
=20
-    fs_attach(v9p, NULL, t_alloc);
+    do_attach(v9p);
     req =3D v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, NULL, NULL);
@@ -940,7 +944,7 @@ static void fs_flush_ignored(void *obj, void *data, QGu=
estAllocator *t_alloc)
     uint32_t count;
     uint8_t should_block;
=20
-    fs_attach(v9p, NULL, t_alloc);
+    do_attach(v9p);
     req =3D v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, NULL, NULL);
@@ -1026,7 +1030,7 @@ static void fs_create_dir(void *obj, void *data, QGue=
stAllocator *t_alloc)
=20
     g_assert(root_path !=3D NULL);
=20
-    fs_attach(v9p, NULL, t_alloc);
+    do_attach(v9p);
     fs_mkdir(v9p, data, t_alloc, "/", "01");
=20
     /* check if created directory really exists now ... */



