Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A86D4DC9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:30:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjN44-0000Ug-Tb; Mon, 03 Apr 2023 12:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pjN42-0000U4-VM; Mon, 03 Apr 2023 12:29:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pjN40-0007mn-Oc; Mon, 03 Apr 2023 12:29:50 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 333Fs5oB024125; Mon, 3 Apr 2023 16:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=coVAZjTut1FjxF9ZE+hH4ldEd8PlO4X+LPyGSzG/IFU=;
 b=oTueL7AujOIUvRSYcJzyNo4DS5R1DYGGmi4kTs3lF71j5AXEcinRdQJuk3Pux5oqrjxb
 G3lQCpP9TP7wZ4j3cNIIpWpv/7wA/mPpeZd1F0g5osVLuAcUBFqCsoxgmBGvMDYhLLKR
 qdt96qd6xFwfjfXO5hLESwTF7Y/aZWWYUBSaxZ7wuSabUunt3GQ3rotgvWAFXBgBjG8N
 /shyC8DJCd5s1Veo7ZlqrUASiTyRnRzg+ZAf+XcdDz79wRc3fy6xFDt3hvvIIKnb50IN
 RmFbzspe9iP+v8v5GiagvYVSq0tPSchu1c+eXbLRBA8qLvkpxkEh9pBgwjHoQEsByMl7 Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pr1uhgwqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 16:29:40 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 333FtKtu026699;
 Mon, 3 Apr 2023 16:29:39 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pr1uhgwpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 16:29:39 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3330M7du017909;
 Mon, 3 Apr 2023 16:29:37 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3ppc86sdfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 16:29:37 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 333GTYNA25559456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Apr 2023 16:29:34 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CB7920040;
 Mon,  3 Apr 2023 16:29:34 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E690C20043;
 Mon,  3 Apr 2023 16:29:32 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.179.22.128]) by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  3 Apr 2023 16:29:32 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, nsg@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
Subject: [PATCH v19 14/21] tests/avocado: s390x cpu topology core
Date: Mon,  3 Apr 2023 18:28:58 +0200
Message-Id: <20230403162905.17703-15-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230403162905.17703-1-pmorel@linux.ibm.com>
References: <20230403162905.17703-1-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ixlB96qCyOgZCf8g2H2GeGIjit77hyPs
X-Proofpoint-ORIG-GUID: wi49zqtbCdvpb0tDkhDzlwJesTm08YVF
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_13,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030118
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Introduction of the s390x cpu topology core functions and
basic tests.

We test the corelation between the command line and
the QMP results in query-cpus-fast for various CPU topology.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 MAINTAINERS                    |   1 +
 tests/avocado/s390_topology.py | 196 +++++++++++++++++++++++++++++++++
 2 files changed, 197 insertions(+)
 create mode 100644 tests/avocado/s390_topology.py

diff --git a/MAINTAINERS b/MAINTAINERS
index fe5638e31d..41419840b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1662,6 +1662,7 @@ F: hw/s390x/cpu-topology.c
 F: target/s390x/kvm/cpu_topology.c
 F: docs/devel/s390-cpu-topology.rst
 F: docs/system/s390x/cpu-topology.rst
+F: tests/avocado/s390_topology.py
 
 X86 Machines
 ------------
diff --git a/tests/avocado/s390_topology.py b/tests/avocado/s390_topology.py
new file mode 100644
index 0000000000..38e9cc4f16
--- /dev/null
+++ b/tests/avocado/s390_topology.py
@@ -0,0 +1,196 @@
+# Functional test that boots a Linux kernel and checks the console
+#
+# Copyright (c) 2023 IBM Corp.
+#
+# Author:
+#  Pierre Morel <pmorel@linux.ibm.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import os
+import shutil
+import time
+
+from avocado import skip
+from avocado import skipUnless
+from avocado import skipIf
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import exec_command
+from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import interrupt_interactive_console_until_pattern
+from avocado_qemu import wait_for_console_pattern
+from avocado.utils import process
+from avocado.utils import archive
+
+
+class LinuxKernelTest(QemuSystemTest):
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+
+class S390CPUTopology(LinuxKernelTest):
+    """
+    S390x CPU topology consist of 4 topology layers, from bottom to top,
+    the cores, sockets, books and drawers and 2 modifiers attributes,
+    the entitlement and the dedication.
+    See: docs/system/s390x/cpu-topology.rst.
+
+    S390x CPU topology is setup in different ways:
+    - implicitely from the '-smp' argument by completing each topology
+      level one after the other begining with drawer 0, book 0 and socket 0.
+    - explicitely from the '-device' argument on the QEMU command line
+    - explicitely by hotplug of a new CPU using QMP or HMP
+    - it is modified by using QMP 'set-cpu-topology'
+
+    The S390x modifier attribute entitlement depends on the machine
+    polarization, which can be horizontal or vertical.
+    The polarization is changed on a request from the guest.
+    """
+    timeout = 90
+
+
+    def check_topology(self, c, s, b, d, e, t):
+        res = self.vm.qmp('query-cpus-fast')
+        line =  res['return']
+        for x in line:
+            core = x['props']['core-id']
+            socket = x['props']['socket-id']
+            book = x['props']['book-id']
+            drawer = x['props']['drawer-id']
+            entitlement = x['entitlement']
+            dedicated = x['dedicated']
+            if core == c:
+                self.assertEqual(drawer, d)
+                self.assertEqual(book, b)
+                self.assertEqual(socket, s)
+                self.assertEqual(entitlement, e)
+                self.assertEqual(dedicated, t)
+
+    def kernel_init(self):
+        """
+        We need a kernel supporting the CPU topology.
+        We need a minimal root filesystem with a shell.
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
+                      '/fedora-secondary/releases/35/Server/s390x/os'
+                      '/images/kernel.img')
+        kernel_hash = '0d1aaaf303f07cf0160c8c48e56fe638'
+        kernel_path = self.fetch_asset(kernel_url, algorithm='md5',
+                                       asset_hash=kernel_hash)
+
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive'
+                      '/fedora-secondary/releases/35/Server/s390x/os'
+                      '/images/initrd.img')
+        initrd_hash = 'a122057d95725ac030e2ec51df46e172'
+        initrd_path_xz = self.fetch_asset(initrd_url, algorithm='md5',
+                                          asset_hash=initrd_hash)
+        initrd_path = os.path.join(self.workdir, 'initrd-raw.img')
+        archive.lzma_uncompress(initrd_path_xz, initrd_path)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                              'root=/dev/ram '
+                              'selinux=0 '
+                              'rdinit=/bin/sh')
+        self.vm.add_args('-nographic',
+                         '-enable-kvm',
+                         '-cpu', 'z14,ctop=on',
+                         '-m', '512',
+                         '-name', 'Some Guest Name',
+                         '-uuid', '30de4fd9-b4d5-409e-86a5-09b387f70bfa',
+                         '-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line)
+
+    def test_single(self):
+        self.kernel_init()
+        self.vm.launch()
+        self.wait_for_console_pattern('no job control')
+        self.check_topology(0, 0, 0, 0, 'medium', False)
+
+    def test_default(self):
+        """
+        This test checks the implicite topology.
+
+        :avocado: tags=arch:s390x
+        :avocado: tags=machine:s390-ccw-virtio
+        """
+        self.kernel_init()
+        self.vm.add_args('-smp',
+                         '13,drawers=2,books=2,sockets=3,cores=2,maxcpus=24')
+        self.vm.launch()
+        self.wait_for_console_pattern('no job control')
+        self.check_topology(0, 0, 0, 0, 'medium', False)
+        self.check_topology(1, 0, 0, 0, 'medium', False)
+        self.check_topology(2, 1, 0, 0, 'medium', False)
+        self.check_topology(3, 1, 0, 0, 'medium', False)
+        self.check_topology(4, 2, 0, 0, 'medium', False)
+        self.check_topology(5, 2, 0, 0, 'medium', False)
+        self.check_topology(6, 0, 1, 0, 'medium', False)
+        self.check_topology(7, 0, 1, 0, 'medium', False)
+        self.check_topology(8, 1, 1, 0, 'medium', False)
+        self.check_topology(9, 1, 1, 0, 'medium', False)
+        self.check_topology(10, 2, 1, 0, 'medium', False)
+        self.check_topology(11, 2, 1, 0, 'medium', False)
+        self.check_topology(12, 0, 0, 1, 'medium', False)
+
+    def test_move(self):
+        """
+        This test checks the topology modification by moving a CPU
+        to another socket: CPU 0 is moved from socket 0 to socket 2.
+
+        :avocado: tags=arch:s390x
+        :avocado: tags=machine:s390-ccw-virtio
+        """
+        self.kernel_init()
+        self.vm.add_args('-smp',
+                         '1,drawers=2,books=2,sockets=3,cores=2,maxcpus=24')
+        self.vm.launch()
+        self.wait_for_console_pattern('no job control')
+
+        self.check_topology(0, 0, 0, 0, 'medium', False)
+        res = self.vm.qmp('set-cpu-topology',
+                          {'core-id': 0, 'socket-id': 2, 'entitlement': 'low'})
+        self.assertEqual(res['return'], {})
+        self.check_topology(0, 2, 0, 0, 'low', False)
+
+    def test_hotplug(self):
+        """
+        This test verifies that a CPU defined with '-device' command line
+        argument finds its right place inside the topology.
+
+        :avocado: tags=arch:s390x
+        :avocado: tags=machine:s390-ccw-virtio
+        """
+        self.kernel_init()
+        self.vm.add_args('-smp',
+                         '1,drawers=2,books=2,sockets=3,cores=2,maxcpus=24')
+        self.vm.add_args('-device', 'z14-s390x-cpu,core-id=10')
+        self.vm.launch()
+        self.wait_for_console_pattern('no job control')
+
+        self.check_topology(10, 2, 1, 0, 'medium', False)
+
+    def test_hotplug_full(self):
+        """
+        This test verifies that a hotplugged fully defined with '-device'
+        command line argument finds its right place inside the topology.
+
+        :avocado: tags=arch:s390x
+        :avocado: tags=machine:s390-ccw-virtio
+        """
+        self.kernel_init()
+        self.vm.add_args('-smp',
+                         '1,drawers=2,books=2,sockets=3,cores=2,maxcpus=24')
+        self.vm.add_args('-device',
+                         'z14-s390x-cpu,'
+                         'core-id=1,socket-id=1,book-id=1,drawer-id=1')
+        self.vm.launch()
+        self.wait_for_console_pattern('no job control')
+        self.check_topology(1, 1, 1, 1, 'medium', False)
+
-- 
2.31.1


