Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A635FDA6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 00:18:04 +0200 (CEST)
Received: from localhost ([::1]:59422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWnpj-0006ht-Sy
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 18:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lWnnE-0005KN-GO
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 18:15:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lWnn1-00079m-5u
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 18:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618438514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0rk6ZpicPEu0z7XjZbHR1K9MmKw8Vr9+6KPRkz/za04=;
 b=XZ9hz8EtUxQ9AshgcmqjNct+hFM0avSW1ozpSqMxXNOyfjp8Fyc3UzVr1LsfPSlcT/CUjy
 SVSwucCiTb+bSUOlCGwb44m+YcCwDhsoqwvtaK99RWEyUgtbn3lWMw84qzfxuP5bBInlnv
 YU1OojcNmOx84MH8CCfHaxblH24ilGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-zBsR5nYgMuqBK45E3st1_Q-1; Wed, 14 Apr 2021 18:15:11 -0400
X-MC-Unique: zBsR5nYgMuqBK45E3st1_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFE2E107ACC7;
 Wed, 14 Apr 2021 22:15:10 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-207.rdu2.redhat.com
 [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD0441F44E;
 Wed, 14 Apr 2021 22:15:09 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] Acceptance Tests: support choosing specific distro and
 version
Date: Wed, 14 Apr 2021 18:14:57 -0400
Message-Id: <20210414221457.1653745-4-crosa@redhat.com>
In-Reply-To: <20210414221457.1653745-1-crosa@redhat.com>
References: <20210414221457.1653745-1-crosa@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tests based on the LinuxTest class give the test writer a ready to
use guest operating system, currently pinned to Fedora 31.

With this change, it's now possible to choose different distros and
versions, similar to how other tags and parameter can be set for the
target arch, accelerator, etc.

One of the reasons for this work, is that some development features
depend on updates on the guest side.  For instance the tests on
virtiofs_submounts.py, require newer kernels, and may benefit from
running, say on Fedora 34, without the need for a custom kernel.

Please notice that the pre-caching of the Fedora 31 images done during
the early stages of `make check-acceptance` (before the tests are
actually executed) are not expanded here to cover every new image
added.  But, the tests will download other needed images (and cache
them) during the first execution.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 docs/devel/testing.rst                    | 65 +++++++++++++++++++++++
 tests/acceptance/avocado_qemu/__init__.py | 47 ++++++++++++----
 2 files changed, 102 insertions(+), 10 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 4e42392810..19cbf532ae 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -922,6 +922,39 @@ The preserved value of the ``qemu_bin`` parameter or the result of the
 dynamic probe for a QEMU binary in the current working directory or
 source tree.
 
+LinuxTest
+~~~~~~~~~
+
+Besides the attributes present on the ``avocado_qemu.Test`` base
+class, the ``avocado_qemu.LinuxTest`` adds the following attributes:
+
+distro
+......
+
+The name of the Linux distribution used as the guest image for the
+test.  The name should match the **Provider** column on the list
+of images supported by the avocado.utils.vmimage library:
+
+https://avocado-framework.readthedocs.io/en/latest/guides/writer/libs/vmimage.html#supported-images
+
+distro_version
+..............
+
+The version of the Linux distribution as the guest image for the
+test.  The name should match the **Version** column on the list
+of images supported by the avocado.utils.vmimage library:
+
+https://avocado-framework.readthedocs.io/en/latest/guides/writer/libs/vmimage.html#supported-images
+
+distro_checksum
+...............
+
+The sha256 hash of the guest image file used for the test.
+
+If this value is not set in the code or by a test parameter (with the
+same name), no validation on the integrity of the image will be
+performed.
+
 Parameter reference
 -------------------
 
@@ -962,6 +995,38 @@ qemu_bin
 
 The exact QEMU binary to be used on QEMUMachine.
 
+LinuxTest
+~~~~~~~~~
+
+Besides the parameters present on the ``avocado_qemu.Test`` base
+class, the ``avocado_qemu.LinuxTest`` adds the following parameters:
+
+distro
+......
+
+The name of the Linux distribution used as the guest image for the
+test.  The name should match the **Provider** column on the list
+of images supported by the avocado.utils.vmimage library:
+
+https://avocado-framework.readthedocs.io/en/latest/guides/writer/libs/vmimage.html#supported-images
+
+distro_version
+..............
+
+The version of the Linux distribution as the guest image for the
+test.  The name should match the **Version** column on the list
+of images supported by the avocado.utils.vmimage library:
+
+https://avocado-framework.readthedocs.io/en/latest/guides/writer/libs/vmimage.html#supported-images
+
+distro_checksum
+...............
+
+The sha256 hash of the guest image file used for the test.
+
+If this value is not set in the code or by this parameter no
+validation on the integrity of the image will be performed.
+
 Skipping tests
 --------------
 The Avocado framework provides Python decorators which allow for easily skip
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 97093614d9..6fd0016917 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -335,8 +335,39 @@ class LinuxTest(Test, LinuxSSHMixIn):
     username = 'root'
     password = 'password'
 
+    def _set_distro(self):
+        distro = self.params.get(
+            'distro',
+            default=self._get_unique_tag_val('distro'))
+        if not distro:
+            distro = 'fedora'
+        self.distro = distro
+
+        distro_version = self.params.get(
+            'distro_version',
+            default=self._get_unique_tag_val('distro_version'))
+        if not distro_version:
+            distro_version = '31'
+        self.distro_version = distro_version
+
+        # The distro checksum behaves differently than distro name and
+        # version. First, it does not respect a tag with the same
+        # name, given that it's not expected to be used for filtering
+        # (distro name versions are the natural choice).  Second, the
+        # order of precedence is: parameter, attribute and then value
+        # from KNOWN_DISTROS.
+        distro_checksum = self.params.get('distro_checksum',
+                                          default=self.distro_checksum)
+        if not distro_checksum:
+            distro_checksum = get_known_distro_checksum(self.distro,
+                                                        self.distro_version,
+                                                        self.arch)
+        if distro_checksum:
+            self.distro_checksum = distro_checksum
+
     def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
         super(LinuxTest, self).setUp()
+        self._set_distro()
         self.vm.add_args('-smp', '2')
         self.vm.add_args('-m', '1024')
         # The following network device allows for SSH connections
@@ -372,20 +403,16 @@ def download_boot(self):
         vmimage.QEMU_IMG = qemu_img
 
         self.log.info('Downloading/preparing boot image')
-        distro = 'fedora'
-        distro_version = '31'
-        known_distro_checksum = get_known_distro_checksum(distro,
-                                                          distro_version,
-                                                          self.arch)
-        distro_checksum = self.distro_checksum or known_distro_checksum
         # Fedora 31 only provides ppc64le images
         image_arch = self.arch
-        if image_arch == 'ppc64':
-            image_arch = 'ppc64le'
+        if self.distro == 'fedora':
+            if image_arch == 'ppc64':
+                image_arch = 'ppc64le'
+
         try:
             boot = vmimage.get(
-                distro, arch=image_arch, version=distro_version,
-                checksum=distro_checksum,
+                self.distro, arch=image_arch, version=self.distro_version,
+                checksum=self.distro_checksum,
                 algorithm='sha256',
                 cache_dir=self.cache_dirs[0],
                 snapshot_dir=self.workdir)
-- 
2.25.4


