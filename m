Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13904457056
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:09:22 +0100 (CET)
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4Zt-0000UN-6c
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:09:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mo4LB-0001tl-9g; Fri, 19 Nov 2021 08:54:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mo4L8-0001X9-JW; Fri, 19 Nov 2021 08:54:09 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJDlTdR015728; 
 Fri, 19 Nov 2021 13:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=gO9X/VhkhH9fxDloiMCcfPELJiXQhMVxRGmltTxPbK4=;
 b=MwpVdZoJbB71Wh07r5WcXxD1jOHQqhsX8XZvfcoxa9ghZ/67Mk877SqICaOm8y0E1pMR
 xkJhlD6iEbijqNq8jti4LiYe4m6h+NZpZHm3020VHFU+e773CMtjKK1NQW9Ygr46Okiv
 fZf7mtLUsx21KY/VX6YK/KOnq2HQw9a8W7UtKBBd18JPgMZBTEmg/P6St911zVw2WvXq
 m2FpxRWG0oAgjdTZ52WSHytTzVvAZBdmCrz1JnxjY2ajIesHRolOLVCzbvcU6Ua1CJY1
 ahU8c4wVVMLeX4SUqtOOtqnFpADLYfo42f0zzzfXxp46L/yda8k/2QUXzIYSMKMwCLmX GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ced49r4m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:53:55 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AJDnGu6021005;
 Fri, 19 Nov 2021 13:53:54 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ced49r4kq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:53:54 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AJDn735002581;
 Fri, 19 Nov 2021 13:53:53 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3ca50eapdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:53:53 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AJDrqOM33161484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 13:53:52 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40E14BE05D;
 Fri, 19 Nov 2021 13:53:52 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 029C2BE054;
 Fri, 19 Nov 2021 13:53:49 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.29.60])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 19 Nov 2021 13:53:49 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/avocado: ppc: Add smoke tests for MPC7400 and MPC7450
 families
Date: Fri, 19 Nov 2021 10:53:48 -0300
Message-Id: <20211119135348.407679-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: h4QDKbVpQ3AiEDlgB3YaDopjAwBjF3dd
X-Proofpoint-GUID: P9lnnZ2YpjOqN9eaOwUIfhukTRX9X-39
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190075
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk, wainersm@redhat.com,
 willianr@redhat.com, qemu-ppc@nongnu.org, clg@kaod.org, crosa@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These tests ensure that our emulation for these cpus is not completely
broken and we can at least run OpenBIOS on them.

$ make check-avocado AVOCADO_TESTS=../tests/avocado/ppc_74xx.py

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

---
Note that the 7450s are currently broken, depending on the fix for
https://gitlab.com/qemu-project/qemu/-/issues/86 that is being
discussed in the thread:

https://lists.nongnu.org/archive/html/qemu-ppc/2021-11/msg00289.html
---
 tests/avocado/ppc_74xx.py | 134 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 tests/avocado/ppc_74xx.py

diff --git a/tests/avocado/ppc_74xx.py b/tests/avocado/ppc_74xx.py
new file mode 100644
index 0000000000..72b99d39c0
--- /dev/null
+++ b/tests/avocado/ppc_74xx.py
@@ -0,0 +1,134 @@
+# Smoke tests for 74xx cpus (aka G4).
+#
+# Copyright (c) 2021, IBM Corp.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado import skip
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+
+class ppc74xxCpu(QemuSystemTest):
+
+    timeout = 5
+
+    def test_ppc_7400(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=cpu:7400
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7410(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=cpu:7410
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,74xx')
+
+    def test_ppc_7441(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=cpu:7441
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7445(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=cpu:7445
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7447(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=cpu:7447
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7447a(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=cpu:7447a
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7448(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=cpu:7448
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,MPC86xx')
+
+    def test_ppc_7450(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=cpu:7450
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7451(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=cpu:7451
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7455(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=cpu:7455
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7457(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=cpu:7457
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7457a(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=cpu:7457a
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
-- 
2.29.2


