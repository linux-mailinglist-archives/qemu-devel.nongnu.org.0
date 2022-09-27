Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597555EC584
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:08:23 +0200 (CEST)
Received: from localhost ([::1]:55640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBG2-0004em-7r
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1od9b5-0002rB-SX; Tue, 27 Sep 2022 08:22:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1od9b3-0002qG-Ji; Tue, 27 Sep 2022 08:21:59 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28RC8A9K004238;
 Tue, 27 Sep 2022 12:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=X9fXrNP8JYdOTmev9gzmwGIQYelbWW5QA0k1Fiwk3/8=;
 b=jgguaxwqjet8fadxsKqnYP56yxPLfxYSrcMoNnvhf/yoZtWwcZX0l7Yp3XfR5CJzyUke
 nBVL0AcaqefKBbJdNFpCIg0LcuzGGl9T0+emrdPy1fY5rmnG+09jzYFTGRM52F6wEWhA
 OpjrLw47JtG/qjJdIGS8wY3nF9HxSnyozU9Gawlaj0zxSlnO+G8QmgDrR2piA0kxTTVL
 bfGZPwmWnt3yjvy/VYA9Od89q+jFQDqKdUaihzamaRqBzaE3DiWuCUxZkEXPCkSBS9uW
 irz0/FfI0rSd3yKKFM/HcPF6tah80lF9RIfbRzLuVZv11/IF2fuwWNQXTS/ZRqqXdBDX dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jv0pr0n46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 12:21:54 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28RC8QOa005955;
 Tue, 27 Sep 2022 12:21:54 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jv0pr0n3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 12:21:54 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28RCKTwb023522;
 Tue, 27 Sep 2022 12:21:53 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 3jssh9cd87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 12:21:53 +0000
Received: from smtpav05.wdc07v.mail.ibm.com ([9.208.128.117])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28RCLqO912649054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Sep 2022 12:21:52 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05A4D58065;
 Tue, 27 Sep 2022 12:21:52 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74F5358059;
 Tue, 27 Sep 2022 12:21:51 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 27 Sep 2022 12:21:51 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH] docs: Update TPM documentation for usage of a TPM 2
Date: Tue, 27 Sep 2022 08:21:46 -0400
Message-Id: <20220927122146.2787854-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fNYIOyNnQYH07vacKqO5ybbiVzWGmcpv
X-Proofpoint-GUID: WB5zd5Hh3U4Xi1l6_XsRudAMe79tueT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_03,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209270073
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the TPM documentation for usage of a TPM 2 rather than a TPM 1.2.
Adjust the command lines and expected outputs inside the VM accordingly.
Update the command line to start a TPM 2 with swtpm.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 docs/specs/tpm.rst | 44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 3be190343a..535912a92b 100644
--- a/docs/specs/tpm.rst
+++ b/docs/specs/tpm.rst
@@ -250,24 +250,25 @@ hardware TPM ``/dev/tpm0``:
 
 The following commands should result in similar output inside the VM
 with a Linux kernel that either has the TPM TIS driver built-in or
-available as a module:
+available as a module (assuming a TPM 2 is passed through):
 
 .. code-block:: console
 
   # dmesg | grep -i tpm
-  [    0.711310] tpm_tis 00:06: 1.2 TPM (device=id 0x1, rev-id 1)
-
-  # dmesg | grep TCPA
-  [    0.000000] ACPI: TCPA 0x0000000003FFD191C 000032 (v02 BOCHS  \
-      BXPCTCPA 0000001 BXPC 00000001)
+  [    0.012560] ACPI: TPM2 0x000000000BFFD1900 00004C (v04 BOCHS  \
+      BXPC     0000001 BXPC 00000001)
 
   # ls -l /dev/tpm*
-  crw-------. 1 root root 10, 224 Jul 11 10:11 /dev/tpm0
+  crw-rw----. 1 tss root  10,   224 Sep  6 12:36 /dev/tpm0
+  crw-rw----. 1 tss rss  253, 65536 Sep  6 12:36 /dev/tpmrm0
 
-  # find /sys/devices/ | grep pcrs$ | xargs cat
-  PCR-00: 35 4E 3B CE 23 9F 38 59 ...
+  Starting with Linux 5.12 there are PCR entries for TPM 2 in sysfs:
+  # find /sys/devices/ -type f | grep pcr-sha
+  ...
+  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/1
+  ...
+  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/9
   ...
-  PCR-23: 00 00 00 00 00 00 00 00 ...
 
 The QEMU TPM emulator device
 ----------------------------
@@ -304,6 +305,7 @@ a socket interface. They do not need to be run as root.
   mkdir /tmp/mytpm1
   swtpm socket --tpmstate dir=/tmp/mytpm1 \
     --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock \
+    --tpm2 \
     --log level=20
 
 Command line to start QEMU with the TPM emulator device communicating
@@ -365,19 +367,20 @@ available as a module:
 .. code-block:: console
 
   # dmesg | grep -i tpm
-  [    0.711310] tpm_tis 00:06: 1.2 TPM (device=id 0x1, rev-id 1)
-
-  # dmesg | grep TCPA
-  [    0.000000] ACPI: TCPA 0x0000000003FFD191C 000032 (v02 BOCHS  \
-      BXPCTCPA 0000001 BXPC 00000001)
+  [    0.012560] ACPI: TPM2 0x000000000BFFD1900 00004C (v04 BOCHS  \
+      BXPC     0000001 BXPC 00000001)
 
   # ls -l /dev/tpm*
-  crw-------. 1 root root 10, 224 Jul 11 10:11 /dev/tpm0
+  crw-rw----. 1 tss root  10,   224 Sep  6 12:36 /dev/tpm0
+  crw-rw----. 1 tss rss  253, 65536 Sep  6 12:36 /dev/tpmrm0
 
-  # find /sys/devices/ | grep pcrs$ | xargs cat
-  PCR-00: 35 4E 3B CE 23 9F 38 59 ...
+  Starting with Linux 5.12 there are PCR entries for TPM 2 in sysfs:
+  # find /sys/devices/ -type f | grep pcr-sha
+  ...
+  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/1
+  ...
+  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/9
   ...
-  PCR-23: 00 00 00 00 00 00 00 00 ...
 
 Migration with the TPM emulator
 ===============================
@@ -398,7 +401,8 @@ In a 1st terminal start an instance of a swtpm using the following command:
   mkdir /tmp/mytpm1
   swtpm socket --tpmstate dir=/tmp/mytpm1 \
     --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock \
-    --log level=20 --tpm2
+    --tpm2 \
+    --log level=20
 
 In a 2nd terminal start the VM:
 
-- 
2.37.2


