Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 125386CAA5B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 18:18:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgpXD-0006xb-EG; Mon, 27 Mar 2023 12:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pgpX0-0006fh-Ja
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:17:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pgpWO-0007Z5-Tc
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:16:39 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32REvNk5020764; Mon, 27 Mar 2023 16:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=q46HNZll4VtIAYOpP9+JyMtOF5MkpvqSE2eWGmjlxBg=;
 b=IGdqzb0AH/+abMyDd1J3/vgQlxiSTwhD728mEpEQVum4zYx2lzYZLRYvTR/lWDRr/XfP
 1F7U1JADAp/2Jf1RQLuBeUFYXAEv6ykGdEPHmFxH5/95wyOK5ZvgvcINo+AXUFr0+M6h
 qNqjpyl97On9ISD1fu6FcSQVl2pAu/J7BAFyjtidmxQBK+hWvUsB5AhC6m5sCfpF/Rug
 iOnYS08UT3S2jByLswkwrbXRA1YXqFiOdlnDHBJ06gAmzSg911PP5X5TeqdmQV35Jv8T
 r10VXWAgGxXn5WLBSE4iSrNShtlrk6usgpbqEc2NCgquQncA8mpmrkXCM9NDBdzTevv1 6w== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkdc4abpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 16:16:28 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RDbc5M002590;
 Mon, 27 Mar 2023 16:16:26 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3phrk742v1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 16:16:26 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RGGOmG34079354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 16:16:25 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6AC65805E;
 Mon, 27 Mar 2023 16:16:24 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFD285805B;
 Mon, 27 Mar 2023 16:16:24 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 27 Mar 2023 16:16:24 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id A38B62E5673; Mon, 27 Mar 2023 11:16:23 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
 stefanb@linux.ibm.com, clg@kaod.org
Subject: [PATCH v8 1/3] docs: Add support for TPM devices over I2C bus
Date: Mon, 27 Mar 2023 11:16:20 -0500
Message-Id: <20230327161622.3979396-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327161622.3979396-1-ninad@linux.ibm.com>
References: <20230327161622.3979396-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZmC-LzR4y0wktRALyUsLoQPiMALc-_-D
X-Proofpoint-ORIG-GUID: ZmC-LzR4y0wktRALyUsLoQPiMALc-_-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270129
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


