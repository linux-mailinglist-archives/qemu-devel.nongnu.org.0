Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8FC30E176
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:52:29 +0100 (CET)
Received: from localhost ([::1]:51422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MKH-000329-H6
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:52:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l7LuB-00027X-Qh
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:25:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l7Lu4-0004ZG-FX
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612373119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpDcUCq8DV4Xy0rNpbty3md4NOTTQ/BGy/PcQvKzxI4=;
 b=fFEWZTUHl2avdVRk9fLzE2Lf9YWnP2PCbUIrJgy2c+zZ19iNhUlRn4OtQSQavOIfjMF9wl
 zKohQGA2xos7AdrzaovzEcJymh7rlTR/hrFN+Cfq5Mq5DdYMouaRZzKq6DzRyF8HZqKmhH
 NW28fId/QTYtKQwX1Z7nAu4NJe5e5h0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-KfhVLe00MYSKqpbsJgtIVw-1; Wed, 03 Feb 2021 12:25:16 -0500
X-MC-Unique: KfhVLe00MYSKqpbsJgtIVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0E6F1800D41;
 Wed,  3 Feb 2021 17:25:14 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2DF1163C8;
 Wed,  3 Feb 2021 17:25:12 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/22] Acceptance Tests: introduce CPU hotplug test
Date: Wed,  3 Feb 2021 12:23:56 -0500
Message-Id: <20210203172357.1422425-22-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-1-crosa@redhat.com>
References: <20210203172357.1422425-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though there are qtest based tests for hotplugging CPUs (from
which this test took some inspiration from), this one adds checks
from a Linux guest point of view.

It should also serve as an example for tests that follow a similar
pattern and need to interact with QEMU (via qmp) and with the Linux
guest via SSH.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/hotplug_cpu.py | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 tests/acceptance/hotplug_cpu.py

diff --git a/tests/acceptance/hotplug_cpu.py b/tests/acceptance/hotplug_cpu.py
new file mode 100644
index 0000000000..a22b264b4b
--- /dev/null
+++ b/tests/acceptance/hotplug_cpu.py
@@ -0,0 +1,38 @@
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
+        self.ssh_connect('root', self.ssh_key)
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


