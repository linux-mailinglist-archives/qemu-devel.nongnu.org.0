Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CDC6E949D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:38:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTUn-0008By-1k; Thu, 20 Apr 2023 08:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ppTTV-0007m5-PP
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:33:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ppTTS-00046I-1L
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:33:21 -0400
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KC2c4T016291; Thu, 20 Apr 2023 12:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=SKlsO9CJT2inhV6bHuaNIKh8hvHSzrJGQbvFMZ0tDgw=;
 b=dg2lFjSR1GmTVMZ1sGsdm8h+G456dsJqn4rDxXDbyztEFkLLibvWvMZxXgU2ZwHfo7Af
 5yxRyCWGWNCpw4LNxdK3rxqG2Nl8Gn0zkZDJ2xApzLAaOfusOTyuCH3Illki2v16uUio
 1M0h9bE71UKskYRySnvnaCfOw6BCdqxweoTVo9y+STQPRIg4idTNzIFDFCE3NZ6yxtKH
 kGGL9fJcCeziq/eYOsSdGSyGosLnkSLwDXq5YIh/VBh5xUQlm2aXCXKON4AIVgtKsIjX
 Zd9qnWpkh/Bgmtdqs5OYPZhw8LUd5PG3wcbxudZ8aH8GkPNGMEfsMRdTMzPAt1nSgrAN Mg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q35271apg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:33:05 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33K9dNmx014076;
 Thu, 20 Apr 2023 12:33:04 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3pykj7k66s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:33:04 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33KCX2BE15991214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Apr 2023 12:33:02 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78E5C5805C;
 Thu, 20 Apr 2023 12:33:02 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C646658058;
 Thu, 20 Apr 2023 12:33:01 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 20 Apr 2023 12:33:01 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Joel Stanley <joel@jms.id.au>,
 Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ninad Palsule <ninad@linux.ibm.com>
Subject: [PULL 4/7] tests/avocado/aspeed: Add TPM TIS I2C test
Date: Thu, 20 Apr 2023 08:32:44 -0400
Message-Id: <20230420123247.226312-5-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230420123247.226312-1-stefanb@linux.ibm.com>
References: <20230420123247.226312-1-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uIPjfH2rmYAPAe3-YBZo1qRRR0248KaI
X-Proofpoint-ORIG-GUID: uIPjfH2rmYAPAe3-YBZo1qRRR0248KaI
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_08,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 mlxlogscore=908 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200102
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Joel Stanley <joel@jms.id.au>

Add a new buildroot image based test that attaches a TPM emulator to the
I2C bus and checks for a known PCR0 value for the image that was booted.

Note that this does not tear down swtpm process when qemu execution fails.
The swtpm process will exit when qemu exits if a connection has been
made, but if the test errors before connection then the swtpm process
will still be around.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>
Message-id: 20230328120844.190914-1-joel@jms.id.au
---
 tests/avocado/machine_aspeed.py | 42 +++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index d2c57ccb7e..2b532c4834 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -7,14 +7,18 @@
 
 import time
 import os
+import tempfile
+import subprocess
 
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import exec_command
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import interrupt_interactive_console_until_pattern
+from avocado_qemu import has_cmd
 from avocado.utils import archive
 from avocado import skipIf
+from avocado import skipUnless
 
 
 class AST1030Machine(QemuSystemTest):
@@ -132,7 +136,7 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
 
         self.do_test_arm_aspeed(image_path)
 
-    def do_test_arm_aspeed_buildroot_start(self, image, cpu_id):
+    def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'):
         self.require_netdev('user')
 
         self.vm.set_console()
@@ -146,7 +150,7 @@ def do_test_arm_aspeed_buildroot_start(self, image, cpu_id):
         self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
         self.wait_for_console_pattern('lease of 10.0.2.15')
         # the line before login:
-        self.wait_for_console_pattern('Aspeed EVB')
+        self.wait_for_console_pattern(pattern)
         time.sleep(0.1)
         exec_command(self, 'root')
         time.sleep(0.1)
@@ -229,6 +233,40 @@ def test_arm_ast2600_evb_buildroot(self):
              '0000000 ffaa ffff ffff ffff ffff ffff ffff ffff');
         self.do_test_arm_aspeed_buildroot_poweroff()
 
+    @skipUnless(*has_cmd('swtpm'))
+    def test_arm_ast2600_evb_buildroot_tpm(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast2600-evb
+        """
+
+        image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
+                     'images/ast2600-evb/buildroot-2023.02-tpm/flash.img')
+        image_hash = ('a46009ae8a5403a0826d607215e731a8c68d27c14c41e55331706b8f9c7bd997')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        socket = os.path.join(self.vm.sock_dir, 'swtpm-socket')
+
+        subprocess.run(['swtpm', 'socket', '-d', '--tpm2',
+                        '--tpmstate', f'dir={self.vm.temp_dir}',
+                        '--ctrl', f'type=unixio,path={socket}'])
+
+        self.vm.add_args('-chardev', f'socket,id=chrtpm,path={socket}')
+        self.vm.add_args('-tpmdev', 'emulator,id=tpm0,chardev=chrtpm')
+        self.vm.add_args('-device',
+                         'tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e')
+        self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00', 'Aspeed AST2600 EVB')
+        exec_command(self, "passw0rd")
+
+        exec_command_and_wait_for_pattern(self,
+            'echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device',
+            'tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)');
+        exec_command_and_wait_for_pattern(self,
+            'cat /sys/class/tpm/tpm0/pcr-sha256/0',
+            'B804724EA13F52A9072BA87FE8FDCC497DFC9DF9AA15B9088694639C431688E0');
+
+        self.do_test_arm_aspeed_buildroot_poweroff()
 
 class AST2x00MachineSDK(QemuSystemTest):
 
-- 
2.39.1


