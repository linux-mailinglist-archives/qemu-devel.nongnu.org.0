Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6FA6E9519
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:54:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTmU-00044v-6e; Thu, 20 Apr 2023 08:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppTmF-00043f-UE
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:52:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppTm9-0002qx-3e
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:52:43 -0400
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KCR8al026539; Thu, 20 Apr 2023 12:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KJMqn+5yO3LTptPCK2oI9MzWS5haxj9WxfinY5oruUM=;
 b=RA1bdHKB+ZXqHnUSSP1Eu3RgaymQsr/8Obvqhz5ekO+kwN+yP15YMA5dp4nJS32BKw2p
 Ds2XbnIrtxtRcb/k13lpsEGA9o4gUnzj3JEtB56Ryxu6H0oIYiX+8xbW776r9iOJETtv
 ACkAiF7Hl+Y+RrFS5GJRB9XjmE9cm8b45FsarOi1zL4D3k8CvrZ0Eb0/bYb4oI63fpDe
 Nq4+fy+0+E2Aeg2ieZysiKxZ9f50+k+vT/0c4zafHXj+922ItSOhRxmt4nfGVc+WWW2Z
 DOWkVLl9+oREQUJKwwZOhZEtMK8s1v/+K0k3eHWxLjQoyktUmPrcqCYy6af1V71IshpB Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3527289h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:52:29 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33KC2mwn017447;
 Thu, 20 Apr 2023 12:52:29 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3527287p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:52:29 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33K3nOUt014753;
 Thu, 20 Apr 2023 12:52:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pykj6bdap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:52:26 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33KCqOl323134540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Apr 2023 12:52:24 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 142D420043;
 Thu, 20 Apr 2023 12:52:24 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B459020040;
 Thu, 20 Apr 2023 12:52:22 +0000 (GMT)
Received: from melvil.aus.stglabs.ibm.com (unknown [9.40.193.168])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 20 Apr 2023 12:52:22 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: [PATCH v3 1/2] avocado_qemu/__init__.py: factor out the qemu-img
 finding
Date: Thu, 20 Apr 2023 07:52:16 -0500
Message-Id: <20230420125217.620928-2-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230420125217.620928-1-kconsul@linux.vnet.ibm.com>
References: <20230420125217.620928-1-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pldxbiOGw9EKxhNL27pYkR2KF328xs0l
X-Proofpoint-ORIG-GUID: 5sj05gZfmqCduVplde5PpKOPVNCjbRdd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_08,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 clxscore=1011 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200102
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

Factor out the code that finds the qemu-img binary in the
QemuSystemTest class and create a new get_qemu_img() function
with it. This function will get called also from the new code
in tuxrun_baselines.py avocado test-case.

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
---
 tests/avocado/avocado_qemu/__init__.py | 27 +++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index cb71f50db9..d8f390e27a 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -330,6 +330,19 @@ def _new_vm(self, name, *args):
             vm.add_args(*args)
         return vm
 
+    def get_qemu_img(self):
+        self.log.debug('Looking for and selecting a qemu-img binary')
+
+        # If qemu-img has been built, use it, otherwise the system wide one
+        # will be used.
+        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
+        if not os.path.exists(qemu_img):
+            qemu_img = find_command('qemu-img', False)
+        if qemu_img is False:
+            self.cancel('Could not find "qemu-img"')
+
+        return qemu_img
+
     @property
     def vm(self):
         return self.get_vm(name='default')
@@ -594,17 +607,9 @@ def set_up_existing_ssh_keys(self):
         return (ssh_public_key, ssh_private_key)
 
     def download_boot(self):
-        self.log.debug('Looking for and selecting a qemu-img binary to be '
-                       'used to create the bootable snapshot image')
-        # If qemu-img has been built, use it, otherwise the system wide one
-        # will be used.  If none is available, the test will cancel.
-        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
-        if not os.path.exists(qemu_img):
-            qemu_img = find_command('qemu-img', False)
-        if qemu_img is False:
-            self.cancel('Could not find "qemu-img", which is required to '
-                        'create the bootable image')
-        vmimage.QEMU_IMG = qemu_img
+        # Set the qemu-img binary.
+        # If none is available, the test will cancel.
+        vmimage.QEMU_IMG = super().get_qemu_img()
 
         self.log.info('Downloading/preparing boot image')
         # Fedora 31 only provides ppc64le images
-- 
2.25.1


