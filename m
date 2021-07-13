Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6903C7903
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:34:35 +0200 (CEST)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Q30-0002rP-5C
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Ppu-00022L-OT
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:21:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Pps-0008EO-MU
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626211260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UK5a17W+X7crhERhK6kAeWAmsiRofQ74sUVXfii3LxI=;
 b=LbvzM5FfbY/ACa7TkbeyDRa7s+2sb9qsPfODHeCcNYubuzUiOs6DYEDWdDUjjQN8bwS/ZV
 DeryzcUGd1taRpsCzvWHa5wkFY6ifoUHoke2CThZUu5IWs2sQ/3Y1WDI+5LW9Rd8j8PVN4
 z7kzxYB1c3co0tgPGnht7KPkBnFh3Uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-5Y87oJ-eOMGVcSH0BqTNxg-1; Tue, 13 Jul 2021 17:20:56 -0400
X-MC-Unique: 5Y87oJ-eOMGVcSH0BqTNxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB896802921;
 Tue, 13 Jul 2021 21:20:54 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 510D919C44;
 Tue, 13 Jul 2021 21:20:52 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 08/23] avocado_qemu: Fix KNOWN_DISTROS map into the LinuxDistro
 class
Date: Tue, 13 Jul 2021 17:19:08 -0400
Message-Id: <20210713211923.3809241-9-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Willian Rampazzo <willianr@redhat.com>

As the KNOWN_DISTROS grows, more loosely methods will be created in
the avocado_qemu/__init__.py file.

Let's refactor the code so that KNOWN_DISTROS and related methods are
packaged in a class

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210706131729.30749-2-eric.auger@redhat.com>
[CR: moved aarch64 definition from patch 2 to 1]
[CR: protect get() when arch is not defined]
[CR: split long lines]
Acked-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 86 +++++++++++++----------
 1 file changed, 49 insertions(+), 37 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index c3163af3b7..256befafc4 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -306,34 +306,50 @@ def ssh_command(self, command):
                          f'Guest command failed: {command}')
         return stdout_lines, stderr_lines
 
+class LinuxDistro:
+    """Represents a Linux distribution
 
-#: A collection of known distros and their respective image checksum
-KNOWN_DISTROS = {
-    'fedora': {
-        '31': {
-            'x86_64':
-            {'checksum': ('e3c1b309d9203604922d6e255c2c5d09'
-                          '8a309c2d46215d8fc026954f3c5c27a0')},
-            'aarch64':
-            {'checksum': ('1e18d9c0cf734940c4b5d5ec592facae'
-                          'd2af0ad0329383d5639c997fdf16fe49')},
-            'ppc64':
-            {'checksum': ('7c3528b85a3df4b2306e892199a9e1e4'
-                          '3f991c506f2cc390dc4efa2026ad2f58')},
-            's390x':
-            {'checksum': ('4caaab5a434fd4d1079149a072fdc789'
-                          '1e354f834d355069ca982fdcaf5a122d')},
+    Holds information of known distros.
+    """
+    #: A collection of known distros and their respective image checksum
+    KNOWN_DISTROS = {
+        'fedora': {
+            '31': {
+                'x86_64':
+                {'checksum': ('e3c1b309d9203604922d6e255c2c5d09'
+                              '8a309c2d46215d8fc026954f3c5c27a0')},
+                'aarch64':
+                {'checksum': ('1e18d9c0cf734940c4b5d5ec592facae'
+                              'd2af0ad0329383d5639c997fdf16fe49')},
+                'ppc64':
+                {'checksum': ('7c3528b85a3df4b2306e892199a9e1e4'
+                              '3f991c506f2cc390dc4efa2026ad2f58')},
+                's390x':
+                {'checksum': ('4caaab5a434fd4d1079149a072fdc789'
+                              '1e354f834d355069ca982fdcaf5a122d')},
             }
         }
     }
 
+    def __init__(self, name, version, arch):
+        self.name = name
+        self.version = version
+        self.arch = arch
+        try:
+            info = self.KNOWN_DISTROS.get(name).get(version).get(arch)
+        except AttributeError:
+            # Unknown distro
+            info = None
+        self._info = info or {}
 
-def get_known_distro_checksum(distro, distro_version, arch):
-    try:
-        return KNOWN_DISTROS.get(distro).get(distro_version).\
-            get(arch).get('checksum')
-    except AttributeError:
-        return None
+    @property
+    def checksum(self):
+        """Gets the cloud-image file checksum"""
+        return self._info.get('checksum', None)
+
+    @checksum.setter
+    def checksum(self, value):
+        self._info['checksum'] = value
 
 
 class LinuxTest(Test, LinuxSSHMixIn):
@@ -344,24 +360,24 @@ class LinuxTest(Test, LinuxSSHMixIn):
     """
 
     timeout = 900
-    distro_checksum = None
+    distro = None
     username = 'root'
     password = 'password'
 
     def _set_distro(self):
-        distro = self.params.get(
+        distro_name = self.params.get(
             'distro',
             default=self._get_unique_tag_val('distro'))
-        if not distro:
-            distro = 'fedora'
-        self.distro = distro
+        if not distro_name:
+            distro_name = 'fedora'
 
         distro_version = self.params.get(
             'distro_version',
             default=self._get_unique_tag_val('distro_version'))
         if not distro_version:
             distro_version = '31'
-        self.distro_version = distro_version
+
+        self.distro = LinuxDistro(distro_name, distro_version, self.arch)
 
         # The distro checksum behaves differently than distro name and
         # version. First, it does not respect a tag with the same
@@ -370,13 +386,9 @@ def _set_distro(self):
         # order of precedence is: parameter, attribute and then value
         # from KNOWN_DISTROS.
         distro_checksum = self.params.get('distro_checksum',
-                                          default=self.distro_checksum)
-        if not distro_checksum:
-            distro_checksum = get_known_distro_checksum(self.distro,
-                                                        self.distro_version,
-                                                        self.arch)
+                                          default=None)
         if distro_checksum:
-            self.distro_checksum = distro_checksum
+            self.distro.checksum = distro_checksum
 
     def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
         super(LinuxTest, self).setUp()
@@ -418,14 +430,14 @@ def download_boot(self):
         self.log.info('Downloading/preparing boot image')
         # Fedora 31 only provides ppc64le images
         image_arch = self.arch
-        if self.distro == 'fedora':
+        if self.distro.name == 'fedora':
             if image_arch == 'ppc64':
                 image_arch = 'ppc64le'
 
         try:
             boot = vmimage.get(
-                self.distro, arch=image_arch, version=self.distro_version,
-                checksum=self.distro_checksum,
+                self.distro.name, arch=image_arch, version=self.distro.version,
+                checksum=self.distro.checksum,
                 algorithm='sha256',
                 cache_dir=self.cache_dirs[0],
                 snapshot_dir=self.workdir)
-- 
2.31.1


