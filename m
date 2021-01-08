Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B642EF7C6
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:59:20 +0100 (CET)
Received: from localhost ([::1]:33502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwyl-0003Dv-9D
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kxwwY-0001TX-R2
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:57:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kxwwV-0002nM-VV
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610132218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4MEkYnlz/tHGzVQU+sGexVWvIYGB0wA0vKeFAtUjhsw=;
 b=e8ayVcFfyHI9gWlizWg6iGJzPJ97obYkogtT5YB6U7XhavikqYNTl3YsuO67tgHXuDvZSi
 /OAQ+aKuzKL8w5VU7ar+y+JKR+Ut8D7b9O7G0e1hobVXcR4aADH4QcW39RrIyYlU/IqRYG
 rn72rVwPBcW58yuBoErJS3KFL+uV1OM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-vODWZ2N0N92b4HUPVgrGnQ-1; Fri, 08 Jan 2021 13:56:56 -0500
X-MC-Unique: vODWZ2N0N92b4HUPVgrGnQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 101701842140;
 Fri,  8 Jan 2021 18:56:55 +0000 (UTC)
Received: from thuth.com (ovpn-112-213.ams2.redhat.com [10.36.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEFA712D7E;
 Fri,  8 Jan 2021 18:56:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] tests/acceptance: Fix race conditions in s390x tests & skip
 fedora on gitlab-CI
Date: Fri,  8 Jan 2021 19:56:45 +0100
Message-Id: <20210108185645.86351-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There was a race condition in the first test where there was already the
"crw" output in the dmesg, but the "0.0.4711" entry has not been created
in the /sys fs yet. Fix it by waiting until it is there.

The second test has even more problems on gitlab-CI. Even after adding some
more synchronization points (that wait for some messages in the "dmesg"
output to make sure that the modules got loaded correctly), there are still
occasionally some hangs in this test when it is running in the gitlab-CI.
So far I was unable to reproduce these hangs locally on my computer, so
this issue might take a while to debug. Thus disable the 2nd test in the
gitlab-CI until the problems are better understood and fixed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/acceptance/machine_s390_ccw_virtio.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index eccf26b262..4028c99afc 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -12,6 +12,7 @@
 import os
 import tempfile
 
+from avocado import skipIf
 from avocado_qemu import Test
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import wait_for_console_pattern
@@ -133,8 +134,10 @@ class S390CCWVirtioMachine(Test):
         self.vm.command('device_add', driver='virtio-net-ccw',
                         devno='fe.0.4711', id='net_4711')
         self.wait_for_crw_reports()
-        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
-                                          '0.0.4711')
+        exec_command_and_wait_for_pattern(self, 'for i in 1 2 3 4 5 6 7 ; do '
+                    'if [ -e /sys/bus/ccw/devices/*4711 ]; then break; fi ;'
+                    'sleep 1 ; done ; ls /sys/bus/ccw/devices/',
+                    '0.0.4711')
         # and detach it again
         self.clear_guest_dmesg()
         self.vm.command('device_del', id='net_4711')
@@ -155,6 +158,7 @@ class S390CCWVirtioMachine(Test):
                                           'MemTotal:         115640 kB')
 
 
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_s390x_fedora(self):
 
         """
@@ -199,6 +203,9 @@ class S390CCWVirtioMachine(Test):
 
         # Some tests to see whether the CLI options have been considered:
         self.log.info("Test whether QEMU CLI options have been considered")
+        exec_command_and_wait_for_pattern(self,
+                        'while ! (dmesg | grep enP7p0s0) ; do sleep 1 ; done',
+                        'virtio_net virtio0 enP7p0s0: renamed')
         exec_command_and_wait_for_pattern(self, 'lspci',
                              '0007:00:00.0 Class 0200: Device 1af4:1000')
         exec_command_and_wait_for_pattern(self,
@@ -222,6 +229,9 @@ class S390CCWVirtioMachine(Test):
         # can simply read the written "magic bytes" back from the PPM file to
         # check whether the framebuffer is working as expected.
         self.log.info("Test screendump of virtio-gpu device")
+        exec_command_and_wait_for_pattern(self,
+                        'while ! (dmesg | grep gpudrmfb) ; do sleep 1 ; done',
+                        'virtio_gpudrmfb frame buffer device')
         exec_command_and_wait_for_pattern(self,
             'echo -e "\e[?25l" > /dev/tty0', ':/#')
         exec_command_and_wait_for_pattern(self, 'for ((i=0;i<250;i++)); do '
-- 
2.27.0


