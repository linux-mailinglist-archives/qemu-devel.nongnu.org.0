Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF865817D6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:48:49 +0200 (CEST)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNjl-0007AK-1c
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNAL-0003tc-Er
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:17 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:64918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNAI-0006IO-Fp
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:12 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn3V5016260;
 Tue, 26 Jul 2022 16:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=gCFN+vkQnI4S420XG5KSD9WqDBxmdYUEBiWYi3C1Q8s=;
 b=jzfLKJwuhUGVqEckBDCetXx9SEigsqX/jt6tUPs2tX2zz3tUD4GI4qwth/2PFwaitIOP
 hqip6m9sBTCqzD0opIZyTJOhiA+9gHOzlArZIQGmPhPhN7e2jgjlCqd7zd1M2jKIXK6U
 /r2HGpXw4pNdEFdUGG+AMXtWyVTDFnI9ppSf/EQNFYCz9uuWZxYGSk2N+mUUiWfh6407
 vZFlfA9ug1SJzKwNcDvw+g7sNwsloSn2yS3xCIcwKIIh2MXQ4cczFdZRYkxJXAuM5D8A
 G3lYWpiX49moGtVswHIbbdOzPlz/iSizjp1qqowoalX7pthQ8KxoToZueSPCbHlP4IHn tg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a9f0xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:47 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QEhMpG006143; Tue, 26 Jul 2022 16:11:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq2u0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:46 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uTX023334;
 Tue, 26 Jul 2022 16:11:45 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-43; Tue, 26 Jul 2022 16:11:45 +0000
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
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 42/46] tests/avocado: add cpr regression test
Date: Tue, 26 Jul 2022 09:10:39 -0700
Message-Id: <1658851843-236870-43-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-GUID: 5_9P3XFYsEfAMI5B9txVuMhiz21gRpca
X-Proofpoint-ORIG-GUID: 5_9P3XFYsEfAMI5B9txVuMhiz21gRpca
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
 tests/avocado/cpr.py | 176 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 177 insertions(+)
 create mode 100644 tests/avocado/cpr.py

diff --git a/MAINTAINERS b/MAINTAINERS
index b93b0bb..adc1218 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3172,6 +3172,7 @@ F: stubs/cpr-state.c
 F: include/migration/cpr.h
 F: migration/cpr.c
 F: hw/vfio/cpr.c
+F: tests/avocado/cpr.py
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/tests/avocado/cpr.py b/tests/avocado/cpr.py
new file mode 100644
index 0000000..11e1376
--- /dev/null
+++ b/tests/avocado/cpr.py
@@ -0,0 +1,176 @@
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
+    def has_status(vm, status, command):
+        return vm.command(command)['status'] in status
+
+    def wait_for_status(self, vm, status, command):
+        wait.wait_for(self.has_status,
+                      timeout=self.timeout,
+                      step=0.1,
+                      args=(vm,status,command,))
+
+    def wait_for_runstate(self, vm, status):
+        self.wait_for_status(vm, status, 'query-status')
+
+    def wait_for_migration(self, vm, status):
+        self.wait_for_status(vm, status, 'query-migrate')
+
+    def run_and_fail(self, vm, msg):
+        # Qemu will fail fast, so disable monitor to avoid timeout in accept
+        vm.set_qmp_monitor(False)
+        vm.launch()
+        vm.wait(self.timeout)
+        self.assertRegex(vm.get_log(), msg)
+
+    def get_vm_for_restart(self):
+        return self.get_vm('-nodefaults',
+                           '-migrate-mode-enable', 'cpr-exec',
+                           '-object', 'memory-backend-memfd,id=pc.ram,size=8M',
+                           '-machine', 'memory-backend=pc.ram')
+
+    def do_cpr_exec(self, vmstate_name):
+        vm = self.get_vm_for_restart()
+        vm.launch()
+
+        uri = 'file:' + vmstate_name
+        args = vm.full_args + ['-incoming', 'defer']
+
+        vm.command('migrate-set-parameters', cpr_exec_args=args)
+        vm.command('migrate-set-parameters', mode='cpr-exec')
+        vm.qmp('migrate', uri=uri)
+
+        # Cannot poll for migration status, because qemu may call execv before
+        # we see it. Wait for STOP instead.
+        vm.event_wait(name='STOP', timeout=self.fast_timeout)
+
+        # Migrate execs and closes the monitor socket, so reopen it.
+        vm.reopen_qmp_connection()
+
+        self.assertEqual(vm.command('query-status')['status'], 'inmigrate')
+        resp = vm.command('migrate-incoming', uri=uri)
+        self.wait_for_migration(vm, ('completed', 'failed'))
+        self.assertEqual(vm.command('query-migrate')['status'], 'completed')
+
+        resp = vm.command('cont')
+        vm.event_wait(name='RESUME', timeout=self.fast_timeout)
+        self.assertEqual(vm.command('query-status')['status'], 'running')
+
+    def do_cpr_reboot(self, vmstate_name):
+        args = ['-nodefaults', '-migrate-mode-enable', 'cpr-reboot' ]
+        old_vm = self.get_vm(*args)
+        old_vm.launch()
+
+        uri = 'file:' + vmstate_name
+
+        old_vm.command('migrate-set-capabilities', capabilities = [
+                       { "capability": "x-ignore-shared", "state": True }])
+        old_vm.command('migrate-set-parameters', mode='cpr-reboot')
+        old_vm.qmp('migrate', uri=uri)
+        self.wait_for_migration(old_vm, ('completed', 'failed'))
+        self.assertEqual(old_vm.command('query-migrate')['status'],
+                         'completed')
+        self.assertEqual(old_vm.command('query-status')['status'],
+                         'postmigrate')
+
+        args = args + ['-incoming', 'defer']
+        new_vm = self.get_vm(*args)
+        new_vm.launch()
+        self.assertEqual(new_vm.command('query-status')['status'], 'inmigrate')
+
+        new_vm.command('migrate-set-capabilities', capabilities = [
+                       { "capability": "x-ignore-shared", "state": True }])
+        new_vm.command('migrate-set-parameters', mode='cpr-reboot')
+        new_vm.command('migrate-incoming', uri=uri)
+        self.wait_for_migration(new_vm, ('completed', 'failed'))
+        self.assertEqual(new_vm.command('query-migrate')['status'], 'completed')
+
+        new_vm.command('cont')
+        new_vm.event_wait(name='RESUME', timeout=self.fast_timeout)
+        self.assertEqual(new_vm.command('query-status')['status'], 'running')
+
+    def test_cpr_exec(self):
+        """
+        Verify that cpr restart mode works
+        """
+        with tempfile.NamedTemporaryFile() as vmstate_file:
+            self.do_cpr_exec(vmstate_file.name)
+
+    def test_cpr_reboot(self):
+        """
+        Verify that cpr reboot mode works
+        """
+        with tempfile.NamedTemporaryFile() as vmstate_file:
+            self.do_cpr_reboot(vmstate_file.name)
+
+    def test_cpr_block_cpr_exec(self):
+        """
+        Verify that qemu rejects cpr restart mode for volatile memory
+        """
+
+        vm = self.get_vm('-nodefaults',
+                         '-migrate-mode-enable', 'cpr-exec')
+        vm.launch()
+        uri='file:/dev/null'
+        args = vm.full_args + ['-S']
+        resp = vm.command('migrate-set-parameters', mode='cpr-exec')
+        rsp = vm.qmp('migrate', uri=uri)
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
+                         '-migrate-mode-enable', 'cpr-exec',
+                         '-only-cpr-capable')
+        self.run_and_fail(vm, r'only-cpr-capable specified.* Memory ')
+
+    def test_cpr_block_replay(self):
+        """
+        Verify that qemu complains for only-cpr-capable and replay
+        """
+        vm = self.get_vm_for_restart()
+        vm.add_args('-only-cpr-capable',
+                    '-icount', 'shift=10,rr=record,rrfile=/dev/null')
+        self.run_and_fail(vm, r'only-cpr-capable specified.* replay ')
+
+    def test_cpr_block_chardev(self):
+        """
+        Verify that qemu complains for only-cpr-capable and unsupported chardev
+        """
+        vm = self.get_vm_for_restart()
+        vm.add_args('-only-cpr-capable',
+                    '-chardev', 'vc,id=vc1')
+        self.run_and_fail(vm, r'only-cpr-capable specified.* vc1 ')
+
+    def test_cpr_allow_chardev(self):
+        """
+        Verify that qemu allows unsupported chardev with reopen-on-cpr
+        """
+        vm = self.get_vm_for_restart()
+        vm.add_args('-only-cpr-capable',
+                    '-chardev', 'vc,id=vc1,reopen-on-cpr=on')
+        vm.launch()
+        self.wait_for_runstate(vm, ('running'))
-- 
1.8.3.1


