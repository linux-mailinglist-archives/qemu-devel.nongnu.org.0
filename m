Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51857346CE0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:26:47 +0100 (CET)
Received: from localhost ([::1]:50566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpU6-0004Ij-BW
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOpK5-0007Kt-Fr
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:16:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOpK1-0002vx-G9
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616537779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxyMINRc2kCT3U1iHvR5qE4P+n3VGqCOIDNeRgap+f4=;
 b=eXyGZ7WHJtGTLpaVHkbHiifiJltqCQboLvqWKsX/O+ItO3GfS2MgRQ/K8Vc80vLoXWizLO
 Q4EplwQqYbYwgMFkVFOToiec9zfIcnma6xkn/ZQ6f7q8qdJjY431ubC4/cwI9xky9P6bmO
 I2JP2viRTqWZECj6k1R9uoSWTVMsZMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345--6mH9M8pPGWMeBqWFRqw4A-1; Tue, 23 Mar 2021 18:16:18 -0400
X-MC-Unique: -6mH9M8pPGWMeBqWFRqw4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7E5E185302C;
 Tue, 23 Mar 2021 22:16:16 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-119-39.rdu2.redhat.com
 [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 211AE60877;
 Tue, 23 Mar 2021 22:16:15 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/10] Acceptance Tests: introduce CPU hotplug test
Date: Tue, 23 Mar 2021 18:15:39 -0400
Message-Id: <20210323221539.3532660-11-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-1-crosa@redhat.com>
References: <20210323221539.3532660-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though there are qtest based tests for hotplugging CPUs (from
which this test took some inspiration from), this one adds checks
from a Linux guest point of view.

It should also serve as an example for tests that follow a similar
pattern and need to interact with QEMU (via qmp) and with the Linux
guest via SSH.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/acceptance/hotplug_cpu.py | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 tests/acceptance/hotplug_cpu.py

diff --git a/tests/acceptance/hotplug_cpu.py b/tests/acceptance/hotplug_cpu.py
new file mode 100644
index 0000000000..6374bf1b54
--- /dev/null
+++ b/tests/acceptance/hotplug_cpu.py
@@ -0,0 +1,37 @@
+# Functional test that hotplugs a CPU and checks it on a Linux guest
+#
+# Copyright (c) 2021 Red Hat, Inc.
+#
+# Author:
+#  Cleber Rosa <crosa@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado_qemu import LinuxTest
+
+
+class HotPlugCPU(LinuxTest):
+
+    def test(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=machine:q35
+        :avocado: tags=accel:kvm
+        """
+        self.require_accelerator('kvm')
+        self.vm.add_args('-accel', 'kvm')
+        self.vm.add_args('-cpu', 'Haswell')
+        self.vm.add_args('-smp', '1,sockets=1,cores=2,threads=1,maxcpus=2')
+        self.launch_and_wait()
+
+        self.ssh_command('test -e /sys/devices/system/cpu/cpu0')
+        with self.assertRaises(AssertionError):
+            self.ssh_command('test -e /sys/devices/system/cpu/cpu1')
+
+        self.vm.command('device_add',
+                        driver='Haswell-x86_64-cpu',
+                        socket_id=0,
+                        core_id=1,
+                        thread_id=0)
+        self.ssh_command('test -e /sys/devices/system/cpu/cpu1')
-- 
2.25.4


