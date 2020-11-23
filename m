Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270F32C1239
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 18:43:38 +0100 (CET)
Received: from localhost ([::1]:52906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khFsH-0002Es-76
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 12:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khFqn-0001Lp-MY
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 12:42:05 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:60128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khFql-0002op-Vb
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 12:42:05 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-2Ft11V_QNgykqrjT5wFxNw-1; Mon, 23 Nov 2020 12:41:54 -0500
X-MC-Unique: 2Ft11V_QNgykqrjT5wFxNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7262B186E8ED;
 Mon, 23 Nov 2020 17:41:53 +0000 (UTC)
Received: from bahia.lan (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BBAB60873;
 Mon, 23 Nov 2020 17:41:52 +0000 (UTC)
Subject: [PATCH for-5.2] tests/9pfs: Mark "local" tests as "slow"
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 23 Nov 2020 18:41:51 +0100
Message-ID: <160615331159.1339160.8458952247626802787.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "local" tests can fail on some automated build systems as
reported here:

https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05510.html

This will need to be investigated and addressed later. Let's go for a
workaround in the meantime : mark the "local" tests as "slow" so that
they aren't executed with a simple "make check" like in the case above.

Reported-by: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
---

Unless there's a strong argument against merging this, I'll post
a PR with this fix for RC3.
---
 tests/qtest/virtio-9p-test.c |   35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 21e340fa5f43..dad37ace9772 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1454,20 +1454,27 @@ static void register_virtio_9p_test(void)
     qos_add_test("synth/readdir/split_128", "virtio-9p",
                  fs_readdir_split_128,  &opts);
=20
-
-    /* 9pfs test cases using the 'local' filesystem driver */
-    opts.before =3D assign_9p_local_driver;
-    qos_add_test("local/config", "virtio-9p", pci_config,  &opts);
-    qos_add_test("local/create_dir", "virtio-9p", fs_create_dir, &opts);
-    qos_add_test("local/unlinkat_dir", "virtio-9p", fs_unlinkat_dir, &opts=
);
-    qos_add_test("local/create_file", "virtio-9p", fs_create_file, &opts);
-    qos_add_test("local/unlinkat_file", "virtio-9p", fs_unlinkat_file, &op=
ts);
-    qos_add_test("local/symlink_file", "virtio-9p", fs_symlink_file, &opts=
);
-    qos_add_test("local/unlinkat_symlink", "virtio-9p", fs_unlinkat_symlin=
k,
-                 &opts);
-    qos_add_test("local/hardlink_file", "virtio-9p", fs_hardlink_file, &op=
ts);
-    qos_add_test("local/unlinkat_hardlink", "virtio-9p", fs_unlinkat_hardl=
ink,
-                 &opts);
+    if (g_test_slow()) {
+        /* 9pfs test cases using the 'local' filesystem driver */
+        /*
+         * XXX: Until we are sure that these tests can run everywhere,
+         * keep them as "slow" so that they aren't run with "make check"
+         */
+        opts.before =3D assign_9p_local_driver;
+        qos_add_test("local/config", "virtio-9p", pci_config,  &opts);
+        qos_add_test("local/create_dir", "virtio-9p", fs_create_dir, &opts=
);
+        qos_add_test("local/unlinkat_dir", "virtio-9p", fs_unlinkat_dir, &=
opts);
+        qos_add_test("local/create_file", "virtio-9p", fs_create_file, &op=
ts);
+        qos_add_test("local/unlinkat_file", "virtio-9p", fs_unlinkat_file,
+                     &opts);
+        qos_add_test("local/symlink_file", "virtio-9p", fs_symlink_file, &=
opts);
+        qos_add_test("local/unlinkat_symlink", "virtio-9p", fs_unlinkat_sy=
mlink,
+                     &opts);
+        qos_add_test("local/hardlink_file", "virtio-9p", fs_hardlink_file,
+                     &opts);
+        qos_add_test("local/unlinkat_hardlink", "virtio-9p",
+                     fs_unlinkat_hardlink, &opts);
+    }
 }
=20
 libqos_init(register_virtio_9p_test);



