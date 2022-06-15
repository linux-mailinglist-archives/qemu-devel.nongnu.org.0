Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE9854CC9C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:23:37 +0200 (CEST)
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Uro-00068S-Hg
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOq-0007om-OG
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:40 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOo-00016u-S1
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:40 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE0Gw9025874;
 Wed, 15 Jun 2022 14:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=USZPM1Joce+jMmK64fgOgXWv6jKDLcMYDJzCJ6Lk4lM=;
 b=LacwNyL0YPt6zYjNImSXUSS2S5LLQhq6jmCHOvZMWImJOkB3D6TODcvlxjGBTiM3ZUbZ
 QWKcqbZ/qDpJNbsWj3zFyaFWKkeEwC7YtoMjvP2drPvLhmshfsAGNKLVQZgHmGwgPRxR
 YE1+GHuDU0ttlukXoSWgFXumalwytThRk5U1kUxMC7f58enpvt+lGIExrxuKgAK0HoyM
 j1fazrezcxVYDKBM4dp0gBilVaLtZa3xqCGkeWC18YKiWXngqhgfcgwPoU+x4b2Mbt3p
 UV0R6wdFCP3m25xaeMuVszDrVVFKD2bIEJUJPAyaYt2s/7k/3yZPmYrbwDOPhqpK+1UN mA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2rxgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:16 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7ta023103; Wed, 15 Jun 2022 14:53:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vq94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:15 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSO1018501;
 Wed, 15 Jun 2022 14:53:15 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-40; Wed, 15 Jun 2022 14:53:15 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 39/39] tests/avocado: add cpr regression test
Date: Wed, 15 Jun 2022 07:52:26 -0700
Message-Id: <1655304746-102776-40-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: kPPRzPM9EZePLA5LN7HAIhF51JTehBkB
X-Proofpoint-ORIG-GUID: kPPRzPM9EZePLA5LN7HAIhF51JTehBkB
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS          |   1 +
 tests/avocado/cpr.py | 152 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 153 insertions(+)
 create mode 100644 tests/avocado/cpr.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 864aec6..4e6e7ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3164,6 +3164,7 @@ F: stubs/cpr.c
 F: tests/unit/test-strlist.c
 F: migration/cpr-state.c
 F: stubs/cpr-state.c
+F: tests/avocado/cpr.py
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/tests/avocado/cpr.py b/tests/avocado/cpr.py
new file mode 100644
index 0000000..feb43d1
--- /dev/null
+++ b/tests/avocado/cpr.py
@@ -0,0 +1,152 @@
+# cpr test
+
+# Copyright (c) 2021, 2022 Oracle and/or its affiliates.
+#
+# This work is licensed under the terms of the GNU GPL, version 2.
+# See the COPYING file in the top-level directory.
+
+import tempfile
+from avocado_qemu import QemuSystemTest
+from avocado.utils import wait
+
+class Cpr(QemuSystemTest):
+    """
+    :avocado: tags=cpr
+    """
+
+    timeout = 5
+    fast_timeout = 1
+
+    @staticmethod
+    def has_status(vm, status):
+        return vm.command('query-status')['status'] == status
+
+    def wait_for_status(self, vm, status):
+        wait.wait_for(self.has_status,
+                      timeout=self.timeout,
+                      step=0.1,
+                      args=(vm,status,))
+
+    def run_and_fail(self, vm, msg):
+        # Qemu will fail fast, so disable monitor to avoid timeout in accept
+        vm.set_qmp_monitor(False)
+        vm.launch()
+        vm.wait(self.timeout)
+        self.assertRegex(vm.get_log(), msg)
+
+    def do_cpr_restart(self, vmstate_name):
+        vm = self.get_vm('-nodefaults',
+                         '-cpr-enable', 'restart',
+                         '-object', 'memory-backend-memfd,id=pc.ram,size=8M',
+                         '-machine', 'memory-backend=pc.ram')
+
+        vm.launch()
+
+        vm.qmp('cpr-save', filename=vmstate_name, mode='restart')
+        vm.event_wait(name='STOP', timeout=self.fast_timeout)
+
+        args = vm.full_args + ['-S']
+        vm.qmp('cpr-exec', argv=args)
+
+        # exec closes the monitor socket, so reopen it.
+        vm.reopen_qmp_connection()
+
+        self.wait_for_status(vm, 'prelaunch')
+        vm.qmp('cpr-load', filename=vmstate_name, mode='restart')
+        vm.event_wait(name='RESUME', timeout=self.fast_timeout)
+
+        self.assertEqual(vm.command('query-status')['status'], 'running')
+
+    def do_cpr_reboot(self, vmstate_name):
+        old_vm = self.get_vm('-nodefaults',
+                             '-cpr-enable', 'reboot')
+        old_vm.launch()
+
+        old_vm.qmp('cpr-save', filename=vmstate_name, mode='reboot')
+        old_vm.event_wait(name='STOP', timeout=self.fast_timeout)
+
+        new_vm = self.get_vm('-nodefaults',
+                             '-cpr-enable', 'reboot',
+                             '-S')
+        new_vm.launch()
+        self.wait_for_status(new_vm, 'prelaunch')
+
+        new_vm.qmp('cpr-load', filename=vmstate_name, mode='reboot')
+        new_vm.event_wait(name='RESUME', timeout=self.fast_timeout)
+
+        self.assertEqual(new_vm.command('query-status')['status'], 'running')
+
+    def test_cpr_restart(self):
+        """
+        Verify that cpr restart mode works
+        """
+        with tempfile.NamedTemporaryFile() as vmstate_file:
+            self.do_cpr_restart(vmstate_file.name)
+
+    def test_cpr_reboot(self):
+        """
+        Verify that cpr reboot mode works
+        """
+        with tempfile.NamedTemporaryFile() as vmstate_file:
+            self.do_cpr_reboot(vmstate_file.name)
+
+    def test_cpr_block_cpr_save(self):
+
+        """
+        Verify that qemu rejects cpr-save for volatile memory
+        """
+        vm = self.get_vm('-nodefaults',
+                         '-cpr-enable', 'restart')
+        vm.launch()
+        rsp = vm.qmp('cpr-save', filename='/dev/null', mode='restart')
+        vm.qmp('quit')
+
+        expect = r'Memory region .* is volatile'
+        self.assertRegex(rsp['error']['desc'], expect)
+
+    def test_cpr_block_memfd(self):
+
+        """
+        Verify that qemu complains for only-cpr-capable and volatile memory
+        """
+        vm = self.get_vm('-nodefaults',
+                         '-cpr-enable', 'restart',
+                         '-only-cpr-capable')
+        self.run_and_fail(vm, r'only-cpr-capable specified.* Memory ')
+
+    def test_cpr_block_replay(self):
+        """
+        Verify that qemu complains for only-cpr-capable and replay
+        """
+        vm = self.get_vm('-nodefaults',
+                         '-cpr-enable', 'restart',
+                         '-object', 'memory-backend-memfd,id=pc.ram,size=8M',
+                         '-machine', 'memory-backend=pc.ram',
+                         '-only-cpr-capable',
+                         '-icount', 'shift=10,rr=record,rrfile=/dev/null')
+        self.run_and_fail(vm, r'only-cpr-capable specified.* replay ')
+
+    def test_cpr_block_chardev(self):
+        """
+        Verify that qemu complains for only-cpr-capable and unsupported chardev
+        """
+        vm = self.get_vm('-nodefaults',
+                         '-cpr-enable', 'restart',
+                         '-object', 'memory-backend-memfd,id=pc.ram,size=8M',
+                         '-machine', 'memory-backend=pc.ram',
+                         '-only-cpr-capable',
+                         '-chardev', 'vc,id=vc1')
+        self.run_and_fail(vm, r'only-cpr-capable specified.* vc1 ')
+
+    def test_cpr_allow_chardev(self):
+        """
+        Verify that qemu allows unsupported chardev with reopen-on-cpr
+        """
+        vm = self.get_vm('-nodefaults',
+                         '-cpr-enable', 'restart',
+                         '-object', 'memory-backend-memfd,id=pc.ram,size=8M',
+                         '-machine', 'memory-backend=pc.ram',
+                         '-only-cpr-capable',
+                         '-chardev', 'vc,id=vc1,reopen-on-cpr=on')
+        vm.launch()
+        self.wait_for_status(vm, 'running')
-- 
1.8.3.1


