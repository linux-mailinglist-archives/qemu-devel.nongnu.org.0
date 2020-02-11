Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA171591E3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 15:27:13 +0100 (CET)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1WVM-0002eS-RZ
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 09:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50384)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j1WUB-0001Ne-VJ
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:26:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j1WUA-0002Ra-O9
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:25:59 -0500
Received: from relay.sw.ru ([185.231.240.75]:45006)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j1WUA-0002QB-Gg
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:25:58 -0500
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j1WU4-00009Q-D7; Tue, 11 Feb 2020 17:25:52 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] tests/acceptance/virtio_check_params: remove excluded
 machine types carefully
Date: Tue, 11 Feb 2020 17:25:50 +0300
Message-Id: <20200211142551.13072-2-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200211142551.13072-1-dplotnikov@virtuozzo.com>
References: <20200211142551.13072-1-dplotnikov@virtuozzo.com>
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
Cc: cohuck@redhat.com, philmd@redhat.com, wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before, the test failed if an excluded machine type was absent in the machine
types lists.

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 tests/acceptance/virtio_check_params.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/acceptance/virtio_check_params.py b/tests/acceptance/virtio_check_params.py
index 87e6c839d1..deec89bf86 100644
--- a/tests/acceptance/virtio_check_params.py
+++ b/tests/acceptance/virtio_check_params.py
@@ -40,6 +40,8 @@ VM_DEV_PARAMS = {'virtio-scsi-pci': ['-device', 'virtio-scsi-pci,id=scsi0'],
                                     '-drive',
                                     'driver=null-co,id=drive0,if=none']}
 
+EXCLUDED_MACHINES = ['none', 'isapc', 'microvm']
+
 
 class VirtioMaxSegSettingsCheck(Test):
     @staticmethod
@@ -117,6 +119,13 @@ class VirtioMaxSegSettingsCheck(Test):
             return True
         return False
 
+    @staticmethod
+    def filter_machines(machines):
+        for mt in EXCLUDED_MACHINES:
+            if mt in machines:
+                machines.remove(mt)
+        return machines
+
     @skip("break multi-arch CI")
     def test_machine_types(self):
         # collect all machine types except 'none', 'isapc', 'microvm'
@@ -124,9 +133,8 @@ class VirtioMaxSegSettingsCheck(Test):
             vm.launch()
             machines = [m['name'] for m in vm.command('query-machines')]
             vm.shutdown()
-        machines.remove('none')
-        machines.remove('isapc')
-        machines.remove('microvm')
+
+        machines = self.filter_machines(machines)
 
         for dev_type in DEV_TYPES:
             # create the list of machine types and their parameters.
-- 
2.17.0


