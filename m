Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9E0490BA4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:43:15 +0100 (CET)
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9UA6-0001rI-7c
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:43:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9TJ9-0005fN-7q; Mon, 17 Jan 2022 09:48:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9TIu-0008Pl-Nd; Mon, 17 Jan 2022 09:48:24 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20HESLJZ010559; 
 Mon, 17 Jan 2022 14:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=QPppwABvEm/jfmPDMMhioYqDlSUZJrnUvw5FprvsxOQ=;
 b=BDxbdVdqfhoVaeznnwlYfppV6eA2k44R/2D7YfDxMg73T3ziDhJIML9MRXxNc9GsPwwG
 9n9+/C0KynwePqc6g6aLpDSjNwxqGXANCKccfp0mKO6ZVCD5PuqjhrlD85krqkYl9Uk/
 Z/zR5koBjXm201KXmfH1ExUr7gyX7aLOe/qXUBVAwzJAPSa5y5DmMarPsgzRDQ47cB4X
 vMuANPC2pGyuIyGgKG94OdiuOO6x6PEnvCS7AVzyVKPRHnXiDaLwXGlmf6mjOUjxrKCe
 IemuAVpBbtk3eSGbAhicPtrrrPbTVIHxlVvg4RCbKbQNFM3yAL1LgSLZPjfXrmaI81u2 kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dna8fratb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 14:48:06 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20HESPaZ010771;
 Mon, 17 Jan 2022 14:48:06 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dna8frat1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 14:48:06 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20HEfk1t012854;
 Mon, 17 Jan 2022 14:48:05 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 3dknw9y6nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 14:48:05 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20HEm4hO32375218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 14:48:04 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7997C6059;
 Mon, 17 Jan 2022 14:48:03 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6A2CC605B;
 Mon, 17 Jan 2022 14:48:02 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.141.90])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jan 2022 14:48:02 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND] tests/avocado: ppc: Add smoke tests for MPC7400 and
 MPC7450 families
Date: Mon, 17 Jan 2022 11:47:57 -0300
Message-Id: <20220117144757.782441-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PYRhoFJJ0pVnxn2edBYuHpA4jPQhzR6D
X-Proofpoint-ORIG-GUID: uLkMSyQ-PQroNG1nktWsIfWbnbMccZpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170093
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These tests ensure that our emulation for these cpus is not completely
broken and we can at least run OpenBIOS on them.

$ make check-avocado AVOCADO_TESTS=../tests/avocado/ppc_74xx.py

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
---
 tests/avocado/ppc_74xx.py | 123 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 tests/avocado/ppc_74xx.py

diff --git a/tests/avocado/ppc_74xx.py b/tests/avocado/ppc_74xx.py
new file mode 100644
index 0000000000..556a9a7da9
--- /dev/null
+++ b/tests/avocado/ppc_74xx.py
@@ -0,0 +1,123 @@
+# Smoke tests for 74xx cpus (aka G4).
+#
+# Copyright (c) 2021, IBM Corp.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+
+class ppc74xxCpu(QemuSystemTest):
+    """
+    :avocado: tags=arch:ppc
+    """
+    timeout = 5
+
+    def test_ppc_7400(self):
+        """
+        :avocado: tags=cpu:7400
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7410(self):
+        """
+        :avocado: tags=cpu:7410
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,74xx')
+
+    def test_ppc_7441(self):
+        """
+        :avocado: tags=cpu:7441
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7445(self):
+        """
+        :avocado: tags=cpu:7445
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7447(self):
+        """
+        :avocado: tags=cpu:7447
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7447a(self):
+        """
+        :avocado: tags=cpu:7447a
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7448(self):
+        """
+        :avocado: tags=cpu:7448
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,MPC86xx')
+
+    def test_ppc_7450(self):
+        """
+        :avocado: tags=cpu:7450
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7451(self):
+        """
+        :avocado: tags=cpu:7451
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7455(self):
+        """
+        :avocado: tags=cpu:7455
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7457(self):
+        """
+        :avocado: tags=cpu:7457
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7457a(self):
+        """
+        :avocado: tags=cpu:7457a
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
-- 
2.33.1


