Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925FA164B1F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:54:55 +0100 (CET)
Received: from localhost ([::1]:56476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4Scg-0001d6-Kg
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41193)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ovoshcha@redhat.com>) id 1j4SIT-0007Q2-JY
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:34:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ovoshcha@redhat.com>) id 1j4SIS-0003Tt-J8
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:34:01 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49348
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ovoshcha@redhat.com>) id 1j4SIS-0003TY-FI
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582130040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OD/wZeidx0VQVUbh9TK6tiB+tGCEedJMHHLeIb6e7sc=;
 b=KusA6Yww6jR0p5rK9xeAWlXMk5b8lh+3cT/nNKTNbJnR6yjeBtapp4CDJA1P1hDe5GMHms
 4US6lCede6DKStezveIhx7t3QUXXQkBks15cG09o1ge2BLmbr5eW12l0rQYbwz68JrDtTV
 45TVqnse3gwrjPo6I8xMcvXfOgBu4q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-iWQX4vtNM8CBx_ydobEltQ-1; Wed, 19 Feb 2020 11:33:57 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA1E3800D55
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 16:33:56 +0000 (UTC)
Received: from kh066.redhat.com (ovpn-205-79.brq.redhat.com [10.40.205.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E374D60BE1;
 Wed, 19 Feb 2020 16:33:54 +0000 (UTC)
From: Oksana Vohchana <ovoshcha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] Acceptance test: FD migration
Date: Wed, 19 Feb 2020 18:33:44 +0200
Message-Id: <20200219163344.27651-4-ovoshcha@redhat.com>
In-Reply-To: <20200219163344.27651-1-ovoshcha@redhat.com>
References: <20200219163344.27651-1-ovoshcha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: iWQX4vtNM8CBx_ydobEltQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: philmd@redhat.com, ehabkost@redhat.com, wainersm@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds a new migration test through the file descriptor.

Signed-off-by: Oksana Vohchana <ovoshcha@redhat.com>
---
 tests/acceptance/migration.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
index a8367ca023..b96a897f3b 100644
--- a/tests/acceptance/migration.py
+++ b/tests/acceptance/migration.py
@@ -10,7 +10,10 @@
 # later.  See the COPYING file in the top-level directory.
=20
=20
+import os
 import tempfile
+from socket import socketpair, AF_UNIX, SOCK_STREAM
+
 from avocado_qemu import Test
 from avocado import skipUnless
=20
@@ -75,3 +78,20 @@ class Migration(Test):
         """
         free_port =3D self._get_free_port()
         dest_uri =3D 'exec:nc -l localhost %u' % free_port
+
+    def test_migration_with_fd(self):
+        opaque =3D 'fd-migration'
+        data_to_send =3D b"{\"execute\": \"getfd\",  \"arguments\": {\"fdn=
ame\": \"fd-migration\"}}"
+        send_socket, recv_socket =3D socketpair(AF_UNIX, SOCK_STREAM)
+        fd1 =3D send_socket.fileno()
+        fd2 =3D recv_socket.fileno()
+        os.set_inheritable(fd2, True)
+
+        source_vm =3D self.get_vm()
+        source_vm.launch()
+        source_vm.send_fd_scm(fd=3Dfd1, data=3Ddata_to_send)
+
+        dest_vm =3D self.get_vm('-incoming', 'fd:%s' % fd2)
+        dest_vm.launch()
+        source_vm.qmp('migrate', uri=3D'fd:%s' % opaque)
+        self.assert_migration(source_vm, dest_vm)
--=20
2.21.1


