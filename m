Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984D91504A3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 11:54:43 +0100 (CET)
Received: from localhost ([::1]:37828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyZNK-0005ju-NC
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 05:54:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51363)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ovoshcha@redhat.com>) id 1iyZLT-0003GF-AD
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 05:52:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ovoshcha@redhat.com>) id 1iyZLS-0008Jq-93
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 05:52:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20549
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ovoshcha@redhat.com>) id 1iyZLS-0008JV-5Z
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 05:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580727165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vC5WzixymZF9u+k1pZcqk8Ix1KQUjRIK+BOj9Q19EkA=;
 b=b+WHbK8iZqXjGiX5OOJwA1FtG2m3Yi94cJl2ilRWGrY96x1UvG7RBZhipeBNkbmFs3ktSG
 xboe49L4c+vRPB3giRqdhnRkyRA8xMpfCfAb7SgZMQf6NieNHFX4Qz6rFsUrlud702C1uW
 f44KW0UFtlCywm8enRXV1pj4cxpauQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-byxLAwttNNWXMCY-gAAS0g-1; Mon, 03 Feb 2020 05:52:44 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66D58107ACC4
 for <qemu-devel@nongnu.org>; Mon,  3 Feb 2020 10:52:43 +0000 (UTC)
Received: from kh066.redhat.com (ovpn-116-185.ams2.redhat.com [10.36.116.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4815F10013A7;
 Mon,  3 Feb 2020 10:52:42 +0000 (UTC)
From: Oksana Vohchana <ovoshcha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] Acceptance test: provides to use different transport
 for migration
Date: Mon,  3 Feb 2020 12:52:33 +0200
Message-Id: <20200203105233.15692-3-ovoshcha@redhat.com>
In-Reply-To: <20200203105233.15692-1-ovoshcha@redhat.com>
References: <20200203105233.15692-1-ovoshcha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: byxLAwttNNWXMCY-gAAS0g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: philmd@redhat.com, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Along with VM migration via TCP, we can use migration through EXEC
and UNIX transport protocol

Signed-off-by: Oksana Vohchana <ovoshcha@redhat.com>
---
v2:
  - Removes unnecessary symbols and unused method

v3:
 - Makes refactoring and split into 2 patches
 - Provides TCP and EXEC migration
Signed-off-by: Oksana Vohchana <ovoshcha@redhat.com>
---
 tests/acceptance/migration.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
index 34263d8eeb..4419e38384 100644
--- a/tests/acceptance/migration.py
+++ b/tests/acceptance/migration.py
@@ -10,10 +10,13 @@
 # later.  See the COPYING file in the top-level directory.
=20
=20
+import tempfile
 from avocado_qemu import Test
+from avocado import skipUnless
=20
 from avocado.utils import network
 from avocado.utils import wait
+from avocado.utils.path import find_command
=20
=20
 class Migration(Test):
@@ -54,3 +57,16 @@ class Migration(Test):
     def test_migration_with_tcp_localhost(self):
         dest_uri =3D 'tcp:localhost:%u' % self._get_free_port()
         self.do_migrate(dest_uri)
+
+    def test_migration_with_unix(self):
+        with tempfile.TemporaryDirectory(prefix=3D'socket_') as socket_pat=
h:
+            dest_uri =3D 'unix:%s/qemu-test.sock' % socket_path
+            self.do_migrate(dest_uri)
+
+    @skipUnless(find_command('nc', default=3DFalse), "nc command not found=
 on the system")
+    def test_migration_with_exec(self):
+        """
+        The test works for both netcat-traditional and netcat-openbsd pack=
ages
+        """
+        free_port =3D self._get_free_port()
+        dest_uri =3D 'exec:nc -l localhost %u' % free_port
--=20
2.21.1


