Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A61C158C04
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 10:44:01 +0100 (CET)
Received: from localhost ([::1]:46586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1S5I-0001lh-2f
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 04:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1j1S4K-0001BQ-W8
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 04:43:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1j1S4I-000414-DF
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 04:42:59 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35402
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1j1S4I-000407-0v
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 04:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581414177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fIjYrrtUzBal1nZOu55Pn0+XsFHbnXkUGqNALwbaVL0=;
 b=Xe+9LSOOh84dMyZUt5M4ohOXIDtEdKBwXA1+jLa4FIWAZZ1lFA7zbIcdGFnm2qKJzm17Ww
 4RoI/kjHOU6AOaJP1P2OFvVuprsrvkVEsjElujSGuMXoykZvJ7xHUqMhtvpm20BeHIM4XR
 vbHbVrJO7KKWHnxjU9EYPyR8cjDz6KU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-NMufFWx-M-mjWaUoX-a5ww-1; Tue, 11 Feb 2020 04:42:52 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1018B10054E3;
 Tue, 11 Feb 2020 09:42:51 +0000 (UTC)
Received: from thuth.com (ovpn-116-131.ams2.redhat.com [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E348E5C100;
 Tue, 11 Feb 2020 09:42:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] tests/acceptance: Add boot tests for sh4 and mips64 QEMU
 advent calendar images
Date: Tue, 11 Feb 2020 10:42:39 +0100
Message-Id: <20200211094239.20725-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: NMufFWx-M-mjWaUoX-a5ww-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we can select the second serial console in the acceptance tests
(see commit 746f244d9720 "Allow to use other serial consoles than default")=
,
we can also test the sh4 image from the QEMU advent calendar 2018.

And another recent commit (ec860426dfbe "Fix handling of LL/SC instructions=
")
fixed a problem with qemu-system-mips64, so the mips64 from the advent
calendar now works again and can be used for acceptance testing, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .travis.yml                            |  2 +-
 tests/acceptance/boot_linux_console.py | 23 +++++++++++++++++++++--
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 5887055951..71a0097878 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -313,7 +313,7 @@ matrix:
     # Acceptance (Functional) tests
     - name: "GCC check-acceptance"
       env:
-        - CONFIG=3D"--target-list=3Daarch64-softmmu,alpha-softmmu,arm-soft=
mmu,m68k-softmmu,microblaze-softmmu,mips-softmmu,mips64el-softmmu,nios2-sof=
tmmu,or1k-softmmu,ppc-softmmu,ppc64-softmmu,s390x-softmmu,sparc-softmmu,x86=
_64-softmmu,xtensa-softmmu"
+        - CONFIG=3D"--target-list=3Daarch64-softmmu,alpha-softmmu,arm-soft=
mmu,m68k-softmmu,microblaze-softmmu,mips-softmmu,mips64-softmmu,mips64el-so=
ftmmu,nios2-softmmu,or1k-softmmu,ppc-softmmu,ppc64-softmmu,s390x-softmmu,sh=
4-softmmu,sparc-softmmu,x86_64-softmmu,xtensa-softmmu"
         - TEST_CMD=3D"make check-acceptance"
       after_script:
         - python3 -c 'import json; r =3D json.load(open("tests/results/lat=
est/results.json")); [print(t["logfile"]) for t in r["tests"] if t["status"=
] not in ("PASS", "SKIP")]' | xargs cat
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py
index 34d37eba3b..a38ee004b1 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -591,12 +591,12 @@ class BootLinuxConsole(Test):
         console_pattern =3D 'No filesystem could mount root'
         self.wait_for_console_pattern(console_pattern)
=20
-    def do_test_advcal_2018(self, day, tar_hash, kernel_name):
+    def do_test_advcal_2018(self, day, tar_hash, kernel_name, console=3D0)=
:
         tar_url =3D ('https://www.qemu-advent-calendar.org'
                    '/2018/download/day' + day + '.tar.xz')
         file_path =3D self.fetch_asset(tar_url, asset_hash=3Dtar_hash)
         archive.extract(file_path, self.workdir)
-        self.vm.set_console()
+        self.vm.set_console(console_index=3Dconsole)
         self.vm.add_args('-kernel',
                          self.workdir + '/day' + day + '/' + kernel_name)
         self.vm.launch()
@@ -670,6 +670,25 @@ class BootLinuxConsole(Test):
         self.vm.add_args('-M', 'graphics=3Doff')
         self.do_test_advcal_2018('15', tar_hash, 'invaders.elf')
=20
+    def test_mips64_malta(self):
+        """
+        :avocado: tags=3Darch:mips64
+        :avocado: tags=3Dmachine:malta
+        :avocado: tags=3Dendian:big
+        """
+        tar_hash =3D '81b030201ec3f28cb1925297f6017d3a20d7ced5'
+        self.vm.add_args('-hda', self.workdir + '/day22/' + 'ri-li.qcow2',
+                         '-append', 'root=3D/dev/hda')
+        self.do_test_advcal_2018('22', tar_hash, 'vmlinux')
+
+    def test_sh4_r2d(self):
+        """
+        :avocado: tags=3Darch:sh4
+        :avocado: tags=3Dmachine:r2d
+        """
+        tar_hash =3D 'fe06a4fd8ccbf2e27928d64472939d47829d4c7e'
+        self.do_test_advcal_2018('09', tar_hash, 'zImage', console=3D1)
+
     def test_sparc_ss20(self):
         """
         :avocado: tags=3Darch:sparc
--=20
2.18.1


