Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636FE6EC44D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 06:20:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqnfG-0001p3-Jr; Mon, 24 Apr 2023 00:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1pqnf6-0001ol-TB
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 00:18:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1pqnf2-00073k-As
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 00:18:46 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33O42ICg027103; Mon, 24 Apr 2023 04:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=X+fl5Ewpv2fpnNz6joMACsyfy63nGf9wF73qUUMTsZY=;
 b=a9gs7eVgY9psy04mOcvbSD5PCNwU+YWf43mZA66MaxLHtL9t12Upm3MxQcxr+4HeMxjq
 eiOeW+4rtWepOB6YIBPI0TIpzZ98hYbDQZt+O6D0W6UZcwStEgUveVci9smihQByq55/
 SXv+5J71rQmJrHmneXuoWcc13FLe+km00W26aN2ob38WyLljHAfepqowEtyoAKXRos1u
 iJ7Nx0jWb+b8+i+hwImzmD72MhtLz8ja1YkXBTWz2vAkD7T4UyWrAVCxv/moZt594Gaw
 Hfz72CFJIPtLm76yuLFVj6bV0qAZn4PcQwm38GEDjFzSFNLBJs/n38RUONDUo9HVrldt uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q46dfk2gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 04:18:39 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33O4GHJc008027;
 Mon, 24 Apr 2023 04:18:38 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q46dfk2fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 04:18:38 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33NMhZcq032747;
 Mon, 24 Apr 2023 04:18:36 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3q47770qqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 04:18:36 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33O4IYMU38469920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Apr 2023 04:18:34 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5549A20043;
 Mon, 24 Apr 2023 04:18:34 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4F4E20040;
 Mon, 24 Apr 2023 04:18:32 +0000 (GMT)
Received: from melvil.aus.stglabs.ibm.com (unknown [9.40.193.168])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 24 Apr 2023 04:18:32 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: [PATCH v5] tests/avocado/tuxrun_baselines.py: improve code coverage
 for ppc64
Date: Sun, 23 Apr 2023 23:18:30 -0500
Message-Id: <20230424041830.1275636-1-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aCZoWmi9nB11XESeSqNnycDYgvJc8sad
X-Proofpoint-ORIG-GUID: 3aBrYU0OYS7-gZO_B6Yl1nVuFhtH5MOT
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_01,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240037
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=kconsul@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
boot_linux.py test-case due to which the code coverage for ppc
decreased by around 2%. As per the discussion on
https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
was mentioned that the baseline test for ppc64 could be modified
to make up this 2% code coverage. This patch attempts to achieve
this 2% code coverage by adding various device command line
arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
test-case.

The code coverage report with boot_linux.py, without it and finally
with these tuxrun_baselines.py changes is as follows:

With boot_linux.py
------------------
  lines......: 13.8% (58006 of 420997 lines)
  functions..: 20.7% (7675 of 36993 functions)
  branches...: 9.2% (22146 of 240611 branches)
Without boot_linux.py (without this patch changes)
--------------------------------------------------
  lines......: 11.9% (50174 of 420997 lines)
  functions..: 18.8% (6947 of 36993 functions)
  branches...: 7.4% (17580 of 239017 branches)
Without boot_linux.py (with this patch changes)
-----------------------------------------------
  lines......: 13.8% (58287 of 420997 lines)
  functions..: 20.7% (7640 of 36993 functions)
  branches...: 8.4% (20223 of 240611 branches)

Rebased on Alex Benee's testing/next branch:
https://gitlab.com/stsquad/qemu/-/tree/testing/next

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Reported-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/tuxrun_baselines.py | 70 ++++++++++++++++++++++++++++---
 1 file changed, 64 insertions(+), 6 deletions(-)

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index e8749717e9..3a46e7a745 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -11,6 +11,7 @@
 
 import os
 import time
+import tempfile
 
 from avocado import skip, skipIf
 from avocado_qemu import QemuSystemTest
@@ -72,6 +73,8 @@ def setUp(self):
         # Occasionally we need extra devices to hook things up
         self.extradev = self.get_tag('extradev')
 
+        self.qemu_img = super().get_qemu_img()
+
     def wait_for_console_pattern(self, success_message, vm=None):
         wait_for_console_pattern(self, success_message,
                                  failure_message='Kernel panic - not syncing',
@@ -179,6 +182,63 @@ def common_tuxrun(self,
         self.vm.launch()
         self.run_tuxtest_tests(haltmsg)
 
+    def ppc64_common_tuxrun(self, sums, prefix):
+        # add device args to command line.
+        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
+                         '-device', 'virtio-net,netdev=vnet')
+        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
+                         '-device', '{"driver":"virtio-net-pci","netdev":'
+                         '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'
+                         '"bus":"pci.0","addr":"0x9"}')
+        self.vm.add_args('-device', '{"driver":"qemu-xhci","p2":15,"p3":15,'
+                         '"id":"usb","bus":"pci.0","addr":"0x2"}')
+        self.vm.add_args('-device', '{"driver":"virtio-scsi-pci","id":"scsi0"'
+                         ',"bus":"pci.0","addr":"0x3"}')
+        self.vm.add_args('-device', '{"driver":"virtio-serial-pci","id":'
+                         '"virtio-serial0","bus":"pci.0","addr":"0x4"}')
+        self.vm.add_args('-device', '{"driver":"scsi-cd","bus":"scsi0.0"'
+                         ',"channel":0,"scsi-id":0,"lun":0,"device_id":'
+                         '"drive-scsi0-0-0-0","id":"scsi0-0-0-0"}')
+        self.vm.add_args('-device', '{"driver":"virtio-balloon-pci",'
+                         '"id":"balloon0","bus":"pci.0","addr":"0x6"}')
+        self.vm.add_args('-audiodev', '{"id":"audio1","driver":"none"}')
+        self.vm.add_args('-device', '{"driver":"usb-tablet","id":"input0"'
+                         ',"bus":"usb.0","port":"1"}')
+        self.vm.add_args('-device', '{"driver":"usb-kbd","id":"input1"'
+                         ',"bus":"usb.0","port":"2"}')
+        self.vm.add_args('-device', '{"driver":"VGA","id":"video0",'
+                         '"vgamem_mb":16,"bus":"pci.0","addr":"0x7"}')
+        self.vm.add_args('-object', '{"qom-type":"rng-random","id":"objrng0"'
+                         ',"filename":"/dev/urandom"}',
+                         '-device', '{"driver":"virtio-rng-pci","rng":"objrng0"'
+                         ',"id":"rng0","bus":"pci.0","addr":"0x8"}')
+        self.vm.add_args('-object', '{"qom-type":"cryptodev-backend-builtin",'
+                         '"id":"objcrypto0","queues":1}',
+                         '-device', '{"driver":"virtio-crypto-pci",'
+                         '"cryptodev":"objcrypto0","id":"crypto0","bus"'
+                         ':"pci.0","addr":"0xa"}')
+        self.vm.add_args('-device', '{"driver":"spapr-pci-host-bridge"'
+                         ',"index":1,"id":"pci.1"}')
+        self.vm.add_args('-device', '{"driver":"spapr-vscsi","id":"scsi1"'
+                         ',"reg":12288}')
+        self.vm.add_args('-m', '2G,slots=32,maxmem=4G',
+                         '-object', 'memory-backend-ram,id=ram1,size=1G',
+                         '-device', 'pc-dimm,id=dimm1,memdev=ram1')
+
+        # Create a temporary qcow2 and launch the test-case
+        with tempfile.NamedTemporaryFile(prefix=prefix,
+                                         suffix='.qcow2') as qcow2:
+            process.run(self.qemu_img + ' create -f qcow2 ' +
+                        qcow2.name + ' 1G')
+
+            self.vm.add_args('-drive', 'file=' + qcow2.name +
+                         ',format=qcow2,if=none,id='
+                         'drive-virtio-disk1',
+                         '-device', 'virtio-blk-pci,scsi=off,bus=pci.0,'
+                         'addr=0xb,drive=drive-virtio-disk1,id=virtio-disk1'
+                         ',bootindex=2')
+            self.common_tuxrun(csums=sums, drive="scsi-hd")
+
     #
     # The tests themselves. The configuration is derived from how
     # tuxrun invokes qemu (with minor tweaks like using -blockdev
@@ -379,7 +439,7 @@ def test_ppc64(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:pseries
-        :avocado: tags=cpu:POWER8
+        :avocado: tags=cpu:POWER10
         :avocado: tags=endian:big
         :avocado: tags=console:hvc0
         :avocado: tags=tuxboot:ppc64
@@ -391,14 +451,13 @@ def test_ppc64(self):
                  "1d953e81a4379e537fc8e41e05a0a59d9b453eef97aa03d47866c6c45b00bdff",
                  "vmlinux" :
                  "f22a9b9e924174a4c199f4c7e5d91a2339fcfe51c6eafd0907dc3e09b64ab728" }
-
-        self.common_tuxrun(csums=sums, drive="scsi-hd")
+        self.ppc64_common_tuxrun(sums, prefix='tuxrun_ppc64_')
 
     def test_ppc64le(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:pseries
-        :avocado: tags=cpu:POWER8
+        :avocado: tags=cpu:POWER10
         :avocado: tags=console:hvc0
         :avocado: tags=tuxboot:ppc64le
         :avocado: tags=image:vmlinux
@@ -409,8 +468,7 @@ def test_ppc64le(self):
                  "b442678c93fb8abe1f7d3bfa20556488de6b475c22c8fed363f42cf81a0a3906",
                  "vmlinux" :
                  "979eb61b445a010fb13e2b927126991f8ceef9c590fa2be0996c00e293e80cf2" }
-
-        self.common_tuxrun(csums=sums, drive="scsi-hd")
+        self.ppc64_common_tuxrun(sums, prefix='tuxrun_ppc64le_')
 
     def test_riscv32(self):
         """
-- 
2.25.1


