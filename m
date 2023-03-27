Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450C66CACCA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 20:13:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgrL4-0003D0-JF; Mon, 27 Mar 2023 14:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pgrL1-0003B2-EB
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 14:12:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pgrKy-000876-UB
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 14:12:58 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RHgFOg029741; Mon, 27 Mar 2023 18:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=q46HNZll4VtIAYOpP9+JyMtOF5MkpvqSE2eWGmjlxBg=;
 b=dniw8VPH4norjs7bCeYC0gvLvg+57O1dHsz0361ceR+70s5fsKAlnIrYSVDHaqsoo2jE
 hGf7zE1T5Lsp4Itca2riDRAjpUeXy5nZHMBJSnFQxCQ2Q0xIJ2Xt9Z/mL1697H0nC87x
 sHe2F3Z5if/83CfuHxi2+k+vT0eiuI05KQz04q1NjH0eWPygNhevj0ixA7e5QIPICMN2
 pFvPO8jUeUdLy1ZbFMrIhPU14UNdS/hhGC2VCFJ/UU+nN829jLQoLwmDgNTl1h4ENVL4
 dxWyn0J8OUBps3r4PanrTiYxg6fviXd/KTz34pRGtQ1RfG4kMLgOl7fYPwFMJsW8BQbh dg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkfs6gswa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 18:12:46 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RHN8cp020171;
 Mon, 27 Mar 2023 18:12:45 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3phrk6vh0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 18:12:45 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RICh7T30671490
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 18:12:43 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99C1158056;
 Mon, 27 Mar 2023 18:12:43 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B3BC5803F;
 Mon, 27 Mar 2023 18:12:43 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 27 Mar 2023 18:12:43 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id 38A852E5673; Mon, 27 Mar 2023 13:12:43 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
 stefanb@linux.ibm.com, clg@kaod.org
Subject: [PATCH v9 1/3] docs: Add support for TPM devices over I2C bus
Date: Mon, 27 Mar 2023 13:12:39 -0500
Message-Id: <20230327181241.4046253-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327181241.4046253-1-ninad@linux.ibm.com>
References: <20230327181241.4046253-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7S-FqC1Q-9NaeIiGIYGgwuipzy-FBUR1
X-Proofpoint-GUID: 7S-FqC1Q-9NaeIiGIYGgwuipzy-FBUR1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270148
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@us.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a documentation change for I2C TPM device support.

Qemu already supports devices attached to ISA and sysbus.
This drop adds support for the I2C bus attached TPM devices.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

---
V2:

Incorporated Stephen's review comments
- Added example in the document.

---
V4:
Incorporate Cedric & Stefan's comments

- Added example for ast2600-evb
- Corrected statement about arm virtual machine.

---
V6:
Incorporated review comments from Stefan.

---
V8:

Incorporate review comments from Joel and Stefan

- Removed the rainier example
- Added step required to configure on ast2600-evb
---
 docs/specs/tpm.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 535912a92b..efe124a148 100644
--- a/docs/specs/tpm.rst
+++ b/docs/specs/tpm.rst
@@ -21,12 +21,16 @@ QEMU files related to TPM TIS interface:
  - ``hw/tpm/tpm_tis_common.c``
  - ``hw/tpm/tpm_tis_isa.c``
  - ``hw/tpm/tpm_tis_sysbus.c``
+ - ``hw/tpm/tpm_tis_i2c.c``
  - ``hw/tpm/tpm_tis.h``
 
 Both an ISA device and a sysbus device are available. The former is
 used with pc/q35 machine while the latter can be instantiated in the
 Arm virt machine.
 
+An I2C device support is also provided which can be instantiated in the Arm
+based emulation machines. This device only supports the TPM 2 protocol.
+
 CRB interface
 -------------
 
@@ -348,6 +352,23 @@ In case an Arm virt machine is emulated, use the following command line:
     -drive if=pflash,format=raw,file=flash0.img,readonly=on \
     -drive if=pflash,format=raw,file=flash1.img
 
+In case a ast2600-evb bmc machine is emulated and you want to use a TPM device
+attached to I2C bus, use the following command line:
+
+.. code-block:: console
+
+  qemu-system-arm -M ast2600-evb -nographic \
+    -kernel arch/arm/boot/zImage \
+    -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
+    -initrd rootfs.cpio \
+    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
+    -tpmdev emulator,id=tpm0,chardev=chrtpm \
+    -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
+
+  For testing, use this command to load the driver to the correct address
+
+  echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device
+
 In case SeaBIOS is used as firmware, it should show the TPM menu item
 after entering the menu with 'ESC'.
 
-- 
2.37.2


