Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA83979F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 23:19:53 +0200 (CEST)
Received: from localhost ([::1]:53318 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZMH8-0000W1-JX
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 17:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37779)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hZMDU-0006zf-Tp
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 17:16:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hZMDT-0002VE-R6
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 17:16:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55756)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hZMDT-0002Tu-KG
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 17:16:03 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0A1CA30C318A;
 Fri,  7 Jun 2019 21:15:51 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4389119C59;
 Fri,  7 Jun 2019 21:15:48 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Date: Fri,  7 Jun 2019 18:15:37 -0300
Message-Id: <20190607211544.7964-2-ehabkost@redhat.com>
In-Reply-To: <20190607211544.7964-1-ehabkost@redhat.com>
References: <20190607211544.7964-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 07 Jun 2019 21:15:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/8] tests/boot_linux_console: Let
 extract_from_deb handle various compressions
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Debian binary package format supports various compressions.

Per man deb(5):

  NAME
    deb - Debian binary package format

  FORMAT
    ...
    The third, last required member is named data.tar.  It contains the
    filesystem as a tar archive, either not compressed (supported since
    dpkg 1.10.24), or compressed with gzip (with .gz extension),
    xz (with .xz extension, supported since dpkg 1.15.6),
    bzip2 (with .bz2 extension, supported since dpkg 1.10.24) or
    lzma (with .lzma extension, supported since dpkg 1.13.25).

List the archive files to have the 3rd name with the correct extension.

The function avocado.utils.archive.extract() will handle the different
compression format for us.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190312234541.2887-2-philmd@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
index d5c500ea30..6aa084e049 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -55,8 +55,9 @@ class BootLinuxConsole(Test):
         """
         cwd =3D os.getcwd()
         os.chdir(self.workdir)
-        process.run("ar x %s data.tar.gz" % deb)
-        archive.extract("data.tar.gz", self.workdir)
+        file_path =3D process.run("ar t %s" % deb).stdout_text.split()[2=
]
+        process.run("ar x %s %s" % (deb, file_path))
+        archive.extract(file_path, self.workdir)
         os.chdir(cwd)
         return self.workdir + path
=20
--=20
2.18.0.rc1.1.g3f1ff2140


