Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F6B7F11
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 18:29:01 +0200 (CEST)
Received: from localhost ([::1]:46330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAzIi-0002qc-DR
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 12:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iAzH4-0001dn-JG
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 12:27:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iAzH3-0000AI-EY
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 12:27:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57740)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iAzH3-00009u-78
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 12:27:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6A96C87642;
 Thu, 19 Sep 2019 16:27:16 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-123-8.rdu2.redhat.com
 [10.10.123.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7685A5D9CC;
 Thu, 19 Sep 2019 16:27:10 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/2] BootLinuxSshTest: Only run the tests when explicitly
 requested
Date: Thu, 19 Sep 2019 12:26:58 -0400
Message-Id: <20190919162658.27442-3-crosa@redhat.com>
In-Reply-To: <20190919162658.27442-1-crosa@redhat.com>
References: <20190919162658.27442-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 19 Sep 2019 16:27:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Currently the Avocado framework does not distinct the time spent
downloading assets vs. the time spent running a test. With big
assets (like a full VM image) the tests likely fail.

This is a limitation known by the Avocado team.
Until this issue get fixed, do not run this tests automatically.

Tests can still be run setting the AVOCADO_TIMEOUT_EXPECTED
environment variable.

Reported-by: Gerd Hoffmann <kraxel@redhat.com>
Reported-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20190918122748.2144-1-philmd@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/linux_ssh_mips_malta.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/=
linux_ssh_mips_malta.py
index 134f10cac3..7200507a3a 100644
--- a/tests/acceptance/linux_ssh_mips_malta.py
+++ b/tests/acceptance/linux_ssh_mips_malta.py
@@ -12,7 +12,7 @@ import logging
 import paramiko
 import time
=20
-from avocado import skipIf
+from avocado import skipUnless
 from avocado_qemu import Test
 from avocado.utils import process
 from avocado.utils import archive
@@ -171,7 +171,7 @@ class LinuxSSH(Test):
         self.run_common_commands()
         self.shutdown_via_ssh()
=20
-    @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on Travis-CI')
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeo=
ut')
     def test_mips_malta32eb_kernel3_2_0(self):
         """
         :avocado: tags=3Darch:mips
@@ -186,7 +186,7 @@ class LinuxSSH(Test):
=20
         self.check_mips_malta('be', kernel_path, 'mips')
=20
-    @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on Travis-CI')
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeo=
ut')
     def test_mips_malta32el_kernel3_2_0(self):
         """
         :avocado: tags=3Darch:mipsel
@@ -201,7 +201,7 @@ class LinuxSSH(Test):
=20
         self.check_mips_malta('le', kernel_path, 'mips')
=20
-    @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on Travis-CI')
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeo=
ut')
     def test_mips_malta64eb_kernel3_2_0(self):
         """
         :avocado: tags=3Darch:mips64
@@ -215,7 +215,7 @@ class LinuxSSH(Test):
         kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel=
_hash)
         self.check_mips_malta('be', kernel_path, 'mips64')
=20
-    @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on Travis-CI')
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeo=
ut')
     def test_mips_malta64el_kernel3_2_0(self):
         """
         :avocado: tags=3Darch:mips64el
--=20
2.21.0


