Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4833BD7AD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:22:03 +0200 (CEST)
Received: from localhost ([::1]:51138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0l1W-0000mS-3f
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m0kxi-00026j-Jg
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:18:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m0kxW-0007ny-Na
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:18:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625577473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L9zucO0YT73veOSaGVS1qVMDfBuyR92BI+w+N+d4NXg=;
 b=iVM4oUly0KOUN56dueN4MZ2WSStKmtYd1IBp1U66zgCj+E6cLrGiC/IqseBpK8MvsocIbM
 teDqwkoacAHMNQAdjDQLX88RhOgoLUlxl2nGSsA3tU3GrU5yUUUyOWZCd9NFlhsO/5t/Iv
 QwXNPubTqSM0RNG1wqiGplbDWtbxzxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-e9mWifFhO4C-Se1hTML3_g-1; Tue, 06 Jul 2021 09:17:51 -0400
X-MC-Unique: e9mWifFhO4C-Se1hTML3_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9421719251A0;
 Tue,  6 Jul 2021 13:17:50 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-159.ams2.redhat.com [10.36.113.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6BB269CB8;
 Tue,  6 Jul 2021 13:17:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 philmd@redhat.com, crosa@redhat.com, wainersm@redhat.com
Subject: [PATCH v5 1/4] avocado_qemu: Fix KNOWN_DISTROS map into the
 LinuxDistro class
Date: Tue,  6 Jul 2021 15:17:26 +0200
Message-Id: <20210706131729.30749-2-eric.auger@redhat.com>
In-Reply-To: <20210706131729.30749-1-eric.auger@redhat.com>
References: <20210706131729.30749-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

As the KNOWN_DISTROS grows, more loosely methods will be created in
the avocado_qemu/__init__.py file.

Let's refactor the code so that KNOWN_DISTROS and related methods are
packaged in a class

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 74 +++++++++++++----------
 1 file changed, 42 insertions(+), 32 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 81ac90bebb..af93cd63ea 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -299,29 +299,43 @@ def ssh_command(self, command):
                          f'Guest command failed: {command}')
         return stdout_lines, stderr_lines
 
+class LinuxDistro:
+    """Represents a Linux distribution
 
-#: A collection of known distros and their respective image checksum
-KNOWN_DISTROS = {
-    'fedora': {
-        '31': {
-            'x86_64':
-            {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
-            'aarch64':
-            {'checksum': '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'},
-            'ppc64':
-            {'checksum': '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
-            's390x':
-            {'checksum': '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
+    Holds information of known distros.
+    """
+    #: A collection of known distros and their respective image checksum
+    KNOWN_DISTROS = {
+        'fedora': {
+            '31': {
+                'x86_64':
+                {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
+                'ppc64':
+                {'checksum': '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
+                's390x':
+                {'checksum': '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
             }
         }
     }
 
+    def __init__(self, name, version, arch):
+        self.name = name
+        self.version = version
+        self.arch = arch
+        try:
+            self._info = self.KNOWN_DISTROS.get(name).get(version).get(arch)
+        except AttributeError:
+            # Unknown distro
+            self._info = {}
 
-def get_known_distro_checksum(distro, distro_version, arch):
-    try:
-        return KNOWN_DISTROS.get(distro).get(distro_version).get(arch).get('checksum')
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
@@ -332,24 +346,24 @@ class LinuxTest(Test, LinuxSSHMixIn):
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
@@ -358,13 +372,9 @@ def _set_distro(self):
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
@@ -406,14 +416,14 @@ def download_boot(self):
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
2.26.3


