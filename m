Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3742A6C5CFD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 04:02:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfBD5-0005sR-Pa; Wed, 22 Mar 2023 23:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pfBD3-0005s9-OI
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 23:01:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pfBD2-0004zf-6t
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 23:01:49 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32N2C7Yw009737; Thu, 23 Mar 2023 03:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=m3R59gQAgSC0BqgZtlLnoqJehuLU+mp5tBgcXKZtWSE=;
 b=Cag8iNYhe+YcxJ/POwIFpLrfyFmcwhmk6Mv8uWH2I6V4BgV21bPVM8AVwSpNPIxk+QGI
 5bHvX5ylTRTeDSZVVps4nROxcS6yri5cEw3VW6dZkf1lR2AbJwegXXD4NCC6DTOEegFP
 y8Huj74d2Db9SEv6XvJ4U6e+kck0NJMUaUZdEiLTqrLWQPOPHKCYEck/mjapVW7bqKwy
 RyYwDD+lfIpuEgZl+YAoB/SNCbh3p/Ui4VfKYygvY20ZUKdlOxoDlBkGqfGFqcNJ2WdE
 x3uyOhbYWWRxY/B1CuNTvpM4DpNqvz+6fRCMjfxs4jld+x2OrII8mjy5I+zVvKSDtdm8 7w== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgds60tvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 03:01:40 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32N11PcT001376;
 Thu, 23 Mar 2023 03:01:24 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x73n1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 03:01:24 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32N31MEK31982100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Mar 2023 03:01:22 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A65658064;
 Thu, 23 Mar 2023 03:01:22 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B82158056;
 Thu, 23 Mar 2023 03:01:22 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Mar 2023 03:01:22 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id 12BC22E5673; Wed, 22 Mar 2023 22:01:22 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
 stefanb@linux.ibm.com, clg@kaod.org
Subject: [PATCH 1/3] docs: Add support for TPM devices over I2C bus
Date: Wed, 22 Mar 2023 22:01:17 -0500
Message-Id: <20230323030119.2113570-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230323030119.2113570-1-ninad@linux.ibm.com>
References: <20230323030119.2113570-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -0O1oYDeh2AS2Uv-acw6EH-aNfp89v1O
X-Proofpoint-GUID: -0O1oYDeh2AS2Uv-acw6EH-aNfp89v1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230022
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
 docs/specs/tpm.rst | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 535912a92b..bf7249b09c 100644
--- a/docs/specs/tpm.rst
+++ b/docs/specs/tpm.rst
@@ -21,11 +21,15 @@ QEMU files related to TPM TIS interface:
  - ``hw/tpm/tpm_tis_common.c``
  - ``hw/tpm/tpm_tis_isa.c``
  - ``hw/tpm/tpm_tis_sysbus.c``
+ - ``hw/tpm/tpm_tis_i2c.c``
  - ``hw/tpm/tpm_tis.h``
 
 Both an ISA device and a sysbus device are available. The former is
 used with pc/q35 machine while the latter can be instantiated in the
-Arm virt machine.
+Arm virt machine. An I2C device support is also added which can be
+instantiated in the arm based emulation machine. An I2C device is also
+supported for the Arm virt machine. This device only supports the
+TPM 2 protocol.
 
 CRB interface
 -------------
@@ -348,6 +352,20 @@ In case an Arm virt machine is emulated, use the following command line:
     -drive if=pflash,format=raw,file=flash0.img,readonly=on \
     -drive if=pflash,format=raw,file=flash1.img
 
+In case a Rainier bmc machine is emulated, use the following command line:
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


