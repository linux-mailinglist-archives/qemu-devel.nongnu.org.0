Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AB614D287
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 22:31:32 +0100 (CET)
Received: from localhost ([::1]:51616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwuvr-0007xJ-A3
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 16:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59441)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iwuoz-00055K-6e
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:24:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iwuoy-0000Gb-3C
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:24:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49913
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iwuox-0000G4-VU
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:24:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580333063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3bndag2XGLaCDWDNfL+YqNeN0d28knHOx1owLB5tFo=;
 b=P7QCXAfzdS1JQyf+aH5EXT3G4/bUto3ErwnonVzxQEoRcKTvbigfQjxgniL3LCxeiA7nGH
 nrRkcvm+cJwaYt/aZA6djeyi3Ck4Fr/P4wPG75JQO2wOwYyb/W5t1CbSKG2wDV3fDu10A0
 92fZlDO1ES07YanyRDC4uIMo5PQeWyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-TscoIS3oNUqVOD40mc-Rww-1; Wed, 29 Jan 2020 16:24:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D289100550E;
 Wed, 29 Jan 2020 21:24:20 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-184.brq.redhat.com [10.40.205.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7318960BF3;
 Wed, 29 Jan 2020 21:24:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/29] python/qemu: Add binutils::binary_get_machines()
Date: Wed, 29 Jan 2020 22:23:24 +0100
Message-Id: <20200129212345.20547-9-philmd@redhat.com>
In-Reply-To: <20200129212345.20547-1-philmd@redhat.com>
References: <20200129212345.20547-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: TscoIS3oNUqVOD40mc-Rww-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a helper to query the list of machines built into a QEMU binary.
We simply send the 'query-machines' command over a QMP socket.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 python/qemu/binutils.py          | 15 +++++++++++++++
 tests/acceptance/core_scripts.py |  9 +++++++++
 2 files changed, 24 insertions(+)

diff --git a/python/qemu/binutils.py b/python/qemu/binutils.py
index 905d393ba5..7bb57c521b 100644
--- a/python/qemu/binutils.py
+++ b/python/qemu/binutils.py
@@ -51,3 +51,18 @@ def binary_get_arch(qemu_bin):
         LOG.info(res)
         vm.shutdown()
         return res['arch']
+
+def binary_get_machines(qemu_bin):
+    '''
+    Get list of machines supported by a QEMU binary
+
+    @param qemu_bin (str): path to the QEMU binary
+    @return list of machines supported by the binary
+    '''
+    with QEMUMachine(qemu_bin) as vm:
+        vm.set_machine('none')
+        vm.launch()
+        res =3D vm.command('query-machines')
+        LOG.info(res)
+        vm.shutdown()
+        return [m['name'] for m in res]
diff --git a/tests/acceptance/core_scripts.py b/tests/acceptance/core_scrip=
ts.py
index 93dd822368..a5b112f928 100644
--- a/tests/acceptance/core_scripts.py
+++ b/tests/acceptance/core_scripts.py
@@ -17,6 +17,7 @@ import logging
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'pytho=
n'))
 from avocado_qemu import Test
 from qemu.binutils import binary_get_arch
+from qemu.binutils import binary_get_machines
 from qemu.binutils import binary_get_version
=20
=20
@@ -40,3 +41,11 @@ class PythonQemuCoreScripts(Test):
         a =3D binary_get_arch(self.qemu_bin)
         logger.debug('arch: {}'.format(a))
         self.assertIn(a, ['i386', 'x86_64'])
+
+    def test_get_machines(self):
+        logger =3D logging.getLogger('core')
+        machines =3D binary_get_machines(self.qemu_bin)
+        for m in sorted(machines):
+            logger.debug('machine: {}'.format(m))
+        # The 'none' machine is always available
+        self.assertIn('none', machines)
--=20
2.21.1


