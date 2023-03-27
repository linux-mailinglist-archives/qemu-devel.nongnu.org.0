Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D9E6CA3FE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:25:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgltA-00082a-Tt; Mon, 27 Mar 2023 08:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1pglN7-0006Ds-FP
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 07:50:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1pglN5-000072-Pb
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 07:50:45 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RB1kZA029054; Mon, 27 Mar 2023 11:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ge5ONHvTtH2gWkWsQO5mZ6T4Q2mGq5pEPcCJBaAKkSE=;
 b=pBIbsn6oajq8O8rrIw7ccUf8Hx0zbQIexckrFp5yZCMSuxEz2Y6yY/RFQQFuijaX72JG
 wVw31pgdrhkuXqeWMlCSrl/3GHZtNCJrrPLlmXj2oE15w8kLohFavK1HnrZ3JRlYIemT
 DCT4SK1bk5a8JYx8TtUEYZkA6YfYJszFxCflzxByMgxOosibJbXcqqXzdXJEgRa1p5Ne
 ePRior5jHisb5W0JTR4Km+3dZ8Vih6+bsL+RVUudNEkGhQVdiHpWbf8JFlG8bWxpN7f+
 cEBZ6WuvtZ20dw5BbXOJ/9Tr3H9sqYV7gXnsT3ipZGiqW6Ao2FrKSZH79rs7UL+O9/Ya lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjatrea8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 11:50:42 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32RADl4H032578;
 Mon, 27 Mar 2023 11:50:41 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjatrea87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 11:50:41 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32R2IGqb024083;
 Mon, 27 Mar 2023 11:50:40 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3phr7ftckf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 11:50:39 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RBobRl44696016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 11:50:37 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 834732004B;
 Mon, 27 Mar 2023 11:50:37 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 018492004D;
 Mon, 27 Mar 2023 11:50:36 +0000 (GMT)
Received: from r223l.aus.stglabs.ibm.com (unknown [9.3.109.14])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 11:50:35 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-devel@nongnu.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/2] tests/avocado/boot_linux.py: re-enable test-case for ppc64
Date: Mon, 27 Mar 2023 07:50:30 -0400
Message-Id: <20230327115030.3418323-3-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327115030.3418323-1-kconsul@linux.vnet.ibm.com>
References: <20230327115030.3418323-1-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3L2gPx22qd7PEDK8qEga0nVambKczbuA
X-Proofpoint-GUID: I_kioqJvCT6FIdGS6XPUu-jdas80V7fw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270090
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=kconsul@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 27 Mar 2023 08:23:48 -0400
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

Fixes c0c8687ef0("tests/avocado: disable BootLinuxPPC64 test in CI").

Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the test-case
for PPC64. On investigation, this turns out to be an issue with the
time taken for downloading the Fedora 31 qcow2 image being included
within the test-case timeout.
Re-enable this test-case by setting the timeout to 360 seconds just
before launching the downloaded VM image.

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Reported-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Hariharan T S hariharan.ts@linux.vnet.ibm.com
---
 tests/avocado/boot_linux.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index be30dcbd58..c3869a987c 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -91,9 +91,9 @@ class BootLinuxPPC64(LinuxTest):
     :avocado: tags=arch:ppc64
     """
 
+    # timeout for downloading new VM image.
     timeout = 360
 
-    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_pseries_tcg(self):
         """
         :avocado: tags=machine:pseries
@@ -101,6 +101,10 @@ def test_pseries_tcg(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
+
+        # timeout for actual Linux PPC boot test
+        self.timeout = 360
+
         self.launch_and_wait(set_up_ssh_connection=False)
 
 
-- 
2.39.2


