Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E205127C5D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 15:17:35 +0100 (CET)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiJ5x-0006z4-Sy
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 09:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50987)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iiIy0-0004n8-WB
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:09:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iiIxz-0000Pu-DR
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:09:20 -0500
Received: from relay.sw.ru ([185.231.240.75]:58374)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iiIxz-0000J3-1x
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:09:19 -0500
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iiIxm-0007UT-Ji; Fri, 20 Dec 2019 17:09:06 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] tests: add virtio-scsi and virtio-blk seg_max_adjust
 test
Date: Fri, 20 Dec 2019 17:09:05 +0300
Message-Id: <20191220140905.1718-3-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20191220140905.1718-1-dplotnikov@virtuozzo.com>
References: <20191220140905.1718-1-dplotnikov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, fam@euphon.net, ehabkost@redhat.com, mst@redhat.com,
 mreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It tests proper seg_max_adjust settings for all machine types except
'none', 'isapc', 'microvm'

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 tests/acceptance/virtio_seg_max_adjust.py | 134 ++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100755 tests/acceptance/virtio_seg_max_adjust.py

diff --git a/tests/acceptance/virtio_seg_max_adjust.py b/tests/acceptance/virtio_seg_max_adjust.py
new file mode 100755
index 0000000000..5458573138
--- /dev/null
+++ b/tests/acceptance/virtio_seg_max_adjust.py
@@ -0,0 +1,134 @@
+#!/usr/bin/env python
+#
+# Test virtio-scsi and virtio-blk queue settings for all machine types
+#
+# Copyright (c) 2019 Virtuozzo International GmbH
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
+import sys
+import os
+import re
+
+sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
+from qemu.machine import QEMUMachine
+from avocado_qemu import Test
+
+#list of machine types and virtqueue properties to test
+VIRTIO_SCSI_PROPS = {'seg_max_adjust': 'seg_max_adjust'}
+VIRTIO_BLK_PROPS = {'seg_max_adjust': 'seg-max-adjust'}
+
+DEV_TYPES = {'virtio-scsi-pci': VIRTIO_SCSI_PROPS,
+             'virtio-blk-pci': VIRTIO_BLK_PROPS}
+
+VM_DEV_PARAMS = {'virtio-scsi-pci': ['-device', 'virtio-scsi-pci,id=scsi0'],
+                 'virtio-blk-pci': ['-device',
+                                    'virtio-blk-pci,id=scsi0,drive=drive0',
+                                    '-drive',
+                                    'driver=null-co,id=drive0,if=none']}
+
+
+class VirtioMaxSegSettingsCheck(Test):
+    @staticmethod
+    def make_pattern(props):
+        pattern_items = ['{0} = \w+'.format(prop) for prop in props]
+        return '|'.join(pattern_items)
+
+    def query_virtqueue(self, vm, dev_type_name):
+        query_ok = False
+        error = None
+        props = None
+
+        output = vm.command('human-monitor-command',
+                            command_line = 'info qtree')
+        props_list = DEV_TYPES[dev_type_name].values();
+        pattern = self.make_pattern(props_list)
+        res = re.findall(pattern, output)
+
+        if len(res) != len(props_list):
+            props_list = set(props_list)
+            res = set(res)
+            not_found = props_list.difference(res)
+            not_found = ', '.join(not_found)
+            error = '({0}): The following properties not found: {1}'\
+                     .format(dev_type_name, not_found)
+        else:
+            query_ok = True
+            props = dict()
+            for prop in res:
+                p = prop.split(' = ')
+                props[p[0]] = p[1]
+        return query_ok, props, error
+
+    def check_mt(self, mt, dev_type_name):
+        with QEMUMachine(self.qemu_bin) as vm:
+            vm.set_machine(mt["name"])
+            for s in VM_DEV_PARAMS[dev_type_name]:
+                vm.add_args(s)
+            vm.launch()
+            query_ok, props, error = self.query_virtqueue(vm, dev_type_name)
+
+        if not query_ok:
+            self.fail('machine type {0}: {1}'.format(mt['name'], error))
+
+        for prop_name, prop_val in props.items():
+            expected_val = mt[prop_name]
+            self.assertEqual(expected_val, prop_val)
+
+    @staticmethod
+    def seg_max_adjust_enabled(mt):
+        # machine types >= 5.0 should have seg_max_adjust = true
+        # others seg_max_adjust = false
+        mt = mt.split("-")
+
+        # machine types with one line name and name like pc-x.x
+        if len(mt) <= 2:
+            return False
+
+        # machine types like pc-<chip_name>-x.x[.x]
+        ver = mt[2]
+        ver = ver.split(".");
+
+        # versions >= 5.0 goes with seg_max_adjust enabled
+        major = int(ver[0])
+
+        if major >= 5:
+            return True
+        return False
+
+    def test_machine_types(self):
+        # collect all machine types except 'none', 'isapc', 'microvm'
+        with QEMUMachine(self.qemu_bin) as vm:
+            vm.launch()
+            machines = [m['name'] for m in vm.command('query-machines')]
+            vm.shutdown()
+        machines.remove('none')
+        machines.remove('isapc')
+        machines.remove('microvm')
+
+        for dev_type in DEV_TYPES:
+            # create the list of machine types and their parameters.
+            mtypes = list()
+            for m in machines:
+                if self.seg_max_adjust_enabled(m):
+                    enabled = 'true'
+                else:
+                    enabled = 'false'
+                mtypes.append({'name': m,
+                               DEV_TYPES[dev_type]['seg_max_adjust']: enabled})
+
+            # test each machine type for a device type
+            for mt in mtypes:
+                self.check_mt(mt, dev_type)
-- 
2.17.0


