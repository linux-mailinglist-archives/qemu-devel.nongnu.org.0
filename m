Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3C22C546B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 14:05:49 +0100 (CET)
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGy4-0001ws-Le
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 08:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kiGue-0000Fq-AZ
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 08:02:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kiGub-00035l-8C
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 08:02:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606395731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qc5Wt6Rcj+c7v1N+zlR0RN/8Zrqru5jsvHygIBCpLbI=;
 b=fkt4of9yhOByl4X3WNKFCBkYaaD+F3VeTxNWwa7CluTdpcAXEMMkNU3rv1idAKHZvHDlBL
 xUX8uUxPDcC2oaK80moDqq1QBh1PGEI0FkioPK77iIFmIAo8hNK1taLIr//zjGCrQNPfhr
 R3kP3f/iVFEiQalAhPMR0g04Fi0wMnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-Ywldb9P_O3Oc-m-C8qB8IA-1; Thu, 26 Nov 2020 08:02:03 -0500
X-MC-Unique: Ywldb9P_O3Oc-m-C8qB8IA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEAFC1009B63;
 Thu, 26 Nov 2020 13:02:02 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-125.ams2.redhat.com
 [10.36.113.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF88360873;
 Thu, 26 Nov 2020 13:02:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tests/acceptance: add a test for devices on s390x
Date: Thu, 26 Nov 2020 14:01:58 +0100
Message-Id: <20201126130158.1471985-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a very basic test for checking that we present devices
in a way that Linux can consume: boot with both virtio-net-ccw and
virtio-net-pci attached and then verify that Linux is able to see
and detect these devices.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
RFC->v2:
 - use a newer kernel that uses the uid in zpci address generation
 - add a zpci device to specify a uid
 - increase timeout
 - tweak naming
 - add a MAINTAINERS entry
---
 MAINTAINERS                                 |  1 +
 tests/acceptance/machine_s390_ccw_virtio.py | 70 +++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 tests/acceptance/machine_s390_ccw_virtio.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 68bc160f41bc..cc1c7c2ffed8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1426,6 +1426,7 @@ F: include/hw/s390x/
 F: hw/watchdog/wdt_diag288.c
 F: include/hw/watchdog/wdt_diag288.h
 F: default-configs/s390x-softmmu.mak
+F: tests/acceptance/machine_s390_ccw_virtio.py
 T: git https://github.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
new file mode 100644
index 000000000000..1f56be776c5f
--- /dev/null
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -0,0 +1,70 @@
+# Functional test that boots an s390x Linux guest with ccw and PCI devices
+# attached and checks whether the devices are recognized by Linux
+#
+# Copyright (c) 2020 Red Hat, Inc.
+#
+# Author:
+#  Cornelia Huck <cohuck@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+
+import os
+
+from avocado_qemu import Test
+from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import wait_for_console_pattern
+
+class S390CCWVirtioMachine(Test):
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    timeout = 120
+
+    def test_s390x_devices(self):
+
+        """
+        :avocado: tags=arch:s390x
+        :avocado: tags=machine:s390-ccw-virtio
+        """
+
+        kernel_url = ('https://snapshot.debian.org/archive/debian/'
+                      '20201126T092837Z/dists/buster/main/installer-s390x/'
+                      '20190702+deb10u6/images/generic/kernel.debian')
+        kernel_hash = '5821fbee57d6220a067a8b967d24595621aa1eb6'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        initrd_url = ('https://snapshot.debian.org/archive/debian/'
+                      '20201126T092837Z/dists/buster/main/installer-s390x/'
+                      '20190702+deb10u6/images/generic/initrd.debian')
+        initrd_hash = '81ba09c97bef46e8f4660ac25b4ac0a5be3a94d6'
+        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                              'console=sclp0 root=/dev/ram0 BOOT_DEBUG=3')
+        self.vm.add_args('-nographic',
+                         '-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line,
+                         '-device', 'virtio-net-ccw,devno=fe.1.1111',
+                         '-device', 'zpci,uid=5,target=zzz',
+                         '-device', 'virtio-net-pci,id=zzz')
+        self.vm.launch()
+
+        shell_ready = "sh: can't access tty; job control turned off"
+        self.wait_for_console_pattern(shell_ready)
+        # first debug shell is too early, we need to wait for device detection
+        exec_command_and_wait_for_pattern(self, 'exit', shell_ready)
+
+        ccw_bus_id="0.1.1111"
+        pci_bus_id="0005:00:00.0"
+        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
+                                          ccw_bus_id)
+        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/pci/devices/',
+                                          pci_bus_id)
-- 
2.26.2


