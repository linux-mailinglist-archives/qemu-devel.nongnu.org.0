Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7997392C7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 19:08:22 +0200 (CEST)
Received: from localhost ([::1]:49658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZILm-0003Oy-3t
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 13:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48788)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <crosa@redhat.com>) id 1hZGhp-00053g-Sf
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:23:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1hZGho-000693-P3
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:23:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32878)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1hZGho-00067Z-Jm
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:23:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E3AA73082145;
 Fri,  7 Jun 2019 15:22:59 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-122-62.rdu2.redhat.com
 [10.10.122.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB8AD82708;
 Fri,  7 Jun 2019 15:22:58 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jun 2019 11:22:22 -0400
Message-Id: <20190607152223.9467-8-crosa@redhat.com>
In-Reply-To: <20190607152223.9467-1-crosa@redhat.com>
References: <20190607152223.9467-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 07 Jun 2019 15:22:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 7/8] VNC Acceptance test: check protocol version
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This goes a bit further than the other tests, and does a basic (read
only) interaction with the VNC protocol.

This is not a enough to perform a handshake, but enough to make sure
that the socket is somewhat operational and that the expected initial
step of the handshake is performed by the server and that the version
matches.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/vnc.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/acceptance/vnc.py b/tests/acceptance/vnc.py
index d32ae46685..b000446d7c 100644
--- a/tests/acceptance/vnc.py
+++ b/tests/acceptance/vnc.py
@@ -11,6 +11,7 @@
 import os
 import tempfile
 import shutil
+import socket
=20
 from avocado_qemu import Test
=20
@@ -71,5 +72,16 @@ class VncUnixSocket(Test):
                                             arg=3D'new_password')
         self.assertEqual(set_password_response['return'], {})
=20
+    def test_protocol_version(self):
+        self.vm.add_args('-nodefaults', '-S',
+                         '-vnc', 'unix:%s' % self.socket_path)
+        self.vm.launch()
+        self.assertTrue(self.vm.qmp('query-vnc')['return']['enabled'])
+        client =3D socket.socket(socket.AF_UNIX)
+        client.connect(self.socket_path)
+        expected =3D b'RFB 003.008'
+        actual =3D client.recv(len(expected))
+        self.assertEqual(expected, actual, "Wrong protocol version")
+
     def tearDown(self):
         shutil.rmtree(self.socket_dir)
--=20
2.21.0


