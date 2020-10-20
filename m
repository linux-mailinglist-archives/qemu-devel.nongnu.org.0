Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5852E29409F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 18:35:28 +0200 (CEST)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUubf-0003MO-CI
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 12:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kUuCs-0004QJ-Vn
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 12:09:50 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:37221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kUuCr-0005P5-I4
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 12:09:50 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-tR1wTTxdNK-vTpFXgOwhDA-1; Tue, 20 Oct 2020 12:09:44 -0400
X-MC-Unique: tR1wTTxdNK-vTpFXgOwhDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15216803F42;
 Tue, 20 Oct 2020 16:09:43 +0000 (UTC)
Received: from bahia.lan (ovpn-115-53.ams2.redhat.com [10.36.115.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 645B66EF62;
 Tue, 20 Oct 2020 16:09:42 +0000 (UTC)
Subject: [PATCH v2 5/5] tests/9pfs: Turn fs_mkdir() into a helper
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 20 Oct 2020 18:09:41 +0200
Message-ID: <160321018148.266767.15959608711038504029.stgit@bahia.lan>
In-Reply-To: <160320977352.266767.5622969302437522296.stgit@bahia.lan>
References: <160320977352.266767.5622969302437522296.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 11:11:37
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

fs_mkdir() isn't a top level test function and thus shouldn't take
the "void *obj, void *data, QGuestAllocator *t_alloc" arguments.
Turn it into a helper to be used by test functions.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tests/qtest/virtio-9p-test.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 3c187cdc08b7..2ea555fa045a 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -972,11 +972,8 @@ static void fs_flush_ignored(void *obj, void *data, QG=
uestAllocator *t_alloc)
     g_free(wnames[0]);
 }
=20
-static void fs_mkdir(void *obj, void *data, QGuestAllocator *t_alloc,
-                     const char *path, const char *cname)
+static void do_mkdir(QVirtio9P *v9p, const char *path, const char *cname)
 {
-    QVirtio9P *v9p =3D obj;
-    alloc =3D t_alloc;
     char **wnames;
     char *const name =3D g_strdup(cname);
     P9Req *req;
@@ -1031,7 +1028,7 @@ static void fs_create_dir(void *obj, void *data, QGue=
stAllocator *t_alloc)
     g_assert(root_path !=3D NULL);
=20
     do_attach(v9p);
-    fs_mkdir(v9p, data, t_alloc, "/", "01");
+    do_mkdir(v9p, "/", "01");
=20
     /* check if created directory really exists now ... */
     g_assert(stat(new_dir, &st) =3D=3D 0);



