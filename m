Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441CB6E58CE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 07:56:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poeIB-0007tq-0j; Tue, 18 Apr 2023 01:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1poeHs-0007ra-3g
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 01:53:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1poeHk-00026K-TR
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 01:53:55 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33I5flrt025910; Tue, 18 Apr 2023 05:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=qK1xvsaONMfA6cEXLD2KPCb8R8s8KCHVFWy0ssUDKxQ=;
 b=FEF9JBQ9Pym2lcWKKS1NOAbrx4agQ+HsMJc+oXVs3jcQdj0NfPbgXsmEvJLtWqmnzikO
 HldGqYW6E4zGSkS1xyyfu7qhwwRhqwQEHJp8nGYBGFlVUrde0nqOYpi00B1UyNCQlUmi
 ku6inBZwFqI9/qXS+NqJ6V/HqSLj3DKXSkiwiVBmV1m9DyUdTaSy6PGu53YiTEdHhi4b
 eeLbZKuGUM2xQNbXgQ8lInxleMN+v2N6FfBymUqVLxMpsmTL5gCS35WZIG0yNL+whhTJ
 XQeKcD4pR4NeZlaaNsANrrCP1EtTLaymISTlZN76Y+5Fyq6/grroUI2GzH61wSblzNKI +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q1n9j8893-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Apr 2023 05:53:43 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33I5rgdq024892;
 Tue, 18 Apr 2023 05:53:43 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q1n9j8883-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Apr 2023 05:53:42 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33I0iC36021962;
 Tue, 18 Apr 2023 05:53:40 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3pykj6hfde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Apr 2023 05:53:40 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33I5rc5U22085952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Apr 2023 05:53:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0574920043;
 Tue, 18 Apr 2023 05:53:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4C1B20040;
 Tue, 18 Apr 2023 05:53:36 +0000 (GMT)
Received: from melvil.aus.stglabs.ibm.com (unknown [9.40.193.168])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 18 Apr 2023 05:53:36 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: [PATCH] tests/avocado/tuxrun_baselines.py: improve code coverage for
 ppc64
Date: Tue, 18 Apr 2023 00:53:33 -0500
Message-Id: <20230418055333.126623-1-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oDEpChhsfxSTfz605OnfBA1vr-UZNDYa
X-Proofpoint-ORIG-GUID: iv5kfPgivuFxg4HB6Oy21oePupaZfksS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_02,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304180051
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=kconsul@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Reported-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/tuxrun_baselines.py | 98 ++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index d343376faa..cb17602c94 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -308,7 +308,7 @@ def test_ppc64(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:pseries
-        :avocado: tags=cpu:POWER8
+        :avocado: tags=cpu:POWER10
         :avocado: tags=endian:big
         :avocado: tags=console:hvc0
         :avocado: tags=tuxboot:ppc64
@@ -316,19 +316,113 @@ def test_ppc64(self):
         :avocado: tags=extradev:driver=spapr-vscsi
         :avocado: tags=root:sda
         """
+        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
+                         '-device', 'virtio-net,netdev=vnet')
+        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
+                         '-device', '{"driver":"virtio-net-pci","netdev":'
+                         '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'
+                         '"bus":"pci.0","addr":"0x9"}')
+        self.vm.add_args('-device', '{"driver":"qemu-xhci","p2":15,"p3":15,'
+                         '"id":"usb","bus":"pci.0","addr":"0x2"}')
+        self.vm.add_args('-device', '{"driver":"virtio-scsi-pci","id":"scsi0"''
+                         ,"bus":"pci.0","addr":"0x3"}')
+        self.vm.add_args('-device', '{"driver":"virtio-serial-pci","id":'
+                         '"virtio-serial0","bus":"pci.0","addr":"0x4"}')
+        self.vm.add_args('-device', '{"driver":"scsi-cd","bus":"scsi0.0"'
+                         ',"channel":0,"scsi-id":0,"lun":0,"device_id":''
+                         "drive-scsi0-0-0-0","id":"scsi0-0-0-0"}')
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
+        process.run('./qemu-img create -f qcow2'
+                    '/tmp/tuxrun_baselines_ppc64.qcow2 1G')
+        self.vm.add_args('-drive', 'file=/tmp/tuxrun_baselines_ppc64.qcow2'
+                         ',format=qcow2,if=none,id=drive-virtio-disk1',
+                         '-device', 'virtio-blk-pci,scsi=off,bus=pci.0,'
+                         'addr=0xb,drive=drive-virtio-disk1,id=virtio-disk1'
+                         ',bootindex=2')
         self.common_tuxrun(drive="scsi-hd")
 
     def test_ppc64le(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:pseries
-        :avocado: tags=cpu:POWER8
+        :avocado: tags=cpu:POWER10
         :avocado: tags=console:hvc0
         :avocado: tags=tuxboot:ppc64le
         :avocado: tags=image:vmlinux
         :avocado: tags=extradev:driver=spapr-vscsi
         :avocado: tags=root:sda
         """
+        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
+                         '-device', 'virtio-net,netdev=vnet')
+        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
+                         '-device', '{"driver":"virtio-net-pci","netdev":'
+                         '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'
+                         '"bus":"pci.0","addr":"0x9"}')
+        self.vm.add_args('-device', '{"driver":"qemu-xhci","p2":15,"p3":15,'
+                         '"id":"usb","bus":"pci.0","addr":"0x2"}')
+        self.vm.add_args('-device', '{"driver":"virtio-scsi-pci","id":"scsi0"''
+                         ,"bus":"pci.0","addr":"0x3"}')
+        self.vm.add_args('-device', '{"driver":"virtio-serial-pci","id":'
+                         '"virtio-serial0","bus":"pci.0","addr":"0x4"}')
+        self.vm.add_args('-device', '{"driver":"scsi-cd","bus":"scsi0.0"'
+                         ',"channel":0,"scsi-id":0,"lun":0,"device_id":''
+                         "drive-scsi0-0-0-0","id":"scsi0-0-0-0"}')
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
+        process.run('./qemu-img create -f qcow2'
+                    '/tmp/tuxrun_baselines_ppc64le.qcow2 1G')
+        self.vm.add_args('-drive', 'file=/tmp/tuxrun_baselines_ppc64le.qcow2'
+                         ',format=qcow2,if=none,id=drive-virtio-disk1',
+                         '-device', 'virtio-blk-pci,scsi=off,bus=pci.0,'
+                         'addr=0xb,drive=drive-virtio-disk1,id=virtio-disk1'
+                         ',bootindex=2')
         self.common_tuxrun(drive="scsi-hd")
 
     def test_riscv32(self):
-- 
2.25.1


