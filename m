Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903342C1F11
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 08:45:18 +0100 (CET)
Received: from localhost ([::1]:60262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khT0n-0000Ei-Kh
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 02:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khSzT-0008A6-Pw
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 02:43:55 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:25059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khSzS-0003EZ-6B
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 02:43:55 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-lKSfcGmbPZqr7DLtA98VEQ-1; Tue, 24 Nov 2020 02:43:46 -0500
X-MC-Unique: lKSfcGmbPZqr7DLtA98VEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49BE0108E1A0;
 Tue, 24 Nov 2020 07:43:45 +0000 (UTC)
Received: from bahia.lan (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7D3860C61;
 Tue, 24 Nov 2020 07:43:43 +0000 (UTC)
Subject: [PATCH v2 for-5.2] tests/9pfs: Mark "local" tests as "slow"
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 24 Nov 2020 08:43:43 +0100
Message-ID: <160620382310.1423262.7364287092069513483.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
v2: - less noisy patch
---
 tests/qtest/virtio-9p-test.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 21e340fa5f43..92a498f24925 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1456,6 +1456,15 @@ static void register_virtio_9p_test(void)
=20
=20
     /* 9pfs test cases using the 'local' filesystem driver */
+
+    /*
+     * XXX: Until we are sure that these tests can run everywhere,
+     * keep them as "slow" so that they aren't run with "make check".
+     */
+    if (!g_test_slow()) {
+        return;
+    }
+
     opts.before =3D assign_9p_local_driver;
     qos_add_test("local/config", "virtio-9p", pci_config,  &opts);
     qos_add_test("local/create_dir", "virtio-9p", fs_create_dir, &opts);



