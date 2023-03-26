Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B706C91FD
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 03:07:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgEqF-0006di-EW; Sat, 25 Mar 2023 21:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pgEqC-0006d5-J4
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 21:06:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pgEqA-0003Wr-Jj
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 21:06:36 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32PNZ8Ha000674; Sun, 26 Mar 2023 01:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cZdl4PNcEcbD07Ku2rzhvLHk7DPOh7QimYyUjub1gWg=;
 b=f6Xxq3EgSOTLIpLUIX7OSHnRxkdJDC8AN/UYQDNH6/bBeX4IaNZ7Uiw6AZIt1JxHwt8d
 VbEiaPSY2wTEniqDth+XjDu/EufTedDg50nZPC13Ipxk0mJxgYP1OioiPVl4ba2R6TOM
 DSfCrZyr+2HMhp21cNg84RSCryogc/hzAKfGm+P893O/riOZSUd3+d7qaPniIh6lAC7E
 1s29oyZozVadcvOhZfXr7CfH4HbBTKtcXdDGXXWtkPwiDgbA5WmGNYz5EeINFnNGaypL
 YrLQxXAJP+hWGGLRDkc9+0gI7Rg8ZLyHuIbP+HJ9ZX1rnCv4veMU1aIELXgMH0KPR9QG jA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjart9401-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Mar 2023 01:06:18 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32PL1g2O005815;
 Sun, 26 Mar 2023 01:06:17 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3phrk6m8mv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Mar 2023 01:06:17 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32Q16FMe29819424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Mar 2023 01:06:15 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 750F55805C;
 Sun, 26 Mar 2023 01:06:15 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FC9E58058;
 Sun, 26 Mar 2023 01:06:15 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Sun, 26 Mar 2023 01:06:15 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id C37242E5673; Sat, 25 Mar 2023 20:06:14 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
 stefanb@linux.ibm.com, clg@kaod.org
Subject: [PATCH v5 1/3] docs: Add support for TPM devices over I2C bus
Date: Sat, 25 Mar 2023 20:06:11 -0500
Message-Id: <20230326010613.3810320-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230326010613.3810320-1-ninad@linux.ibm.com>
References: <20230326010613.3810320-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kSGeYuETEQy320-NGZvjPyR8XPOTd19e
X-Proofpoint-GUID: kSGeYuETEQy320-NGZvjPyR8XPOTd19e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303260006
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
 docs/specs/tpm.rst | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 535912a92b..a0600e2834 100644
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
 
+An I2C device support is also added which can be instantiated in the arm
+based emulation machines. This device only supports the TPM 2 protocol.
+
 CRB interface
 -------------
 
@@ -348,6 +352,34 @@ In case an Arm virt machine is emulated, use the following command line:
     -drive if=pflash,format=raw,file=flash0.img,readonly=on \
     -drive if=pflash,format=raw,file=flash1.img
 
+In case a ast2600-evb bmc machine is emulated and want to use TPM device
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
+In case a Rainier bmc machine is emulated and want to use TPM device
+attached to I2C bus, use the following command line:
+
+.. code-block:: console
+
+  qemu-system-arm -M rainier-bmc -nographic \
+    -kernel ${IMAGEPATH}/fitImage-linux.bin \
+    -dtb ${IMAGEPATH}/aspeed-bmc-ibm-rainier.dtb \
+    -initrd ${IMAGEPATH}/obmc-phosphor-initramfs.rootfs.cpio.xz \
+    -drive file=${IMAGEPATH}/obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2\
+    -net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443\
+    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
+    -tpmdev emulator,id=tpm0,chardev=chrtpm \
+    -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
+
 In case SeaBIOS is used as firmware, it should show the TPM menu item
 after entering the menu with 'ESC'.
 
-- 
2.37.2


