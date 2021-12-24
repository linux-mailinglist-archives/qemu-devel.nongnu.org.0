Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5692B47EE87
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 12:19:52 +0100 (CET)
Received: from localhost ([::1]:52222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0ic3-0004Z7-Ft
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 06:19:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUR-00018b-AF
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:11:59 -0500
Received: from relay.sw.ru ([185.231.240.75]:48200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUM-0003OQ-6E
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:11:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=JiHOn090187soNjUgeM1lAwziV2eS+k5CJ/SAjifh4I=; b=IXWhr1dABt7Z
 NDFHyvWGg+phUM4UArnIiMNRA1WbC2uAc6k0ftVyLoFpkaC1LvT1gpUWau5mbeOMX+PLAscV7+Y3Y
 REXV31+udxapZv36152+2lYXI1tj0xBi544pXsZWK8NkrKLPfQG97Jl6jMae3+xtu4CajKifqZkc2
 gpzRQ=;
Received: from [10.94.3.117] (helo=nun.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUH-004OwN-67; Fri, 24 Dec 2021 14:11:49 +0300
From: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, eduardo@habkost.net, crosa@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, nikita.lapshin@virtuozzo.com, vsementsov@virtuozzo.com,
 den@virtuozzo.com
Subject: [PATCH 6/6] migration: Test for ram capabilities
Date: Fri, 24 Dec 2021 14:11:48 +0300
Message-Id: <20211224111148.345438-7-nikita.lapshin@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=nikita.lapshin@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use scripts/analyze-migration.py to split migration stream into
sections and analyze its output.

Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 .../tests/migrate-ram-capabilities-test       | 96 +++++++++++++++++++
 .../tests/migrate-ram-capabilities-test.out   |  5 +
 2 files changed, 101 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/migrate-ram-capabilities-test
 create mode 100644 tests/qemu-iotests/tests/migrate-ram-capabilities-test.out

diff --git a/tests/qemu-iotests/tests/migrate-ram-capabilities-test b/tests/qemu-iotests/tests/migrate-ram-capabilities-test
new file mode 100755
index 0000000000..917f888340
--- /dev/null
+++ b/tests/qemu-iotests/tests/migrate-ram-capabilities-test
@@ -0,0 +1,96 @@
+#!/usr/bin/env python3
+# group: rw migration
+#
+# Tests for 'no-ram' and 'ram-only' capabilities
+#
+# Copyright (c) 2021 Virtuozzo International GmbH.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import os
+import json
+import subprocess
+import iotests
+
+img = os.path.join(iotests.test_dir, 'disk.img')
+
+class TestRamCapabilities(iotests.QMPTestCase):
+    def setUp(self):
+        iotests.qemu_img('create', '-f', iotests.imgfmt, img, '10M')
+        self.vm = iotests.VM()
+        self.vm.launch()
+        self.vm.qmp('migrate-set-capabilities', capabilities=[
+            {
+                'capability': 'events',
+                'state': True
+            }
+        ])
+
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(img)
+
+    def check_ram_only(self, output):
+        str_json = output.decode()
+        json_obj = json.loads(str_json)
+
+        success = False
+        for key in json_obj:
+            self.assertTrue("ram" in key)
+            success = True
+        self.assertTrue(success)
+
+    def run_migration(self, capability, tmp_stream):
+        self.vm.qmp('migrate-set-capabilities', capabilities=[
+            {
+                'capability': capability,
+                'state': True
+            }
+        ])
+
+        self.vm.qmp('migrate', uri='exec:cat>' + tmp_stream)
+
+        while True:
+            event = self.vm.event_wait('MIGRATION')
+
+            if event['data']['status'] == 'completed':
+                break
+
+
+    def test_no_ram(self):
+        with iotests.FilePath('tmp_stream') as tmp_stream:
+            self.run_migration('no-ram', tmp_stream)
+            output = subprocess.run(
+                ['../../../scripts/analyze-migration.py', '-f', tmp_stream],
+                stdout=subprocess.PIPE,
+                stderr=subprocess.STDOUT,
+                check=False).stdout
+
+            self.assertFalse('ram' in output.decode())
+
+    def test_ram_only(self):
+        with iotests.FilePath('tmp_stream') as tmp_stream:
+            self.run_migration('ram-only', tmp_stream)
+            output = subprocess.run(
+                ['../../../scripts/analyze-migration.py', '-f', tmp_stream,
+                    '--ram-only'],
+                stdout=subprocess.PIPE,
+                stderr=subprocess.STDOUT,
+                check=False).stdout
+
+            self.check_ram_only(output)
+
+if __name__ == '__main__':
+    iotests.main(supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/migrate-ram-capabilities-test.out b/tests/qemu-iotests/tests/migrate-ram-capabilities-test.out
new file mode 100644
index 0000000000..fbc63e62f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/migrate-ram-capabilities-test.out
@@ -0,0 +1,5 @@
+..
+----------------------------------------------------------------------
+Ran 2 tests
+
+OK
-- 
2.27.0


