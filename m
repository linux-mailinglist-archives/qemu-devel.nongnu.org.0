Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB19E7D6C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 01:06:25 +0100 (CET)
Received: from localhost ([::1]:45788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPF1k-0004Jy-CO
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 20:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59054)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iPEn2-000307-Ms
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 19:51:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iPEmc-00042j-P5
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 19:50:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32430
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iPEmc-00042d-M2
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 19:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572306646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zT/uKBaLW1ih4CcLIRZ9X0OUaI2DVTbf1uOXVEtrFYQ=;
 b=VQNadjl1tQewleJke0hjv1WkmAsQ0ewn9NRO3MSGgFlvjOyd0s4Ulq093eiG3FaWioprMm
 R9VzWG2+8ru7bZvO5SSNRXqaNHi2m6wr+OdbAKdAbjwsdGEWYtqQ6OQxocRN1iErLAq8RR
 PsVYD7ruQM66PtDYasdxdQKruqDD7pw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-NepKPLkKNXSsxz3xPEDsCA-1; Mon, 28 Oct 2019 19:50:42 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E94668017DD;
 Mon, 28 Oct 2019 23:50:40 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-123-183.rdu2.redhat.com
 [10.10.123.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA6E95C1B2;
 Mon, 28 Oct 2019 23:50:38 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PULL 8/16] tests/acceptance: Add test that boots the HelenOS
 microkernel on Leon3
Date: Mon, 28 Oct 2019 19:49:54 -0400
Message-Id: <20191028235002.17691-9-crosa@redhat.com>
In-Reply-To: <20191028235002.17691-1-crosa@redhat.com>
References: <20191028235002.17691-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: NepKPLkKNXSsxz3xPEDsCA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: Fam Zheng <fam@euphon.net>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Release notes:
http://www.helenos.org/wiki/Download#HelenOS0.6.0

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20191028073441.6448-11-philmd@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
[Cleber: added/removed needed/unneeded imports]
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 MAINTAINERS                             |  1 +
 tests/acceptance/machine_sparc_leon3.py | 34 +++++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 tests/acceptance/machine_sparc_leon3.py

diff --git a/MAINTAINERS b/MAINTAINERS
index a0dd1041b2..afcd365550 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1173,6 +1173,7 @@ S: Maintained
 F: hw/sparc/leon3.c
 F: hw/*/grlib*
 F: include/hw/*/grlib*
+F: tests/acceptance/machine_sparc_leon3.py
=20
 S390 Machines
 -------------
diff --git a/tests/acceptance/machine_sparc_leon3.py b/tests/acceptance/mac=
hine_sparc_leon3.py
new file mode 100644
index 0000000000..298f1e25e6
--- /dev/null
+++ b/tests/acceptance/machine_sparc_leon3.py
@@ -0,0 +1,34 @@
+# Functional test that boots a Leon3 machine and checks its serial console=
.
+#
+# Copyright (c) Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later. See the COPYING file in the top-level directory.
+
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+
+
+class Leon3Machine(Test):
+
+    timeout =3D 60
+
+    def test_leon3_helenos_uimage(self):
+        """
+        :avocado: tags=3Darch:sparc
+        :avocado: tags=3Dmachine:leon3
+        :avocado: tags=3Dbinfmt:uimage
+        """
+        kernel_url =3D ('http://www.helenos.org/releases/'
+                      'HelenOS-0.6.0-sparc32-leon3.bin')
+        kernel_hash =3D 'a88c9cfdb8430c66650e5290a08765f9bf049a30'
+        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel_h=
ash)
+
+        self.vm.set_machine('leon3_generic')
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_path)
+
+        self.vm.launch()
+
+        wait_for_console_pattern(self, 'Copyright (c) 2001-2014 HelenOS pr=
oject')
+        wait_for_console_pattern(self, 'Booting the kernel ...')
--=20
2.21.0


