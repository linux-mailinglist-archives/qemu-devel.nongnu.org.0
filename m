Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D033C78EF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:23:46 +0200 (CEST)
Received: from localhost ([::1]:58384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3PsX-0005Db-Gh
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Ppd-0000zr-4S
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:20:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3PpZ-00080A-N6
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626211241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THmLqQsKEXOZbRKhS9beyVzcLcgkjletg78pbbNWyqE=;
 b=I/d7rox9QWGCfd1IA33t2hex23EywHHc6lhpkh5r7J6SUo9psykh/mMXcsaTTldGlhwLmo
 wmeQB9cRPo7NDGbl+PEaPscL9zhhQj8omiFwPsRJLjUZj95eLtV2+pF97l1/lx8lb32rN3
 UhzWz+o4mnaKN4AOW05Za7fiF8ifugY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-oqOCcSalMbupp5Khgj-0Ew-1; Tue, 13 Jul 2021 17:20:39 -0400
X-MC-Unique: oqOCcSalMbupp5Khgj-0Ew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF1211084F54;
 Tue, 13 Jul 2021 21:20:36 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7218A19C44;
 Tue, 13 Jul 2021 21:20:34 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 05/23] Acceptance Tests: move definition of distro checksums to
 the framework
Date: Tue, 13 Jul 2021 17:19:05 -0400
Message-Id: <20210713211923.3809241-6-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of having, by default, the checksum in the tests, and the
definition of tests in the framework, let's keep them together.

A central definition for distributions is available, and it should
allow other known distros to be added more easily.

No behavior change is expected here, and tests can still define
a distro_checksum value if for some reason they want to override
the known distribution information.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210414221457.1653745-3-crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Eric Auger <eric.auger@redhat.com>
[CR: split long lines]
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 39 +++++++++++++++++++++--
 tests/acceptance/boot_linux.py            | 12 -------
 2 files changed, 37 insertions(+), 14 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 0e62c15c60..3a144cded4 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -304,6 +304,35 @@ def ssh_command(self, command):
         return stdout_lines, stderr_lines
 
 
+#: A collection of known distros and their respective image checksum
+KNOWN_DISTROS = {
+    'fedora': {
+        '31': {
+            'x86_64':
+            {'checksum': ('e3c1b309d9203604922d6e255c2c5d09'
+                          '8a309c2d46215d8fc026954f3c5c27a0')},
+            'aarch64':
+            {'checksum': ('1e18d9c0cf734940c4b5d5ec592facae'
+                          'd2af0ad0329383d5639c997fdf16fe49')},
+            'ppc64':
+            {'checksum': ('7c3528b85a3df4b2306e892199a9e1e4'
+                          '3f991c506f2cc390dc4efa2026ad2f58')},
+            's390x':
+            {'checksum': ('4caaab5a434fd4d1079149a072fdc789'
+                          '1e354f834d355069ca982fdcaf5a122d')},
+            }
+        }
+    }
+
+
+def get_known_distro_checksum(distro, distro_version, arch):
+    try:
+        return KNOWN_DISTROS.get(distro).get(distro_version).\
+            get(arch).get('checksum')
+    except AttributeError:
+        return None
+
+
 class LinuxTest(Test, LinuxSSHMixIn):
     """Facilitates having a cloud-image Linux based available.
 
@@ -353,14 +382,20 @@ def download_boot(self):
         vmimage.QEMU_IMG = qemu_img
 
         self.log.info('Downloading/preparing boot image')
+        distro = 'fedora'
+        distro_version = '31'
+        known_distro_checksum = get_known_distro_checksum(distro,
+                                                          distro_version,
+                                                          self.arch)
+        distro_checksum = self.distro_checksum or known_distro_checksum
         # Fedora 31 only provides ppc64le images
         image_arch = self.arch
         if image_arch == 'ppc64':
             image_arch = 'ppc64le'
         try:
             boot = vmimage.get(
-                'fedora', arch=image_arch, version='31',
-                checksum=self.distro_checksum,
+                distro, arch=image_arch, version=distro_version,
+                checksum=distro_checksum,
                 algorithm='sha256',
                 cache_dir=self.cache_dirs[0],
                 snapshot_dir=self.workdir)
diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 3901c23690..34c4366366 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -20,9 +20,6 @@ class BootLinuxX8664(LinuxTest):
     :avocado: tags=arch:x86_64
     """
 
-    distro_checksum = ('e3c1b309d9203604922d6e255c2c5d09'
-                       '8a309c2d46215d8fc026954f3c5c27a0')
-
     def test_pc_i440fx_tcg(self):
         """
         :avocado: tags=machine:pc
@@ -67,9 +64,6 @@ class BootLinuxAarch64(LinuxTest):
     :avocado: tags=machine:gic-version=2
     """
 
-    distro_checksum = ('1e18d9c0cf734940c4b5d5ec592facae'
-                       'd2af0ad0329383d5639c997fdf16fe49')
-
     def add_common_args(self):
         self.vm.add_args('-bios',
                          os.path.join(BUILD_DIR, 'pc-bios',
@@ -121,9 +115,6 @@ class BootLinuxPPC64(LinuxTest):
     :avocado: tags=arch:ppc64
     """
 
-    distro_checksum = ('7c3528b85a3df4b2306e892199a9e1e4'
-                       '3f991c506f2cc390dc4efa2026ad2f58')
-
     def test_pseries_tcg(self):
         """
         :avocado: tags=machine:pseries
@@ -139,9 +130,6 @@ class BootLinuxS390X(LinuxTest):
     :avocado: tags=arch:s390x
     """
 
-    distro_checksum = ('4caaab5a434fd4d1079149a072fdc789'
-                       '1e354f834d355069ca982fdcaf5a122d')
-
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_s390_ccw_virtio_tcg(self):
         """
-- 
2.31.1


