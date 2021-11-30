Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86414641F0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 00:05:13 +0100 (CET)
Received: from localhost ([::1]:41814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msCBV-0004zL-11
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 18:05:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1msC8X-00012N-3j; Tue, 30 Nov 2021 18:02:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1msC8U-0000LM-Cm; Tue, 30 Nov 2021 18:02:08 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AUMmAcu013331; 
 Tue, 30 Nov 2021 23:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=dvIkuoJL1X4x3MsjypgJEe5b/KgqanenbyXzmn1n30A=;
 b=dogTDZWbQAT03b50GGD5tger9VjJx2aL3r6I0a0TSnZRGCeATZ4oHCBWcDL5Pn0OBpW2
 vuRBm6uOjb51biMem89XQbc4oONODTeg1tqxzJz5cIyjCz4ywrkzc5mNRnZ1VU0av9+W
 Zsa3pvcrXHAuiFTzvU5MDCqH5SZCFz/rThTQt0jOWvXegyppxFYkfZJBhVjbX1fh1zXk
 iTGv/f06mdfbCz521zBo7g9c3IZu0Q3VtYHusGDZA7ZbeIyn3mYkfd/jUNhnQig6MWyj
 VXCKDByT+LG2i15EjnAcl949RDgXYLP0MIEW2cEjV8kZ1Aqw+L7ZDDGPU4GcWRz8qFJT LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnw2fr87h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:47 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AUMpbMS030768;
 Tue, 30 Nov 2021 23:01:47 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnw2fr872-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:47 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AUMmx02022563;
 Tue, 30 Nov 2021 23:01:46 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 3ckcabfd63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:46 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AUN1iTZ42533282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 23:01:44 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7CABBE056;
 Tue, 30 Nov 2021 23:01:44 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16150BE05A;
 Tue, 30 Nov 2021 23:01:42 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.34.87])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Nov 2021 23:01:41 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 4/4] tests/avocado: ppc: Add smoke tests for MPC7400
 and MPC7450 families
Date: Tue, 30 Nov 2021 20:01:23 -0300
Message-Id: <20211130230123.781844-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130230123.781844-1-farosas@linux.ibm.com>
References: <20211130230123.781844-1-farosas@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G344a_qA6WaFQ9UztuNHJ-Je6YFQPbYK
X-Proofpoint-ORIG-GUID: xml3M0Fn6Mbm208hpFPSaCFpBPOQJnBJ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111300112
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, clg@kaod.org,
 openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These tests ensure that our emulation for these cpus is not completely
broken and we can at least run OpenBIOS on them.

$ make check-avocado AVOCADO_TESTS=../tests/avocado/ppc_74xx.py

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
Note that the 7450s depend on an OpenBIOS change adding support for
their PVR:

https://lists.nongnu.org/archive/html/qemu-ppc/2021-11/msg00290.html
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


