Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B436EA2A8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 06:24:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppiJJ-0007Fd-2q; Fri, 21 Apr 2023 00:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppiJB-0007Ei-3u
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 00:23:45 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppiJ8-0007eC-Fh
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 00:23:40 -0400
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33L4JHow030731; Fri, 21 Apr 2023 04:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KJMqn+5yO3LTptPCK2oI9MzWS5haxj9WxfinY5oruUM=;
 b=ZRmyrTV8w40lo3FBq7zyWC/sdllyi/0BsBEi/L96Go/N+kN7UzVxYG+DIVKPEuhDZbK6
 y6bm3XTMpGm6WrQ81Sr4UNC3+3CAc01wwI72DMAfjCLw3ovunLZWI4AHWp7a45/RtpUG
 iJLz1kcqipcRFmMVjlQrKTHL5MZNScnkMyWSLvsELbO+9VFZOxtw1CVQ3aLiUBnkopEk
 ITpJAqWiWssNr6uVJlWzXrv5481l42LBTpSLQAWCjn4zcX73wrlUSDsx+yGg8bEN96+5
 N+WQ3IcsJx5SplRl2ipNWIIwcvkdArelwFbdPVi9Owu/xQVynM7XLzJaz0nyxijW2z96 Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3kbvg22e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 04:23:34 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33L4K9ov032197;
 Fri, 21 Apr 2023 04:23:33 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3kbvg21c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 04:23:33 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33KLakKU002549;
 Fri, 21 Apr 2023 04:23:30 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pyk6fkswt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 04:23:30 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33L4NSoP25494182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Apr 2023 04:23:28 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E269120049;
 Fri, 21 Apr 2023 04:23:27 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8932520040;
 Fri, 21 Apr 2023 04:23:26 +0000 (GMT)
Received: from melvil.aus.stglabs.ibm.com (unknown [9.40.193.168])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 21 Apr 2023 04:23:26 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: [PATCH v4 1/2] avocado_qemu/__init__.py: factor out the qemu-img
 finding
Date: Thu, 20 Apr 2023 23:23:21 -0500
Message-Id: <20230421042322.684093-2-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230421042322.684093-1-kconsul@linux.vnet.ibm.com>
References: <20230421042322.684093-1-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ctWAo-QES3eYoSwJrCidEnP1eCFldYjV
X-Proofpoint-ORIG-GUID: SaDNBxkT9viRrvPX9-QnZj-y67x27Whe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_17,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210033
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


