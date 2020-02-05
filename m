Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B548B15338B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 15:59:29 +0100 (CET)
Received: from localhost ([::1]:49132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izM9I-000299-0B
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 09:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46437)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liam.merwick@oracle.com>) id 1izM8H-0000qC-GU
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 09:58:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liam.merwick@oracle.com>) id 1izM8G-0003La-7H
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 09:58:25 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:54884)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liam.merwick@oracle.com>)
 id 1izM8F-0003GK-V1
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 09:58:24 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 015EwE6d169232;
 Wed, 5 Feb 2020 14:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2019-08-05;
 bh=yK1tWEoUeCtltJVvmq9/DmL/8je7tfJJ4WEQoiB05oM=;
 b=P39GtlsjfSwEdxwXh72KzoLHgsRDqfyz5H7VPFt2DFYXn90m3aCjzVGYMhxjpxmOo3uA
 bqATLm+TSIcMoSKtZUSVKRgbURSqXmxp4ZJuf8eb01E5izSqwU6Mq8V2K8m4SqCZOq05
 avdGsk9KlXl9UL3fqrbMwn0LH91LaTSb+v9sF2D4iWiCLIcjBGd3mRhbtTKmEUemlut0
 YyG68LfvjWhZt492RyUNx54/KpTxXsztwwGkSEA+OlGL/IaBM2CLQvirhPwEcJQwdL3C
 SL1jRjP0iBEGHsAg7YS1dmN9Ivfaa1BrN1fmKw8Ec4kaxHWawHNkgnOoAp+ZxBdRVN4z 1A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2xykbp3hqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Feb 2020 14:58:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 015ErR0P035657;
 Wed, 5 Feb 2020 14:56:18 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2xykbs1jdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Feb 2020 14:56:18 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 015EuIRL031803;
 Wed, 5 Feb 2020 14:56:18 GMT
Received: from ol7.uk.oracle.com (/10.175.206.136)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 05 Feb 2020 06:56:17 -0800
From: Liam Merwick <liam.merwick@oracle.com>
To: alex.bennee@linaro.org, fam@euphon.net, philmd@redhat.com
Subject: [PATCH v2 2/6] tests/boot_linux_console: add BIOS acceptance test
Date: Wed,  5 Feb 2020 14:56:01 +0000
Message-Id: <1580914565-19675-3-git-send-email-liam.merwick@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1580914565-19675-1-git-send-email-liam.merwick@oracle.com>
References: <1580914565-19675-1-git-send-email-liam.merwick@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9521
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=881
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002050118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9521
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=935 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002050119
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.78
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

Add a test to use qboot with the 'pc' machine class and SeaBIOS with
the 'microvm' machine class (since microvm uses qboot by default) by
adding the '-bios' option via self.vm.add_args() before
calling do_test_x86_64_machine().

Signed-off-by: Liam Merwick <liam.merwick@oracle.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 233601b429bd..e9375590bc1c 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -61,7 +61,6 @@ class BootLinuxConsole(Test):
                       '/vmlinuz')
         kernel_hash = '23bebd2680757891cf7adedb033532163a792495'
         kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
-
         self.vm.set_console()
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
         self.vm.add_args('-kernel', kernel_path,
@@ -77,6 +76,14 @@ class BootLinuxConsole(Test):
         """
         self.do_test_x86_64_machine()
 
+    def test_x86_64_pc_qboot(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=machine:pc
+        """
+        self.vm.add_args('-bios', 'pc-bios/bios-microvm.bin')
+        self.do_test_x86_64_machine()
+
     def test_x86_64_microvm(self):
         """
         :avocado: tags=arch:x86_64
@@ -84,6 +91,14 @@ class BootLinuxConsole(Test):
         """
         self.do_test_x86_64_machine()
 
+    def test_x86_64_microvm_seabios(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=machine:microvm
+        """
+        self.vm.add_args('-bios', 'pc-bios/bios.bin')
+        self.do_test_x86_64_machine()
+
     def test_mips_malta(self):
         """
         :avocado: tags=arch:mips
-- 
1.8.3.1


