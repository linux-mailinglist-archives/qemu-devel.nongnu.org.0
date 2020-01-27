Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB6214A832
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 17:38:57 +0100 (CET)
Received: from localhost ([::1]:47690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw7Pc-0001fL-LT
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 11:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33801)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liam.merwick@oracle.com>) id 1iw7OV-0000QM-Cz
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 11:37:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liam.merwick@oracle.com>) id 1iw7OU-0001tu-7e
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 11:37:47 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:46796)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liam.merwick@oracle.com>)
 id 1iw7OT-0001pz-Va
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 11:37:46 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00RGITNd067167;
 Mon, 27 Jan 2020 16:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2019-08-05;
 bh=PjhiDSyO/HVWNPa7nnBzDILOpcKofQ/G35VK5ax9QgI=;
 b=jNvZJCwhe0w4yZB5JlwlDV+nuOJz/wZvJV/tLj96cyjQ+j5UQ+YYzGt0Sipib3Gi5WM8
 KIRvxVk6TkYjlbpy4kv27Yp2EXNcwFkHniCbAED5IChAB6rZuAR7V4LCp41TZgzju7/t
 5B5CmhC1bYFwdkHWVNsu976hhEXy+Aia0i7nTGOGmq7PLS4TmgA8a7MtmIh2/+rKJ38L
 Iax5x6j1kJgK9zI9Lvd3Z549UNsfsS/tqiquom0SbwMBnKlnBCRRqT6ITJiuCbd7HnvM
 fur2H+YBr0iPoZbzin/0BwqSMKjuGDOPkrwlsa0CpuCX5XidE6/tx13ONLiAlp0lqEEb KQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2xrd3u0jac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jan 2020 16:37:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00RGNUv3141852;
 Mon, 27 Jan 2020 16:37:36 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2xrytqcax9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jan 2020 16:37:35 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00RGbZmv024561;
 Mon, 27 Jan 2020 16:37:35 GMT
Received: from ol7.uk.oracle.com (/10.175.203.109)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 27 Jan 2020 08:37:34 -0800
From: Liam Merwick <liam.merwick@oracle.com>
To: alex.bennee@linaro.org, fam@euphon.net, philmd@redhat.com
Subject: [PATCH 2/6] tests/boot_linux_console: add BIOS acceptance test
Date: Mon, 27 Jan 2020 16:36:30 +0000
Message-Id: <1580142994-1836-3-git-send-email-liam.merwick@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1580142994-1836-1-git-send-email-liam.merwick@oracle.com>
References: <1580142994-1836-1-git-send-email-liam.merwick@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9513
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=716
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001270138
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9513
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=775 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001270138
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: slp@redhat.com, qemu-devel@nongnu.org, wainersm@redhat.com,
 pbonzini@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add tests to use qboot with the 'pc' and 'microvm' machine classes
by adding the '-bios' option via self.vm.add_args() before calling
do_test_x86_64_machine().

Signed-off-by: Liam Merwick <liam.merwick@oracle.com>
---
 tests/acceptance/boot_linux_console.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index aa5b07b1c609..8daf6461ffac 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -60,7 +60,6 @@ class BootLinuxConsole(Test):
                       '/vmlinuz')
         kernel_hash = '23bebd2680757891cf7adedb033532163a792495'
         kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
-
         self.vm.set_console()
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
         self.vm.add_args('-kernel', kernel_path,
@@ -75,12 +74,26 @@ class BootLinuxConsole(Test):
         """
         self.do_test_x86_64_machine()
 
+    def test_x86_64_pc_qboot(self):
+        """
+        :avocado: tags=machine:pc
+        """
+        self.vm.add_args('-bios', 'pc-bios/bios-microvm.bin')
+        self.do_test_x86_64_machine()
+
     def test_x86_64_microvm(self):
         """
         :avocado: tags=machine:microvm
         """
         self.do_test_x86_64_machine()
 
+    def test_x86_64_microvm_qboot(self):
+        """
+        :avocado: tags=machine:microvm
+        """
+        self.vm.add_args('-bios', 'pc-bios/bios-microvm.bin')
+        self.do_test_x86_64_machine()
+
     def test_mips_malta(self):
         """
         :avocado: tags=arch:mips
-- 
1.8.3.1


