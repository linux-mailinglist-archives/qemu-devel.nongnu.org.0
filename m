Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A1B2D75A0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 13:30:30 +0100 (CET)
Received: from localhost ([::1]:55948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knhZ7-0006Vu-2s
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 07:30:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knhW7-0004ZX-35
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:27:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knhW2-00011B-Gj
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607689637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZiB3cLEcpI2fyr3ns49tHKczcnhFyrsLkP7062UJBY=;
 b=N6aj+Hj35ru4SI+UrHL0Xf9TFUWvapJZzpuZaWmp9pudVvW8maMdC8Q4Wk0Bkc/EdR54Ar
 DDmUvlxScsuxvFcXA/LPplWJLpMi/eHa1cYfD7LGooiq6pbFdmMVsG0+bDumlrSrn4V66x
 bmHtduwcyi94EDK8IDLj+P2rEZX7AoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-QwDUBAYFN9qCCRiTAGvZmQ-1; Fri, 11 Dec 2020 07:27:10 -0500
X-MC-Unique: QwDUBAYFN9qCCRiTAGvZmQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03D80EC1C0;
 Fri, 11 Dec 2020 12:27:09 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-112-240.ams2.redhat.com
 [10.36.112.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9A1510016F4;
 Fri, 11 Dec 2020 12:27:04 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/6] tests/acceptance: add a test for devices on s390x
Date: Fri, 11 Dec 2020 13:26:54 +0100
Message-Id: <20201211122658.24481-3-cohuck@redhat.com>
In-Reply-To: <20201211122658.24481-1-cohuck@redhat.com>
References: <20201211122658.24481-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a very basic test for checking that we present devices
in a way that Linux can consume: boot with both virtio-net-ccw and
virtio-net-pci attached and then verify that Linux is able to see
and detect these devices.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201126130158.1471985-1-cohuck@redhat.com>
---
 MAINTAINERS                                 |  1 +
 tests/acceptance/machine_s390_ccw_virtio.py | 68 +++++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 tests/acceptance/machine_s390_ccw_virtio.py

diff --git a/MAINTAINERS b/MAINTAINERS
index a83416d54c08..a0dcd6b597ce 100644
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
index 000000000000..db6352c44434
--- /dev/null
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -0,0 +1,68 @@
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


